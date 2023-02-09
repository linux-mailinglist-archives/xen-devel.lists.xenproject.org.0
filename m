Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F6690F50
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492850.762614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAnq-0000Go-HN; Thu, 09 Feb 2023 17:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492850.762614; Thu, 09 Feb 2023 17:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAnq-0000Ez-EG; Thu, 09 Feb 2023 17:33:46 +0000
Received: by outflank-mailman (input) for mailman id 492850;
 Thu, 09 Feb 2023 17:33:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKJk=6F=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pQAnp-0000Et-Pd
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:33:45 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e675a4c4-a89f-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 18:33:44 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BC89D320090D;
 Thu,  9 Feb 2023 12:33:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 09 Feb 2023 12:33:43 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 12:33:41 -0500 (EST)
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
X-Inumbo-ID: e675a4c4-a89f-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675964022; x=
	1676050422; bh=+gWL5kImMUsYHMpsPGwx6t2ZADiSvIHJdC0B/YhuKUM=; b=W
	e/K0JpTmtOQFrvGXnavJ/sCK3UKgvG3CbJe1ZuEjFCiH93CfHKZkOavBQPxMClSc
	myPVAzkF0Od9oi+nVinEAnzIa1fRadjAF5EyQ6Nohqhih875SAQtZ71+XmPeXPc2
	Sp+SRNZbbUzeAEVa2pYpXVIA3jQmBFyuFftcdoeZPpwzr5io4613oTn1KOqcUuZH
	7EyFqbGB62+RwQFyPCuhs8sD7rnm5qKgybx/wJ3qnlZsvk/jjVIjbhnySKByp5tV
	UznQUf7ICEQY3gwt6s4purNFDTWP10pCJ03W0j/gIT7Y3BWfQ+vVQVwHHXayJ/Zn
	l03evkkqwBKV2x7zVvd3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1675964022; x=1676050422; bh=+gWL5kImMUsYHMpsPGwx6t2ZADiS
	vIHJdC0B/YhuKUM=; b=t4pqXj9O06j9KbydeWNqJP7dST2DBMcTUPyITLwDY4mL
	M4DbFOFRVsAtqKaamDpAJ+0kQecI9ycyVvXWmYDl1PQlmtn0Oon1Dk93ax/QEJF/
	TgltlFGbUAW0sl/TKgAza8wT3AA3WQl1iHtUz1Fsz1gPpRgcESq92zABNn0I0MG0
	24UJTog5z9+SA4vlsFKyMKDBb4AZ4GFqRxvIv3aA5YWDtvEKcy0Q/piMIK9RZ39C
	zyF4dDvaKUhgXn8nQ0XAmHvkWhgcgMc4Uvq2bp5X5uZXkLr7RZriDIY8hkc5RC2E
	LRrGqW36oWx1xqNTs6ElXU6l5HLYXHjSiZuG1B84lg==
X-ME-Sender: <xms:di7lY8c5qGXX-DaaZdaSjgaTmx42NBZCiE6LkvbSb1vtCqaVLitXOA>
    <xme:di7lY-N_84lwDyyRYFogixzCxuHesR38tdiFmb0r-6v4harYy1JPFf6tTltZojIyw
    ZqBzZrc7WVIwgM>
X-ME-Received: <xmr:di7lY9i9NziNpbmFB7edZA-8FMF0PBBNsDS2-RroSs1kPej1DOiim4I7mvU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehfedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffej
    geejgeffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:di7lYx9RT5y2ZPHXwLGBpr0AeG-WK-9c_hlIQXGkK7hYKbvT125mug>
    <xmx:di7lY4sof7fO0bYUJF_lyIZavy33LHJhVmw0AawcYRfzvrPQ05LhYg>
    <xmx:di7lY4HBm8rjhquTjgJRKIg1-BuwNmNyCp-hkpl-CWZJszpjdFlp4w>
    <xmx:di7lY8iew5mLPYYe7mI-WdSCDKckljP0wv9Xs7UujmjTZbLA2XZLyw>
Feedback-ID: iac594737:Fastmail
Date: Thu, 9 Feb 2023 12:33:37 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 2/4] Automation and CI: Replace git:// and http://
 with https://
Message-ID: <Y+UucvSzLz61iZFX@itl-email>
References: <cover.1675889601.git.demi@invisiblethingslab.com>
 <8a3d0ce9747e486e91ad5b47777c80293e0fd168.1675889602.git.demi@invisiblethingslab.com>
 <CA+zSX=Yu+wV8mqj1n5=yFZxDxLwB5cpaZ3oG62DZu_Z2ebPxdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ZxjEK4Mi/gAGzVS"
Content-Disposition: inline
In-Reply-To: <CA+zSX=Yu+wV8mqj1n5=yFZxDxLwB5cpaZ3oG62DZu_Z2ebPxdQ@mail.gmail.com>


--5ZxjEK4Mi/gAGzVS
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Feb 2023 12:33:37 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 2/4] Automation and CI: Replace git:// and http://
 with https://

On Thu, Feb 09, 2023 at 02:03:34PM +0000, George Dunlap wrote:
> On Wed, Feb 8, 2023 at 8:59 PM Demi Marie Obenour <
> demi@invisiblethingslab.com> wrote:
>=20
> > Obtaining code over an insecure transport is a terrible idea for
> > blatently obvious reasons.  Even for non-executable data, insecure
> > transports are considered deprecated.
> >
> > This patch enforces the use of secure transports in automation and CI.
> >
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> >
>=20
> Same question here -- have you verified somehow that the new URLs work?

I had not, but I just checked and they all do.=20
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--5ZxjEK4Mi/gAGzVS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmPlLnMACgkQsoi1X/+c
IsG6/g/+P102TDvpkUA6eFt5f1mkhy7m2uF77jRmcAVsG7nUuvpQ4O0wf/51H7re
ZwCPeM6A7I6lH6TZgfSItgYHEKwjig/IoDzlCi4w/PIJuvSi5y7fxiWNDtTy2k65
yjDP67BraZ/f5p429Ulkqoh7NBytU3Pbdzikgrdm/UhXBJalhuenu7uTLK4r/NZ4
DuxngFXxAG/JDf3mqfLv1La8iUeRK2YmcqI2dU0j0COSMVwr1VQ2YAnwykcAgQ8A
baLegM0btKNftgwYDdHPiY30clOpGbogbDXyq764LNpRCWgpH8YrJrvdgz0FvrQn
taOXbwjbErVU4tm12ObC6q/kxMaEpeBb18hWieU3uEpELtPxZ4p8UatYD9Yhj8/1
WxlDcmZmTfX6+jDrt+CSWRRqP7F/q7I4D5wKzdWW5Yr9jqU5dkNygaqG+0tuwrhx
YrZQ5xL0W02pK/dAikWhy7eIgENxoA5ou7ZukUaGWGvbXc6tI1Ij+UxNHt2AQn2B
khGB1FO0uReHDkcPuqrsxqSZFenoSDOlZcXtlJsWz89IiqOvqTLjBlUGqkHvk1fg
kR6kgFSRw+WclA4beoV0OWfSZ3t4/oR4d4WqY+s8n5sq+b820IFA5+iXZlZr5YyF
AOZOnPdQBoG4Satao3pnLhiSbHVMXffGmeOCorpXMzMNKWrFQ+M=
=kpc1
-----END PGP SIGNATURE-----

--5ZxjEK4Mi/gAGzVS--

