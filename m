Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49F98755B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 16:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805576.1216714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpNH-00075k-K8; Thu, 26 Sep 2024 14:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805576.1216714; Thu, 26 Sep 2024 14:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpNH-00073d-Gv; Thu, 26 Sep 2024 14:21:43 +0000
Received: by outflank-mailman (input) for mailman id 805576;
 Thu, 26 Sep 2024 14:21:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1stpNF-00073X-Of
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 14:21:41 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3b131e5-7c12-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 16:21:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727360491017942.6164412087988;
 Thu, 26 Sep 2024 07:21:31 -0700 (PDT)
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
X-Inumbo-ID: a3b131e5-7c12-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1727360492; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aYGITz/XGJv4InTleVznJg0bPdaHautU4yLE71Gw4XCjOS8ZXTqWdDbBvAZXetOgpPVtGzB7PGXw0T3mz4nyvBrI1jnO0Q5u79+aCdKd/zkwlkvXx2vrXaD8YGh7QcupXAlQMno1wp+FIqRpchKhQ8kamoj1mV1gOh9x50j8KXU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727360492; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qQ5C+w9XnSwJ4Fd2J6RIPSDNhSeUXHtU1K9bchPKlvI=; 
	b=SOyKGk1mAYa47wq9Qeobzz+1p8cAXQu3e3yLuPB7XkyEAY9+m7PvSHkPiZRUMMAm6NfBG/VXYrY83mE1DzeZbhuTMiAwiFw5sdZS2R9UcKpMOtSpQ5ZhW2bbiVpPbsmj61Q0sorGSaI/Fm35IWW00SndBUjfkq79Zvnyaxfbe/g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727360492;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qQ5C+w9XnSwJ4Fd2J6RIPSDNhSeUXHtU1K9bchPKlvI=;
	b=oOy0sAYud1Ar4tTAPdm7qE8NupoATW06yT9+Od5rYZ4uyLbYlUicUaqBm5FWu1LE
	kl5b3q1pPhGfsDmAhQaf7WtEzwabDr8s5Ef1TuzGETiui4Og27DisYjYnpON5N5s5Fc
	rTotjc/jY3s5Y/E+kDZmEkRf5wltncrAHoCoYWUM=
Message-ID: <326b9238-59a9-4234-8a17-ddfa68793d88@apertussolutions.com>
Date: Thu, 26 Sep 2024 10:21:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/44] x86/boot: move x86 boot module counting into a
 new boot_info struct
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>, jason.andryuk@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-2-dpsmith@apertussolutions.com>
 <D3VUFEINDZZJ.3OHX2CEG4T0JU@cloud.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <D3VUFEINDZZJ.3OHX2CEG4T0JU@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/2/24 09:47, Alejandro Vallejo wrote:
> I haven't read the entire series yet, but here's my .02 so far
> 
> On Fri Aug 30, 2024 at 10:46 PM BST, Daniel P. Smith wrote:
>> From: Christopher Clark <christopher.w.clark@gmail.com>
>>
>> An initial step towards a non-multiboot internal representation of boot
>> modules for common code, starting with x86 setup and converting the fields
>> that are accessed for the startup calculations.
>>
>> Introduce a new header, <xen/asm/bootinfo.h>, and populate it with a new
>> boot_info structure initially containing a count of the number of boot
>> modules.
>>
>> No functional change intended.
>>
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootinfo.h | 25 +++++++++++++
>>   xen/arch/x86/setup.c                | 58 +++++++++++++++++------------
>>   2 files changed, 59 insertions(+), 24 deletions(-)
>>   create mode 100644 xen/arch/x86/include/asm/bootinfo.h
>>
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
>> new file mode 100644
>> index 000000000000..e850f80d26a7
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>> + * Copyright (c) 2024 Apertus Solutions, LLC
>> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>> + */
>> +
>> +#ifndef __XEN_X86_BOOTINFO_H__
>> +#define __XEN_X86_BOOTINFO_H__
>> +
> 
> This struct would benefit from a comment stating what it's for and how it's
> meant to be used. At a glance it seems like it's meant to be serve as a
> boot-protocol agnostic representation of boot-parameters, used as a generic
> means of information handover. Which would imply multiboot_info is parsed onto
> it when booting from multiboot and is synthesised from scratch in other cases
> (e.g: direct EFI?).

Yes, some inline documentation can be added.

>> +struct boot_info {
>> +    unsigned int nr_mods;
> 
> It's imo better to treat this as an ABI. That would allow using this layer as a
> boot protocol in itself (which I'm guessing is the objective? I haven't gotten
> that far in the series). If so, this would need to be a fixed-width uintN_t.
> 
> Same with other fields in follow-up patches.

The intent is to provide a clean internal abstraction around the boot 
material provided to Xen and not as an external boot protocol. The 
follow-on series to come will build upon this to introduce a 
representation of domains to be constructed at boot. A side goal with 
later introduced fields is to use proper xen types for the fields, eg. 
paddr_t, and mfn_t.

>> +};
>> +
>> +#endif
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index eee20bb1753c..dd94ee2e736b 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -32,6 +32,7 @@
>>   #include <compat/xen.h>
>>   #endif
>>   #include <xen/bitops.h>
>> +#include <asm/bootinfo.h>
>>   #include <asm/smp.h>
>>   #include <asm/processor.h>
>>   #include <asm/mpspec.h>
>> @@ -276,7 +277,16 @@ static int __init cf_check parse_acpi_param(const char *s)
>>   custom_param("acpi", parse_acpi_param);
>>   
>>   static const module_t *__initdata initial_images;
>> -static unsigned int __initdata nr_initial_images;
>> +static struct boot_info __initdata *boot_info;
>> +
>> +static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
> 
> If this function returned boot_info instead and the caller made the
> assignment then it would be possible to unit-test/fuzz it.
> 
> It also fits a bit more nicely with the usual implications of that function
> name pattern, I think.

