Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B2DB3B6D2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 11:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100932.1454181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urvCX-0007s7-C4; Fri, 29 Aug 2025 09:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100932.1454181; Fri, 29 Aug 2025 09:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urvCX-0007oz-7J; Fri, 29 Aug 2025 09:15:17 +0000
Received: by outflank-mailman (input) for mailman id 1100932;
 Fri, 29 Aug 2025 09:15:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UceS=3J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1urvCV-0007ot-1R
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 09:15:15 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aacb3009-84b8-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 11:15:13 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 740F4EC0369;
 Fri, 29 Aug 2025 05:15:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Fri, 29 Aug 2025 05:15:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Aug 2025 05:15:10 -0400 (EDT)
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
X-Inumbo-ID: aacb3009-84b8-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756458911;
	 x=1756545311; bh=5DlVNJiRSG3ClIh5MMnZyn2st364JG/yQj8tf1GuKm8=; b=
	rk0UeQHCbl3EhbcZPfIFdwgZDRts4FWA0+9LJUI5jtKsYE+4VfuVP7j1HcHH6uTL
	cfhuDzvcBH+8tR+xRYA9H0efdak/MZ4M5xcPFjFU1mnwHIlMJg9eh8zJOJzHIs3O
	kMvtSGo2KGJFtAGJ3ByLMdrcsTAdWMcRVpxDBweg/29bMSWsxGon4gneafP0AtYd
	nTKMH/Brw0598DY+ChwJueYkpWjZsK8Q/cMbH5LQ8BptRtDKdNB4UV8Of7BPeHIZ
	CjQfZ5i0xsGcf6bPBnQZp8ZMvsTW2do1E20kKUmPMVIdpWVf/MNWresKwbAtZfC8
	OOdBz9+k6gw7B4Rq4Wcw2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756458911; x=1756545311; bh=5DlVNJiRSG3ClIh5MMnZyn2st364JG/yQj8
	tf1GuKm8=; b=ikqHB0Sq5Qn7SeM+UaFv8qDpvpC5lWcA4VVx+jNgvECL/Msd9FA
	S4o8NxkS0ur0xnrviah4+D2D/9mzHwTBpCqNQgvahhi40rAu8yiOVkN4vKL7+HK9
	NA8te31gBeUq1Is3RG6+VjZk82y6zgag3/V12qlWWR8U7sRLe5pe3PHQwz1CV5/j
	n1o3IfOdqvb+gMXm3/ztrbZwDw9scmhZbpifBqGwX7wd5Z/c0ue0yYHdJ6islIca
	8xjdnVmmCaBNiLlKg0LtkLnvK2xN5BYTv2jcW5PWRJfsK4ON5QkG+zMGzSw0Nuou
	TrU9jgXzcQEnaQcF6WFBwSnQXfGpFBkRpfg==
X-ME-Sender: <xms:nm-xaNNR93tCnppsMKRvrYp0DeJQJpwpjGC_wFRgzA6EiItTHt6Vnw>
    <xme:nm-xaKh2P9KH4fZXSWKtTX3LIxLIp9CvM0-OexsGivlH_s1A9lPZ6E5kkjECrWd7P
    SR96BvTntNZmw>
X-ME-Received: <xmr:nm-xaI2DoHXPWM4HzXJLEAR1-8Poz6xA_0B-m1yFUaenzxKIz-cmUkLHJGAsVym9USUGNNcKtmzKqvAamuTb5Ur2KggHIB_WdXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeefgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegtlhhouhgurdgtohhmpd
    hrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdho
    rhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrd
    gtohhm
X-ME-Proxy: <xmx:nm-xaMjmxYSdVI86NCAXoBASQGCJqMcT0zJYDF4AWDOQBgs569lcTA>
    <xmx:nm-xaAdBkdQQuLT7HDcwpVAHVG-gPbASscImVYJdsRhUXN8c87Md5A>
    <xmx:nm-xaHkNpI73KBnhr2uva-PWzsOPyGnaT7ZcOaJn1GicQQ_Z5oze9A>
    <xmx:nm-xaBtZrZQsYebV6lQwEphK3V2JI-14jof4w9EzmEYwIPvPlfJygA>
    <xmx:n2-xaBSZsKw_miMMu87Jj-CqFQjR6vvKQW4m-OO7GdK0O2jTNJWXAcR4>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 29 Aug 2025 11:15:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options
