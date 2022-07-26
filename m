Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E56A581967
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 20:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375647.608098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOyH-0001d9-05; Tue, 26 Jul 2022 18:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375647.608098; Tue, 26 Jul 2022 18:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOyG-0001aV-SD; Tue, 26 Jul 2022 18:07:52 +0000
Received: by outflank-mailman (input) for mailman id 375647;
 Tue, 26 Jul 2022 18:07:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oGOyE-0001aP-H4
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 18:07:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGOyD-0006To-58; Tue, 26 Jul 2022 18:07:49 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.237.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGOyC-0007L2-TH; Tue, 26 Jul 2022 18:07:49 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=l8bWrkiASMfyQa8reDRgMmg4Z303ORAVDy22/WUEJE0=; b=5VSduaUGb3ourZa9umZneUg5E6
	Qqy+gLDpKLgPMvfQrThjJ/hj1sR1+406nF4d+ppbN1ZRKNYkryAP/cMLAqrDAjx9hoXCTKnjC6guo
	aVO90lx33VJlhcbDT6rlCLEstdlk+XAY806TRdzGau+hUs+so0U9o2LPGxy8kj0ocb/g=;
Message-ID: <04c7adfd-e978-b911-fef9-f068ec624849@xen.org>
Date: Tue, 26 Jul 2022 19:07:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-2-dpsmith@apertussolutions.com>
 <c4ca59d6-daed-25e9-86d8-019676744eb2@xen.org>
 <78c3f88a-4f36-087d-31b1-d02bfbc8df30@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <78c3f88a-4f36-087d-31b1-d02bfbc8df30@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 19/07/2022 17:36, Daniel P. Smith wrote:
> 
> On 7/15/22 15:16, Julien Grall wrote:
>> Hi Daniel,
>>
>> On 06/07/2022 22:04, Daniel P. Smith wrote:
>>> For x86 the number of allowable multiboot modules varies between the
>>> different
>>> entry points, non-efi boot, pvh boot, and efi boot. In the case of
>>> both Arm and
>>> x86 this value is fixed to values based on generalized assumptions. With
>>> hyperlaunch for x86 and dom0less on Arm, use of static sizes results
>>> in large
>>> allocations compiled into the hypervisor that will go unused by many
>>> use cases.
>>>
>>> This commit introduces a Kconfig variable that is set with sane
>>> defaults based
>>> on configuration selection. This variable is in turned used as the
>>> array size
>>> for the cases where a static allocated array of boot modules is declared.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
>>
>> I am not entirely sure where this reviewed-by is coming from. Is this
>> from internal review?
> 
> Yes.
> 
>> If yes, my recommendation would be to provide the reviewed-by on the
>> mailing list. Ideally, the review should also be done in the open, but I
>> understand some company wish to do a fully internal review first.
> 
> Since this capability is being jointly developed by Christopher and I,
> with myself being the author of code, Christopher reviewed the code as
> the co-developer. He did so as a second pair of eyes for any obvious
> mistakes and to concur that the implementation was in line with the
> approach the two of us architected. Perhaps a SoB line might be more
> appropriate than an R-b line.
> 
>> At least from a committer perspective, this helps me to know whether the
>> reviewed-by still apply. An example would be if you send a v2, I would
>> not be able to know whether Christoffer still agreed on the change.
> 
> If an SoB line is more appropriate, then on the next version I can
> switch it

Thanks for the explanation. To me "signed-off-by" means the person wrote 
some code (or sent the patches) code. So from above, it sounds more like 
Christoffer did a review.

So I think it is more suitable for him to provide a reviewed-by. For 
follow-up, my preference would be Christoffer to provide the reviewed-by 
on the ML.

If it is too much overhead, I would suggest to log the latest version 
Christoffer reviewed-by in the changelog. I usually do:

Changes in vX:
   - Add Christoffer's reviewed-by

Or if he will reviewing every version, just mention it in the cover letter.

>>
>> Please explain in the commit message why the number of modules was
>> bumped from 5 to 9.
> 
> The number of modules were inconsistent between the different entry
> points into __start_xen(). By switching to a Kconfig variable, whose
> default was set to the largest value used across the entry points,
> results in change for the locations using another value.

Ok. Can you add something like: "For x86, the number of modules is not 
consistent across the code base. Use the maximum"?

> 
> See below for +1 explanation.
> 
>>>      static void __init edd_put_string(u8 *dst, size_t n, const char *src)
>>>    {
>>> diff --git a/xen/arch/x86/guest/xen/pvh-boot.c
>>> b/xen/arch/x86/guest/xen/pvh-boot.c
>>> index 498625eae0..834b1ad16b 100644
>>> --- a/xen/arch/x86/guest/xen/pvh-boot.c
>>> +++ b/xen/arch/x86/guest/xen/pvh-boot.c
>>> @@ -32,7 +32,7 @@ bool __initdata pvh_boot;
>>>    uint32_t __initdata pvh_start_info_pa;
>>>      static multiboot_info_t __initdata pvh_mbi;
>>> -static module_t __initdata pvh_mbi_mods[8];
>>> +static module_t __initdata pvh_mbi_mods[CONFIG_NR_BOOTMOD + 1];
>>
>> What's the +1 for?
> 
> I should clarify in the commit message, but the value set in
> CONFIG_NR_BOOTMOD is the max modules that Xen would accept from a
> bootloader. Xen startup code expects to be able to append Xen itself as
> the array. The +1 allocates an additional entry to store Xen in the
> array should a bootloader actually pass CONFIG_NR_BOOTMOD modules to
> Xen. There is an existing comment floating in one of these locations
> that explained it.

This makes sense. So every use of CONFIG_NR_BOOTMOD would end up to 
require +1. Is that correct?

If yes, then I think it would be better to require CONFIG_NR_BOOTMOD to 
be at minimum 1. This would reduce the risk to have different array size 
again. That said, this is x86 code, so the call is for the x86 maintainers.

> 
>>>    static const char *__initdata pvh_loader = "PVH Directboot";
>>>      static void __init convert_pvh_info(multiboot_info_t **mbi,
>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>> index f08b07b8de..2aa1e28c8f 100644
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1020,9 +1020,9 @@ void __init noreturn __start_xen(unsigned long
>>> mbi_p)
>>>            panic("dom0 kernel not specified. Check bootloader
>>> configuration\n");
>>>          /* Check that we don't have a silly number of modules. */
>>> -    if ( mbi->mods_count > sizeof(module_map) * 8 )
>>> +    if ( mbi->mods_count > CONFIG_NR_BOOTMODS )
>>>        {
>>> -        mbi->mods_count = sizeof(module_map) * 8;
>>> +        mbi->mods_count = CONFIG_NR_BOOTMODS;
>>>            printk("Excessive multiboot modules - using the first %u
>>> only\n",
>>>                   mbi->mods_count);
>>>        }
>>
>> AFAIU, this check is to make sure that we will not overrun module_map in
>> the next line:
>>
>> bitmap_fill(module_map, mbi->mods_count);
>>
>> The current definition of module_map will allow 64 modules. But you are
>> allowing 32768. So I think you either want to keep the check or define
>> module_map as:
>>
>> DECLARE_BITMAP(module_map, CONFIG_NR_BOOTMODS);
> 
> Yes, in the RFC I had it capped to 64 and lost track of this related
> changed when it was bumped to 32768 per the review discussion. Later in
> the series, module_map goes away. To ensure stability at this point I
> would be inclined to restore the 64 module clamp down check. Thoughts?

I don't know what would a sensible value for x86. I will leave this 
question to the x86 maintainers.

Cheers,

-- 
Julien Grall