As the larger capability continues to be developed, it is becoming 
necessary to get access to the reference from other areas of the code. 
Currently, I just move boot_info outside the function and exported the 
reference. I still have as an open question if the declaration should be 
static and access is obtained through an accessor function(s). I'm open 
to suggestions here.

>> +{
>> +    static struct boot_info __initdata info;
>> +
>> +    info.nr_mods = mbi->mods_count;
> 
> Shouldn't this be gated on MBI_MODULES being set?
> 
>     info.nr_mods = (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;

Yes.

>> +
>> +    boot_info = &info;
>> +}
>>   
>>   unsigned long __init initial_images_nrpages(nodeid_t node)
>>   {
>> @@ -285,7 +295,7 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
>>       unsigned long nr;
>>       unsigned int i;
>>   
>> -    for ( nr = i = 0; i < nr_initial_images; ++i )
>> +    for ( nr = i = 0; i < boot_info->nr_mods; ++i )
>>       {
>>           unsigned long start = initial_images[i].mod_start;
>>           unsigned long end = start + PFN_UP(initial_images[i].mod_end);
>> @@ -301,7 +311,7 @@ void __init discard_initial_images(void)
>>   {
>>       unsigned int i;
>>   
>> -    for ( i = 0; i < nr_initial_images; ++i )
>> +    for ( i = 0; i < boot_info->nr_mods; ++i )
>>       {
>>           uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
>>   
>> @@ -309,7 +319,7 @@ void __init discard_initial_images(void)
>>                              start + PAGE_ALIGN(initial_images[i].mod_end));
>>       }
>>   
>> -    nr_initial_images = 0;
>> +    boot_info->nr_mods = 0;
> 
> Out of curiosity, why is this required?

At this point, the boot modules have been "consumed" and are no longer 
safe to access. This ensures that if for some reason any module access 
code gets invoked that attempts to walk the modules, this will ensure
it will result in no access.

>>       initial_images = NULL;
>>   }
>>   
>> @@ -1034,9 +1044,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>           mod = __va(mbi->mods_addr);
>>       }
>>   
>> +    multiboot_to_bootinfo(mbi);
>> +
>>       loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
>>                                              : "unknown";
>> -
> 
> Stray newline removal?
> 
>>       /* Parse the command-line options. */
>>       if ( mbi->flags & MBI_CMDLINE )
>>           cmdline = cmdline_cook(__va(mbi->cmdline), loader);
>> @@ -1141,18 +1152,18 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>              bootsym(boot_edd_info_nr));
>>   
>>       /* Check that we have at least one Multiboot module. */
>> -    if ( !(mbi->flags & MBI_MODULES) || (mbi->mods_count == 0) )
>> +    if ( !(mbi->flags & MBI_MODULES) || (boot_info->nr_mods == 0) )
> 
> With MBI_MODULES accounted for during conversion, the first part of the
> conditional can be ellided and you could simply do:
> 
>      if ( !boot_info->nr_mods )
>          panic(...)

This eventually happens, the goal in this revision was to slowly unhook 
the mbi usage as it is pervasive and so the reviewers can ensure we are 
correctly replacing all of its usage. With that said, I can look to see 
if it is reasonable to add its usage here.

> Also, could we move this to multiboot_to_bootinfo()? It'd contain these sorts
> of boot argument checks to a much more self contained function and help check
> at the point of assignment, preventing misuse.

These checks could be moved up into that function, but then you would 
lose the ability to print messages since the conversion function is 
invoked before serial is initialized.

>>           panic("dom0 kernel not specified. Check bootloader configuration\n");
>>   
>>       /* Check that we don't have a silly number of modules. */
> 
>> -    if ( mbi->mods_count > sizeof(module_map) * 8 )
>> +    if ( boot_info->nr_mods > sizeof(module_map) * 8 )
> 
> Like above, this check would be much more neatly contained where boot_info
> is created, imo.

Again, you would lose the ability to print the error message.

>>       {
>> -        mbi->mods_count = sizeof(module_map) * 8;
>> +        boot_info->nr_mods = sizeof(module_map) * 8;
>>           printk("Excessive multiboot modules - using the first %u only\n",
> 
> Does the comment need adjusting too to make it more general? As in
> s/multiboot/boot.

I don't see why the message couldn't be generalized.

>> -               mbi->mods_count);
>> +               boot_info->nr_mods);
>>       }
>>   
>> -    bitmap_fill(module_map, mbi->mods_count);
>> +    bitmap_fill(module_map, boot_info->nr_mods);
>>       __clear_bit(0, module_map); /* Dom0 kernel is always first */
>>   
>>       if ( pvh_boot )
> 
> Cheers,
> Alejandro

Thanks for the review.

v/r
dps

