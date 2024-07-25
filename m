Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A593BF13
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 11:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764886.1175456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWuk8-0003LM-AA; Thu, 25 Jul 2024 09:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764886.1175456; Thu, 25 Jul 2024 09:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWuk8-0003IK-6y; Thu, 25 Jul 2024 09:26:36 +0000
Received: by outflank-mailman (input) for mailman id 764886;
 Thu, 25 Jul 2024 09:26:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/1nn=OZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWuk7-0003H4-3H
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 09:26:35 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbe45370-4a67-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 11:26:34 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a22f09d976so3105574a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 02:26:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23704sm52494266b.3.2024.07.25.02.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 02:26:33 -0700 (PDT)
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
X-Inumbo-ID: fbe45370-4a67-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721899593; x=1722504393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vrKoZlQWrKJ4ZNG6GJimcEMPC3rmfVGwlDySbp2Xgig=;
        b=B04aOntqYFq0nNS9w1RGgmhBwn5XIc94+tn6gYxILr1hYLmDERCyD4Z6Jb1wIlwC4E
         8ga8VCbAIRD2IDL1F9CK+vGxl0bupHmbPtaGRAEg7gf5aYiL8Y6JzHHlRjU3Uvyu5eLP
         JqRwb4IYdhD8mW2fazmmiLXsStoYKMRq7w5a1TE9XYuzE3HrQyW3EtmU5OHghk6nr7jV
         P6PJd7RSYOhfAlVa1p2QKQw6EWfPpJjSaG4x3hk+r1ciVud8dzUSaVg5aD/6jbgKO42a
         t+uvvyQzKIJWEYct9qABVVos29vNCoGUt2TOlx1jyE8lTE5h2+4fIKrMRo5CzVdFpaYY
         ur7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721899593; x=1722504393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrKoZlQWrKJ4ZNG6GJimcEMPC3rmfVGwlDySbp2Xgig=;
        b=RsG1xWMCldKuVz1I415zaw1qMeS6uWvn/eesxYbpZyHYNgDNQANL/Fst8mWwKjeg0u
         cqf9zd+MALp3M3v7Y+oUxKmNSBoc8fGBIppfkScuKi4n6CU608aKmy9B57XEVDmo3RcT
         9TFfTFGCJIJNtvkkKi0vLjcRS1rzUu84+T4pouhBb/7G8gnBiyrAEeZtDirqa6rBlRX/
         SE2stdCEymJIJ5Pj6SsDIqjz1QbxqC3DSVQsCTLxQ/bm8cyD1HFHNlV8inyErgdrDrBj
         xxbzB84/x/iJfmVE/MyKVP/YH1Iv/CybELEMqZPJLmpKW1tiGA4p1NBrUZlEd+Jx8Qmq
         NYpg==
X-Forwarded-Encrypted: i=1; AJvYcCW79Ft156eEhymn+OnF/Qf/NISM/YZG3eNOkmCPZPCc098K5rUdouPTQUeBsHudxjKM+p0UzLbYec6wOcyC3FN/Ddx1gghyf1zEElqYjr4=
X-Gm-Message-State: AOJu0YySne5QcDW1SbdGAEqiZBNACCvri28CZjjAaGMAFZDtZWiNDFph
	bRmLI37n2klNtOKfaJRpzFEHz9FVs99FMb17NfceFWGX1/LaJyLr83u0Q1PvoA==
X-Google-Smtp-Source: AGHT+IFJv0zBeXKluJDR88ArbTGz73U2lP//S71kp1O41735aGelOW8Q9zsHFvydutyn+qUzhyBWlg==
X-Received: by 2002:a17:907:7244:b0:a77:c051:36a9 with SMTP id a640c23a62f3a-a7ac44e144amr265540066b.9.1721899593550;
        Thu, 25 Jul 2024 02:26:33 -0700 (PDT)
Message-ID: <7588feb4-dc42-4bf3-85db-7aaac201a2ff@suse.com>
Date: Thu, 25 Jul 2024 11:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] x86/mm: add API for marking only part of a MMIO
 page read only
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.66bd16d0134f9664ea3e0f4d56f7c127afc308c8.1721704980.git-series.marmarek@invisiblethingslab.com>
 <4bea5034cda37f35cd04115bebcccb52e3ea719e.1721704980.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <4bea5034cda37f35cd04115bebcccb52e3ea719e.1721704980.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.07.2024 05:24, Marek Marczykowski-Górecki wrote:
> +static int __init subpage_mmio_ro_add_page(
> +    mfn_t mfn,
> +    unsigned int offset_s,
> +    unsigned int offset_e)
> +{
> +    struct subpage_ro_range *entry = NULL;
> +    bool new_entry = false;
> +    unsigned int i;
> +
> +    entry = subpage_mmio_find_page(mfn);
> +    if ( !entry )
> +    {
> +        entry = xzalloc(struct subpage_ro_range);
> +        if ( !entry )
> +            return -ENOMEM;
> +        entry->mfn = mfn;
> +        list_add(&entry->list, &subpage_ro_ranges);
> +        new_entry = true;
> +    }
> +
> +    for ( i = offset_s; i <= offset_e; i += MMIO_RO_SUBPAGE_GRAN )
> +    {
> +        bool oldbit = __test_and_set_bit(i / MMIO_RO_SUBPAGE_GRAN,
> +                                         entry->ro_elems);
> +        ASSERT(!oldbit);
> +    }
> +
> +    return new_entry ? 0 : 1;

Imo simply !new_entry would be more concise.

> +int __init subpage_mmio_ro_add(
> +    paddr_t start,
> +    size_t size)
> +{
> +    mfn_t mfn_start = maddr_to_mfn(start);
> +    paddr_t end = start + size - 1;
> +    mfn_t mfn_end = maddr_to_mfn(end);
> +    unsigned int offset_end = 0;
> +    int rc;
> +    bool subpage_start, subpage_end;
> +
> +    /*
> +     * In release, build unaligned start will protect larger area,

I think the first comma wants to move past "build".

> +     * so tolerate it.
> +     * But unaligned size would result in smaller area, so deny it.
> +     */
> +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> +        return -EINVAL;

I hoped you would, when adding the comment, recall an earlier comment of
mine: If you want to tolerate mis-aligned start in release builds, you
need to make further adjustments to the subsequent logic (at which
point the respective assertion may become pointless); see below. While
things may work okay without (I didn't fully convince myself either way),
the main point here is that you want to make sure we test in debug builds
what's actually used in release one. Hence subtleties like this would
better be dealt with uniformly between release and debug builds.

> +    if ( !size )
> +        return 0;
> +
> +    if ( mfn_eq(mfn_start, mfn_end) )
> +    {
> +        /* Both starting and ending parts handled at once */
> +        subpage_start = PAGE_OFFSET(start) || PAGE_OFFSET(end) != PAGE_SIZE - 1;
> +        subpage_end = false;
> +    }
> +    else
> +    {
> +        subpage_start = PAGE_OFFSET(start);
> +        subpage_end = PAGE_OFFSET(end) != PAGE_SIZE - 1;
> +    }

Neither of the two subpage_start calculations is correct when start is
misaligned, but within the first 8 bytes of a page.

Jan

