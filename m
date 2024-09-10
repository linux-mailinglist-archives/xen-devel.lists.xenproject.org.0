Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE67B973707
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 14:19:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795470.1204844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snzq1-00055l-TK; Tue, 10 Sep 2024 12:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795470.1204844; Tue, 10 Sep 2024 12:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snzq1-00054D-Pj; Tue, 10 Sep 2024 12:19:17 +0000
Received: by outflank-mailman (input) for mailman id 795470;
 Tue, 10 Sep 2024 12:19:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snzq0-00053s-1R
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 12:19:16 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e48181c5-6f6e-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 14:19:14 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c25554ec1eso7153505a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 05:19:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd46886sm4154596a12.34.2024.09.10.05.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:19:13 -0700 (PDT)
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
X-Inumbo-ID: e48181c5-6f6e-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725970754; x=1726575554; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbAJ6HSM0pc8khOOg+yePLdLuCtZ2m5NYE46R0exzeY=;
        b=KIHuCa+8s3uIfZjOZUvcqvlpRZsomzVA3dKyk59z9vVTmrgXSITNgwvGZsbL3ZAV+U
         cso/inB6F6WPitYtYZ/u4BSmMF9DdkPObBpHl0V7yDAUQ2EVrVI6Uz4t2HeoI1ONN5Ye
         NbzmEVWW6KOl1grEYkRhZZ304ooPt8CkAvpfFADJKj4s+LKbY1oEI5yY5tLbyPmgkCfL
         KQG82ahiqJjkY/On0wJB0QB8ZFfR6fwM7k/jdsI0z6SkO/UQB/mn64CSVm9W7flJQsIy
         UmXtOfC/3mhn8FGVs6iBaexw2JnmPhF9G8UMFXRjWCaMAFV6sSK+JYsJmLyaVn99Oe/W
         l/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725970754; x=1726575554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbAJ6HSM0pc8khOOg+yePLdLuCtZ2m5NYE46R0exzeY=;
        b=qD7l/uL+BSZyLEkmKKxkTFwTVgTud2WT6GywoBw5MxVnZyqSWs/0bxE0Q0KEr00oNE
         QAZPf5AiV8k5lf9rNoNbvUepvsTuE5xPqWp4BhOsmtIujMFVylcq+M5dhbeeayyV40Dj
         7lafrWxyCdi2ue7cSvCXGFUItGIyq2BOv0mERDuYjdvaQLox1P6FtuMn4NgB/kj/fUmP
         6K1xftU1aXqt54KyJZ8Ok7UvU180QwhvnvQrI9yp7ZBrK63uQm4T70c9ter84o2hHdDU
         UpdBwhsamTyy/03PJYwN3VHtPcknNEkAuXM6x2Z6+oU2XkruEsfHG4v7Sl2Z0Ojdef2u
         N5kA==
X-Forwarded-Encrypted: i=1; AJvYcCV9/053RswRImOmr6H0lCjv8baAM3FTElKREj/WCDla9OqswnU0k84x/PivrqXEenH2LdNrsLNnDvU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzu7vAMtoYg6nsSO0oTI5WvveiPU02QVrEiIVfeefmks+HYu8nA
	8qNXSGvtMuXLBYD8NdhZ+0+o7dNTXB0VmAaeeucDhHGdPlE0+X+5pwTTEJuc1a245Hpzc75lSwM
	=
X-Google-Smtp-Source: AGHT+IEGRWPU+HjAW2QNSfl8kd4SLSgLfQik1lCktnHk52NwHJeWCZrKkKx8dv5ArR8PjyaZnY14iQ==
X-Received: by 2002:a05:6402:34c4:b0:5c2:6083:6256 with SMTP id 4fb4d7f45d1cf-5c3e962d91dmr9908020a12.10.1725970753565;
        Tue, 10 Sep 2024 05:19:13 -0700 (PDT)
