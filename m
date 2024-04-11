Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD028A04EA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 02:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703729.1099566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruieO-0005CG-4b; Thu, 11 Apr 2024 00:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703729.1099566; Thu, 11 Apr 2024 00:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruieO-00059k-1s; Thu, 11 Apr 2024 00:50:48 +0000
Received: by outflank-mailman (input) for mailman id 703729;
 Thu, 11 Apr 2024 00:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tv7g=LQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ruieL-00059e-U4
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 00:50:46 +0000
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com
 [103.168.172.151]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84368f53-f79d-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 02:50:40 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.nyi.internal (Postfix) with ESMTP id 18AB9138015A;
 Wed, 10 Apr 2024 20:50:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 10 Apr 2024 20:50:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Apr 2024 20:50:36 -0400 (EDT)
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
X-Inumbo-ID: 84368f53-f79d-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1712796639;
	 x=1712883039; bh=/RJn+hOtsmsXwC2DD2gTMfDo0SfIuuOW4wrb1PeX3X4=; b=
	bvq4VqNR2cKEPNjfZNQUheeifLaMtd1f99ap6UCUMMSwHH7o7jGTUcKboGCYJaek
	2WX66QQfrfkY6AXLA03yEMONTddNcNNcMilkz9TGGhMg0gfY38vBZ5PX6fNsgfTt
	95rwBafVxWXWES9eOgHErAO+yGUqh122CZEMrhlN4rZWx/ar7a1XfZIDAN35UJm5
	pHp7K6H5KOt7OmreZPS9/HxtonwcX/qVkfgbygKK9u2SZcUsJPHF4fq6GHMFc73Q
	1VP79Fyasesxf2kfRV5++zO4AFjK1l4PfT2iI5x3/1oHNbhKe5BC6hmHhhk0P55M
	C/hDQkDQapZWxzBhvSrZnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712796639; x=1712883039; bh=/RJn+hOtsmsXwC2DD2gTMfDo0SfI
	uuOW4wrb1PeX3X4=; b=p5nUL/Hl1zTGLqzgUSoBbS41NIZ0J5S8cGWijnnBHhZw
	DoJ8IsVjSd0CD3CPgl02DFAeObepaSR2Ao/d5/OMkFuagJoFvDo0/cOhFOY0igMt
	FhbqDiahsf5M/M1YSgjSjZmTYJYUXuLJUuoLwsrKdyg7I+kfnKIkQXK0GPwgXxz8
	xh9oQ7DS0hM8Ek2ibQL7/WfPzbniYVLWrQMlOF3d2GDH8o1JEE0l1J/tsN4RrOSq
	BG9ZK/en1HDR+HK0EaVHNo1UXXBf9nTeXXozfGn3EBoWf8tILTTRdE9wUBPVXcAD
	VY6yfVauBf+NF4MAO7PpjCj6JjiTKRecK/Ufy85BLQ==
X-ME-Sender: <xms:3jMXZvRqnEdUewFEIyboaSYkC5Umo3KweNz64qWOrtwAKkSW0hzY9w>
    <xme:3jMXZgzeln7_KESdI63UWbz1ibttc5lHLEAYulsqsAumeMrQw5GzEWmsJJLxgkzMg
    q9nCxlKuu_L2A>
X-ME-Received: <xmr:3jMXZk2rK4Ryz3W_0VDybDVsJPUAWV0hHyiUcgGK012g-sDK5e8nFeMurBYT8Nw0xyeNtd56_BAGE4E4YdsX9mIITtTAlH7sAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehjedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:3jMXZvCJXnjURfp5aQOBg5D-HE_-zVuhq8RJKW-APAcuU82rJnECjA>
    <xmx:3jMXZogfsrXi1OAVTRLEdFpojCHN9vHI3swi_2Dr_X66DCFxBW-7Cg>
    <xmx:3jMXZjo5cud2jJqFumsHmm5tTTlo3_-KSqw26Q8hlCyBIGGDp3xtrw>
    <xmx:3jMXZjgLIqt-1JBWnMIx8wFT9VOQlMCD55ckeZPQgPnHGEwJmok_Eg>
    <xmx:3zMXZkgD5GG0L7j0zOR-VbDd0nt2pInW2zI_Jxu8XmNwqI3XdQqFZ_NF>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 11 Apr 2024 02:50:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrei Semenov <andrei.semenov@vates.fr>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 0/2] Starting AMD SEV work
Message-ID: <Zhcz2d4JsAl4J6vG@mail-itl>
References: <cover.1712759753.git.andrei.semenov@vates.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tyDnHw+PVSMXISWv"
Content-Disposition: inline
In-Reply-To: <cover.1712759753.git.andrei.semenov@vates.fr>


--tyDnHw+PVSMXISWv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Apr 2024 02:50:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrei Semenov <andrei.semenov@vates.fr>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 0/2] Starting AMD SEV work

On Wed, Apr 10, 2024 at 05:36:34PM +0200, Andrei Semenov wrote:
> This patch series initiate work on AMD SEV technology implementation in X=
en.
> SEV stands for "Secure Encrypted Virtualization" and allows the memory co=
ntents
> of a VM to be encrypted with a key unique to this VM. In this way the nei=
ther
> other VMs nor hypervisor can't read the memory content of this "encrypted"
> VM.
>=20
> In order to create and to run such a VM different layers of software must
> interact (bascally Xen hypevisor, Xen toolstack in dom0 and the encrypted=
 VM
> itself).
>=20
> In this work we start with discovering and enabling SEV feature on the pl=
atform.
> The second patch ports AMD Secure Processor driver on Xen. This AMD Secure
> Processor device (a.k.a PSP) is the way the different software layers int=
eract
> with AMD firmware/hardware to manage and run the encrypted VM.

How will that interact with the PSP driver in dom0? AFAIK amdgpu driver
uses PSP for loading the GPU firmware. Does it mean one need to choose
either GPU in dom0 or encrypted VMs, or is it going to work somehow
together?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--tyDnHw+PVSMXISWv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYXM9kACgkQ24/THMrX
1yyDfwf+LdVXgFvcyKWEengkx8hBAVIq6TaAMOjdtH4J8jvJPvtFSQxfWA/4ZDvX
xPFOXXGXw4T6e01yhAmT4QyVKdHqDYNnedLhq5wKJiGGfOIMEAOKhXPRAfpO1TAv
IUU6I7zY+NKCA3aC9WVARjJQWOvkxbYVZJOmJkhFCM8NbcA/dkYQAiTMJy8VrAsc
P8D/NnBxbkJn4VNPBWJn1OipRRaa6hO0xDShOMlaDaoMZS96u3QTe/ILibS4bspn
FeUjjPOKibV6HaJRGChzV5Q7293+fvKOA9s4sSom9xnBOMKZZlSr1eV1RTJHwx2K
rf0grhxBJC8HZNsMJbiYrPgLbpZORA==
=CfPI
-----END PGP SIGNATURE-----

--tyDnHw+PVSMXISWv--

