Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED557A43E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 18:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370753.602619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDqDt-0004CG-EC; Tue, 19 Jul 2022 16:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370753.602619; Tue, 19 Jul 2022 16:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDqDt-0004AS-B1; Tue, 19 Jul 2022 16:37:25 +0000
Received: by outflank-mailman (input) for mailman id 370753;
 Tue, 19 Jul 2022 16:37:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLto=XY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oDqDr-0004AM-Dt
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 16:37:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dbf8384-0781-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 18:37:20 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658248634568315.9538041364176;
 Tue, 19 Jul 2022 09:37:14 -0700 (PDT)
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
X-Inumbo-ID: 0dbf8384-0781-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1658248636; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M+KtG0SQGD5c4Yc5uAfdIV0yf1vj9Lk0YE09+/f112XEJjVFomiX7t7LtqmOhTb08v49uEz30B4TJHh40YT/KLBQ+ZOpuDErpClLKoLphhaQqsmWkmZ7QG+n4zD5cqP3cX4tEwc5/W65jZfFjGJtiTXr8eqi+Skj3b9uGYSk4iM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658248636; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=bjrTTcX2WxDg7VEE5uCHADJqFBNUYF9tPGumG+FeAWY=; 
	b=M2GL0/17tGhuooUB/gUHr3Q3sBGioof4CDrdwy9CVj1SUN0/vzJGgfH1GpMdH2lBvwd0zk7sPA9rvEQjDBxY11TtT3HuTkNvFP7C4uv36WkD71ry6a9UtQhmR9cKPCBPiLQKCz3EUr9OkIYJnMsMqPW8FYz5SzSMI19uvZPWGY0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658248636;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bjrTTcX2WxDg7VEE5uCHADJqFBNUYF9tPGumG+FeAWY=;
	b=Qj2i2P/dCLJFT5ePBTAJpxa/UUK4e/AF44pbydE0ejUxtk17HFhx/W97SOYZvfKH
	AwksQaRcCZeoiWjXK4FEdnfnPmPmNIef3ysjkC0uRv252mDvs5y/6wK/9zzVzhKJgLQ
	mEEB8iKseWQt8wv3VBaN6h3Ywe1bebrMYnHqCgOo=
Message-ID: <78c3f88a-4f36-087d-31b1-d02bfbc8df30@apertussolutions.com>
Date: Tue, 19 Jul 2022 12:36:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
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
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
In-Reply-To: <c4ca59d6-daed-25e9-86d8-019676744eb2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External


On 7/15/22 15:16, Julien Grall wrote:
> Hi Daniel,
> 
> On 06/07/2022 22:04, Daniel P. Smith wrote:
>> For x86 the number of allowable multiboot modules varies between the
>> different
>> entry points, non-efi boot, pvh boot, and efi boot. In the case of
>> both Arm and
>> x86 this value is fixed to values based on generalized assumptions. With
>> hyperlaunch for x86 and dom0less on Arm, use of static sizes results
>> in large
>> allocations compiled into the hypervisor that will go unused by many
>> use cases.
>>
>> This commit introduces a Kconfig variable that is set with sane
>> defaults based
>> on configuration selection. This variable is in turned used as the
>> array size
>> for the cases where a static allocated array of boot modules is declared.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
> 
> I am not entirely sure where this reviewed-by is coming from. Is this
> from internal review?

Yes.

> If yes, my recommendation would be to provide the reviewed-by on the
> mailing list. Ideally, the review should also be done in the open, but I
> understand some company wish to do a fully internal review first.

Since this capability is being jointly developed by Christopher and I,
with myself being the author of code, Christopher reviewed the code as
the co-developer. He did so as a second pair of eyes for any obvious
mistakes and to concur that the implementation was in line with the
approach the two of us architected. Perhaps a SoB line might be more
appropriate than an R-b line.

> At least from a committer perspective, this helps me to know whether the
> reviewed-by still apply. An example would be if you send a v2, I would
> not be able to know whether Christoffer still agreed on the change.

If an SoB line is more appropriate, then on the next version I can
switch it

