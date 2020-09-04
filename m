Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119125D990
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 15:23:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEBfr-0003fM-LV; Fri, 04 Sep 2020 13:22:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kEBfp-0003fG-PP
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 13:22:37 +0000
X-Inumbo-ID: 66784ba7-a37b-49a5-b043-075b50d9ce31
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66784ba7-a37b-49a5-b043-075b50d9ce31;
 Fri, 04 Sep 2020 13:22:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 919FDACCF;
 Fri,  4 Sep 2020 13:22:36 +0000 (UTC)
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Trammell Hudson <hudson@trmm.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
 <20200904130225.GQ753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a600ed4-e61c-7b89-f6ff-8dffb0c55724@suse.com>
Date: Fri, 4 Sep 2020 15:22:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200904130225.GQ753@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.09.2020 15:02, Roger Pau Monné wrote:
> On Fri, Aug 28, 2020 at 11:51:35AM +0000, Trammell Hudson wrote:
>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -156,6 +156,7 @@ SECTIONS
>>         __note_gnu_build_id_end = .;
>>    } :note :text
>>  #elif defined(BUILD_ID_EFI)
>> +  . = ALIGN(32); /* workaround binutils section overlap bug */
> 
> Is this a separate bugfix?
> 
> That's the only change to the linker script, so is this bug somehow
> triggered by the new code additions this commit makes?
> 
> It might also be nice to have some reference to the bug if possible,
> so that we know when the bug has been fixed and thus we can drop the
> workaround.

I think that's to work around a bug I've meanwhile fixed in bfd
(although maybe I should better call it "worked around"). If we
want to include this at all (rather than document that for the
objcopy to work one needs to use a recent tool; the issue doesn't
affect out build system after all, aiui), then I fully agree this
ought to be a separate patch, with a suitable description /
justification.

Jan

