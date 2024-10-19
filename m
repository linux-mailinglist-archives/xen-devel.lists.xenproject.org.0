Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFC19A4D99
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 14:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822481.1236452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2896-0003iy-Iz; Sat, 19 Oct 2024 12:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822481.1236452; Sat, 19 Oct 2024 12:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2896-0003gY-GA; Sat, 19 Oct 2024 12:01:24 +0000
Received: by outflank-mailman (input) for mailman id 822481;
 Sat, 19 Oct 2024 12:01:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdF/=RP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2894-0003g6-Uk
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 12:01:22 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9e8db89-8e11-11ef-99a3-01e77a169b0f;
 Sat, 19 Oct 2024 14:01:20 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172933927283258.91642450225356;
 Sat, 19 Oct 2024 05:01:12 -0700 (PDT)
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
X-Inumbo-ID: d9e8db89-8e11-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729339275; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TrRta5JeLWip0SAp+zQPe78M7eD+PVbsaFH93YA/+ZFKB7zjsmEP17z5zTCStlzsqqAiCJ07Qnbui6l5/EJMqPtCzEF1L7nbf5YdJLt/Y9ucRkAwzsJl6jdyF3CBSJBFKk8WK0RVtKzwIcylBHB/kzNfeoxcE2D8ajYw4NeBm70=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729339275; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EuAZ5n0GARnApKkjEdEJ5lLtbJazOpAP6AKPlAJmOWs=; 
	b=ZvaswZ8DibhR2QuuNsORi2wuqj8ufrI+eD+I+mm5lHnHH4XPFhRa2xC/oVwvkmve3/1yk959pDrD0K2WMu2Gw9pR3y8oQ8n9g/ifU6WjUHe2vorsP9MYcRTm7LfWU9kdftdXVhoXvvKRqohT/BH6jmp/ag5N7cK7coZ1vBS8eek=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729339275;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EuAZ5n0GARnApKkjEdEJ5lLtbJazOpAP6AKPlAJmOWs=;
	b=SRHqY+2QEnde+uOr2jSNEh1K59iyhu2yMke4GkT74lzDk/L6ZYaVzEN9a5Yi/5Ga
	kcgOHaydqAlgqWN/cHIYl8gmE11206g4w4VGO6oQizdaZnOORs5+/JxktWMvTMFbjsN
	VopzFmsJYB8z736iq9FgL3EZ83Y5DGqnHua3XWaU=
Message-ID: <c1434463-e5f0-495b-a641-5ad4642e863b@apertussolutions.com>
Date: Sat, 19 Oct 2024 08:01:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/44] x86/boot: transition relocation calculations to
 struct boot_module
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-14-dpsmith@apertussolutions.com>
 <a94f876a-5f9a-4f21-be28-f4192c991337@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <a94f876a-5f9a-4f21-be28-f4192c991337@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/17/24 20:42, Jason Andryuk wrote:
> On 2024-10-17 13:02, Daniel P. Smith wrote:
>> Use struct boot_module fields, start and size, when calculating the 
>> relocation
>> address and size. It also ensures that early_mod references are kept 
>> in sync.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v5:
>> - removed unnecessary paddr_to_pfn, allowing condition to collapse to 
>> one line
>> - correct a missed conversion from .mod->mod_start to .start
>> ---
>>   xen/arch/x86/setup.c | 38 +++++++++++++++++---------------------
>>   1 file changed, 17 insertions(+), 21 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index d51b0b03bc97..44cec48fc877 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
> 
>> @@ -1528,11 +1526,10 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>           panic("Not enough memory to relocate the dom0 kernel image\n");
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        uint64_t s = (uint64_t)bi->mods[i].mod->mod_start
>> -                        << PAGE_SHIFT;
>> +        uint64_t s = (uint64_t)bi->mods[i].start;
> 
> I don't think this cast is necessary.

Ack.

>>           reserve_e820_ram(&boot_e820, s,
>> -                         s + PAGE_ALIGN(bi->mods[i].mod->mod_end));
>> +                         s + PAGE_ALIGN(bi->mods[i].size));
>>       }
>>       if ( !xen_phys_start )
> 
>> @@ -1686,12 +1682,12 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        set_pdx_range(bi->mods[i].mod->mod_start,
>> -                      bi->mods[i].mod->mod_start +
>> -                      PFN_UP(bi->mods[i].mod->mod_end));
>> -        map_pages_to_xen((unsigned 
>> long)mfn_to_virt(bi->mods[i].mod->mod_start),
>> -            _mfn(bi->mods[i].mod->mod_start),
>> -            PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
>> +        set_pdx_range(paddr_to_pfn(bi->mods[i].start),
>> +                      paddr_to_pfn(bi->mods[i].start) +
>> +                      PFN_UP(bi->mods[i].size));
>> +        map_pages_to_xen((unsigned 
>> long)maddr_to_virt(bi->mods[i].start),
>> +            maddr_to_mfn(bi->mods[i].start),
>> +            PFN_UP(bi->mods[i].size), PAGE_HYPERVISOR);
> 
> I would vertically align all the parameters inside the (.

Ack, though I will be applying the format requested by Jan.

> With those:
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks!

v/r,
dps

