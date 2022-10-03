Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AC15F3781
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 23:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415036.659514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofSk9-00071Y-UG; Mon, 03 Oct 2022 21:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415036.659514; Mon, 03 Oct 2022 21:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofSk9-0006yW-Qg; Mon, 03 Oct 2022 21:12:53 +0000
Received: by outflank-mailman (input) for mailman id 415036;
 Mon, 03 Oct 2022 21:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7JV9=2E=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ofSk8-0006yQ-KM
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 21:12:52 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2293ea2f-4360-11ed-9377-c1cf23e5d27e;
 Mon, 03 Oct 2022 23:12:50 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1CFC85C00D4;
 Mon,  3 Oct 2022 17:12:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 03 Oct 2022 17:12:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Oct 2022 17:12:47 -0400 (EDT)
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
X-Inumbo-ID: 2293ea2f-4360-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664831569; x=
	1664917969; bh=QO7yJWuFeZolTAR5MHq79CYUXiEgOR1Wdx6u+iK1f8Y=; b=M
	MMHCgrUAF7GrdNZvrCX2HUm/GrZC1wKMWedUrH0ztn06idvDpqKye8oSANx42BCe
	riHcq1gTmKSAtJY8xiepPvceqb0HQvClEd0T6UJOaCuYrADq/PEytD9C4vnUFeQx
	zVFTZT2qndJUNHg/aj4+NwKOvSf7hX+BHyQu3D5nOmnv1BVlp4vSjbcmzepWRpO5
	DyVuU3xWT9UtjLOfOTpTUz5x1JV+hRzZOiiJOaGUP7pXESZ7orywmorORMYJ6IB9
	slM3TGzlqywdwV8+1G8dfNPk3EYDSn0w0DAsd+n4/N4X6nlvt9Uu/8cK76gyFa2r
	pm94mMOtFnCUBZaJN7WNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664831569; x=1664917969; bh=QO7yJWuFeZolTAR5MHq79CYUXiEg
	OR1Wdx6u+iK1f8Y=; b=LG7PIkMobnl3I+165aQUjUX4KyUtZanRMHElfaDD5iLH
	9p1rYe+6N6Xs12IZCO/rzFcloJFacWkGpNM5dzjP13C0vrRdEkGXU/YHigzZQKZi
	x3mro2VOC0zm6ZS7GHIC8EcvS34mLA+RC3xpLrnFBWRNS/pqXPrvg1ywpBWPhuca
	hQ7uMWoKUpSDLajyIGG7PMW8MthAfwDGT0mJJ5LeUfEieuuBJEMo0bps8fWYqh3v
	rPijVgoDvTTu4vQVzhFcsJ1uECoLuoSrQFkQ+s1ryBBTSdhAreRRi48LqA03vuPO
	gJ7h6tlX2rREFMYWonOT+oMPFSXV7mVuyauNRuqeDw==
X-ME-Sender: <xms:UFA7Y7LWzmU1RhqwrVLey0EeSnBJgBq2GqMud8zvZHx-1n4qmsny_w>
    <xme:UFA7Y_JxA75tRPNH33EzEj4Wh9JfxwndQgYfTyvnQRl2bFVMlZQu0-G3RRke56TVd
    E8Q3On266MqUQ>
X-ME-Received: <xmr:UFA7YztIT976G5orv7LtN3qAysAlvbcK_2JbK8ZA9cbHBG92R6xwhEv6c9Ufwd392S6irTN4tx8PWo6hgcWSrSs2ZbQOHkAh6UAe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehledgudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedt
    tedvhfekudetvdelffeguedtkeethfethfffhfefteeghfeigeelvddttdektdenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:UFA7Y0Yv7ud4RNUvgtfPPpuwxIqfnuGzkPMVXH6gOU9G4GOqVhb6-A>
    <xmx:UFA7YybJrkNyZJLELSFMPKnxJ3OatpgS3D0qsbHg29N-heJl1GlWuQ>
    <xmx:UFA7Y4BlEr72vMt0fnJhRWeJqjn_IZ-mpOX4dSKMD6BuPzMonHzYSg>
    <xmx:UVA7Y65c1ZnfQZgXj1qj3Wv82UXjIjmTqTWDarsixm8ysRFI8HqBcg>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 3 Oct 2022 23:12:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17?] x86: support data operand independent timing
 mode
Message-ID: <YztQTaXUHKTlskrV@mail-itl>
References: <f793ef22-54d4-a74e-b01b-4ebca58b2abd@suse.com>
 <8f07c532-e742-fa02-27ee-b08c56299d09@citrix.com>
 <YzcOOlv1zqzWlH9e@mail-itl>
 <04f7de01-4e8e-b964-d676-d756265c2776@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BsZF/oQAoJ1MBBda"
Content-Disposition: inline
In-Reply-To: <04f7de01-4e8e-b964-d676-d756265c2776@citrix.com>


--BsZF/oQAoJ1MBBda
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 3 Oct 2022 23:12:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17?] x86: support data operand independent timing
 mode

On Fri, Sep 30, 2022 at 05:24:21PM +0000, Andrew Cooper wrote:
> Hmm.  So yes, lets approach the problem from the other side, as "this bit=
 needs setting to unbreak crypto code".
>=20
> On hardware supporting DOITM, where we do not advertise the feature to gu=
ests (all guests right now), the guest kernel would conclude that it is saf=
e, when in fact it is not.
>=20
> So Xen should set the bit behind the back of a guest which doesn't have t=
he DOITM enumeration presented (which is all guests right now).

Yes, makes sense.

> But I don't think we want any Kconfig about this, or a dedicated cmdline =
option.  So how about this for a plan which avoids painting ourselves into =
a corner.
>=20
> 1) Extend cpuid=3D with a no-doitm option.  I know it's not actually a CP=
UID enumeration, but MSR_ARCH_CAPS should have been CPUID data, and this is=
 the mechanism we have meaning "pretend this feature isn't enumerated".

Sounds fine. But I wonder if there is any plan for [virtualizing] other
MSR_ARCH_CAPS - will they be treated as cpuid too?

> 2) On boot, and S3 resume, if DOITM and availble, set invariant mode.

+1

> That should do as a stopgap for now that keeps software safe.
>=20
>=20
> Then, when we've got MSR_ARCH_CAPS working for guests, the internals of M=
SR_UARCH_MISC_CTL change to being a context switched thing which, like MSR_=
SPEC_CTRL, we have options for bits set behind the guest's back.  Then we s=
et DOITM behind the guests back if levelling causes the feature to be hidde=
n.  We do this for some bits already, and need to do so for more controls t=
oo.
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BsZF/oQAoJ1MBBda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmM7UEwACgkQ24/THMrX
1yzJ0gf/ZbBGBatB8/MiwA2YrJikFyLisDIt4ZNsiXow5Fljjzoj6T1qBCSx+TBx
8GnFWHorumNd9wySgH/XqrEn+k8CT7rTpBRJq/lEDTosIjcDEPy2WjYT9M37n7bS
phB2O7/+O6+UETIBS1OwXIgEBRnTrqu0X2I4y0Nd2H9gPROGSoS/WcJj+hy2ssxt
OsOqu2md/TK2nzZOLvuRrvLJ8COPwoFWbn0V+ShVTQTymoHtY6AVM2hBus5ONz/Z
c0fpXyonZQSLyCQuw79zCshFSh//bk+aWRYWt8icuZfam3GRIILeJf8wqD4VXel0
OKbDMpc9grQbuvksOQYGVBaP6ubQPw==
=dvlG
-----END PGP SIGNATURE-----

--BsZF/oQAoJ1MBBda--

