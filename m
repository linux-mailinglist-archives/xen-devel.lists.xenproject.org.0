Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B073F6C8F3F
	for <lists+xen-devel@lfdr.de>; Sat, 25 Mar 2023 16:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514725.797182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pg6FB-0003d0-9F; Sat, 25 Mar 2023 15:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514725.797182; Sat, 25 Mar 2023 15:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pg6FB-0003Zv-6Z; Sat, 25 Mar 2023 15:55:49 +0000
Received: by outflank-mailman (input) for mailman id 514725;
 Sat, 25 Mar 2023 15:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnWc=7R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pg6F8-0003Zp-NU
 for xen-devel@lists.xenproject.org; Sat, 25 Mar 2023 15:55:47 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c334720-cb25-11ed-b464-930f4c7d94ae;
 Sat, 25 Mar 2023 16:55:40 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0A4AF32009C3;
 Sat, 25 Mar 2023 11:55:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 25 Mar 2023 11:55:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Mar 2023 11:55:34 -0400 (EDT)
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
X-Inumbo-ID: 7c334720-cb25-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1679759735; x=1679846135; bh=+u9OnBdy66/ZaXBpi+LI2yIwEzTYc3OQGud
	8fPIZtVg=; b=H9QQx401178YTjsIxOE9NKuU8GHvwav0eN3HCqwP2XSHrkQN5HP
	zKtYFYfkulIYMml/4nKf4lX3qKnZe/x1b/UtRERkdEh4pflCRQ4YkNfWUvE+IP8D
	5k5LoNy00JsxPpXuqj1zgs7L38aZgIzBdsKMYCbPbwTvU31uniMigVQdDrPBzdtP
	mvj5wWMocjAr2R5fr0yinf9tnfYIrQeN9jSNuapwhM1CHDQtYXWH9NXH/H/zAF9F
	jYEijyanxwZwHcDIhZFzikfmJKrMy0FuTjf02ZEX5fYlVS+nmfcMKODQPUhqty5/
	JsYYlr7fj9IcNBj5nYDKxPqUTdyeKvFKnaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679759735; x=1679846135; bh=+u9OnBdy66/Za
	XBpi+LI2yIwEzTYc3OQGud8fPIZtVg=; b=Sx58D0pmCynsXmMTU7nkI4qZ0NQei
	mBd8/sDjI1LwIiScZ7nmoMi1bHEi21lUD5dXJxVTZN70gU+EJk71DrgDaX+hSb3D
	p8cArqU6zsbBV8a6bmFbe4jwTXHGVtS1vg7bGpDlK+aLhD2uic0dnWtkdX/1kMgl
	Fw+zU6Cmff4+4ZyjEe2SUr0AluHF/zfPbX8PhPLs0kI4BH11Rs55rlFI1q1lztXe
	vu31VB9mxQRl3VwBPnJk7rZiOJyhMuKQ8SFg+TWjs9M2WLAZMbj3iwnbDEEM3+MW
	VmB7c5j56K37v4ot6eEY7MEMynnCxw/42tXx3kZZsRtB5lAK1se6SWYfA==
X-ME-Sender: <xms:dxkfZPSu6uWDgVGNEyCa-xkoTlhk5jTI-x-Rd3PSz6C0oYOghQI4Hw>
    <xme:dxkfZAzSAeegXlnxqpz8fMc5HkCdhKF5Y_pQEV9Dpi1akoCJugHE17ER4dyHWeeJc
    WnbC_lTWpwpHQ>
X-ME-Received: <xmr:dxkfZE2P7QAvQdf0qd3pV8ShoYNlnpj3YZV3PuV5JrU3w9hQPXHnH7oiXuV6hzwj0mq1YG_KQVN70fKXc8fzMSrSXQ6bmWMHr_k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegkedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:dxkfZPCdxPm9cy8IyqFLQXQd9MpIAqKvRGyXzlwX28qB3JAbhgfLww>
    <xmx:dxkfZIijIPTryACzILybOerAsFi0J8aLyZXz-7BNmdU6a4dQp3wxmw>
    <xmx:dxkfZDptGHeTybDMG_qsAz4PCyqFUiFbYx02bG7W4oKxT_q77vtLAg>
    <xmx:dxkfZAJpDlx-BylTBN4wgUkdC7_LFBvcbTN6ZAsWAkmzqCYGsnt7iA>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 25 Mar 2023 16:55:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/2] automation: build 6.1.19 kernel for x86-64 dom0
Message-ID: <ZB8Zcwhj+eszsHfu@mail-itl>
References: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com>
 <59ced41c97daac93abe4a2794af289d59808f0ac.1679023966.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2303171436360.3359@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9maCnZNt4GeewPXO"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303171436360.3359@ubuntu-linux-20-04-desktop>


--9maCnZNt4GeewPXO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Mar 2023 16:55:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/2] automation: build 6.1.19 kernel for x86-64 dom0

On Fri, Mar 17, 2023 at 03:01:14PM -0700, Stefano Stabellini wrote:
> On Fri, 17 Mar 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > It will be used in tests added in subsequent patches.
> > Enable config options needed for those tests.
>=20
> Thanks for the patch! Looks great.
>=20
> Can you also remove the old 5.10.74 Dockerfile
> (automation/tests-artifacts/kernel/5.10.74.dockerfile), the
> kernel-5.10.74-export job as well and replace kernel-5.10.74-export with
> kernel-6.1.19-export as dependency for the qemu-alpine-x86_64-gcc test
> job?
>=20
> I think it makes sense to just keep kernel-6.1.19-export. I tested the
> below already and it works fine.

I'll adjust this patch as suggested, but generally, I think it's worth
keeping some tests on older kernel to detect regressions (for example in
API not used anymore by newer kernels). That said, it's probably more
beneficial to "simply" test specific older (but still supported)
distribution [kernel], not a custom build of an older version. And
adding that would be a separate patch.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9maCnZNt4GeewPXO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQfGXMACgkQ24/THMrX
1yx3Nwf/Y9u7DEhfld6Kpe5MJseHmC6jOZFScvI38qPMJPvW5EzqGgbkTa1qTDmr
dCPWNK8HzVbDfxH8FbcriLZHZFNaYBH1CkqTvKTq+O/RmL9ZywZurraWzA2UefyI
wLM10UOphsBfgS44o3XHO6FT0gYbZ7yXpbOxNAcyB9vFHj4IcF+LM/ACnC8YOcdl
Gj09q77ngalvv8tAa3s704NP1CkfNuP1vV2zNGd2smGZRLlOBs9uADs8ZADTbzCp
JieO8xi+V4lR/A7DQFDUwGlwX53fLxryG0QXw+yGkEqrpm5cMBhb43oFCdh3gbJN
+6WUiVZkX9zjlEOoq3Cv1LXs5Gl3Ng==
=J3DD
-----END PGP SIGNATURE-----

--9maCnZNt4GeewPXO--

