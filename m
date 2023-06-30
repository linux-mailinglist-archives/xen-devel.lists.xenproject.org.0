Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D27444F0
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 00:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557653.871191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFMpA-0003WQ-Dn; Fri, 30 Jun 2023 22:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557653.871191; Fri, 30 Jun 2023 22:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFMpA-0003TV-AH; Fri, 30 Jun 2023 22:42:44 +0000
Received: by outflank-mailman (input) for mailman id 557653;
 Fri, 30 Jun 2023 22:42:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hAh9=CS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qFMp9-0003TP-C6
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 22:42:43 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a3eff95-1797-11ee-b237-6b7b168915f2;
 Sat, 01 Jul 2023 00:42:39 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 632685C21B0;
 Fri, 30 Jun 2023 18:38:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 30 Jun 2023 18:38:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jun 2023 18:38:29 -0400 (EDT)
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
X-Inumbo-ID: 6a3eff95-1797-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1688164711; x=1688251111; bh=6G7LF33DLK7fMqnak222XQLP5fkdA/snjvo
	ivj3rDmE=; b=bLT7/coSWtsVFm5U9ttpJLv6Ws9xUCyDSVYJfhRApqJu/JtyLol
	5pvWaAc1BehwjZFb9aDhUGcUdUeNiEHnc4mUGtfgOfgD9VrLA8BknJf7Xzg9X4xr
	rSO23LHExL8rk7TKohIpWq2J8V2b834cjayo/JkU8jfqNhJEGwBZSON1pimpXd+5
	1Xe8u30AUq1VvtFOh314IQ2tzeFLsG0gV5F1ZySUJWVVfAPnvPdxdce0daYvB+3B
	x0LldQpRoKuXvdX+GhNQO3GEjznRcbO/QeNVEArwKVUGlF3VZ589f06+mMVt5hrx
	OjN48nDHJimgWFg52pfNaZHo4pXyst2WOAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688164711; x=1688251111; bh=6G7LF33DLK7fM
	qnak222XQLP5fkdA/snjvoivj3rDmE=; b=VCqJ5F5fgD5WdSF6KnVVcWXGaWPmx
	pJ2VVUGZE2WNbEaftgQGuFaFF3q4Bmgf901bGkGPlEUwpRavbCDrL11nICN3ebbk
	uHPkr7Fq8ucgelw1oHkon0VDK2QLAB1YLRz7UWJD1jIu8ja8Pu7vQo9q2c3wq0re
	NcglgmCiF+Ej2+lAWfj5uUmYqUr/VBuJPdOxMZkd6EtKlfbPbLu9v1RhCCsrbMas
	YBV7p3Q1N9kgMjg3PT/a+iqS+5kPNwBZ69eb5SGqtZfXS/aQH2jQLk7zViuYg8TO
	BYVxRzQNVkzrEk/64EMLjpx1V0u0Gl8Xn+mH5rhjhn1HI+Jghofgq70nw==
X-ME-Sender: <xms:ZlmfZIWOM3qeFpo50o6epaIomi05KMi2KO5G5zGP03SlM03LCNEo2Q>
    <xme:ZlmfZMlIkVpR8Y2ZUNHS5-kow1GUTeN9lhvYSco0MQ8MAjF6ivlEc8dGN7QxmZ7OU
    zGVryadpwSVnQ>
X-ME-Received: <xmr:ZlmfZMbr7HWmHrXE8IvAyxuJYxUd_dzbqjLlpzNB_RQcGoCWKkZP1jN-NapAmuaWYeb9bsxXccAiqJkgEMDSIsRhfiM6QyX_u-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdejgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ZlmfZHWzH2VctB7b1JUDq4VQaUSLAnUEc6UMKgoJayhABLYiy46OAg>
    <xmx:ZlmfZClL2qtvZM3itMWrFVNaXfFr8c5QgXCCYGcfVj95zp5JEWNzgg>
    <xmx:ZlmfZMdyK6QSjwHOPlkCjMlxpy6eOhcVFFcyLoTcYSCHDvBmwMePnQ>
    <xmx:Z1mfZDBwPM06k_bvVyrm0_QnX64nhab5_dwR3fzUhoxzAlE5cxo07g>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 1 Jul 2023 00:38:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] drivers/char: Use sub-page ro API to make just
 xhci dbc cap RO
