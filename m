Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01190D644
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 16:56:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743182.1150092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJaFu-0001kJ-B0; Tue, 18 Jun 2024 14:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743182.1150092; Tue, 18 Jun 2024 14:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJaFu-0001hm-7H; Tue, 18 Jun 2024 14:56:18 +0000
Received: by outflank-mailman (input) for mailman id 743182;
 Tue, 18 Jun 2024 14:56:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6aKm=NU=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1sJaFs-0001HG-US
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 14:56:16 +0000
Received: from wfhigh8-smtp.messagingengine.com
 (wfhigh8-smtp.messagingengine.com [64.147.123.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e81a4260-2d82-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 16:56:14 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.west.internal (Postfix) with ESMTP id A785E18000A9;
 Tue, 18 Jun 2024 10:56:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 18 Jun 2024 10:56:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 10:56:10 -0400 (EDT)
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
X-Inumbo-ID: e81a4260-2d82-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718722571; x=1718808971; bh=B/9otjLkie
	tO2fQCE6ReuUJAVy9niNui+hiS7LRBurQ=; b=ZONOJ/lNizyfsswCdIfSk06Gka
	JYd8df2F1ociOHyeR0tytFhnWtKxx1ZPax38WnMEW75xHrR/8Lrbm4qAHL7zAZX/
	UOWjWCGW1NRtC/3FBcXE2zbqv0XHF/bPJgy8B8tuYGkb3+/h1lzJFp8fYFnM8lHE
	NjYd69oq7BI64IvOM8uiaj9knds124i0Zn+OBmAHqnP0jD0hS9S1FzS1PSx5dMlN
	AyU+1EyVFaVo2ykCCCFYJlKthoIjUUs5RTvGS2o5gp98yvjJMd8a7Sr3mEfdlGO3
	nBBg7p2a7+Opcr3R7LOnuuUO0B6PMkcBYhn+TY653F+ay6b4oJBrJY24msyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718722571; x=
	1718808971; bh=B/9otjLkietO2fQCE6ReuUJAVy9niNui+hiS7LRBurQ=; b=q
	aWXfqHpLNarTGwwmrWErHHm7K2stP6oKJiOMZjF/LAXnt3nm+oCj1x+e6bsRPHMG
	9DYlP4/1K7pog+ljiCW8Yu8DKpIJTkY+yRynvwOxO3WJJ8ZRqRoErSNU95gUN5lh
	jHcdbYNT0bCGkk5//NoSZmiZstQP7FhKvuBUCk58MlJCisT8urDdw+ye5CM+hRYE
	8pNipuDRTZzxWkNUS3TeGfMnQRjx8S6lWBMS4VgsHkHb9eKVI1TJGOYN5bavoSpY
	IPYvdgPAmwX1nQFVi+87Kzo/yuUsdoHEpk8i9L6wUYOMrZD57Ets1XUMXJSOhG0a
	LVIYlvXkTQJBMh/+CS72A==
X-ME-Sender: <xms:CqBxZpg1JcepDtk3uRyQMJsbKSfqk95sLaOsAWLcuDLx6-rWEJo9zw>
    <xme:CqBxZuB9FLkLQx2rPlI38AYQhs9mRPIX4LAWsD9cC7NJ5l6dmwkHq8uj4oAR_V-9a
    EVbGfUGHUQgFio>
X-ME-Received: <xmr:CqBxZpEwsXg947WqA4MCeb_0VnmwiKZQBm1xCHnLuhR8Ve_nDQSJigwmOBNMxMGtGAP4FkIJ9vAwm8nMN1eIkTtop5_ztwilnDjFhyM1dzkG_UCl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtgfgjgesthekredttddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudfgieetueeuueeihefhfeetudfh
    iefgteekuedvgfeuhffggeegfedvkeegkeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:CqBxZuRfo13XizYGaJXgEoTmW9jOfh3m-4sYDJz2qfbXg6s64-F1qA>
    <xmx:CqBxZmxwKgH6YfWjGMh-7d2xvU1NS2sCkLcEzd1zXFYlUD7V8qlnkg>
    <xmx:CqBxZk6CiWxAcDV65Tho1DzJf9Y_YXJxmIZxI57_8tmB2NiNoYL1Vw>
    <xmx:CqBxZrwgJPhtTrp3D4Ko_VHI2ztBbVoZ-UZVBOUBSrwYX9r9ktq43w>
    <xmx:C6BxZqdBoB0i4K6tUhUm_JchZ2kqQWYdHvOFn86GBf6URi1M_t_Vty6G>
Feedback-ID: iac594737:Fastmail
Date: Tue, 18 Jun 2024 10:56:09 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Direct Rendering Infrastructure development <dri-devel@lists.freedesktop.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZnGgCawl4RcXA2W9@itl-email>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <ZmwByZnn5vKcVLKI@macbook>
 <Zm-FidjSK3mOieSC@itl-email>
 <Zm_p1QvoZcjQ4gBa@macbook>
 <ZnCglhYlXmRPBZXE@mail-itl>
 <ZnDbaply6KaBUKJb@itl-email>
 <ZnGdJoCtbIrf4-dW@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; x-action=pgp-signed
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnGdJoCtbIrf4-dW@macbook>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Tue, Jun 18, 2024 at 04:43:50PM +0200, Roger Pau Monné wrote:
> On Mon, Jun 17, 2024 at 08:57:14PM -0400, Demi Marie Obenour wrote:
> > Given the recent progress on PVH dom0, is it reasonable to assume that
> > PVH dom0 will be ready in time for R4.3, and that therefore Qubes OS
> > doesn't need to worry about this problem on x86?
> 
> PVH dom0 will only be ready (whatever ready means in your use-case)
> when people test and fix the issues, otherwise it would stay in the
> same limbo it's currently in.
> 
> I guess the main blocker for Qubes is the lack of PCI passthrough
> support in order to test it more aggressively?

I suspect so, though Marek would need to confirm.
- -- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZxoAgACgkQsoi1X/+c
IsH7QhAAjZiGKHUUE62xWcI4bxz/ebW6hS9eMEgRPpd9NSOt2slf5NBdGnKtYj1y
mCE+hpyBS3ZKD+4ERbJ4U6K/MrwXaUHc/gqwnRB+rrrKevP/oy/+mI8z8OPrGSc0
0ZCu3AfNKk5Bohf15IMtiqKkk+tsztLTfjgso7lJ1sK1wobdf8Ps97shdbCrnjlI
QlHIXWtYIJse4UKR1aZ1eZ/dggLKOyye3ukF6OSet8tLWbG258wdhRDwC57So5nI
xZdZayCpbixhFQLxbSy+L5lbEVTaq7Ymkoca33Fhn6kFtxzXv/gBoHz+nZBiqVZG
6fSQrIxr0MgDvQRzEvh90fnIDcAQtqRuvDJvB3jjkHjkQzuWsOpZycJytSEfisCw
//Z/T7DsbE581T9sBCpoZ4a7k89zsnZfT2MK7pypPL+spxtVTK2man6Us8mdEj85
5d+f3MGaoHQBPAbn5eoSWCzJCmdDBHIvMnIrxvvx+ZyD74nv4v8OMfUeMbDK8jz0
Z4LKG+cF0hc9pl/DlewrvP3spuw/a3KyxeKZBPKiZmArxuUbiuarbowauBT+YmgT
KTkWs/hL2VIq2+kX82DckABvroIhDm/YVF4miX4WIJMhoiEE0+zB35Gjyw19QvXr
+WviUWvA3a6icPzCUz2tIZlBabQ3fcgD/+IWVuuDv+7x9Kwy088=
=U2jm
-----END PGP SIGNATURE-----

