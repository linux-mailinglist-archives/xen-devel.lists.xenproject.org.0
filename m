Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB087AEFDA7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 17:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029811.1403559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWcbE-0003ai-4e; Tue, 01 Jul 2025 15:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029811.1403559; Tue, 01 Jul 2025 15:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWcbE-0003YI-1G; Tue, 01 Jul 2025 15:08:44 +0000
Received: by outflank-mailman (input) for mailman id 1029811;
 Tue, 01 Jul 2025 15:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWcbC-0003YC-PF
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 15:08:42 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 452cbbf1-568d-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 17:08:40 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a510432236so2537545f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 08:08:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c13a3a26sm12336213a91.19.2025.07.01.08.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 08:08:38 -0700 (PDT)
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
X-Inumbo-ID: 452cbbf1-568d-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751382519; x=1751987319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G9yBy6PPryVYm0bEO0RhvgXumty8etx/6tc93kplzfY=;
        b=GWbsoB49W5j/JIhWlY5CjGy+t4UvIukRYi+gi2GtGN8e0eSL3JJraEeAq6kRaGdRFh
         xIShG0qJXHf3/7B4tM49LwRvosgKmBSQcnuRtaRhQrWcT6Q2pYA2nMMqCc779rGrsalt
         T76GGGdlWKdviOqoRyz0PvnD0h5eNUYe8GZCdS+pTxK7yXlhMOu59CKMgy7/u0U6pfCX
         4JfgDl7oSwxOpmE8x6Vtka8/QqsRV6NE/lwyHv9dcLn45e9kOtS3bEP0MiB3sHHyynvM
         dBcOvYaxBDbWFXk9LeMPztk0JCh2aTusUgyhjU1pP9l7RksReW58Zk3vGccyQQerd+3N
         d48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751382519; x=1751987319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9yBy6PPryVYm0bEO0RhvgXumty8etx/6tc93kplzfY=;
        b=vtFjZcw22qaH/nmrqQeR687f8Q4JU/i7dz53QBI58cU6L9IZz82q93dxQBoiWUmeHP
         pAk9gaYMLpUceJp5efLcPtYVYK4Rv5OyG/dO2ThgVY/ebCVdjBnSPPvuk+aCpYlpGCrY
         xK1gUNSoDn5tcEZH2bVXYcrsmm32gxNOw0iX+LjXiGrfq34ROktgM5oQFz6h00VLHGMQ
         xIZYTYUJMvm1YmYjED81/cvcFDvlur8G2MQHW0CCkiWV8ZyVXOjkQL4ZBcNYkXuiu7tL
         o9xoqh7WIpkzt7bGfxuGlnXEPX/pyZvzNjCf87U10N6m2Y6Vxy8127Cato25zLH2jxVb
         IKfg==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZddqsTfmBeii65S+ykfPttFRFsvwMf6XAOL/WU2OW1dQkR9KSzvp+3POqJoFAWVGbks8N/kn56Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxn19xBgxT1o45Umxwb/+DRm5wHCzjZb7GL1KV5AVI8pI8eb8cf
	ew9bdvI6bU+FPg10qRekiTvOcyl5TaPQFja3f+aZMp6/XlfzQ0SU+5/HnX+AjD1g4Q==
X-Gm-Gg: ASbGncuNKHkj7vXLf3ozp9uCDd/ScjRDmUzVvQEQks9fg0rScz0VbW7q34qeWpDHggk
	hMXsfFf4ouJSFc4x0EGILeojU5ZoLGC0gfn3His/Nx83m3eh4UQp7ce2iFfH5EBIIHOQQ1shqrz
	4cylLc9ujdp2FSRuQd0/gxwCw9cJx0U/BZDr2BiC4sexJYAhK0PKcOlYLzmyARQm7UHkMR/LhDy
	u7sHPPxqNKwXOPdTgfmmTWcnG87GTszSTR4TSgh3rXurbJnd8kkluuxTSa0cprit1ZNUyMCkYVG
	gHIcRDzUhVFetA0ZDPU4c57R78Sd12AbrEISSkrKCc03JL7mwhr8jLr3+VODra8TwS7LN29YQeQ
	gMk+7tg4Y1uVK9n3BBXrHOs3lUOiadtxhIRXKtUrq5h02rAQ=
X-Google-Smtp-Source: AGHT+IEj/bX60yGF2wDCJewxTB1qEsjv2U187Kb9Q7KUlCRTfUZXWi6xgA9A2Cevikk2QFLbFSa7rA==
X-Received: by 2002:adf:9d8d:0:b0:3a4:d8f2:d9d with SMTP id ffacd0b85a97d-3a8fe4bd07amr14970894f8f.38.1751382519080;
        Tue, 01 Jul 2025 08:08:39 -0700 (PDT)
