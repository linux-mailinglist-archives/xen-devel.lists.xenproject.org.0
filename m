Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F851613EEB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 21:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433197.686079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opbJM-0005gd-Dy; Mon, 31 Oct 2022 20:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433197.686079; Mon, 31 Oct 2022 20:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opbJM-0005db-BH; Mon, 31 Oct 2022 20:23:08 +0000
Received: by outflank-mailman (input) for mailman id 433197;
 Mon, 31 Oct 2022 20:23:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=grsl=3A=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1opbJL-0005dS-9u
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 20:23:07 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d065576e-5959-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 21:23:03 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5B2243200948;
 Mon, 31 Oct 2022 16:22:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 31 Oct 2022 16:22:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Oct 2022 16:22:57 -0400 (EDT)
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
X-Inumbo-ID: d065576e-5959-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1667247777; x=
	1667334177; bh=qkh6jwHVi4/2Pk/o3gFdi5cX+vrKKYFs7z0PddyqqaM=; b=d
	hevvHmnVVOar2cbKPS0L1WQGgGhqkWjnXHfCq3kyRVUSrFznjImAzLrXSjMmQ74m
	culaPhSFHpRPXhfxPiqo43C5mf9HQHHszuStmnlTIUmAyKxEyNKE/6af6hUgRigx
	Pri1vQVqTBT57Fvz1NM+jjMNU3MuDqXFcEM0Q7+ox6HAIwPRDja2WwPyoh8bFF2u
	dNAESytFJFL3FxQGBpWlsctRcIJUSF+kSXjEISPRa0xkp036aLVSIizjd4nXl0bc
	5mjHsqiArKvbSOwMyhuMKx6Io/ez8um+AJ42lR3GsDCJ6+UFmtU103ofdzo4g+4M
	ab+LyW38/6JHauC8+4HPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667247777; x=1667334177; bh=qkh6jwHVi4/2Pk/o3gFdi5cX+vrK
	KYFs7z0PddyqqaM=; b=KVercjdM1b5d58lMpD4CjjOFdqtu30wy+NHs2ziSCyLr
	inuYmPBPi4nhNxdsM4y7VqkCmjx9Sz7/1DOr71ow+60p2r+iHBlDU0WqSUEFW2v/
	CBJZwpSQE3nLtsPGSpC0sTBvdAS0P6yQRIjZ3ypWk6j4PbPkGAbk1XX2bEBBZtIt
	mba2w/HPY++acWCgxc8+Pwu7IB5Hcf7+9rO06tlNeDb5KaFtCcCgzz/lQyy2UF+H
	MlEGc/8+ZQmFM+GOaRtr+Gcm0qysynLdHR39LA63yzO70QZJGH9wNzQh3zs5CKzg
	kTRIjtXxwMSGyGU5o5ND6ENiiTUiTHFtMeS6lOv9Ew==
X-ME-Sender: <xms:oS5gY4LexDBxho-FMSxVE3MIfYCFFPb7zfMbiJlUGxSMo3eVa21fNw>
    <xme:oS5gY4KlicfSLNPzClftUXOTUY6BkNXYuMaoEQL-L7bLiyqj89dQxe_43U7Caoszd
    Q4xURRc_lrI8sk>
X-ME-Received: <xmr:oS5gY4uchufENKgGhZdqrx2nlrh_TgocCVMAG-4ZbOikTarrO8pQgQU9AgIx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudefgddufeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudeileefueetvdelheeuteffjeeg
    jeegffekleevueelueekjeejudffteejkeetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:oS5gY1b1_KOV9qGuhkZUBc2VjixE7sJ1efTHSt_9VgB5D5KVAWHy7g>
    <xmx:oS5gY_Z9qxKBvqIKhXcqFcE30DS6fgP4bsS_vLBnApnKU9Tw3zN6lA>
    <xmx:oS5gYxBC3vm-ou4gzYaa1u4cYfA2QhGUuAhDn_6uuS6TwCrHZIHOIg>
    <xmx:oS5gY0PoDiqoOPKmBmEhJyQhv0CxbdtaixqFU7T0g3JM28TjP5Pl0A>
Feedback-ID: iac594737:Fastmail
Date: Mon, 31 Oct 2022 16:22:54 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Sasha Levin <sashal@kernel.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/3] Stable backports of gntdev fixes
Message-ID: <Y2Aun1V6TMRwtx15@itl-email>
References: <20221030071243.1580-1-demi@invisiblethingslab.com>
 <Y194Q9lH3ye4jJOU@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EArn+1gJx5niycp9"
Content-Disposition: inline
In-Reply-To: <Y194Q9lH3ye4jJOU@kroah.com>


--EArn+1gJx5niycp9
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Oct 2022 16:22:54 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Sasha Levin <sashal@kernel.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/3] Stable backports of gntdev fixes

On Mon, Oct 31, 2022 at 08:24:51AM +0100, Greg Kroah-Hartman wrote:
> On Sun, Oct 30, 2022 at 03:12:40AM -0400, Demi Marie Obenour wrote:
> > I backported the recent gntdev patches to stable branches before 5.15.
> > The first patch is a prerequisite for the other backports.  The second
> > patch should apply cleanly to all stable branches, but the third only
> > applies to 5.10 as it requires mmu_interval_notifier_insert_locked().
>=20
> Patches 1 and 2 now queued up, see my comments on 3.

Thanks!
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--EArn+1gJx5niycp9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmNgLp8ACgkQsoi1X/+c
IsF3iw/+JpjpEodUnYbUkft3jCaci1R7Bjb9z7tgZtacFO+fc89LlzCGPi9/fEe5
mWZVu003lIonXdB+ZI4ZhCo0aGaZE+BWpb0gB4XedNzGuddI6EGPbW5aJ1RcIsVY
sgljsPRZN/ONAIKdPtK2AAvqQKbEENmBzvAmzQHj+hoHMYVuwQ4qxF8FNw9VDb5s
2FL4pBTP//e1WXqhD8j7o/P+5tTHjvnfgwEqx2Xw918gJQrX1o2RoeA/+335hSff
a9+JbPLeyDX2B/dJmHXNuKpHWRP7zhfkR9EZbbNxn++MExARi7oGgYh0JYoIlIt7
iA1ZYgT2faXEKdehBhPjqwFzJ3bcVN0vV5LUk/DCcZoeiTHRTINy2GpkZGut31lf
lspeAq7r3x6/gCTTgyvDG1k8hd3YfEubTDCEsL0ruqCB4/vvbk7j3nscdd1/+tDh
INLt/a4HV50KFZuf+xetf/wIg0y6D98u7+lLqIN3qDNNKtRWbhJE9L8uopVVDqMG
nIbATG3PKS3moQ0qxs5zJtozHI3tuI+XYMmca+2uxWIENkhXuv432VwsAU5iZozi
6LaCJpibVO/OPlaVbYbtMIGzZUQUyEfB18v/9tIpMfIS1ojJDhQhfTwj96IXRjub
06pwbMf8RWOlF3117juxHMoOZyHTBJtN4IiNLtcnkLKKjpp93eY=
=1gyp
-----END PGP SIGNATURE-----

--EArn+1gJx5niycp9--

