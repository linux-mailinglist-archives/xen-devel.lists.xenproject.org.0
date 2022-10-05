Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCA25F54B4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 14:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416146.660787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og3iP-0004eQ-9Y; Wed, 05 Oct 2022 12:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416146.660787; Wed, 05 Oct 2022 12:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og3iP-0004cA-6B; Wed, 05 Oct 2022 12:41:33 +0000
Received: by outflank-mailman (input) for mailman id 416146;
 Wed, 05 Oct 2022 12:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xhym=2G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1og3iN-0004c3-U9
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 12:41:32 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 075d95db-44ab-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 14:41:30 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id CA44B32002D8;
 Wed,  5 Oct 2022 08:41:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 05 Oct 2022 08:41:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Oct 2022 08:41:24 -0400 (EDT)
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
X-Inumbo-ID: 075d95db-44ab-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1664973685; x=1665060085; bh=55yh53ucbT
	+2cHtxUmKPDXZeiinNra+b83TyTfWjhBc=; b=Ux4knCyCLCvWoGy7EMfNB67WYd
	+n5bI7l96FOOhfywN0zkyo/dYHQfqK1t96HnD1ZVNjaT3lKVyMeSw0l42sMdCTum
	wfZ11pi2LkokzaGO6oFK0eW+n7XJjbaSHh7BSWSN46/qaJb+cLY7sMWao4bDd+pX
	cuAc4+IdjdzTb3+enOrLYuvLsu1DeBv5XEkXpRQQUn7dxKG1TtX0U+zirXiIWTAH
	pYuH915t+X7rzPK0PeBvkzwRxq91ZvfKneN0oUAXm11ly/bhkSAg4YAN+OpD2g0R
	zazj5XY5s4nnofm1lKJlpnro8wdN7grASFVpTlBVvgF3wNNAyRPtU0j2pRqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664973685; x=
	1665060085; bh=55yh53ucbT+2cHtxUmKPDXZeiinNra+b83TyTfWjhBc=; b=C
	1OeZzNqBZF/kjUZznFQy91afvq1dc0VuvXVqO56l2/UgtGIsxaXw1EBN1hyTgt5O
	7e43ccH6izzKT3Lf/EJepwgsWGO0WeYmWlc9QNpJt6zzCHKPkZAtod5SnzVpGwys
	iuBA65BW8mZ6JPXOHmk2jmncapxkAkfIvvNMeamfzl+e+v/fYXbtU8R2uarKzIaL
	PaSPBroj9i1jpDfqxsmXWFXFTSI66k0o7A2vK4PWXnt1nezXNxpAWsOw4kk6EPTM
	areYq2+I3fGPCeaUSgBmkPcwL61b65jj4AkLrmpqHOJLm3AfNcTKLcsMhH62base
	y2DZcxNMAzB43836+9yWQ==
X-ME-Sender: <xms:dXs9Y5QPaXcPrxKeS---p3C5sdBEmPu4sJeK27CMpvyTKkMjxB6tUw>
    <xme:dXs9Yyy2IDibS6ikMFGlBCOEN3Y2Em2Q52DpUwIsj5fxpSBkoosZO8-x4EGeOQ_W8
    DOM2gNXfxJr7g>
X-ME-Received: <xmr:dXs9Y-1wiVmc06-FJmU8_FHPrQkQPXejDLeBMHoByviV9WD9_VYrKmsiiIC8-EhkAEhZqu2ZIxcnroqBKePgWvtAhzzd-ld21uKU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeifedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfggtggusehgtderre
    dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpedugffgieelueeukedthfffledvhfejfeefheeuieekhfel
    udeljeejleegjeduffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhm
X-ME-Proxy: <xmx:dXs9YxBvWYBIGonGdjUK83yjN8C7LdIhNGxaVuhJflJ_EdJVFrvglQ>
    <xmx:dXs9Yyhu4H4WQNM97qehbYwYRAYWc4yUiiD5WMQ67AUN3XrG_XQK6Q>
    <xmx:dXs9Y1pzTWacG8521T5CWcVyXwM1fskxpB_5Gh2zmoRElG_GQMAorQ>
    <xmx:dXs9Y4cCfaUbA1_u4ENyjqPH4otYnBgSQp6LJC9G2ioeI5gCaOgopg>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 5 Oct 2022 14:41:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
Message-ID: <Yz17cLIb1V0zjEjK@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0WYvwZgrg7kDSouA"
Content-Disposition: inline


--0WYvwZgrg7kDSouA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 5 Oct 2022 14:41:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt

Hi,

When booting Xen with Linux dom0 nested under KVM,
CONFIG_XEN_VIRTIO_FORCE_GRANT=3Dy makes it unable to use virtio devices
provided by L0 hypervisor (KVM with qemu). With PV dom0, grants are
required for virtio even if just CONFIG_XEN_VIRTIO is enabled.

This is probably uncommon corner case, but one that has bitten me in my
CI setup... I think Xen should set smarter
virtio_require_restricted_mem_acc(), that enforces it only for devices
really provided by another Xen VM (not by the "outer host"), but I'm not
sure how that could be done. Any ideas?=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0WYvwZgrg7kDSouA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmM9e3EACgkQ24/THMrX
1yw9mAf+OEUcSzTVovlh3xQmC+meU7OII7kNOA31xjKSV4RaNdNyryh85j1hDf1C
zAwmHUi9mikLUWXa9cWU3nYcN2pETmwKrua2lIsQa6O9vdhzdbj28sOyNONqu2sl
eSL83M1+NqBDQOtLXkuDcJr2FEbvEpq86wlHdvvmx+7PuiHwCBlcb2SvkhvzCrEe
pcn4bRxQ/bbqO+wOABVGgRi5ufUaCvTrJ9/eDxmqMYA2NPb16qrRMonJws1UG9c7
96tFKG/xjeoar9BS3UmMFMFwzxd55uI29giQZCejrAXQG5bgTO4bbGllideep2mM
wEtGfnVqfMQVn1V3rRMevLNTHPnU0Q==
=NNOP
-----END PGP SIGNATURE-----

--0WYvwZgrg7kDSouA--