Message-ID: <f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com>
Date: Tue, 1 Jul 2025 17:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/17] xen/riscv: Implement p2m_entry_from_mfn() and
 support PBMT configuration
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <994ab3dd6822c4cd02a6a576041da115abeff6ed.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <994ab3dd6822c4cd02a6a576041da115abeff6ed.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -76,6 +76,14 @@
>  #define PTE_SMALL       BIT(10, UL)
>  #define PTE_POPULATE    BIT(11, UL)
>  
> +enum pbmt_type_t {

Please can we stick to _t suffixes only being used on typedef-ed identifiers?

> +    pbmt_pma,
> +    pbmt_nc,
> +    pbmt_io,
> +    pbmt_rsvd,
> +    pbmt_max,

It's a 2-bit field in the PTE, isn't it? In which case the maximum valid value
to put there is 3. That's what an identifier named "max" should evaluate to.
The value 4 here would want to be named "count", "num", "nr", or alike.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>      return __map_domain_page(p2m->root + root_table_indx);
>  }
>  
> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)

See comments on the earlier patch regarding naming.

> +{
> +    int rc;
> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));

How does this work, when you record GFNs only for Xenheap pages? I don't
think you can get around having the caller pass in the GFN. At which point
the PTE probably doesn't need passing.

> +    rc = radix_tree_insert(&p2m->p2m_type, gfn_x(gfn),
> +                           radix_tree_int_to_ptr(t));
> +    if ( rc == -EEXIST )
> +    {
> +        /* If a setting already exists, change it to the new one */
> +        radix_tree_replace_slot(
> +            radix_tree_lookup_slot(
> +                &p2m->p2m_type, gfn_x(gfn)),
> +            radix_tree_int_to_ptr(t));
> +        rc = 0;
> +    }
> +
> +    return rc;
> +}
> +
>  static p2m_type_t p2m_type_radix_get(struct p2m_domain *p2m, pte_t pte)
>  {
>      void *ptr;
> @@ -389,12 +409,87 @@ static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
>      p2m_write_pte(p, pte, clean_pte);
>  }
>  
> -static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn,
> -                                p2m_type_t t, p2m_access_t a)
> +static void p2m_set_permission(pte_t *e, p2m_type_t t, p2m_access_t a)
>  {
> -    panic("%s: hasn't been implemented yet\n", __func__);
> +    /* First apply type permissions */
> +    switch ( t )
> +    {
> +    case p2m_ram_rw:
> +        e->pte |= PTE_ACCESS_MASK;
> +        break;
> +
> +    case p2m_mmio_direct_dev:
> +        e->pte |= (PTE_READABLE | PTE_WRITABLE);
> +        e->pte &= ~PTE_EXECUTABLE;

What's wrong with code living in MMIO, e.g. in the ROM of a PCI device?
Such code would want to be executable.

> +        break;
> +
> +    case p2m_invalid:
> +        e->pte &= ~PTE_ACCESS_MASK;
> +        break;
> +
> +    default:
> +        BUG();
> +        break;
> +    }

I think you ought to handle all types that are defined right away. I also
don't think you should BUG() in the default case (also in the other switch()
below). ASSERT_UNEACHABLE() may be fine, along with clearing all permissions
in the entry for release builds.

> +    /* Then restrict with access permissions */
> +    switch ( a )
> +    {
> +    case p2m_access_rwx:
> +        break;
> +    case p2m_access_wx:
> +        e->pte &= ~PTE_READABLE;
> +        break;
> +    case p2m_access_rw:
> +        e->pte &= ~PTE_EXECUTABLE;
> +        break;
> +    case p2m_access_w:
> +        e->pte &= ~(PTE_READABLE | PTE_EXECUTABLE);
> +        e->pte &= ~PTE_EXECUTABLE;
> +        break;
> +    case p2m_access_rx:
> +    case p2m_access_rx2rw:
> +        e->pte &= ~PTE_WRITABLE;
> +        break;
> +    case p2m_access_x:
> +        e->pte &= ~(PTE_READABLE | PTE_WRITABLE);
> +        break;
> +    case p2m_access_r:
> +        e->pte &= ~(PTE_WRITABLE | PTE_EXECUTABLE);
> +        break;
> +    case p2m_access_n:
> +    case p2m_access_n2rwx:
> +        e->pte &= ~PTE_ACCESS_MASK;
> +        break;
> +    default:
> +        BUG();
> +        break;
> +    }

Nit: Blank lines between non-fall-through case blocks, please.

> +static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t, p2m_access_t a)
> +{
> +    pte_t e = (pte_t) { 1 };

What's the 1 doing here?

> +    switch ( t )
> +    {
> +    case p2m_mmio_direct_dev:
> +        e.pte |= PTE_PBMT_IO;
> +        break;
> +
> +    default:
> +        break;
> +    }
> +
> +    p2m_set_permission(&e, t, a);
> +
> +    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
> +
> +    pte_set_mfn(&e, mfn);

Based on how things work on x86 (and how I would have expected them to also
work on Arm), may I suggest that you set MFN ahead of permissions, so that
the permissions setting function can use the MFN for e.g. a lookup in
mmio_ro_ranges.

> +    BUG_ON(p2m_type_radix_set(p2m, e, t));

I'm not convinced of this error handling here either. Radix tree insertion
_can_ fail, e.g. when there's no memory left. This must not bring down Xen,
or we'll have an XSA right away. You could zap the PTE, or if need be you
could crash the offending domain.

In this context (not sure if I asked before): With this use of a radix tree,
how do you intend to bound the amount of memory that a domain can use, by
making Xen insert very many entries?

Jan

