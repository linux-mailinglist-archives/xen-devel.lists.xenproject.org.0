Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141E878D0A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 03:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691624.1077818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjs4n-0000YQ-8J; Tue, 12 Mar 2024 02:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691624.1077818; Tue, 12 Mar 2024 02:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjs4n-0000WK-5A; Tue, 12 Mar 2024 02:41:13 +0000
Received: by outflank-mailman (input) for mailman id 691624;
 Tue, 12 Mar 2024 02:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jUN=KS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rjs4l-0000WE-VT
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 02:41:11 +0000
Received: from wfhigh3-smtp.messagingengine.com
 (wfhigh3-smtp.messagingengine.com [64.147.123.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa785b49-e019-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 03:41:09 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.west.internal (Postfix) with ESMTP id 7BC3018000A0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 22:41:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 11 Mar 2024 22:41:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 22:41:05 -0400 (EDT)
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
X-Inumbo-ID: fa785b49-e019-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1710211266; x=1710297666; bh=m1Gc4Is1ww
	9bODWNix52pJ/u1W+EkQ51yPoBPS1BQDk=; b=at1QJNfj2o5JJrPqokedvyQiDV
	vdHBra9RZ6YI11oTczNm6lR4BZe8n2croZFEknjfE2S2V8PpOsMIaZAjpDEKrm+G
	AoL+Lj0Jh+27rQ0u9h6ZESpYaKUW0arYO8QFXk1TJCSToiP+CC3VhWxi+egTf24j
	EvNnAA/t/HYdHR/c4HjN6cOHqj3+fhIoynvB7E4TSD2MQHtG6X3y1Gr1/dfNITOx
	h1raWXFy5qwceRkUsvs89+4WbMADY/w3kZ9DiNRcpAmL0KS7Uf/+r9+0K19gzn2L
	y7IF9dVvju626278QWO/q/2ivYj/g99CKrgiq4vsqEGgUPPHK38H648rHiQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1710211266; x=1710297666; bh=m1Gc4Is1ww9bODWNix52pJ/u1W+EkQ51yPo
	BPS1BQDk=; b=FejIWH+ju0oflkkgdHgd/Htz7CxFP/G/lql28YsCCNAelycDXfg
	DIx8sz/2Pokrcq5LHvE1c03afragRTrvhB1uNidS0XFmMD7WfuaUVl/dAHxifcYZ
	R+/FOMluGki/Mcximoz7+lRmmGlgWNgHm3jR3xxD8vC4e98lJBKzwuKpg5ZBSwJv
	FNEINLQkdt0Y6q5OWyfxK8siYtPYB88Z1AdLiJLBsch3XQNfNxcunltpvPmVTzEu
	+TFvcGuGhxpwB+xssUGHsnpkUxXMkAUhkZ+lrQU1KdZWg1+uO0azxy1RAIDAJTWT
	gRkTVqHXoZmI9lknIJk/QcjAP8St1RN2CYw==
X-ME-Sender: <xms:wcDvZapTKLV7zMDIQs9jaIfW0K82GGJOWP6B8uvSsTzxuR5FlR-iew>
    <xme:wcDvZYp3BDLfmN1QlmeBSQ2euNcpXRNJnEbseViBJrZn_3dGyDapv14wUJwoq76vI
    fEqFWzbT1NWjw>
X-ME-Received: <xmr:wcDvZfM55SWwKsWg2vK00LYY-pc6N76U8bu2q4BTPROyLBh8_LaKQA3xE-flGsaHu0zVN8JYHG3QpkYU_ZlEFbMTdLovYW5meg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjedvgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderredttd
    ejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcu
    oehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeggfelheekuddugeeugeeitdduieelieehudehffffgfefvdek
    udfhkeejudeggfenucffohhmrghinhepgigvnhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhi
    sghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:wcDvZZ5qkX8I6CWLA_sCKxaH2PM8GvohiHg_SLjOfO7ZOj_cAfnMmw>
    <xmx:wcDvZZ4doIBu_jDC4tQ8vjptTFhjKPKiWouhm7UBUJYKfpv4oNK6hQ>
    <xmx:wcDvZZgsV3HiZzwei37OiFDgTklo9QjnFKCn8bz-fwKbWKOI-ERnhQ>
    <xmx:wcDvZT4e7PJEkkDSHB2nio1sPYaG3cR31DgqN05igPXravBcTYXV9Q>
    <xmx:wsDvZbTrI2ktiIzAfvRZ3Ni4koU61SYuyjvIBF6HeJTh2eKnMDRv2j1Slnw>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 12 Mar 2024 03:41:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Release signing key still uses SHA1
Message-ID: <Ze_Av0JOtEhbjGgd@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jb8WvudImkhuf+O4"
Content-Disposition: inline


--Jb8WvudImkhuf+O4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Mar 2024 03:41:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Release signing key still uses SHA1

Hi,

The key used to sign release tarballs and git tags still uses SHA1 for
its self-signature. Is updated key somewhere already?

SHA1 is starting to be rejected by some tools already, for example
sequoia-sq:

    $ sq inspect xen.pub
    xen.pub: OpenPGP Certificate.
   =20
        Fingerprint: 23E3222C145F4475FA8060A783FE14C957E82BD9
                     Invalid: No binding signature at time 2024-03-12T02:37=
:29Z
    Public-key algo: RSA
    Public-key size: 2048 bits
      Creation time: 2010-04-06 13:55:33 UTC
   =20
             UserID: Xen.org Xen tree code signing (signatures on the xen h=
ypervisor and tools) <pgp@xen.org>
                     Invalid: Policy rejected non-revocation signature (Pos=
itiveCertification) requiring second pre-image resistance
                     because: SHA1 is not considered secure
     Certifications: 7, use --certifications to list


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Jb8WvudImkhuf+O4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXvwL8ACgkQ24/THMrX
1yzQvQf/cF5iFyMpUFoyBd8QutNo1AlCl9qxlZj+Sq+XU7iuH/r3DAs/g1YYxS8M
rb9NDTgIqMkfH/du/R3LN2JjtkpRo3QgorY8q48sH7E01cGxGR/rBwuPCiGP3Oum
JH8SEV4uXYVCDPvy4mekhNJ8HX7JBqa7o3RVsSbj1sO01BtTEf4Nr9DOsYhrODd5
UGvCh+sfwdjaf795+3Fviz8EfeaC+83aYyJtSs16XnRDJfaG/JOrtfIQAQkJxRds
QJamZstXrAgBIpM9T1fa6dqe/tJMCU1M9CpnEy17phx7xTZ7D+ozgNHdPQxF1qrR
+LgOuomrOZk8bwvVXBlX/iFcmbwmwA==
=nDmJ
-----END PGP SIGNATURE-----

--Jb8WvudImkhuf+O4--

