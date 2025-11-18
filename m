Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7CC67A2B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 07:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164308.1491297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLElH-00065l-DF; Tue, 18 Nov 2025 06:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164308.1491297; Tue, 18 Nov 2025 06:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLElH-00063p-5l; Tue, 18 Nov 2025 06:00:19 +0000
Received: by outflank-mailman (input) for mailman id 1164308;
 Tue, 18 Nov 2025 06:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLElG-00062J-7N
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 06:00:18 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da5aa994-c443-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 07:00:15 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-591c9934e0cso6857743e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 22:00:15 -0800 (PST)
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
X-Inumbo-ID: da5aa994-c443-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445615; x=1764050415; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeSS4uhBN9NNuPmb/1pEFbUIM+VWWMWtO/VGATlPPeo=;
        b=OqmM9POZFzp8Hv8N+z4F3v2VwsbtwNg5bRfSw6asJ3YWKajk3a+PfWr5AU2p80X+iX
         FV3tzaJikpyUXmQ7i68Tr2kmVKI7Ykttz/mQroVKWp+4TJdWrWcq94d7prnpBFO22fS4
         2mkxTduEAyvgdqVM8KXY6w5bcCnlG2SBe+AoM/i4tTtGu45XbF6atRFx162sXqERhAP3
         vDzASszBWq5UIhSPYB7mr0GpG6xPjdM80e8ESD07+Z+H7KfjHznWoiLF+u1yOu1Ehmz2
         EfJ9ZeV84gTm5PqTbcLi3MXkLNP6ZRqgcpAk+XqkLpQlBPVidpI6ac9Ki++CJgmpqe4n
         CTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445615; x=1764050415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IeSS4uhBN9NNuPmb/1pEFbUIM+VWWMWtO/VGATlPPeo=;
        b=lBnxir47yqqOFr1cRNg8J6Ivrwe9a2D3IfOG8loI38u+O6sFD1bDTGYNu1EDniCdRO
         ErE8DZvBWeTxX+wV0DMxJ6rvp4NJWze5H0aAl8h7PSqXEmLnBGQorZsx7benI33sgYgE
         ZEpPuRoRnHRfBwkr9m9vR55NuycfgOuI16SIyORWmzl29QohyTSA7kz7KWjpA/ESqf2V
         +bQyESk/HLWfpzSzeLoGKBFZVmM9upD8gqri51vJ2QZ/5Svksldxxw77eaH+EVjKN3um
         UJuq6GhyDmR1ZKuZ4UO/S3tcOUdUUA8ped/IjPfVCYx5W73fkBoj4j4o5w2ATQcw/D4O
         nwHg==
X-Gm-Message-State: AOJu0YwyWhiDkH7OMYK+mC9OdtzKiAtBjjKadB4pXx0k2XG/evsYnNzG
	8CO0JRl2KtTPLm6WT4E/hs0em3kUaqtZ6fGCzL6z9fX8a6Z0YlJPEAfewjXPt48BTdm77u8dJCa
	1Sdu4JVWj9DUNt/sUg2KPn9hA/YHhX/4=
X-Gm-Gg: ASbGncsJqMU9DiAT4Pq+MrZ2nwirXC4esRO0fV51KnYXRRK7iU8yuvdFN90okYcGa4s
	LXG6lcwy5gQSSBSYF9wtsCZwrNsDNwdx4gelgi3csSZc1YUGFdBNNDKDZmewth0P2v62I4ZHrcU
	aUmcE73UrUKBUukecBU89On2hj8Jz1WJxhjWlLlxin4Oh780lpLbGTrdiLdA5FjRY8jsCeKaHGa
	/NdTLnG5n9vsGbbajbMQjI+kl6amCH/d/H8eGSckOPSyrX+NarkdWFDh6DrdSNts1tEDA==
