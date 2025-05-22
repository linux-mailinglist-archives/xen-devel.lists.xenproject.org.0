Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C8FAC10BF
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 18:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994371.1377400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI8U1-0006Ch-R8; Thu, 22 May 2025 16:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994371.1377400; Thu, 22 May 2025 16:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI8U1-00069a-Ny; Thu, 22 May 2025 16:09:25 +0000
Received: by outflank-mailman (input) for mailman id 994371;
 Thu, 22 May 2025 16:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI8U0-000699-Kb
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 16:09:24 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20047bb9-3727-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 18:09:23 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-602039559d8so7522649a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 09:09:23 -0700 (PDT)
Received: from [10.0.5.8] ([213.235.133.42]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e745fsm10951938a12.48.2025.05.22.09.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 09:09:22 -0700 (PDT)
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
X-Inumbo-ID: 20047bb9-3727-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747930162; x=1748534962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1XHYKOuBrBkEc4056xakayK/63ljFdwhAyjCiQnKYM=;
        b=IotdCdx/c9ExTotAHH/mOPJ6gApS4Q4TEiuOuz8t9NPxKjMIlPiF+WBZy7qx/T/yid
         M+hpZf7WVsbjexEWqhbcp4/pajto5cSNMxjxypJ3sdTbrgFNgus0CX0jeEb4EUEYK//4
         kDJxUdHrXSA5B/tLOjWJMrdIqcuWWToYI/WWorLWk1XFN2qAaZuwJjO6l21Ag72yvZh7
         nnRJ3fs8eqYUYfW6SqGv62mTwkREeo4M85riKigiJmgJnoHdAubRGikm4Yx4ROl4emMR
         w1idg0Gn3MaqQf9DCZojXazh3dbp4Exbtx8F6Af0bao1rLFwG1X4b82042uDgs2ezLok
         duOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747930162; x=1748534962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1XHYKOuBrBkEc4056xakayK/63ljFdwhAyjCiQnKYM=;
        b=IVClal2MmNq2zXJzP25V/DhLq7RkmP/J7JoA1BipywhYc/R+enJ2ZqQ8QbyuUXSxtv
         3qiaguJZMGkFGHwWfqLe/ig8Fcu3fRt2L1hPG5h5Qh4r+a8LIQNPWKomuXI7Zv4tYCOF
         0B6ZZ4meODsO1nOlGUr8PWT7Ss0BDH6u30lhdNq1iugreAfi/QfOcP7tZie5niHu1gbQ
         17xSjVZpQIMe3AJ3sqQaWbEQ8XTt4pqo6Gn/cHncqOs/Pzr9MpasE3UMNJkqX8d/9cs+
         yGU8IwS+5yMaZdid6w2b6jHUa9RQdGk+za27lQPCP5H7B/+5wmHn+MEkgk0pqsWiAwLN
         t4Og==
X-Forwarded-Encrypted: i=1; AJvYcCUxTYhticMg0twwse/Q4mAEXJszdp7Is12ptJ6r88JxJ9pvAPG1smaYe1EE6l5BAD8GjztMML+5yUk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0D7FzYslMbFy32KdDUFez/ZYG1idAHjnuexenxg/xMlibgHFf
	8nWuBHtqYd3t/sWmOtTcADg2AFAKnxpP4trX7M5ti4lCQOaMyxG0jmDUkmChWq/b2g==
X-Gm-Gg: ASbGncu7aHZVQyFtyhIOApoE8c4LVwruqrjPwUugytLv9HP3qgztjAcV0PBjwL7Vkz8
	iylTQCbm/Fd0FBO9OdbxzvblF6RiLpbLhPN0ZDWPc1JJG95x/W0F/wVyXx3ktxz6t6SkN4ZMgCL
	X8mENTW3WJNrbjBi1p+rg0EaArvYVDE0xDu17dHNnsuZZwgLPj/YvrxPdcHUc6Ai9TIhFojbqkn
	RsjxGGVi+eC4Fx/A5cTygMryT8vXDHtEL8zTsUcnunh/EqOZfP4Tng+e/x0Uel2C4MBI4+eYWPZ
	bIjBjx/+nY6da8gvYSE=
X-Google-Smtp-Source: AGHT+IGiOTnHHedpigHcKYha0AJTLV0lscn5NO1bxfkY3xhcCZiv8GzGx8tZmBww3TIMlBHYrzYa4w==
X-Received: by 2002:a05:6402:90c:b0:602:4405:778e with SMTP id 4fb4d7f45d1cf-60244057b23mr5171288a12.33.1747930162383;
        Thu, 22 May 2025 09:09:22 -0700 (PDT)
Message-ID: <ab4b0ba8-4a81-4059-94b0-aae8bda3fbfe@suse.com>
Date: Thu, 22 May 2025 18:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: introduce things necessary for p2m
 initialization
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
 <7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com>
 <1a0d3084-9e77-4df5-936a-c1a1317c0f18@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1a0d3084-9e77-4df5-936a-c1a1317c0f18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2025 17:53, Oleksii Kurochko wrote:
> On 5/20/25 3:37 PM, Jan Beulich wrote:
>> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>>> +static struct page_info *p2m_get_clean_page(struct domain *d)
>>> +{
>>> +    struct page_info *page;
>>> +
>>> +    /*
>>> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
>>> +     * As explained in Section 18.5.1, for the paged virtual-memory schemes
>>> +     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
>>> +     * and must be aligned to a 16-KiB boundary.
>>> +     */
>>> +    page = alloc_domheap_pages(NULL, 2, 0);
>> Shouldn't this allocation come from the domain's P2M pool (which is yet
>> to be introduced)?
> 
> First, I will drop p2m_get_clean_page() as it will be used only for p2m root page
> table allocation.
> 
> p2m_init() is called by domain_create() [->arch_domain_create()->p2m_init()] from create_domUs():
> [https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/device-tree/dom0less-build.c?ref_type=heads#L984].
> 
> When p2m_init() is called, p2m pool isn't ready and domain isn't created yet. Last one
> is also crucial for usage of p2m pool as p2m pool belongs to domain and thereby it is
> using alloc_domheap_page(d, ...) (Not NULL as for allocation of p2m root table above),
> so domain should be created first.

Yet that is part of my point: This allocation should be against the domain,
so it is properly accounted. What's the problem with allocating the root
table when the pools is being created / filled?

>>> +{
>>> +    unsigned long ppn;
>>> +    unsigned long hgatp_mode;
>>> +
>>> +    ppn = PFN_DOWN(page_to_maddr(page_info)) & HGATP_PPN;
>>> +
>>> +    /* ASID (VMID) not supported yet */
>>> +
>>> +#if RV_STAGE1_MODE == SATP_MODE_SV39
>>> +    hgatp_mode = HGATP_MODE_SV39X4;
>>> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
>>> +    hgatp_mode = HGATP_MODE_SV48X4;
>>> +#else
>>> +    #error "add HGATP_MODE"
>> As before, please have the # of pre-processor directives in the first column.
>>
>>> +#endif
>>> +
>>> +    return ppn | (hgatp_mode << HGATP_MODE_SHIFT);
>> Use MASK_INSR()?
> 
> Do you mean MASK_INSR(hgatp_mode, HGATP_MODE_MASK)?
> If yes, then I didn't get what is the point then?

The point is that generally ..._SHIFT is redundant when you also have
..._MASK; that's what MASK_EXTR() and MASK_INSR() leverage.

>>> +static int p2m_alloc_table(struct domain *d)
>>> +{
>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +
>>> +    p2m->root = p2m_allocate_root(d);
>>> +    if ( !p2m->root )
>>> +        return -ENOMEM;
>>> +
>>> +    p2m->hgatp = hgatp_from_page_info(p2m->root);
>>> +
>>> +    /*
>>> +     * Make sure that all TLBs corresponding to the new VMID are flushed
>>> +     * before using it.
>>> +     */
>>> +    p2m_write_lock(p2m);
>>> +    p2m_force_tlb_flush_sync(p2m);
>>> +    p2m_write_unlock(p2m);
>> While Andrew directed you towards a better model in general, it won't be
>> usable here then, as the guest didn't run on any pCPU(s) yet. Imo you
>> want to do a single global flush e.g. when VMIDs wrap around. That'll be
>> fewer global flushes than one per VM creation.
> 
> I am not sure that I get a phrase 'VMIDs wrap around'.

You have to allocate them somehow. Typically you'll use the next one available.
At some point you will need to start over, searching from the beginning. Prior
to that now allocation of a new one will require any flush, as none of them
had be in use before (after boot or the last such flush).

> I am going to implement, p2m_force_tlb_flush_sync() as:
>   static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>   {
>     ...
>       sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
>     ...
>   }
> 
> With such implementation if the guest didn't run on any pCPU(s) yet
> then d->dirty_cpumask is empty, then sbi_remote_hfence_gvma() will do nothing
> as hmask will be NULL (https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/riscv/sbi.c?ref_type=heads#L238).
> I am not sure that it is a good idea as I can't find a guarantee in the spec
> that TLB will be empty during boot time.

If in doubt, do one global flush while booting.

Jan

