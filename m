Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32D764888A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 19:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458171.716046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3iJ6-0003bs-I9; Fri, 09 Dec 2022 18:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458171.716046; Fri, 09 Dec 2022 18:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3iJ6-0003Ze-FW; Fri, 09 Dec 2022 18:41:12 +0000
Received: by outflank-mailman (input) for mailman id 458171;
 Fri, 09 Dec 2022 18:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKBv=4H=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p3iJ5-0003ZY-GI
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 18:41:11 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06fe19ab-77f1-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 19:41:02 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4B72232001AB;
 Fri,  9 Dec 2022 13:40:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 09 Dec 2022 13:40:59 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Dec 2022 13:40:58 -0500 (EST)
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
X-Inumbo-ID: 06fe19ab-77f1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1670611258; x=1670697658; bh=UI9CEBS2fD
	jovS22j3sCcZ9FV7X9vUhBl8MSohcXapk=; b=NHDwQqYvozm5kI0rOB0Lt3OJeI
	SjTqZdIc4669JyVXwlnYRBj/iRHEHeQc1vtWL75SzCF3WdR7PSslceFUvAfgvF4G
	8mYOivtsDA/Q80PMlUB6OH1WWHN5MipDnV8/v9X+BUmfCTlNSahnpIkqFVatQRQs
	/lJc3NqPJ6kjKelb/kKAtxVlM/Xv9ZBxttJL4lHjq4pxEj4lCgAu59Xr75fGtcT0
	zLGBf2/1YmH0VZe1hxEOkDsNpAvfu7XHsIHry4n9upTxw6s4CskgEmRxVzG4wwNA
	z18IIEyEJ16z0J0G3z+w2tMKK6Ec0eG7Pmgw59xf+GbS5CexkmR3uZr2U1bA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670611258; x=
	1670697658; bh=UI9CEBS2fDjovS22j3sCcZ9FV7X9vUhBl8MSohcXapk=; b=N
	soG3hCSjubho2zMW33qYzOZBw86xoSzKBZYHfZMuDWRTPjL6KVU8LGQcKe/sKzvi
	o6IXP3Ls6HzuMoGvmQZFTupXLTGd+OQiR+g2Fu/0UjUl+51yQuoshv4p0rFUv+n+
	m/EkjA2gGVmLmwNgdVKj3IRs6rKmvddeKiiC0bwaOfA/dCBF4qsiB7B5vUKd4t9y
	oZBJivcDxvgWetbUsGruiSRy1yeLwSgO4WQnDiT8WDKM4liRNrn1CO8MnVdcV+F+
	RK8Kr8bkgTmiIFzreF9gLtcQ6NM+VKKcxiIHVAkGBsE6KI0BigSEziSgKEDKOtRf
	EnY7Ub4wS317DkOjtimQw==
X-ME-Sender: <xms:OoGTYy_hxptjq1QDuPuywUVWNUw4pjTwZywCEt7QbA1Uibpiwcmfpw>
    <xme:OoGTYys3SKMzAVzxWHKqQsE65xkdvJywuFPOrEZs8OzTs-vKw_Kvyk4A2QX6xALV2
    g17exMHfEpNX4Y>
X-ME-Received: <xmr:OoGTY4B3VITrcToBhvlCQ4UzP8de1YbRcs-U9HnTXn1jek4aEiB8hGLlzkO6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepteekvefggeeivdffleehudejveevfeeg
    vdeghfeigfdvgffgudeuueefveeuveefnecuffhomhgrihhnpehgihhthhhusgdrtghomh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
    ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:OoGTY6dNN6pioKq4g7XFFyWmWCaJSPmkzQ5yYZmpthZWE2C3UBymsg>
    <xmx:OoGTY3Peh82N0hDPfEhFQoQ9VCts6f0Jn2V4LXoOQgTBM0Ry06e6Tg>
    <xmx:OoGTY0mln-HYUoT6m5zSnZjCyBFtJrdaBbKXyXB__DpepagAe_zDZA>
    <xmx:OoGTY5UE6XIUBMCHllvY-d8tXDTEFDS3hdJq0VD2IUwze03-nTKYTg>
Feedback-ID: iac594737:Fastmail
Date: Fri, 9 Dec 2022 13:40:53 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>
Subject: Linux 6.0.8 generates L1TF-vulnerable PTE if Xen's PAT is modified
Message-ID: <Y5OBOHd7hFGR+4GT@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="44JDz2Hr7AM/1Sxw"
Content-Disposition: inline


--44JDz2Hr7AM/1Sxw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 9 Dec 2022 13:40:53 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>
Subject: Linux 6.0.8 generates L1TF-vulnerable PTE if Xen's PAT is modified

If Xen is patched to use the same PAT Linux does, it appears to break
L1TF mitigations in PV Linux 6.0.8.  Linux 5.15.81 works fine.  The
symptom is that Linux fails to boot, with Xen complaining about an
L1TF-vulnerable PTE with shadow paging disabled.

Details are at https://github.com/QubesOS/qubes-issues/issues/7935.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--44JDz2Hr7AM/1Sxw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOTgTgACgkQsoi1X/+c
IsE2Jg/+MnAELMCoUrq2p17zJEWpreI2CJLz3FwxaSQDcgXAiyDS0/WdmpJgx3z1
s0kutgA1VTGKnYyXNhpm1aJwC1fMLf+f0reJdZpWSd1Qav8l160LCKFakutrzh48
tKcYIzryqoQ31BrG1HAmdZonkg1Lr/JYY6PwV3pRx4H40vSdy5JX25zdGTe0p1cN
qfmCVQi39EP21T+o9tSTFiqNru4CJsL90rf3vKFfENl6B/d3LW7rqTONow8qRwm3
VJNwXM7EvmBtLtiwzd+ydoWCvlgGkpo5BfaDHpDOc2VI7BRNFH76b7/m1TQnKSNn
wybXpuE7amIyZTtkNvwBOrG+IBgM91OjKqWS2Gi5PrUNNzCj0YocYsUQrvi/O9tN
2gfdokAmjyWDzS4wlC/Tux5wav3lwMomVEKbkWMke/Wj4wTB1E54ipxZeijoRA4G
sJB2MS/dLWQ03SHMDhUzCiloDYvmQdN+hjWX0gcHvOJChgz8t74xxCapS8FQttJn
NBQ3qy6suIRxX5YsfyzwpryjTDL/TAzqYx0umq5Gp7wNu9CElF6gP0Lp/L4Uxc1H
YUxnKHOgyzTimYd1P7AvFVz+UKkGkfkg66/KrIYcItAOUJ4ecpB3Co5bfATEJwHY
dBqUNSs7TFXnEHHOSkLK7WZ40cXHbmDYb3cTaG9dn4Fe1b20vQo=
=N6+4
-----END PGP SIGNATURE-----

--44JDz2Hr7AM/1Sxw--