Message-ID: <ec6b52ae-e75d-4f24-a1da-b7f7fbe0bacc@suse.com>
Date: Tue, 10 Sep 2024 14:19:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] xen/riscv: page table handling
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <7ebcc10fbea81ff59b24edc962bdc401dd73ee82.1725295716.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7ebcc10fbea81ff59b24edc962bdc401dd73ee82.1725295716.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 19:01, Oleksii Kurochko wrote:
> Implement map_pages_to_xen() which requires several
> functions to manage page tables and entries:
> - pt_update()
> - pt_mapping_level()
> - pt_update_entry()
> - pt_next_level()
> - pt_check_entry()
> 
> To support these operations, add functions for creating,
> mapping, and unmapping Xen tables:
> - create_table()
> - map_table()
> - unmap_table()
> 
> Introduce PTE_SMALL to indicate that 4KB mapping is needed
> and PTE_POPULATE.
> 
> In addition introduce flush_tlb_range_va() for TLB flushing across
> CPUs after updating the PTE for the requested mapping.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  riscv_encoding.h using hard tabs as it is used in XVisor from where
>  this file has been taken and SATP_PPN_MASK was aligned using 3 hard
>  tabs as it was done for the definitions aove SATP_PPN_MASK.
> ---
> Changes in V6:
>  - update the commit message.
>  - correct the comment above flush_tlb_range_va().
>  - add PTE_READABLE to the check of pte.rwx permissions in
>    pte_is_mapping().
>  - s/printk/dprintk in pt_check_entry().
>  - drop unnecessary ASSERTS() in pt_check_entry().
>  - drop checking of PTE_VALID flags in /* Sanity check when removing
>    a mapping */ because of the earlier check.
>  - drop ASSERT(flags & PTE_POPULATE) in /* Sanity check when populating the page-table */
>    section as in the earlier if it is checked.
>  - pt_next_level() changes:
>    - invert if ( alloc_tbl ) condition.
>    - drop local variable ret.
>  - pt_update_entry() changes:
>    - invert definition of alloc_tbl.
>    - update the comment inside "if ( rc == XEN_TABLE_MAP_FAILED )".
>    - drop else for mentioned above if (...).
>    - clear some PTE flags before update.
>  - s/xen_pt_lock/pt_lock
>  - use PFN_DOWN() for vfn variable definition in pt_update().
>  - drop definition of PTE_{R,W,X}_MASK.
>  - introduce PTE_XWV_BITS and PTE_XWV_MASK() for convenience and use them in if (...)
>    in pt_update().
>  - update the comment above pt_update().
>  - change memset(&pte, 0x00, sizeof(pte)) to pte.pte = 0.
>  - add the comment above pte_is_table().
>  - add ASSERT in pte_is_mapping() to check the cases which are reserved for future
>    use.
> ---
> Changes in V5:
>  - s/xen_{un}map/{un}map
>  - introduce PTE_SMALL instead of PTE_BLOCK.
>  - update the comment above defintion of PTE_4K_PAGES.
>  - code style fixes.
>  - s/RV_STAGE1_MODE > SATP_MODE_SV48/RV_STAGE1_MODE > SATP_MODE_SV39 around
>    DECLARE_OFFSETS macros.
>  - change type of root_maddr from unsgined long to maddr_t.
>  - drop duplicated check ( if (rc) break ) in pt_update() inside while cycle.
>  - s/1U/1UL
>  - put 'spin_unlock(&xen_pt_lock);' ahead of TLB flush in pt_update().
>  - update the commit message.
>  - update the comment above ASSERT() in map_pages_to_xen() and also update
>    the check within ASSERT() to check that flags has PTE_VALID bit set.
>  - update the comment above pt_update() function.
>  - add the comment inside pt_check_entry().
>  - update the TLB flushing region in pt_update().
>  - s/alloc_only/alloc_tbl
> ---
> Changes in V4:
>  - update the commit message.
>  - drop xen_ prefix for functions: xen_pt_update(), xen_pt_mapping_level(),
>    xen_pt_update_entry(), xen_pt_next_level(), xen_pt_check_entry().
>  - drop 'select GENERIC_PT' for CONFIG_RISCV. There is no GENERIC_PT anymore.
>  - update implementation of flush_xen_tlb_range_va and s/flush_xen_tlb_range_va/flush_tlb_range_va
>  - s/pte_get_mfn/mfn_from_pte. Others similar definitions I decided not to touch as
>    they were introduced before and this patter of naming such type of macros will be applied
>    for newly introduced macros.
>  - drop _PAGE_* definitions and use analogues of PTE_*.
>  - introduce PTE_{W,X,R}_MASK and drop PAGE_{XN,W,X}_MASK. Also drop _PAGE_{*}_BIT
>  - introduce PAGE_HYPERVISOR_RX.
>  - drop unused now l3_table_offset.
>  - drop struct pt_t as it was used only for one function. If it will be needed in the future
>    pt_t will be re-introduced.
>  - code styles fixes in pte_is_table(). drop level argument from t.
>  - update implementation and prototype of pte_is_mapping().
>  - drop level argument from pt_next_level().
>  - introduce definition of SATP_PPN_MASK.
>  - isolate PPN of CSR_SATP before shift by PAGE_SHIFT.
>  - drop set_permission() functions as it is not used more then once.
>  - update prototype of pt_check_entry(): drop level argument as it is not used.
>  - pt_check_entry():
>    - code style fixes
>    - update the sanity check when modifying an entry
>    - update the sanity check when when removing a mapping.
>  - s/read_only/alloc_only.
>  - code style fixes for pt_next_level().
>  - pt_update_entry() changes:
>    - drop arch_level variable inisde pt_update_entry()
>    - drop convertion near virt to paddr_t in DECLARE_OFFSETS(offsets, virt);
>    - pull out "goto out inside first 'for' cycle.
>    - drop braces for 'if' cases which has only one line.
>    - ident 'out' label with one blank.
>    - update the comment above alloc_only and also definition to take into
>      account  that if pte population was requested or not.
>    - drop target variable and rename arch_target argument of the function to
>      target.
>  - pt_mapping_level() changes:
>    - move the check if PTE_BLOCK should be mapped on the top of the function.
>    - change int i to unsigned int and update 'for' cycle correspondingly.
>  - update prototye of pt_update():
>    - drop the comment  above nr_mfns and drop const to be consistent with other
>      arguments.
>    - always flush TLB at the end of the function as non-present entries can be put
>      in the TLB.
>    - add fence before TLB flush to ensure that PTEs are all updated before flushing.
>  - s/XEN_TABLE_NORMAL_PAGE/XEN_TABLE_NORMAL
>  - add a check in map_pages_to_xen() the mfn is not INVALID_MFN.
>  - add the comment on top of pt_update() how mfn = INVALID_MFN is considered.
>  - s/_PAGE_BLOCK/PTE_BLOCK.
>  - add the comment with additional explanation for PTE_BLOCK.
>  - drop defintion of FIRST_SIZE as it isn't used.
> ---
> Changes in V3:
>  - new patch. ( Technically it is reworked version of the generic approach
>    which I tried to suggest in the previous version )
> ---
>  xen/arch/riscv/Makefile                     |   1 +
>  xen/arch/riscv/include/asm/flushtlb.h       |   9 +
>  xen/arch/riscv/include/asm/mm.h             |   2 +
>  xen/arch/riscv/include/asm/page.h           |  72 ++++
>  xen/arch/riscv/include/asm/riscv_encoding.h |   1 +
>  xen/arch/riscv/mm.c                         |   9 -
>  xen/arch/riscv/pt.c                         | 423 ++++++++++++++++++++
>  7 files changed, 508 insertions(+), 9 deletions(-)
>  create mode 100644 xen/arch/riscv/pt.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 2f2d6647a2..fca9fd93b6 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,6 +1,7 @@
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>  obj-y += entry.o
>  obj-y += mm.o
> +obj-y += pt.o
>  obj-$(CONFIG_RISCV_64) += riscv64/
>  obj-y += sbi.o
>  obj-y += setup.o
> diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
> index f4a735fd6c..43214f5e95 100644
> --- a/xen/arch/riscv/include/asm/flushtlb.h
> +++ b/xen/arch/riscv/include/asm/flushtlb.h
> @@ -5,12 +5,21 @@
>  #include <xen/bug.h>
>  #include <xen/cpumask.h>
>  
> +#include <asm/sbi.h>
> +
>  /* Flush TLB of local processor for address va. */
>  static inline void flush_tlb_one_local(vaddr_t va)
>  {
>      asm volatile ( "sfence.vma %0" :: "r" (va) : "memory" );
>  }
>  
> +/* Flush a range of VA's hypervisor mappings from the TLB of all processors. */
> +static inline void flush_tlb_range_va(vaddr_t va, size_t size)
> +{
> +    BUG_ON(!sbi_has_rfence());
> +    sbi_remote_sfence_vma(NULL, va, size);
> +}
> +
>  /*
>   * Filter the given set of CPUs, removing those that definitely flushed their
>   * TLB since @page_timestamp.
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> index a0bdc2bc3a..ce1557bb27 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -42,6 +42,8 @@ static inline void *maddr_to_virt(paddr_t ma)
>  #define virt_to_mfn(va)     __virt_to_mfn(va)
>  #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>  
> +#define mfn_from_pte(pte) maddr_to_mfn(pte_to_paddr(pte))
> +
>  struct page_info
>  {
>      /* Each frame can be threaded onto a doubly-linked list. */
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> index 55916eaa92..9b7d4fd597 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -21,6 +21,11 @@
>  #define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
>  #define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
>  
> +/*
> + * PTE format:
> + * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> + *       PFN      reserved for SW   D   A   G   U   X   W   R   V
> + */
>  #define PTE_VALID                   BIT(0, UL)
>  #define PTE_READABLE                BIT(1, UL)
>  #define PTE_WRITABLE                BIT(2, UL)
> @@ -34,15 +39,51 @@
>  #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
>  #define PTE_TABLE                   (PTE_VALID)
>  
> +#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
>  #define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> +#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
>  
>  #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
>  
> +/*
> + * The PTE format does not contain the following bits within itself;
> + * they are created artificially to inform the Xen page table
> + * handling algorithm. These bits should not be explicitly written
> + * to the PTE entry.
> + */
> +#define PTE_SMALL       BIT(10, UL)
> +#define PTE_POPULATE    BIT(11, UL)
> +
> +#define PTE_XWV_BITS    (PTE_WRITABLE | PTE_EXECUTABLE | PTE_VALID)
> +#define PTE_XWV_MASK(x) ((x) & PTE_XWV_BITS)
> +#define PTE_RWX_MASK(x) ((x) & (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE))

