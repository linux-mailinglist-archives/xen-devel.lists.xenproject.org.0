Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D141A0723F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 10:56:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867946.1279486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpGa-0002t0-Nh; Thu, 09 Jan 2025 09:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867946.1279486; Thu, 09 Jan 2025 09:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpGa-0002qP-KV; Thu, 09 Jan 2025 09:55:52 +0000
Received: by outflank-mailman (input) for mailman id 867946;
 Thu, 09 Jan 2025 09:55:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl7y=UB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVpGZ-0002qH-QA
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 09:55:51 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e74e0026-ce6f-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 10:55:49 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so5358695e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 01:55:49 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37c17sm15151555e9.27.2025.01.09.01.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 01:55:48 -0800 (PST)
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
X-Inumbo-ID: e74e0026-ce6f-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736416548; x=1737021348; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5ze1jAUAJrU/mqlh6re5lCEkd/F9jk6JppPFxVKCH8=;
        b=BwqY3xFN1nMwMDqUpTztTMjnAn/Wa0Y+RGtn9owKYzIg0ACaSZH9r0VVN+WZuuxfA+
         AWd9XXO7zFXlWBHrop90l8v8VOHqKRaw+Ncje5QEw/BOZzUumcmcNtbqKV+EzFrS053P
         4fqQgcwNbqUjTt/HgEPGofs/miwJYtK9RlxuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736416548; x=1737021348;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e5ze1jAUAJrU/mqlh6re5lCEkd/F9jk6JppPFxVKCH8=;
        b=MXb79YF2GsF1vE6KPW2ADL28iZ0IOn2hcSRth9bUP/MhIWFuzt03vQMtt8OJ6cixnX
         ZoLzFlsRoTfam+k1rkZnnWlA6j5vBiObp69EAJl+m+43GFfqHcP9u3/5ZvfTYPdQoFDu
         9xA0EAARXTZnOybbmGcnEJ+DfYSL8i2+VPG5uAKlvSUfKIQmZXQSdXC+RpWkNzl54jbM
         gZexBAM9fFjiERFiVdE21CDAaHsFSOkAkFeUHbbQqxxG0imaPbTNh6gMQMXkUQxDZqXK
         P2LTDXrIzju//22yqNIHo1i2oyGqsUo7RTDV3TTN1pBdil6lA70JxeaqnbHLEZk7PLlx
         6l9g==
X-Forwarded-Encrypted: i=1; AJvYcCX6uZgLFQRQqx9IDs3IpaiE6U1GCU2Ybx/HoUVW+TZumxUlkjuMjTrx/zuScycbnM1pswVkVZFSdFU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBF89eG6zEOaleafuAXNPw734PTqCXY4oxwVPB8+llPLLp0NUS
	zYgiBpoK3RadH35hD/EjeK6P/Kpa0IQdp/3lNe1iQD7xnvDoei5pL+bKGZisO4I=
X-Gm-Gg: ASbGncu7wIVpP+BE+hjGOHqOA96Mdf/Ye4ma0ambfZFmznqfKJfRxZQhd4KcxXV97xT
	i+nlwf+6DB+K4I1pbHUxysSZEzxpFWkdZKG2Gxwxz0Jn9EJrruBznYgrLNFfKLGAAZ+t7VtTPz6
	5HvfaO+qQZPKh+u1ykkFBmElUaGcLS6F/paCZHG4bb17ACkpArd4iuumWjLawNtYFWa4zvIrB6/
	k34BJWNg8ai7VQRacxkiZbgUJ+pOOn4t05HbZHrpf3E7dn3RPmoGuqEshzkVu0=
X-Google-Smtp-Source: AGHT+IFpYt+jJjz7htu8g0ZTzUImdNVt5vgoYuHGBiXy5TRbHENoSI3FKQ5xyOhkk7+1iz7aPBvWaw==
X-Received: by 2002:a05:600c:3b91:b0:436:46f9:4fc6 with SMTP id 5b1f17b1804b1-436e26928e6mr54604865e9.8.1736416548420;
        Thu, 09 Jan 2025 01:55:48 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jan 2025 09:55:44 +0000
