Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80416A4C24
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 21:18:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502892.774924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWjxB-0002UO-Sc; Mon, 27 Feb 2023 20:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502892.774924; Mon, 27 Feb 2023 20:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWjxB-0002S1-Pu; Mon, 27 Feb 2023 20:18:33 +0000
Received: by outflank-mailman (input) for mailman id 502892;
 Mon, 27 Feb 2023 20:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/yXf=6X=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pWjxA-0002Rv-GH
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 20:18:32 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4adb6cb-b6db-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 21:18:30 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1D2A7320090E;
 Mon, 27 Feb 2023 15:18:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 27 Feb 2023 15:18:25 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 15:18:23 -0500 (EST)
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
X-Inumbo-ID: e4adb6cb-b6db-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1677529104; x=
	1677615504; bh=x7aGqY8gPLzJgS9VysO3Ue+/pXy28GvA8fCE+P0d5Ls=; b=L
	N67Btts4UqOGWjZgZtDuTLSR80hciA0+jRKERlmcFo5fZI6+S4y/sXjhT06OYd/p
	0QqSuMyl49JOrpN0N07hd+5DsnZrZqGAdEEQ3/x5pfZ+MSLvhGuN/4IAHl8N4GUp
	wFe3aE5rc2abUXTOLxlevQ6h5O6AWh09quiTBUw/l80CF5SQhkJf9HO1pBDgH6oe
	VoZ1462JE3G7ombtRBmtRbsD0btv5rbKSwNFg7DbwIQydkYmncY5X49NBSgng9wE
	T+XgTIaLvQSnfRLyhDKUSZV4INO3fQnz4luir/756/wcrauLxAqbKhDMpUynlJ7f
	fD174FSQbDHBCOwmWmdug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677529104; x=1677615504; bh=x7aGqY8gPLzJgS9VysO3Ue+/pXy2
	8GvA8fCE+P0d5Ls=; b=qB68H20lNLFB2fbOv2z5FySupgdcivXaykcIGDrcobah
	XiqXAR3ehoPukuxc4+dOnttje8mjssIg8vj/sMlzIr1O+IVqYeg7pAnEH9ZfLi4c
	WDQAS7Jc9ECJgVzQbxKMMfYeSO65CJD/z3tS7tsGT9vMj7iAabM7k8M+D8kjYiuz
	2psGqID4g+OVlfLSI6zTb355CPuJpp8F9f4/gnGS7kynj9bnAAr7CcAUK+J2j+IJ
	m0Ln5xm91KGwmgM14vQsK1XMK+/rP7QF4DmMjeRSuPoK7aI2TYHzwQ7ELC5e3hrn
	bGBWHlZBuen21/k1ulR/H9s8vChIrZ2h/taYGok5ng==
X-ME-Sender: <xms:EBD9Y4y4OFxBzmsMYXZlVojab3i69ykAmQP2JdfIqTqRwKQeUDF6Gw>
    <xme:EBD9Y8R3-gr0LnzxOrV2RsC-p6jRKnn-OaIb6KMN-BWoqJG_hNXxM9wtb548mDWE7
    RJs6Y_1_DN6fc0>
X-ME-Received: <xmr:EBD9Y6VuTwye63RAUfWb1xUbGx_xWmAeZLFxQtM2vRsMFEIp3niE1xGmr8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevtedugeffuddtteduheeuudet
    geeiteetudelvdehvdevueegheffleeludeuvdenucffohhmrghinhepiihlihgsrdhnvg
    htpdigvghnphhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhm
X-ME-Proxy: <xmx:EBD9Y2jGOfaEsnTl2K-GJUI_2Zq651QWKYuZqAVyljqIIKlyrIyeIg>
    <xmx:EBD9Y6Cu_hJGanTn_kfTUIZFFEWQp4m9f6py725ft9hKGV7pAHwUvw>
    <xmx:EBD9Y3K2uiOrOJMjyogFWot5aXx3Ya6ksE7YTon-FL55Mt7slC0Wlw>
    <xmx:EBD9YwB7wXUOtuTZ7_7XZ_bJUf3vuGKdA9JTjzA6A_guBQZ2dEKeNg>
Feedback-ID: iac594737:Fastmail
Date: Mon, 27 Feb 2023 15:18:17 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/3] Build system: Replace git:// and http:// with
 https://
