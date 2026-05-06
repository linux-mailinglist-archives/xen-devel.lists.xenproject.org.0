Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCuJAipK+2mYYwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 16:03:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4DD4DB9A4
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 16:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301787.1575976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcq4-0007Ql-Vv; Wed, 06 May 2026 14:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301787.1575976; Wed, 06 May 2026 14:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcq4-0007O6-TD; Wed, 06 May 2026 14:03:00 +0000
Received: by outflank-mailman (input) for mailman id 1301787;
 Wed, 06 May 2026 14:02:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKcq3-0007O0-5O
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 14:02:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKcq2-00GN0L-IH
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 16:02:58 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb4a0e-5cb7-0a2a0a5109dd-0a2a45038fd0-22
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 16:02:58 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb4a12-672d-0a2a45030019-d1558032cc54-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 16:02:58 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so92144175e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 07:02:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e53147bc2sm28717465e9.6.2026.05.06.07.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 07:02:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778076178; x=1778680978; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cw+Zb2S2B6U/fGHMz7FbBzAhTvqHAbfx2ig1B6IyYoQ=;
        b=XnWag67O3GiM5bjvhXehoPNARrxL4B2xfV0jO2M6mOTA6USrVgcTcD5ygBeJfIfklp
         BP3mrttlQGtMDPuckKTo0be8pbpAjnFzVEb6wyNEbnbaqLvPHwenQfPbqVqM5ZbfCXcg
         mW7agTj2YjzlttOn3apEfyDvzmw/bxL71dOq1pxkYgodKG3uDvDZne8DhT6qjEGa8P9P
         V96OQiKLoBePRyBT5JeXqcNdE7fieS2gFEHVNayE0jM9pbPKUEUX6P8r+BgCwGxx1nMb
         +pWLSMNR1WvURlrn54dz5HdXCdLodijpDbyyL8ZSOcF4ZHDIadNKlneZr1fCYGG92eU0
         Z4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778076178; x=1778680978;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw+Zb2S2B6U/fGHMz7FbBzAhTvqHAbfx2ig1B6IyYoQ=;
        b=ektpLVEZaRq9HKOIVf0eO7SdGqSKnO4O0JnceFYWyo4Y+r38P/MFO4RDbo2ld0R3Ud
         2RfWn6/PbSrbdns3N32DMz+Qpw0LCs+cgYusC5vTcwUyRpXcXLcTUDDxgxtTuJl+nd0q
         AK9n1RD2BUFTV2+SFX12Nyn/2di2s89NcNWjZTTrUYkuomCfs7klA95zgKith08JwKP0
         tC9+lIc6sw+4rp9qnYzhW3zv5bvGQy459cFtZJrcF3JTo14x0+2S0o0e82Ak/fIcZanG
         Dxx8yL1+GGq2BWuXuMPC0V5M61LY2yXniIMwVhB366Dqr4j2S96LSEgTuUKAkcmwkHbF
         uzrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oFqiBgI4IcVMRni5Yys6dsQGc/lN6zmhPlbzQtBWAvMc8xhy4cWu5V40VzkWqaoFDWlykmOLCukg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzm5jroa+ATgwHx/N9OL8Hpmt5ydBVMBQTLQhT+Ijmn57n91S8X
	ojFpbX+2m5nSLpHTN3YDbgaTVCosbIptqGaNqocczok86txFt/nXl8RgodcmJEqIIQ==
X-Gm-Gg: AeBDiesO0YT9+EXWini9nM07eyDYNYt5yYpFVJbikNzemsTUxkSneAscp1TT8JnvE2r
	xMKOlGbFpsUcKpS1pvLgmbjqUlCvwRiBTqNOhZtFqNLtk9Jx04g+3595/UZ6e+9c8E/mqdK0PsQ
	geT+PTTtyFHoqF744fK9qxvFRs0PmauaUGXb+8NVmMUJ7fDwsoC6JFjZsPFJGto4nFu2hqU0sCL
	hifOMorLRkbmq7/R3hAiUCIv0BrJ96V6fftHgYAyXNrXoWdZ+8HG985KVH1PFKIf24NM+/Q/v4f
	9ZKLgALRmDzWK8vK6nyIhrUpYoVtNJE7K8ICNfHIPRfJ7OyKIFaE+uHHCvgGuIaPDjXv/oSohRr
	L9+58x9WMwWFtpk89+J8qK6t6+OX+7emnqfo2z797xrMhJ9vxPvahifNd0i7gJ9rgPoLWdM+d7O
	p1ZwOxR2fnen+AhG2Z7qLTORPaHQqcyaKchQ47VbEWOM8ivyEqiH/wwfTj2Q3qEVrVtbCiXiBPu
	qWzj0T1wlhcJaeVo2dy1uHu9w==
X-Received: by 2002:a05:600c:c48f:b0:48a:568f:ae6b with SMTP id 5b1f17b1804b1-48e51f2a790mr64783035e9.7.1778076177545;
        Wed, 06 May 2026 07:02:57 -0700 (PDT)
Message-ID: <f001c6aa-05b6-4fc2-974a-930cdfc3d0d0@suse.com>
Date: Wed, 6 May 2026 16:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] xen/riscv: add Linux kernel loading support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <af89f0b696c5a1ae477dc0903a9a99b84df26f7a.1777303844.git.oleksii.kurochko@gmail.com>
 <f61ddc8f-88a6-4f61-a470-c9c82b8b9b52@suse.com>
 <fa07cdad-81f9-408f-a04d-d9c3b8e1bef1@gmail.com>
 <47609c96-33b0-4b1c-ba6a-60110797cca8@suse.com>
 <ecab104c-23a2-4ffc-8de6-44e3969e20ac@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ecab104c-23a2-4ffc-8de6-44e3969e20ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1778076178-3A378938-60E46E77/0/0
