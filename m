Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF08C4424
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 17:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721030.1124154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Xan-0003NY-7J; Mon, 13 May 2024 15:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721030.1124154; Mon, 13 May 2024 15:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Xan-0003LI-4j; Mon, 13 May 2024 15:27:57 +0000
Received: by outflank-mailman (input) for mailman id 721030;
 Mon, 13 May 2024 15:27:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK/2=MQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6Xam-0003LC-Hk
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 15:27:56 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d591795-113d-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 17:27:53 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6a04c581ee3so13956916d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2024 08:27:53 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1d7040sm43574426d6.107.2024.05.13.08.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 08:27:51 -0700 (PDT)
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
X-Inumbo-ID: 5d591795-113d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715614072; x=1716218872; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2r6U6XboQG2fdQVTVP/Ayy2jjx9leLzejn1rzqrKj98=;
        b=iofPF3uGNwNy7Zz5bszqoxlw6G0gCq8vxGLfFZ6t4sLjkyt0wJSMCQF5CEFvzHrSQ0
         Ol7oMG2UtIO0gnHYMrGyDHatJIdX9tmiReWLActwhBCB0HUQz0YnLcl5PDimq+Hn+nYM
         uwOulvg/qOhfU1W6S3BmgnvnxM5hEWXuUwIek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715614072; x=1716218872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2r6U6XboQG2fdQVTVP/Ayy2jjx9leLzejn1rzqrKj98=;
        b=epzzUIgsYm0VT3cekwy63N2Wc8+RTBCR7rbH5cocpTTVOmHK9WenkFySKwjfJZyIY/
         vfjX6JF0NkBVazUQ47be76PvMD8RH/xXhnXjcEMhuEaU0hpvLte03DhPRQc8wjHoIo6+
         x0Dy0DasUd0rgmb2AqhtQOpPTvXGSQLnNf6xwazKD3/2XGCx/AO/1xSToDXPPp34Q7vg
         Gcf7ydZhKroSTTCOYyi04UvOmiHO5slHl5FRoo+CNEAU0ssZmBcorJEaJhkOZfgaHSUb
         vPDUtA8bC9wnXPLctaZJ/YDuROJjrGTdyvawLQkq3sEBmPvWRMJ23BUR/VyZiS/HPjMx
         7lfQ==
X-Gm-Message-State: AOJu0YyiR0njppj33jVSTJCYqSWEz/oks9JS9REur0wef6JMBC5nlSyL
	a8fmba22JobVGB2s4AecU75Ec0y6hXnvzpztKl8PA9sztbkNc1Y1kFWbTiBdZ48=
X-Google-Smtp-Source: AGHT+IE8zhRpyTqM2dh3KZZmcJ+LjIx6vUP0uimEfK8L2aEnm7FLHZ3OtmdgASQg/B/azGV+TXbRUw==
X-Received: by 2002:a0c:9a9a:0:b0:6a3:2ab7:ecab with SMTP id 6a1803df08f44-6a32ab7edc9mr64221276d6.65.1715614072209;
        Mon, 13 May 2024 08:27:52 -0700 (PDT)
Date: Mon, 13 May 2024 17:27:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 01/19] x86: Create per-domain mapping of guest_root_pt
Message-ID: <ZkIxdtiDc_pnPWdx@macbook>
References: <20240513111117.68828-1-eliasely@amazon.com>
 <20240513111117.68828-2-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513111117.68828-2-eliasely@amazon.com>

On Mon, May 13, 2024 at 11:10:59AM +0000, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Create a per-domain mapping of PV guest_root_pt as direct map is being
> removed.
> 
> Note that we do not map and unmap root_pgt for now since it is still a
> xenheap page.

I'm afraid this needs more context, at least for me to properly
understand.

I think I've figured out what create_perdomain_mapping() is supposed
to do, and I have to admit the interface is very awkward.

Anyway, attempted to provide some feedback.

> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
>     Changes in V3:
>         * Rename SHADOW_ROOT
>         * Haven't addressed the potentially over-allocation issue as I don't get it
> 
>     Changes in V2:
>         * Rework the shadow perdomain mapping solution in the follow-up patches
> 
>     Changes since Hongyan's version:
>         * Remove the final dot in the commit title
> 
> diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
> index ab7288cb36..5d710384df 100644
> --- a/xen/arch/x86/include/asm/config.h
> +++ b/xen/arch/x86/include/asm/config.h
> @@ -203,7 +203,7 @@ extern unsigned char boot_edid_info[128];
>  /* Slot 260: per-domain mappings (including map cache). */
>  #define PERDOMAIN_VIRT_START    (PML4_ADDR(260))
>  #define PERDOMAIN_SLOT_MBYTES   (PML4_ENTRY_BYTES >> (20 + PAGETABLE_ORDER))
> -#define PERDOMAIN_SLOTS         3
> +#define PERDOMAIN_SLOTS         4
>  #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
>                                   (PERDOMAIN_SLOT_MBYTES << 20))
>  /* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
> @@ -317,6 +317,14 @@ extern unsigned long xen_phys_start;
>  #define ARG_XLAT_START(v)        \
>      (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
>  
> +/* pv_root_pt mapping area. The fourth per-domain-mapping sub-area */
> +#define PV_ROOT_PT_MAPPING_VIRT_START   PERDOMAIN_VIRT_SLOT(3)
> +#define PV_ROOT_PT_MAPPING_ENTRIES      MAX_VIRT_CPUS
> +
> +/* The address of a particular VCPU's PV_ROOT_PT */
> +#define PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v) \
> +    (PV_ROOT_PT_MAPPING_VIRT_START + ((v)->vcpu_id * PAGE_SIZE))

I know we are not there yet, but I wonder if we need to start having
some non-shared per-cpu mapping area in the page-tables.  Right now
this is shared between all the vCPUs, as it's per-domain space
(instead of per-vCPU).

> +
>  #define ELFSIZE 64
>  
>  #define ARCH_CRASH_SAVE_VMCOREINFO
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index f5daeb182b..8a97530607 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -272,6 +272,7 @@ struct time_scale {
>  struct pv_domain
>  {
>      l1_pgentry_t **gdt_ldt_l1tab;
> +    l1_pgentry_t **root_pt_l1tab;
>  
>      atomic_t nr_l4_pages;
>  
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index d968bbbc73..efdf20f775 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -505,6 +505,13 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
>      nrspin_unlock(&d->page_alloc_lock);
>  }
>  
> +#define pv_root_pt_idx(v) \
> +    ((v)->vcpu_id >> PAGETABLE_ORDER)
> +
> +#define pv_root_pt_pte(v) \
> +    ((v)->domain->arch.pv.root_pt_l1tab[pv_root_pt_idx(v)] + \
> +     ((v)->vcpu_id & (L1_PAGETABLE_ENTRIES - 1)))
> +
>  void make_cr3(struct vcpu *v, mfn_t mfn)
>  {
>      struct domain *d = v->domain;
> @@ -524,6 +531,13 @@ void write_ptbase(struct vcpu *v)
>  
>      if ( is_pv_vcpu(v) && v->domain->arch.pv.xpti )
>      {
> +        mfn_t guest_root_pt = _mfn(MASK_EXTR(v->arch.cr3, PAGE_MASK));
> +        l1_pgentry_t *pte = pv_root_pt_pte(v);
> +
> +        ASSERT(v == current);
> +
> +        l1e_write(pte, l1e_from_mfn(guest_root_pt, __PAGE_HYPERVISOR_RO));
> +
>          cpu_info->root_pgt_changed = true;
>          cpu_info->pv_cr3 = __pa(this_cpu(root_pgt));
>          if ( new_cr4 & X86_CR4_PCIDE )
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index 2a445bb17b..1b025986f7 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -288,6 +288,21 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
>                                1U << GDT_LDT_VCPU_SHIFT);
>  }
>  
> +static int pv_create_root_pt_l1tab(struct vcpu *v)
> +{
> +    return create_perdomain_mapping(v->domain,
> +                                    PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v),
> +                                    1, v->domain->arch.pv.root_pt_l1tab,
> +                                    NULL);
> +}
> +
> +static void pv_destroy_root_pt_l1tab(struct vcpu *v)

The two 'v' parameters could be const here.

