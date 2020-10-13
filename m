Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E61528C674
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 02:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6049.15861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS8RH-0001Vn-4E; Tue, 13 Oct 2020 00:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6049.15861; Tue, 13 Oct 2020 00:45:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS8RH-0001VO-0a; Tue, 13 Oct 2020 00:45:15 +0000
Received: by outflank-mailman (input) for mailman id 6049;
 Tue, 13 Oct 2020 00:45:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yijH=DU=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1kS8RF-0001V8-OM
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 00:45:14 +0000
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 987dc933-c226-4274-b8c3-5c731dcbdba9;
 Tue, 13 Oct 2020 00:45:10 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C9GzQ3G7kz9sVD; Tue, 13 Oct 2020 11:45:06 +1100 (AEDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yijH=DU=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
	id 1kS8RF-0001V8-OM
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 00:45:14 +0000
X-Inumbo-ID: 987dc933-c226-4274-b8c3-5c731dcbdba9
Received: from ozlabs.org (unknown [203.11.71.1])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 987dc933-c226-4274-b8c3-5c731dcbdba9;
	Tue, 13 Oct 2020 00:45:10 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4C9GzQ3G7kz9sVD; Tue, 13 Oct 2020 11:45:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1602549906;
	bh=FxmL8PgRV16Qjfh784pRUyyS19OMN6XPdKaH+2s3XQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5VlRYK42GLi323qOU1U2uPXwSgfixA5nhvnab92FcUhIbuIY8qjKt+l9+W5lbOn1
	 AHgXCUgkxM3LVkqXj64KOeWyIdTlj92EJnGgC7eQw5WtognVDjiZ3OPD6XO7UVi554
	 hT6k9cyVoyI/u8szxx+DNJXmKPtBUd6/JwkI7Nw0=
Date: Tue, 13 Oct 2020 11:43:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
	Paul Durrant <paul@xen.org>, Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH 4/5] hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'
Message-ID: <20201013004330.GI71119@yekko.fritz.box>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <20201012124506.3406909-5-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D6z0c4W1rkZNF4Vu"
Content-Disposition: inline
In-Reply-To: <20201012124506.3406909-5-philmd@redhat.com>


