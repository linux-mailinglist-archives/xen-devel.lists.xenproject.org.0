Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0857C3DBDF2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 19:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162631.298190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9WdW-0006HI-72; Fri, 30 Jul 2021 17:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162631.298190; Fri, 30 Jul 2021 17:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9WdW-0006EB-31; Fri, 30 Jul 2021 17:49:30 +0000
Received: by outflank-mailman (input) for mailman id 162631;
 Fri, 30 Jul 2021 17:49:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kLoK=MW=pengutronix.de=ukl@srs-us1.protection.inumbo.net>)
 id 1m9WdU-0006E5-8W
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 17:49:28 +0000
Received: from metis.ext.pengutronix.de (unknown
 [2001:67c:670:201:290:27ff:fe1d:cc33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f090acba-91aa-4412-8186-e0f6108b1f07;
 Fri, 30 Jul 2021 17:49:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m9Wcc-00064T-I3; Fri, 30 Jul 2021 19:48:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m9WcO-0005qH-Ky; Fri, 30 Jul 2021 19:48:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m9WcO-00079n-I5; Fri, 30 Jul 2021 19:48:20 +0200
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
X-Inumbo-ID: f090acba-91aa-4412-8186-e0f6108b1f07
Date: Fri, 30 Jul 2021 19:48:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	oss-drivers@corigine.com, Oliver O'Halloran <oohall@gmail.com>,
	Russell Currey <ruscur@russell.cc>, Jiri Olsa <jolsa@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-perf-users@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-scsi@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Ido Schimmel <idosch@nvidia.com>, x86@kernel.org,
	qat-linux@intel.com,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
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
	Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v1 0/5] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20210730174820.i6ycjyvyzxcxwxsc@pengutronix.de>
References: <20210729203740.1377045-1-u.kleine-koenig@pengutronix.de>
 <YQOy/OTvY66igEoe@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t5ueb7xyetl6m7j3"
Content-Disposition: inline
In-Reply-To: <YQOy/OTvY66igEoe@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: xen-devel@lists.xenproject.org


--t5ueb7xyetl6m7j3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, Jul 30, 2021 at 11:06:20AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 29, 2021 at 10:37:35PM +0200, Uwe Kleine-K=F6nig wrote:
> > struct pci_dev tracks the bound pci driver twice. This series is about
> > removing this duplication.
> >=20
> > The first two patches are just cleanups. The third patch introduces a
> > wrapper that abstracts access to struct pci_dev->driver. In the next
> > patch (hopefully) all users are converted to use the new wrapper and
> > finally the fifth patch removes the duplication.
> >=20
> > Note this series is only build tested (allmodconfig on several
> > architectures).
> >=20
> > I'm open to restructure this series if this simplifies things. E.g. the
> > use of the new wrapper in drivers/pci could be squashed into the patch
> > introducing the wrapper. Patch 4 could be split by maintainer tree or
> > squashed into patch 3 completely.
>=20
> I see only patch 4 and this cover letter...

The full series is available at

	https://lore.kernel.org/linux-pci/20210729203740.1377045-1-u.kleine-koenig=
@pengutronix.de/

All patches but #4 only touch drivers/pci/ (and include/linux/pci.h) and
it seemed excessive to me to send all patches to all people. It seems at
least for you I balanced this wrongly. The short version is that patch
#3 introduces

	+#define pci_driver_of_dev(pdev) ((pdev)->driver)

which allows to do the stuff done in patch #4 and then patch #5 does

	-#define pci_driver_of_dev(pdev) ((pdev)->driver)
	+#define pci_driver_of_dev(pdev) ((pdev)->dev.driver ? to_pci_driver((pdev=
)->dev.driver) : NULL)

plus some cleanups.

If you want I can send you a bounce (or you try

	b4 am 20210729203740.1377045-1-u.kleine-koenig@pengutronix.de

).

Best regards and thanks for caring,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t5ueb7xyetl6m7j3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmEEO2EACgkQwfwUeK3K
7AkOCgf/UKvRbSIrjjdKl0HWJofJEfaXlbATSgBausmxV/dcXsg1sLkhkpTN66bG
WmAdhFN03Vtx3jHKeYtgo3x8g39nfYT4NmlYTNumgxTow6TESnJxbYewE3i0alrR
Jv0JvBFhUaXj++XetOVHn9f5/t7o5NL/XSF5DTwQM8lZ5skmA2+XXea8lU0IFufZ
uTi0XA3G5BNhyU6RiehvnN59J6QCN3CIVqajOrZbqf33jiiyCTDf2tEqCYRbv1vJ
zqt7zYp05RtUaqNKe9oH4N4UFCdChrjZlFP7w7gyqM6Jh/wOSERlVdpocf0BGClR
W6o7YIB7QFf+ByIxy6hIBeXnaPaDFQ==
=oi24
-----END PGP SIGNATURE-----

--t5ueb7xyetl6m7j3--

