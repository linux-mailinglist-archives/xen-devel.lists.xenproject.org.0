Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB8228C675
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 02:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6052.15893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS8RN-0001bf-8B; Tue, 13 Oct 2020 00:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6052.15893; Tue, 13 Oct 2020 00:45:21 +0000
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
	id 1kS8RN-0001ad-2D; Tue, 13 Oct 2020 00:45:21 +0000
Received: by outflank-mailman (input) for mailman id 6052;
 Tue, 13 Oct 2020 00:45:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yijH=DU=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1kS8RL-0001VJ-IE
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 00:45:19 +0000
Received: from ozlabs.org (unknown [2401:3900:2:1::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6456cd1e-34b2-4cbd-884b-6cd902c45769;
 Tue, 13 Oct 2020 00:45:11 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C9GzQ4GrGz9sVK; Tue, 13 Oct 2020 11:45:06 +1100 (AEDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yijH=DU=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
	id 1kS8RL-0001VJ-IE
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 00:45:19 +0000
X-Inumbo-ID: 6456cd1e-34b2-4cbd-884b-6cd902c45769
Received: from ozlabs.org (unknown [2401:3900:2:1::2])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6456cd1e-34b2-4cbd-884b-6cd902c45769;
	Tue, 13 Oct 2020 00:45:11 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4C9GzQ4GrGz9sVK; Tue, 13 Oct 2020 11:45:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1602549906;
	bh=+lALO7HgNrojm6+JDT1ennot8m6liZUo5GH8lT9O9Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onlHrub/sstF9DahVxIp6mc0qSOP4MEbM6deGOjZB9YlBmj2WNzKmC0iPNNmnvsv9
	 3+A/PXljQDpjzjzwlgkz9u0xN3HKj1rcZ4tGm8+tZtJG2/Azwk2ffuCZKXG0rDP9jo
	 d1bf9D8mnrWnV5p4Cc2SRmbWrpeS5JlZ80Q3jcRc=
Date: Tue, 13 Oct 2020 11:45:00 +1100
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
Subject: Re: [PATCH 5/5] hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'
Message-ID: <20201013004500.GJ71119@yekko.fritz.box>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <20201012124506.3406909-6-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dwWFXG4JqVa0wfCP"
Content-Disposition: inline
In-Reply-To: <20201012124506.3406909-6-philmd@redhat.com>


--dwWFXG4JqVa0wfCP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 02:45:06PM +0200, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> We already have a generic PCI_DEVFN() macro in "hw/pci/pci.h"
> to pack the PCI slot/function identifiers, use it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

ppc part

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/arm/virt.c          | 3 ++-
>  hw/pci-host/uninorth.c | 6 ++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index e465a988d68..f601ef0798c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1144,7 +1144,8 @@ static void create_pcie_irq_map(const VirtMachineSt=
ate *vms,
>                       full_irq_map, sizeof(full_irq_map));
> =20
>      qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupt-map-mask",
> -                           0x1800, 0, 0, /* devfn (PCI_SLOT(3)) */
> +                           cpu_to_be16(PCI_DEVFN(3, 0)), /* Slot 3 */
> +                           0, 0,
>                             0x7           /* PCI irq */);
>  }
> =20
> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
> index c21de0ab805..f73d452bdce 100644
> --- a/hw/pci-host/uninorth.c
> +++ b/hw/pci-host/uninorth.c
> @@ -70,10 +70,8 @@ static uint32_t unin_get_config_reg(uint32_t reg, uint=
32_t addr)
>          /* ... and then convert them to x86 format */
>          /* config pointer */
>          retval =3D (reg & (0xff - 7)) | (addr & 7);
> -        /* slot */
> -        retval |=3D slot << 11;
> -        /* fn */
> -        retval |=3D func << 8;
> +        /* slot, fn */
> +        retval |=3D PCI_DEVFN(slot, func) << 8;
>      }
> =20
>      trace_unin_get_config_reg(reg, addr, retval);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dwWFXG4JqVa0wfCP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+E+IwACgkQbDjKyiDZ
s5J+QQ//T4fQpDPR/JHRFc6LbsMxAjBTFaF0roQjm+CI8Md8/NY7ptdCqg1+GKy6
eoEUInbZ/945BywYqGDOqWxu3/zJcpG+4spb5usgG+IKMT3N5xuUzKd+PBIaJilP
JhB2UkcG5VhUOvf8FhbPGmAO/M6WYElXbtKGPy9/CLFLNXzWXiJ0MZy4TAAscpra
M3Xz8Fs/lwFTNOQKFXD7BpuESdLdWy5jPMhODBx0H0OCrsr6ZnZcIXYlVUUi4K3f
rLpdkhDyN1ZF2VeLYTslVEfMVCPHxSDFJRRONioEjpP6ELFnXAEvNqRmyYzF/a19
FJ/5nB7L4wNXQ9rV5C6E72joI3nkjujeKZT8lfRSKcz17owRlIJrrwa9hbbxomy+
G9dmE57lTw42mRCEd3nZgeq7CwBK0a5IfJOkt5WEriUMfHjRFyhCB5t7sqbaL5Aa
NDCD7XZowgia7WmsZvAb/dMrjQpUCzya4OtR16TQ63W6wKC/pCr6lb/J+BS9RCu0
mSdB2d1L/eItGWyJvGIHVbf7JSIY0pLYnkaM83E0QsXTKRABRzhQ6CBsK8URM6kh
5HziPQxsVW1ZkJ27hfLKjbZwHshw7IgicYRCDCLa+WfcZQv750KiJq/ku/Gnjq59
uy1uR5C2STlSxRSSNraOCu0u7ad0arUjhx/SNUtxXQBpQWAXBhI=
=E6th
-----END PGP SIGNATURE-----

--dwWFXG4JqVa0wfCP--

