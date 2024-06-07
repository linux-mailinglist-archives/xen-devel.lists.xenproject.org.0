Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA5900C9C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 21:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736606.1142711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfY7-00053b-4T; Fri, 07 Jun 2024 19:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736606.1142711; Fri, 07 Jun 2024 19:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfY7-000515-1n; Fri, 07 Jun 2024 19:46:55 +0000
Received: by outflank-mailman (input) for mailman id 736606;
 Fri, 07 Jun 2024 19:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWQ4=NJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sFfY4-00050z-JA
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 19:46:52 +0000
Received: from wfhigh8-smtp.messagingengine.com
 (wfhigh8-smtp.messagingengine.com [64.147.123.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abfc6e96-2506-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 21:46:48 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.west.internal (Postfix) with ESMTP id 822EA18000C7
 for <xen-devel@lists.xenproject.org>; Fri,  7 Jun 2024 15:46:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 07 Jun 2024 15:46:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Fri, 7 Jun 2024 15:46:43 -0400 (EDT)
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
X-Inumbo-ID: abfc6e96-2506-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1717789604; x=1717876004; bh=C6Ug4wpkpt
	oHvvrhX7AzvF3Sta9Ie/JG6Ec+JUWIIaE=; b=QC92jqqclZnp+xa2/T7GwqJ+C6
	7tqsgU9/g50mIIc5vbvBji3riZXPtmCmIV/X0Qyy6Aa/j8U7DpESEn3puNsIUMFD
	HPjUx5TsK1V//aFhWf5WDVqrrfbFYTHBiey7v+gPbYIxZpSaufJBXWE6CPLMHSzX
	C612SvkD8Iv+UWh6JnCRjP5FpohujaX9nE3jshd9Xv1GcohfylDb/nMii5CJRpWw
	cnErtyBpS4+weUQQm9U7/WK5AR4ig+J6zDm1t3yDMo8WOFkS/5/yVIqfnGzi3RD5
	TssXdlySpzAZEjTWBV4+B4/I1WvNKzggNwzlk9At6Fgmuux7Cmzrq4Oh64lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1717789604; x=1717876004; bh=C6Ug4wpkptoHvvrhX7AzvF3Sta9Ie/JG6Ec
	+JUWIIaE=; b=CkNw8S64IOVIxv1vNW6BKL1vNuvK7Dp1NqjapDMbDAnHaN4tZCv
	x4UnTSEY1R7HMy02/M1JUaimAoEzHX+CySYTNUjUOkbSrNSxfpyeBp06lAYm/mHU
	QCIsGTrXaVpxYhccVtr8r1WsUdEDXqBw3M6RF5luRrthQoDbYZLGfDWHKKjIR76e
	ad8/m6MrGIyGY+2AvW1Rc79K5TVaz6334/XGpoMfAFl+H9klMOs7O4fklj7ZeTKW
	HR6VndvD9DmPJ/uOZSXaOkwDxYBokRufI9zIlGdh6JlCakbQ3vyaI6/qECPvMabM
	Pq2hrsL7ZMaF/EC+WU673VpamANTQh4kjtA==
X-ME-Sender: <xms:o2NjZpuiDoRNsrEMtxcxodbRES5xXySjwPXAwf-kiVa4At-oxxZ8Jw>
    <xme:o2NjZieaLPlWpSTUGSisD4bPHZrj6rUkhJUphH92RJr6PB0lIlO6YqDKYWTpvCRGE
    Pde5kPGoU67Vg>
X-ME-Received: <xmr:o2NjZswE0Q-QlQN077YvnsHu66eHQ6Chvz2S7RfAHwZX90eI5IzHYdI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderre
    dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpedtudfgteduveduieevvefgteeujeelgffggffhhffhhedt
    ffeffefgudeugeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhm
X-ME-Proxy: <xmx:o2NjZgO_QR8vFmEp5h5uilDS7rAp8SmDfwbzH5V7iJv8X_95LhFLRg>
    <xmx:o2NjZp_Kok0GkG4YTxqdw54oEMpmO758uUJv6E4emAy3REbiSgewHQ>
    <xmx:o2NjZgW81X16OjgZr3taHtbTAPbXDgTQBCNTF3J_LGWLNYxeMsOIxw>
    <xmx:o2NjZqcdJ7jv7X2UAMgO9oz60pE5SDX-Ad-7B2bQzZ8o93WHN3UWfg>
    <xmx:pGNjZmFvtWko5xD4ZAGprRjzMjIFyqnbG_47HSbTTe71MRHbsycsQuT->
Feedback-ID: i1568416f:Fastmail
Date: Fri, 7 Jun 2024 21:46:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Segment truncation in multi-segment PCI handling?
Message-ID: <ZmNjoeFAwWz8xhfM@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6/witsI/qtE4GSuI"
Content-Disposition: inline


--6/witsI/qtE4GSuI
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 7 Jun 2024 21:46:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Segment truncation in multi-segment PCI handling?

Hi,

I've got a new system, and it has two PCI segments:

    0000:00:00.0 Host bridge: Intel Corporation Device 7d14 (rev 04)
    0000:00:02.0 VGA compatible controller: Intel Corporation Meteor Lake-P=
 [Intel Graphics] (rev 08)
    ...
    10000:e0:06.0 System peripheral: Intel Corporation RST VMD Managed Cont=
roller
    10000:e0:06.2 PCI bridge: Intel Corporation Device 7ecb (rev 10)
    10000:e1:00.0 Non-Volatile memory controller: Phison Electronics Corpor=
ation PS5021-E21 PCIe4 NVMe Controller (DRAM-less) (rev 01)

But looks like Xen doesn't handle it correctly:

    (XEN) 0000:e0:06.0: unknown type 0
    (XEN) 0000:e0:06.2: unknown type 0
    (XEN) 0000:e1:00.0: unknown type 0
    ...
    (XEN) =3D=3D=3D=3D PCI devices =3D=3D=3D=3D
    (XEN) =3D=3D=3D=3D segment 0000 =3D=3D=3D=3D
    (XEN) 0000:e1:00.0 - NULL - node -1=20
    (XEN) 0000:e0:06.2 - NULL - node -1=20
    (XEN) 0000:e0:06.0 - NULL - node -1=20
    (XEN) 0000:2b:00.0 - d0 - node -1  - MSIs < 161 >
    (XEN) 0000:00:1f.6 - d0 - node -1  - MSIs < 148 >
    ...

This isn't exactly surprising, since pci_sbdf_t.seg is uint16_t, so
0x10000 doesn't fit. OSDev wiki says PCI Express can have 65536 PCI
Segment Groups, each with 256 bus segments.

Fortunately, I don't need this to work, if I disable VMD in the
firmware, I get a single segment and everything works fine.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--6/witsI/qtE4GSuI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZjY6EACgkQ24/THMrX
1yzd+gf/ciPyUvmC5sgFOS5N/9kfn0L70p49IdOSD0y2B/KkWHZPvl6xHU3UIojG
fiKpjskPxvAg30Fs7lmMwS7X6NaKBPcNw1TAWvZHUS77uZF305M+pSr0QramJeAs
YWjKFzPGczzw83EjDCg8bq9ZSV9xVMnrcuBg1HPEZASyVW/wQI7UMzPkQbS1MX0k
5dNE06006EOZjI5o7EgUpGL3kW1IBb8kOLiVTlOoiZtsLq1BwB/JxkerqKREgbTd
jmFzf2GN3OQyG6uwij94CXbnoOLTSB962trUsWML4san8WWgeBudQYT7Ab9xZsfM
VqduKRzkJu/ZQ1w907dcG8+j0nPLTw==
=9mrS
-----END PGP SIGNATURE-----

--6/witsI/qtE4GSuI--

