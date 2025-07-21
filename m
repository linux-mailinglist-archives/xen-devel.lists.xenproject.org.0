Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D4B0C07E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051299.1419624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udn3T-0008Jb-NI; Mon, 21 Jul 2025 09:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051299.1419624; Mon, 21 Jul 2025 09:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udn3T-0008IM-Jr; Mon, 21 Jul 2025 09:43:31 +0000
Received: by outflank-mailman (input) for mailman id 1051299;
 Mon, 21 Jul 2025 09:43:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ESUV=2C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1udn3R-0008IE-TB
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:43:30 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27a82ead-6617-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 11:43:28 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ae0bc7aa21bso807644366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 02:43:28 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca2ee01sm649198466b.81.2025.07.21.02.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 02:43:26 -0700 (PDT)
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
X-Inumbo-ID: 27a82ead-6617-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753091008; x=1753695808; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzDVdX87Qbv9JpyAkUKVZmr1mn9hwOfDvgr6OUFMBCE=;
        b=mq4Ia6qy9fVVoQ9Dz/jlkqh1zIjWa/64UauQ443i4YSyjTxFVs6BW2a5XO7OirNHKc
         fg8FVJ6i02DBDY7Kz9Cj3eoekAmhPTvVOkJrgg1mu9ziXH9uwtJDWHLAZi+GS5tfv4kF
         4sGluqrJSP3Jrg2jNg86TeaNxf91uB6TWlT2g0qPMWmClpGFE9PpFwM3o8gl3NVweVC+
         zBdo2GYLDHvIyQ0N0Pwyb5wNbI3txFoi+qtkv5rB+TAFN8Pc/ju0gZ22Fyr97mqT7NK1
         ih2LA86fmKKSXrK+3eQR+QcA/jU75KKhOWNRsobtVMmN6/FKWYFBuMaOuBOX+tClY2RO
         p4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753091008; x=1753695808;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KzDVdX87Qbv9JpyAkUKVZmr1mn9hwOfDvgr6OUFMBCE=;
        b=TkhCTOAupXCQzSqj9Wa5QSUIaxxskJF6zfk0ozJa0q1bzB/JUmhrj/cQiU2mN70upl
         wkfZ6nk5XDNOmZkdZIGHjxtc7Q424ozarGZlSdGJf4invJt5auPNpVq2V8mHvttGC9ao
         ZkSU7mmy6phDXMMf8EJS0OTOY9qWFA2Bka6D7wXtHCrYBZgHOLtEhLBS499Q0DUO0u83
         S7N+UigahexSgBIHp4hORK4zL8pX/OE+ZLEHZuAHJRHK9Vq/bBSnvtdFzIGp3ssW4vqj
         zrcmQb+8eiLoUOTGsM/FdzGwZ/hPqCNC7lCIeQAc5ZkgVRpypfAae6kqjRD9KMFQ0wq5
         kYCA==
X-Forwarded-Encrypted: i=1; AJvYcCUobqE5twaPjSCkgdPOu0i238fuNIKEDdoddmIrV5kKn9H+L2EK7feb59Ou3vQ+9yFTsJXb436RmQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztFe9eTyLapiLYqYh5MK6ZztaGyDdzDS4tddm4yKoojqoFQzjx
	pi/VYAV+MLWhVWz3Yn51oYz7iMY64sVUcNFWaRiJ7WaSd3l1gSHtIqwp
X-Gm-Gg: ASbGncuYQmN/PN7m67DN8a19wSWDAKuuJA2gfS33m51XZp6AW++G9tmWhr9GVhTxARE
	eail0AZAcPTOUA0Moxwvvdc8G3ccuz9R95aTm36CSMrglJ9Z7lFyLvtXzEd+L5cc5CKr6MLLrta
	DD2MOQTIiDlrtnrwf1RJzrh20VLNffphSmCXUgLIq034jja1PQiE6ZkveV3qaD6QiAN2KoKF7iV
	VU4XXuEozb5aI7T8YY5NZV+4KRXrAG/PJt04d8MjdTG8qJ90xodKGJyWtCGB+HkY0gNe9B5TBOS
	nGTZjgWavflHNCU1f7izcnVAP19uqpmgvd24LkDRE+9c3k71fZs44SujcN9Dm8eefO1V5HX2SlD
	FyiaozCkupD/dXgKWtuX+6zcEMtu49Nza/3stEh8Z+IX8FLKqLmdzxJ4sKeGmQfcpT8+jUxXyQD
	w0e8h/ig==
