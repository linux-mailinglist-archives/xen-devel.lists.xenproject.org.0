Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB59F352A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 17:01:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858352.1270585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNDXG-0004TC-IB; Mon, 16 Dec 2024 16:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858352.1270585; Mon, 16 Dec 2024 16:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNDXG-0004Q6-FN; Mon, 16 Dec 2024 16:01:30 +0000
Received: by outflank-mailman (input) for mailman id 858352;
 Mon, 16 Dec 2024 16:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQSc=TJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tNDXE-0004OV-UW
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 16:01:28 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01ee2447-bbc7-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 17:01:27 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3d2a30afcso7448834a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 08:01:28 -0800 (PST)
Received: from localhost ([85.152.134.39]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652f25c8bsm3441229a12.66.2024.12.16.08.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 08:01:26 -0800 (PST)
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
X-Inumbo-ID: 01ee2447-bbc7-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734364887; x=1734969687; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B3ybaM8PtQQdNLowhjYwJpjTluXmPdaIuEDjx5QwP8=;
        b=LxC4tYPqKlcg0c7mKhkgyq2PWrnjaTsCY6m2P1Fs+pe4IAq8iEu07edHY/bShzXfJ4
         IaemccKGmOFdDvfLwjg0ZKsGWOhW4G5DkeKS074ThOvBrSb3nRjPBxZkHiLe57UwBoe0
         vJ3juLXO4ZbCJv3MlructHRyh2Hi/+Ykzyjpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364887; x=1734969687;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6B3ybaM8PtQQdNLowhjYwJpjTluXmPdaIuEDjx5QwP8=;
        b=S2wQv4kDGFBEPXuEAtvya4B2yrpqAok0PpHqRqBD4736JddWI8gjPJoOuKmzyA9iyq
         u0pkZHZYQAZgh+lsv9EGsrmx2fbvRSo/FmSRJtEb5lJ3Li1rXUnxDYTOHv6Pi6Ce2mVZ
         UZ9x2b5PDCvU4eCcGGAePJImPUh82RRbQs2Ka1vF7ERlcBXVu9uRyNuvypgS967ZTBcB
         SVet+9WrnQzIYu0lbOoJprnMpquski1F8QoXGUOFjRia4lo5BPWvqDCsrqcZA6I0C87d
         uZGoNCvI6SWHFETT+dS+DrYpFJ3ByiCnvhofeyroHLxhUlDHW1rmT2WSVMLrJL1TqKy4
         ed7g==
X-Forwarded-Encrypted: i=1; AJvYcCWTsWKXIF66u+QVpwAlBEyix65ZR4wBYZo9EoUtmpIU3tBYT/gi0+o72mSQpmaN8z/V92G1s/nGiBo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+V30JwbXoXMC5LNm6nzOstbJ8uS7WvBG38BtWQjBYii/AnPAq
	tScG+nZ+rTvEYuzUuLfh/gb5ltMyJhhqYHWFTRRYxi5erjNsSkC6Gxn4n7jjGyM=
X-Gm-Gg: ASbGncsHr3utNWhFgC9KPivHrF2+k+nI9yu3xx9B9++YPQCY7Nvq8fzh441pgdfzwjb
	+PkSaXvnkHmmiYgWTSBSQETlmrQCJSXhlkg9qUAGT0U/IazbsY9gmr/6I69N4NEn/lU9T140FGA
	wr5Xvqgz9C/hDDe8cVpPzbK90uRV92DpggjmpzpTeXUs8IBJcwz0QA/xXezj2EIt8L8vLstaKQ9
	IylAU64LUYyD9qjgwcz9voUNSYoIOm5EfMdIZSmdA0R1RnMhbVR+ipO3WI6PGU=
X-Google-Smtp-Source: AGHT+IHtTZ8Sh7K7tBJDqoURioC4EckaGMN17svBeMu2iXG1rFWp6ZGZensMIZkZYPCV4glsTTzekw==
X-Received: by 2002:a17:906:3157:b0:aa6:aa8e:c89c with SMTP id a640c23a62f3a-aabdb88744amr14922566b.39.1734364886965;
        Mon, 16 Dec 2024 08:01:26 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 16:01:23 +0000
Message-Id: <D6D91G01K94X.2FF0VJ29P09FA@cloud.com>
Cc: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Hongyan
 Xia" <hongyxia@amazon.com>, "Julien Grall" <jgrall@amazon.com>
Subject: Re: [PATCH V4 01/15] x86: Create per-domain mapping for
 guest_root_pt
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Elias El Yandouzi" <eliasely@amazon.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241111131148.52568-1-eliasely@amazon.com>
 <20241111131148.52568-2-eliasely@amazon.com>
In-Reply-To: <20241111131148.52568-2-eliasely@amazon.com>

On Mon Nov 11, 2024 at 1:11 PM GMT, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
>
> This patch introduces a per-domain mapping for the `guest_root_pt` in PV
> guests as part of the effort to remove the direct map in Xen.
>
> For the time being, the `root_pgt` is not mapped or unmapped, as it remai=
ns
> a Xenheap page. This will be addressed in subsequent patches.
>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
>
> ----
>     Changes in V4:
>         * Fix over-allocation issue
>         * Update the mappings when switching from kernel to user-mode
>
>     Changes in V3:
>         * Rename SHADOW_ROOT
>         * Haven't addressed the potentially over-allocation issue as I do=
n't get it
>
>     Changes in V2:
>         * Rework the shadow perdomain mapping solution in the follow-up p=
atches
>
>     Changes since Hongyan's version:
>         * Remove the final dot in the commit title
>
> diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm=
/config.h
> index f8a5a4913b07..bd360ec4141e 100644
> --- a/xen/arch/x86/include/asm/config.h
> +++ b/xen/arch/x86/include/asm/config.h
> @@ -174,7 +174,7 @@
>  /* Slot 260: per-domain mappings (including map cache). */
>  #define PERDOMAIN_VIRT_START    (PML4_ADDR(260))
>  #define PERDOMAIN_SLOT_MBYTES   (PML4_ENTRY_BYTES >> (20 + PAGETABLE_ORD=
ER))
> -#define PERDOMAIN_SLOTS         3
> +#define PERDOMAIN_SLOTS         4
>  #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
>                                   (PERDOMAIN_SLOT_MBYTES << 20))
>  /* Slot 4: mirror of per-domain mappings (for compat xlat area accesses)=
. */
> @@ -288,6 +288,14 @@ extern unsigned long xen_phys_start;
>  #define ARG_XLAT_START(v)        \
>      (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
> =20
> +/* pv_root_pt mapping area. The fourth per-domain-mapping sub-area */
> +#define PV_ROOT_PT_MAPPING_VIRT_START   PERDOMAIN_VIRT_SLOT(3)
> +#define PV_ROOT_PT_MAPPING_ENTRIES      MAX_VIRT_CPUS
> +
> +/* The address of a particular VCPU's PV_ROOT_PT */
> +#define PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v) \
> +    (PV_ROOT_PT_MAPPING_VIRT_START + ((v)->vcpu_id * PAGE_SIZE))
> +
>  #define ELFSIZE 64
> =20
>  #define ARCH_CRASH_SAVE_VMCOREINFO
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm=
/domain.h
> index b79d6badd71c..478ce41ad8ca 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -272,6 +272,7 @@ struct time_scale {
>  struct pv_domain
>  {
>      l1_pgentry_t **gdt_ldt_l1tab;
> +    l1_pgentry_t **root_pt_l1tab;
> =20
>      atomic_t nr_l4_pages;
> =20
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index d537a799bced..a152e21bb086 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -516,6 +516,13 @@ void make_cr3(struct vcpu *v, mfn_t mfn)
>          v->arch.cr3 |=3D get_pcid_bits(v, false);
>  }
> =20
> +#define pv_root_pt_idx(v) \
> +    ((v)->vcpu_id >> PAGETABLE_ORDER)
> +
> +#define pv_root_pt_pte(v) \
> +    ((v)->domain->arch.pv.root_pt_l1tab[pv_root_pt_idx(v)] + \
> +     ((v)->vcpu_id & (L1_PAGETABLE_ENTRIES - 1)))
> +
>  void write_ptbase(struct vcpu *v)
>  {
>      const struct domain *d =3D v->domain;
> @@ -527,11 +534,16 @@ void write_ptbase(struct vcpu *v)
> =20
>      if ( is_pv_domain(d) && d->arch.pv.xpti )
>      {
> +        mfn_t guest_root_pt =3D _mfn(MASK_EXTR(v->arch.cr3, X86_CR3_ADDR=
_MASK));
> +        l1_pgentry_t *pte =3D pv_root_pt_pte(v);
> +
>          cpu_info->root_pgt_changed =3D true;
>          cpu_info->pv_cr3 =3D __pa(this_cpu(root_pgt));
>          if ( new_cr4 & X86_CR4_PCIDE )
>              cpu_info->pv_cr3 |=3D get_pcid_bits(v, true);
>          switch_cr3_cr4(v->arch.cr3, new_cr4);
> +
> +        l1e_write(pte, l1e_from_mfn(guest_root_pt, __PAGE_HYPERVISOR_RO)=
);
>      }
>      else
>      {
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index d5a8564c1cbe..1a1c999743ac 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -289,6 +289,21 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
>                                1U << GDT_LDT_VCPU_SHIFT);
>  }
> =20
> +static int pv_create_root_pt_l1tab(const struct vcpu *v)
> +{
> +    return create_perdomain_mapping(v->domain,
> +                                    PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v=
),
> +                                    1, v->domain->arch.pv.root_pt_l1tab,
> +                                    NULL);
> +}
> +
> +static void pv_destroy_root_pt_l1tab(const struct vcpu *v)
> +
> +{
> +    destroy_perdomain_mapping(v->domain,
> +                              PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v), 1);
> +}
> +
>  void pv_vcpu_destroy(struct vcpu *v)
>  {
>      if ( is_pv_32bit_vcpu(v) )
> @@ -298,6 +313,7 @@ void pv_vcpu_destroy(struct vcpu *v)
>      }
> =20
>      pv_destroy_gdt_ldt_l1tab(v);
> +    pv_destroy_root_pt_l1tab(v);
>      XFREE(v->arch.pv.trap_ctxt);
>  }
> =20
> @@ -312,6 +328,13 @@ int pv_vcpu_initialise(struct vcpu *v)
>      if ( rc )
>          return rc;
> =20
> +    if ( v->domain->arch.pv.xpti )
> +    {
> +        rc =3D pv_create_root_pt_l1tab(v);
> +        if ( rc )
> +            goto done;
> +    }
> +
>      BUILD_BUG_ON(X86_NR_VECTORS * sizeof(*v->arch.pv.trap_ctxt) >
>                   PAGE_SIZE);
>      v->arch.pv.trap_ctxt =3D xzalloc_array(struct trap_info, X86_NR_VECT=
ORS);
> @@ -347,10 +370,12 @@ void pv_domain_destroy(struct domain *d)
> =20
>      destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
>                                GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
> +    destroy_perdomain_mapping(d, PV_ROOT_PT_MAPPING_VIRT_START, d->max_v=
cpus);
> =20
>      XFREE(d->arch.pv.cpuidmasks);
> =20
>      FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
> +    FREE_XENHEAP_PAGE(d->arch.pv.root_pt_l1tab);

