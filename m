Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144AA5AA570
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 04:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397160.637638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTw3f-0007wL-Lv; Fri, 02 Sep 2022 02:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397160.637638; Fri, 02 Sep 2022 02:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTw3f-0007tf-Iz; Fri, 02 Sep 2022 02:05:23 +0000
Received: by outflank-mailman (input) for mailman id 397160;
 Fri, 02 Sep 2022 02:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oAI5=ZF=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oTw3d-0007tZ-Ex
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 02:05:21 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afbcdebd-2a63-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 04:05:18 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id CFE4D3200AB8;
 Thu,  1 Sep 2022 22:05:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 01 Sep 2022 22:05:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Sep 2022 22:05:13 -0400 (EDT)
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
X-Inumbo-ID: afbcdebd-2a63-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662084314; x=1662170714; bh=ZzoR2jGGjy
	zO8FXeHrJVMpRQDnGO/0mF9EE1+PYHHYk=; b=e079IiuZSGmcy+hmyPMSObUjfh
	sflbIsjDLJgOcq2cCdu3lvJ0oYM7GgpyoaX/zZJGe6MXlxkPK8QDDvsupWIlaOjb
	PCKd9dPtpRt3lk7IYsYJU3iGHQpbzWytQZL7mNUXfcxFmSE7hNLfqxyjBQEsi1k4
	WOk8jhik9dPpELMe3e0oxy/dVFOTn13v+jx3jEBYIL7bC0/jBlCUtZJp+TckIrGd
	yRNovrhkZvtRwyLFYg7jYcsL1eFiOZbuzZUUQjfDzK+EJrYYPYbiRsh+oiHygl6z
	W8ZmX+dBkv3/nuL03ZG4CualVvY33YoJ5LYlkTdCPzs2u0EDy2tcWkHv7R2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662084314; x=
	1662170714; bh=ZzoR2jGGjyzO8FXeHrJVMpRQDnGO/0mF9EE1+PYHHYk=; b=s
	KrYKHxTiQk7xgCmMO1WxJUfzHSLvBaXhC1f+r1fLHNkeBgafwCDz+23Kl3zIUsev
	hvvp5JYf+j+lueig78SU8L70mjzffDz9kR6stmmQgL+N0s8PunEbnP0o7MnC4VqU
	8eZIebWZ5tOt3kEkbqhEvNihwbLvn5R/ZsoA0JKcNDkAdguy7DeA9A8RDvv0FaSg
	+mC+nSsunToebGeVqhF2O4HsLK3leaHF/kvVQlAaZVxY9m4oH6K492cUcfW4LvBS
	4pnCDZph5cKwi8eXPuEj0mVvK4GZ91QGo35o1SXs90txlS6OmIzv1cH5W14a/JMU
	A2385d5wgCcmAfj1dirIA==
X-ME-Sender: <xms:2mQRY527QgW1n9_OYlp7OaPV52kQkiB1bg9pTFVTMZWjaGh8ySH7yA>
    <xme:2mQRYwEMq5QnTf4kfSIa9777px6lCDLkfv7fUGB24K0Ilf9f5J98E4Evwof6USBTr
    7bCFz3FRSZZUk4>
X-ME-Received: <xmr:2mQRY55a6d_nUAiUPamzNJPvdQ1J-NO_G2t9PpyhrM434Ls9st_lFVbH6XV5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekledgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepkeetudefjeejffeigeefudfgheduvdeg
    ffduueeiheefleeufffffedtheelvdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
    ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:2mQRY231UNA3y4wmwnEdPtsw0TUVchdOPrW8JJ0I3pKMaacMs5aF9Q>
    <xmx:2mQRY8ExuHEJemAZbspwzTRSpcr2jF5etBbiLc3DMMeQWYeDpUJOwg>
    <xmx:2mQRY38x86Rw4_brrZRdxNOPHEezo4pVg_xrSqki25xaebySQncT9A>
    <xmx:2mQRY2Nh9mm3lujXW4d9q1tZ_qNYJjst8Hzt7XmUfH8_paC72ZoXyg>
Feedback-ID: iac594737:Fastmail
Date: Thu, 1 Sep 2022 22:05:09 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Setting constant-time mode CPU flag
Message-ID: <YxFk2GaIQVCAFsyi@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="60pSlVurV+P9wC0q"
Content-Disposition: inline


--60pSlVurV+P9wC0q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 1 Sep 2022 22:05:09 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simon Gaiser <simon@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Setting constant-time mode CPU flag

On Intel chips (Ice Lake and later) and ARM64, a bit needs to be set in
a CPU register to enforce constant-time execution.  Linux plans to set
this bit by default; Xen should do the same.  See
https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for details.
I recommend setting the bit unconditionally and ignoring guest attempts
to change it.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--60pSlVurV+P9wC0q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMRZNgACgkQsoi1X/+c
IsEaSA//ZiJ6lN02MUgB8ORxiPICdkFYDnPApv+uz6VQS5DIubKfcbyF9+dKmazV
BLe/ycEvBOApmtF8VsjSoaXr71bLoZyP3VXcVmq/zFvLwezbGgXa3zFeWfqVv8HA
cQDvnoh9Fymuq2fYxW4ZSRk27Ft0xwr0yuuV+rbQFdQZZEF4Qa7kMq+l6VlfMu7p
QvLTsOcUdtOOTSDsgQQwHcuboJd1au3yJUXjGFxxLirRGhEcN+Eh0t5zzG32B+d3
iL7vYg+0nLq6Pz8hr/88TT7O/A81w5Yflv2SZ0UdU0UD9//5V/8+HoOuIru5DsF2
vcuy5ncSIm+7JxqXRAJ5BYdjehPQ8fRjhCFYolkDrR5aW3z9ATVs0d2K8EGYrQF8
uRefL7rBausbnx+JTnD+eixXX3h+dQpL3ojuMzUP6lu2WH3vslpzoRFuzUOUFHhk
jhXiiG971liZy1R9GjTy4xnnx/vT1AN2EQdmgQkkRcIfzf++gdkNSl7Euew2TH86
3wRosYrwX7Qa1vXJIUVX7YjeEQpN5XaCUXfxik0bO+L3PRTj1wtKVzHOj7aFkaNG
hxRgJa7F7vRXrQB4V3xWG5iie+DAdeLxvbbepEgisJy5njIlEZvvxmWcbJqAkUj0
qCzReFVpeV4XGxcUTnMu1boKmwg/SOO/eS/OYeQ09xFrHqH/Ai8=
=5MAK
-----END PGP SIGNATURE-----

--60pSlVurV+P9wC0q--

