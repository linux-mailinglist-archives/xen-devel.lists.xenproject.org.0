Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03DE952A4E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 10:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777850.1187906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seVYS-0007uo-G7; Thu, 15 Aug 2024 08:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777850.1187906; Thu, 15 Aug 2024 08:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seVYS-0007re-CL; Thu, 15 Aug 2024 08:09:56 +0000
Received: by outflank-mailman (input) for mailman id 777850;
 Thu, 15 Aug 2024 08:09:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seVYQ-0007rI-PX
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 08:09:54 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beb873b9-5add-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 10:09:50 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5b7b6a30454so1012872a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 01:09:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebc081db4sm557062a12.88.2024.08.15.01.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 01:09:49 -0700 (PDT)
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
X-Inumbo-ID: beb873b9-5add-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723709390; x=1724314190; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j3squo8FcuBTyG4Qp7HX2d+/QnPP8p5VEq8m5MomKCs=;
        b=XsRDaFalPNQvKKW9RnITsEKE+Cn8dtS8DHCUSFFZlChraqQW3Cc8vv2630348YKYLg
         4C3zPGXDWBNlmzMdFrbjHvApQP1x/Z/xth99lnUOkuBBJKh/PelKRKENsk6+yR0vz9h3
         kuK9ATFdf8lUlEY6fAk05d/MS1Pl1Am2DP/3NCm325ff9+N+02OjAlZ8YYn+6EIe32y6
         jXKymJvd7dzfvmQp6HQTb+ssso+LI5sfXaP3YNdFpY/zpRe8sz0T/Q4NOBPYrJmH3sfe
         atoR94MRPkblQgtyFMcezyB7koCS+8wsbK4TmHn7d6eyKk1U7VdQGaH5CRDV0EMiSZO4
         yxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723709390; x=1724314190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3squo8FcuBTyG4Qp7HX2d+/QnPP8p5VEq8m5MomKCs=;
        b=vaJ3yIe9jGmAIhFKaGFFJS7SIkjUpFKgeDzcY88xour5wxJBYQimmJYhJ1cSkjPs6o
         4fzGZV9TRaWFYkaJh8ePELC/59vnEaiNeoniR6YFHVdH9j2gKjS4tI9P9GPZ1mmRlq5A
         4ywpSJGiZTw9+p111K+fRb2e7xDgl5tWk6b1kp2om/eUYCMGF7512B8HfpDe+7qFlYbl
         /gG0NpbLOmD+MI1vrZklukl4VtFr18YjCyejqQp8He0Qhw4rXqxbC0zRrjdP727xszW5
         L3cWJ+GYBkQnLiju23RdXI5E5ZIkQR1UA6sjes1fyrinLykX1pNF6qlkTArtoxAtKi/u
         nLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxRGtG49cX7X93y7EQ6dgafV18RRarrc/NKr5srRcxHbF4OWLRGpReNzGjuB+S5ba4XVrpbTjLNRU2kdUR9FndGKIHAPkTImc2ypb1ZFk=
X-Gm-Message-State: AOJu0Yxs32YT4SgdNJY4ZVu1rn4ryixdR9BaHPWlsD59WVWwYbUKKtit
	+z0OvpTp/uvWfrXhbzw1CE5sEQWd8G0kq//N/RjgV2MEhtXSkwZ1CpiwigsECw==
X-Google-Smtp-Source: AGHT+IHEfO9vT1MnMPVTD50+Aw6ODrHY4Z3N7X8+pqiG0RAUr6UxLQ3miIBHrfYHl62XeNqDYSqsiQ==
X-Received: by 2002:a05:6402:274b:b0:5bb:9ae0:4a41 with SMTP id 4fb4d7f45d1cf-5bea1cb05c4mr3236425a12.28.1723709389951;
        Thu, 15 Aug 2024 01:09:49 -0700 (PDT)
Message-ID: <d41f3027-14c8-4716-9444-d8bc109bb2b7@suse.com>
Date: Thu, 15 Aug 2024 10:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] xen/riscv: page table handling
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
 <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
 <1e83981cff0b6c47aa941e7ffee0ce658aefef22.camel@gmail.com>
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
In-Reply-To: <1e83981cff0b6c47aa941e7ffee0ce658aefef22.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2024 18:50, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-13 at 12:31 +0200, Jan Beulich wrote:
>> On 09.08.2024 18:19, Oleksii Kurochko wrote:
>>> Introduce internal macros starting with PTE_* for convenience.
>>> These macros closely resemble PTE bits, with the exception of
>>> PTE_BLOCK, which indicates that a page larger than 4KB is
>>> needed.
>>
>> I did comment on this too, iirc: Is there going to be any case where
>> large pages are going to be "needed", i.e. not just preferred? If
>> not,
>> giving the caller control over things the other way around
>> (requesting
>> 4k mappings are needed, as we have it in x86) may be preferable.
> Yes, you did the comment but I thought that it will be enough to
> mention that shattering isn't supported now and  also since
> pt_update_entry()is used to unmap as well, there could be a need to
> unmap e.g. 4K page from 2M block mapping what will a little bit harder
> then just having 4k by default.

