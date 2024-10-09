Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D561996E9C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814697.1228314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syY05-000205-6N; Wed, 09 Oct 2024 14:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814697.1228314; Wed, 09 Oct 2024 14:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syY05-0001xn-2t; Wed, 09 Oct 2024 14:49:17 +0000
Received: by outflank-mailman (input) for mailman id 814697;
 Wed, 09 Oct 2024 14:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syY03-0001ub-NS
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:49:15 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5726482-864d-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 16:49:13 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728485347418799.4436189132952;
 Wed, 9 Oct 2024 07:49:07 -0700 (PDT)
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
X-Inumbo-ID: a5726482-864d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728485349; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cNJvCE8EeIt0p3Cwtkge+x0d8vB2hdkK8pO3fw77/G3+sdz0GOFgKtfgdoyoFRMCvo0AKUdlOTF76kHpOK2f2dtiKaww1ZW44cIgUAIiZM5CaR+aoVFpB8w4PMx5ETIn4pJY3/XxdSj5eYo0q5GpkXkyVAnPmeesGTNtL72VZp0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728485349; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eK/CVI05StTRgMCnN1bJK3AYiAS12UdTTb3fy9eAhB4=; 
	b=lua54dyNHVMWa7mCAcNmWFmqsxY2o14JPo9HJwjL0kjyB+db4VPpUjvG9oWSBaFxXlYRVW2wIV5aL/nqYnQg9C7hARIGmRPHtpqQR3eOJhuiyaVojRd9S5O6WO8+nXzS9qaU92nD7T6vn99+59KO+FuAHkigyRlS1boe2YGDRHk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728485349;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eK/CVI05StTRgMCnN1bJK3AYiAS12UdTTb3fy9eAhB4=;
	b=knU6PuBYS0dyY1EzhSYrRIm+NLfPfirILFm6r4wdScghwt1ATnwmDw9QaBhjpjUy
	W3qC3oyHa3p41J83JECW06+8cCS4n5n9YGRqFvO3/STVOR0odo5SmzJEuSgVs8ddoXx
	f9AvDcDEjWz/Y9ITrgahI8b5sigOxTRpmMmQVB6U=
Message-ID: <33cd3e86-cb4f-4bd5-a39a-12f374c242b2@apertussolutions.com>
Date: Wed, 9 Oct 2024 10:49:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/44] x86/boot: introduce consumed flag for struct
 boot_module
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-17-dpsmith@apertussolutions.com>
 <2b939d07-23ed-4945-83a4-d615c32bf69c@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2b939d07-23ed-4945-83a4-d615c32bf69c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/7/24 17:06, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Allow the tracking of when a boot module has been consumed by a 
>> handler in the
>> hypervisor independent of when it is claimed. The instances where the
>> hypervisor does nothing beyond claiming, the dom0 kernel, dom0 
>> ramdisk, and a
>> placeholder for itself, are updated as being consumed at the time of 
>> being
>> claimed.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootinfo.h | 1 +
>>   xen/arch/x86/setup.c                | 3 +++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h 
>> b/xen/arch/x86/include/asm/bootinfo.h
>> index c79678840d31..7833b065eff1 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -34,6 +34,7 @@ struct boot_module {
>>       uint32_t flags;
>>   #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
>> +#define BOOTMOD_FLAG_X86_CONSUMED      (1U << 1)
>>       paddr_t start;
>>       size_t size;
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 4f540c461b26..235b4e41f653 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -318,6 +318,7 @@ static struct boot_info __init 
>> *multiboot_fill_boot_info(unsigned long mbi_p)
>>       /* map the last mb module for xen entry */
>>       bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
>> +    bi->mods[bi->nr_modules].flags |= BOOTMOD_FLAG_X86_CONSUMED;
>>       bi->mods[bi->nr_modules].mod = &mods[bi->nr_modules];
>>       return bi;
>> @@ -1196,6 +1197,7 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>       bitmap_fill(module_map, bi->nr_modules);
>>       __clear_bit(0, module_map); /* Dom0 kernel is always first */
>>       bi->mods[0].type = BOOTMOD_KERNEL;
>> +    bi->mods[0].flags |= BOOTMOD_FLAG_X86_CONSUMED;
> 
> I think these first two can be straight assignments since they occur 
> before relocation.

True, will change to straight assignment.

>>       if ( pvh_boot )
>>       {
>> @@ -2085,6 +2087,7 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>       initrdidx = find_first_bit(module_map, bi->nr_modules);
>>       bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
>> +    bi->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
>>       if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
>>           printk(XENLOG_WARNING
>>                  "Multiple initrd candidates, picking module #%u\n",
> 
> This one is after relocation, so |= is necessary.

I am going to assume that is just a reminder since it is already '|='.

v/r,
dps