Message-ID: <Y/0QDdeEO3mCOorX@itl-email>
References: <cover.1676750305.git.demi@invisiblethingslab.com>
 <944d212b0047339e4c15f7f85d74ff7fbfe96912.1676750305.git.demi@invisiblethingslab.com>
 <8c4aa332-07ee-e91a-50f1-ced9e36db2a1@suse.com>
 <Y/lASQDDXEZY5qDB@itl-email>
 <30b906ef-9c93-afec-14f5-4623cd24b273@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="58F2n6kLmm88isut"
Content-Disposition: inline
In-Reply-To: <30b906ef-9c93-afec-14f5-4623cd24b273@suse.com>


--58F2n6kLmm88isut
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Feb 2023 15:18:17 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/3] Build system: Replace git:// and http:// with
 https://

On Mon, Feb 27, 2023 at 09:25:32AM +0100, Jan Beulich wrote:
> On 24.02.2023 23:55, Demi Marie Obenour wrote:
> > On Tue, Feb 21, 2023 at 11:07:58AM +0100, Jan Beulich wrote:
> >> On 19.02.2023 03:46, Demi Marie Obenour wrote:
> >>> --- a/stubdom/configure
> >>> +++ b/stubdom/configure
> >>> @@ -3535,7 +3535,7 @@ if test "x$ZLIB_URL" =3D "x"; then :
> >>>  	if test "x$extfiles" =3D "xy"; then :
> >>>    ZLIB_URL=3D\$\(XEN_EXTFILES_URL\)
> >>>  else
> >>> -  ZLIB_URL=3D"http://www.zlib.net"
> >>> +  ZLIB_URL=3D"https://www.zlib.net"
> >>>  fi
> >>
> >> In v3 you said that this URL can't be used anymore for the version we'=
re
> >> trying to fetch (which I can confirm). Leaving aside the question of w=
hy
> >> stubdom was never updated in that regard, what use is it to update URL
> >> (without even mentioning the aspect in the description) in such a case?
> >> (I haven't gone through any of the other URLs again, so there may well
> >> be more similar cases.)
> >=20
> > Main advantage is that it will fail securely rather than downloading
> > whatever random code an MITM attacker put in there.
>=20
> As said before (and implied here): At the very least you need to mention
> the aspect in the description. But then wouldn't things be failing equally
> securely if no (non-working) URL was put in place, or one which is
> guaranteed to yield an error but makes obvious that no real URL is meant?

https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg01439.html
("[PATCH v5 3/5] Build system: Do not try to use broken links") does
exactly that.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--58F2n6kLmm88isut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmP9EA4ACgkQsoi1X/+c
IsFKaRAAwAVy+udQtgDHARiqxEpkHI+DXnmdfbdS89hpcC/A3e5WGdEJoV77n2dY
ERynxouXwjTcKBYphScI0uUp6SIwEe9Y8/IeJGdEvE/riF6yiNX+0IGS4yzXV7O7
zWRlS22uU6pQI9XHyQPeJiPdRBADOJJ18MctqmXAmyMilNmjt4DutvGmm9AP72tO
Mkn1t2L/xbxCpMyMoub7V0nXTdZ/Y3hQHOspFcpqS3rZ2XmlX4wnWUjxWwKtx/47
9uPTxe1bjBtIfTDFSfq9a8ZqQc+TaPIiq6JZTO7gL3ngDJDJZJT/yEwLk4wz16c4
IrVvAlNPap4Y1OVw3AABDNPHfji9QbU18JqaDViutv2eAas2gF38VIztSatHlGcU
Ffjjr1SdZL5vsBhbILzZwsFhBsVCLzXq3AIVKQDOoQYbzDpFk1f7dYJCgRu0y6Zi
eNHSFhOJ8g8OyWIQlOrE8E40trawPgEpZ2MGA7nrgcCaWI8Qo0UVWjBb45AsPr2y
IK/WCkEWHeqY/XUh3qs2Fo5FGsM+EScpZwIuKTAXJIiEBGBlM16xTDwCMRXO0bnR
5nU1Rxd5aa3FuLohjpKVWo7mQ0yJS3k4gYtPuPjudJe3we5F6RmkT9q3Tltm+4ZZ
1Re1BZCyQnwiqfDIiohQrSm1wrm/5UpTlA1lGvs7edR7F4Hd+7I=
=EWb3
-----END PGP SIGNATURE-----

--58F2n6kLmm88isut--