X-purgate-type: clean
X-purgate-size: 4953
X-Rspamd-Queue-Id: 1E4DD4DB9A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 06.05.2026 15:43, Oleksii Kurochko wrote:
> On 5/6/26 2:45 PM, Jan Beulich wrote:
>> On 06.05.2026 13:57, Oleksii Kurochko wrote:
>>> On 5/4/26 4:05 PM, Jan Beulich wrote:
>>>> On 28.04.2026 16:33, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/kernel.c
>>>>> @@ -0,0 +1,242 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +
>>>>> +#include <xen/bug.h>
>>>>> +#include <xen/compiler.h>
>>>>> +#include <xen/errno.h>
>>>>> +#include <xen/fdt-kernel.h>
>>>>> +#include <xen/guest_access.h>
>>>>> +#include <xen/init.h>
>>>>> +#include <xen/libfdt/libfdt.h>
>>>>> +#include <xen/mm.h>
>>>>> +#include <xen/types.h>
>>>>> +#include <xen/vmap.h>
>>>>> +
>>>>> +#include <asm/setup.h>
>>>>> +
>>>>> +#define IMAGE64_MAGIC_V2 0x05435352 /* Magic number 2, le, "RSC\x05" */
>>>>> +
>>>>> +static void __init place_modules(struct kernel_info *info, paddr_t kernbase,
>>>>> +                                 paddr_t kernend)
>>>>> +{
>>>>> +    const struct boot_module *mod = info->bd.initrd;
>>>>> +    const struct membanks *banks = kernel_info_get_mem_const(info);
>>>>> +    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0,
>>>>> +                                       KERNEL_LOAD_ADDR_ALIGNMENT);
>>>>> +    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt),
>>>>> +                                    KERNEL_LOAD_ADDR_ALIGNMENT);
>>>>
>>>
>>>> Why would modules need to be this strongly aligned?
>>> No specific reason except to be aligned with similar alignment below, it
>>> could be lesser (PAGE_SIZE or even just unsigned long aligned) or even
>>> dropped, I think. It was just easier then to calculate aligned
>>> addresses. But I don't see any big issue to have such alignments except
>>> maybe that it will waste some memory.
>>
>> Or result in there not being enough memory to hold everything.
> 
> Do you prefer than not to have alignment at all?

Some minimal alignment (like to machine word size) may be helpful, for
copying to be more efficient. There may also be reasons to use page
alignment (e.g. if the pages were to be assigned directly to the
domains, without any copying, as we do for PV Dom0 under certain
conditions on x86). That in turn may even justify super-page
alignment.

>>>>> +    /*
>>>>> +     * Place modules as high in RAM as possible, scanning banks from
>>>>> +     * last to first so that the end of the last bank is preferred.
>>>>> +     */
>>>>> +    while ( bi-- > 0 )
>>>>> +    {
>>>>> +        const struct membank *bank = &banks->bank[bi];
>>>>> +        const paddr_t bank_end = bank->start + bank->size;
>>>>> +        paddr_t modbase;
>>>>> +
>>>>> +        if ( modsize > bank->size )
>>>>> +            continue;
>>>>> +
>>>>> +        modbase = ROUNDDOWN(bank_end - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
>>>>
>>>> Same question here.
>>>
>>> I used KERNEL_LOAD_ADDR_ALIGNMENT to be sure that big page tables be
>>> potentially used in page table.
>>
>> I fear I'm lost. All the modules are temporary entities, aren't they?
> 
> They are temporary entities but they should be copied to guest memory, 
> right?
> 
> So ioremap() should be called for paddr where module is located and so 
> at least less cycles will be needed to add entries to Xen page tables.

Okay, that would be a small win in time for perhaps a boot failure when
the modules would fit in memory if they weren't this heavily aligned.
You're judgement, but please whatever higher-than-expected alignment
you decide to use, please comment upon this.

>>>>> +        if ( (modbase < ROUNDUP(kernend, KERNEL_LOAD_ADDR_ALIGNMENT)) &&
>>>>> +             (modbase + modsize > kernbase) )
>>>>> +        {
>>>>> +            modbase = ROUNDDOWN(kernbase - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
>>>>
>>>> What prevents this subtraction from underflowing?
>>>
>>> I will put the following check at the start of the place_modules() function:
>>> if ( kernbase < modsize )
>>>      panic("Underflow could happen between kernbase and modsize\n");
>>
>> Wait - why would this be a legitimate condition to panic?
> 
> It is legitimate to panic() as common API which leads to place_module() 
> has void in its return type (what should be changed in future, I have 
> this in TODO) and so if something is going wrong in place_module() there 
> is not better option except panic() for now.

Feels like you're mixing two things here. I didn't ask whether panic()
was appropriate to use here, but whether the condition is one upon
which panic()ing is the only option (right now). And voila, ...

> But generally i think it was too much to panic and it would be just 
> better to put:
>    if ( kernbase < modsize )
>        continue;
> above modbase = ROUNDDOWN(...) so it will just put modules in different 
> bank.

... looks like the situation can be handled without panic().

Jan

