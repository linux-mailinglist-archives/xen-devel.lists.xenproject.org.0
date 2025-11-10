Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1507CC47E81
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 17:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158556.1486897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUev-0003tk-Pl; Mon, 10 Nov 2025 16:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158556.1486897; Mon, 10 Nov 2025 16:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUev-0003r6-Ly; Mon, 10 Nov 2025 16:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1158556;
 Mon, 10 Nov 2025 16:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vIUeu-0003qq-3a
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 16:22:24 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fa48717-be51-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 17:22:22 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b5b823b4f3dso471611766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 08:22:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf60ef8asm1114440866b.30.2025.11.10.08.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 08:22:21 -0800 (PST)
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
X-Inumbo-ID: 6fa48717-be51-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762791742; x=1763396542; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V0t4rrBwBHijLz1anaEDIZMWzVwXcpEnLjROG7ZSmIg=;
        b=NS5eLV5OiEOyRVcStGDDzbEzNDDapdhokfKWw9P2iCfw6oG3natm1RLwPeY1qiwc+m
         37QsNLcaJZEhy4AyZVMTiUdbYNwQcNBk823BaGcxSMDu/jFfBkFGnI0PgZRhminMnS6O
         5k0/dpHaJCLYbGPbnirClAH4mhrO3z96HMvwXWwq2rMfkVev5CNiffEss23QHKuMYNBj
         SrG4eZ+FUQCH2QBdqkk/xThQRVUUB7EtA+JQyMcrX4fc0FATXNsI4zr6osbEM++K04pA
         HZ/StnjUeTdqRP4ztEI2YjtVRxQaO8Bw8aXIKl3xlyerZVAdH6LkAR6aimd7f4C7667B
         Xqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762791742; x=1763396542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0t4rrBwBHijLz1anaEDIZMWzVwXcpEnLjROG7ZSmIg=;
        b=TtRzhKQm9oxvKB9nxz6BWDOZ3Flo7HnIfj5E3N6kIzFvuWJDetkpcYGmhh7LzdZMcN
         CxtNe7ppahD18ySxDJ002Pj3vQ8lUcWh3g8oVfAUvJY0kFpCuJazYOeY/mMrKD32r0FR
         csYzeJBlOfqXByOVUwbWsfXlHuzPaJt/QgQo7CmlUHFDsE7MpdjMAv34D1oyP2sAA0CQ
         8Ev/Ls3yRy6Q0codSqbTWKVdFmDFu4J2nWT7phpEmKRaVaYLrS6A/BYFLfXSvhdG7ZUB
         W43SNNkdX7oQBLgdacdkwqbqPAaZ+GHwZGK0kGO5QOPakHpQzDtzerONwZAvUsf04qo3
         1hgw==
X-Forwarded-Encrypted: i=1; AJvYcCWxM/kEMcRvwzrAmmoiAP58dCCcruT8zKuo5H1DVjSkE52J139Y/uX+kNGCbApRZR8QEvgtfFnTNzM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyjfy7wyzDaTUv9d59kMTuMJSGBbh2ZpoRLj86RlErwsAeciEF4
	dcLf3KkGDEzpwmmtm9zYTtmZhDJpi8NXiCU6cIvku0J10Jj2zZf/LEZqON8J2/FIlw==
X-Gm-Gg: ASbGnctjhBslKK500vbuRUlMzEJL4rrkoGhxwqW4eQGWko3/HTNzN+NUgsnCPHudbFg
	3/UYw5Nz1SlVxLHxYzZPXePYTSl0WjaxXfRj9gaOkw1S+c8178qtQsAODiehPYRHriPSgN8vIZn
	PNmAyob9wOHb4d+GWECGIe8BDq6TbdxrOdIQBXHq4Hm4EvjxIR8rlxI69f27tyzaBqICxfH6V4K
	aJnMPZob5NhurdEN+iOecBuD7gynQswZlUQ0xPnVV83O2gE+QX3lkB7C82ooOJnPbL9gpXmCSTg
	XHbhBLMxx7R2KWaqH6a6/ra+4/61iQAcHZgycbgI45cuPNgOYUAq81Ktwv4EX3Y4WiiTeuFEnku
	s0UpW6Y/oRyfV3Z6s6LEibnVkq9/MUHp9XEl3maA9fUgJFD0CW6rqN+ob17sqllQeel7MCjc+YY
	riJljueluGGcfjVRPKKnBasqwEsA50eNlWCFk7yVe97fFwtAl8KAuFbgqbtUJfLpWGYLJz3J1+Y
	ec=