Shattering isn't supported now, but that's going to change at some point,
I suppose. Where possible the long-term behavior wants taking into account
right away, to avoid having to e.g. touch all callers again later on.

>> Hmm, but then ...
>>
>>> RISC-V detects superpages using `pte.x` and `pte.r`, as there
>>> is no specific bit in the PTE for this purpose. From the RISC-V
>>> spec:
>>> ```
>>>   ...
>>>   4. Otherwise, the PTE is valid. If pte.r = 1 or pte.x = 1, go to
>>> step 5.
>>>      Otherwise, this PTE is a pointer to the next level of the page
>>> table.
>>>      ... .
>>>   5. A leaf PTE has been found.
>>>      ...
>>>   ...
>>> ```
>>>
>>> The code doesn’t support super page shattering so 4KB pages are
>>> used as
>>> default.
>>
>> ... you have this. Yet still callers expecting re-mapping in the
>> (large)
>> range they map can request small-page mappings right away.
> I am not sure that I fully understand what do you mean by "expcting re-
> mapping".

Right now you have callers pass PTE_BLOCK when they know that no small
page re-mappings are going to occur for an area. What I'm suggesting is
that you invert this logic: Have callers pass PTE_SMALL when there is
a possibility that re-mapping requests may be issued later. Then,
later, by simply grep-ing for PTE_SMALL you'll be able to easily find
all candidates that possibly can be relaxed when super-page shattering
starts being supported. That's going to be easier than finding all
instances where PTE_BLOCK is _not_used.

>>> --- a/xen/arch/riscv/include/asm/flushtlb.h
>>> +++ b/xen/arch/riscv/include/asm/flushtlb.h
>>> @@ -5,12 +5,25 @@
>>>  #include <xen/bug.h>
>>>  #include <xen/cpumask.h>
>>>  
>>> +#include <asm/sbi.h>
>>> +
>>>  /* Flush TLB of local processor for address va. */
>>>  static inline void flush_tlb_one_local(vaddr_t va)
>>>  {
>>>      asm volatile ( "sfence.vma %0" :: "r" (va) : "memory" );
>>>  }
>>>  
>>> +/*
>>> + * Flush a range of VA's hypervisor mappings from the TLB of all
>>> + * processors in the inner-shareable domain.
>>> + */
>>> +static inline void flush_tlb_range_va(vaddr_t va,
>>> +                                      size_t size)
>>
>> No need for line wrapping here?
> What is line wrapping here? Do you mean that size_t size should be on
> the previous line?

