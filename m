Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D53A3E2373
	for <lists+xen-devel@lfdr.de>; Fri,  6 Aug 2021 08:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164671.301004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBteW-00076g-R1; Fri, 06 Aug 2021 06:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164671.301004; Fri, 06 Aug 2021 06:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBteW-000745-NW; Fri, 06 Aug 2021 06:48:20 +0000
Received: by outflank-mailman (input) for mailman id 164671;
 Fri, 06 Aug 2021 06:48:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7wX=M5=pengutronix.de=ukl@srs-us1.protection.inumbo.net>)
 id 1mBteW-00073z-7D
 for xen-devel@lists.xenproject.org; Fri, 06 Aug 2021 06:48:20 +0000
Received: from metis.ext.pengutronix.de (unknown
 [2001:67c:670:201:290:27ff:fe1d:cc33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38f11413-b6b5-4def-aaab-728ebb05dd4d;
 Fri, 06 Aug 2021 06:48:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mBtcu-0007Bd-Gw; Fri, 06 Aug 2021 08:46:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mBtce-0004p1-8f; Fri, 06 Aug 2021 08:46:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mBtce-0003LN-5b; Fri, 06 Aug 2021 08:46:24 +0200
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
X-Inumbo-ID: 38f11413-b6b5-4def-aaab-728ebb05dd4d
Date: Fri, 6 Aug 2021 08:46:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
	Alexander Duyck <alexanderduyck@fb.com>,
	Russell Currey <ruscur@russell.cc>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	oss-drivers@corigine.com, Paul Mackerras <paulus@samba.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Jiri Olsa <jolsa@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-perf-users@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-scsi@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Ido Schimmel <idosch@nvidia.com>, x86@kernel.org,
	qat-linux@intel.com,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Fiona Trahe <fiona.trahe@intel.com>,
	Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Simon Horman <simon.horman@corigine.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Michael Buesch <m@bues.ch>,
	Jiri Pirko <jiri@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Juergen Gross <jgross@suse.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	xen-devel@lists.xenproject.org, Vadym Kochan <vkochan@marvell.com>,
	MPT-FusionLinux.pdl@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	linux-kernel@vger.kernel.org, Taras Chornyi <tchornyi@marvell.com>,
	Zhou Wang <wangzhou1@hisilicon.com>, linux-crypto@vger.kernel.org,
	kernel@pengutronix.de, netdev@vger.kernel.org,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v2 0/6] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20210806064623.3lxl4clzbjpmchef@pengutronix.de>
References: <20210803100150.1543597-1-u.kleine-koenig@pengutronix.de>
 <20210805234234.GA1797883@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nllglfksvmzlkdkm"
Content-Disposition: inline
In-Reply-To: <20210805234234.GA1797883@bjorn-Precision-5520>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: xen-devel@lists.xenproject.org


--nllglfksvmzlkdkm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bjorn,

On Thu, Aug 05, 2021 at 06:42:34PM -0500, Bjorn Helgaas wrote:
> On Tue, Aug 03, 2021 at 12:01:44PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > changes since v1 (https://lore.kernel.org/linux-pci/20210729203740.1377=
045-1-u.kleine-koenig@pengutronix.de):
> >=20
> > - New patch to simplify drivers/pci/xen-pcifront.c, spotted and
> >   suggested by Boris Ostrovsky
> > - Fix a possible NULL pointer dereference I introduced in xen-pcifront.c
> > - A few whitespace improvements
> > - Add a commit log to patch #6 (formerly #5)
> >=20
> > I also expanded the audience for patches #4 and #6 to allow affected
> > people to actually see the changes to their drivers.
> >=20
> > Interdiff can be found below.
> >=20
> > The idea is still the same: After a few cleanups (#1 - #3) a new macro
> > is introduced abstracting access to struct pci_dev->driver. All users
> > are then converted to use this and in the last patch the macro is
> > changed to make use of struct pci_dev::dev->driver to get rid of the
> > duplicated tracking.
>=20
> I love the idea of this series!

\o/

> I looked at all the bus_type.probe() methods, it looks like pci_dev is
> not the only offender here.  At least the following also have a driver
> pointer in the device struct:
>=20
>   parisc_device.driver
>   acpi_device.driver
>   dio_dev.driver
>   hid_device.driver
>   pci_dev.driver
>   pnp_dev.driver
>   rio_dev.driver
>   zorro_dev.driver

Right, when I converted zorro_dev it was pointed out that the code was
copied from pci and the latter has the same construct. :-)
See
https://lore.kernel.org/r/20210730191035.1455248-5-u.kleine-koenig@pengutro=
nix.de
for the patch, I don't find where pci was pointed out, maybe it was on
irc only.

> Do you plan to do the same for all of them, or is there some reason
> why they need the pointer and PCI doesn't?

There is a list of cleanup stuff I intend to work on. Considering how
working on that list only made it longer in the recent past, maybe it
makes more sense to not work on it :-)

> In almost all cases, other buses define a "to_<bus>_driver()"
> interface.  In fact, PCI already has a to_pci_driver().
>=20
> This series adds pci_driver_of_dev(), which basically just means we
> can do this:
>=20
>   pdrv =3D pci_driver_of_dev(pdev);
>=20
> instead of this:
>=20
>   pdrv =3D to_pci_driver(pdev->dev.driver);
>=20
> I don't see any other "<bus>_driver_of_dev()" interfaces, so I assume
> other buses just live with the latter style?  I'd rather not be
> different and have two ways to get the "struct pci_driver *" unless
> there's a good reason.

Among few the busses I already fixed in this regard pci was the first
that has a considerable amount of usage. So I considered it worth giving
it a name.
=20
> Looking through the places that care about pci_dev.driver (the ones
> updated by patch 5/6), many of them are ... a little dubious to begin
> with.  A few need the "struct pci_error_handlers *err_handler"
> pointer, so that's probably legitimate.  But many just need a name,
> and should probably be using dev_driver_string() instead.

Yeah, I considered adding a function to get the driver name from a
pci_dev and a function to get the error handlers. Maybe it's an idea to
introduce these two and then use to_pci_driver(pdev->dev.driver) for the
few remaining users? Maybe doing that on top of my current series makes
sense to have a clean switch from pdev->driver to pdev->dev.driver?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nllglfksvmzlkdkm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmEM2rwACgkQwfwUeK3K
7AlqBggAh2Z8+ZW+YMYlQQ8AzujRmGYo9gKX26eGdp2jNjZUeOc0CEZwm/GiW4aZ
9+W1RS3i+O6ToHVYkt9fNEpdUGO3YdBKiMHGWsrkQuwNjm4Yv5Dlx/wRz0dU4vIX
QQDa5tw6Mow1g0gjZqHvDuwbgKoJyHXzFD115kBaINYN/XqOLST9YvMqxxSsHHsD
qRmpU59QTxEqHXKIsgABctdVnQBkbixppZH3/6nu+Xh7qkZvczBLpx/C5V1+XeAv
47LOxaH3wiLQBS/sICKlAFeYcbAyNhwh+nbMxx5i3lG6O6LhaeX46FPMoTG6qiAj
MaO1mAnwrEO35eTXFBgw4IYh37zS9A==
=/ZHI
-----END PGP SIGNATURE-----

--nllglfksvmzlkdkm--

