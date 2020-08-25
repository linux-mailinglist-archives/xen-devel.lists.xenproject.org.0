Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2695E2516F1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 12:57:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAWdd-0006Qe-NU; Tue, 25 Aug 2020 10:57:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAWdc-0006QZ-9u
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 10:57:12 +0000
X-Inumbo-ID: 9a753744-ae38-49ac-ac32-92774e9cc56b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a753744-ae38-49ac-ac32-92774e9cc56b;
 Tue, 25 Aug 2020 10:57:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 332E1AF3B;
 Tue, 25 Aug 2020 10:57:41 +0000 (UTC)
Subject: Re: [PATCH 4/4] EFI: free unused boot mem in at least some cases
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <4e2d0d0a-9d85-d704-5d61-ae9efc69256a@suse.com>
 <21bd3372-ac86-f20f-b2b8-3cfb697ef894@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c2d275a-c4b5-90b9-e801-4de58486bae5@suse.com>
Date: Tue, 25 Aug 2020 12:57:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <21bd3372-ac86-f20f-b2b8-3cfb697ef894@citrix.com>
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

On 10.08.2020 19:09, Andrew Cooper wrote:
> On 06/08/2020 10:06, Jan Beulich wrote:
>> Address at least the primary reason why 52bba67f8b87 ("efi/boot: Don't
>> free ebmalloc area at all") was put in place: Make xen_in_range() aware
>> of the freed range. This is in particular relevant for EFI-enabled
>> builds not actually running on EFI, as the entire range will be unused
>> in this case.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The remaining issue could be addressed too, by making the area 2M in
>> size and 2M-aligned.
> 
> This memory range is only used for relocating the (synthesized?)
> multiboot strings, is it not?
> 
> I'm not actually convinced that this is a sensible tradeoff.
> 
> For one, you've broken setup.c's:
> 
>     /* This needs to remain in sync with xen_in_range(). */
>     reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
> 
> which covers the runtime aspect of what xen_in_range() covers during boot.

I'm afraid this wasn't a good suggestion here (it was still helpful
to notice that tboot.c also needs adjustment): By not reserving the
range here, it'll get freed by end_boot_allocator(), and hence may
not (again) be freed by free_ebmalloc_unused_mem() (kind of putting
its name under question). Immediately up from the quoted place we
also reserve the space where the modules live, which also gets
freed later. I'm having difficulty to see why this particular
aspect needs to remain in sync between the reservation done here
and xen_in_range().

v2 definitely is broken because of me not having noticed this in
time. I'll first try to fix it without reverting to the v1 model,
but I'd prefer to go back to the earlier approach (keeping merely
the other v2 adjustments). Unless of course you see some breakage
from this that I don't see.

Jan

