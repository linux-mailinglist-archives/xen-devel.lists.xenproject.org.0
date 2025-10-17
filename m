Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9737DBE6CCE
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 08:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144957.1478146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9eJB-0000co-Hs; Fri, 17 Oct 2025 06:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144957.1478146; Fri, 17 Oct 2025 06:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9eJB-0000Zu-FC; Fri, 17 Oct 2025 06:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1144957;
 Fri, 17 Oct 2025 06:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LK2+=42=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v9eJ9-0000Zo-UA
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 06:51:24 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af41e95a-ab25-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 08:51:20 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 72E1C1D000B4;
 Fri, 17 Oct 2025 02:51:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Fri, 17 Oct 2025 02:51:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Oct 2025 02:51:15 -0400 (EDT)
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
X-Inumbo-ID: af41e95a-ab25-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1760683878;
	 x=1760770278; bh=ddY17ElrfriO5ATh3tPlnDDN5jXZ845Y89qh6whqTns=; b=
	T2nnZr0yUfCkuDUVLG9lqFnS8QbXt6ZnLVCxG8plJKnHsEtUvdVyuzyo7X/PQpVO
	pxWZrjZWU9KDzKT9CjAbi5s86ZvIPrwms/bm36Rhhqudml1OmcmKXPoslsOWiDUS
	n3rMiT9roC0BpohPQ252gCw2sFhFfZU3iYl4mhMGWqX+fysDHnQgAgoQV3x1NbAl
	zDdmwdkSjoZhhZh5jJccenzlYvusdNSigS/u7tU2i1BEOAyzyP75EcW1/UGrgQBS
	iCh7P+qc9NHJ7RlZqbDR6w7rNy2mE+UioZOq61tF55Dj5oMvvvkEUhKK4dPb5T2V
	ApgmGmBF62Le0xYNB7X84g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760683878; x=1760770278; bh=ddY17ElrfriO5ATh3tPlnDDN5jXZ845Y89q
	h6whqTns=; b=H+HHxs3d8uRNhqrS/ld7EvTG2euRWgiCJSmSeasCOlosMNqgCZw
	AwlTpA5mjPZMApx2V4bxeH7KNorhRNPd/HxksW0Tz9+50FcT093sccBDGshaoFrk
	pAksKkE3LdAPtvQIaRtOsgfo70tGmtP4/h0MHlXJ3Z+TOSt+OE76iG0LIFXSEpJg
	rI1EpaUv1Q4l6rJtPnpN9ht2f33/+qkF931I1l1vz8cs/P+qW5coemjeKsKmx+Ao
	zw+ewQB6aah6Ab3y0LUvjIfhwga7J6S5RrsBG7jeWQR6wxIEURWK9aTVISTyjrQM
	MjLIT7eySamm9maJiq1pcshDBoBBJhD2SSg==
X-ME-Sender: <xms:ZefxaK_ucMCor2A2pY_JvWsfUpZsiGLCWEkwmzhe97vTAUxG1EcqUA>
    <xme:ZefxaJzVQ8Au5fx48EUzhp4itrgtEl5jFoi-0rWzThNInhPAzUViYMA3RCObI-2tc
    mGVBrB47AwRtvvr-FxvwTidzQ4xUZdxio57RFgxDX1vxkzpsIo>
X-ME-Received: <xmr:ZefxaGPZKJZYSK4df1xdYGe8p7jqvlaZDiuazq4-mP5SGEAFBtk0AjHpxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdekgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepkedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehgrhihghhorhhiihgpshhtrhgrshhhkhhosegvphgrmhdrtghomh
    dprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthho
    peigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopehsvghrghhihigpkhhisghrihhksegvphgrmhdrtghomhdprhgtphhtthhopegr
    nhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepphgruh
    hlseigvghnrdhorhhgpdhrtghpthhtoheprghlvghjrghnughrohdrghgrrhgtihgrvhgr
    lhhlvghjohesrghmugdrtghomh
