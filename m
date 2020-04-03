Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8CF19D9B7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:05:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNsX-0008US-QZ; Fri, 03 Apr 2020 15:05:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKNsX-0008UN-2f
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:05:05 +0000
X-Inumbo-ID: 7ee9b08c-75bc-11ea-bd33-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ee9b08c-75bc-11ea-bd33-12813bfff9fa;
 Fri, 03 Apr 2020 15:05:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57A51AC62;
 Fri,  3 Apr 2020 15:05:02 +0000 (UTC)
Subject: Re: [PATCH] hvmloader: probe memory below 4G before allocation for
 OVMF
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
 <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
 <0faaee38-e314-24a8-b97d-9f000251a63e@citrix.com>
 <9cba6eda-2c7c-9700-a484-c72100b8268f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <050e4847-df42-6e16-3707-19fadbae9229@suse.com>
Date: Fri, 3 Apr 2020 17:05:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9cba6eda-2c7c-9700-a484-c72100b8268f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wl@xen.org,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.2020 16:47, Igor Druzhinin wrote:
> On 03/04/2020 15:39, Andrew Cooper wrote:
>> On 03/04/2020 14:53, Jan Beulich wrote:
>>> On 02.04.2020 18:18, Igor Druzhinin wrote:
>>>> The area just below 4G where OVMF image is originally relocated is not
>>>> necessarily a hole - it might contain pages preallocated by device model
>>>> or the toolstack. By unconditionally populating on top of this memory
>>>> the original pages are getting lost while still potentially foreign mapped
>>>> in Dom0.
>>> When there are pre-allocated pages - have they been orphaned? If
>>> so, shouldn't whoever populated them unpopulate rather than
>>> orphaning them? Or if not - how is the re-use you do safe?
>>
>> So this is a mess.
>>
>> OVMF is linked to run at a fixed address suitable for native hardware,
>> which is in the SPI ROM immediately below the 4G boundary (this is
>> correct).  We also put the framebuffer there (this is not correct).
>>
>> This was fine for RomBIOS which is located under the 1M boundary.
>>
>> It is also fine for a fully-emulated VGA device in Qemu, because the the
>> framebuffer if moved (re-set up actually) when the virtual BAR is moved,
>> but with a real GPU (SR-IOV in this case), there is no logic to play games.

So are you saying OVMF starts out appearing to run in VRAM then
in the OVMF case, until the frame buffer gets moved? If so,
with the logic added by this patch, how would both places end
(old VRAM address, where OVMF lives, and new VRAM address) get
backed by distinct pages? Wouldn't the avoided re-populate
result in the same page having two uses? Or alternatively there
being a hole in OVMF space, which would be a problem if this
was backing runtime memory?

>> The problem is entirely caused by the framebuffer in Xen not being like
>> any real system.  The framebuffer isn't actually in a BAR, and also
>> doesn't manifest itself in the way that graphics-stolen-ram normally
>> does, either.
> 
> Adding to what Andrew said:
> 
> There multiple technical complications that caused this mess.
> One of them is that there is no unfortunately a better place for the
> framebuffer to be located initially. Second, SR-IOV device
> is real and adding a virtual BAR to it is also complicated (due to
> compatibility reasons) and NVIDIA decided to avoid that.

In which case I wonder - aren't you ending up with the MMIO case
that I had mentioned, and that you said is difficult to deal with?

Jan