X-Google-Smtp-Source: AGHT+IHP9lfCd20AVDBtRKbtWyVtpmpv2vFiRDVTM75rVA757oPw5nUkotRs8aegUiwmEjnD7hHaxA==
X-Received: by 2002:a17:906:ef04:b0:b70:ac7a:2a8b with SMTP id a640c23a62f3a-b72e040f8b2mr871802766b.19.1762791741742;
        Mon, 10 Nov 2025 08:22:21 -0800 (PST)
Message-ID: <c77881bf-98aa-483f-8767-0be566f3dc34@suse.com>
Date: Mon, 10 Nov 2025 17:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 12/18] xen/riscv: Implement p2m_pte_from_mfn() and
 support PBMT configuration
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <ff69e96dbb17e38e10468454d534061388201680.1760974017.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ff69e96dbb17e38e10468454d534061388201680.1760974017.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.10.2025 17:57, Oleksii Kurochko wrote:
> This patch adds the initial logic for constructing PTEs from MFNs in the RISC-V
> p2m subsystem. It includes:
> - Implementation of p2m_pte_from_mfn(): Generates a valid PTE using the
>   given MFN, p2m_type_t, including permission encoding and PBMT attribute
>   setup.
> - New helper p2m_set_permission(): Encodes access rights (r, w, x) into the
>   PTE based on both p2m type and access permissions.
> - p2m_set_type(): Stores the p2m type in PTE's bits. The storage of types,
>   which don't fit PTE bits, will be implemented separately later.
> - Add detection of Svade extension to properly handle a possible page-fault
>   if A and D bits aren't set.
> 
> PBMT type encoding support:
> - Introduces an enum pbmt_type_t to represent the PBMT field values.
> - Maps types like p2m_mmio_direct_dev to p2m_mmio_direct_io, others default
>   to pbmt_pma.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V5:
>  - Moved setting of p2m_mmio_direct_io inside (!is_table) case in p2m_pte_from_mfn().
>  - Extend comment about the place of setting A/D bits with explanation
>    why it is done in this way for now.
> ---
> Changes in V4:
>  - p2m_set_permission() updates:
>    - Update permissions for p2m_ram_rw case, make it also executable.
>    - Add pernissions setting for p2m_map_foreign_* types.
>    - Drop setting peromissions for p2m_ext_storage.
>    - Only turn off PTE_VALID bit for p2m_invalid, don't touch other bits.
>  - p2m_pte_from_mfn() updates:
>    - Update ASSERT(), add a check that mfn isn't INVALID_MFN (1)
>      explicitly to avoid the case when PADDR_MASK isn't narrow enough to
>      catch the case (1).
>    - Drop unnessary check around call of p2m_set_type() as this check
>      is already included inside p2m_set_type().
>  - Introduce new p2m type p2m_first_external to detect that passed type
>    is stored in external storage.
>  - Add handling of PTE's A and D bits in pm2_set_permission. Also, set
>    PTE_USER bit. For this cpufeatures.{h and c} were updated to be able
>    to detect availability of Svade extension.
>  - Drop grant table related code as it isn't going to be used at the moment.
> ---
> Changes in V3:
>  - s/p2m_entry_from_mfn/p2m_pte_from_mfn.
>  - s/pbmt_type_t/pbmt_type.
>  - s/pbmt_max/pbmt_count.
>  - s/p2m_type_radix_set/p2m_set_type.
>  - Rework p2m_set_type() to handle only types which are fited into PTEs bits.
>    Other types will be covered separately.
>    Update arguments of p2m_set_type(): there is no any reason for p2m anymore.
>  - p2m_set_permissions() updates:
>    - Update the code in p2m_set_permission() for cases p2m_raw_rw and
>      p2m_mmio_direct_io to set proper type permissions.
>    - Add cases for p2m_grant_map_rw and p2m_grant_map_ro.
>    - Use ASSERT_UNEACHABLE() instead of BUG() in switch cases of
>      p2m_set_permissions.
>    - Add blank lines non-fall-through case blocks in switch cases.
>  - Set MFN before permissions are set in p2m_pte_from_mfn().
>  - Update prototype of p2m_entry_from_mfn().
> ---
> Changes in V2:
>  - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
>    functionality" which was splitted to smaller.
> ---
>  xen/arch/riscv/cpufeature.c             |   1 +
>  xen/arch/riscv/include/asm/cpufeature.h |   1 +
>  xen/arch/riscv/include/asm/page.h       |   8 ++
>  xen/arch/riscv/p2m.c                    | 112 +++++++++++++++++++++++-
>  4 files changed, 118 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index b846a106a3..02b68aeaa4 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -138,6 +138,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>      RISCV_ISA_EXT_DATA(zbs),
>      RISCV_ISA_EXT_DATA(smaia),
>      RISCV_ISA_EXT_DATA(ssaia),
> +    RISCV_ISA_EXT_DATA(svade),
>      RISCV_ISA_EXT_DATA(svpbmt),
>  };
>  
> diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
> index 768b84b769..5f756c76db 100644
> --- a/xen/arch/riscv/include/asm/cpufeature.h
> +++ b/xen/arch/riscv/include/asm/cpufeature.h
> @@ -37,6 +37,7 @@ enum riscv_isa_ext_id {
>      RISCV_ISA_EXT_zbs,
>      RISCV_ISA_EXT_smaia,
>      RISCV_ISA_EXT_ssaia,
> +    RISCV_ISA_EXT_svade,
>      RISCV_ISA_EXT_svpbmt,
>      RISCV_ISA_EXT_MAX
>  };
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> index 78e53981ac..4b6baeaaf2 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -73,6 +73,14 @@
>  #define PTE_SMALL       BIT(10, UL)
>  #define PTE_POPULATE    BIT(11, UL)
>  
> +enum pbmt_type {
> +    pbmt_pma,
> +    pbmt_nc,
> +    pbmt_io,
> +    pbmt_rsvd,
> +    pbmt_count,
> +};
> +
>  #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
>  
>  #define PTE_PBMT_MASK   (PTE_PBMT_NOCACHE | PTE_PBMT_IO)
> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> index 71b211410b..f4658e2560 100644
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -11,6 +11,7 @@
>  #include <xen/sections.h>
>  #include <xen/xvmalloc.h>
>  
> +#include <asm/cpufeature.h>
>  #include <asm/csr.h>
>  #include <asm/flushtlb.h>
>  #include <asm/paging.h>
> @@ -349,6 +350,18 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>      return __map_domain_page(p2m->root + root_table_indx);
>  }
>  
> +static int p2m_set_type(pte_t *pte, p2m_type_t t)
> +{
> +    int rc = 0;
> +
> +    if ( t > p2m_first_external )
> +        panic("unimplemeted\n");
> +    else
> +        pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
> +
> +    return rc;
> +}
> +
>  static p2m_type_t p2m_get_type(const pte_t pte)
>  {
>      p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
> @@ -379,11 +392,102 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
>      p2m_write_pte(p, pte, clean_pte);
>  }
>  
> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
> +static void p2m_set_permission(pte_t *e, p2m_type_t t)
>  {
> -    panic("%s: hasn't been implemented yet\n", __func__);
> +    e->pte &= ~PTE_ACCESS_MASK;
> +
> +    e->pte |= PTE_USER;
> +
> +    /*
> +     * Two schemes to manage the A and D bits are defined:
> +     *   • The Svade extension: when a virtual page is accessed and the A bit
> +     *     is clear, or is written and the D bit is clear, a page-fault
> +     *     exception is raised.
> +     *   • When the Svade extension is not implemented, the following scheme
> +     *     applies.
> +     *     When a virtual page is accessed and the A bit is clear, the PTE is
> +     *     updated to set the A bit. When the virtual page is written and the
> +     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
> +     *     address translation is in use and is not Bare, the G-stage virtual
> +     *     pages may be accessed or written by implicit accesses to VS-level
> +     *     memory management data structures, such as page tables.

Can you point me at the part of the spec where this behavior is described? If
things indeed work like this, ...

> +     * Thereby to avoid a page-fault in case of Svade is available, it is
> +     * necesssary to set A and D bits.

... I'd then agree with the "necessary" here. (Nit: note the extra 's' in your
spelling.)

Jan