--D6z0c4W1rkZNF4Vu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 02:45:05PM +0200, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> We already have a generic PCI_SLOT() macro in "hw/pci/pci.h"
> to extract the PCI slot identifier, use it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/hppa/dino.c        | 2 +-
>  hw/i386/xen/xen-hvm.c | 2 +-
>  hw/isa/piix3.c        | 2 +-
>  hw/mips/gt64xxx_pci.c | 2 +-
>  hw/pci-host/bonito.c  | 2 +-
>  hw/pci-host/ppce500.c | 2 +-
>  hw/ppc/ppc4xx_pci.c   | 2 +-
>  hw/sh4/sh_pci.c       | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
> index 81053b5fb64..5b82c9440d1 100644
> --- a/hw/hppa/dino.c
> +++ b/hw/hppa/dino.c
> @@ -496,7 +496,7 @@ static void dino_set_irq(void *opaque, int irq, int l=
evel)
> =20
>  static int dino_pci_map_irq(PCIDevice *d, int irq_num)
>  {
> -    int slot =3D d->devfn >> 3;
> +    int slot =3D PCI_SLOT(d->devfn);
> =20
>      assert(irq_num >=3D 0 && irq_num <=3D 3);
> =20
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index f3ababf33b6..276254e6ca9 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -140,7 +140,7 @@ typedef struct XenIOState {
> =20
>  int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
>  {
> -    return irq_num + ((pci_dev->devfn >> 3) << 2);
> +    return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
>  }
> =20
>  void xen_piix3_set_irq(void *opaque, int irq_num, int level)
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index 587850b8881..f46ccae25cf 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -361,7 +361,7 @@ type_init(piix3_register_types)
>  static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
>  {
>      int slot_addend;
> -    slot_addend =3D (pci_dev->devfn >> 3) - 1;
> +    slot_addend =3D PCI_SLOT(pci_dev->devfn) - 1;
>      return (pci_intx + slot_addend) & 3;
>  }
> =20
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index e091bc4ed55..588e6f99301 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -982,7 +982,7 @@ static int gt64120_pci_map_irq(PCIDevice *pci_dev, in=
t irq_num)
>  {
>      int slot;
> =20
> -    slot =3D (pci_dev->devfn >> 3);
> +    slot =3D PCI_SLOT(pci_dev->devfn);
> =20
>      switch (slot) {
>      /* PIIX4 USB */
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index b05295639a6..ee8b193e15b 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -570,7 +570,7 @@ static int pci_bonito_map_irq(PCIDevice *pci_dev, int=
 irq_num)
>  {
>      int slot;
> =20
> -    slot =3D (pci_dev->devfn >> 3);
> +    slot =3D PCI_SLOT(pci_dev->devfn);
> =20
>      switch (slot) {
>      case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, =
MC97 */
> diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
> index 9517aab913e..5ad1424b31a 100644
> --- a/hw/pci-host/ppce500.c
> +++ b/hw/pci-host/ppce500.c
> @@ -342,7 +342,7 @@ static const MemoryRegionOps e500_pci_reg_ops =3D {
> =20
>  static int mpc85xx_pci_map_irq(PCIDevice *pci_dev, int pin)
>  {
> -    int devno =3D pci_dev->devfn >> 3;
> +    int devno =3D PCI_SLOT(pci_dev->devfn);
>      int ret;
> =20
>      ret =3D ppce500_pci_map_irq_slot(devno, pin);
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index 28724c06f88..e8789f64e80 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -243,7 +243,7 @@ static void ppc4xx_pci_reset(void *opaque)
>   * may need further refactoring for other boards. */
>  static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
>  {
> -    int slot =3D pci_dev->devfn >> 3;
> +    int slot =3D PCI_SLOT(pci_dev->devfn);
> =20
>      trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
> =20
> diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
> index 73d2d0bccb0..734892f47c7 100644
> --- a/hw/sh4/sh_pci.c
> +++ b/hw/sh4/sh_pci.c
> @@ -109,7 +109,7 @@ static const MemoryRegionOps sh_pci_reg_ops =3D {
> =20
>  static int sh_pci_map_irq(PCIDevice *d, int irq_num)
>  {
> -    return (d->devfn >> 3);
> +    return PCI_SLOT(d->devfn);
>  }
> =20
>  static void sh_pci_set_irq(void *opaque, int irq_num, int level)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--D6z0c4W1rkZNF4Vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+E+DIACgkQbDjKyiDZ
s5JM4g//S3eKSoztBYSfXaiJO/9rehJ7mK4hYgR5S2pvQTSFkf6LP+HJaCkVa0lE
a4bUGSpR3bqHhGGYWF6ppIeGNowkD++B5YnsbeFaFVTxaRdDLY0WqcB6YnNVTU2Z
LskxdcLYtuDddT+S+DU/4ZkC+nXSJyfqU9CTjFq2QuY+4TI4Zf4zeK9m375Oo6qN
yUSBxj7pOiPy149ZF4tuIVBJy/WOijP5DUmz+I3xS/BqQecGuD2kQzRLGfC/oULr
TaulgUcr35isuBXOoV9SfQpiLjhzK7Thp1twsSV60rbHKN8mK5uL1M4h8NdJqVmm
ncct21mR6XQg5Zs/EB4ClFpa2IFKfCgDIA19wUUW627e1OAV8Xdb7OlLV7AkrB0i
mdt6kGLrs0dOSXUqqDZP04NdDFx49Jp1tK9ZBspjw9nxiluNhpOYC1SuND2+lenf
OiaZxMPNyIYKbCS1pfMGXyKsh8/qcf8M2RNtqdjRzKn2Odn9J+TFy6M7I6Y1VdTa
nJbPVDkHKoqRkkehT4fzSSW72NYznbJVTPi/NuTsoWLy6hqFxTemkZWf8PcjLhLj
X236DGBmExrBcFtPyuSV0iS2Nc8vxxzd+XiMUoAkPGmD9EWwU/++5S7HXm9PNrZ2
QetxthxhIXdnOkIu/hzAFMaj+8ABa4LWmrVBtq1SZmi1hdka2do=
=gg8r
-----END PGP SIGNATURE-----

--D6z0c4W1rkZNF4Vu--

