Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C3CA5AD2
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 00:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178317.1502181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRITo-0000mA-CX; Thu, 04 Dec 2025 23:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178317.1502181; Thu, 04 Dec 2025 23:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRITo-0000kM-9J; Thu, 04 Dec 2025 23:11:20 +0000
Received: by outflank-mailman (input) for mailman id 1178317;
 Thu, 04 Dec 2025 23:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRITm-0000kD-MH
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 23:11:18 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 816c3da8-d166-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 00:11:04 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 33C287A026D;
 Thu,  4 Dec 2025 18:11:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 04 Dec 2025 18:11:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 18:11:01 -0500 (EST)
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
X-Inumbo-ID: 816c3da8-d166-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1764889863;
	 x=1764976263; bh=P3K/8U5266TVkSvtw0vZMmaBluiNEwVZYdSIQ+weyu4=; b=
	ShYkVB+oMcxO/c1MlhjgaUilKNp5iDa/jvm0H0of6z4btqCknGFI5A1O5A1HgFO4
	1f1g1bqdx6DKSGP53Ugrnun8n3ab7efBRSnsrxlndRTOF6u7HdKun9nGgfuIfiXi
	iPs88r75NoxKicqampwPdZIlcthZLoNpLNGjzP4OqA1rL/2yIXUASYK607SY8z71
	xEDx5y3Ubfuu6lyPqtX3SEL+oXCu/ARR5Z+EyhPqo2SWihGWESra4yoYztfPoXdo
	fU6NlbCBJh9sptAjS7rCC9yletrg5FnR2VfceSmj1LOXmlx5cqVMcYskJB5XI2us
	p1chbrKUaKuatOXrbgXOTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764889863; x=1764976263; bh=P3K/8U5266TVkSvtw0vZMmaBluiNEwVZYdS
	IQ+weyu4=; b=Fcl5HpdGOs6Dn/p51UqdKrBAgvw537Mp4MJ/Bo+R/XmaQGHlrgP
	jvkmD2cRGVGEtGazCSF6itgY5IjsheM6ZVFXWJfF3RECKcTQrVpiqbdnNHz5DW9Q
	aCdobqFWKJV5Ek+46FTAsk8TSWT4toolWZMCgqVmSXQeN0DlxbPw05davZDVkUel
	cfU0ktoXeoWVwbLA886XmyrHnHaVOzDBsUnUBeXUswNywnn/EPupbiruYdeRHnIh
	UMj/v806/dxz5Bpm8m/L8CoJbx+FXonP/Ado75eaR01iNJmkLD2yctxWF1/JPZDx
	w0cciysK2ClUp+4ZYCOtIvCx0qP23sIhflQ==
X-ME-Sender: <xms:BhUyad8pFEbBHIy2ERRjZXuXxYCIOybJEZSeF2Zo_c4LXKZzWcvXHg>
    <xme:BhUyaYvu9lJ84ZOuE2Eakt8KbY2gjqCm0xX0cpEHwuKd4BeD50bpZrR3HfSES1W7F
    Em6R7RF2igORkGrjYzjGbSWYRRq101uywDEcj-BsinNsuhUIw>
X-ME-Received: <xmr:BhUyaQCBgg28omUgjQAmMfZ161vB_KHswf-doYb7A0jfawltgsmDhvfYKXsVEDO-YmkiHnmH001D-E59MFKbhWSSx_aujSz81cM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeikeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeetgeel
    leetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepgi
    gvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthht
    oheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllh
    hinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:BhUyaQX7lsV6dasmeHJ2WG34CJBXaGFvqfASMuZzu_Fw1LtWHXN73g>
    <xmx:BhUyaeCUrDLltinpp11jgYkqnBzveQa6WlQU_sNpo44ENAXQ6YgYnA>
    <xmx:BhUyaT_xUm7biFjH7JTaF2l-74PelJ49NZotlciKcBPWyzEjlGmGZw>
    <xmx:BhUyaVFlDg5GVvqrcYXbLpP4CjNedd2wZsjfT2cb36ONHn1d3vnF6Q>
    <xmx:BxUyaTjn8FK1rZMZMfkvdMAh_Lc9U5vgWPgcjBYjvOZNuiMfjgoVUNmQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Dec 2025 00:11:00 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/4] CI: Add configure --enable-systemd for full build
Message-ID: <aTIVBFMAaVj3Kh4G@mail-itl>
References: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
 <ed2e7eda64da87351d6fd8590eee698598ef8e88.1764867217.git-series.marmarek@invisiblethingslab.com>
 <c9512f4f-7c68-4504-8492-237447586cc3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5Mr9fUc86hZrINtM"
Content-Disposition: inline
In-Reply-To: <c9512f4f-7c68-4504-8492-237447586cc3@citrix.com>


--5Mr9fUc86hZrINtM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Dec 2025 00:11:00 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/4] CI: Add configure --enable-systemd for full build

On Thu, Dec 04, 2025 at 09:54:41PM +0000, Andrew Cooper wrote:
> On 04/12/2025 4:53 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > @@ -26,6 +26,7 @@ RUN <<EOF
> >          cpio
> >          git-core
> >          pkg-config
> > +        systemd-dev
>=20
> Why is this needed?=C2=A0 Or rather, does this patch predate my breaking =
of
> the dependency on system-dev?

It's still needed, without it the build fails:
https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099

Likely related to e54a6cd6a1f3802274cd3a58b07df5f012342192

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5Mr9fUc86hZrINtM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkyFQQACgkQ24/THMrX
1yw9FQf+KfLWn0LDlpbVGNCo30IUqHkr38giLW1xXqwp++5emZsqQVkyZv8vjUch
00fs2rpg2V1Q0g9FyBV1wwnaWIZCfJ4ueD1OCUZdbhOeHVFVZiEVLXd9kVFVhwDT
3nxtNRwO/VqF+uaD+FDdBIHrUVZiSWUA2W2FaVfXEGaW3+HyJ6pq6pQknOH5MK4E
UNF7RfD8t2mVUAJOXAU/J/KeImmKTy+SlwDSJEeWvTRpw0gmvSKjMf33PutctqCy
52171XKVmtNv/a9mMoNCyBIz14HYUXCZG05eklxQIp8vmoB0t5sgtmvj6FhTEnzw
68ZmvGRYeHoSD31lWRe9e9LlFral/Q==
=cXfZ
-----END PGP SIGNATURE-----

--5Mr9fUc86hZrINtM--