Message-Id: <D6XGAK96L261.324ZJ1U3UO8LF@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 04/18] x86/pv: introduce function to populate
 perdomain area and use it to map Xen GDT
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-5-roger.pau@citrix.com>
In-Reply-To: <20250108142659.99490-5-roger.pau@citrix.com>

On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> The current code to update the Xen part of the GDT when running a PV gues=
t
> relies on caching the direct map address of all the L1 tables used to map=
 the
> GDT and LDT, so that entries can be modified.
>
> Introduce a new function that populates the per-domain region, either usi=
ng the
> recursive linear mappings when the target vCPU is the current one, or by
> directly modifying the L1 table of the per-domain region.
>
> Using such function to populate per-domain addresses drops the need to ke=
ep a
> reference to per-domain L1 tables previously used to change the per-domai=
n
> mappings.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/domain.c                | 11 +++-
>  xen/arch/x86/include/asm/desc.h      |  6 +-
>  xen/arch/x86/include/asm/mm.h        |  2 +
>  xen/arch/x86/include/asm/processor.h |  5 ++
>  xen/arch/x86/mm.c                    | 88 ++++++++++++++++++++++++++++
>  xen/arch/x86/smpboot.c               |  6 +-
>  xen/arch/x86/traps.c                 | 10 ++--
>  7 files changed, 113 insertions(+), 15 deletions(-)
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 1f680bf176ee..0bd0ef7e40f4 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1953,9 +1953,14 @@ static always_inline bool need_full_gdt(const stru=
ct domain *d)
> =20
>  static void update_xen_slot_in_full_gdt(const struct vcpu *v, unsigned i=
nt cpu)
>  {
> -    l1e_write(pv_gdt_ptes(v) + FIRST_RESERVED_GDT_PAGE,
> -              !is_pv_32bit_vcpu(v) ? per_cpu(gdt_l1e, cpu)
> -                                   : per_cpu(compat_gdt_l1e, cpu));
> +    ASSERT(v !=3D current);

For this assert, and others below. IIUC, curr_vcpu =3D=3D current when we'r=
e
properly switched. When we're idling current =3D=3D idle and curr_vcpu =3D=
=3D prev_ctx.

Granted, calling this in the middle of a lazy idle loop would be weird, but
would it make sense for PT consistency to use curr_vcpu here...

> +
> +    populate_perdomain_mapping(v,
> +                               GDT_VIRT_START(v) +
> +                               (FIRST_RESERVED_GDT_PAGE << PAGE_SHIFT),
> +                               !is_pv_32bit_vcpu(v) ? &per_cpu(gdt_mfn, =
cpu)
> +                                                    : &per_cpu(compat_gd=
t_mfn,
> +                                                               cpu), 1);
>  }
> =20
>  static void load_full_gdt(const struct vcpu *v, unsigned int cpu)
> diff --git a/xen/arch/x86/include/asm/desc.h b/xen/arch/x86/include/asm/d=
esc.h
> index a1e0807d97ed..33981bfca588 100644
> --- a/xen/arch/x86/include/asm/desc.h
> +++ b/xen/arch/x86/include/asm/desc.h
> @@ -44,6 +44,8 @@
> =20
>  #ifndef __ASSEMBLY__
> =20
> +#include <xen/mm-frame.h>
> +
>  #define GUEST_KERNEL_RPL(d) (is_pv_32bit_domain(d) ? 1 : 3)
> =20
>  /* Fix up the RPL of a guest segment selector. */
> @@ -212,10 +214,10 @@ struct __packed desc_ptr {
> =20
>  extern seg_desc_t boot_gdt[];
>  DECLARE_PER_CPU(seg_desc_t *, gdt);
> -DECLARE_PER_CPU(l1_pgentry_t, gdt_l1e);
> +DECLARE_PER_CPU(mfn_t, gdt_mfn);
>  extern seg_desc_t boot_compat_gdt[];
>  DECLARE_PER_CPU(seg_desc_t *, compat_gdt);
> -DECLARE_PER_CPU(l1_pgentry_t, compat_gdt_l1e);
> +DECLARE_PER_CPU(mfn_t, compat_gdt_mfn);
>  DECLARE_PER_CPU(bool, full_gdt_loaded);
> =20
>  static inline void lgdt(const struct desc_ptr *gdtr)
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.=
h
> index 6c7e66ee21ab..b50a51327b2b 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -603,6 +603,8 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUES=
T_HANDLE_PARAM(void) arg);
>  int create_perdomain_mapping(struct domain *d, unsigned long va,
>                               unsigned int nr, l1_pgentry_t **pl1tab,
>                               struct page_info **ppg);
> +void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
> +                                mfn_t *mfn, unsigned long nr);
>  void destroy_perdomain_mapping(struct domain *d, unsigned long va,
>                                 unsigned int nr);
>  void free_perdomain_mappings(struct domain *d);
> diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/=
asm/processor.h
> index d247ef8dd226..82ee89f736c2 100644
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -243,6 +243,11 @@ static inline unsigned long cr3_pa(unsigned long cr3=
)
>      return cr3 & X86_CR3_ADDR_MASK;
>  }
> =20
> +static inline mfn_t cr3_mfn(unsigned long cr3)
> +{
> +    return maddr_to_mfn(cr3_pa(cr3));
> +}
> +
>  static inline unsigned int cr3_pcid(unsigned long cr3)
>  {
>      return IS_ENABLED(CONFIG_PV) ? cr3 & X86_CR3_PCID_MASK : 0;
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 3d5dd22b6c36..0abea792486c 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6423,6 +6423,94 @@ int create_perdomain_mapping(struct domain *d, uns=
igned long va,
>      return rc;
>  }
> =20
> +void populate_perdomain_mapping(const struct vcpu *v, unsigned long va,
> +                                mfn_t *mfn, unsigned long nr)
> +{
> +    l1_pgentry_t *l1tab =3D NULL, *pl1e;
> +    const l3_pgentry_t *l3tab;
> +    const l2_pgentry_t *l2tab;
> +    struct domain *d =3D v->domain;
> +
> +    ASSERT(va >=3D PERDOMAIN_VIRT_START &&
> +           va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
> +    ASSERT(!nr || !l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
> +
> +    /* Use likely to force the optimization for the fast path. */
> +    if ( likely(v =3D=3D current) )

... and here? In particular I'd expect using curr_vcpu here means...

> +    {
> +        unsigned int i;
> +
> +        /* Ensure page-tables are from current (if current !=3D curr_vcp=
u). */
> +        sync_local_execstate();

... this should not be needed.

> +
> +        /* Fast path: get L1 entries using the recursive linear mappings=
. */
> +        pl1e =3D &__linear_l1_table[l1_linear_offset(va)];
> +
> +        for ( i =3D 0; i < nr; i++, pl1e++ )
> +        {
> +            if ( unlikely(perdomain_l1e_needs_freeing(*pl1e)) )
> +            {
> +                ASSERT_UNREACHABLE();
> +                free_domheap_page(l1e_get_page(*pl1e));
> +            }
> +            l1e_write(pl1e, l1e_from_mfn(mfn[i], __PAGE_HYPERVISOR_RW));
> +        }
> +
> +        return;
> +    }
> +
> +    ASSERT(d->arch.perdomain_l3_pg);
> +    l3tab =3D __map_domain_page(d->arch.perdomain_l3_pg);
> +
> +    if ( unlikely(!(l3e_get_flags(l3tab[l3_table_offset(va)]) &
> +                    _PAGE_PRESENT)) )
> +    {
> +        unmap_domain_page(l3tab);
> +        gprintk(XENLOG_ERR, "unable to map at VA %lx: L3e not present\n"=
, va);
> +        ASSERT_UNREACHABLE();
> +        domain_crash(d);
> +
> +        return;
> +    }
> +
> +    l2tab =3D map_l2t_from_l3e(l3tab[l3_table_offset(va)]);
> +
> +    for ( ; nr--; va +=3D PAGE_SIZE, mfn++ )
> +    {
> +        if ( !l1tab || !l1_table_offset(va) )
> +        {
> +            const l2_pgentry_t *pl2e =3D l2tab + l2_table_offset(va);
> +
> +            if ( unlikely(!(l2e_get_flags(*pl2e) & _PAGE_PRESENT)) )
> +            {
> +                gprintk(XENLOG_ERR, "unable to map at VA %lx: L2e not pr=
esent\n",
> +                        va);
> +                ASSERT_UNREACHABLE();
> +                domain_crash(d);
> +
> +                break;
> +            }
> +
> +            unmap_domain_page(l1tab);
> +            l1tab =3D map_l1t_from_l2e(*pl2e);
> +        }
> +
> +        pl1e =3D &l1tab[l1_table_offset(va)];
> +
> +        if ( unlikely(perdomain_l1e_needs_freeing(*pl1e)) )
> +        {
> +            ASSERT_UNREACHABLE();
> +            free_domheap_page(l1e_get_page(*pl1e));
> +        }
> +
> +        l1e_write(pl1e, l1e_from_mfn(*mfn, __PAGE_HYPERVISOR_RW));
> +    }
> +
> +    unmap_domain_page(l1tab);
> +    unmap_domain_page(l2tab);
> +    unmap_domain_page(l3tab);
> +}
> +
>  void destroy_perdomain_mapping(struct domain *d, unsigned long va,
>                                 unsigned int nr)
>  {
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 79a79c54c304..a740a6402272 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -1059,8 +1059,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
>      if ( gdt =3D=3D NULL )
>          goto out;
>      per_cpu(gdt, cpu) =3D gdt;
> -    per_cpu(gdt_l1e, cpu) =3D
> -        l1e_from_pfn(virt_to_mfn(gdt), __PAGE_HYPERVISOR_RW);
> +    per_cpu(gdt_mfn, cpu) =3D _mfn(virt_to_mfn(gdt));
>      memcpy(gdt, boot_gdt, NR_RESERVED_GDT_PAGES * PAGE_SIZE);
>      BUILD_BUG_ON(NR_CPUS > 0x10000);
>      gdt[PER_CPU_GDT_ENTRY - FIRST_RESERVED_GDT_ENTRY].a =3D cpu;
> @@ -1069,8 +1068,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
>      per_cpu(compat_gdt, cpu) =3D gdt =3D alloc_xenheap_pages(0, memflags=
);
>      if ( gdt =3D=3D NULL )
>          goto out;
> -    per_cpu(compat_gdt_l1e, cpu) =3D
> -        l1e_from_pfn(virt_to_mfn(gdt), __PAGE_HYPERVISOR_RW);
> +    per_cpu(compat_gdt_mfn, cpu) =3D _mfn(virt_to_mfn(gdt));
>      memcpy(gdt, boot_compat_gdt, NR_RESERVED_GDT_PAGES * PAGE_SIZE);
>      gdt[PER_CPU_GDT_ENTRY - FIRST_RESERVED_GDT_ENTRY].a =3D cpu;
>  #endif
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 487b8c5a78c5..a7f6fb611c34 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -92,10 +92,10 @@ DEFINE_PER_CPU(uint64_t, efer);
>  static DEFINE_PER_CPU(unsigned long, last_extable_addr);
> =20
>  DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, gdt);
> -DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, gdt_l1e);
> +DEFINE_PER_CPU_READ_MOSTLY(mfn_t, gdt_mfn);
>  #ifdef CONFIG_PV32
>  DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, compat_gdt);
> -DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, compat_gdt_l1e);
> +DEFINE_PER_CPU_READ_MOSTLY(mfn_t, compat_gdt_mfn);
>  #endif
> =20
>  /* Master table, used by CPU0. */
> @@ -2219,11 +2219,9 @@ void __init trap_init(void)
>      init_ler();
> =20
>      /* Cache {,compat_}gdt_l1e now that physically relocation is done. *=
/
> -    this_cpu(gdt_l1e) =3D
> -        l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
> +    this_cpu(gdt_mfn) =3D _mfn(virt_to_mfn(boot_gdt));
>      if ( IS_ENABLED(CONFIG_PV32) )
> -        this_cpu(compat_gdt_l1e) =3D
> -            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR=
_RW);
> +        this_cpu(compat_gdt_mfn) =3D _mfn(virt_to_mfn(boot_compat_gdt));
> =20
>      percpu_traps_init();
> =20


