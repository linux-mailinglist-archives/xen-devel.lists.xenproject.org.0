Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3415BFF7F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 16:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409808.652777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob0KS-0000Vw-Nm; Wed, 21 Sep 2022 14:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409808.652777; Wed, 21 Sep 2022 14:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob0KS-0000TI-Kl; Wed, 21 Sep 2022 14:03:56 +0000
Received: by outflank-mailman (input) for mailman id 409808;
 Wed, 21 Sep 2022 14:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cOY=ZY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ob0KQ-0000TA-Fi
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 14:03:54 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 384afc61-39b6-11ed-9647-05401a9f4f97;
 Wed, 21 Sep 2022 16:03:52 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DC5793200925
 for <xen-devel@lists.xenproject.org>; Wed, 21 Sep 2022 10:03:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 21 Sep 2022 10:03:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Wed, 21 Sep 2022 10:03:41 -0400 (EDT)
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
X-Inumbo-ID: 384afc61-39b6-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663769028; x=1663855428; bh=l3SK+JMa8Y
	qvrFWfls03AIC1l4XiU9REjGuvo6PkMvw=; b=wzdL2tDZ1fNTqqw7CVtF3X8lBz
	y4mIc3fY5rxhQREDO0PPNXj8UegpnMvUPAzZTOe2ffoFVUA6/kKRGwYuzN9sFo9h
	GEZleRHDYM0pX5vGqGR9r0jnzAMUkgJZMJESY1T3ozL/pTKXQlqXkrxfUojb4PSi
	ENr0PH+VdARYNKA3xbohQU6apduv8k5ICTv96lDfK9Hhs9RBI8IJE0F/3iPEQIPK
	o70qtXr1tZ0L09uD1uK+EsFrdakalCZLOY8cj1X5d/EA/hKVFp0UmDjEvqcVQGKS
	MptRwrguSFlH+UbqNWrT5eYFskw/L+uQ4hQ/oRYiJxpQ8caSEKOnKcWKIgXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663769028; x=
	1663855428; bh=l3SK+JMa8YqvrFWfls03AIC1l4XiU9REjGuvo6PkMvw=; b=t
	BsqiJ5LMq9NXbJlkZwimuL16Pp8NxMxx+frOEi6tO2mwv26IaFOg+f/GnwoLuKRW
	DWcJrzYpw47wtgeveDn9DsXzjAOzXkquUt46C89VOM5ciyybvEiN9PYpxeIGotX4
	/9iue14/0ikJK0v8jjtrMqL+xCfvAeLuA+4NTQcjdkpfgytdvxZkdLn/LQsUbyEz
	Cw6x6nGXun8QJqY06colcHPdMjKC/EtnGY33JGslyhIShqnbx37h8+Gvt6x5FX97
	JVqcysx8/Q72QswjKAAHcF3LgQVlfgozDGot3NcInX3NtM82Rew16EYfNLx5pJ+G
	ju+tBHZyFsBPxKlxiJPFQ==
X-ME-Sender: <xms:vhkrY2tMT3MxExAo4UUypKRFalg4ryg7YnAgNhcpVcqUsYvaoRRUMA>
    <xme:vhkrY7fHBdz6mnj6aSVUliMGauBGcM2Ga0EkbkJ2Djx3F6vNJpYDd0Fe2WpSDcEi_
    qlB_plidu1DkQ>
X-ME-Received: <xmr:vhkrYxzL-KUsEqbxKWZVILrxCB9cTGjEbby_gyLpad3PwPikj23JugL2OjZX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefuddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnheptddugfetudevudeiveevgfetueejlefggffghffhhfehtdff
    feefgfduueegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:vhkrYxMPHfx3ou31vvJB52nw5Ie5e9X_hMg3woouHFDI7RgKKHnNuA>
    <xmx:vhkrY29Bsg-urjlFdr3Jq1deI-5YF90F__RRHKC4IHVnm9dLHTOv4g>
    <xmx:vhkrY5Uy6uoLK4sbTKcJyThLSAXVSoH9p2WRppS0qcg_rquz9V04yA>
    <xmx:xBkrY5K5diofXqjMSrUFrL4qFny33Mx3LSQgc1IKNQcUb0vYrBVftw>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 21 Sep 2022 16:03:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session "virtio"
Message-ID: <YysZui79+X9myhFJ@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eysTC+rnx5O4Qpid"
Content-Disposition: inline


--eysTC+rnx5O4Qpid
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Sep 2022 16:03:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session "virtio"

Some sparse notes from the design session:

Passing backend domid ideas:
 - via xenstore: good - can be done now; bad - requires xenstore even if
   only virtio devices are used
 - extend generic part of virtio spec: takes time, but otherwise
   preferred

New "config" virtio device - for configuring backends

Hotplug:
 - ACPI (for HVM at least)
 - xenstore


ACTION: Start the virtio spec change.

In the meantime, use xenstore(?)

qemu parameters are device-specific - adding backend id needs to be done fo=
r every device type - both at qemu side, and libxl side

Device endpoint ID are currently allocated by qemu - for driver domains tha=
t needs to be moved to the toolstack, to reserve space for devices running =
in other backends.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--eysTC+rnx5O4Qpid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMrGboACgkQ24/THMrX
1yxkSggAg98OlEhExodHHgkclwW3JsmStjnHwHTandD8X7dz5A1GxfRPvcE+J6jh
fSixQp8yDFedXAUn3y4zhPCeysQolMaHmR7M3XCFIC4Lv1oyPnYjuL1Jw0VrXk8d
FSW/m1b51BOqcjFZ6hQkvbLPo8nvdGMa8m+JqlKvyphY1p1z1QJn+vAJby+E0VdG
h6KiPc99DcSMP0Ma7lc4nr9vffqrDmkI+ZZ0jU1TEl2EXXYO2nlUVQGMdr8Ki8Sj
5GzBGOC6Bwhjg0JHEZFy7vp6N8yl9Yld9Eh2DG0ifX3ihH6BDf2763yotXxV0UTZ
vrfVl6z3xHmUSfnI+Poha7abzdEwrQ==
=+PQS
-----END PGP SIGNATURE-----

--eysTC+rnx5O4Qpid--