X-Google-Smtp-Source: AGHT+IHgDNIwCZCsv/X2P7hPAH9Y0IOEqp94we9aYD7IdiGmswu6oRFAQLUZf2s3t5H2Sfyu7fsb1zZVGPhpptcgMBQ=
X-Received: by 2002:a05:6512:10cb:b0:595:9152:b93b with SMTP id
 2adb3069b0e04-5959152bc62mr2142066e87.0.1763445614310; Mon, 17 Nov 2025
 22:00:14 -0800 (PST)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-15-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-15-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 18 Nov 2025 08:00:00 +0200
X-Gm-Features: AWmQ_bk8eFf3d2mqJQYVJorMzUBUNVWoGngUk9pk2JGks4LUuuPD8njMnEZ4a2w
Message-ID: <CAGeoDV9bc4uNeSJ_H5G6WwbOiwdvkS+aZXpLr4K10mtRZX5vPA@mail.gmail.com>
Subject: Re: [PATCH v7 14/16] x86/domain: enable per-domain I/O port bitmaps
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thank you for the patch.

On Tue, Sep 9, 2025 at 12:12=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Current design enables all HVM domains share the same I/O port bitmap.
>
> It is necessary for domains crafting its own I/O port address space depen=
ding
> on the user configuration.
>
> Ensure NS16550 emulator does not share I/O ports with the physical I/O po=
rts,
> which is essential for emulation in PVH hwdom case (dom0).
>
> Not a functional change.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - n/a
> ---
>  xen/arch/x86/Makefile                    |   1 +
>  xen/arch/x86/dom0_build.c                | 111 +--------------
>  xen/arch/x86/hvm/hvm.c                   |  35 +----
>  xen/arch/x86/hvm/nestedhvm.c             |   8 +-
>  xen/arch/x86/hvm/quirks.c                |   3 -
>  xen/arch/x86/hvm/svm/nestedsvm.c         |   2 +-
>  xen/arch/x86/hvm/vmx/vvmx.c              |   4 +-
>  xen/arch/x86/include/asm/hvm/nestedhvm.h |   3 +-
>  xen/arch/x86/include/asm/hvm/support.h   |   2 -
>  xen/arch/x86/include/asm/iocap.h         |   2 +
>  xen/arch/x86/ioport.c                    | 163 +++++++++++++++++++++++
>  xen/arch/x86/pv/dom0_build.c             |   4 +
>  xen/common/emul/vuart/ns16x50.c          |  11 ++
>  13 files changed, 200 insertions(+), 149 deletions(-)
>  create mode 100644 xen/arch/x86/ioport.c
>
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index d7aed7d92c15..85a8475e126c 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -44,6 +44,7 @@ obj-y +=3D msi.o
>  obj-y +=3D msr.o
>  obj-$(CONFIG_INDIRECT_THUNK) +=3D indirect-thunk.o
>  obj-$(CONFIG_RETURN_THUNK) +=3D indirect-thunk.o
> +obj-y +=3D ioport.o
>  obj-$(CONFIG_PV) +=3D ioport_emulate.o
>  obj-y +=3D irq.o
>  obj-$(CONFIG_KEXEC) +=3D machine_kexec.o
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 0b467fd4a4fc..26202b33345c 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -298,9 +298,6 @@ int __init parse_arch_dom0_param(const char *s, const=
 char *e)