I think I commented on *_MASK macros before: They are conventionally
constants (see e.g. PAGETABLE_ORDER_MASK that you have further down),
not operations on an input. It's not really clear to me what the
"mask" in this name is meant to signify as to what the macros are
doing. I seem to vaguely recall that you indicated you'd drop all
such helpers, in favor of using respective constants directly at use
sites.

As a less significant (because of being a matter of personal taste to
a fair degree) aspect: XWV is a pretty random sequence of characters.
I for one wouldn't remember what order they need to be used in, and
hence would always need to look this up.

Taken together, what about

#define PTE_LEAF_MASK   (PTE_WRITABLE | PTE_EXECUTABLE | PTE_VALID)
#define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)

?

> @@ -68,6 +109,37 @@ static inline bool pte_is_valid(pte_t p)
>      return p.pte & PTE_VALID;
>  }
>  
> +/*
> + * From the RISC-V spec:
> + *    Table 4.5 summarizes the encoding of the permission bits.
> + *      X W R Meaning
> + *      0 0 0 Pointer to next level of page table.
> + *      0 0 1 Read-only page.
> + *      0 1 0 Reserved for future use.
> + *      0 1 1 Read-write page.
> + *      1 0 0 Execute-only page.
> + *      1 0 1 Read-execute page.
> + *      1 1 0 Reserved for future use.
> + *      1 1 1 Read-write-execute page.
> + */
> +inline bool pte_is_table(const pte_t p)
> +{
> +    return ((p.pte & (PTE_VALID |
> +                      PTE_READABLE |
> +                      PTE_WRITABLE |
> +                      PTE_EXECUTABLE)) == PTE_VALID);
> +}
> +
> +static inline bool pte_is_mapping(const pte_t p)
> +{
> +    /* W = 1 || (X=1 && W=1) -> Reserved for future use */
> +    ASSERT((PTE_RWX_MASK(p.pte) != PTE_WRITABLE) ||
> +           (PTE_RWX_MASK(p.pte) != (PTE_WRITABLE | PTE_EXECUTABLE)));

I'm afraid I'm pretty unhappy with comments not matching the commented
code: The comment mentions only set bits, but not clear ones. Further
you're missing a check of the V bit - with that clear, the other bits
can be set whichever way. Taken together (and the spec also says it
this way): If V=1 and W=1 then R also needs to be 1.

Also - isn't this check equally relevant in pte_is_table()?

> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -164,6 +164,7 @@
>  #define SSTATUS_SD			SSTATUS64_SD
>  #define SATP_MODE			SATP64_MODE
>  #define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
> +#define SATP_PPN_MASK			_UL(0x00000FFFFFFFFFFF)

Why not SATP64_PPN on the rhs? And why no similar #define in the #else
block that follows, using SATP32_PPN?

> --- /dev/null
> +++ b/xen/arch/riscv/pt.c
> @@ -0,0 +1,423 @@
> +#include <xen/bug.h>
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/mm-frame.h>

I don#t think you need this when you already have xen/mm.h.

> +#include <xen/pfn.h>
> +#include <xen/pmap.h>
> +#include <xen/spinlock.h>
> +
> +#include <asm/flushtlb.h>
> +#include <asm/page.h>
> +
> +static inline const mfn_t get_root_page(void)
> +{
> +    paddr_t root_maddr = (csr_read(CSR_SATP) & SATP_PPN_MASK) << PAGE_SHIFT;

Won't this lose bits in RV32 mode? IOW wouldn't you better avoid open-
coding pfn_to_paddr() here?

> +    return maddr_to_mfn(root_maddr);
> +}
> +
> +/* Sanity check of the entry. */
> +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int flags)
> +{
> +    /*
> +     * See the comment about the possible combination of (mfn, flags) in
> +     * the comment above pt_update().
> +     */
> +
> +    /* Sanity check when modifying an entry. */
> +    if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )
> +    {
> +        /* We don't allow modifying an invalid entry. */
> +        if ( !pte_is_valid(entry) )
> +        {
> +            dprintk(XENLOG_ERR, "Modifying invalid entry is not allowed\n");
> +            return false;
> +        }
> +
> +        /* We don't allow modifying a table entry */
> +        if ( pte_is_table(entry) )
> +        {
> +            dprintk(XENLOG_ERR, "Modifying a table entry is not allowed\n");
> +            return false;
> +        }
> +    }
> +    /* Sanity check when inserting a mapping */
> +    else if ( flags & PTE_VALID )
> +    {
> +        /*
> +         * We don't allow replacing any valid entry.
> +         *
> +         * Note that the function pt_update() relies on this
> +         * assumption and will skip the TLB flush (when Svvptc
> +         * extension will be ratified). The function will need
> +         * to be updated if the check is relaxed.
> +         */
> +        if ( pte_is_valid(entry) )
> +        {
> +            if ( pte_is_mapping(entry) )
> +                dprintk(XENLOG_ERR, "Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn")\n",

As a general suggestion: Try to keep such log messages short, by omitting
parts not needed for understanding of what's meant. Here e.g. "Changing
MFN for valid PTE not allowed (...)\n".

> +                       mfn_x(mfn_from_pte(entry)), mfn_x(mfn));
> +            else
> +                dprintk(XENLOG_ERR, "Trying to replace a table with a mapping\n");

Similarly this would imply you can omit both "a" here.

> +static int pt_update_entry(mfn_t root, unsigned long virt,
> +                           mfn_t mfn, unsigned int target,
> +                           unsigned int flags)
> +{
> +    int rc;
> +    unsigned int level = HYP_PT_ROOT_LEVEL;
> +    pte_t *table;
> +    /*
> +     * The intermediate page table shouldn't be allocated when MFN isn't
> +     * valid and we are not populating page table.
> +     * This means we either modify permissions or remove an entry, or
> +     * inserting brand new entry.
> +     *
> +     * See the comment above pt_update() for an additional explanation about
> +     * combinations of (mfn, flags).
> +    */
> +    bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
> +    pte_t pte, *entry;
> +
> +    /* convenience aliases */
> +    DECLARE_OFFSETS(offsets, virt);
> +
> +    table = map_table(root);
> +    for ( ; level > target; level-- )
> +    {
> +        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
> +        if ( rc == XEN_TABLE_MAP_FAILED )
> +        {
> +            rc = 0;
> +
> +            /*
> +             * We are here because pt_next_level has failed to map
> +             * the intermediate page table (e.g the table does not exist
> +             * and the pt shouldn't be allocated). It is a valid case when
> +             * removing a mapping as it may not exist in the page table.
> +             * In this case, just ignore it.
> +             */
> +            if ( flags & PTE_VALID )
> +            {
> +                printk("%s: Unable to map level %u\n", __func__, level);
> +                rc = -ENOENT;
> +            }

Both comment and error code assume the !populate case. What about the case
where the allocation failed? That's "couldn't be allocated" and would better
return back -ENOMEM (as create_table() correctly returns in that case).

> +            goto out;
> +        }
> +
> +        if ( rc != XEN_TABLE_NORMAL )
> +            break;
> +    }
> +
> +    if ( level != target )
> +    {
> +        printk("%s: Shattering superpage is not supported\n", __func__);
> +        rc = -EOPNOTSUPP;
> +        goto out;
> +    }
> +
> +    entry = table + offsets[level];
> +
> +    rc = -EINVAL;
> +    if ( !pt_check_entry(*entry, mfn, flags) )
> +        goto out;
> +
> +    /* We are removing the page */
> +    if ( !(flags & PTE_VALID) )
> +        /*
> +         * there is also a check in pt_check_entry() which check that
> +         * mfn=INVALID_MFN
> +         */
> +        pte.pte = 0;
> +    else
> +    {
> +        /* We are inserting a mapping => Create new pte. */
> +        if ( !mfn_eq(mfn, INVALID_MFN) )
> +            pte = pte_from_mfn(mfn, PTE_VALID);
> +        else /* We are updating the permission => Copy the current pte. */
> +            pte = *entry;
> +
> +        /* update permission according to the flags */
> +        pte.pte &= ~PTE_RWX_MASK(flags);

Thus really is needed only on the "else" branch above.

> +static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
> +                            unsigned int flags)
> +{
> +    unsigned int level = 0;
> +    unsigned long mask;
> +    unsigned int i;
> +
> +    /* Use blocking mapping unless the caller requests 4K mapping */
> +    if ( unlikely(flags & PTE_SMALL) )
> +        return level;

Maybe "block mapping" in the comment? "Blocking" typically has quite
different a meaning. I'm uncertain about that terminology anyway, as
the spec doesn't use it.

> +/*
> + * If `mfn` equals `INVALID_MFN`, it indicates that the following page table
> + * update operation might be related to either:
> + *   - populating the table (PTE_POPULATE will be set additionaly),
> + *   - destroying a mapping (PTE_VALID = 0 and mfn = INVALID_MFN),
> + *   - modifying an existing mapping ( PTE_VALID = 1 and mfn == INVALID_MFN ).

No need to repeat the INVALID_MFN part that is already stated at the
start of the paragraph. It would also be nice if you consistently
omitted the blanks immediately inside parentheses in comments.

> + * If `mfn` != INVALID_MFN and flags has PTE_VALID bit set then it means that
> + * inserting will be done.
> + */
> +static int pt_update(unsigned long virt,
> +                     mfn_t mfn,
> +                     unsigned long nr_mfns,
> +                     unsigned int flags)
> +{
> +    int rc = 0;
> +    unsigned long vfn = PFN_DOWN(virt);
> +    unsigned long left = nr_mfns;
> +
> +    const mfn_t root = get_root_page();
> +
> +    /*
> +     * It is bad idea to have mapping both writeable and
> +     * executable.
> +     * When modifying/creating mapping (i.e PTE_VALID is set),
> +     * prevent any update if this happen.
> +     */
> +    if ( PTE_XWV_MASK(flags) == PTE_XWV_BITS )
> +    {
> +        printk("Mappings should not be both Writeable and Executable.\n");

I'm pretty sure I asked before that you omit full stops from log messages.

> +int map_pages_to_xen(unsigned long virt,
> +                     mfn_t mfn,
> +                     unsigned long nr_mfns,
> +                     unsigned int flags)
> +{
> +    /*
> +     * Ensure that flags has PTE_VALID bit as map_pages_to_xen() is supposed
> +     * to create a mapping.
> +     *
> +     * Ensure that we have a valid MFN before proceeding.
> +     *
> +     * If the MFN is invalid, pt_update() might misinterpret the operation,
> +     * treating it as either a population, a mapping destruction,
> +     * or a mapping modification.
> +     */
> +    ASSERT(!mfn_eq(mfn, INVALID_MFN) || (flags & PTE_VALID));

Judging from the comment, do you mean && instead of || ?

Jan

