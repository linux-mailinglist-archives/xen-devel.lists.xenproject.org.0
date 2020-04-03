Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC519DA16
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:28:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKOFG-0002in-U3; Fri, 03 Apr 2020 15:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKOFG-0002if-25
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:28:34 +0000
X-Inumbo-ID: c70f62dc-75bf-11ea-bd39-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c70f62dc-75bf-11ea-bd39-12813bfff9fa;
 Fri, 03 Apr 2020 15:28:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 06878AEA3;
 Fri,  3 Apr 2020 15:28:32 +0000 (UTC)
Subject: Re: [PATCH] hvmloader: probe memory below 4G before allocation for
 OVMF
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
 <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
 <0faaee38-e314-24a8-b97d-9f000251a63e@citrix.com>
 <9cba6eda-2c7c-9700-a484-c72100b8268f@citrix.com>
 <050e4847-df42-6e16-3707-19fadbae9229@suse.com>
 <c4b676a9-58ce-ae11-e13b-aae41b6c27b1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <24e20e5d-c661-3f40-ceb0-e0c6f0a753b2@suse.com>
Date: Fri, 3 Apr 2020 17:28:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c4b676a9-58ce-ae11-e13b-aae41b6c27b1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 ian.jackson@eu.citrix.com, wl@xen.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.2020 17:17, Igor Druzhinin wrote:
> On 03/04/2020 16:05, Jan Beulich wrote:
>> On 03.04.2020 16:47, Igor Druzhinin wrote:
>>> There multiple technical complications that caused this mess.
>>> One of them is that there is no unfortunately a better place for the
>>> framebuffer to be located initially. Second, SR-IOV device
>>> is real and adding a virtual BAR to it is also complicated (due to
>>> compatibility reasons) and NVIDIA decided to avoid that.
>>
>> In which case I wonder - aren't you ending up with the MMIO case
>> that I had mentioned, and that you said is difficult to deal with?
> 
> No, it's VRAM area (normal RAM pages) - not MMIO.

Well, VRAM is still MMIO from the CPU's perspective, just without
any side effects. But if it was another device that was passed
through, couldn't its MMIO similarly end up in that area?

Jan