Message-ID: <ZJ9ZYjWoiPU7GFuV@mail-itl>
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <1f9909dacfd7822a1c7d30ba03bbec93fa2ff6fd.1683321183.git-series.marmarek@invisiblethingslab.com>
 <f168a753-45d2-7d66-8ec7-ad06e6cd42eb@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3axsVjmOW6Rx9DYF"
Content-Disposition: inline
In-Reply-To: <f168a753-45d2-7d66-8ec7-ad06e6cd42eb@suse.com>


--3axsVjmOW6Rx9DYF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 1 Jul 2023 00:38:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] drivers/char: Use sub-page ro API to make just
 xhci dbc cap RO

On Tue, May 30, 2023 at 02:04:26PM +0200, Jan Beulich wrote:
> On 05.05.2023 23:25, Marek Marczykowski-G=C3=B3recki wrote:
> > Not the whole page, which may contain other registers too. In fact
> > on Tiger Lake and newer (at least), this page do contain other registers
> > that Linux tries to use.
>=20
> Please can you clarify whether this is with spec or an erratum?=20

It is in spec. The spec is written with assumption that different driver
may drive the debug console than the rest of the controller. But the
spec (apparently) does not anticipate those drivers living in different
kernels, so does not mandate isolating registers to separate pages.

> I ask
> not the least because I continue to wonder whether we really want/need
> the non-negligible amount of new code added by path 1.
>=20
> > And with share=3Dyes, a domU would use them too.
>=20
> And gain yet more access to the emulator, as mentioned in patch 1. The
> security implications may (will?) want mentioning.
>=20
> > --- a/xen/drivers/char/xhci-dbc.c
> > +++ b/xen/drivers/char/xhci-dbc.c
> > @@ -1221,14 +1221,12 @@ static void __init cf_check dbc_uart_init_posti=
rq(struct serial_port *port)
> >       * Linux's XHCI driver (as of 5.18) works without writting to the =
whole
> >       * page, so keep it simple.
> >       */
> > -    if ( rangeset_add_range(mmio_ro_ranges,
> > -                PFN_DOWN((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MAS=
K) +
> > -                         uart->dbc.xhc_dbc_offset),
> > -                PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK)=
 +
> > -                       uart->dbc.xhc_dbc_offset +
> > -                sizeof(*uart->dbc.dbc_reg)) - 1) )
> > -        printk(XENLOG_INFO
> > -               "Error while adding MMIO range of device to mmio_ro_ran=
ges\n");
> > +    if ( subpage_mmio_ro_add(
> > +            (uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
> > +             uart->dbc.xhc_dbc_offset,
> > +            sizeof(*uart->dbc.dbc_reg)) )
> > +        printk(XENLOG_WARNING
> > +               "Error while marking MMIO range of XHCI console as R/O\=
n");
>=20
> So how about falling back to just rangeset_add_range(mmio_ro_ranges, ...)
> in this failure case? (I did mention an alternative to doing it here in
> the comments on patch 1.)

Or fallback to XHCI_SHARE_NONE (IOW, pci_ro_device()).

> Also, doesn't the comment ahead of the construct become stale?

Indeed.

> Finally I think indentation of the function call arguments is off by one.

How is it supposed to be? Currently it's 8 spaces over the "if", should
it be 4 spaces over the function name?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3axsVjmOW6Rx9DYF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmSfWWIACgkQ24/THMrX
1yw3Rwf/badY5zujDOLzmpYyhKzbSlInhaIaCWUUFWH1MI0ZL/2poHqK+JhpxSh9
bCFDSoMsLDgiTdqIPzCmRnMTN+Q2x8jnXEq73rngv4w6eMHBWU/JoKv5q9eRTkRl
SFGjlyYIUYnyU3t139wAm20igpp+YzWtD2l971XPLOxDf/o/Kz+IPmVN7oS5qKTw
j1YCP/YPsjSwUnJqD7jOCWvXYQicWYq8gGhoY8xOsGYSsDyklOfH0Ab75m503lB1
YtFg2/x6U59BgODVwlaXoLOc6B6Hlp55xnnhbWi3ZM8+F3Q3WvzMvtjatUI/eYBu
yFx4GFNa2WK8NUYcoFEma2iTrQ8EPA==
=sGg6
-----END PGP SIGNATURE-----

--3axsVjmOW6Rx9DYF--

