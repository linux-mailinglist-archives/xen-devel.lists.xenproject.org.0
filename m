Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F0B17B58
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 04:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066724.1431849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhfxG-00053C-7g; Fri, 01 Aug 2025 02:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066724.1431849; Fri, 01 Aug 2025 02:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhfxG-00050i-4k; Fri, 01 Aug 2025 02:57:10 +0000
Received: by outflank-mailman (input) for mailman id 1066724;
 Fri, 01 Aug 2025 02:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GtvS=2N=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhfxF-00050a-CP
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 02:57:09 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35ab08b6-6e83-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 04:57:07 +0200 (CEST)
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
X-Inumbo-ID: 35ab08b6-6e83-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754017025; x=1754276225;
	bh=CbLxfbhmKTEJANfkftWsM0RVXlGMNTWhuSK7vBajsd8=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BFeaqeQOXBhjQXAuHGIsd4jPEdD6Y7ssvCgcQZmecEk9v6Dugcdm6XIDcNz83FYu8
	 U0iX8MKLyBat4aPR3+JsJJSAt8lfA5OpRyb/rSAMC9O3M6uE1pT/gR0qrdYl3I5aE0
	 dQxxfgBjAwTF0hI4BHssYAc+O8ek6cIhfNWw3596aOSEtkLEbIyv9RXEhjPUzOXkuO
	 ZoyUlO9TzhmfhT/u5gEZjmWoYLqkDvFEwpDivrNJ/3sD/cOFpF6HvA3C8LVe0NB7EO
	 5A7PP1beLvTCWUDZzu7M8To+glghjO8udlnMdlJxnNafW3fL5kWZdzexU9rBenElhh
	 R+qIzgyQ1p5Kw==
