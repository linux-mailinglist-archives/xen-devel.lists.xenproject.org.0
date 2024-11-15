Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3C39CE14F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 15:33:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837687.1253606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBxNT-0002Xx-CF; Fri, 15 Nov 2024 14:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837687.1253606; Fri, 15 Nov 2024 14:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBxNT-0002Vb-8w; Fri, 15 Nov 2024 14:32:51 +0000
Received: by outflank-mailman (input) for mailman id 837687;
 Fri, 15 Nov 2024 14:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54cC=SK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tBxNR-0002VV-9y
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 14:32:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 794563bf-a35e-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 15:32:44 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173168115735157.204663624265095;
 Fri, 15 Nov 2024 06:32:37 -0800 (PST)
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
X-Inumbo-ID: 794563bf-a35e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc5NDU2M2JmLWEzNWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjgxMTY0LjcyMjA5NCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731681158; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EH1+25/95f88FqRODSsiLjOPWtH9OO0TZRRdw1ldCCxitrQfG4CzZh8yabtoj8D1dDkerq63r2GkyWqsKFEldf75PwmCPrkLzlIWaqdyXZ4oeJ6EAGkSq9yObMBDTe69iqRHAvYaaJxzzHcUsVgN71aekgHvIZZN4zvFNRXncQE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731681158; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OWg3fExvgT8y7nd7dYJBWYZYJC5REduXY7FJt3zqmxk=; 
	b=Pec+e+4dZ5IW8dkRi6CIREYIFr7IU8q80XABuiVyry+D7srDHeb/bt+CY5is6Ncn4kWDVktmJRI9ay2LJxo7N+EtdmFdI+K7sCS7XNHu85Z1SEkjUQnp/UhMKt2NrgqNGzxa69WZ/+zGWLFKPEtJoLtgrFTUYe8QFwSHUBTgE/I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731681158;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OWg3fExvgT8y7nd7dYJBWYZYJC5REduXY7FJt3zqmxk=;
	b=L1D7ZxPYZTdpv+7jDgkUy4BasbQM1JI7WNUpE09hoTl1RGLIqdif1PaUz58S8iB/
	4Ol8/MtOefJKW4fy1hbkzGInLjelUsJbWPlxPofHOV353zg7Q281OKUHrzhY4HmckMq
	Q/PsIj79wIf6cgnPITD6vmwU+hHg1/CtCIwjJPRM=
Message-ID: <13a6a3c8-ff72-4b59-bf48-8fa925cadcbb@apertussolutions.com>
Date: Fri, 15 Nov 2024 09:32:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] x86/boot: convert domain construction to use boot
 info
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-2-dpsmith@apertussolutions.com>
 <305651e4-1567-4675-867e-94fc5bf9caf8@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <305651e4-1567-4675-867e-94fc5bf9caf8@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/15/24 09:25, Andrew Cooper wrote:
> On 15/11/2024 1:11 pm, Daniel P. Smith wrote:
>> With all the components used to construct dom0 encapsulated in struct boot_info
>> and struct boot_module, it is no longer necessary to pass all them as
>> parameters down the domain construction call chain. Change the parameter list
>> to pass the struct boot_info instance and the struct domain reference.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> There are two minor things needing noting in the commit message.
> 
> 1) dom0_construct() turns i from being signed to unsigned.  This is
> necessary for it's new use, and compatible with all pre-existing uses.
> 
> 2) dom0_construct() also splits some 3-way assignments to placate MISRA,
> on lines which are modified.

Ack.

