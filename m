Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4475928C673
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 02:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6050.15872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS8RI-0001XW-HL; Tue, 13 Oct 2020 00:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6050.15872; Tue, 13 Oct 2020 00:45:16 +0000
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
	id 1kS8RI-0001Ws-DW; Tue, 13 Oct 2020 00:45:16 +0000
Received: by outflank-mailman (input) for mailman id 6050;
 Tue, 13 Oct 2020 00:45:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yijH=DU=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1kS8RG-0001VJ-Jh
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 00:45:14 +0000
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dc5a121-165f-4f58-ad07-b7d098b9e31f;
 Tue, 13 Oct 2020 00:45:11 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C9GzQ2kfkz9sTt; Tue, 13 Oct 2020 11:45:06 +1100 (AEDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yijH=DU=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
	id 1kS8RG-0001VJ-Jh
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 00:45:14 +0000
X-Inumbo-ID: 7dc5a121-165f-4f58-ad07-b7d098b9e31f
Received: from ozlabs.org (unknown [203.11.71.1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7dc5a121-165f-4f58-ad07-b7d098b9e31f;
	Tue, 13 Oct 2020 00:45:11 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4C9GzQ2kfkz9sTt; Tue, 13 Oct 2020 11:45:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1602549906;
	bh=6z03D1ZV3p2wtWtAQ8HdiMejCmKYM8pplIFaWXlD8hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zfh5tPd5hMeq64adb90DDfNzMuDGuOVRs8Ifdlc8DR3LjBQWAgTUHf/Po97ZEGu8W
	 ndDXL0gxBLQKs0mJIjAQnOr9ekbU86UYMtLsuFFJ3SbC1eFrK22hbZxekU7OFKMygG
	 VUdBDaOmeqhjL14Ffsxb4Fm/c008JgvhPTizANX8=
Date: Tue, 13 Oct 2020 11:42:29 +1100
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
Subject: Re: [PATCH 2/5] hw/pci-host: Use the PCI_BUILD_BDF() macro from
 'hw/pci/pci.h'
Message-ID: <20201013004229.GG71119@yekko.fritz.box>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <20201012124506.3406909-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WkfBGePaEyrk4zXB"
Content-Disposition: inline
In-Reply-To: <20201012124506.3406909-3-philmd@redhat.com>


--WkfBGePaEyrk4zXB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 02:45:03PM +0200, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> We already have a generic PCI_BUILD_BDF() macro in "hw/pci/pci.h"
> to pack these values, use it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

pnv part

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/bonito.c   | 3 +--
>  hw/pci-host/pnv_phb4.c | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index abb3ee86769..b05295639a6 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -196,8 +196,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>  #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
> =20
>  #define PCI_ADDR(busno , devno , funno , regno)  \
> -    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
> -    (((funno) & 0x7) << 8) + (regno))
> +    ((PCI_BUILD_BDF(busno, PCI_DEVFN(devno , funno)) << 8) + (regno))
> =20
>  typedef struct BonitoState BonitoState;
> =20
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 03daf40a237..6328e985f81 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -889,7 +889,7 @@ static bool pnv_phb4_resolve_pe(PnvPhb4DMASpace *ds)
>      /* Read RTE */
>      bus_num =3D pci_bus_num(ds->bus);
>      addr =3D rtt & PHB_RTT_BASE_ADDRESS_MASK;
> -    addr +=3D 2 * ((bus_num << 8) | ds->devfn);
> +    addr +=3D 2 * PCI_BUILD_BDF(bus_num, ds->devfn);
>      if (dma_memory_read(&address_space_memory, addr, &rte, sizeof(rte)))=
 {
>          phb_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, addr=
);
>          /* Set error bits ? fence ? ... */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WkfBGePaEyrk4zXB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+E9/UACgkQbDjKyiDZ
s5Ir4RAAgIeuP6joYj5FhZqzV4VbZ4t/QTHS4dXl1LknvyV37IXxicFsUz2A5aIj
PFrJU+tBknpj/rFbZIw5dWCK1N2kt2FM0fR9pIHzgOlH8Nv4LUawy4Fq4LREQGSV
LLS5OAEQ+SiphKfeMjYeokeznwVQYKIPGGY2lFk/DPQrHjYOx2Ln6sS3FcAvKO/4
5H+5b6uWMw9X4quka9o8p56m3/oBUYL3Yoy5wlZO8X8gniZ0GfV9DfqH3otegrZu
/1mEbsGK0hgILQrKi4mcND7aPFF9ijcGuj9HkS9xz9emXb2y9cXSSmHVr3lFmCsc
iyXWwqnehxrZn/3mAYmaISt9ACZENDaZ5zHTSvmXrEhz8RBsy0eiqD7i852Y86zZ
Sw9OuC135HwBDpvqVR2duwhORJt1+OVLFtJjijRImcWZQXiKIsmORRoWhNxRRCjE
pLsba7IztCdSsn7NMAfJCTZmaaPCq3ckqxj5C8zFOrJrV5P47lPZ+/v13iCZ7P4b
RZ5QQ35Hf9H8udCCu2cfij/0h9i+00BJO2o7az4htlCG2N3t5b0Fh6RTFWcTHGCe
WL9V/O16r+GmQ3P3wWCgMejlQ7/E37B3C/RPCCjkD8eNhz8sMc9m4ZvuIk7/Vovi
72S/ctPCd/MMjoRxjWSRehdhjrvUzRAzEaHlK2+NMCY6mJOLsqk=
=ZKQ5
-----END PGP SIGNATURE-----

--WkfBGePaEyrk4zXB--

