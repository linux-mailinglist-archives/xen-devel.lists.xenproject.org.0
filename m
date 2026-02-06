Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BzPAzzWhWl7HAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 12:53:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48610FD61A
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 12:53:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223151.1530761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voKO0-0006IO-7C; Fri, 06 Feb 2026 11:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223151.1530761; Fri, 06 Feb 2026 11:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voKO0-0006GZ-4S; Fri, 06 Feb 2026 11:52:32 +0000
Received: by outflank-mailman (input) for mailman id 1223151;
 Fri, 06 Feb 2026 11:52:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C95x=AK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1voKNy-0006GT-JH
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 11:52:30 +0000
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c7e1935-0352-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 12:52:24 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 56A527A0028;
 Fri,  6 Feb 2026 06:52:22 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Fri, 06 Feb 2026 06:52:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 06:52:20 -0500 (EST)
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
X-Inumbo-ID: 4c7e1935-0352-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770378742;
	 x=1770465142; bh=UN/rphT7k7nEBywS8b1d1sD/3Ze95vxqDdoTJfTUZqY=; b=
	Cv6hvI5FbIlCxmYhZlMRzOLs+ckXGOzybxomPZS1y344D9snw7JyJYAgn0K+vxiL
	M0IXlLQSVL8GD6Eifbu/mM3Q6SbOw7+he7UoSDg0VMy14H274GOGkrJghCIF1M14
	xZJHTnPf9E5V5N1wiAbyzDTKV0slfhsIdLEDStJedhfq8/EIcDRxk2nGraR6jzrQ
	/iuaCKn5iue3MwHEfsUNxfkBFnvcEAvFEwv53w7XcnrWYFhHbUtOI7nbgrs+n9Gn
	+V7bwvbbRuWsCBeCc9ka5Wg42uZrrRqpA8qXwz9eFOeZwW5tijQ7B3CTxTiHIB1i
	E5AKqsiRJ3E1xtir0fWeRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770378742; x=1770465142; bh=UN/rphT7k7nEBywS8b1d1sD/3Ze95vxqDdo
	TJfTUZqY=; b=sRw+vSq2/Q1C4fVGO9dee8tCbZAcgBlP4S/EpuRWPXzvSLATqms
	+YVGuGobamnSqzEZwZvxO2IYjzhklQj6ZkRX0wf6iKzQCWz9CvhcoTk5Sm9n9w6z
	JfnYo44Rk5+kjsnkA9g1e+w+BVIxWpB6Dx/auD1p1zTHY3iSGZdFxL1riz3Si6rd
	dAqd27+25AtFUA3O5jJynpklib7CRlihmSF4jwtMKVrxDW1tVnCEV60VVi2nmc8b
	4G1UoahLX3U7lnIcnpGq+X/+TQfRjHENnbAhPFfd5a3KijVT8Wu+Snj/vs0d3VWe
	qwi8zvsFE0z72r+fWL765E75+GbcFKQHzXw==
X-ME-Sender: <xms:9dWFaRCJsdY8xdbUovR5UZaZ9o2ZeL-xtiPKFCufClddS6OvZvsIgA>
    <xme:9dWFacGiR51moW_r8kGq8IeMJSSSP_kr0jNHiTxZWmQIyFWyUiujGXKLoZOgQgDdx
    Kg3xynn6kERp0zBoqzuhi_dYMUg5x_ONP0RYEi33SsFcvwmiA>
X-ME-Received: <xmr:9dWFaRDrSy_r3K5Xtm_ozzO2r8RoZ2XCyPp08i8ol7GxD2R7GCcWYwVLD6BpuPefd-FR80l4KVb9wJDvjy4xPhE7MOMbG-RdnnY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeekuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieeluddv
    keejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehtvgguugihrd
    grshhtihgvsehvrghtvghsrdhtvggthhdprhgtphhtthhopegrnhgurhgvfidrtghoohhp
    vghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrh
    gusehvrghtvghsrdhtvggthhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghm
    ugdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhope
    hrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghl
    lhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrh
    htuhhsshholhhuthhiohhnshdrtghomh
X-ME-Proxy: <xmx:9dWFaSl3uBs0XUhHghvJnMt3Fi6n3Cp_NAPkpMWg36rl5iETrwFBbA>
    <xmx:9dWFaXNqg0zMc8b2f954SzPKn_rUP4e1Vvd2-I_NOTGAlrFubJ-NsA>
    <xmx:9dWFaX8cnlp4ie6v9eipNTo7ifmwK-FHsnfqIxUwiEvaE19cxqs-eQ>
    <xmx:9dWFaRGlwJ1WsJLpNiupRt8ENnJiRAgsMYirR0Tin-LHrDoXAFB_WA>
    <xmx:9tWFabEJ8mKA94zjbM0hlwCkaLZDtJW3wSdsJrThkIG5opBWAeEDfDNg>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 6 Feb 2026 12:52:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] efi: Enable EFI_SET_VIRTUAL_ADDRESS_MAP by default