X-Google-Smtp-Source: AGHT+IHIZRTPolT7dH80zAeg/ip8LCm9kKOnLSpAnd6BQbeFdHAbnjxhKczcI44JFV0VMh/c/Kw3pQ==
X-Received: by 2002:a17:907:c008:b0:ae3:b94b:36f5 with SMTP id a640c23a62f3a-ae9ce0d2fb2mr1623323266b.34.1753091007308;
        Mon, 21 Jul 2025 02:43:27 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------8NmhJIJp1a04v4k7mor4eVRL"
Message-ID: <d4cc7511-da13-4f29-87f7-e799b533a4ac@gmail.com>
Date: Mon, 21 Jul 2025 11:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 17/17] xen/riscv: add support of page lookup by GFN
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <6281efb0dc9b0a9ab4dd8cee7952bff2a7745963.1749555949.git.oleksii.kurochko@gmail.com>
 <c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com>
Content-Language: en-US
In-Reply-To: <c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com>

This is a multi-part message in MIME format.
--------------8NmhJIJp1a04v4k7mor4eVRL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/2/25 1:44 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> Introduce helper functions for safely querying the P2M (physical-to-machine)
>> mapping:
>>   - add p2m_read_lock(), p2m_read_unlock(), and p2m_is_locked() for managing
>>     P2M lock state.
>>   - Implement p2m_get_entry() to retrieve mapping details for a given GFN,
>>     including MFN, page order, and validity.
>>   - Add p2m_lookup() to encapsulate read-locked MFN retrieval.
>>   - Introduce p2m_get_page_from_gfn() to convert a GFN into a page_info
>>     pointer, acquiring a reference to the page if valid.
>>
>> Implementations are based on Arm's functions with some minor modifications:
>> - p2m_get_entry():
>>    - Reverse traversal of page tables, as RISC-V uses the opposite order
>>      compared to Arm.
>>    - Removed the return of p2m_access_t from p2m_get_entry() since
>>      mem_access_settings is not introduced for RISC-V.
> Didn't I see uses of p2m_access in earlier patches? If you don't mean to have
> that, then please consistently {every,no}where.

Yes, it was used. I think it would be better just usage of p2m_access from earlier
patches.

>>    - Updated BUILD_BUG_ON() to check using the level 0 mask, which corresponds
>>      to Arm's THIRD_MASK.
>>    - Replaced open-coded bit shifts with the BIT() macro.
>>    - Other minor changes, such as using RISC-V-specific functions to validate
>>      P2M PTEs, and replacing Arm-specific GUEST_* macros with their RISC-V
>>      equivalents.
>> - p2m_get_page_from_gfn():
>>    - Removed p2m_is_foreign() and related logic, as this functionality is not
>>      implemented for RISC-V.
> Yet I expect you'll need this, sooner or later.

Then I'll add correspondent code in this patch.

