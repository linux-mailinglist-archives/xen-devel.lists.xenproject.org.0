Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D60B17715
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 22:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066393.1431619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZmQ-00062t-3A; Thu, 31 Jul 2025 20:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066393.1431619; Thu, 31 Jul 2025 20:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZmQ-00061S-0Z; Thu, 31 Jul 2025 20:21:34 +0000
Received: by outflank-mailman (input) for mailman id 1066393;
 Thu, 31 Jul 2025 20:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhZmN-00061M-K9
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 20:21:32 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0e3e826-6e4b-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 22:21:29 +0200 (CEST)
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
X-Inumbo-ID: f0e3e826-6e4b-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=6z7n4qj5nnennlcjk4xckxmzty.protonmail; t=1753993287; x=1754252487;
	bh=+I5EsvTXYZkVrww7qNktQnTFu7CFchKIRFIDTiCWlic=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nOxXR37s+f3uHSu+LG/mSln+CUt4bwGFj2EU4Vtvwke8xa3TpcakUD8dxzpfMjNVz
	 2ryg/JiTZyYVnAHh5YbCZYCzcM/TaOu6Zmhztm3h4dxKDg/FOF6Rqrju1oD/yrNiA8
	 O1AvsSqldO6Y3Np5N+4EnSjUt/bq9IVcCsJKuRXcwYpCG5fjYUNWcKWndCfnOHIDOd
	 ow2tk0L8CE01MUrf80O3yzX2M9i29GWegtUxoogXYI34laH6WytjYlNvlO5k/HJZfg
	 xYmMxceCaCcI56vnQC+O9fjUS9rPGecUuzzADvr9rzw/I8LO/Xvz27Zd4Ygmq7hK5J
	 tgWeIVo6/+/vA==
