Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB65441C5E7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199170.353061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZsV-0004AK-6d; Wed, 29 Sep 2021 13:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199170.353061; Wed, 29 Sep 2021 13:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZsV-00048P-3a; Wed, 29 Sep 2021 13:44:07 +0000
Received: by outflank-mailman (input) for mailman id 199170;
 Wed, 29 Sep 2021 13:44:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEC3=OT=pengutronix.de=ukl@srs-us1.protection.inumbo.net>)
 id 1mVZsT-00048B-MG
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:44:05 +0000
Received: from metis.ext.pengutronix.de (unknown
 [2001:67c:670:201:290:27ff:fe1d:cc33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdc11d22-62f2-481a-b433-5ae93a89744b;
 Wed, 29 Sep 2021 13:44:04 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVZs4-0002ro-Tl; Wed, 29 Sep 2021 15:43:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVZru-0005It-Cu; Wed, 29 Sep 2021 15:43:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVZru-0001Wi-AO; Wed, 29 Sep 2021 15:43:30 +0200
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
X-Inumbo-ID: bdc11d22-62f2-481a-b433-5ae93a89744b
Date: Wed, 29 Sep 2021 15:43:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Russell Currey <ruscur@russell.cc>, Jiri Olsa <jolsa@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-perf-users@vger.kernel.org,
	kernel@pengutronix.de, Frederic Barrat <fbarrat@linux.ibm.com>,
	Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 10/11] PCI: Replace pci_dev::driver usage by
 pci_dev::dev.driver
Message-ID: <20210929134330.e5c57t7mtwu5iner@pengutronix.de>
References: <20210929085306.2203850-1-u.kleine-koenig@pengutronix.de>
 <20210929085306.2203850-11-u.kleine-koenig@pengutronix.de>
 <75dd6d60-08b9-fa68-352c-3a0c5a04c0ab@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ycp367bsarc33tfb"
Content-Disposition: inline
In-Reply-To: <75dd6d60-08b9-fa68-352c-3a0c5a04c0ab@linux.ibm.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: xen-devel@lists.xenproject.org


--ycp367bsarc33tfb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2021 at 11:15:37PM +1000, Andrew Donnellan wrote:
> On 29/9/21 6:53 pm, Uwe Kleine-K=F6nig wrote:>   =09
> list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
> > -			if (afu_dev->driver && afu_dev->driver->err_handler &&
> > -			    afu_dev->driver->err_handler->resume)
> > -				afu_dev->driver->err_handler->resume(afu_dev);
> > +			struct pci_driver *afu_drv;
> > +			if (afu_dev->dev.driver &&
> > +			    (afu_drv =3D to_pci_driver(afu_dev->dev.driver))->err_handler &&
>=20
> I'm not a huge fan of assignments in if statements and if you send a v6 I=
'd
> prefer you break it up.

I'm not a huge fan either, I used it to keep the control flow as is and
without introducing several calls to to_pci_driver.

The whole code looks as follows:

	list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
		struct pci_driver *afu_drv;
		if (afu_dev->dev.driver &&
		    (afu_drv =3D to_pci_driver(afu_dev->dev.driver))->err_handler &&
		    afu_drv->err_handler->resume)
			afu_drv->err_handler->resume(afu_dev);
	}

Without assignment in the if it could look as follows:

	list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
		struct pci_driver *afu_drv;

		if (!afu_dev->dev.driver)
			continue;

		afu_drv =3D to_pci_driver(afu_dev->dev.driver));

		if (afu_drv->err_handler && afu_drv->err_handler->resume)
			afu_drv->err_handler->resume(afu_dev);
	}

Fine for me.

(Sidenote: What happens if the device is unbound directly after the
check for afu_dev->dev.driver? This is a problem the old code had, too
(assuming it is a real problem, didn't check deeply).)

> Apart from that everything in the powerpc and cxl sections looks good to =
me.

Thanks for checking.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ycp367bsarc33tfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFUbX8ACgkQwfwUeK3K
7Am1vgf4oAZW8TWGX7Ao47AspECT0eq6axIwcj5PXeVpv5NC7BZPYClTPkycpcUZ
q8GsCEDyP5ratJ0gW3XFPyCkvgml0ndAP8y5Cs1ZeE1rU6xCJivD/HWMBoTJvaIH
uWxKIKzt/IiZWdt4Wo+fYplgR1/fak8IgUcV7jWOXA7pVVcZB3enVL/cB6xinq/H
+T9nGsYMVfSfdJdcD/EHVePI34oVlE9Eor3g1MFzRHk21B+r9J/TxUCsj84/JW60
P//CUO5CrpsjnqvhmShEm8POvpOjaTXLPxxTh3Oan2WFcgc/8mNx5zaKFdM1Rjmg
YeZXa3sMNdP7hIFZvqylIJDO3SbK
=MbZA
-----END PGP SIGNATURE-----

--ycp367bsarc33tfb--