>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1055,3 +1055,134 @@ int guest_physmap_add_entry(struct domain *d,
>>   {
>>       return p2m_insert_mapping(d, gfn, (1 << page_order), mfn, t);
>>   }
>> +
>> +/*
>> + * Get the details of a given gfn.
>> + *
>> + * If the entry is present, the associated MFN will be returned and the
>> + * access and type filled up. The page_order will correspond to the
> You removed p2m_access_t * from the parameters; you need to also update
> the comment then accordingly.
>
>> + * order of the mapping in the page table (i.e it could be a superpage).
>> + *
>> + * If the entry is not present, INVALID_MFN will be returned and the
>> + * page_order will be set according to the order of the invalid range.
>> + *
>> + * valid will contain the value of bit[0] (e.g valid bit) of the
>> + * entry.
>> + */
>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>> +                           p2m_type_t *t,
>> +                           unsigned int *page_order,
>> +                           bool *valid)
>> +{
>> +    paddr_t addr = gfn_to_gaddr(gfn);
>> +    unsigned int level = 0;
>> +    pte_t entry, *table;
>> +    int rc;
>> +    mfn_t mfn = INVALID_MFN;
>> +    p2m_type_t _t;
> Please no local variables with leading underscores. In x86 we commonly
> name such variables p2mt.
>
>> +    DECLARE_OFFSETS(offsets, addr);
> This is the sole use of "addr". Is such a local variable really worth having?

Not really, I'll drop it.

>> +    ASSERT(p2m_is_locked(p2m));
>> +    BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);
>> +
>> +    /* Allow t to be NULL */
>> +    t = t ?: &_t;
>> +
>> +    *t = p2m_invalid;
>> +
>> +    if ( valid )
>> +        *valid = false;
>> +
>> +    /* XXX: Check if the mapping is lower than the mapped gfn */
>> +
>> +    /* This gfn is higher than the highest the p2m map currently holds */
>> +    if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
>> +    {
>> +        for ( level = P2M_ROOT_LEVEL; level ; level-- )
> Nit: Stray blank before the 2nd semicolon. (Again at least once below.)
>
>> +            if ( (gfn_x(gfn) & (XEN_PT_LEVEL_MASK(level) >> PAGE_SHIFT)) >
>> +                 gfn_x(p2m->max_mapped_gfn) )
>> +                break;
>> +
>> +        goto out;
>> +    }
>> +
>> +    table = p2m_get_root_pointer(p2m, gfn);
>> +
>> +    /*
>> +     * the table should always be non-NULL because the gfn is below
>> +     * p2m->max_mapped_gfn and the root table pages are always present.
>> +     */
>> +    if ( !table )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        level = P2M_ROOT_LEVEL;
>> +        goto out;
>> +    }
>> +
>> +    for ( level = P2M_ROOT_LEVEL; level ; level-- )
>> +    {
>> +        rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
>> +        if ( (rc == GUEST_TABLE_MAP_NONE) && (rc != GUEST_TABLE_MAP_NOMEM) )
> This condition looks odd. As written the rhs of the && is redundant.

And it is wrong. It should:
  if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )

>> +            goto out_unmap;
>> +        else if ( rc != GUEST_TABLE_NORMAL )
> As before, no real need for "else" in such cases.
>
>> +            break;
>> +    }
>> +
>> +    entry = table[offsets[level]];
>> +
>> +    if ( p2me_is_valid(p2m, entry) )
>> +    {
>> +        *t = p2m_type_radix_get(p2m, entry);
> If the incoming argument is NULL, the somewhat expensive radix tree lookup
> is unnecessary here.

Good point.

>> +        mfn = pte_get_mfn(entry);
>> +        /*
>> +         * The entry may point to a superpage. Find the MFN associated
>> +         * to the GFN.
>> +         */
>> +        mfn = mfn_add(mfn,
>> +                      gfn_x(gfn) & (BIT(XEN_PT_LEVEL_ORDER(level), UL) - 1));
>> +
>> +        if ( valid )
>> +            *valid = pte_is_valid(entry);
> Interesting. Why not the P2M counterpart of the function? Yes, the comment
> ahead of the function says so, but I don't see why the valid bit suddenly
> is relevant here (besides the P2M type).

This valid variable is expected to be used in the caller (something what Arm does here
https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/p2m.c#L375) to check if
it is needed to do flush_page_to_ram(), so if the the valid bit in PTE was set to 0
then it means nothing should be flushed as entry wasn't used as it marked invalid.

>> +    }
>> +
>> +out_unmap:
>> +    unmap_domain_page(table);
>> +
>> +out:
> Nit: Style (bot labels).
>
>> +    if ( page_order )
>> +        *page_order = XEN_PT_LEVEL_ORDER(level);
>> +
>> +    return mfn;
>> +}
>> +
>> +static mfn_t p2m_lookup(struct domain *d, gfn_t gfn, p2m_type_t *t)
> pointer-to-const for the 1st arg? But again more likely struct p2m_domain *
> anyway?

|struct p2_domain| would be better, but I’m not really sure that a
pointer-to-const can be used here. I expect that, in that case,
|p2m_read_lock()| would also need to accept a pointer-to-const, and since it
calls|read_lock()| internally, that could be a problem because|read_lock() |accepts a|rwlock_t *l|.