Date: Fri, 01 Aug 2025 02:57:01 +0000
To: Grygorii Strashko <grygorii_strashko@epam.com>, xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Subject: Re: [PATCH v4 3/8] x86/domain: allocate d->{iomem,irq}_caps before arch-specific initialization
Message-ID: <aIws+i2V3UIkzXR3@kraken>
In-Reply-To: <aIvQQX6IqHfyHsyW@kraken>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-4-dmukhin@ford.com> <6f209ee9-cf3c-473f-92d5-0c1f0fbc2e49@epam.com> <aIvQQX6IqHfyHsyW@kraken>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 87fbc0b7c86ebca73383c85ec2487ed2facda496
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 08:21:24PM +0000, dmkhn@proton.me wrote:
> On Thu, Jul 31, 2025 at 10:52:08PM +0300, Grygorii Strashko wrote:
> > Hi Denis,
> >
> > On 31.07.25 22:21, dmkhn@proton.me wrote:
> > > From: Denis Mukhin <dmukhin@ford.com>
> > >
> > > Move IRQ/IOMEM rangesets allocation before arch_domain_create().
> > >
> > > That guarantees that arch-specific code could access those rangesets =
to
> > > register traps for emulation.
> > >
> > > It is necessary for those emulators registering trap handlers and ens=
uring
> > > that emulated IRQs are not shared with the physical IRQs.
> > >
> > > Move dom0_setup_permissions() call right after I/O rangesets are allo=
cated.
> > >
> > > Move pvh_setup_mmcfg() inside dom0_setup_permissions() close to the p=
lace
> > > where MMCFG ranges are initialized.
> > >
> > > Not a functional change.
> > >
> > > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > > ---
> > > Chanhes since v3:
> > > - new patch
> > > ---
> > >   xen/arch/x86/dom0_build.c     | 26 +++++++++++++++++++++++
> > >   xen/arch/x86/hvm/dom0_build.c | 39 --------------------------------=
---
> > >   xen/arch/x86/hvm/hvm.c        | 16 ++++++++++++++
> > >   xen/common/domain.c           | 12 +++++------
> > >   4 files changed, 48 insertions(+), 45 deletions(-)
> > >
> > > diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> > > index 0b467fd4a4fc..e965f506a3c8 100644
> > > --- a/xen/arch/x86/dom0_build.c
> > > +++ b/xen/arch/x86/dom0_build.c
> > > @@ -471,6 +471,24 @@ static void __init process_dom0_ioports_disable(=
struct domain *dom0)
> > >       }
> > >   }
> > >
> > > +static void __hwdom_init setup_mmcfg(struct domain *d)
> > > +{
> > > +    unsigned int i;
> > > +    int rc;
> > > +
> > > +    for ( i =3D 0; i < pci_mmcfg_config_num; i++ )
> > > +    {
> > > +        rc =3D register_vpci_mmcfg_handler(d, pci_mmcfg_config[i].ad=
dress,
> > > +                                         pci_mmcfg_config[i].start_b=
us_number,
> > > +                                         pci_mmcfg_config[i].end_bus=
_number,
> > > +                                         pci_mmcfg_config[i].pci_seg=
ment);
> > > +        if ( rc )
> > > +            printk("Unable to setup MMCFG handler at %#lx for segmen=
t %u\n",
> > > +                   pci_mmcfg_config[i].address,
> > > +                   pci_mmcfg_config[i].pci_segment);
> > > +    }
> > > +}
> > > +
> > >   int __init dom0_setup_permissions(struct domain *d)
> >
> > It could be i'm missing smth, but ^ function is __init while ...
> >
> > >   {
> > >       unsigned long mfn;
> > > @@ -480,6 +498,14 @@ int __init dom0_setup_permissions(struct domain =
*d)
> > >       if ( pv_shim )
> > >           return 0;
> > >
> > > +    /*
> > > +     * MMCFG initialization must be performed before setting domain
> > > +     * permissions, as the MCFG areas must not be part of the domain=
 IOMEM
> > > +     * accessible regions.
> > > +     */
> > > +    if ( is_hvm_domain(d) )
> > > +        setup_mmcfg(d);
> > > +
> > >       /* The hardware domain is initially permitted full I/O capabili=
ties. */
> > >       rc =3D ioports_permit_access(d, 0, 0xFFFF);
> > >       rc |=3D iomem_permit_access(d, 0UL,
> > > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_bu=
ild.c
> > > index 5551f9044836..6f47c9eeeaa6 100644
> > > --- a/xen/arch/x86/hvm/dom0_build.c
> > > +++ b/xen/arch/x86/hvm/dom0_build.c
> > > @@ -1310,24 +1310,6 @@ static int __init pvh_setup_acpi(struct domain=
 *d, paddr_t start_info)
> > >       return 0;
> > >   }
> > >
> > > -static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
> > > -{
> > > -    unsigned int i;
> > > -    int rc;
> > > -
> > > -    for ( i =3D 0; i < pci_mmcfg_config_num; i++ )
> > > -    {
> > > -        rc =3D register_vpci_mmcfg_handler(d, pci_mmcfg_config[i].ad=
dress,
> > > -                                         pci_mmcfg_config[i].start_b=
us_number,
> > > -                                         pci_mmcfg_config[i].end_bus=
_number,
> > > -                                         pci_mmcfg_config[i].pci_seg=
ment);
> > > -        if ( rc )
> > > -            printk("Unable to setup MMCFG handler at %#lx for segmen=
t %u\n",
> > > -                   pci_mmcfg_config[i].address,
> > > -                   pci_mmcfg_config[i].pci_segment);
> > > -    }
> > > -}
> > > -
> > >   int __init dom0_construct_pvh(const struct boot_domain *bd)
> > >   {
> > >       paddr_t entry, start_info;
> > > @@ -1339,27 +1321,6 @@ int __init dom0_construct_pvh(const struct boo=
t_domain *bd)
> > >       if ( bd->kernel =3D=3D NULL )
> > >           panic("Missing kernel boot module for %pd construction\n", =
d);
> > >
> > > -    if ( is_hardware_domain(d) )
> > > -    {
> > > -        /*
> > > -         * MMCFG initialization must be performed before setting dom=
ain
> > > -         * permissions, as the MCFG areas must not be part of the do=
main IOMEM
> > > -         * accessible regions.
> > > -         */
> > > -        pvh_setup_mmcfg(d);
> > > -
> > > -        /*
> > > -         * Setup permissions early so that calls to add MMIO regions=
 to the
> > > -         * p2m as part of vPCI setup don't fail due to permission ch=
ecks.
> > > -         */
> > > -        rc =3D dom0_setup_permissions(d);
> > > -        if ( rc )
> > > -        {
> > > -            printk("%pd unable to setup permissions: %d\n", d, rc);
> > > -            return rc;
> > > -        }
> > > -    }
> > > -
> > >       /*
> > >        * Craft dom0 physical memory map and set the paging allocation=
. This must
> > >        * be done before the iommu initializion, since iommu initializ=
ation code
> > > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > > index cb8ecd050d41..b7edb1d6555d 100644
> > > --- a/xen/arch/x86/hvm/hvm.c
> > > +++ b/xen/arch/x86/hvm/hvm.c
> > > @@ -35,6 +35,7 @@
> > >   #include <asm/hap.h>
> > >   #include <asm/current.h>
> > >   #include <asm/debugreg.h>
> > > +#include <asm/dom0_build.h>
> > >   #include <asm/e820.h>
> > >   #include <asm/regs.h>
> > >   #include <asm/cpufeature.h>
> > > @@ -651,6 +652,17 @@ int hvm_domain_initialise(struct domain *d,
> > >               goto fail1;
> > >           }
> > >           memset(d->arch.hvm.io_bitmap, ~0, HVM_IOBITMAP_SIZE);
> > > +
> > > +        /*
> > > +         * Setup permissions early so that calls to add MMIO regions=
 to the
> > > +         * p2m as part of vPCI setup don't fail due to permission ch=
ecks.
> > > +         */
> > > +        rc =3D dom0_setup_permissions(d);
> >
> > ... here hvm_domain_initialise() is not __init?
>=20
> No, you're right, I missed this, thanks!
>=20
> Good catch!

So addressing it will require some code movement, like
dom0_setup_permissions() outside of arch/x86/dom0_build.c...

>=20
> >
> > [...]
> >
> >
> > --
> > Best regards,
> > -grygorii
> >
>=20
>=20