X-ME-Proxy: <xmx:ZefxaO-e4FjMYKhVSBWJIeuPM1JCH40GvuS8ch4oB8bPXWhx7jrmIg>
    <xmx:ZefxaD70AJWgYNpFtFWcfNTx5JlwqaGtTJxSOMLF_6rak906OxM1mw>
    <xmx:ZefxaE6wtxrJINNUYXoHP2uXryFDW8TZ0lKdK5AJ9FxDHngDhMVZlg>
    <xmx:ZefxaMp1RxeWlmlA8KPE7_SkQs0VdcjX7nwsRyrHA0nkms6NX_VgUw>
    <xmx:ZufxaFAias83FCgJ5W7izLU3nEZAOjeqqlZBt3N4rUOdI5ZwHv7sriT3>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 17 Oct 2025 08:51:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH v5] x86: make Viridian support optional
Message-ID: <aPHnYNlzwjF7m6Bq@mail-itl>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <aOzt8gfxkdQXZ6O1@Mac.lan>
 <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
 <aO5gdh6C_uQoFHPH@Mac.lan>
 <afe544d3-575c-44e8-9068-8c79f69d6175@epam.com>
 <aO9UgQ3J27hVgGIa@Mac.lan>
 <06d540f0-38e6-46fd-b94d-58ac2797657f@epam.com>
 <aPFz3-RjsG-VGRLU@mail-itl>
 <4367edfd-b3a9-4bfd-809e-fa7b23d127df@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="29zItwLIBKZXLJjS"
Content-Disposition: inline
In-Reply-To: <4367edfd-b3a9-4bfd-809e-fa7b23d127df@suse.com>


--29zItwLIBKZXLJjS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Oct 2025 08:51:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH v5] x86: make Viridian support optional

On Fri, Oct 17, 2025 at 08:01:13AM +0200, Jan Beulich wrote:
> On 17.10.2025 00:38, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Oct 17, 2025 at 12:40:33AM +0300, Grygorii Strashko wrote:
> >> Another point, assume change like this is to be done for HVM_PARAM_VIR=
IDIAN
> >> - there are another HVM_PARAM_x which depend on build-time disabled fe=
atures, like:
> >>  HVM_PARAM_VM86_TSS_SIZED
> >>  HVM_PARAM_PAGING_RING_PFN,
> >>  HVM_PARAM_MONITOR_RING_PFN,
> >>  HVM_PARAM_SHARING_RING_PFN,
> >>  HVM_PARAM_IDENT_PT
> >>  ...
> >>
> >> if corresponding features are build-time disabled, above HVM_PARAM_x
> >> become R/W with functionality NOP now.
> >=20
> > Are you sure? For me it looks like setting build-time disabled feature
> > returns -ENOSYS. Or do you mean some other interface than
> > xc_hvm_param_set().
>=20
> Where do you see that ENOSYS coming from? In fact, for example, I don't s=
ee any
> of the *_RING_PFN even mentioned at all in hvm.c's parameter handling. Ar=
e you
> perhaps thinking of only the HVM=3Dn case, whereas I expect Grygorii talk=
s about
> the more fine-grained controls?

Oh, sorry, I looked at XEN_DOMCTL_vm_event_op -> vm_event_domctl()...

> That said, whether to uniformly fail requests for params solely related to
> build-time disabled features isn't quite clear. Arguably for e.g. paging =
and
> sharing, setting the ring PFN can as well be silently ignored (no events =
ever
> appearing), while failure would then be reported from other compiled-out =
logic.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--29zItwLIBKZXLJjS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjx52AACgkQ24/THMrX
1yx+sAf/WaPtMLIjCWuYrtxXqAyma6vvUQ88HMCEcPcIG9nHctlhnyyPM/DT2FVU
SCS4EuyCqkONQVrLn/1KvVtJd7n+32JEWUATJKKl4e6iFFLqKd5RRmgTP4RxkQ2u
CPdTo+FWUyrYQZ+g43KN9wSa312+TRsn0PHuxLDwPRvblT0khEJE+wPVhD2mSfEs
v8Mzz/x8RWjKqM/Z0DUktvG1PR8Q4mRT8LDDARzaVilC2pY0UjaYuZtRo8qT9QDY
/puUS4rjhjonGJBu68kNySWx86s86vAGunE4yJIWo6E5wQ6JIhCGb2swy8Pa2VZF
ok0QYMvxiWd+TMOjriWtYL2Kb0nlGA==
=q0Rr
-----END PGP SIGNATURE-----

--29zItwLIBKZXLJjS--