>> +{
>> +    mfn_t mfn;
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +
>> +    p2m_read_lock(p2m);
>> +    mfn = p2m_get_entry(p2m, gfn, t, NULL, NULL);
>> +    p2m_read_unlock(p2m);
>> +
>> +    return mfn;
>> +}
>> +
>> +struct page_info *p2m_get_page_from_gfn(struct domain *d, gfn_t gfn,
> Same here - likely you mean struct p2m_domain * instead.
>
>> +                                        p2m_type_t *t)
>> +{
>> +    p2m_type_t p2mt = {0};
> Why a compound initializer for something that isn't a compound object?
> And why plain 0 for something that is an enumerated type?

Agree, it should be a compound initializer. I'll drop it.

>
>> +    struct page_info *page;
>> +
>> +    mfn_t mfn = p2m_lookup(d, gfn, &p2mt);
>> +
>> +    if ( t )
>> +        *t = p2mt;
> What's wrong with passing t directly to p2m_lookup()?

It was needed before when the code of p2m_get_page_from_gfn() looked like:
   struct page_info *p2m_get_page_from_gfn(struct domain *d, gfn_t gfn,
                                           p2m_type_t *t)
   {
       struct page_info *page;
       p2m_type_t p2mt;
       mfn_t mfn = p2m_lookup(d, gfn, &p2mt);
   
       if ( t )
           *t = p2mt;
   
       if ( !p2m_is_any_ram(p2mt) )
           return NULL;
So it was needed to make sure that p2m_is_any_ram(*t) doesn't try to dereference
a NULL pointer.

Even with the current one implementation the similar issue could be with if use
*t instead of p2mt:
   struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
                                           p2m_type_t *t)
   {
       ...
       if ( p2m_is_foreign(p2mt) )
       {
           struct domain *fdom = page_get_owner_and_reference(page);

And the second reason it is because of p2m_get_entry() (which is used inside
p2m_lookup()) could return for `t` a pointer to local variable:
   static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
                              p2m_type_t *t,
                              unsigned int *page_order,
                              bool *valid)
   {
       ...
       p2m_type_t p2mt;
       ...
       /* Allow t to be NULL */
       t = t ?: &p2mt;
       ...

What looks wrong. I will remove this part of the code and pass
`t` directly to p2m_lookup().

And after p2m_lookup() call will just check if t argument is NULL then init
it with p2mt:
    struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
                                            p2m_type_t *t)
    {
        struct page_info *page;
        p2m_type_t p2mt = p2m_invalid;
        mfn_t mfn = p2m_lookup(p2m, gfn, t);
    
        if ( !mfn_valid(mfn) )
            return NULL;
    
        if ( !t )
            p2mt = *t;
    
        ...
    }

Thanks.

~ Oleksii

--------------8NmhJIJp1a04v4k7mor4eVRL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/2/25 1:44 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce helper functions for safely querying the P2M (physical-to-machine)
mapping:
 - add p2m_read_lock(), p2m_read_unlock(), and p2m_is_locked() for managing
   P2M lock state.
 - Implement p2m_get_entry() to retrieve mapping details for a given GFN,
   including MFN, page order, and validity.
 - Add p2m_lookup() to encapsulate read-locked MFN retrieval.
 - Introduce p2m_get_page_from_gfn() to convert a GFN into a page_info
   pointer, acquiring a reference to the page if valid.

Implementations are based on Arm's functions with some minor modifications:
- p2m_get_entry():
  - Reverse traversal of page tables, as RISC-V uses the opposite order
    compared to Arm.
  - Removed the return of p2m_access_t from p2m_get_entry() since
    mem_access_settings is not introduced for RISC-V.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Didn't I see uses of p2m_access in earlier patches? If you don't mean to have
that, then please consistently {every,no}where.</pre>
    </blockquote>
    <pre>Yes, it was used. I think it would be better just usage of p2m_access from earlier
patches.

</pre>
    <blockquote type="cite"
      cite="mid:c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">  - Updated BUILD_BUG_ON() to check using the level 0 mask, which corresponds
    to Arm's THIRD_MASK.
  - Replaced open-coded bit shifts with the BIT() macro.
  - Other minor changes, such as using RISC-V-specific functions to validate
    P2M PTEs, and replacing Arm-specific GUEST_* macros with their RISC-V
    equivalents.
- p2m_get_page_from_gfn():
  - Removed p2m_is_foreign() and related logic, as this functionality is not
    implemented for RISC-V.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Yet I expect you'll need this, sooner or later.</pre>
    </blockquote>
    <pre>Then I'll add correspondent code in this patch.
</pre>
    <blockquote type="cite"
      cite="mid:c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1055,3 +1055,134 @@ int guest_physmap_add_entry(struct domain *d,
 {
     return p2m_insert_mapping(d, gfn, (1 &lt;&lt; page_order), mfn, t);
 }
+
+/*
+ * Get the details of a given gfn.
+ *
+ * If the entry is present, the associated MFN will be returned and the
+ * access and type filled up. The page_order will correspond to the
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">You removed p2m_access_t * from the parameters; you need to also update
the comment then accordingly.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * order of the mapping in the page table (i.e it could be a superpage).
+ *
+ * If the entry is not present, INVALID_MFN will be returned and the
+ * page_order will be set according to the order of the invalid range.
+ *
+ * valid will contain the value of bit[0] (e.g valid bit) of the
+ * entry.
+ */
+static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
+                           p2m_type_t *t,
+                           unsigned int *page_order,
+                           bool *valid)
+{
+    paddr_t addr = gfn_to_gaddr(gfn);
+    unsigned int level = 0;
+    pte_t entry, *table;
+    int rc;
+    mfn_t mfn = INVALID_MFN;
+    p2m_type_t _t;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Please no local variables with leading underscores. In x86 we commonly
name such variables p2mt.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    DECLARE_OFFSETS(offsets, addr);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This is the sole use of "addr". Is such a local variable really worth having?</pre>
    </blockquote>
    <pre>Not really, I'll drop it.

</pre>
    <blockquote type="cite"
      cite="mid:c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    ASSERT(p2m_is_locked(p2m));
+    BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);
+
+    /* Allow t to be NULL */
+    t = t ?: &amp;_t;
+
+    *t = p2m_invalid;
+
+    if ( valid )
+        *valid = false;
+
+    /* XXX: Check if the mapping is lower than the mapped gfn */
+
+    /* This gfn is higher than the highest the p2m map currently holds */
+    if ( gfn_x(gfn) &gt; gfn_x(p2m-&gt;max_mapped_gfn) )
+    {
+        for ( level = P2M_ROOT_LEVEL; level ; level-- )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Nit: Stray blank before the 2nd semicolon. (Again at least once below.)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            if ( (gfn_x(gfn) &amp; (XEN_PT_LEVEL_MASK(level) &gt;&gt; PAGE_SHIFT)) &gt;
+                 gfn_x(p2m-&gt;max_mapped_gfn) )
+                break;
+
+        goto out;
+    }
+
+    table = p2m_get_root_pointer(p2m, gfn);
+
+    /*
+     * the table should always be non-NULL because the gfn is below
+     * p2m-&gt;max_mapped_gfn and the root table pages are always present.
+     */
+    if ( !table )
+    {
+        ASSERT_UNREACHABLE();
+        level = P2M_ROOT_LEVEL;
+        goto out;
+    }
+
+    for ( level = P2M_ROOT_LEVEL; level ; level-- )
+    {
+        rc = p2m_next_level(p2m, true, level, &amp;table, offsets[level]);
+        if ( (rc == GUEST_TABLE_MAP_NONE) &amp;&amp; (rc != GUEST_TABLE_MAP_NOMEM) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This condition looks odd. As written the rhs of the &amp;&amp; is redundant.</pre>
    </blockquote>
    <pre>And it is wrong. It should:
 if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
</pre>
    <blockquote type="cite"
      cite="mid:c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            goto out_unmap;
+        else if ( rc != GUEST_TABLE_NORMAL )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">As before, no real need for "else" in such cases.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            break;
+    }
+
+    entry = table[offsets[level]];
+
+    if ( p2me_is_valid(p2m, entry) )
+    {
+        *t = p2m_type_radix_get(p2m, entry);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">If the incoming argument is NULL, the somewhat expensive radix tree lookup
is unnecessary here.</pre>
    </blockquote>
    <pre>Good point.

</pre>
    <blockquote type="cite"
      cite="mid:c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        mfn = pte_get_mfn(entry);
+        /*
+         * The entry may point to a superpage. Find the MFN associated
+         * to the GFN.
+         */
+        mfn = mfn_add(mfn,
+                      gfn_x(gfn) &amp; (BIT(XEN_PT_LEVEL_ORDER(level), UL) - 1));
+
+        if ( valid )
+            *valid = pte_is_valid(entry);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Interesting. Why not the P2M counterpart of the function? Yes, the comment
ahead of the function says so, but I don't see why the valid bit suddenly
is relevant here (besides the P2M type).</pre>
    </blockquote>
    <pre>This valid variable is expected to be used in the caller (something what Arm does here
<a class="moz-txt-link-freetext"
href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/p2m.c#L375">https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/p2m.c#L375</a>) to check if
it is needed to do flush_page_to_ram(), so if the the valid bit in PTE was set to 0
then it means nothing should be flushed as entry wasn't used as it marked invalid.

</pre>
    <blockquote type="cite"
      cite="mid:c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
+
+out_unmap:
+    unmap_domain_page(table);
+
+out:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Nit: Style (bot labels).

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( page_order )
+        *page_order = XEN_PT_LEVEL_ORDER(level);
+
+    return mfn;
+}
+
+static mfn_t p2m_lookup(struct domain *d, gfn_t gfn, p2m_type_t *t)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">pointer-to-const for the 1st arg? But again more likely struct p2m_domain *
anyway?</pre>
    </blockquote>
    <pre><code>struct p2_domain</code> would be better, but I’m not really sure that a
pointer-to-const can be used here. I expect that, in that case,
<code>p2m_read_lock()</code> would also need to accept a pointer-to-const, and since it
calls <code>read_lock()</code> internally, that could be a problem because <code>read_lock()
</code>accepts a <code>rwlock_t *l</code>.

</pre>
    <blockquote type="cite"
      cite="mid:c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    mfn_t mfn;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    p2m_read_lock(p2m);
+    mfn = p2m_get_entry(p2m, gfn, t, NULL, NULL);
+    p2m_read_unlock(p2m);
+
+    return mfn;
+}
+
+struct page_info *p2m_get_page_from_gfn(struct domain *d, gfn_t gfn,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Same here - likely you mean struct p2m_domain * instead.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+                                        p2m_type_t *t)
+{
+    p2m_type_t p2mt = {0};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why a compound initializer for something that isn't a compound object?
And why plain 0 for something that is an enumerated type?</pre>
    </blockquote>
    <pre>Agree, it should be a compound initializer. I'll drop it.

</pre>
    <blockquote type="cite"
      cite="mid:c942d1ad-d3b5-42ed-a26d-5859e3efc93d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    struct page_info *page;
+
+    mfn_t mfn = p2m_lookup(d, gfn, &amp;p2mt);
+
+    if ( t )
+        *t = p2mt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">What's wrong with passing t directly to p2m_lookup()?</pre>
    </blockquote>
    <pre>It was needed before when the code of p2m_get_page_from_gfn() looked like:
  struct page_info *p2m_get_page_from_gfn(struct domain *d, gfn_t gfn,
                                          p2m_type_t *t)
  {
      struct page_info *page;
      p2m_type_t p2mt;
      mfn_t mfn = p2m_lookup(d, gfn, &amp;p2mt);
  
      if ( t )
          *t = p2mt;
  
      if ( !p2m_is_any_ram(p2mt) )
          return NULL;
So it was needed to make sure that p2m_is_any_ram(*t) doesn't try to dereference
a NULL pointer.

Even with the current one implementation the similar issue could be with if use
*t instead of p2mt:
  struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
                                          p2m_type_t *t)
  {
      ...
      if ( p2m_is_foreign(p2mt) )
      {
          struct domain *fdom = page_get_owner_and_reference(page);

And the second reason it is because of p2m_get_entry() (which is used inside
p2m_lookup()) could return for `t` a pointer to local variable:
  static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
                             p2m_type_t *t,
                             unsigned int *page_order,
                             bool *valid)
  {
      ...
      p2m_type_t p2mt;
      ...  
      /* Allow t to be NULL */
      t = t ?: &amp;p2mt;
      ...
</pre>
    <pre>What looks wrong. I will remove this part of the code and pass
`t` directly to p2m_lookup().

And after p2m_lookup() call will just check if t argument is NULL then init
it with p2mt:
   struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
                                           p2m_type_t *t)
   {
       struct page_info *page;
       p2m_type_t p2mt = p2m_invalid;
       mfn_t mfn = p2m_lookup(p2m, gfn, t);
   
       if ( !mfn_valid(mfn) )
           return NULL;
   
       if ( !t )
           p2mt = *t;
   
       ...
   }

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------8NmhJIJp1a04v4k7mor4eVRL--

