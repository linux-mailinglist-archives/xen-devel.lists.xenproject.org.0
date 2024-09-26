Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B995987731
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805683.1216857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqy0-0004sz-8r; Thu, 26 Sep 2024 16:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805683.1216857; Thu, 26 Sep 2024 16:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqy0-0004q5-4k; Thu, 26 Sep 2024 16:03:44 +0000
Received: by outflank-mailman (input) for mailman id 805683;
 Thu, 26 Sep 2024 16:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1stqxy-0004pB-1h
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:03:42 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3fe7287-7c20-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 18:03:39 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172736660725586.7212940189462;
 Thu, 26 Sep 2024 09:03:27 -0700 (PDT)
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
X-Inumbo-ID: e3fe7287-7c20-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1727366610; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S5f8/fqpn3yewnnJkbgC1bNoi+DqUQLyEO/xUUCWHHKN9/HCdELIDgrg8bxklefOKdLuoY23oox7wlQntKiGhEVfT0SJ0Ywo3TeOjr+BunOTgN35KgPDIbom3584hEOtah6eSH4q9Mm0xR7s8Inx8ODqfZbfjY3Znefe/KXwweU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727366610; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Yhm8YElX58SenLl+/atJ7UYppjXZd8mhf6XqTG7Zo+E=; 
	b=LOhERc9p1338ha8g7O9HBOdD/qWx/CRU3J+1WqRhXtX9MWz6GMazjMcTlUNEf2uUo+WvxGJv4YWstdlYc0FDirX57e30SLNrnF4qdUZ6h7TrAIuz9mkfHYc4V3NbNI6rj3NT5FTntERktIKWd/rmsAHtMee2bx1jtsxctjLKT9Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727366610;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Yhm8YElX58SenLl+/atJ7UYppjXZd8mhf6XqTG7Zo+E=;
	b=swBsCSjorX6Kq02ZT1iPZcQYSEJrbJzawDhh5Hjqxl5nsSrlTrf28d8JkhZrYcCN
	UPYPY2aTmLiDQE/2vOPjOZZMpCiMT8YBwaAvVxKH7W0HS/jpUZur7WucIuzL4t7wFn/
	7VIqLrrdzWgb46+0JUR0Yrm42SKW1Jrq11G2QHV4=
Message-ID: <2ec7703b-c3e4-4539-9256-070634a99d2e@apertussolutions.com>
Date: Thu, 26 Sep 2024 12:03:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/44] x86/boot: introduce struct boot_module
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-6-dpsmith@apertussolutions.com>
 <bc8987f6-e2cf-4ab7-b493-6fd00b89108a@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <bc8987f6-e2cf-4ab7-b493-6fd00b89108a@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/3/24 19:29, Andrew Cooper wrote:
> On 30/08/2024 10:46 pm, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
>> index e785ed1c5982..844262495962 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -8,10 +8,16 @@
>>   #ifndef __XEN_X86_BOOTINFO_H__
>>   #define __XEN_X86_BOOTINFO_H__
>>   
>> +#include <xen/multiboot.h>
>>   #include <xen/types.h>
>>   
>> +struct boot_module {
>> +    module_t *early_mod;
> 
> This could do with a /* Transitionary only */ comment.  In this patch
> it's not too bad, but it does get worse as new fields are added, before
> being removed.

Yep, can add a comment.

> I'd also drop the "early_" part.  I know it's the initial_images array
> we're converting, but "early_" doesn't convey any extra meaning, and it
> makes a number of lines get quite hairy.

I can drop it.

>> +};
>> +
>>   struct boot_info {
>>       unsigned int nr_mods;
>> +    struct boot_module *mods;
> 
> struct boot_module modules[MAX_NR_BOOTMODS + 1];
> 
> Probably at the end of the structure.  In turn it ...

I can move it here, though just to be clear, are you suggesting that it 
is kept at the end of the structure as more fields are added.

>>   
>>       const char *boot_loader_name;
>>       const char *cmdline;
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index c6b45ced00ae..28fdbf4d4c2b 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -278,12 +278,17 @@ custom_param("acpi", parse_acpi_param);
>>   
>>   static const char *cmdline_cook(const char *p, const char *loader_name);
>>   
>> +/* Max number of boot modules a bootloader can provide in addition to Xen */
>> +#define MAX_NR_BOOTMODS 63
>> +
>>   static const module_t *__initdata initial_images;
>>   static struct boot_info __initdata *boot_info;
>>   
>> -static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
>> +static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
>>   {
>>       static struct boot_info __initdata info;
>> +    static struct boot_module __initdata boot_mods[MAX_NR_BOOTMODS + 1];
> 
> ... drops this static.

Will be dropped.

>> +    unsigned int i;
>>   
>>       info.nr_mods = mbi->mods_count;
>>   
>> @@ -303,6 +308,14 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
>>           info.mmap_length = mbi->mmap_length;
>>       }
>>   
>> +    info.mods = boot_mods;
>> +
>> +    for ( i=0; i < info.nr_mods; i++ )
> 
> i = 0

Ack.

>> +        boot_mods[i].early_mod = &mods[i];
>> +
>> +    /* map the last mb module for xen entry */
>> +    boot_mods[info.nr_mods].early_mod = &mods[info.nr_mods];
> 
> The comment is good, but note how this is just one extra iteration of
> the loop, (so use <= for the bound).

I will move the comment above the loop and adjust the condition.

v/r,
dps


