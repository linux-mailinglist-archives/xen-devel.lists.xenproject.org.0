Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9D5B20848
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 14:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077534.1438585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulRBC-0003lY-Mt; Mon, 11 Aug 2025 11:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077534.1438585; Mon, 11 Aug 2025 11:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulRBC-0003jS-Jy; Mon, 11 Aug 2025 11:59:06 +0000
Received: by outflank-mailman (input) for mailman id 1077534;
 Mon, 11 Aug 2025 11:59:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulRBB-0003jH-Aa
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:59:05 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92c4e783-76aa-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 13:59:02 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-adfb562266cso586168366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:59:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a23ffc3sm2008166766b.124.2025.08.11.04.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:59:01 -0700 (PDT)
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
X-Inumbo-ID: 92c4e783-76aa-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754913542; x=1755518342; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lj0GM1Ir9wAJW/08C1hiiJS7uJTmr8GPBiyo0b2B28k=;
        b=B6C8THoeYSe/tcYPV3gCKB1BffAquy9ftj+tOra253JZw3efyqlKl8dJxenmZNsfeA
         g/tt0oIdcnmKkDB/0A1QZbFI+HsCezmXKAiczd9itBhOMsCFjOLjSE0Gr/fKwfmQCvNN
         dsVS/2ZK3HfNfvqlfTWSefPTLNbKScbQ4FD3sFBsjhSixgrt4uZri1vwga4Teye57CZH
         4xyP7ftM9lp9Vb6efXM1HHNsSm4onsWLKaMydRPEHYLIXIJLRKlvZuTK/H3FDujTM2p1
         OA+I5E3qsafbM08Tjsa1+Tf30UQy5cDUTFbcislcwKs1xsqnfFeqX7xMl36IEl1NA4PT
         bEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754913542; x=1755518342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lj0GM1Ir9wAJW/08C1hiiJS7uJTmr8GPBiyo0b2B28k=;
        b=FQ4KKJDoy0wC9G7LTB3gdz49gw4FYiHk6uBBLAgU2I2i/d67QRaa+u2IZ6VJq6/wRT
         8/pZL4tK6DoL0E3cr1LXvXNVXZNDlRNb1tUuButDCaAuV2s3NpTJqGFQKO2Vgt9QhwkM
         cBJYHuIoWRfur5vuzExYbzso+JyGaQ/Fo1L7NgBpCY4syKPNO+R7ESqEv4tgqvyfOBeN
         FssyraTfs7wSLvesQhcB821dx/joSw442/suv3TsGXT9Br9vuRcvW9elly7gNVwgZPcV
         rvRynm91KVpCy6A4UgkcbDCCEc0RWuru4s8SdsJTvupulOqL2FsAOCkZ6CE/RB7zz+G9
         72mw==
X-Forwarded-Encrypted: i=1; AJvYcCVXZY+pCduXt8ccd/asYS7Q7KBn9p34CQTtRCc2yMGtI1r7lcCJuGE/5HtWFkQLN9cqDfRkGzKi6Rg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzofsR1E2YAPZSnkqpjxr0ev6riWqg0tmZz0MZiJ7EAnaHm7zlL
	kzZLAWVDcTvR/V1+iuUcbZegfWYDsEffIBQejTZY7R++cry0UMPVnj3K+ZSv4xXwHg==
X-Gm-Gg: ASbGnctno3ZqAxKEgazCNgL6MCQYQJ8RqU+9CKlciRp2AwfZWWeWv7b/6sc6hOm5Ho9
	ecaWJqmTeL0hRR9r7SgvlpEgrrtG9JbsNNOgEG8Htluap/UoNHxN5YsnsYcFMGmK+8r5tc+HDye
	B89Hq+k0iny55IoB+XCaLRS6K8v7JUHjRY0cuaq8XpJTHqwOBQI7POLWzoeJUIazF1c74x6ID/8
	c/CE8iY4YKm1EZWf1L5zgGXYZOMR0P/Ybe0kkuB8X1acHlV2wQAhVvaYvdh2vsSEDAEaOUKACTR
	Qfyic8UJ4ccnIg0Q3Pa6QVyK3m93dF9DwsD9aXUIzmZ5uJmgyhE+oDwDYqMV5E7wJB4pxorbbFT
	Sg0S5aBlPKQnxWBSRjS/vmovuSk8xU7Qdy+0v5qLqXMzukifrH49eXEvbhLPGpOlczpWODih7Go
	bvxVXQE5Y=
