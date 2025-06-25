Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D05AE88DC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 17:54:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025279.1400905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSRi-0008C3-Ob; Wed, 25 Jun 2025 15:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025279.1400905; Wed, 25 Jun 2025 15:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSRi-00089H-Lb; Wed, 25 Jun 2025 15:53:58 +0000
Received: by outflank-mailman (input) for mailman id 1025279;
 Wed, 25 Jun 2025 15:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUSRh-00089B-V8
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 15:53:57 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a0bdbd2-51dc-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 17:53:56 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso223929f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 08:53:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c8850c7asm4773267b3a.115.2025.06.25.08.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 08:53:55 -0700 (PDT)
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
X-Inumbo-ID: 9a0bdbd2-51dc-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750866836; x=1751471636; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BYRAvkXBUYWPLM/wm4erVKztHhnVAhzz8icM464Xgkc=;
        b=Bu0qpJ51+8pAeiXlpxqXsN+KxlPSyT+QN9IQOt254j4SG9U8U9DI3Xy5Y4MXjoOVeA
         CczyCMCx9UtL/ZrGVzGTjCAzaOdoclfDMoJWpJX9tB1EiVrWXW5irH1cHRhdwSJn1mOb
         PiNfa4kMKQyeoP1mFAkx4dNdGskyE+7qaIFQuXGc2u8A6mVZLlEIp7kkdmXPL8suvTDx
         jO2dUAfoqXI/M4o1hISIj69tF49vFVxGCYICqn7hW5npUNoQZbmuKkwpC0XIU63Z2J1X
         GghIaghNY8Il/nzhphQXhHmq08ZBQU70iytS3JGUrpZT/08H5EEbXyzkNjQPMJDtfbLh
         utbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866836; x=1751471636;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYRAvkXBUYWPLM/wm4erVKztHhnVAhzz8icM464Xgkc=;
        b=f4ouErxERG1woTo5Uz4Kmvpx8gA1Ojk98sz8Qog9BSUIAWMM1fLutsUCRrWCdn5zsC
         0Z2VUfHmwgR2D4TWwrSpCFBcmxklaqxLegsOeJKnzVAYG+jd/kMKVHdlODYHZ8yScSMZ
         t8JJFJ53JJ3aX2F/HE3KGgsz3OTV4Qh02aB08dCvChi5h54rY3RYKl4VtQ+DOV82nKFv
         +25f9uc05KZHbQndQ4EpeI7GWtr0G2/xTNt+Q5KhzeCHpA+rGHTgj7jTI8poM7WaIfUZ
         YvCq+hVkmWFtC9BZ0kKvtUmVN29j0Pj4ZgmBEGA9pPfkVE2Sy+Y0oKOM5FNLvi6vrMde
         Mfqg==
X-Forwarded-Encrypted: i=1; AJvYcCVx74wX34xKfwEgBpARdTkUuQ7eogrdJHKJ6BIKlJTDMs5M7uCKhu8gL2OZs5fcHurCKkaZavrF+UM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXgE5ZIgK8bpryp2r27ZIZP0ELrn3y5CDg4w5+DRRBW+g/n0No
	8+W/mDy24W/iihp0sJ7Lf9AvMyW7E8IQ00RcAYsf7MK0UVwgZrCnKW4td7b66FyTrA==
X-Gm-Gg: ASbGncuNHXLJtivnLH8u+VVX8u4Kw+/oWhgQ0z28r+hyzqv4JA0Q4TF6luabhtxolyN
	dAMmDx+hmYI2CbrYyt7Vhdv9P/S4F3l0yN+dsfOPRrHVSSr+JYJ264YOLX/0zINdrviMpN9nfVG
	OaGve2lfdlq6MtmSXrEx4B3GoS/fzdh79VaYqnvdLtlkjXj8TXoLN5+P8CQ6Yo3HLEgbsUJLDQm
	bL/ajn+r7PfIqU1Sn1KvPtXWhWHB89MNl63K8E/BDGBI03ulfpldBrIhBQ6PCT1evwBohnxy1fs
	FtIjlgJYQUfh3fgrYHE7iz6NgMKapwhycul6ldugD5gDd1LKk3VmlbpQbbVw3wHFQLeVWAVm57E
	Sk8eJ3f46ehR9ee+CkUrreK2wyK9OUHKXrrNC0kuIua7OVh0=
X-Google-Smtp-Source: AGHT+IGprPs/sdO69BD+FtqKFCKUvs4v1dGCAis7/L8up8AOm7hrlO80TQD3Jbsx1FmR9yS2l5hmNQ==
X-Received: by 2002:a5d:5f92:0:b0:3a6:d5fd:4687 with SMTP id ffacd0b85a97d-3a6ed60299cmr2924878f8f.18.1750866836170;
        Wed, 25 Jun 2025 08:53:56 -0700 (PDT)
