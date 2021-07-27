Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBCC3D74EB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 14:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161142.295878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8M3P-0005KO-JU; Tue, 27 Jul 2021 12:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161142.295878; Tue, 27 Jul 2021 12:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8M3P-0005IH-G7; Tue, 27 Jul 2021 12:19:23 +0000
Received: by outflank-mailman (input) for mailman id 161142;
 Tue, 27 Jul 2021 12:19:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1m8M3O-0005IB-LM
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 12:19:22 +0000
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 313ea7cb-7f44-489d-9105-92225c954cd9;
 Tue, 27 Jul 2021 12:19:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 831C95809B9;
 Tue, 27 Jul 2021 08:19:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 27 Jul 2021 08:19:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jul 2021 08:19:16 -0400 (EDT)
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
X-Inumbo-ID: 313ea7cb-7f44-489d-9105-92225c954cd9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HFQS1c
	g750Dc7AJsr+GwXrprkSp+hJpy1jfr8zXR32I=; b=qwAEjRSWURXEugHBg++/t8
	+ShsWu6P/hLgSMVIObKy1E31CDKwh7E+tAD2mmMsL3M6EAyJqS4Uzrc/mZpF8/x9
	bp0J6Nvca505UdEdsDh6SIjqq6ztECRMUmLs97YG85WXFdBy5TSXDOv2tpCdhKBk
	wtMEIPyinJdbOWHWo9gA/Xwhvk8Q54XJJrPt4vBZaK+E4ad8/xwQ/1NbxUKsusbp
	sdriAzq5eeR+ssztsQqzprRzg8YRX5/XXy2aXUdCiyHdP00crCWJFFHVNHSE7aDG
	gtK4JGmo239HYW0X+NLvgGdV9CBoB5GnHCapDmyh96uCVqwFi8lC4TvCvaN7XyKA
	==
X-ME-Sender: <xms:xvn_YLAqEwb6TsLlO2jeQn6FvsbkGqfRYFop9sxYiE1iN1vetrtIiw>
    <xme:xvn_YBhpuRCRnid3qLZJzdyQTyp85tpKxKHK7xIyMvqmMZxgNs8y-F0FxK8EHXq9k
    B-uvZZm7qLKFg>
X-ME-Received: <xmr:xvn_YGmn3Vz33PzCzUhdlZZZO5JYhAdDgoipJrOkT2fhCSz6RQokMZfMBGaNm8YQ4U0LzfWAl2gED8Lb_LKRpc6iy6-XyPCi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeejgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:xvn_YNwJeFaRyo_Vpnk2UYaw3rcneBpm2gJGYVzaujUMSYBMWwKYCQ>
    <xmx:xvn_YASfC8XhIiwWbnTyC9OywrCweNs54gZzIGML9mP6GpqVQ1ivjA>
    <xmx:xvn_YAbpZufKkT63Eddi5WYs2l-PMNczXO4uYTFNQ87YsaLBvrxNZA>
    <xmx:x_n_YJ9ZU_k92k5uXbr9sTY29oshvRfi1_hvNofhskICTDVg3J-vEg>
Date: Tue, 27 Jul 2021 14:19:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Scott Davis <scottwd@gmail.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Scott Davis <scott.davis@starlab.io>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel
 option to xl.cfg
Message-ID: <YP/5wL2p/CGR5g7D@mail-itl>
References: <8ee22fab0731347dd7f998c5f336eac804785c28.1627014699.git.scott.davis@starlab.io>
 <CAKf6xpvZZCdEbPoetXabX15yL_oMnya0813-nrm6+WagL3Wx3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6nTE+UInqay0ySTB"
Content-Disposition: inline
In-Reply-To: <CAKf6xpvZZCdEbPoetXabX15yL_oMnya0813-nrm6+WagL3Wx3w@mail.gmail.com>


--6nTE+UInqay0ySTB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Jul 2021 14:19:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Scott Davis <scottwd@gmail.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Scott Davis <scott.davis@starlab.io>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel
 option to xl.cfg

On Mon, Jul 26, 2021 at 09:07:03AM -0400, Jason Andryuk wrote:
> Sort of relatedly, is stubdom unpaused before the guest gets
> relabeled?  Quickly looking, I think stubdom is unpaused.  I would
> think you want them both relabeled before either is unpaused.  If the
> stubdom starts with the exec_label, but it sees the guest with the
> init_label, it may get an unexpected denial?  On the other hand,
> delayed unpausing of stubdom would slow down booting.

Some parts of the stubdomain setup are done after it's unpaused (but
before the guest is unpaused). Especially, PCI devices are hot-plugged
only when QEMU is already running (not sure why).

> With the stubdom getting unpaused before relabel, do you have to give
> the stubdom some extra flask policy permissions to handle that case?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--6nTE+UInqay0ySTB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmD/+cAACgkQ24/THMrX
1yz93gf7BFztLtdJnY9lVdHluWOjOq7Aa82KGdBoAy7+WpNGmlsdwxANpoyw5NEt
p5pFCXkio5RboFNxozlbqwnHpjlBc+t7VrO7P2eyFParhb3W16aKotbXusVRduct
461NFIYnBsnCdxn2ElAifda/Tgn4ty8b1WwLSftkAlUQrvwuf0qfKuaCEdbbr4q3
H1MAtXEqB1MZKNb2ft1QnQUH8hqZGvW6EbSC3F8ouh6wWxJe8Vm1UtDLepvbJenk
X9WGx/bz16p69zjKPRk6iLFAgjE2UDjFhnzYSuSgkxQkaSX7CoDuNiI8NHrC758b
2JARSqtYe7MBsqohDkjVnplydFTWcA==
=f6GZ
-----END PGP SIGNATURE-----

--6nTE+UInqay0ySTB--