X-Google-Smtp-Source: AGHT+IFOEH7v7byAjBYR4alZDP3KWHRhfqW4/wS1sguHqQ5pIS4lqjSFze9jK9qx3n+4rp16VkzGWg==
X-Received: by 2002:a17:906:6a02:b0:af7:37d1:93b6 with SMTP id a640c23a62f3a-af9c6371790mr1202794266b.15.1754913542083;
        Mon, 11 Aug 2025 04:59:02 -0700 (PDT)
Message-ID: <cc0fd91c-2dd1-4094-997a-87856f6cd914@suse.com>
Date: Mon, 11 Aug 2025 13:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/20] xen/riscv: Implement superpage splitting for p2m
 mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <6890f77e577493194ea94834989dc0841d18eed0.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6890f77e577493194ea94834989dc0841d18eed0.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> Add support for down large memory mappings ("superpages") in the RISC-V
> p2m mapping so that smaller, more precise mappings ("finer-grained entries")
> can be inserted into lower levels of the page table hierarchy.
> 
> To implement that the following is done:
> - Introduce p2m_split_superpage(): Recursively shatters a superpage into
>   smaller page table entries down to the target level, preserving original
>   permissions and attributes.
> - p2m_set_entry() updated to invoke superpage splitting when inserting
>   entries at lower levels within a superpage-mapped region.
> 
> This implementation is based on the ARM code, with modifications to the part
> that follows the BBM (break-before-make) approach, some parts are simplified
> as according to RISC-V spec:
>   It is permitted for multiple address-translation cache entries to co-exist
>   for the same address. This represents the fact that in a conventional
>   TLB hierarchy, it is possible for multiple entries to match a single
>   address if, for example, a page is upgraded to a superpage without first
>   clearing the original non-leaf PTE’s valid bit and executing an SFENCE.VMA
>   with rs1=x0, or if multiple TLBs exist in parallel at a given level of the
>   hierarchy. In this case, just as if an SFENCE.VMA is not executed between
>   a write to the memory-management tables and subsequent implicit read of the
>   same address: it is unpredictable whether the old non-leaf PTE or the new
>   leaf PTE is used, but the behavior is otherwise well defined.
> In contrast to the Arm architecture, where BBM is mandatory and failing to
> use it in some cases can lead to CPU instability, RISC-V guarantees
> stability, and the behavior remains safe — though unpredictable in terms of
> which translation will be used.
> 
> Additionally, the page table walk logic has been adjusted, as ARM uses the
> opposite number of levels compared to RISC-V.

As before, I think you mean "numbering".

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -539,6 +539,91 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
>      p2m_free_page(p2m, pg);
>  }
>  
> +static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
> +                                unsigned int level, unsigned int target,
> +                                const unsigned int *offsets)
> +{
> +    struct page_info *page;
> +    unsigned long i;
> +    pte_t pte, *table;
> +    bool rv = true;
> +
> +    /* Convenience aliases */
> +    mfn_t mfn = pte_get_mfn(*entry);
> +    unsigned int next_level = level - 1;
> +    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
> +
> +    /*
> +     * This should only be called with target != level and the entry is
> +     * a superpage.
> +     */
> +    ASSERT(level > target);
> +    ASSERT(pte_is_superpage(*entry, level));
> +
> +    page = p2m_alloc_page(p2m->domain);
> +    if ( !page )
> +    {
> +        /*
> +         * The caller is in charge to free the sub-tree.
> +         * As we didn't manage to allocate anything, just tell the
> +         * caller there is nothing to free by invalidating the PTE.
> +         */
> +        memset(entry, 0, sizeof(*entry));
> +        return false;
> +    }
> +
> +    table = __map_domain_page(page);
> +
> +    /*
> +     * We are either splitting a second level 1G page into 512 first level
> +     * 2M pages, or a first level 2M page into 512 zero level 4K pages.
> +     */

Such a comment is at risk of (silently) going stale when support for 512G
mappings is added. I wonder if it's really that informative to have here.

> +    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
> +    {
> +        pte_t *new_entry = table + i;
> +
> +        /*
> +         * Use the content of the superpage entry and override
> +         * the necessary fields. So the correct permission are kept.
> +         */

It's not just permissions though? The memory type field also needs
retaining (and is being retained this way). Maybe better say "attributes"?

Jan