Message-ID: <aLFvmzxT2Icrf_nf@mail-itl>
References: <20250708135701.119601-1-frediano.ziglio@cloud.com>
 <aLEnVSCil2JtDiFY@mail-itl>
 <e8e3b2c7-39ac-4c3a-a7ff-e2b579f44d2c@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FMrMt6kYOwCZ9Zpx"
Content-Disposition: inline
In-Reply-To: <e8e3b2c7-39ac-4c3a-a7ff-e2b579f44d2c@suse.com>


--FMrMt6kYOwCZ9Zpx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Aug 2025 11:15:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options

On Fri, Aug 29, 2025 at 09:17:31AM +0200, Jan Beulich wrote:
> On 29.08.2025 06:06, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Jul 08, 2025 at 02:56:58PM +0100, Frediano Ziglio wrote:
> >> EFI code path split options from EFI LoadOptions fields in 2
> >> pieces, first EFI options, second Xen options.
> >> "get_argv" function is called first to get the number of arguments
> >> in the LoadOptions, second, after allocating enough space, to
> >> fill some "argc"/"argv" variable. However the first parsing could
> >> be different from second as second is able to detect "--" argument
> >> separator. So it was possible that "argc" was bigger that the "argv"
> >> array leading to potential buffer overflows, in particular
> >> a string like "-- a b c" would lead to buffer overflow in "argv"
> >> resulting in crashes.
> >=20
> > I wouldn't call it "buffer overflow" - the argv array is big enough
> > here. But if there is "--" in cmdline, it has fewer than argc elements
> > initialized. If there is at least one efi option (IOW, "--" is not the
> > first one), the sentinel NULL inserted by get_argv() will prevent
> > reading past the initialized part. But if "--" is the first one, the
> > NULL is inserted into argv[0], which is skipped by the loop in
> > efi_start(). Which makes the loop go beyond initialized part of argv
> > (crash happens even before it goes beyond end of argv allocation).
> >=20
> > So, maybe change it to: bigger than the initialized portion of "argv"
> > array, leading to potential uninitialized pointer dereference, ...?
> >=20
> >> Using EFI shell is possible to pass any kind of string in
> >> LoadOptions.
> >>
> >> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
> >=20
> > Technically, the issue was covered for few months by another issue and
> > got re-exposed by 926e680aadde ("EFI: suppress bogus loader warning").
> > While it fixed one issue, it also made it possible to put sentinel NULL
> > into argv[0] again. But the original EFI code had this issue too, so
> > IMO the Fixes tag is correct.
> >=20
> > While there is convention to put file name as the first option, I don't
> > see anything in the UEFI spec requiring it. So, Xen should not crash
> > when it's missing.
>=20
> Yet if the equivalent of argv[0] is missing from the command line, how
> do we even know whether the first token on the command line is an
> option (or the -- separator)?

I think that assumption of argv[0] presence in LoadOptions was always
buggy... But at this point everybody is adding "placeholder" as the
first argument anyway (which predates EFI code in Xen), so we can very
well continue to require it, at least in this release.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FMrMt6kYOwCZ9Zpx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmixb5sACgkQ24/THMrX
1yyucQf9FdS/6PqoFxe0kRGh6Yg9uKbVpJgy2GDyctgS5QhEO6UaL8UqL6+3787A
6DsIq1p+SQ4CuR5b08gpVH6j0t8oXE4H1Yg1fJccGgoAk1g7ZuS5MEDWjrdLIQ53
0RNcQJvWg80YovED73jqjvM3IJQQLW/F0Qr028XQtbIewjX7fWpYmMmuT6Tv7VLF
j5BUjaZ+NzkkT+8l0qs0ou8QZ8t6IRrqvkEx4NJBUNpb6tdm5k5FezWMzpWGSMby
weM7HYJs8PQPoiakXvaq/T0WKbEAYsSKOajYdXha0hM6IV3hmptmqdN0TSSO/+rM
SZm7KBYXtUZRLhILNOBaemhJWw9H7A==
=GDhZ
-----END PGP SIGNATURE-----

--FMrMt6kYOwCZ9Zpx--

