Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB1FBA2A04
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 09:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131122.1470331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22Ye-00038m-Kv; Fri, 26 Sep 2025 07:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131122.1470331; Fri, 26 Sep 2025 07:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22Ye-00036Q-Hc; Fri, 26 Sep 2025 07:07:56 +0000
Received: by outflank-mailman (input) for mailman id 1131122;
 Fri, 26 Sep 2025 07:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v22Yc-00036K-OI
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 07:07:54 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84f316e5-9aa7-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 09:07:53 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-62faeed4371so2503703a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 00:07:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634c35ae6afsm36316a12.51.2025.09.26.00.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 00:07:52 -0700 (PDT)
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
X-Inumbo-ID: 84f316e5-9aa7-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758870472; x=1759475272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe3bt3rkV9A+PuHOZ7dOcd39UK1d6aX6LjaRjBMORfc=;
        b=O1Iyd9cpfaoCn93tFbfpMfnpg5IIFd/+VEffFomkBVaQCE7v6VGz21GEtVCHYY8cQU
         32onWrK2dITMkStM719tC8jTpSOnvexiLU9aVc79kC6ubNGM6s/fb5az0bCqhRUoXpZ0
         uXKSU0nsfI+vo7+FpVPCUIeIVllzOrBX2dJfFVTJVav8c7z1nKu1HnAQWTuk8RPlHrws
         ARx713bfVjl/3Vv7BKkG+ujWXRwyV9Cf8JGzXD09VQxIyBZFK8XcbzZJ0QZgGuyhk84J
         /C2gOO9DJdMklro85Uihxj59lB3y1qICiswLtHCX/lAk04agI5fnm6u55TDsjFMaQJ1U
         Q8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870472; x=1759475272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe3bt3rkV9A+PuHOZ7dOcd39UK1d6aX6LjaRjBMORfc=;
        b=hE2IK4K9mCs+lon4GsbsUoGUmR+CUD/AJ+lBJl6FwyfMlybUvOnadolajhoI2UUPEI
         AaIhN9jk9NUPJ5aLGZhHCh+tNIvZTVB8pWC1LRGMqpxk3bgs1yGGu06JqTpZBTTDyBcW
         qyGwRIo+2/ceIi8u9+OxizB0oUo9x1BUy1CCN3Pm+p/+DY+PxX+hUSf1CdQUmNrsk0/A
         5FHC30igiK/lSMoEFq/+Hxci2m2QjIcDliT5fWKUhmmyBoHMx+tD9qYTPNgNiY52fm/z
         13nnB0RzGrSNeEKadOtcJ1sEyUAZUOHP4ZZN20UCfjOc8I4Ul46cELs2s5F85B0DRth/
         TATg==
X-Forwarded-Encrypted: i=1; AJvYcCVMZ97rho6uVlcL/TxTASD/RX+HwrDW4zulC8NPVAMcLIQjJknGaix3tMAyW6bli+SMae9Kyj8Z1rc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw635SaWXU91c/KNEHGkCCQvhbPLiCqPq08V8dSGvUm/iuk55eg
	nqoifNu4zWT0Q9tpv04ClabF8FzuFxTT44OdbahiKsNXB9BducXUWlsccqenrniUcw==
X-Gm-Gg: ASbGnctihDSMWr3VPn3Mfhy3uFwswchMBSyCRXtuX/BMxuJC2ol4q7surk6YDiwjWnp
	yxySrI79Y8z2Dn236XRvgql1DDIvSe/5q1RmPNk9mgHsO5+/ud9caSGMfnV2kZUJqiRhKcqrngN
	trwlWlOddSBqiwJye+TzbHUMrraqTliYG4j4vuJLPX2rKyjqOLgEqQbKY+SAGuOgPeyL1fuWhvF
	F3xQ/V42BkG+fEJjurTno/vFFAPrXgWOzlOaO8Hn59zPL40X295XCCrn3S96CNkxCjywnwHdu3j
	ptCDbYKmTWz8dcvsPUwSW3MOigRXE+vnZJC0fZ/EKpEB+k+ZblDfoB09DFxQgIcuw5SETpX2FjM
	4heM5j4Dt/EwiilDGCkmxRxIbvzuDe2VapHcTbbr/L0hKMDXwt0VXYxkU6W1yYMrrviUdCBZe3P
	20ro6+dm5h6DOSJhUxGQ==