>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>> index 3dd913bdb029..d1bdf1b14601 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -642,15 +643,15 @@ static bool __init check_and_adjust_load_address(
>>       return true;
>>   }
>>   
>> -static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>> -                                  unsigned long image_headroom,
>> -                                  module_t *initrd, void *image_base,
>> -                                  const char *cmdline, paddr_t *entry,
>> -                                  paddr_t *start_info_addr)
>> +static int __init pvh_load_kernel(
>> +    struct domain *d, struct boot_module *image, struct boot_module *initrd,
>> +    paddr_t *entry, paddr_t *start_info_addr)
>>   {
>> -    void *image_start = image_base + image_headroom;
>> -    unsigned long image_len = image->mod_end;
>> -    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
>> +    void *image_base = bootstrap_map_bm(image);
>> +    void *image_start = image_base + image->headroom;
>> +    unsigned long image_len = image->mod->mod_end;
>> +    unsigned long initrd_len = initrd ? initrd->mod->mod_end : 0;
>> +    const char *cmdline = __va(image->cmdline_pa);
> 
> This isn't safe.  __va(0) != NULL, so later between ...

Yah, that was careless to assume.

>>       struct elf_binary elf;
>>       struct elf_dom_parms parms;
>>       paddr_t last_addr;
>> @@ -725,8 +726,8 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
> 
> ... these two hunks in the calculation for last_addr, we have:
> 
>      ... cmdline ? ROUNDUP(strlen(cmdline) + 1, ...
> 
> which does the wrong thing.  (And includes the 16bit IVT onto the
> guest's cmdline.)
> 
> 
> I'd suggest doing the same as we do with initrd_len/etc, and having:
> 
>      const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) :
> NULL;
> 
> to maintain the prior semantics.

Agreed.

>>   
>>       if ( initrd != NULL )
>>       {
>> -        rc = hvm_copy_to_guest_phys(last_addr, mfn_to_virt(initrd->mod_start),
>> -                                    initrd_len, v);
>> +        rc = hvm_copy_to_guest_phys(
>> +            last_addr, mfn_to_virt(initrd->mod->mod_start), initrd_len, v);
> 
> This is a temporary adjustment, ending up shorter than it starts by
> patch 3.  I've tweaked it to reduce the churn overall.  I can live with
> 83 chars width for a commit or two...

Just trying to ensure I don't get dinged, so no objection on my part.

>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>> index cc882bee61c3..6be3d7745fab 100644
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -354,13 +355,10 @@ static struct page_info * __init alloc_chunk(struct domain *d,
>>       return page;
>>   }
>>   
>> -static int __init dom0_construct(struct domain *d,
>> -                                 const module_t *image,
>> -                                 unsigned long image_headroom,
>> -                                 module_t *initrd,
>> -                                 const char *cmdline)
>> +static int __init dom0_construct(struct boot_info *bi, struct domain *d)
>>   {
>> -    int i, rc, order, machine;
>> +    unsigned int i;
>> +    int rc, order, machine;
>>       bool compatible, compat;
>>       struct cpu_user_regs *regs;
>>       unsigned long pfn, mfn;
>> @@ -374,10 +372,13 @@ static int __init dom0_construct(struct domain *d,
>>       unsigned int flush_flags = 0;
>>       start_info_t *si;
>>       struct vcpu *v = d->vcpu[0];
>> -    void *image_base = bootstrap_map(image);
>> -    unsigned long image_len = image->mod_end;
>> -    void *image_start = image_base + image_headroom;
>> -    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
>> +    struct boot_module *image;
>> +    struct boot_module *initrd = NULL;
>> +    void *image_base;
>> +    unsigned long image_len;
>> +    void *image_start;
>> +    unsigned long initrd_len = 0;
>> +    const char *cmdline;
> 
> I'm tempted to put in some newlines here, just to break up the giant
> block of variables.

Yes, this is a very long block of declarations.

> This use of cmdline in principle needs a similar adjustment to the pvh
> case, but it's only used once, so I suggest this instead:
> 
> @@ -984,8 +982,8 @@ static int __init dom0_construct(struct boot_info
> *bi, struct domain *d)
>       }
>   
>       memset(si->cmd_line, 0, sizeof(si->cmd_line));
> -    if ( cmdline != NULL )
> -        strlcpy((char *)si->cmd_line, cmdline, sizeof(si->cmd_line));
> +    if ( image->cmdline_pa )
> +        strlcpy((char *)si->cmd_line, __va(image->cmdline_pa),
> sizeof(si->cmd_line));
>   
>   #ifdef CONFIG_VIDEO
>       if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
> 
> 
> [edit] Turns out you do this in patch 6 anyway, so this way around will
> reduce churn.

Ack.

> Happy to fix on commit.

No objection.

v/r,
dps