>> ---
>>   xen/arch/Kconfig                  | 12 ++++++++++++
>>   xen/arch/arm/include/asm/setup.h  |  5 +++--
>>   xen/arch/x86/efi/efi-boot.h       |  2 +-
>>   xen/arch/x86/guest/xen/pvh-boot.c |  2 +-
>>   xen/arch/x86/setup.c              |  4 ++--
>>   5 files changed, 19 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>> index f16eb0df43..24139057be 100644
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -17,3 +17,15 @@ config NR_CPUS
>>         For CPU cores which support Simultaneous Multi-Threading or
>> similar
>>         technologies, this the number of logical threads which Xen will
>>         support.
>> +
>> +config NR_BOOTMODS
>> +    int "Maximum number of boot modules that a loader can pass"
>> +    range 1 32768
>> +    default "8" if X86
>> +    default "32" if ARM
>> +    help
>> +      Controls the build-time size of various arrays allocated for
>> +      parsing the boot modules passed by a loader when starting Xen.
>> +
>> +      This is of particular interest when using Xen's hypervisor domain
>> +      capabilities such as dom0less.
>> diff --git a/xen/arch/arm/include/asm/setup.h
>> b/xen/arch/arm/include/asm/setup.h
>> index 2bb01ecfa8..312a3e4209 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -10,7 +10,8 @@
>>     #define NR_MEM_BANKS 256
>>   -#define MAX_MODULES 32 /* Current maximum useful modules */
>> +/* Current maximum useful modules */
>> +#define MAX_MODULES CONFIG_NR_BOOTMODS
>>     typedef enum {
>>       BOOTMOD_XEN,
>> @@ -38,7 +39,7 @@ struct meminfo {
>>    * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
>>    * The purpose of the domU flag is to avoid getting confused in
>>    * kernel_probe, where we try to guess which is the dom0 kernel and
>> - * initrd to be compatible with all versions of the multiboot spec.
>> + * initrd to be compatible with all versions of the multiboot spec.
> 
> In general, I much prefer if coding style changes are done separately
> because it helps the review (I don't have to stare at the line to figure
> out what changed).

Actually, on a past review of another series I got dinged on this, and I
did try to get most of them out of this series. This is just a straggler
that I missed. I will clean up on next revision.

> I am not going to force this here. However, the strict minimum is to
> mention the change in the commit message.
> 
>>    */
>>   #define BOOTMOD_MAX_CMDLINE 1024
>>   struct bootmodule {
>> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
>> index 6e65b569b0..4e1a799749 100644
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -18,7 +18,7 @@ static multiboot_info_t __initdata mbi = {
>>    * The array size needs to be one larger than the number of modules we
>>    * support - see __start_xen().
>>    */
>> -static module_t __initdata mb_modules[5];
>> +static module_t __initdata mb_modules[CONFIG_NR_BOOTMODS + 1];
> 
> Please explain in the commit message why the number of modules was
> bumped from 5 to 9.

The number of modules were inconsistent between the different entry
points into __start_xen(). By switching to a Kconfig variable, whose
default was set to the largest value used across the entry points,
results in change for the locations using another value.

See below for +1 explanation.

>>     static void __init edd_put_string(u8 *dst, size_t n, const char *src)
>>   {
>> diff --git a/xen/arch/x86/guest/xen/pvh-boot.c
>> b/xen/arch/x86/guest/xen/pvh-boot.c
>> index 498625eae0..834b1ad16b 100644
>> --- a/xen/arch/x86/guest/xen/pvh-boot.c
>> +++ b/xen/arch/x86/guest/xen/pvh-boot.c
>> @@ -32,7 +32,7 @@ bool __initdata pvh_boot;
>>   uint32_t __initdata pvh_start_info_pa;
>>     static multiboot_info_t __initdata pvh_mbi;
>> -static module_t __initdata pvh_mbi_mods[8];
>> +static module_t __initdata pvh_mbi_mods[CONFIG_NR_BOOTMOD + 1];
> 
> What's the +1 for?

I should clarify in the commit message, but the value set in
CONFIG_NR_BOOTMOD is the max modules that Xen would accept from a
bootloader. Xen startup code expects to be able to append Xen itself as
the array. The +1 allocates an additional entry to store Xen in the
array should a bootloader actually pass CONFIG_NR_BOOTMOD modules to
Xen. There is an existing comment floating in one of these locations
that explained it.

>>   static const char *__initdata pvh_loader = "PVH Directboot";
>>     static void __init convert_pvh_info(multiboot_info_t **mbi,
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index f08b07b8de..2aa1e28c8f 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1020,9 +1020,9 @@ void __init noreturn __start_xen(unsigned long
>> mbi_p)
>>           panic("dom0 kernel not specified. Check bootloader
>> configuration\n");
>>         /* Check that we don't have a silly number of modules. */
>> -    if ( mbi->mods_count > sizeof(module_map) * 8 )
>> +    if ( mbi->mods_count > CONFIG_NR_BOOTMODS )
>>       {
>> -        mbi->mods_count = sizeof(module_map) * 8;
>> +        mbi->mods_count = CONFIG_NR_BOOTMODS;
>>           printk("Excessive multiboot modules - using the first %u
>> only\n",
>>                  mbi->mods_count);
>>       }
> 
> AFAIU, this check is to make sure that we will not overrun module_map in
> the next line:
> 
> bitmap_fill(module_map, mbi->mods_count);
> 
> The current definition of module_map will allow 64 modules. But you are
> allowing 32768. So I think you either want to keep the check or define
> module_map as:
> 
> DECLARE_BITMAP(module_map, CONFIG_NR_BOOTMODS);

Yes, in the RFC I had it capped to 64 and lost track of this related
changed when it was bumped to 32768 per the review discussion. Later in
the series, module_map goes away. To ensure stability at this point I
would be inclined to restore the 64 module clamp down check. Thoughts?

v/r,
dps