X-Google-Smtp-Source: AGHT+IH2L1TcKSHnhF/098Yya8erV+kjS1wsmyQTUiGCNaWaGJnmBTlA9Qm1qN22WWJ3Ah+TCySfVA==
X-Received: by 2002:a05:6402:4381:b0:62f:ce1f:3a2f with SMTP id 4fb4d7f45d1cf-6349f9ef060mr5648945a12.10.1758870472340;
        Fri, 26 Sep 2025 00:07:52 -0700 (PDT)
Message-ID: <6b62cf4c-8367-47dc-9911-206c220fb050@suse.com>
Date: Fri, 26 Sep 2025 09:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/18] xen/riscv: implement p2m_set_range()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <5e325267a792a9a0f4cb387b4e3287d22dc8d173.1758145428.git.oleksii.kurochko@gmail.com>
 <6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com>
 <a5c016c9-aee4-4a86-a6cc-0d89dd5e9216@gmail.com>
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
In-Reply-To: <a5c016c9-aee4-4a86-a6cc-0d89dd5e9216@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2025 22:08, Oleksii Kurochko wrote:
> On 9/20/25 1:36 AM, Jan Beulich wrote:
>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>> +static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>> +{
>>> +    unsigned long root_table_indx;
>>> +
>>> +    root_table_indx = gfn_x(gfn) >> P2M_LEVEL_ORDER(P2M_ROOT_LEVEL);
>>> +    if ( root_table_indx >= P2M_ROOT_PAGES )
>>> +        return NULL;
>>> +
>>> +    /*
>>> +     * The P2M root page table is extended by 2 bits, making its size 16KB
>>> +     * (instead of 4KB for non-root page tables). Therefore, p2m->root is
>>> +     * allocated as four consecutive 4KB pages (since alloc_domheap_pages()
>>> +     * only allocates 4KB pages).
>>> +     *
>>> +     * To determine which of these four 4KB pages the root_table_indx falls
>>> +     * into, we divide root_table_indx by
>>> +     * P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1).
>>> +     */
>>> +    root_table_indx /= P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1);
>> The subtraction of 1 here feels odd: You're after the root table's
>> number of entries, i.e. I'd expect you to pass just P2M_ROOT_LEVEL.
>> And the way P2M_PAGETABLE_ENTRIES() works also suggests so.
> 
> The purpose of this line is to select the page within the root table, which
> consists of 4 consecutive pages. However, P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL)
> returns 2048, so root_table_idx will always be 0 after devision, which is not
> what we want.
> 
> As an alternative, P2M_PAGETABLE_ENTRIES(0) could be used, since it always
> returns 512. Dividing root_table_idx by 512 then yields the index of the page
> within the root table, which is made up of 4 consecutive pages.
> 
> Does it make sense now?

Yes and no. I understand what you're after, but that doesn't make the use of
P2M_PAGETABLE_ENTRIES() (with an arbitrary level as argument) correct. This
calculation wants doing by solely using properties of the top level.

> The problem may occur with DECLARE_OFFSET(), which can produce an incorrect
> index within the root page table. Since the index is in the range [0, 2047],
> it becomes an issue if the value is greater than 511, because DECLARE_OFFSET()
> does not account for the larger range of the root index.
> 
> I am not sure whether it is better to make DECLARE_OFFSET() generic enough
> for both P2M and Xen page tables, or to provide a separate P2M_DECLARE_OFFSET()
> and use it only in P2M-related code.
> Also, it could be an option to move DECLARE_OFFSET() from asm/page.h header
> to riscv/pt.c and define another one DECLARE_OFFSETS in riscv/p2m.c.
> 
> Do you have a preference?

Not really, no. I don't like DECLARE_OFFSETS() anyway.

