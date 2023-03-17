Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027486BE8C3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 13:04:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511036.789778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd8p9-0001Nx-5a; Fri, 17 Mar 2023 12:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511036.789778; Fri, 17 Mar 2023 12:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd8p9-0001KY-2K; Fri, 17 Mar 2023 12:04:43 +0000
Received: by outflank-mailman (input) for mailman id 511036;
 Fri, 17 Mar 2023 12:04:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ZYU=7J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pd8p8-0001KI-0i
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 12:04:42 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3ff9bbf-c4bb-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 13:04:39 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9906F320093A;
 Fri, 17 Mar 2023 08:04:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 17 Mar 2023 08:04:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Mar 2023 08:04:34 -0400 (EDT)
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
X-Inumbo-ID: e3ff9bbf-c4bb-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1679054676; x=1679141076; bh=Po5+on7NXPECAKbocmNv12iR+RujjiNu7pU
	O2/fW8EA=; b=MvD2/kmGnvDgM/a30WfakUj/wackLMMVe7wSFWpafQlKo4C68pe
	yA6ArdtZ0e/kBoNW7AWYmUr632V7jalR7YH6fNJNnbRfRQDd6pSqq2iP/93QZ3Qz
	8JplpejI9zeI2RACrG2Holejea/He+W+UCZXElQTANHXXYZLHarYEBWXyfT8iY/Y
	jnW1KNhl9/TexTLXlwTOuBsEPBhxrPkNU3dGovSD6xV77i19eJQryTqt8kxMQbFn
	TSY180AjYQOoSITVVDrhrVgnaiHsYHgSePHY/kbBqttDRb75VZFEIW7DWcuRlbk2
	s8t5vOzsYLLUNNccWBTH1VmZGiNp7l3y8IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679054676; x=1679141076; bh=Po5+on7NXPECA
	KbocmNv12iR+RujjiNu7pUO2/fW8EA=; b=AEAzWKXwVUmtWAjDcx2psGwSY75hB
	YUgX6tHvVOmwydaK0mbxYmSVITMGtObGzB/XcdEIpdALyYWtS7NjeUBVkPclWuAk
	EVAfr9Cry44EtSxwaz1pe+/aG4ZLfDmDh0tJYvX4CgF5fSjZNVjcuoJmCeogpXZn
	gtEudcPBm9V2hzbMLH8BSvzrAQINk+yKs3feVQnHvQa2wkkP+/qgBE7A8dt2nMKj
	dm+93GUh0Ztk0A5zCFCo+ugEQnmXbjULncUFrdVC8Jbfpe/NRIw8txbJsXZcUpci
	/7VMeGNJ+Ad35gk396ilr9dTAWg5x6GFtls+M9gJeAZNkS5FkwosE0zPw==
X-ME-Sender: <xms:U1cUZGpvBo7Iw60kGhmGGHs9oZMnMEhlExi536huiHRYw3QdDY7AjQ>
    <xme:U1cUZErIhCqE7zL6xU5tiLKs06PULZEAVi05z2bUZNav7J3UPbrWtnMYzTW-DgnVw
    BW1b4VZmb06Fw>
X-ME-Received: <xmr:U1cUZLMbFC5pqEo7qppQErZ1VhYHOvwM1u2DEkM4VxtLJIyzVMziZsqvQafExc25tQ9oFCiEskz4mvEmc9LpyxwedfhBSTruu6M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:VFcUZF4JWrfhYK6rn-Htt9Q708bApec01Wo8Uo_1JDmbs0oE1fIKSg>
    <xmx:VFcUZF41rFh5lCHA-96NY6mSUgGT2D_M6aSOneVPE1KQ8Nz-SB6RzA>
    <xmx:VFcUZFjJ07Aw6-hnyzs4pPX_5UcEf1lmIp5616vjQ8EFUYvK8Zk0kA>
    <xmx:VFcUZI0shTdm8GqZCeIqmZ6naMIyw-7PilNXrJQDHnGozqaXbaDO1Q>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 17 Mar 2023 13:04:32 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] Update README to state Python3 requirement
Message-ID: <ZBRXUOvzRQOk9NOA@mail-itl>
References: <20230316171634.320626-1-marmarek@invisiblethingslab.com>
 <20230316171634.320626-4-marmarek@invisiblethingslab.com>
 <afe67927-0f62-511b-012f-2f2deedbf4e6@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FKwiqVnav0DqYLa+"
Content-Disposition: inline
In-Reply-To: <afe67927-0f62-511b-012f-2f2deedbf4e6@suse.com>


--FKwiqVnav0DqYLa+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Mar 2023 13:04:32 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] Update README to state Python3 requirement

On Fri, Mar 17, 2023 at 09:46:33AM +0100, Jan Beulich wrote:
> On 16.03.2023 18:16, Marek Marczykowski-G=C3=B3recki wrote:
> > Python2 is not supported anymore.
>=20
> There are two things here which concern me: For one, how come this is
> at the end of a series? You want to keep in mind that any series may
> be committed piecemeal (unless an indication to the contrary is in
> the cover letter, but there's none here in the first place).
>=20
> The other aspect is that there's no indication here of it being
> consensus that we raise the baseline requirement for Python, and for
> Python alone. A decision towards the wider topic of raising baseline
> requirements is, as you may recall from the meeting in Cambridge,
> still pending.

Hmm, in fact the only part of this series that isn't python2 compatible
anymore is "install-python-bindings" target in tools/libs/stat/Makefile.
And it's enabled only with XENSTAT_PYTHON_BINDING=3Dy is explicitly set.
So, maybe this readme change isn't relevant at all, at least not yet.
--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FKwiqVnav0DqYLa+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQUV1AACgkQ24/THMrX
1yzrkgf/c7DXp2u+Q8pXkLEE2jWwCQocOaNIcym8LvQNFzeeUkceMj0Mn4+afYnq
X8UJXUOs+mgQ1Uj7ou5/5q1PPz0t3r105n6KWh6fnmsmsn2bjIWD8tpXKy1kbsRa
zu9gsM4GuGwAhZBuRZZlykiKrZ04VFe7PsXe+DzIYScjvq7Iz1cvQvw9MhAeOjGs
KSC+Ea/Rnpxt2mAuSn7Rmu5JgbB/TbipfTHUXEel5NFV9Em37WiESg9hGmZh89Ok
6QnOlXURQlACaCXQjusne/TlLM/xrmvOA8RoT6MwSd1yKxcCrcSkK4WGZ49RfXdR
N4bMxfs4qKqWnFOR7fK86YucWO/oGw==
=phtW
-----END PGP SIGNATURE-----

--FKwiqVnav0DqYLa+--

