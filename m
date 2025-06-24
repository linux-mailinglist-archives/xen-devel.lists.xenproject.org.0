Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726ECAE655B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 14:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023657.1399681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU342-0004cI-CR; Tue, 24 Jun 2025 12:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023657.1399681; Tue, 24 Jun 2025 12:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU342-0004aJ-7W; Tue, 24 Jun 2025 12:47:50 +0000
Received: by outflank-mailman (input) for mailman id 1023657;
 Tue, 24 Jun 2025 12:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fpib=ZH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uU340-0004NM-TJ
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 12:47:48 +0000
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6da99e0b-50f9-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 14:47:47 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 30A827A004A;
 Tue, 24 Jun 2025 08:47:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Tue, 24 Jun 2025 08:47:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 08:47:44 -0400 (EDT)
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
X-Inumbo-ID: 6da99e0b-50f9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750769266;
	 x=1750855666; bh=JsjP6RvreMp6FfY4Zo3DVWiWh+YaUroLK9oIyBtzDvM=; b=
	gw6jlosgEQpFK590GUuU6xaqUO1qJSRBreyPPW3d6fjdKMIbBIrKEnV8aVOYsekq
	vizsDhU07AO0D3w1kGIhcJ3ZEFhH7R1K7Y+s8fnxCPNeAcurdRTwxdci+YweKxfb
	ZUl3xyZmWaBb/N+onN3gBrKW9NJdPTuVXEZQjbttVaTpfX4DiVRxlrQoVccMUNVn
	SSbWMbpNoWhJKze8fn2qWfzfCJkzO/v4Bm7qoLBJVsAO0R2OdDbFdrCUDSRkBEce
	RgF4L9ngq5eFZQLpbJ+R8ymocKWM1JhjTcqAyKEZMjwUFes/6Hj6y3Wu34Pz/Hin
	8Pvjq2waEbjmlBr3pAvxKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750769266; x=1750855666; bh=JsjP6RvreMp6FfY4Zo3DVWiWh+YaUroLK9o
	IyBtzDvM=; b=g7aBWpinfB/4xZh3dH5JoLKAr0a1MN6LqY8pUILGc20tHHnxHKW
	/ld48eX4MJvLh1eopE6ftD38KD0dwV0Z3a9cIt8oqjHdcx31YzwOP9vkRxkXeGMB
	TfO/vL86wXB0Tx3TSMggB8KfuOrfmwKq6iE9YnjA+YJyI57DRM/jI7FfL6b9hZ78
	8jff4vAWAJ7ackiM+Rh4Iv7WxZFvKzCnhoLeB56i4pGw0m2txoUf/w4kCoq/0BYr
	4ACWVCXueS3MD3Mmq46rUf2qH+dggQ3PKM3MsJND/EjCDrM+uOl/YLZ+ew2w9R/T
	xn5VRnT9ngyCMT72dlxvMZjbUw9quST1nLA==
X-ME-Sender: <xms:cZ5aaOZFlVy8haMcShFNTO9cCXcWWd790m2_yEvHRxM5Tb6bxyEezQ>
    <xme:cZ5aaBaDWbTw1t_eiwuk_qezTPPo1kuyNdjW-I2pE2UlaKuMmP8jKmOJHeU33A32y
    niFshsjIkfZmw>
X-ME-Received: <xmr:cZ5aaI_sihlypeo-7VdQ6f2E2yXP6MPkb8LByZnwhnvmlYrIamCN3KYfkFrV0301dr4ZzrSDKBK4oRo3lfrhDLIxIsr-NciUArg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleelfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegt
    lhhouhgurdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrh
    higidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhr
    ohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholh
    huthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
X-ME-Proxy: <xmx:cZ5aaAqfZgsEpDf62-D9Zc3R2d5E5xKui7rmkw48NQ8ByUVXJIWl6g>
    <xmx:cZ5aaJp3EJNfXeRzjWJgHak8AO9jE-aRDFBUBaLdY-YMlChPYs5j8g>
    <xmx:cZ5aaOTkVbg0jtgKzojJWmAJ13ZklEh0tTM1t8xNfeIGHF2F6lZZWw>
    <xmx:cZ5aaJreBNX5IvGEfluSOGd5cJxOXWjKBKsRKeq57OzsvFg4nE87pQ>
    <xmx:cp5aaMO8g4KPrrJQcyfCfIEpePyaG9r83myLGtqOLnYXW0LOUluycuuM>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Jun 2025 14:47:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] xen/efi: Do not undefine not defined macro
Message-ID: <aFqebhppJ9UgBHfd@mail-itl>
References: <20250624114529.34743-1-frediano.ziglio@cloud.com>
 <c3f0415a-3a91-4a23-81d7-8e913e4a8f7c@citrix.com>
 <CACHz=Zh0iRXqejwuoEp_LkeQvzDUf3iMOXymB6YaTop3fYsE+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fNIkhp0iry7b3NdU"
Content-Disposition: inline
In-Reply-To: <CACHz=Zh0iRXqejwuoEp_LkeQvzDUf3iMOXymB6YaTop3fYsE+w@mail.gmail.com>


--fNIkhp0iry7b3NdU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Jun 2025 14:47:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] xen/efi: Do not undefine not defined macro

On Tue, Jun 24, 2025 at 12:59:18PM +0100, Frediano Ziglio wrote:
> On Tue, Jun 24, 2025 at 12:57=E2=80=AFPM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
> >
> > On 24/06/2025 12:45 pm, Frediano Ziglio wrote:
> > > The "buffer" macro is not defined.
> > >
> > > Fixes: 59e087bf6a9c ("xen/keyhandler: Drop keyhandler_scratch")
> > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsla=
b.com>
> >
> > While correct, the grammar isn't great.  I'd suggest "Drop stale #undef
> > buffer" for the subject, and "The "buffer" macro was removed when
> > keyhandler_scratch was removed."
> >
>=20
> Fine for me.

Fine with me too.

> Not sure about the acknowledgement.
>=20
> > Can fix on commit.
> >
> > ~Andrew
>=20
> Frediano

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fNIkhp0iry7b3NdU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhanm4ACgkQ24/THMrX
1yzIwAf/RQvqWoRVUttYUGXsABFeXwhtpzS0uWEqz7vjHXn9+Kf2aezBSJo8OTgx
OMYHP1O/P+AE0SfAIASjLnHDUcEUOaOqG6W2gkM4JDWlnErzAqscGnMP6K8Shrv2
x1snm4AUmUUmnCQSv4HPr67YCJKvHLlVeA0ztSyx0fwKGd/Xhioo43GW1NtDMD9b
0ryrMfjvKMxywKoqD6Qip2mBgodSC14+wXBVRD0LKoooobhfR62TemhdrhsTMXIO
3H9I85rWSw6ORo+b4oUhN/D3PViw692Lbx2vBG4S0sDorU5RZscQtHLMwC6++0+7
zC2ZUyPuvBF+DHPCKVKvO+xIedTT+A==
=WeZ1
-----END PGP SIGNATURE-----

--fNIkhp0iry7b3NdU--

