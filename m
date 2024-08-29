Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EF0963C24
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 09:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785496.1194951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZ9u-0001cN-7Q; Thu, 29 Aug 2024 07:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785496.1194951; Thu, 29 Aug 2024 07:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZ9u-0001ZV-3x; Thu, 29 Aug 2024 07:01:30 +0000
Received: by outflank-mailman (input) for mailman id 785496;
 Thu, 29 Aug 2024 07:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjZ9s-0001ZP-MC
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 07:01:28 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82a7ba91-65d4-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 09:01:27 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8679f534c3so28372266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 00:01:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb580sm37683366b.37.2024.08.29.00.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 00:01:26 -0700 (PDT)
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
X-Inumbo-ID: 82a7ba91-65d4-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724914887; x=1725519687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wLjJVm7rPDH9Bf7DDhBSF5Plw2vcj0VaFk1mowMV8ck=;
        b=fbz4i9Kya1Mrkj4g2XUtxSS0mbhvH38Dcv9zkxAepJckXOJqD2z4mzTMRVKo9R36ga
         ilf7lRIolv3b+vfYO/K0e0ValmQ7IDx5MPxjsaAnNXFCHYrS9jgtAo9NreVC1YKtcVVi
         a3UPouB44ewU6K+OekZb2IcbpkclBXzxeYyIkNC2386c2QMsLONp3GmjPCYBFPXfWcFu
         0wu0X4ogXV4IKDVghcXPBfNLBhW27SAWx5ilUC4eWEIY0VJpy4eg0zGBpGz0SN1VVy1H
         0w7SLtBtWANLPRrKxk9PoOF+rjSLau0ZaEGe1ujFbTJeVjH0PdkuO+jgcXXjCG46ETEU
         uqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724914887; x=1725519687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLjJVm7rPDH9Bf7DDhBSF5Plw2vcj0VaFk1mowMV8ck=;
        b=Ey9DQFi3ABukGJd5Rfgk6+pIZ9SgxQrsS4+zjqPlm0DQR9bEDE2cN8osEfX43dIMZU
         HSX9UhdwLU67hDdzirqrA98kTZRKPptCECCAD+Ye2aYFBwXjaAzEvocgrFJ8E9OyThmJ
         LQs1eqm48T97P5n/fsGYnXrb4lhhoofGCNIlbv5TWFwcVy4YFmVH13EFvhy/KViS3eOK
         BkgBlvLmYPAPEkHBReohk+bf0N6fsplKWNcMa/9KHQZMM7C4nwTARIThW57AFoV1Xx7c
         M7LywTIM55yG/MeKNoU9ckgHJ9P1prJPj6EeZBBjzp9WdyfDYU61AgvPNyLN+Al80b3T
         XcqA==
X-Forwarded-Encrypted: i=1; AJvYcCXENmC5TMAH+nXs7EhHhs2XJfx+nXH+pFrH1KaRalGvtOOUPJpA/b0EE3ZEcCikA6mi4hlBGC4WJi0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFBfHu4SknnbVQ21nCtf8cq/ljkOxc6O7r+EY4vG1eEykCdg6B
	4lRWIhai4Rc+RRmQ4Tdx/AvoyZOCChXf3Q16k16to9Y0yiVQDraF553KbLqzlg==
X-Google-Smtp-Source: AGHT+IEjOGpQWvQ+zYUDVlcIIpu4/ck3qaONzafUOyMsJoHQ2m7YNuNQhgHS+GOV4p1qh/fdjOJwFA==
X-Received: by 2002:a17:907:7ba0:b0:a86:8a89:3d7e with SMTP id a640c23a62f3a-a897f930bc8mr105643366b.41.1724914886424;
        Thu, 29 Aug 2024 00:01:26 -0700 (PDT)
