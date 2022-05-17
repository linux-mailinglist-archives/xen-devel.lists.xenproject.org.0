Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FB952A72B
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:42:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331170.554650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzLD-0003Hc-Of; Tue, 17 May 2022 15:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331170.554650; Tue, 17 May 2022 15:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzLD-0003FS-L2; Tue, 17 May 2022 15:42:31 +0000
Received: by outflank-mailman (input) for mailman id 331170;
 Tue, 17 May 2022 15:42:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TUNC=VZ=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nqzBI-0005PP-NT
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:32:17 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85dfc82a-d5f6-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 17:32:14 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 102CE5C02DC;
 Tue, 17 May 2022 11:32:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 17 May 2022 11:32:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 May 2022 11:32:12 -0400 (EDT)
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
X-Inumbo-ID: 85dfc82a-d5f6-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1652801533; x=
	1652887933; bh=qTn5m99hIK9GFmefzE3hWCqBEzDHwVdBYbuI3u0RnGo=; b=B
	2Qx5rwEYjMvVmryVph4J/HSBFzAiNcrU3A+uWYBKOTjAIqiScbFoPM4AF0QGciE0
	RNuI4D2vr6t+UKp3xmLOxn/3xzr0ftpBJ0+dNohxIBjuM+tplEqAcHP/CU4AiTpY
	vtz43NxBP8H+SyCfRX4qpUvXrnyLOhpPJRuMvPparyiD9zMY61sVjoI0gAZ50cfV
	0XFdGztRIBlfbAFCXkkc4rcBqPUuMtG/mdaGjIZWwEjAS+UL81SYKU2AnyVV5Brw
	BD6mJ+6IISIvAwo410u6bNRNkFtCpoHOJwYrO/kBM2++Upnjih2CzATiouPWxXQX
	poV2AId5vboTTe/+VMj+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1652801533; x=1652887933; bh=qTn5m99hIK9GFmefzE3hWCqBEzDH
	wVdBYbuI3u0RnGo=; b=myQf7/nrUPx6hwzai7TmJ7kSYBE3o3HK7MSEf/E3M+eU
	HA9lFSo+teY+tXB3DQrQ2gyzhiJKs3gil4SDeL/csgClAjyrbEe7OT5XDHuv18It
	sgTY2OZ2x4gJ01osfcXd/mwk2bN1jHioE9J4ynBsQOMhRH/VrGqp9u1YqSzZh1lP
	RZpV2Q8CTl0msQlBFl090IkMVSqELB98AZbdesKaONc5vcH6xESo5F330aiuImUX
	CN8AtItfn4bQO8ZoymPDk9Y0pF4QfSLg9+juLCaugPLZgXobKEtR9oi8juNfc+EF
	gMyDUXEM7MRIYHgTMAtzlTJTRNdEyMWtAit1vJwErw==
X-ME-Sender: <xms:_L-DYu-VYQzGbMDUSLRgvme4zseIZk-B1G0l5UsZEQzOaiYJQ-1Gaw>
    <xme:_L-DYuusi7TxOKX-lcj-Uy88SdGEmd9rWz5UBVFOr_M-GKM-UkC1CB2vgGPtJZkau
    jnj1jlBdGt9sDc>
X-ME-Received: <xmr:_L-DYkAa2IagT3yDbXJeDhI5AnNb0MN4sayVKKTiuoDVtF6bNMg5Xi9xewoE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheejgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffejgeej
    geffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:_L-DYmcZfIleLumg73-KgACHKkCUnWHxEl5fiGCZVfHiJVQ9g_zlBg>
    <xmx:_L-DYjMf4QFVb-ljj4_Qk30JT2q943t-kaCU47b8r0fn9KgA7Cm05Q>
    <xmx:_L-DYgm3zIyZx3Iy2Hy5Rv_Xp6qr1B7Q81ZAkqgu4BMS2SgwuoiN5g>
    <xmx:_b-DYiZyImnpnHNoluE_nznIYsDdVTJDx1EoiecTBNl8gHndDjCz_Q>
Feedback-ID: iac594737:Fastmail
Date: Tue, 17 May 2022 11:32:09 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] Preserve the EFI System Resource Table for dom0
Message-ID: <YoO/+tkhcxXKlJ3J@itl-email>
References: <YnNi7iW2s5jsJIiA@itl-email>
 <f06cbdd3-06d5-dd72-88d5-477cabf65b45@suse.com>
 <YnX1CxHVBT2jNE45@itl-email>
 <c9f5e61e-7d42-c488-eee1-d987fdee3ccc@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uYERJ34LyrAQINuu"
Content-Disposition: inline
In-Reply-To: <c9f5e61e-7d42-c488-eee1-d987fdee3ccc@suse.com>


--uYERJ34LyrAQINuu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 May 2022 11:32:09 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] Preserve the EFI System Resource Table for dom0

On Tue, May 17, 2022 at 03:16:55PM +0200, Jan Beulich wrote:
> On 07.05.2022 06:26, Demi Marie Obenour wrote:
> > This would mean the allocation would need to be unconditional.  Right
> > now, I avoid the allocation if it is not necessary.
>=20
> Hmm, I guess I don't see (taking into account also my own reply to that
> comment of mine) why it would need to become unconditional then.

It did not need to become unconditional.  See v5.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--uYERJ34LyrAQINuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKDv/oACgkQsoi1X/+c
IsEE4xAAku5xJJSX/pYFW2LphHDqtCSwp5S9k189Fb/wXEmLV1L8OAn5ZztnoK0T
JBx/JYr2ajtnpOTsM9/kEpJEjSHypMaFzUVC/wTFyhMyFufqUROVzyRPHUh2hxjo
szNwz6eKDFt/gYdvrXEY8emm6TZ4WQOoyTE50wi7EKGVmKYszdM8KTaukh4MWid/
97MGcyJN5+jLd7xXo8QnXFZGZWzy4+hQekH3Kl4JjJbKr+4XIpJ8K+c39GdwemiY
pJsRCDqTjYdBo63QVDV+wCIufjoh7sdn/ncgkbcmbuLjaHNjhgoKElLtamAGQ+qD
Z8/kaLIs3ykG0rJ2W6xfotrltF4DmEUDwwvMo0nX1wTIrpD3t7p/kB/atm08quzu
B1ml9NGnnWZN1ugCig+BeV97ZyCPiQNiN/dCmKN0rj+AcfPNZh4sE3KswLEkbSOZ
ZOqu+qenI/71zeK/WV9YydpNZmiEo4i/9Xn2EJQLUnTVKerdGIbUjvJ+QUhSnXXd
6MhfdnukA5ibVM5HXzo+zXpqeNVERsT6hpdSwOSMc9SEACfNMdNo5VsVRjOr7A6Y
t8dwYIM8sBPRYdQZLZwJmPmsIRAzcd1pPDoVJKiyj51b57bPAwdrsZ/bVfOwSTX5
V7jFD2wH5xkz6xUifUyln17ugCOLcZW0/ki5HY3+RsCJd9AR/Tk=
=Dji8
-----END PGP SIGNATURE-----

--uYERJ34LyrAQINuu--

