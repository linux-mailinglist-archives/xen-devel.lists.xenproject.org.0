Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB48DC67CD8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 07:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164422.1491388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFfR-0000fd-B3; Tue, 18 Nov 2025 06:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164422.1491388; Tue, 18 Nov 2025 06:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFfR-0000dR-7z; Tue, 18 Nov 2025 06:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1164422;
 Tue, 18 Nov 2025 06:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLFfP-0000dL-WB
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 06:58:20 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6273e8f-c44b-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 07:58:18 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42b2a0c18caso2658326f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 22:58:18 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a80:314a:d80f:dc29:6f97?
 (p200300cab70c6a80314ad80fdc296f97.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a80:314a:d80f:dc29:6f97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f2084dsm30917727f8f.42.2025.11.17.22.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 22:58:17 -0800 (PST)
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
X-Inumbo-ID: f6273e8f-c44b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763449097; x=1764053897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yLScSLEPsZrg35Qd7AVFqHRO+dbmG9wCDaTv26kQemI=;
        b=QpOhqGCunAOswkVnrx++L3dqFYbVbIEMp1q2qzIZldiVP5oSd8OEr8PJu9a0Iau01K
         WBULOmaxKSa+hAk7TNa+H0TDYD63veDG5CJTC2GqBiSSzJ8EZMEkpFz3QTKf4dQdbqR8
         YWAFjAEPynkwSk92rFsb9XXxaQm9bNeytBjRXwpFh/s5bw+/T+Ceb8wCuw/bwz6MV+Sg
         S/5gcZXrt2cs3Kps0KCyJ+QmawG9NZBBZK+CEJJXfMxEl49QF8Beky2UyjTgI3kVuVii
         KWPfbEHcOUO66YSlkTLL7jfxmhiTmw8oVlDI4MP8iMckzK8sYHywUYXgxHPuDsTvwSCe
         uGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763449097; x=1764053897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLScSLEPsZrg35Qd7AVFqHRO+dbmG9wCDaTv26kQemI=;
        b=EPSl5aEIU9jt17qxgk1hLbZlEaNyOVmkHdzMFwK08zYcbaIVMg5NyCuA7TS4ikskSR
         PJ1Nf65B7tm2FcLDWvle0besOshFHVZWFk5Hq58Dz2KUhc/14sIwA01XBF7lLm6VMdg0
         rLSbhyof96fw+0miWH4cJoKnk3bvAzlW+m//Jf/BlRaWDCR1HB+Zj9sAcqvnzp7BHf1W
         U8Sc0BJrMbq1lpmbagGRX4e4e8e4DZymcg+c0I+JxspWRs3Z6j2GYI0AkxSdHhei2Ifg
         MS9NCJvzon7/CEOKWpKEKFoGgIGTegzUsZygYMbggKviBZBBj4o1RzEHzUns3t+/xq0M
         5W4g==
X-Forwarded-Encrypted: i=1; AJvYcCWDYWo7qqKaV9EgoezQM8x+9nUeVBieOdKrYFbfqMkdNQwktr9/xtcX1xJ0tGzm8slLiAEQqm7zjDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAinpoSYKcSF/tmu1Da20u4RAFvYOMLkydTA2BV5lA4uMgHw/7
	N8En1WAairUPAaEe7dzYp3CAeUEOS28p2zMxIRdExn1xuZhB2ZpP7F+rehdELwPyyA==
X-Gm-Gg: ASbGncts2FhwVo1rcx0AEpAPfZWuygBbn2/u3UJNUHBNs23IBn1JVV3nkGTsSpYF4Aw
	Tjhx7bwFCHHSGxdkXDmMAwy547S5Y0/ZmZdqGqow0nZ+0lNXfv4Jd5ZelTbXTduuXIItE0XEtAy
	QgOAkT1As0oUZnQuvs8gT5u8XmzNd3ePMWFyo58jTE6d3BKOKopCTp+uwqkI183lgM6F6Lc8VD+
	m1NEf17j25uCjnGWMKwIptoPm5F1vMTXvIebchHYAW5DmQPdud2r/eCqhHxVTVia4zncrF0cAMP
	K4CIulp8E1Z6UuINAX0EmIsPXGf+KmFI8JUs/K627Jm3UBH7pF9HbSx8DkeDNva5U6NbHx+qFAW
	oRr+V9C9Mm2sPpSRGboYnw9HMreLNmQJfqTxBcF+vWO30dxuLBpkHBoWrZkfhKo/dgjCC0cmnIW
	M75vOz1sJXFUQa6YKERIoDYLmGRoKWmueISgTnyn5v/fc9FFf1BMhoF1puxmeugkCFucYTLSpbN
	j7v2aUTfIr5rCowOgtO5Sz6VIlWgEoeUnTB8pVhMur2buGj
X-Google-Smtp-Source: AGHT+IG2qFhieg+0OXcOKRUz9n6bMMJONxwuueDKHMQdb0pawwaJcwxjXgrzKMmrogMvnlVU14sMoA==
X-Received: by 2002:a05:6000:310b:b0:3eb:9447:b97a with SMTP id ffacd0b85a97d-42b595b8004mr15365601f8f.54.1763449097417;
        Mon, 17 Nov 2025 22:58:17 -0800 (PST)
Message-ID: <6f431394-5c08-4974-85ae-4b38f1975289@suse.com>
Date: Tue, 18 Nov 2025 07:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 18/18] xen/riscv: introduce metadata table to store
 P2M type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <d291d2efe7dcc6ddd3d16677a81c57d755c7ada2.1760974017.git.oleksii.kurochko@gmail.com>
 <6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com>
 <5d4ec4d9-b4c1-4365-a343-f42b390da165@gmail.com>
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
In-Reply-To: <5d4ec4d9-b4c1-4365-a343-f42b390da165@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.11.2025 20:51, Oleksii Kurochko wrote:
> On 11/12/25 12:49 PM, Jan Beulich wrote:
>> On 20.10.2025 17:58, Oleksii Kurochko wrote:
>>> +    if ( *md_pg )
>>> +        metadata = __map_domain_page(*md_pg);
>>> +
>>> +    if ( t < p2m_first_external )
>>> +    {
>>>           pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>   -    return rc;
>>> +        if ( metadata )
>>> +            metadata[ctx->index].pte = p2m_invalid;
>> Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
>> p2m_alloc_page()'s clearing of the page won't have the intended effect?
> 
> I think that, at least, at the moment we are always explicitly set p2m type and
> do not rely on that by default 0==p2m_invalid.

You don't, and ...

> Just to be safe, I will add after "if ( metadata )" suggested
> BUILD_BUG_ON(p2m_invalid):
>         if ( metadata )
>             metadata[ctx->index].type = p2m_invalid;
>                 /*
>          * metadata.type is expected to be p2m_invalid (0) after the page is
>          * allocated and zero-initialized in p2m_alloc_page().
>          */
>         BUILD_BUG_ON(p2m_invalid);
> ...

... this leaves me with the impression that you didn't read my reply correctly.
p2m_alloc_page() clear the page, thus _implicitly_ setting all entries to
p2m_invalid. That's where the BUILD_BUG_ON() would want to go (the call site,
ftaod).

