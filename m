Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1198A3BCC5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 12:28:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892730.1301687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkiFg-0002vU-PP; Wed, 19 Feb 2025 11:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892730.1301687; Wed, 19 Feb 2025 11:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkiFg-0002sh-Lv; Wed, 19 Feb 2025 11:28:28 +0000
Received: by outflank-mailman (input) for mailman id 892730;
 Wed, 19 Feb 2025 11:28:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkiFf-0002sb-DB
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 11:28:27 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2120680-eeb4-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 12:28:25 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e0813bd105so2573108a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 03:28:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece287d13sm10225161a12.68.2025.02.19.03.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 03:28:24 -0800 (PST)
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
X-Inumbo-ID: a2120680-eeb4-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739964505; x=1740569305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ssJQ1H8Ak0Co7K84F6asV2oUc4v8rORTDw7dkJDetQs=;
        b=T4j1BEd/6QjzYb7kkZxpCnZ4d85cIwM567a11j6x7wgU+qDThWhunQaHlMSWonpWgo
         iQhC8rdjDX8FuC9/beOqBRSXzsCHRzhq/5za3lJ3TMuD98dqtTvHiaTuWytWIt03d1m9
         5G85n+ZK729LE7tKg73coBXpAigMKwOAAB4gwFDh2bRjbDXDQxqxGU87BMjPoUWHdR4W
         T+n/EKztYXLxXqm1B2oFI7Pd5E7m+YAI/KYanmJhk9bsWGeO/3a7AUDoElmiLNrI1Bci
         meBvK+5c847QuIyZQuWIMnGb+DC8CCbbnlWU0YdZ7E2RlAeiUXlMbmM6t03RM07oPTb5
         T2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739964505; x=1740569305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssJQ1H8Ak0Co7K84F6asV2oUc4v8rORTDw7dkJDetQs=;
        b=bcDpDbvLNVckIKYGvJ6X6CWFdmFhMQ8cRm6EtumouJ6xCrzFWvd6uK6G2VfLwUv4UJ
         lS0M+9t6g4XRLiAj3cMoeqb5+MKkWZuC7HSLfuSqdnGS2+ly4QzDRV4oq4I+7Rj33Fko
         fAN73QZN5qruP+nTIVZzTn/Gs8yP+hRDILSPnp5pgVi81uSNA8C8J0SIZYkD1eVR0CYg
         fwiNxT86qVsppCO5AI4CJiSl3m5GRGDoIxWddF9RFjyK8JX6eN5lHPd+HRZfPJPrmNb/
         +tgmIuzdxR0Vq2Admrhu7X7PlxeoENeU0OElRlVva515TyjiZ8F2GC9ltYHY3yODuFdq
         JqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOqCBr8kKLshll8yoT+npZ0B9ox+GSWqTvURS5h9boc09rkQaOGHRwGTeJsEKKhoAsCzyM1VrnP88=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbZJ9skcZXn6pGg2QJE56LdFPn5IpjOLu4OGFJK3NaXIBeSO3/
	K0qF1Dp+l5VehPBmpFHUOC3p9C/l3OhBPdS2vAnCtkjcHrATQ9/9bmndIOj3cQ==
X-Gm-Gg: ASbGncu3VtWCXQd6i2QQNoQzroS3g/CmwcHi4ShRBG7bKUuaY1I7/oIrUSpBOsmoh9a
	upD7Nb5B34kVHEUuNxG0MGAir+Mznn2iPnrYwD3UeKVQR6AOYCyCJpeDGmHRil6ASUSTj8MdAuA
	KRhXVBdjQ+SjEDQTmHN5/yRrsF/sTxZT9V1l9RrKk4LLAz1wVDiYXIzK+obEzQp75KW62iVJCMa
	Zxe9i1KhfXKrdO5YwjkcgUZM1hDUohM4AcBlCMJAsqAReuVYyT0FoVa3kB8EFqLmY3anReBEl9k
	2NIQkVsJuTa/DnRbHOOEDbG9+9yEHc9y9bBIeABQdK+Dx0RO0w2Zk9WoMhQCvB70wP3hQvvbsol
	0
X-Google-Smtp-Source: AGHT+IFEFXguMSrolI0P3ukAc2TYa0vgLPYKEPScvXDHo+rLtYNPrNsHHvURG+6JhR1WqnqXs7C9MA==
X-Received: by 2002:a05:6402:a001:b0:5e0:445f:9576 with SMTP id 4fb4d7f45d1cf-5e0445f96c6mr12979180a12.18.1739964504810;
        Wed, 19 Feb 2025 03:28:24 -0800 (PST)
Message-ID: <2cee5ebc-cae7-4da8-9b7d-bb55cc907570@suse.com>
Date: Wed, 19 Feb 2025 12:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v4 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739363240.git.oleksii.kurochko@gmail.com>
 <38093d9843afbba9dda7326ee6e8cc3c99343cf6.1739363240.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <38093d9843afbba9dda7326ee6e8cc3c99343cf6.1739363240.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2025 17:50, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -249,12 +249,10 @@ pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
>  
>  /* Update an entry at the level @target. */
>  static int pt_update_entry(mfn_t root, vaddr_t virt,
> -                           mfn_t mfn, unsigned int target,
> +                           mfn_t mfn, unsigned int *target,
>                             unsigned int flags)
>  {
>      int rc;
> -    unsigned int level = HYP_PT_ROOT_LEVEL;
> -    pte_t *table;
>      /*
>       * The intermediate page table shouldn't be allocated when MFN isn't
>       * valid and we are not populating page table.
> @@ -265,41 +263,48 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
>       * combinations of (mfn, flags).
>      */
>      bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
> -    pte_t pte, *entry;
> -
> -    /* convenience aliases */
> -    DECLARE_OFFSETS(offsets, virt);
> +    pte_t pte, *entry = NULL;

With there also being "table" below, "entry" isn't quite as bad as in the
other patch. Yet I'd still like to ask that you consider renaming.

> -    table = map_table(root);
> -    for ( ; level > target; level-- )
> +    if ( *target == CONFIG_PAGING_LEVELS )
> +        entry = _pt_walk(virt, target);

Imo it's quite important for the comment ahead of the function to be updated
to mention this special case.

> +    else
>      {
> -        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
> -        if ( rc == XEN_TABLE_MAP_NOMEM )
> +        pte_t *table;
> +        unsigned int level = HYP_PT_ROOT_LEVEL;
> +        /* convenience aliases */

Nit: Style.

> @@ -331,7 +336,8 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
>      rc = 0;
>  
>   out:
> -    unmap_table(table);
> +    if ( entry )
> +        unmap_table(entry);

Would it perhaps be worth for unmap_table() to gracefully handle being passed
NULL, to avoid such conditionals (there may be more in the future)?

Jan