Message-ID: <b83e7d23-2171-447f-a4e5-48563e4068a5@suse.com>
Date: Thu, 29 Aug 2024 09:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] xen/riscv: page table handling
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <090e617d88b279ae88f1a7859875a7e1a0c6ae73.1724256027.git.oleksii.kurochko@gmail.com>
 <c0005454-3b34-427d-8ea0-620aba632487@suse.com>
 <ed84c53454cb63082aa96befe89a89d8f234ef71.camel@gmail.com>
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
In-Reply-To: <ed84c53454cb63082aa96befe89a89d8f234ef71.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2024 18:11, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-27 at 17:00 +0200, Jan Beulich wrote:
>> On 21.08.2024 18:06, Oleksii Kurochko wrote:
>>> Implement map_pages_to_xen() which requires several
>>> functions to manage page tables and entries:
>>> - pt_update()
>>> - pt_mapping_level()
>>> - pt_update_entry()
>>> - pt_next_level()
>>> - pt_check_entry()
>>>
>>> To support these operations, add functions for creating,
>>> mapping, and unmapping Xen tables:
>>> - create_table()
>>> - map_table()
>>> - unmap_table()
>>>
>>> Introduce internal macros starting with PTE_* for convenience.
>>> These macros closely resemble PTE bits, with the exception of
>>> PTE_SMALL, which indicates that 4KB is needed.
>>
>> What macros are you talking about here? Is this partially stale, as
>> only PTE_SMALL and PTE_POPULATE (and a couple of masks) are being
>> added?
> I am speaking about macros connected to masks:
>      #define PTE_R_MASK(x)   ((x) & PTE_READABLE)
>      #define PTE_W_MASK(x)   ((x) & PTE_WRITABLE)
>      #define PTE_X_MASK(x)   ((x) & PTE_EXECUTABLE)
>    
>      #define PTE_RWX_MASK(x) ((x) & (PTE_READABLE | PTE_WRITABLE |
>    PTE_EXECUTABLE))

Some of which is did question further down in my reply. But what's
worse - by saying "closely resemble PTE bits, with the exception of
PTE_SMALL" you pretty clearly _do not_ refer to the macros above, but
to PTE_VALID etc.

>>> @@ -68,6 +111,20 @@ static inline bool pte_is_valid(pte_t p)
>>>      return p.pte & PTE_VALID;
>>>  }
>>>  
>>> +inline bool pte_is_table(const pte_t p)
>>> +{
>>> +    return ((p.pte & (PTE_VALID |
>>> +                      PTE_READABLE |
>>> +                      PTE_WRITABLE |
>>> +                      PTE_EXECUTABLE)) == PTE_VALID);
>>> +}
>>
>> In how far is the READABLE check valid here? You (imo correctly) ...

Oh, I wrongly picked on READABLE when it should have been the WRITABLE
bit.

>>> +static inline bool pte_is_mapping(const pte_t p)
>>> +{
>>> +    return (p.pte & PTE_VALID) &&
>>> +           (p.pte & (PTE_WRITABLE | PTE_EXECUTABLE));
>>> +}
>>
>> ... don't consider this bit here.
> pte_is_mapping() seems to me is correct as according to the RISC-V
> privileged spec:
>    4. Otherwise, the PTE is valid. If pte.r = 1 or pte.x = 1, go to step 
>    5. Otherwise, this PTE is a pointer to the next level of the page   
>    table.
>    5. A leaf PTE has been found. ...

Right. And then why do you check all three of r, x, and w, when the doc
mentions only r and x? There may be reasons, but such reasons then need
clearly stating in a code comment, for people to understand why the code
is not following the spec.

> and regarding pte_is_table() READABLE check is valid as we have to
> check only that pte.r = pte.x = 0. WRITABLE check should be dropped. Or
> just use define pte_is_table() as:
>    inline bool pte_is_table(const pte_t p)
>    {
>    	return !pte_is_mapping(p);
>    }