With root_pt_l1tab coming from xzalloc_array(), this must use XFREE() inste=
ad.

  XFREE(v->arch.pv.root_pt_l1tab);

>  }
> =20
>  void noreturn cf_check continue_pv_domain(void);
> @@ -382,8 +407,22 @@ int pv_domain_initialise(struct domain *d)
>      if ( rc )
>          goto fail;
> =20
> +    rc =3D create_perdomain_mapping(d, PV_ROOT_PT_MAPPING_VIRT_START,
> +                                  d->max_vcpus, NULL, NULL);
> +    if ( rc )
> +        goto fail;
> +
>      d->arch.ctxt_switch =3D &pv_csw;
> =20
> +    if ( d->arch.pv.xpti )
> +    {
> +        d->arch.pv.root_pt_l1tab =3D
> +            xzalloc_array(l1_pgentry_t *,
> +                          DIV_ROUND_UP(d->max_vcpus, L1_PAGETABLE_ENTRIE=
S));
> +        if ( !d->arch.pv.root_pt_l1tab )
> +            goto fail;
> +    }
> +
>      if ( !is_pv_32bit_domain(d) && use_invpcid && cpu_has_pcid )
>          switch ( ACCESS_ONCE(opt_pcid) )
>          {
> @@ -457,7 +496,8 @@ static void _toggle_guest_pt(struct vcpu *v)
>              guest_update =3D false;
>          }
>      }
> -    write_cr3(cr3);
> +
> +    write_ptbase(v);
> =20
>      if ( !pagetable_is_null(old_shadow) )
>          shadow_put_top_level(v->domain, old_shadow);
> @@ -497,9 +537,6 @@ void toggle_guest_mode(struct vcpu *v)
>      {
>          struct cpu_info *cpu_info =3D get_cpu_info();
> =20
> -        cpu_info->root_pgt_changed =3D true;
> -        cpu_info->pv_cr3 =3D __pa(this_cpu(root_pgt)) |
> -                           (d->arch.pv.pcid ? get_pcid_bits(v, true) : 0=
);
>          /*
>           * As in _toggle_guest_pt() the XPTI CR3 write needs to be a TLB=
-
>           * flushing one too for shadow mode guests.
> diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-=
offsets.c
> index 630bdc39451d..c1ae5013af96 100644
> --- a/xen/arch/x86/x86_64/asm-offsets.c
> +++ b/xen/arch/x86/x86_64/asm-offsets.c
> @@ -80,6 +80,7 @@ void __dummy__(void)
> =20
>  #undef OFFSET_EF
> =20
> +    OFFSET(VCPU_id, struct vcpu, vcpu_id);
>      OFFSET(VCPU_processor, struct vcpu, processor);
>      OFFSET(VCPU_domain, struct vcpu, domain);
>      OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info_area.map);
> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index c5c723b5f4d4..91413b905768 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -170,9 +170,16 @@ FUNC_LOCAL(restore_all_guest)
>          movabs $PADDR_MASK & PAGE_MASK, %rsi
>          movabs $DIRECTMAP_VIRT_START, %rcx
>          and   %rsi, %rdi
> -        and   %r9, %rsi
>          add   %rcx, %rdi
> +
> +        /*
> +         * The address in the vCPU cr3 is always mapped in the per-domai=
n
> +         * pv_root_pt virt area.
> +         */
> +        imul  $PAGE_SIZE, VCPU_id(%rbx), %esi
> +        movabs $PV_ROOT_PT_MAPPING_VIRT_START, %rcx
>          add   %rcx, %rsi
> +
>          mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
>          mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
>          mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)