>>> +    }
>>> +    else
>>> +    {
>>> +        pte->pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
>>> +
>>> +        metadata[ctx->index].pte = t;
>> If you set t to p2m_ext_storage here, the pte->pte updating could be moved ...
> 
> 't' shouldn't be passed as 'p2m_ext_storage'.

Of course not. I said "set", not "pass". I suggested to set t to p2m_ext_storage
right after the assignment above. I notice though that I missed ...

> For example, in this case we will have that in metadata page we will have type
> equal to p2m_ext_storage and then in pte->pte will have the type set to
> p2m_ext_storage, and the we end that we don't have a real type stored somewhere.
> Even more, metadata.pte shouldn't be used to store p2m_ext_storage, only
> p2m_invalid and types mentioned in enum p2m_t after p2m_ext_storage.
> 
>>
>>> +    }
>> ... here, covering both cases. Overally this may then be easier as
>>
>>      if ( t >= p2m_first_external )
>>          metadata[ctx->index].pte = t;

... the respective line (and the figure braces which are the needed) here:

        t = p2m_ext_storage;

>>      else if ( metadata )
>>          metadata[ctx->index].pte = p2m_invalid;
>>
>>      pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>
>> Then raising the question whether it couldn't still be the real type that's
>> stored in metadata[] even for t < p2m_first_external. That woiuld further
>> reduce conditionals.
> 
> It would be nice, but I think that at the moment we can’t do that. As I explained
> above, 't' should not normally be passed as p2m_ext_storage.