You had it like this earlier on, didn't you? That's wrong, because for a
PTE to describe another page table level PTE_VALID needs to be set.

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/pt.c
>>> @@ -0,0 +1,420 @@
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
>>> +    paddr_t root_maddr = (csr_read(CSR_SATP) & SATP_PPN_MASK) <<
>>> PAGE_SHIFT;
>>> +
>>> +    return maddr_to_mfn(root_maddr);
>>> +}
>>> +
>>> +/* Sanity check of the entry. */
>>> +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int
>>> flags)
>>> +{
>>> +    /*
>>> +     * See the comment about the possible combination of (mfn,
>>> flags) in
>>> +     * the comment above pt_update().
>>> +     */
>>> +
>>> +    /* Sanity check when modifying an entry. */
>>> +    if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )
>>> +    {
>>> +        /* We don't allow modifying an invalid entry. */
>>> +        if ( !pte_is_valid(entry) )
>>> +        {
>>> +            printk("Modifying invalid entry is not allowed.\n");
>>
>> Perhaps all of these printk()s should be dprintk()?
> It could be dprintk() but at the same time I don't see any issue if it
> will be printed once.

What guarantees that it wouldn't be logged over and over? It's simply
bad practice to accompany all error returns with log messages, even
in release builds. Even if right now you're only in the bring-up phase,
you still want to have security in mind. If any such log message ended
up reachable from a guest-invoked path, an XSA would be needed.

>>  And not have a full
>> stop?
> By "full stop," do you mean something like panic() or BUG_ON()?

No. "Full stop" is the period at the end of a sentence (which shouldn't
normally be there at the end of log messages).

>>> +        /*
>>> +         * We don't allow replacing any valid entry.
>>> +         *
>>> +         * Note that the function pt_update() relies on this
>>> +         * assumption and will skip the TLB flush (when Svvptc
>>> +         * extension will be ratified). The function will need
>>> +         * to be updated if the check is relaxed.
>>> +         */
>>> +        if ( pte_is_valid(entry) )
>>> +        {
>>> +            if ( pte_is_mapping(entry) )
>>> +                printk("Changing MFN for a valid entry is not
>>> allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
>>> +                       mfn_x(mfn_from_pte(entry)), mfn_x(mfn));
>>> +            else
>>> +                printk("Trying to replace a table with a
>>> mapping.\n");
>>> +            return false;
>>> +        }
>>> +    }
>>> +    /* Sanity check when removing a mapping. */
>>> +    else if ( (flags & (PTE_VALID | PTE_POPULATE)) == 0 )
>>
>> The PTE_VALID part of the check is pointless considering the earlier
>> if(). I guess you may want to have it for doc purposes ...
> Yes, it just helps to read the code and understand "confusing" if's()
> above.

Well, since you mention "confusing": I for one consider such redundant
checks confusing. It raises the question whether this check is wrong or
the earlier one is. Therefore, if you want to keep the redundancy, it
may help if you extend the comment to mention it's actually redundant
(e.g. by saying "for completeness" or some such).

>>> +#define XEN_TABLE_MAP_FAILED 0
>>> +#define XEN_TABLE_SUPER_PAGE 1
>>> +#define XEN_TABLE_NORMAL 2
>>> +
>>> +/*
>>> + * Take the currently mapped table, find the corresponding entry,
>>> + * and map the next table, if available.
>>> + *
>>> + * The alloc_tbl parameters indicates whether intermediate tables
>>> should
>>> + * be allocated when not present.
>>> + *
>>> + * Return values:
>>> + *  XEN_TABLE_MAP_FAILED: Either alloc_only was set and the entry
>>> + *  was empty, or allocating a new page failed.
>>> + *  XEN_TABLE_NORMAL: next level or leaf mapped normally
>>> + *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
>>> + */
>>> +static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned
>>> int offset)
>>
>> Having the boolean first is unusual, but well - it's your choice.
>>
>>> +{
>>> +    pte_t *entry;
>>> +    int ret;
>>> +    mfn_t mfn;
>>> +
>>> +    entry = *table + offset;
>>> +
>>> +    if ( !pte_is_valid(*entry) )
>>> +    {
>>> +        if ( alloc_tbl )
>>> +            return XEN_TABLE_MAP_FAILED;
>>
>> Is this condition meant to be inverted?
> if alloc_tbl = true we shouldn't allocatetable as:
>      * The intermediate page table shouldn't be allocated when MFN
> isn't
>      * valid and we are not populating page table.
> ...
>     */

Well, no. The variable name really shouldn't be the opposite of what is
meant. "alloc_tbl" can only possibly mean "allocate a table if none is
there". I can't think of a sensible interpretation in the inverted sense.
I'm curious how you mean to interpret that variable name.

>     bool alloc_tbl = mfn_eq(mfn, INVALID_MFN) && !(flags &
> PTE_POPULATE);
> 
> So if mfn = INVALID_MFN and flags.PTE_POPULATE=0 it means that this
> table shouldn't be allocated and thereby pt_next_level() should return
> XEN_TABLE_MAP_FAILED.
> 
> Or to invert if ( alloc_tbl )it will be needed to invert defintion of
> alloc_tbl:
>  bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);

Yes, as I did comment further down.

>>> +    if ( level != target )
>>> +    {
>>> +        printk("%s: Shattering superpage is not supported\n",
>>> __func__);
>>> +        rc = -EOPNOTSUPP;
>>> +        goto out;
>>> +    }
>>> +
>>> +    entry = table + offsets[level];
>>> +
>>> +    rc = -EINVAL;
>>> +    if ( !pt_check_entry(*entry, mfn, flags) )
>>> +        goto out;
>>> +
>>> +    /* We are removing the page */
>>> +    if ( !(flags & PTE_VALID) )
>>> +        memset(&pte, 0x00, sizeof(pte));
>>> +    else
>>> +    {
>>> +        /* We are inserting a mapping => Create new pte. */
>>> +        if ( !mfn_eq(mfn, INVALID_MFN) )
>>> +            pte = pte_from_mfn(mfn, PTE_VALID);
>>> +        else /* We are updating the permission => Copy the current
>>> pte. */
>>> +            pte = *entry;
>>> +
>>> +        /* update permission according to the flags */
>>> +        pte.pte |= PTE_RWX_MASK(flags) | PTE_ACCESSED | PTE_DIRTY;
>>
>> When updating an entry, don't you also need to clear (some of) the
>> flags?
> I am not sure why some flags should be cleared. Here we are taking only
> necessary for pte flags such as R, W, X or other bits in flags are
> ignored.

Consider what happens to a PTE with R and X set when a request comes in
to change to R/W. You'll end up with R, X, and W all set if you don't
first clear the bits that are meant to be changeable in a "modify"
operation.

>>> +/* Return the level where mapping should be done */
>>> +static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned
>>> long nr,
>>> +                            unsigned int flags)
>>> +{
>>> +    unsigned int level = 0;
>>> +    unsigned long mask;
>>> +    unsigned int i;
>>> +
>>> +    /* Use blocking mapping unless the caller requests 4K mapping
>>> */
>>> +    if ( unlikely(flags & PTE_SMALL) )
>>> +        return level;
>>> +
>>> +    /*
>>> +     * Don't take into account the MFN when removing mapping (i.e
>>> +     * MFN_INVALID) to calculate the correct target order.
>>> +     *
>>> +     * `vfn` and `mfn` must be both superpage aligned.
>>> +     * They are or-ed together and then checked against the size
>>> of
>>> +     * each level.
>>> +     *
>>> +     * `left` is not included and checked separately to allow
>>> +     * superpage mapping even if it is not properly aligned (the
>>> +     * user may have asked to map 2MB + 4k).
>>
>> What is this about? There's nothing named "left" here.
> It refer to "remaining" pages or "leftover" space after trying to align
> a mapping to a superpage boundary.

What what is the quoted "left" here? Such a variable appears to exist in
the caller, but using the name here is lacking context.

>>> +/*
>>> + * If `mfn` equals `INVALID_MFN`, it indicates that the following
>>> page table
>>> + * update operation might be related to either populating the
>>> table (
>>> + * PTE_POPULATE will be set additionaly), destroying a mapping, or
>>> modifying
>>> + * an existing mapping.
>>
>> And the latter two are distinguished by? PTE_VALID?
> inserting -> (PTE_VALID=1 + (mfn=something valid))
> destroying-> ( PTE_VALID=0 )

Which then needs saying in the comment.

>>> + * If `mfn` is valid and flags has PTE_VALID bit set then it means
>>> that
>>> + * inserting will be done.
>>> + */
>>
>> What about mfn != INVALID_MFN and PTE_VALID clear?
> PTE_VALID=0 will be always considered as destroying and no matter what
> is mfn value as in this case the removing is done in the way where mfn
> isn't used:

Right, yet elsewhere you're restrictive as to MFN values valid to use.
Not requiring INVALID_MFN here looks inconsistent to me.

>         memset(&pte, 0x00, sizeof(pte));

Just to mention it: I don't think memset() is a very good way of clearing
a PTE, even if right here it's not a live one.

>>  Also note that "`mfn` is
>> valid" isn't the same as "mfn != INVALID_MFN". You want to be precise
>> here,
>> to avoid confusion later on. (I say that knowing that we're still
>> fighting
>> especially shadow paging code on x86 not having those properly
>> separated.)
> If it is needed to be precise and mfn is valid isn't the same as "mfn
> != INVALID_MFN" only for the case of shadow paging?

No, I used shadow paging only as an example of where we have similar
issues. I'd like to avoid that a new port starts out with introducing
more instances of that. You want to properly separate INVALID_MFN from
"invalid MFN", where the latter means any MFN where either nothing
exists at all, or (see mfn_valid()) where no struct page_info exists.

Jan

