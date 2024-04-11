Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA7E8A22A3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 01:55:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704261.1100538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv4FV-0007pK-Op; Thu, 11 Apr 2024 23:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704261.1100538; Thu, 11 Apr 2024 23:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv4FV-0007mh-LW; Thu, 11 Apr 2024 23:54:33 +0000
Received: by outflank-mailman (input) for mailman id 704261;
 Thu, 11 Apr 2024 23:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tv7g=LQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rv4FT-0007l3-Nr
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 23:54:31 +0000
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4bfe080-f85e-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 01:54:28 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.nyi.internal (Postfix) with ESMTP id E819513802C2;
 Thu, 11 Apr 2024 19:54:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 11 Apr 2024 19:54:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Apr 2024 19:54:25 -0400 (EDT)
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
X-Inumbo-ID: d4bfe080-f85e-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1712879666;
	 x=1712966066; bh=YWo0cWGxug3fg9UPzZVh/pDvLOXd5SPS0wm5L876pkQ=; b=
	Fru8IP3eMBL6Dx6UEZW1UEKcD13xlYsQwko8KORukAsa+35FzhMbsQjVVvEDJSYR
	sHSB5TX2JU9BZJj9zQDhtxTqxkS6Y3K7eFJUD6A7kby7lxotUHpvlSlu6TDWJqpv
	rrFt9tfBb1lj7UOonXajZF6UnWwaW280gzKdCDts9yD2x8vyQQrpM2fOj67ghESE
	z7rOOj9DPzWK7Fu3ORDG/p06wmnoDvfSSHi0gn/O0FJVuKn70gUgIkZwbBBnRyKk
	eL6StSBn4x7ZCwRUq8760P6cAJmHyZFlvOdhZcla5bxe9sTvBDns5Sn3AWbBpHF0
	0hFPlDAOqCAOq2vfQ/ptjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712879666; x=1712966066; bh=YWo0cWGxug3fg9UPzZVh/pDvLOXd
	5SPS0wm5L876pkQ=; b=LcIsRNlfEqBtLGLVvq1igMiB/NsktPm7QG6ymVeoWHfz
	q06i0TUO0rbWudgXx+1nZ1cDNvlAhdOK1gOq7y4qT2vhx6f0/nyKiLaC7KnHyUWa
	mUB6M0Wsh7kXiZQyuols9DPZoZTzcLozJyTiiQABGAtbUQdnuAuWT3CRVZKa4IJX
	qYWuggN4N0A2QId85LTiYEGCgQfIzIhAwCHiimQrPVctmXVd6Z8gRp+UJ1GNyrhB
	+Fn7TmF+bJ/vaQlOOKCu6BFggbVttsxRHZjA7ByU4l6y8qYyWI3uQuqYRFN5fn5Y
	TXwT3MVn7wwZHQMV07Rln+x//p6FNMW6Osx6Q2VYFw==
X-ME-Sender: <xms:MngYZoqXIUsypSYFhjPcY7jmNsqn5TwDpKxKy0lQm3Z6PUap0rnhEg>
    <xme:MngYZuqdodI7O8zYEQBleJMWrsCYQBgvQrAepzDKeAQjE4ZyfbUIu1QUCMaVPsR-R
    -8bkzg3PswbVQ>
X-ME-Received: <xmr:MngYZtPQyFn5-3C9aic3Rt8v4IDkmREHOlDZH3Q-eo-f3ZCYraOA5UzAkgBjHFSyhP_UYIns11n-ccTokXQpJJpGXTXtxTlrzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehledgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:MngYZv7nhWfVxd1C8-1wxSc1G8DHDVrSSAJ728aRyms5stDxDVb0Sg>
    <xmx:MngYZn6_3cC-7ghDqZkocDVHvUnaCGKvOSpzjLIixezPkH0wrmV5Kg>
    <xmx:MngYZvhYhKWVEgxnTZbJDJH7bm2TxeUnCJLIuFaWHTKeHGMtErbMDg>
    <xmx:MngYZh5DhujhhjMP5UYAWdz41s01c63IDbo4NwKq3cL8VJQmIlt8hQ>
    <xmx:MngYZq3XRQdmZnwPobqnRLMIkcFJSchOoCOM4dXdHMZwcN7pOY2N790n>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 12 Apr 2024 01:54:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 0/3] x86/iommu: Drop IOMMU support when cx16 isn't
 supported
Message-ID: <Zhh4L1Svedt5QxGY@mail-itl>
References: <cover.1712580356.git.teddy.astie@vates.tech>
 <4bf2e6ea-a7fc-4cc6-aefe-4a9ed9ae97e1@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HDh9HtCD+xo70z4U"
Content-Disposition: inline
In-Reply-To: <4bf2e6ea-a7fc-4cc6-aefe-4a9ed9ae97e1@citrix.com>


--HDh9HtCD+xo70z4U
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Apr 2024 01:54:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 0/3] x86/iommu: Drop IOMMU support when cx16 isn't
 supported

On Thu, Apr 11, 2024 at 09:05:08PM +0100, Andrew Cooper wrote:
> Sorry, but you've sent out two copies of each patch in this series, and
> it's not clear if they're identical or not.

FWIW I've got just one copy.=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HDh9HtCD+xo70z4U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYYeC8ACgkQ24/THMrX
1yxrIgf+MbyK/8YtVuj88gGQ5kjSKoPmuq5/hVO3HDwuDDoJNBquYrnBmn9g5nCv
sibdus1lMP9t59faE/ENITNfXuLJ+kRmeBZ3qzU6aENc4Uil8zaUetYMQ6+nvLlv
eLvLtHG6ojhCOXuLIHOgM5U2Nq9MuxqnaRMeWbe10Pqj/9Y0b2KfJiXM+IVNvAco
4L981kGTgl0Wtpwdw+Ybagem5/bN/VJRjZVoJ1eENgkeD7WFFAqMTXjMCaZRU9Oe
O/fxPEs5PBIelbeW8k3eYtCh3+v8P+7XSgzlCyqvkatp6wmY1z3KZAtiChxU7wNV
w3kHKzqbcam8StcBNEXSeue8JeU2Ow==
=IuAl
-----END PGP SIGNATURE-----

--HDh9HtCD+xo70z4U--