> +
> +{
> +    destroy_perdomain_mapping(v->domain,
> +                              PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v), 1);
> +}
> +
>  void pv_vcpu_destroy(struct vcpu *v)
>  {
>      if ( is_pv_32bit_vcpu(v) )
> @@ -297,6 +312,7 @@ void pv_vcpu_destroy(struct vcpu *v)
>      }
>  
>      pv_destroy_gdt_ldt_l1tab(v);
> +    pv_destroy_root_pt_l1tab(v);
>      XFREE(v->arch.pv.trap_ctxt);
>  }
>  
> @@ -311,6 +327,13 @@ int pv_vcpu_initialise(struct vcpu *v)
>      if ( rc )
>          return rc;
>  
> +    if ( v->domain->arch.pv.xpti )
> +    {
> +        rc = pv_create_root_pt_l1tab(v);
> +        if ( rc )
> +            goto done;
> +    }
> +
>      BUILD_BUG_ON(X86_NR_VECTORS * sizeof(*v->arch.pv.trap_ctxt) >
>                   PAGE_SIZE);
>      v->arch.pv.trap_ctxt = xzalloc_array(struct trap_info, X86_NR_VECTORS);
> @@ -346,10 +369,12 @@ void pv_domain_destroy(struct domain *d)
>  
>      destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
>                                GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
> +    destroy_perdomain_mapping(d, PV_ROOT_PT_MAPPING_VIRT_START, PV_ROOT_PT_MAPPING_ENTRIES);

Line too long.  Also see comment below about using d->max_vcpus
instead of MAX_VIRT_CPUS.

>  
>      XFREE(d->arch.pv.cpuidmasks);
>  
>      FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
> +    FREE_XENHEAP_PAGE(d->arch.pv.root_pt_l1tab);
>  }
>  
>  void noreturn cf_check continue_pv_domain(void);
> @@ -371,6 +396,12 @@ int pv_domain_initialise(struct domain *d)
>          goto fail;
>      clear_page(d->arch.pv.gdt_ldt_l1tab);
>  
> +    d->arch.pv.root_pt_l1tab =
> +        alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
> +    if ( !d->arch.pv.root_pt_l1tab )
> +        goto fail;
> +    clear_page(d->arch.pv.root_pt_l1tab);
> +
>      if ( levelling_caps & ~LCAP_faulting &&
>           (d->arch.pv.cpuidmasks = xmemdup(&cpuidmask_defaults)) == NULL )
>          goto fail;
> @@ -381,6 +412,11 @@ int pv_domain_initialise(struct domain *d)
>      if ( rc )
>          goto fail;
>  
> +    rc = create_perdomain_mapping(d, PV_ROOT_PT_MAPPING_VIRT_START,
> +                                  PV_ROOT_PT_MAPPING_ENTRIES, NULL, NULL);

Why not use d->max_vcpus here, instead of forcing up to MAX_VIRT_CPUS?

By the time pv_domain_initialise() is called max_vcpus should already
be initialized.  AFAICT it doesn't make a difference, because for the
call here only the L3 table is created, as last two parameters are
NULL, but still is more accurate to use max_vcpus.

> +    if ( rc )
> +        goto fail;
> +
>      d->arch.ctxt_switch = &pv_csw;
>  
>      d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom : opt_xpti_domu;
> diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
> index 630bdc3945..c1ae5013af 100644
> --- a/xen/arch/x86/x86_64/asm-offsets.c
> +++ b/xen/arch/x86/x86_64/asm-offsets.c
> @@ -80,6 +80,7 @@ void __dummy__(void)
>  
>  #undef OFFSET_EF
>  
> +    OFFSET(VCPU_id, struct vcpu, vcpu_id);
>      OFFSET(VCPU_processor, struct vcpu, processor);
>      OFFSET(VCPU_domain, struct vcpu, domain);
>      OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info_area.map);
> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index df015589ce..c1377da7a5 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -162,7 +162,15 @@ FUNC_LOCAL(restore_all_guest)
>          and   %rsi, %rdi
>          and   %r9, %rsi
>          add   %rcx, %rdi
> +
> +        /*
> +         * The address in the vCPU cr3 is always mapped in the per-domain
> +         * pv_root_pt virt area.
> +         */
> +        imul  $PAGE_SIZE, VCPU_id(%rbx), %esi

Aren't some of the previous operations against %rsi now useless since
it gets unconditionally overwritten here?

and   %r9, %rsi
[...]
add   %rcx, %rsi

Thanks, Roger.