Message-ID: <aYXV8o4LjGLQ0VaE@mail-itl>
References: <82dfede43d81c2072f90b01d12fe5ef18c80fc24.1770312308.git.teddy.astie@vates.tech>
 <be09e51c-5201-4837-9921-5ac0d8cae582@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cPD7qH7Wc/gZxncq"
Content-Disposition: inline
In-Reply-To: <be09e51c-5201-4837-9921-5ac0d8cae582@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 48610FD61A
X-Rspamd-Action: no action


--cPD7qH7Wc/gZxncq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Feb 2026 12:52:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] efi: Enable EFI_SET_VIRTUAL_ADDRESS_MAP by default

On Fri, Feb 06, 2026 at 07:29:49AM +0100, Jan Beulich wrote:
> On 05.02.2026 18:27, Teddy Astie wrote:
> > Many machines fail to boot if this option is disabled, as
> > there are no known drawback toggling this option, enable it
> > by default.
>=20
> "no known drawback" ignores why it wasn't enabled originally. Imo this
> wants at least mentioning, if not discussing.

Relevant discussion was at https://lore.kernel.org/xen-devel/4e46a667-da69-=
9f25-387e-4dd45db10cda@suse.com/
(previous attempt at switching the default)

And also, (large) part of the reason for this being off by default
initially was it being close to 4.13 release:
https://lore.kernel.org/xen-devel/272a9354-bcb4-50a4-a251-6a453221d6e3@citr=
ix.com/

Now it's substantially earlier in the 4.22 release cycle.

But yes, some note in patch description would be nice.

> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -363,13 +363,14 @@ config KEXEC
> > =20
> >  config EFI_SET_VIRTUAL_ADDRESS_MAP
> >      bool "EFI: call SetVirtualAddressMap()" if EXPERT
> > +    default y
> >      help
> >        Call EFI SetVirtualAddressMap() runtime service to setup memory =
map for
> >        further runtime services. According to UEFI spec, it isn't stric=
tly
> >        necessary, but many UEFI implementations misbehave when this cal=
l is
> >        missing.
> > =20
> > -      If unsure, say N.
> > +      If unsure, say Y.
>=20
> When this was added, it was actually hacked in with the aim of minimal
> intrusiveness. When we now default it to on, I wonder if other changes
> shouldn't be made (maybe not right in this patch, but perhaps in a
> single series). For example, identity mapping (with its implied
> restrictions) ought to be possible to do away with when the option is
> enabled. Whether the separate EFI page tables would still be needed
> also is questionable.

This is an interesting question, but IMHO the current approach is safer
(or rather: more reliable) - which is relevant given how many UEFI
systems are not exactly spec compliant...
One approach that could be tried is to mirror what Linux does, but I
don't see it as necessary for flipping the default. And in fact I would
rather prefer to not do that at the same time - the current approach is
battle tested by several downstream projects on a large number of
systems.

> I further wonder whether the EXPERT dependency of the prompt wouldn't
> better be dropped when flipping the default.

IMO the EXPERT dependency is still relevant. This option is basically
"break Xen on a large number of UEFI systems".

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--cPD7qH7Wc/gZxncq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmF1fIACgkQ24/THMrX
1ywpaAf+IdQvew+Tmba3gd8DfFsbt/AqXwj2y9McV+0qoKjZ7VuLLj5Z3L5rY48Q
nI/n/5w8Jbanh/uK4/o87ApPxnw4SRKftr3w308s3lQPE/qoxwy7BPpbULaguMV+
yUEO9cQTTPprSsY7qcu58HCWKgWF0jA1x2IA3uKU8WyDdxEdQ7dvJp3FX/xWSzaG
W8j1TVAj1XIoisNe8q6aPB9+wtFaecCj9m7eRU0C873ax6y5V+ZbWah6z/GVX118
4QW0JligkgQY5Wb6kJyQ/0O5e8qC24E2nbtVAtx+bfMY4n+4PmUAKgRrcBqM5wst
FWNkBl5ASrJR4AgrxPnY3Y32xTk8Hg==
=rCxC
-----END PGP SIGNATURE-----

--cPD7qH7Wc/gZxncq--

