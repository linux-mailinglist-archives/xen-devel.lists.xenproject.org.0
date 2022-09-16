Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDAE5BA9B1
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 11:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407885.650546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ82E-0005y5-3V; Fri, 16 Sep 2022 09:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407885.650546; Fri, 16 Sep 2022 09:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ82E-0005vu-0j; Fri, 16 Sep 2022 09:53:22 +0000
Received: by outflank-mailman (input) for mailman id 407885;
 Fri, 16 Sep 2022 09:53:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEU6=ZT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oZ82B-0005vo-Vg
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 09:53:20 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63c165ad-35a5-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 11:53:18 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6E2175C0242;
 Fri, 16 Sep 2022 05:53:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 16 Sep 2022 05:53:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 05:53:16 -0400 (EDT)
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
X-Inumbo-ID: 63c165ad-35a5-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663321997; x=
	1663408397; bh=3F5EhWcHZGFfFUAN3hVCv5Ci58w5HvyJL3q5jf9bKcw=; b=a
	rHg1GKjglLpaLViwNqQukHR8Vw90Ww4qqIL4s8VzSQ9+rFuKYBQuqw7rgkS55m8A
	CmUlqVmfAi01nMtM+dEF/Cz8mUNx6T9nUPbIhCa5EEhPYlFHwQBCCny9epuAYKp+
	xYRX2yLlzB5OoNI/NpDUTeLjNzPx8d9JOTGMcfFFSUHvI1qfTIFOM28Y1aThIOqH
	49fzyBF+k6xtfuJ0POlX+sQ8/qTeBbyoiOmCUM8+MweGipPbqUxf1+h4ZlfXe5E1
	Ra40ia8Hj49es0cg5PCOzqUECOoT7EMkR+OLUxAt9zL50UbUuVYggp/JMp82dVqN
	0KwuKEziv3nPrKkt3E6aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663321997; x=1663408397; bh=3F5EhWcHZGFfFUAN3hVCv5Ci58w5
	HvyJL3q5jf9bKcw=; b=h9iTEpI7S9j0fpubzXRhn/UYM9i823ktxapnHZFCepNR
	k/QHctE4KTuPyPJ3PpOXvfbvmBE9x8ptR9lerRNoaZQsD6hJ9gJlfEFWGBh7qr6p
	SVpKrvEoVFBXvfjjR/XeJcX3qpsgsvIZ2ONpdbvr8MHVlt79RBfgKoqFQ0l/XtuR
	i0OaCnkg0mcSPC5ADbqb+1Gadx14fmhmVO8fH9RrLENi0m0K0BypOBP+fAJwOO7R
	GvOqhM13cArA5vpG+xLNY5X25cFg/GB8+lb8BVcwGdd7srH+LcgTKCYEOV2iqR4M
	WL6ay/9vFweXM4bmAhvu6bQBRVwS/xPgjwrdudbN+w==
X-ME-Sender: <xms:jUckY4QoH6IsN-mAv4L_i2yZYn3Shl27SaDGPYvDuD08dzqwE5UXYg>
    <xme:jUckY1z0UB-HjF6QyXk7G89gUM4iB5seNSDijG0CUONuhngaq9RswBqxmOIYjctNl
    PlzDKRF5YPJoQ>
X-ME-Received: <xmr:jUckY10LMxXFDDB68K-SGGlAK4_aPlqgg0rXAYMgyKtOaSJ3nOuVSC9od9LqAXR07PUaPfJ6w8mY7_LgCHOWWcnC6QdgKicJfLyH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvtddgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:jUckY8DQkEdb-3SOoooM-jxV1L6YHf9yFi7MURLUF2JNVvFBlSCQpw>
    <xmx:jUckYxgmecFXaPpLnsYmYNepaz4lV5X0zPvgtx6uq86cBIzn9E2IqA>
    <xmx:jUckY4pk1aftyEsmThUWjwLVnQskU3Lzk16mhEcIzJLxzH-X71LoTw>
    <xmx:jUckYxJXYf-JnXm3vrcHgV0lLIbF-We3Ytvb49avQMou9kJcm-rYkQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 16 Sep 2022 11:53:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Default reboot method (was: Re: Console output stops on dbgp=xhci)
Message-ID: <YyRHiV/HHisshYJl@mail-itl>
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
 <YyJOWDWYVpShtAU9@mail-itl>
 <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
 <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com>
 <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
 <7adee56c-607e-7d3f-8aa6-1ee5b2fdd133@suse.com>
 <CABfawh=y_ACt-YAOOxiLVQoHGJZ_K8Axt4TyXMAaRpT9cYmJyA@mail.gmail.com>
 <6bd99d37-f9e6-647a-6e2d-d774fcd597a3@suse.com>
 <CABfawh=si40W3foBq_W0nZ_NVXxPyeT02c0+L9k70LwsP=jjsA@mail.gmail.com>
 <2697981f-8ae2-d3e7-1a6a-046927a66246@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YljcGCVhqb5A4CCT"
Content-Disposition: inline
In-Reply-To: <2697981f-8ae2-d3e7-1a6a-046927a66246@suse.com>


--YljcGCVhqb5A4CCT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Sep 2022 11:53:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Default reboot method (was: Re: Console output stops on dbgp=xhci)

On Fri, Sep 16, 2022 at 07:57:59AM +0200, Jan Beulich wrote:
> ... this leads to the crash, which effectively tells us that this is
> likely yet another system where one needs to override the reboot
> method (e.g. reboot=3Dacpi).

At least Linux, but also XenServer uses reboot=3Dacpi by default (even on
EFI systems), can we make it default in upstream Xen? Issues with
reboot=3Defi are rather common, while reboot=3Dacpi just works.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YljcGCVhqb5A4CCT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMkR4kACgkQ24/THMrX
1yytjgf/Q/qM4DVc+onkvsdHr1r9uzPSogSytyocsyaIJAu+RG+AmSB6uV9jNax0
ctEmU/Xtjz+pry9/9bsqVPLmBTV1T7Npgdlp3dqzERV8XK+D2IEbaFmWeV85Ffjq
tBVbKrz3kMmJZte+XR1Nu5CeWKjxY7kv114ABl6ZLeGSDWHA3gMi60waT0o/h3b4
FT5vWJyBU10gETs8xJJTII4Y0r/1zJfx6JSL5BNbt6VMNI881SNt6tQ9G4L+J4xz
FVsoLiVH5Bsqu5atnSy26ymHKHccl3a8FMnjClwVQjFmO0kt3gQl9yKT+9yIycWK
ONq7WwApJtJoXJxt70G3tRIvKRChyg==
=ObnP
-----END PGP SIGNATURE-----

--YljcGCVhqb5A4CCT--