>      return 0;
>  }
>
> -static char __initdata opt_dom0_ioports_disable[200] =3D "";
> -string_param("dom0_ioports_disable", opt_dom0_ioports_disable);
> -
>  static bool __initdata ro_hpet =3D true;
>  boolean_param("ro-hpet", ro_hpet);
>
> @@ -433,122 +430,20 @@ unsigned long __init dom0_compute_nr_pages(
>      return nr_pages;
>  }
>
> -static void __init process_dom0_ioports_disable(struct domain *dom0)
> -{
> -    unsigned long io_from, io_to;
> -    char *t, *s =3D opt_dom0_ioports_disable;
> -    const char *u;
> -
> -    if ( *s =3D=3D '\0' )
> -        return;
> -
> -    while ( (t =3D strsep(&s, ",")) !=3D NULL )
> -    {
> -        io_from =3D simple_strtoul(t, &u, 16);
> -        if ( u =3D=3D t )
> -        {
> -        parse_error:
> -            printk("Invalid ioport range <%s> "
> -                   "in dom0_ioports_disable, skipping\n", t);
> -            continue;
> -        }
> -
> -        if ( *u =3D=3D '\0' )
> -            io_to =3D io_from;
> -        else if ( *u =3D=3D '-' )
> -            io_to =3D simple_strtoul(u + 1, &u, 16);
> -        else
> -            goto parse_error;
> -
> -        if ( (*u !=3D '\0') || (io_to < io_from) || (io_to >=3D 65536) )
> -            goto parse_error;
> -
> -        printk("Disabling dom0 access to ioport range %04lx-%04lx\n",
> -            io_from, io_to);
> -
> -        if ( ioports_deny_access(dom0, io_from, io_to) !=3D 0 )
> -            BUG();
> -    }
> -}
> -
> +/* Modify I/O memory access permissions. */
>  int __init dom0_setup_permissions(struct domain *d)
>  {
>      unsigned long mfn;
> -    unsigned int i, offs;
> -    int rc;
> +    unsigned int i;
> +    int rc =3D 0;
>
>      if ( pv_shim )
>          return 0;
>
> -    /* The hardware domain is initially permitted full I/O capabilities.=
 */
> -    rc =3D ioports_permit_access(d, 0, 0xFFFF);
>      rc |=3D iomem_permit_access(d, 0UL,
>                                PFN_DOWN(1UL << domain_max_paddr_bits(d)) =
- 1);
>      rc |=3D irqs_permit_access(d, 1, nr_irqs_gsi - 1);
>
> -    /* Modify I/O port access permissions. */
> -
> -    for ( offs =3D 0, i =3D ISOLATE_LSB(i8259A_alias_mask) ?: 2;
> -          offs <=3D i8259A_alias_mask; offs +=3D i )
> -    {
> -        if ( offs & ~i8259A_alias_mask )
> -            continue;
> -        /* Master Interrupt Controller (PIC). */
> -        rc |=3D ioports_deny_access(d, 0x20 + offs, 0x21 + offs);
> -        /* Slave Interrupt Controller (PIC). */
> -        rc |=3D ioports_deny_access(d, 0xA0 + offs, 0xA1 + offs);
> -    }
> -
> -    /* ELCR of both PICs. */
> -    rc |=3D ioports_deny_access(d, 0x4D0, 0x4D1);
> -
> -    /* Interval Timer (PIT). */
> -    for ( offs =3D 0, i =3D ISOLATE_LSB(pit_alias_mask) ?: 4;
> -          offs <=3D pit_alias_mask; offs +=3D i )
> -        if ( !(offs & ~pit_alias_mask) )
> -            rc |=3D ioports_deny_access(d, PIT_CH0 + offs, PIT_MODE + of=
fs);
> -
> -    /* PIT Channel 2 / PC Speaker Control. */
> -    rc |=3D ioports_deny_access(d, 0x61, 0x61);
> -
> -    /* INIT# and alternative A20M# control. */
> -    rc |=3D ioports_deny_access(d, 0x92, 0x92);
> -
> -    /* IGNNE# control. */
> -    rc |=3D ioports_deny_access(d, 0xF0, 0xF0);
> -
> -    /* ACPI PM Timer. */
> -    if ( pmtmr_ioport )
> -        rc |=3D ioports_deny_access(d, pmtmr_ioport, pmtmr_ioport + 3);
> -
> -    /* Reset control. */
> -    rc |=3D ioports_deny_access(d, 0xCF9, 0xCF9);
> -
> -    /* PCI configuration space (NB. 0xCF8 has special treatment). */
> -    rc |=3D ioports_deny_access(d, 0xCFC, 0xCFF);
> -
> -#ifdef CONFIG_HVM
> -    if ( is_hvm_domain(d) )
> -    {
> -        /* ISA DMA controller, channels 0-3 (incl possible aliases). */
> -        rc |=3D ioports_deny_access(d, 0x00, 0x1F);
> -        /* ISA DMA controller, page registers (incl various reserved one=
s). */
> -        rc |=3D ioports_deny_access(d, 0x80 + !!hvm_port80_allowed, 0x8F=
);
> -        /* ISA DMA controller, channels 4-7 (incl usual aliases). */
> -        rc |=3D ioports_deny_access(d, 0xC0, 0xDF);
> -
> -        /* HVM debug console IO port. */
> -        rc |=3D ioports_deny_access(d, XEN_HVM_DEBUGCONS_IOPORT,
> -                                  XEN_HVM_DEBUGCONS_IOPORT);
> -        if ( amd_acpi_c1e_quirk )
> -            rc |=3D ioports_deny_access(d, acpi_smi_cmd, acpi_smi_cmd);
> -    }
> -#endif
> -    /* Command-line I/O ranges. */
> -    process_dom0_ioports_disable(d);
> -
> -    /* Modify I/O memory access permissions. */
> -
>      /* Local APIC. */
>      if ( mp_lapic_addr !=3D 0 )
>      {
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 363c010f8dcc..1fc16a22e157 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -51,6 +51,7 @@
>  #include <asm/hvm/vm_event.h>
>  #include <asm/hvm/vpt.h>
>  #include <asm/i387.h>
> +#include <asm/iocap.h>
>  #include <asm/mc146818rtc.h>
>  #include <asm/mce.h>
>  #include <asm/monitor.h>
> @@ -81,14 +82,6 @@ integer_param("hvm_debug", opt_hvm_debug_level);
>
>  struct hvm_function_table __ro_after_init hvm_funcs;
>
> -/*
> - * The I/O permission bitmap is globally shared by all HVM guests except
> - * the hardware domain which needs a more permissive one.
> - */
> -#define HVM_IOBITMAP_SIZE (3 * PAGE_SIZE)
> -unsigned long __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> -    hvm_io_bitmap[HVM_IOBITMAP_SIZE / BYTES_PER_LONG];
> -
>  /* Xen command-line option to enable HAP */
>  static bool __initdata opt_hap_enabled =3D true;
>  boolean_param("hap", opt_hap_enabled);
> @@ -266,15 +259,6 @@ static int __init cf_check hvm_enable(void)
>      if ( opt_hvm_fep )
>          warning_add(warning_hvm_fep);
>
> -    /*
> -     * Allow direct access to the PC debug ports 0x80 and 0xed (they are
> -     * often used for I/O delays, but the vmexits simply slow things dow=
n).
> -     */
> -    memset(hvm_io_bitmap, ~0, sizeof(hvm_io_bitmap));
> -    if ( hvm_port80_allowed )
> -        __clear_bit(0x80, hvm_io_bitmap);
> -    __clear_bit(0xed, hvm_io_bitmap);
> -
>      register_cpu_notifier(&cpu_nfb);
>
>      return 0;
> @@ -706,19 +690,12 @@ int hvm_domain_initialise(struct domain *d,
>
>      rwlock_init(&d->arch.hvm.pl_time->pt_migrate);
>
> -    /* Set the default IO Bitmap. */
> -    if ( is_hardware_domain(d) )
> +    rc =3D ioports_setup_access(d);
> +    if ( rc )
>      {
> -        d->arch.hvm.io_bitmap =3D _xmalloc(HVM_IOBITMAP_SIZE, PAGE_SIZE)=
;
> -        if ( d->arch.hvm.io_bitmap =3D=3D NULL )
> -        {
> -            rc =3D -ENOMEM;
> -            goto fail1;
> -        }
> -        memset(d->arch.hvm.io_bitmap, ~0, HVM_IOBITMAP_SIZE);
> +        printk("%pd failed to setup I/O bitmap: %d\n", d, rc);
> +        goto fail1;
>      }
> -    else
> -        d->arch.hvm.io_bitmap =3D hvm_io_bitmap;
>
>      register_g2m_portio_handler(d);
>      register_vpci_portio_handler(d);
> @@ -745,6 +722,8 @@ int hvm_domain_initialise(struct domain *d,
>          break;
>      }
>
> +    BUG_ON(!d->arch.ioport_caps);
> +
>      vpic_init(d);
>
>      rc =3D vioapic_init(d);
> diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
> index bddd77d8109b..d4e03123d910 100644
> --- a/xen/arch/x86/hvm/nestedhvm.c
> +++ b/xen/arch/x86/hvm/nestedhvm.c
> @@ -107,7 +107,7 @@ nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m)
>   * The users of the bitmap patterns are in SVM/VMX specific code.
>   *
>   * bitmap        port 0x80  port 0xed
> - * hvm_io_bitmap cleared    cleared
> + * hvm.io_bitmap cleared    cleared
>   * iomap[0]      cleared    set
>   * iomap[1]      set        cleared
>   * iomap[2]      set        set
> @@ -115,7 +115,7 @@ nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m)
>
>  static int __init cf_check nestedhvm_setup(void)
>  {
> -    /* Same format and size as hvm_io_bitmap (Intel needs only 2 pages).=
 */
> +    /* Same format and size as hvm.io_bitmap (Intel needs only 2 pages).=
 */
>      unsigned nr =3D cpu_has_vmx ? 2 : 3;
>      unsigned int i, order =3D get_order_from_pages(nr);
>
> @@ -165,7 +165,7 @@ static int __init cf_check nestedhvm_setup(void)
>  __initcall(nestedhvm_setup);
>
>  unsigned long *
> -nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed)
> +nestedhvm_vcpu_iomap_get(struct vcpu *v, bool ioport_80, bool ioport_ed)
>  {
>      int i;
>
> @@ -174,7 +174,7 @@ nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_=
ed)
>
>      if (ioport_80 =3D=3D 0) {
>          if (ioport_ed =3D=3D 0)
> -            return hvm_io_bitmap;
> +            return v->domain->arch.hvm.io_bitmap;
>          i =3D 0;
>      } else {
>          if (ioport_ed =3D=3D 0)
> diff --git a/xen/arch/x86/hvm/quirks.c b/xen/arch/x86/hvm/quirks.c
> index 9202f5a47fe9..f4d95441fcff 100644
> --- a/xen/arch/x86/hvm/quirks.c
> +++ b/xen/arch/x86/hvm/quirks.c
> @@ -73,9 +73,6 @@ static int __init cf_check check_port80(void)
>
>      dmi_check_system(hvm_no_port80_dmi_table);
>
> -    if ( !hvm_port80_allowed )
> -        __set_bit(0x80, hvm_io_bitmap);
> -
>      return 0;
>  }
>  __initcall(check_port80);
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nest=
edsvm.c
> index dc2b6a42534a..cc8500b61665 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -381,7 +381,7 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, b=
ool viopm)
>          hvm_unmap_guest_frame(ns_viomap, 0);
>      }
>
> -    svm->ns_iomap =3D nestedhvm_vcpu_iomap_get(ioport_80, ioport_ed);
> +    svm->ns_iomap =3D nestedhvm_vcpu_iomap_get(v, ioport_80, ioport_ed);
>
>      nv->nv_ioport80 =3D ioport_80;
>      nv->nv_ioportED =3D ioport_ed;
> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> index e4f3a5fe4c71..4da3e6e90e6c 100644
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -554,7 +554,7 @@ unsigned long *_shadow_io_bitmap(struct vcpu *v)
>      port80 =3D bitmap[0x80 >> 3] & (1 << (0x80 & 0x7)) ? 1 : 0;
>      portED =3D bitmap[0xed >> 3] & (1 << (0xed & 0x7)) ? 1 : 0;
>
> -    return nestedhvm_vcpu_iomap_get(port80, portED);
> +    return nestedhvm_vcpu_iomap_get(v, port80, portED);
>  }
>
>  static void update_msrbitmap(struct vcpu *v, uint32_t shadow_ctrl)
> @@ -622,7 +622,7 @@ void nvmx_update_exec_control(struct vcpu *v, u32 hos=
t_cntrl)
>               * L1 VMM doesn't intercept IO instruction.
>               * Use host configuration and reset IO_BITMAP
>               */
> -            bitmap =3D hvm_io_bitmap;
> +            bitmap =3D v->domain->arch.hvm.io_bitmap;
>          }
>          else {
>              /* use IO bitmap */
> diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/incl=
ude/asm/hvm/nestedhvm.h
> index ea2c1bc328c7..d691ccb07dd6 100644
> --- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
> +++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> @@ -50,7 +50,8 @@ int nestedhvm_hap_nested_page_fault(struct vcpu *v, pad=
dr_t *L2_gpa,
>                                      struct npfec npfec);
>
>  /* IO permission map */
> -unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed);
> +unsigned long *nestedhvm_vcpu_iomap_get(struct vcpu *v,
> +                                        bool ioport_80, bool ioport_ed);
>
>  /* Misc */
>  #define nestedhvm_paging_mode_hap(v) (!!nhvm_vmcx_hap_enabled(v))
> diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/includ=
e/asm/hvm/support.h
> index 2a7ba36af06f..7e36d00cc188 100644
> --- a/xen/arch/x86/include/asm/hvm/support.h
> +++ b/xen/arch/x86/include/asm/hvm/support.h
> @@ -41,8 +41,6 @@ extern unsigned int opt_hvm_debug_level;
>  #define HVM_DBG_LOG(level, _f, _a...) do {} while (0)
>  #endif
>
> -extern unsigned long hvm_io_bitmap[];
> -
>  enum hvm_translation_result {
>      HVMTRANS_okay,
>      HVMTRANS_bad_linear_to_gfn,
> diff --git a/xen/arch/x86/include/asm/iocap.h b/xen/arch/x86/include/asm/=
iocap.h
> index f948b7186e95..1083f6171cf7 100644
> --- a/xen/arch/x86/include/asm/iocap.h
> +++ b/xen/arch/x86/include/asm/iocap.h
> @@ -22,6 +22,8 @@
>  #define cache_flush_permitted(d) \
>      (has_arch_io_resources(d) || has_arch_pdevs(d))
>
> +int ioports_setup_access(struct domain *d);
> +
>  static inline int ioports_permit_access(struct domain *d, unsigned long =
s,
>                                          unsigned long e)
>  {
> diff --git a/xen/arch/x86/ioport.c b/xen/arch/x86/ioport.c
> new file mode 100644
> index 000000000000..dbcd52d37a4f
> --- /dev/null
> +++ b/xen/arch/x86/ioport.c
> @@ -0,0 +1,163 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Guest I/O port address space configuration.
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#include <xen/domain.h>
> +#include <xen/param.h>
> +
> +#include <asm/amd.h>
> +#include <asm/acpi.h>
> +#include <asm/io-ports.h>
> +#include <asm/iocap.h>
> +#include <asm/pv/shim.h>
> +#include <asm/setup.h>
> +
> +static char __initdata opt_dom0_ioports_disable[200] =3D "";
> +string_param("dom0_ioports_disable", opt_dom0_ioports_disable);
> +
> +/*
> + * The I/O permission bitmap size.
> + * See: comment in nestedhvm_setup()
> + */
> +#define HVM_IOBITMAP_SIZE (3 * PAGE_SIZE)
> +
> +/* Hide user-defined I/O ports from the guest OS. */
> +static void process_dom0_ioports_disable(struct domain *dom0)
> +{
> +    unsigned long io_from, io_to;
> +    char *t, *s =3D opt_dom0_ioports_disable;
> +    const char *u;
> +
> +    if ( *s =3D=3D '\0' )
> +        return;
> +
> +    while ( (t =3D strsep(&s, ",")) !=3D NULL )
> +    {
> +        io_from =3D simple_strtoul(t, &u, 16);
> +        if ( u =3D=3D t )
> +        {
> +        parse_error:
> +            printk("Invalid ioport range <%s> "
> +                   "in dom0_ioports_disable, skipping\n", t);
> +            continue;
> +        }
> +
> +        if ( *u =3D=3D '\0' )
> +            io_to =3D io_from;
> +        else if ( *u =3D=3D '-' )
> +            io_to =3D simple_strtoul(u + 1, &u, 16);
> +        else
> +            goto parse_error;
> +
> +        if ( (*u !=3D '\0') || (io_to < io_from) || (io_to >=3D 65536) )
> +            goto parse_error;
> +
> +        printk("Disabling dom0 access to ioport range %04lx-%04lx\n",
> +            io_from, io_to);
> +
> +        if ( ioports_deny_access(dom0, io_from, io_to) !=3D 0 )
> +            BUG();
> +    }
> +}
> +
> +/* Set the default IO Bitmap. */
> +int ioports_setup_access(struct domain *d)
> +{
> +    unsigned int i, offs;
> +    int rc;
> +
> +    if ( pv_shim )
> +        return 0;
> +
> +#ifdef CONFIG_HVM

ioports_setup_access() now allocates a per-domain io_bitmap for all HVM dom=
ains:

> +    d->arch.hvm.io_bitmap =3D _xmalloc(HVM_IOBITMAP_SIZE, PAGE_SIZE);

but I only see this being freed for the hardware domain in the
existing failure paths.
Where is io_bitmap freed for non-hardware HVM domains?

> +    if ( d->arch.hvm.io_bitmap =3D=3D NULL )
> +        return -ENOMEM;
> +
> +    memset(d->arch.hvm.io_bitmap, ~0, HVM_IOBITMAP_SIZE);
> +
> +    if ( !is_hardware_domain(d) )
> +    {
> +        /*
> +         * Allow direct access to the PC debug ports 0x80 and 0xed (they=
 are
> +         * often used for I/O delays, but the vmexits simply slow things=
 down).
> +         */
> +        if ( hvm_port80_allowed )
> +            __clear_bit(0x80, d->arch.hvm.io_bitmap);
> +
> +        __clear_bit(0xed, d->arch.hvm.io_bitmap);
> +
> +        return 0;
> +    }
> +#endif
> +
> +    /* The hardware domain is initially permitted full I/O capabilities.=
 */
> +    rc =3D ioports_permit_access(d, 0, 0xFFFF);
> +
> +    /* Modify I/O port access permissions. */
> +
> +    for ( offs =3D 0, i =3D ISOLATE_LSB(i8259A_alias_mask) ?: 2;
> +          offs <=3D i8259A_alias_mask; offs +=3D i )
> +    {
> +        if ( offs & ~i8259A_alias_mask )
> +            continue;
> +        /* Master Interrupt Controller (PIC). */
> +        rc |=3D ioports_deny_access(d, 0x20 + offs, 0x21 + offs);
> +        /* Slave Interrupt Controller (PIC). */
> +        rc |=3D ioports_deny_access(d, 0xA0 + offs, 0xA1 + offs);
> +    }
> +
> +    /* ELCR of both PICs. */
> +    rc |=3D ioports_deny_access(d, 0x4D0, 0x4D1);
> +
> +    /* Interval Timer (PIT). */
> +    for ( offs =3D 0, i =3D ISOLATE_LSB(pit_alias_mask) ?: 4;
> +          offs <=3D pit_alias_mask; offs +=3D i )
> +        if ( !(offs & ~pit_alias_mask) )
> +            rc |=3D ioports_deny_access(d, PIT_CH0 + offs, PIT_MODE + of=
fs);
> +
> +    /* PIT Channel 2 / PC Speaker Control. */
> +    rc |=3D ioports_deny_access(d, 0x61, 0x61);
> +
> +    /* INIT# and alternative A20M# control. */
> +    rc |=3D ioports_deny_access(d, 0x92, 0x92);
> +
> +    /* IGNNE# control. */
> +    rc |=3D ioports_deny_access(d, 0xF0, 0xF0);
> +
> +    /* ACPI PM Timer. */
> +    if ( pmtmr_ioport )
> +        rc |=3D ioports_deny_access(d, pmtmr_ioport, pmtmr_ioport + 3);
> +
> +    /* Reset control. */
> +    rc |=3D ioports_deny_access(d, 0xCF9, 0xCF9);
> +
> +    /* PCI configuration space (NB. 0xCF8 has special treatment). */
> +    rc |=3D ioports_deny_access(d, 0xCFC, 0xCFF);
> +
> +#ifdef CONFIG_HVM
> +    if ( is_hvm_domain(d) )
> +    {
> +        /* ISA DMA controller, channels 0-3 (incl possible aliases). */
> +        rc |=3D ioports_deny_access(d, 0x00, 0x1F);
> +        /* ISA DMA controller, page registers (incl various reserved one=
s). */
> +        rc |=3D ioports_deny_access(d, 0x80 + !!hvm_port80_allowed, 0x8F=
);
> +        /* ISA DMA controller, channels 4-7 (incl usual aliases). */
> +        rc |=3D ioports_deny_access(d, 0xC0, 0xDF);
> +
> +        /* HVM debug console IO port. */
> +        rc |=3D ioports_deny_access(d, XEN_HVM_DEBUGCONS_IOPORT,
> +                                  XEN_HVM_DEBUGCONS_IOPORT);
> +        if ( amd_acpi_c1e_quirk )
> +            rc |=3D ioports_deny_access(d, acpi_smi_cmd, acpi_smi_cmd);
> +    }
> +#endif
> +
> +    /* Command-line I/O ranges. */
> +    process_dom0_ioports_disable(d);
> +
> +    return rc;
> +}
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 21158ce1812e..2b8b4d869ee7 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -17,6 +17,7 @@
>  #include <asm/bootinfo.h>
>  #include <asm/bzimage.h>
>  #include <asm/dom0_build.h>
> +#include <asm/iocap.h>
>  #include <asm/guest.h>
>  #include <asm/page.h>
>  #include <asm/pv/mm.h>
> @@ -1033,6 +1034,9 @@ static int __init dom0_construct(const struct boot_=
domain *bd)
>      if ( test_bit(XENFEAT_supervisor_mode_kernel, parms.f_required) )
>          panic("Dom0 requires supervisor-mode execution\n");
>
> +    rc =3D ioports_setup_access(d);
> +    BUG_ON(rc !=3D 0);
> +
>      rc =3D dom0_setup_permissions(d);
>      BUG_ON(rc !=3D 0);
>
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index c341f012d005..ea34c3ae598a 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -783,9 +783,20 @@ static int ns16x50_init(void *arg)
>      struct vuart_ns16x50 *vdev =3D arg;
>      const struct vuart_info *info =3D vdev->info;
>      struct domain *d =3D vdev->owner;
> +    int rc;
>
>      ASSERT(vdev);
>
> +    /* Disallow sharing physical I/O port */

Should this be undone on teardown and error paths?

> +    rc =3D ioports_deny_access(d, info->base_addr,
> +                             info->base_addr + info->size - 1);


Best regards,
Mykola


> +    if ( rc )
> +    {
> +        ns16x50_err(info, " virtual I/O port range [0x%04lx..0x%04lx]: c=
onflict w/ physical range\n",
> +                    info->base_addr, info->base_addr + info->size - 1);
> +        return rc;
> +    }
> +
>      /* NB: report 115200 baud rate. */
>      vdev->regs[NS16X50_REGS_NUM + UART_DLL] =3D divisor & UINT8_MAX;
>      vdev->regs[NS16X50_REGS_NUM + UART_DLM] =3D (divisor >> 8) & UINT8_M=
AX;
> --
> 2.51.0
>
>