Date: Thu, 31 Jul 2025 20:21:24 +0000
To: Grygorii Strashko <grygorii_strashko@epam.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 3/8] x86/domain: allocate d->{iomem,irq}_caps before arch-specific initialization
Message-ID: <aIvQQX6IqHfyHsyW@kraken>
In-Reply-To: <6f209ee9-cf3c-473f-92d5-0c1f0fbc2e49@epam.com>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-4-dmukhin@ford.com> <6f209ee9-cf3c-473f-92d5-0c1f0fbc2e49@epam.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0acc20bb59c331520e68e4986e905df967733d78
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 10:52:08PM +0300, Grygorii Strashko wrote:
> Hi Denis,
>=20
> On 31.07.25 22:21, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Move IRQ/IOMEM rangesets allocation before arch_domain_create().
> >
> > That guarantees that arch-specific code could access those rangesets to
> > register traps for emulation.
> >
> > It is necessary for those emulators registering trap handlers and ensur=
ing
> > that emulated IRQs are not shared with the physical IRQs.
> >
> > Move dom0_setup_permissions() call right after I/O rangesets are alloca=
ted.
> >
> > Move pvh_setup_mmcfg() inside dom0_setup_permissions() close to the pla=
ce
> > where MMCFG ranges are initialized.
> >
> > Not a functional change.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Chanhes since v3:
> > - new patch
> > ---
> >   xen/arch/x86/dom0_build.c     | 26 +++++++++++++++++++++++
> >   xen/arch/x86/hvm/dom0_build.c | 39 ----------------------------------=
-
> >   xen/arch/x86/hvm/hvm.c        | 16 ++++++++++++++
> >   xen/common/domain.c           | 12 +++++------
> >   4 files changed, 48 insertions(+), 45 deletions(-)
> >
> > diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> > index 0b467fd4a4fc..e965f506a3c8 100644
> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -471,6 +471,24 @@ static void __init process_dom0_ioports_disable(st=
ruct domain *dom0)
> >       }
> >   }
> >
> > +static void __hwdom_init setup_mmcfg(struct domain *d)
> > +{
> > +    unsigned int i;
> > +    int rc;
> > +
> > +    for ( i =3D 0; i < pci_mmcfg_config_num; i++ )
> > +    {
> > +        rc =3D register_vpci_mmcfg_handler(d, pci_mmcfg_config[i].addr=
ess,
> > +                                         pci_mmcfg_config[i].start_bus=
_number,
> > +                                         pci_mmcfg_config[i].end_bus_n=
umber,
> > +                                         pci_mmcfg_config[i].pci_segme=
nt);
> > +        if ( rc )
> > +            printk("Unable to setup MMCFG handler at %#lx for segment =
%u\n",
> > +                   pci_mmcfg_config[i].address,
> > +                   pci_mmcfg_config[i].pci_segment);
> > +    }
> > +}
> > +
> >   int __init dom0_setup_permissions(struct domain *d)
>=20
> It could be i'm missing smth, but ^ function is __init while ...
>=20
> >   {
> >       unsigned long mfn;
> > @@ -480,6 +498,14 @@ int __init dom0_setup_permissions(struct domain *d=
)
> >       if ( pv_shim )
> >           return 0;
> >
> > +    /*
> > +     * MMCFG initialization must be performed before setting domain
> > +     * permissions, as the MCFG areas must not be part of the domain I=
OMEM
> > +     * accessible regions.
> > +     */
> > +    if ( is_hvm_domain(d) )
> > +        setup_mmcfg(d);
> > +
> >       /* The hardware domain is initially permitted full I/O capabiliti=
es. */
> >       rc =3D ioports_permit_access(d, 0, 0xFFFF);
> >       rc |=3D iomem_permit_access(d, 0UL,
> > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_buil=
d.c
> > index 5551f9044836..6f47c9eeeaa6 100644
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -1310,24 +1310,6 @@ static int __init pvh_setup_acpi(struct domain *=
d, paddr_t start_info)
> >       return 0;
> >   }
> >
> > -static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
> > -{
> > -    unsigned int i;
> > -    int rc;
> > -
> > -    for ( i =3D 0; i < pci_mmcfg_config_num; i++ )
> > -    {
> > -        rc =3D register_vpci_mmcfg_handler(d, pci_mmcfg_config[i].addr=
ess,
> > -                                         pci_mmcfg_config[i].start_bus=
_number,
> > -                                         pci_mmcfg_config[i].end_bus_n=
umber,
> > -                                         pci_mmcfg_config[i].pci_segme=
nt);
> > -        if ( rc )
> > -            printk("Unable to setup MMCFG handler at %#lx for segment =
%u\n",
> > -                   pci_mmcfg_config[i].address,
> > -                   pci_mmcfg_config[i].pci_segment);
> > -    }
> > -}
> > -
> >   int __init dom0_construct_pvh(const struct boot_domain *bd)
> >   {
> >       paddr_t entry, start_info;
> > @@ -1339,27 +1321,6 @@ int __init dom0_construct_pvh(const struct boot_=
domain *bd)
> >       if ( bd->kernel =3D=3D NULL )
> >           panic("Missing kernel boot module for %pd construction\n", d)=
;
> >
> > -    if ( is_hardware_domain(d) )
> > -    {
> > -        /*
> > -         * MMCFG initialization must be performed before setting domai=
n
> > -         * permissions, as the MCFG areas must not be part of the doma=
in IOMEM
> > -         * accessible regions.
> > -         */
> > -        pvh_setup_mmcfg(d);
> > -
> > -        /*
> > -         * Setup permissions early so that calls to add MMIO regions t=
o the
> > -         * p2m as part of vPCI setup don't fail due to permission chec=
ks.
> > -         */
> > -        rc =3D dom0_setup_permissions(d);
> > -        if ( rc )
> > -        {
> > -            printk("%pd unable to setup permissions: %d\n", d, rc);
> > -            return rc;
> > -        }
> > -    }
> > -
> >       /*
> >        * Craft dom0 physical memory map and set the paging allocation. =
This must
> >        * be done before the iommu initializion, since iommu initializat=
ion code
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index cb8ecd050d41..b7edb1d6555d 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -35,6 +35,7 @@
> >   #include <asm/hap.h>
> >   #include <asm/current.h>
> >   #include <asm/debugreg.h>
> > +#include <asm/dom0_build.h>
> >   #include <asm/e820.h>
> >   #include <asm/regs.h>
> >   #include <asm/cpufeature.h>
> > @@ -651,6 +652,17 @@ int hvm_domain_initialise(struct domain *d,
> >               goto fail1;
> >           }
> >           memset(d->arch.hvm.io_bitmap, ~0, HVM_IOBITMAP_SIZE);
> > +
> > +        /*
> > +         * Setup permissions early so that calls to add MMIO regions t=
o the
> > +         * p2m as part of vPCI setup don't fail due to permission chec=
ks.
> > +         */
> > +        rc =3D dom0_setup_permissions(d);
>=20
> ... here hvm_domain_initialise() is not __init?

No, you're right, I missed this, thanks!

Good catch!

>=20
> [...]
>=20
>=20
> --
> Best regards,
> -grygorii
>=20