Message-ID: <7cb7a46b-8d2e-4f9e-9613-f7a4199096ee@suse.com>
Date: Wed, 25 Jun 2025 17:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/17] xen/riscv: introduce things necessary for p2m
 initialization
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <443cb3566a60dcb5d5440c72410ff6d76a010a58.1749555949.git.oleksii.kurochko@gmail.com>
 <5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com>
 <0b3c403b-0f24-4fc6-ba5b-fb4df62d7057@gmail.com>
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
In-Reply-To: <0b3c403b-0f24-4fc6-ba5b-fb4df62d7057@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 17:31, Oleksii Kurochko wrote:
> On 6/18/25 6:08 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> @@ -14,6 +18,29 @@
>>>   
>>>   /* Per-p2m-table state */
>>>   struct p2m_domain {
>>> +    /*
>>> +     * Lock that protects updates to the p2m.
>>> +     */
>>> +    rwlock_t lock;
>>> +
>>> +    /* Pages used to construct the p2m */
>>> +    struct page_list_head pages;
>>> +
>>> +    /* Indicate if it is required to clean the cache when writing an entry */
>>> +    bool clean_pte;
>>> +
>>> +    struct radix_tree_root p2m_type;
>> A field with a p2m_ prefix in a p2m struct?
> 
> p2m_ prefix could be really dropped.
> 
>>   And is this tree really about
>> just a single "type"?
> 
> Yes, we don't have enough bits in PTE so we need some extra storage to store type.

My question wasn't about that, though. My question was whether in the name
"type" (singular) is appropriate. I didn't think you need a tree to store just
a single type.

>>> +    /*
>>> +     * Default P2M access type for each page in the the domain: new pages,
>>> +     * swapped in pages, cleared pages, and pages that are ambiguously
>>> +     * retyped get this access type.  See definition of p2m_access_t.
>>> +     */
>>> +    p2m_access_t default_access;
>>> +
>>> +    /* Back pointer to domain */
>>> +    struct domain *domain;
>> This you may want to introduce earlier, to prefer passing around struct
>> p2m_domain * in / to P2M functions (which would benefit earlier patches
>> already, I think).
> 
> But nothing uses it earlier.

If you do as suggested and pass around struct p2m_domain * for p2m_*()
functions, you'll quickly find it used, I think.

>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -1,13 +1,46 @@
>>>   #include <xen/bitops.h>
>>> +#include <xen/domain_page.h>
>>>   #include <xen/event.h>
>>> +#include <xen/iommu.h>
>>>   #include <xen/lib.h>
>>> +#include <xen/mm.h>
>>> +#include <xen/pfn.h>
>>> +#include <xen/rwlock.h>
>>>   #include <xen/sched.h>
>>>   #include <xen/spinlock.h>
>>>   #include <xen/xvmalloc.h>
>>>   
>>> +#include <asm/page.h>
>>>   #include <asm/p2m.h>
>>>   #include <asm/sbi.h>
>>>   
>>> +/*
>>> + * Force a synchronous P2M TLB flush.
>>> + *
>>> + * Must be called with the p2m lock held.
>>> + */
>>> +static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
>>> +{
>>> +    struct domain *d = p2m->domain;
>>> +
>>> +    ASSERT(p2m_is_write_locked(p2m));
>>> +
>>> +    sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);
>>> +}
>>> +
>>> +/* Unlock the flush and do a P2M TLB flush if necessary */
>>> +void p2m_write_unlock(struct p2m_domain *p2m)
>>> +{
>>> +    /*
>>> +     * The final flush is done with the P2M write lock taken to avoid
>>> +     * someone else modifying the P2M wbefore the TLB invalidation has
>>> +     * completed.
>>> +     */
>>> +    p2m_force_tlb_flush_sync(p2m);
>> The comment ahead of the function says "if necessary". Yet there's no
>> conditional here. I also question the need for a global flush in all
>> cases.
> 
> Stale comment.
> 
> But if p2m page table was modified that it is needed to do a flush for CPUs
> in d->dirty_cpumask.

Right, but is that true for each and every case where you acquire the
lock in write mode? There may e.g. be early-out path which end up doing
nothing, yet you would then still flush the TLB.

>>> @@ -109,8 +142,33 @@ int p2m_init(struct domain *d)
>>>       spin_lock_init(&d->arch.paging.lock);
>>>       INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
>>>   
>>> +    rwlock_init(&p2m->lock);
>>> +    INIT_PAGE_LIST_HEAD(&p2m->pages);
>>> +
>>>       p2m->vmid = INVALID_VMID;
>>>   
>>> +    p2m->default_access = p2m_access_rwx;
>>> +
>>> +    radix_tree_init(&p2m->p2m_type);
>>> +
>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>> Do you expect this to be conditionally selected on RISC-V?
> 
> No, once it will be implemented it will be just selected once by config RISC-V.
> And it was done so because iommu_has_feature() isn't implemented now as IOMMU
> isn't supported now and depends on CONFIG_HAS_PASSTHROUGH.

If the selection isn't going to be conditional, then I see no reason to have
such conditionals in RISC-V-specific code. The piece of code presently inside
that #ifdef may simply need adding later, once there's enough infrastructure
to allow that code to compile. Or maybe it would even compile fine already now?

>>> +    /*
>>> +     * Some IOMMUs don't support coherent PT walk. When the p2m is
>>> +     * shared with the CPU, Xen has to make sure that the PT changes have
>>> +     * reached the memory
>>> +     */
>>> +    p2m->clean_pte = is_iommu_enabled(d) &&
>>> +        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
>> The comment talks about shared page tables, yet you don't check whether
>> page table sharing is actually enabled for the domain.
> 
> Do we have such function/macros?

We have iommu_hap_pt_share, and we have the per-domain hap_pt_share flag.

> It is shared by implementation now.

I don't understand. There's no IOMMU support yet for RISC-V. Hence it's in
neither state - not shared, but also not not shared.

Jan

