Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4EAE6AEA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 17:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023869.1399940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5ZA-0003Em-Hv; Tue, 24 Jun 2025 15:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023869.1399940; Tue, 24 Jun 2025 15:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5ZA-0003CJ-FE; Tue, 24 Jun 2025 15:28:08 +0000
Received: by outflank-mailman (input) for mailman id 1023869;
 Tue, 24 Jun 2025 15:28:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fpib=ZH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uU5Z9-0003CD-MZ
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 15:28:07 +0000
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d25e93a8-510f-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 17:28:05 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id BC7281D0012F;
 Tue, 24 Jun 2025 11:28:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 24 Jun 2025 11:28:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 11:28:02 -0400 (EDT)
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
X-Inumbo-ID: d25e93a8-510f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750778883;
	 x=1750865283; bh=xEewdMo0YgeCo5Z8JhThItTVNM53kGDBjvJaH2F472w=; b=
	LQJ4Rdn1H4u1PZLCEHTow73UMXBPBNSjWrv2oTQgrvqbpahNlYcnnlsYr6uBnrlB
	yXeN5z13QnxorOWLH91laP47RlTC2OVIyj4DCJbtcw2mbEtPfwIGAnC3174QBoMj
	u0ASGnsmrziEq0wjn2siGH2CmqK8vAdby5o45BFIo2ajx3tPDDwIc20FYquFvupS
	1YKZvA7CymnBQWkvf4vKGhzH28Qa6ikVxHYo9dmWE2COqjL2lrgf/5kS7XAF2N/h
	+gQwiW24FL+CIcwgF5aQHQmE7gd9fif6Dohnh3ZR2NQslvWbGw+FdoetPnOnxpF/
	8xzdrCkYHFyZGxXEEPbwyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750778883; x=1750865283; bh=xEewdMo0YgeCo5Z8JhThItTVNM53kGDBjvJ
	aH2F472w=; b=ofQhcDMPJgf5bkNSlkj4Jr3qJCI7OE7lsxa8l7OjIqiSFqfk+TU
	dHnYlpWpfxO6HBe7x9U+0oDSmDMuBx/+xrCu5RKbkA+4g9twfxJMsP2qWL8O38vQ
	Wlj12TLBAnSqGhgq88gIJJkBde/7e/vaPMNbjLbp3vX5y2yRkTbghifN0cUiMQB7
	l4MK7PKdjgqKDQiVL2zT4xBv3VSvU2OvF4IJeBwmtTFQgwQxWSyk15Cjb/72KmxN
	JfsaWw4pljMPSnfOkE5ft3iepAETuWmcETvzxgL85SAXs2C3KBhtvCtpM6HJewqb
	My4Sz3gyVLmEKJBzpHwWGaIIiw+Bo1b2UIA==
X-ME-Sender: <xms:A8RaaNQT6Ek-1tu0fIHVJepSM4olfK2RZSl2i9SyIJhSExXwpOBSbw>
    <xme:A8RaaGwFB2H57MLRtSwfQlag9foYURxNdN4NMhVWy-XohOLd6XPMhTwt536_my2rO
    1pkxcY6b5iVYA>
X-ME-Received: <xmr:A8RaaC2vzD3C1JrtCkFu0JIHiPYjTLfyH8_krwuL6Ik_xkIlrbwcJG_jxt645dl-cDGqhJeEsPNRJOgDSAeadEaMem_3MhhssGc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueejteeg
    leelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffohhmrghinh
    epghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepfhhrvgguihgrnhhordiiihhglhhiohestghlohhuugdrtghomhdprhgtphhtthhope
    igvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphht
    thhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomhdprhgtph
    htthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
X-ME-Proxy: <xmx:A8RaaFBw6P3H9AAJG08j1J3IUMhxd9L2ARKFvWi38VDTN8s3LG712w>
    <xmx:A8RaaGh24xYSsX2SECr7TaHRsW710ebiwO-zWMM7TBeodncibWxBXQ>
    <xmx:A8RaaJp2AfR8asOeeWsni2ehrkBjtGvo6d7yrrje94TlbfViUOiuIg>
    <xmx:A8RaaBhtw4mGr5geBOJP-EbBDY33A4ZinxNlGzNbYaQsQI_A4wemIA>
    <xmx:A8RaaNMvm6DvDCyCesnW-J04XLBAIFwmzenPjIycZJO8SMOJW0CtYiW9>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Jun 2025 17:28:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] xen/efi: Handle cases where file didn't come from ESP
Message-ID: <aFrEAIV9vhpaWK7F@mail-itl>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <20250624083157.9334-2-frediano.ziglio@cloud.com>
 <aFqcQe5quyjhu24P@mail-itl>
 <CACHz=ZjcZRtjHnUPFRRYd4d-ESv4j2_ssjSTne=6NGCf0s2vBw@mail.gmail.com>
 <aFq3sYCAglRrMb8I@mail-itl>
 <CACHz=ZjbVRWtRc8HHFYZo0CKv4wFq2bwS_emmuZJUawTyBERCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zja0C8fd79G9+cQV"
Content-Disposition: inline
In-Reply-To: <CACHz=ZjbVRWtRc8HHFYZo0CKv4wFq2bwS_emmuZJUawTyBERCw@mail.gmail.com>


--zja0C8fd79G9+cQV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Jun 2025 17:28:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] xen/efi: Handle cases where file didn't come from ESP

On Tue, Jun 24, 2025 at 04:12:46PM +0100, Frediano Ziglio wrote:
> On Tue, Jun 24, 2025 at 3:35=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Tue, Jun 24, 2025 at 03:05:25PM +0100, Frediano Ziglio wrote:
> > > OT: the flow of read_file (specifically "what" handling) looks
> > > weird... can I change it?
> >
> > It tries to avoid duplication of PrintErr calls, while including what
> > failed in the error message. Looks like somebody really wanted to avoid
> > using goto here... Sure, if you want to clean it up go ahead.
> >
>=20
> 2 styles came into my mind
> gotos: https://gitlab.com/xen-project/people/fziglio/xen/-/blob/flow1/xen=
/common/efi/boot.c?ref_type=3Dheads#L765

This one, harder to make a mistake if for example there would be a call
with different error reporting.

> no errors: https://gitlab.com/xen-project/people/fziglio/xen/-/blob/flow2=
/xen/common/efi/boot.c?ref_type=3Dheads#L765
>=20
> What do you think?
>=20
> Frediano

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zja0C8fd79G9+cQV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhaxAAACgkQ24/THMrX
1yyvTQf9HTFCcm4VrIpycf624uXehPkh1xbb16EuYGyPuKAFt1Ok/iLHnmQIm5p8
DOCaPmqjmvnN2zkPBvQOfXwnebOkuWzFY7v8JA2GSNcXs2v6jJy1gCFa6LXDUrDS
f+IkEpWEd6Bwtt+DLoDqCsxaopKz+U3VgG6WRMo0niz1BDj0kQWLINBI9jP6J75W
P6ige0520/lUb0v7+2eiODS80ONwTCQr0fOezaUTnjua87O0Zm9D78RqSJzClu6o
fqYuVlDEE4i1HCW5qD7mjot49Qus+xnvVRwSUsEvY6cWhRdkQZgBO8wQNoW/GEZK
UqV7XHpm4GJIz/T9MjN/gXgp5GGGxQ==
=gSuE
-----END PGP SIGNATURE-----

--zja0C8fd79G9+cQV--