Of course not, but how's that relevant to storing the _real_ type in the
metadata page even when it's one which can also can be stored in the PTE?
As said, for a frequently used path it may help to reduce the number of
conditionals here.

>>> +static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
>>> +
>>> +/*
>>> + * Free page table's page and metadata page linked to page table's page.
>>> + */
>>> +static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
>>> +{
>>> +    if ( tbl_pg->v.md.pg )
>>> +        p2m_free_page(p2m, tbl_pg->v.md.pg);
>> To play safe, maybe better also clear tbl_pg->v.md.pg?
> 
> I thought it would be enough to clear it during allocation in p2m_alloc_page(),
> since I'm not sure it is critical if md.pg data were somehow leaked and read.
> But to be safer, we can add this here:
>    clear_and_clean_page(tbl_pg->v.md.pg, p2m->clean_dcache);

I didn't say clear what tbl_pg->v.md.pg points to, though. I suggested to clear
the struct field itself.

>>> @@ -749,6 +849,10 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>>       unsigned int next_level = level - 1;
>>>       unsigned int level_order = P2M_LEVEL_ORDER(next_level);
>>>   +    struct p2m_pte_ctx p2m_pte_ctx;
>> I think this would better be one variable instance per scope where it's needed,
>> and then using an initzializer. Or else ...
>>
>>> +    /* Init with p2m_invalid just to make compiler happy. */
>>> +    p2m_type_t old_type = p2m_invalid;
>>> +
>>>       /*
>>>        * This should only be called with target != level and the entry is
>>>        * a superpage.
>>> @@ -770,6 +874,19 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>>         table = __map_domain_page(page);
>>>   +    if ( MASK_EXTR(entry->pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
>>> +    {
>>> +        p2m_pte_ctx.pt_page = tbl_pg;
>>> +        p2m_pte_ctx.index = offsets[level];
>>> +        /*
>>> +         * It doesn't really matter what is a value for a level as
>>> +         * p2m_get_type() doesn't need it, so it is initialized just in case.
>>> +         */
>>> +        p2m_pte_ctx.level = level;
>>> +
>>> +        old_type = p2m_get_type(*entry, &p2m_pte_ctx);
>>> +    }
>>> +
>>>       for ( i = 0; i < P2M_PAGETABLE_ENTRIES(next_level); i++ )
>>>       {
>>>           pte_t *new_entry = table + i;
>>> @@ -781,6 +898,15 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>>           pte = *entry;
>>>           pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
>>>   +        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
>>> +        {
>>> +            p2m_pte_ctx.pt_page = page;
>>> +            p2m_pte_ctx.index = i;
>>> +            p2m_pte_ctx.level = next_level;
>> ... why are the loop-invariat fields not filled ahead of the loop here?
> 
> Actually, they could be filled before the loop. If I move the initialization of
> p2m_pte_ctx.pt_page and p2m_pte_ctx.level ahead of the loop, does it still make
> sense to have a separate variable inside
> "if (MASK_EXTR(entry->pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage)"?

No, it's one of the two - scope limited variable within the loop, or wider-scope
variable with loop-invariant fields set ahead of the loop.

Jan