Yes. Everything will fit on one line quite nicely.

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/pt.c
>>> @@ -0,0 +1,408 @@
>>> +#include <xen/bug.h>
>>> +#include <xen/domain_page.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/mm.h>
>>> +#include <xen/mm-frame.h>
>>> +#include <xen/pmap.h>
>>> +#include <xen/spinlock.h>
>>> +
>>> +#include <asm/flushtlb.h>
>>> +#include <asm/page.h>
>>> +
>>> +static inline const mfn_t get_root_page(void)
>>> +{
>>> +    unsigned long root_maddr =
>>
>> maddr_t or paddr_t?
>>
>>> +        (csr_read(CSR_SATP) & SATP_PPN_MASK) << PAGE_SHIFT;
>>> +
>>> +    return maddr_to_mfn(root_maddr);
>>> +}
>>> +
>>> +/*
>>> + * Sanity check of the entry
>>> + * mfn is not valid and we are not populating page table. This
>>> means
>>
>> How does this fit with ...
>>
>>> + * we either modify entry or remove an entry.
>>> + */
>>> +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int
>>> flags)
>>> +{
>>> +    /* Sanity check when modifying an entry. */
>>> +    if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )
>>
>> ... the MFN check here?
> The comment is incorrect and should be corrected:
> " if mfn is valid or ... "
> 
>>  And why is (valid,INVALID_MFN) an indication
>> of a modification? But then ...
> the explanation is in the comment to pt_update():
>    /*
>     * If `mfn` equals `INVALID_MFN`, it indicates that the following page
>    table
>     * update operation might be related to either populating the table,
>     * destroying a mapping, or modifying an existing mapping.
>     */
>    static int pt_update(unsigned long virt,

And how do readers know that comments in pt_update() are crucial for
understanding what pt_check_entry() does? You certainly don't need to
have the same comment in two places, but you at least want to refer
to a relevant comment when that lives elsewhere.

>>> +static int pt_update(unsigned long virt,
>>> +                     mfn_t mfn,
>>> +                     unsigned long nr_mfns,
>>> +                     unsigned int flags)
>>> +{
>>> +    int rc = 0;
>>> +    unsigned long vfn = virt >> PAGE_SHIFT;
>>> +    unsigned long left = nr_mfns;
>>> +
>>> +    const mfn_t root = get_root_page();
>>> +
>>> +    /*
>>> +     * It is bad idea to have mapping both writeable and
>>> +     * executable.
>>> +     * When modifying/creating mapping (i.e PTE_VALID is set),
>>> +     * prevent any update if this happen.
>>> +     */
>>> +    if ( (flags & PTE_VALID) && PTE_W_MASK(flags) &&
>>> PTE_X_MASK(flags) )
>>> +    {
>>> +        printk("Mappings should not be both Writeable and
>>> Executable.\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if ( !IS_ALIGNED(virt, PAGE_SIZE) )
>>> +    {
>>> +        printk("The virtual address is not aligned to the page-
>>> size.\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    spin_lock(&xen_pt_lock);
>>> +
>>> +    while ( left )
>>> +    {
>>> +        unsigned int order, level;
>>> +
>>> +        level = pt_mapping_level(vfn, mfn, left, flags);
>>> +        order = XEN_PT_LEVEL_ORDER(level);
>>> +
>>> +        ASSERT(left >= BIT(order, UL));
>>> +
>>> +        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level,
>>> +                                    flags);
>>
>> Indentation.
>>
>>> +        if ( rc )
>>> +            break;
>>> +
>>> +        vfn += 1U << order;
>>> +        if ( !mfn_eq(mfn, INVALID_MFN) )
>>> +            mfn = mfn_add(mfn, 1U << order);
>>> +
>>> +        left -= (1U << order);
>>
>> To be on thje safe side, 1UL everywhere?
>>
>>> +        if ( rc )
>>> +            break;
>>
>> There was such a check already a few lines up from here.
>>
>>> +    }
>>> +
>>> +
>>> +    /* ensure that PTEs are all updated before flushing */
>>
>> Again: No double blank lines please.
>>
>>> +    RISCV_FENCE(rw, rw);
>>> +
>>> +    /*
>>> +     * always flush TLB at the end of the function as non-present
>>> entries
>>> +     * can be put in the TLB
>>> +     */
>>> +    flush_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
>>
>> Coming back to "negative" TLB entries: Assuming RISC-V, just like
>> other
>> architectures, also permits intermediate page table entries to be
>> cached,
>> the affected VA range may be much larger than the original request,
>> if
>> intermediate page tables needed creating.
> It could be an issue. Could we some how  to calculate the proper range
> or the only option we have is to flush all.

Right - either you maintain state to know the biggest possible range
that can be affected, or you flush all when a new intermediate page
table needed inserting.

>>> +    spin_unlock(&xen_pt_lock);
>>
>> Does this really need to come after fence and flush?
> I think yes, as page table should be updated only by 1 CPU at the same
> time. And before give ability to other CPU to update page table we have
> to finish a work on current CPU.

Can you then explain to me, perhaps by way of an example, what will go
wrong if the unlock is ahead of the flush? (I'm less certain about the
fence, and that's also less expensive.)

>>> +int map_pages_to_xen(unsigned long virt,
>>> +                     mfn_t mfn,
>>> +                     unsigned long nr_mfns,
>>> +                     unsigned int flags)
>>> +{
>>> +    /*
>>> +     * Ensure that we have a valid MFN before proceeding.
>>> +     *
>>> +     * If the MFN is invalid, pt_update() might misinterpret the
>>> operation,
>>> +     * treating it as either a population, a mapping destruction,
>>> +     * or a mapping modification.
>>> +     */
>>> +    ASSERT(!mfn_eq(mfn, INVALID_MFN));
>>
>> But flags with PTE_VALID not set are fine to come into here?
> It is fine for pt_update() but I don't know if it is fine for
> map_pages_to_xen(). I see that other architectures don't check that.

That's not my point here. It's rather along the lines of an earlier
that I gave here: Since pte_update() is a pretty generic function, will
flags not having PTE_VALID set perhaps result in pte_update() doing
something that's not what the caller might expect?

And yes, there's a special case of map_pages_to_xen() being called with
_PAGE_NONE (if an arch defines such). That special case plays into here:
If an arch doesn't define it, unmap requests ought to exclusively come
through destroy_xen_mappings().

Jan