>>> +static int p2m_set_entry(struct p2m_domain *p2m,
>>> +                           gfn_t gfn,
>>> +                           unsigned long page_order,
>>> +                           mfn_t mfn,
>>> +                           p2m_type_t t)
>> Nit: Indentation.
>>
>>> +{
>>> +    unsigned int level;
>>> +    unsigned int target = page_order / PAGETABLE_ORDER;
>>> +    pte_t *entry, *table, orig_pte;
>>> +    int rc;
>>> +    /*
>>> +     * A mapping is removed only if the MFN is explicitly set to INVALID_MFN.
>>> +     * Other MFNs that are considered invalid by mfn_valid() (e.g., MMIO)
>>> +     * are still allowed.
>>> +     */
>>> +    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
>>> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
>>> +
>>> +    ASSERT(p2m_is_write_locked(p2m));
>>> +
>>> +    /*
>>> +     * Check if the level target is valid: we only support
>>> +     * 4K - 2M - 1G mapping.
>>> +     */
>>> +    ASSERT(target <= 2);
>>> +
>>> +    table = p2m_get_root_pointer(p2m, gfn);
>>> +    if ( !table )
>>> +        return -EINVAL;
>>> +
>>> +    for ( level = P2M_ROOT_LEVEL; level > target; level-- )
>>> +    {
>>> +        /*
>>> +         * Don't try to allocate intermediate page table if the mapping
>>> +         * is about to be removed.
>>> +         */
>>> +        rc = p2m_next_level(p2m, !removing_mapping,
>>> +                            level, &table, offsets[level]);
>>> +        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
>>> +        {
>>> +            rc = (rc == P2M_TABLE_MAP_NONE) ? -ENOENT : -ENOMEM;
>>> +            /*
>>> +             * We are here because p2m_next_level has failed to map
>>> +             * the intermediate page table (e.g the table does not exist
>>> +             * and they p2m tree is read-only).
>> I thought I commented on this or something similar already: Calling the
>> p2m tree "read-only" is imo misleading.
> 
> I will change then "read-only" to "not allocatable".

That'll be only marginally better: What's "allocatable"? Why not something
like "... does not exist and none should be allocated"? Or maybe simply
omit this part of the comment?

>>> +    /*
>>> +     * Free the entry only if the original pte was valid and the base
>>> +     * is different (to avoid freeing when permission is changed).
>>> +     *
>>> +     * If previously MFN 0 was mapped and it is going to be removed
>>> +     * and considering that during removing MFN 0 is used then `entry`
>>> +     * and `new_entry` will be the same and p2m_free_subtree() won't be
>>> +     * called. This case is handled explicitly.
>>> +     */
>>> +    if ( pte_is_valid(orig_pte) &&
>>> +         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
>>> +          (removing_mapping && mfn_eq(pte_get_mfn(*entry), _mfn(0)))) )
>>> +        p2m_free_subtree(p2m, orig_pte, level);
>> I continue to fail to understand why the MFN would matter here.
> 
> My understanding is that if, for the same GFN, the MFN changes fromMFN_1 to
> MFN_2, then we need to update any references on the page referenced by
> |orig_pte| to ensure the proper reference counter is maintained for the page
> pointed to byMFN_1.
> 
>>   Isn't the
>> need to free strictly tied to a VALID -> NOT VALID transition? A permission
>> change simply retains the VALID state of an entry.
> 
> It covers a case when removing happens and probably in this case we don't need
> to check specifically for mfn(0) case "mfn_eq(pte_get_mfn(*entry), _mfn(0))",
> but it would be enough to check that pte_is_valid(entry) instead:
>    ...
>    (removing_mapping && !pte_is_valid(entry)))) )
> 
> Or only check removing_mapping variable as `entry` would be invalided by the
> code above anyway. So we will get:
> +    if ( pte_is_valid(orig_pte) &&
> +         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) || removing_mapping) )
> +        p2m_free_subtree(p2m, orig_pte, level);
> 
> Does it make sense now?

Not really, sorry. Imo the complicated condition indicates that something is
wrong (or at least inefficient) here.

Jan

