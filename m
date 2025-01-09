Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4746CA07663
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 14:00:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868340.1279860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVs9C-0008Qr-Dy; Thu, 09 Jan 2025 13:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868340.1279860; Thu, 09 Jan 2025 13:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVs9C-0008Oe-AH; Thu, 09 Jan 2025 13:00:26 +0000
Received: by outflank-mailman (input) for mailman id 868340;
 Thu, 09 Jan 2025 13:00:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYg4=UB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tVs9B-0008OX-7U
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 13:00:25 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afb222d7-ce89-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 14:00:23 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 5C8A21380A24;
 Thu,  9 Jan 2025 08:00:22 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 09 Jan 2025 08:00:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jan 2025 08:00:19 -0500 (EST)
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
X-Inumbo-ID: afb222d7-ce89-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736427622;
	 x=1736514022; bh=INKq8DmcEiQG980xnfWao5JacgDPsknfBeqB3VReIhU=; b=
	eC4dvdFhcNh2RZHotdrSfxhx/HJw23LJNU4mxp+AyuIuP4o7gqjm50rp4ufIKYu8
	CANpa/ZotUsCDQkR4Otj5jDPTTJewf2hsHWCgv7TqOPZbcdbS1RuQHq38kInkK3p
	T07RJOvo4Fa2Vfq8+/Z5k3ykDgyk5q7cYXQcpr4B92q6+yqaXoL9v9abWEhXsfp3
	EQGG71R2QvxwQ+iXBIt3qBKWfWzzQJd8djyQEnTtIb6ZYfo04Z0UJbtyVkBqai6u
	R4CdNsEBLgek9EdvLqMrw+A2gOqAjEIBcDQEqw7m9HuKhAhTufn6/LrOPA50pYWA
	EjeSKG3UzyfGvoFmEL6KJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736427622; x=1736514022; bh=INKq8DmcEiQG980xnfWao5JacgDPsknfBeq
	B3VReIhU=; b=AEyxmd9LqrdLwUozRkl4Eqw26oz5QHTeJpwhCY5sI43XDse+jai
	7d9sYLXuS6Gu7xuZYleRzFEnpPMZb8aVv57hZzgO+jE8tlFabAvUmtCGjBl/K8Qr
	0k4EA/7lKQWfofQ9Vz1kd68+LAK1YiauwZjf1oMTwx5wQxjNXKOkhoCboNCkuil8
	uA20tGof5fFug1tLRNPJNZXtEZVnculcNfDV7aWxNC62JU6k4UKY1OkD9ZHnyvHH
	vpLXGE7B+8Y02BLk92EGAmDYI+xnXOUGPSgo6aALUZucLFKxDJz0eV4ehJIqHZGX
	B72bc7Ew5eev2xL7bjpafrI30v8fRjeQQkg==
X-ME-Sender: <xms:Zch_Z0q6rKIGKNCpIupiAM-mPtM3BHRsqpHH0loVqUM63ZjPM6vr6w>
    <xme:Zch_Z6rpF6OvUI31V9Ocz0i9ShR0Fhh_P0dMoAhSFnmZufK6EiRv_F4FdOSGSBeEJ
    xzrs2ZMjzabfg>
X-ME-Received: <xmr:Zch_Z5ORNbn2EDHjWb1VizBiR1VpRyn6ftvlDnbAoCF3SKlvFWioYTLvIUlogHnij0wpN4xTZCGvRrIYtTo9ahl3-uxb1MfLtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtvggu
    ugihrdgrshhtihgvsehvrghtvghsrdhtvggthhdprhgtphhtthhopeigvghnqdguvghvvg
    hlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgv
    fidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepjhgsvghulhhitg
    hhsehsuhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgt
    phhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehluhhkrghsiies
    hhgrfihrhihlkhhordhplhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhssh
    holhhuthhiohhnshdrtghomh
X-ME-Proxy: <xmx:Zch_Z755AO-PrQGC-a1xEYiJQuAoJk7e8nmdPj3hgIJ10EtgleE1DA>
    <xmx:Zch_Zz5OAGwZIl3GyuNOQBsmBP2siJ4K0hbbBqw7eVMMS8mji8uzng>
    <xmx:Zch_Z7ige6hJ0M-me-0uHUOap0tmQyYbijhVII5L8-ueRRkdDnmChg>
    <xmx:Zch_Z95PRvuvtyQXDYY9-i627oKPX_fTCs-dQY_O15ep2XNGHc_uFA>
    <xmx:Zsh_ZwzsLrEqlA4ISRhHzbdwStjeYQreQQz22YEZheSzxtbmLhAAJE9g>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 9 Jan 2025 14:00:16 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [XEN RFC PATCH v4 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface
Message-ID: <Z3_IYPG62-C2TD7N@mail-itl>
References: <cover.1730718102.git.teddy.astie@vates.tech>
 <Z38-y9xR-6C_sARJ@mail-itl>
 <c0b9fbdb-87db-4f31-8069-0c2d1c4ad4cd@vates.tech>
 <Z3-8O9opmLfgO5t0@mail-itl>
 <0897deb0-3d57-48a3-8f92-4714ba6d1217@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v7lfulLpzS4d2Efo"
Content-Disposition: inline
In-Reply-To: <0897deb0-3d57-48a3-8f92-4714ba6d1217@vates.tech>


--v7lfulLpzS4d2Efo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Jan 2025 14:00:16 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [XEN RFC PATCH v4 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface

On Thu, Jan 09, 2025 at 12:41:35PM +0000, Teddy Astie wrote:
> Will do some additional testing with PCI passthrough and plan to fix it=
=20
> for v5.

There are PCI passthrough tests on gitlab that should cover the cases I
hit. You may want to let the machine do the work for you ;)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--v7lfulLpzS4d2Efo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd/yGAACgkQ24/THMrX
1yyBoQf+JeQ2ImtloDqbbEbAedjTMsFvvr64ZLcSwBXmHPE8Y/gIKLb6LvewwyxM
l5l6gmIRtN9dWLqqZNIQIpm+3J0wXQ4HGvTs86W3WhYDgK5cGXzgRh21dsGTf5Oq
H8r6ZkYyUZUpmecL21EdoFtfaquJYdw+BZ8a/fMLAPKzBkaGA22yrQQUty9ns3MK
qJoKg+bWbNyRAf+354l7QKuiSR52pa/DlDL82WGv6oejfKy+86jcLXtc9BmRMHfb
o9UkBQRP0+Ds+4sMvQFroEDDNwmf2N48c0hIwTA1hFOquVgPVUD5KWNsws49iFiK
7Hhyvr1LgE7puhz05lKTp55SXgNzOw==
=VLij
-----END PGP SIGNATURE-----

--v7lfulLpzS4d2Efo--

