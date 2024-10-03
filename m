Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4FA98EE55
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 13:41:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809286.1221538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKCL-0006Ul-6k; Thu, 03 Oct 2024 11:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809286.1221538; Thu, 03 Oct 2024 11:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKCL-0006SE-3r; Thu, 03 Oct 2024 11:40:45 +0000
Received: by outflank-mailman (input) for mailman id 809286;
 Thu, 03 Oct 2024 11:40:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GA31=Q7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1swKCJ-0006S6-Nb
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 11:40:43 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 515f2c64-817c-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 13:40:42 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id AF8E313806D2;
 Thu,  3 Oct 2024 07:40:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Thu, 03 Oct 2024 07:40:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Oct 2024 07:40:39 -0400 (EDT)
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
X-Inumbo-ID: 515f2c64-817c-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1727955640;
	 x=1728042040; bh=xG20NjcVO4rcv6jSVtAuY6g7/e6Vlyy3h5EY7X6r7Lk=; b=
	hop7VhJgUiBNhl8pI/wYd2fWqvmiXEtjDPjHyIgqQAJ68ybCLJBnuMT8nBRf9cAe
	lYkVCieg1T5fkqM+o8MY0b8HI0wpT13r1ykOXjXHU0/v0izpptj8/rF251opg6F4
	916UoOph+JA6MknOBUgL7IZ+5Ak/7062i8t/UnYBJU28PnwLQav3DJNsjwtuaxkx
	76UexyGfsnaujujhNEl8Y4xNUQ9XGBnDvpgARYkYTqcHtH8fd1sedjlHYC6sT+28
	lKrWbmxSXa2DQMAqSRKc8Z57VuFE64uDvwwfi+5ufac/dSvK9kvzYoarxIEfbica
	ahZ5Irwi0JW8xT2x5RDQkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727955640; x=1728042040; bh=xG20NjcVO4rcv6jSVtAuY6g7/e6V
	lyy3h5EY7X6r7Lk=; b=dl7eIrpZH1iZ7uGh14inif29TBgsL+00v9ukK51ADoMc
	fzKmqETpcddwWIDe/qFyGh/pqfdQ8/ACWCb9lnyyYS/K8pChN+RKRsxi0kK9CaMC
	8GF6K//jt3+vxQ+odMVv1TYhxVf7M5BEQUCJcc4/WbtkD62J5nOmK/1SyJxuBOL2
	R5INF2/8wouMzJc5GUmmZC6PyUMsPb9jWXYVDXJuPrvImLUvBs434J30VjJo+uGw
	jmYMMPx7JgnY/Fiw+wEd30iGTSJ/pk3BmejqWC+ILLqAN30i2pmo34o0v9cB5Igl
	HAmcrHXnllTeQXSdMOyHLGWQie+E0sa++Ttnn1aYxA==
X-ME-Sender: <xms:uIL-ZtX0GmUQTs1F1cu8RI77X3UNqKrsc9Viv_mANfRqCjnL404Jdg>
    <xme:uIL-Ztm4w_a1b21wcvnzwaEo4aq9Fw-ATkQvBfHjGYM90wG6j9G2aRv11yVjgxt-3
    HMOxg8TcwCNhw>
X-ME-Received: <xmr:uIL-ZpYC1XZ799Cnz6lwrzYXdjK8oEdo7TLh7ei6Uj7Go2QoOGZd0vQVkXCqIb1jiMPVk3LWEQG_i8WuSJIfIN2viOEB3ysMbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvuddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughpshhm
    ihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepfhhrvg
    guihgrnhhordiiihhglhhiohestghlohhuugdrtghomhdprhgtphhtthhopeigvghnqdgu
    vghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehjsg
    gvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgv
    rhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrh
    higidrtghomh
X-ME-Proxy: <xmx:uIL-ZgVKMLT76DFFo6RaLuolRwat4GV5Ji7NvYBNWQH1gVq7l3ou5A>
    <xmx:uIL-ZnnG7-nPfppaS5OPoMuyXcKQ6QkA5zo1ptKKlsQ6l5Lp-JbWeQ>
    <xmx:uIL-ZtfT2m2fxMMwXV_JUy_Z79F0Adr70k-IwU2P46Lq0ppO7heBZQ>
    <xmx:uIL-ZhHuUI-7cTTz3J1O9KuX5qubIUi79JMuSZHsb0_2R3P4TJ3W7g>
    <xmx:uIL-ZiusEfwOqLCxIMj2EvTBjBTyPXF3erPXw-H2DnqFcP3qWIUxW2Xm>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 3 Oct 2024 13:40:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 1/2] x86/boot: Rewrite EFI/MBI2 code partly in C
Message-ID: <Zv6CtSPdVqkJHQLT@mail-itl>
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
 <20241001102239.2609631-2-frediano.ziglio@cloud.com>
 <1adbaea9-40b8-4cec-9871-599fde168925@apertussolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zq/RxTqbHHnc81SR"
Content-Disposition: inline
In-Reply-To: <1adbaea9-40b8-4cec-9871-599fde168925@apertussolutions.com>


--zq/RxTqbHHnc81SR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 3 Oct 2024 13:40:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 1/2] x86/boot: Rewrite EFI/MBI2 code partly in C

On Wed, Oct 02, 2024 at 10:31:50AM -0400, Daniel P. Smith wrote:
> On 10/1/24 06:22, Frediano Ziglio wrote:
> > No need to have it coded in assembly.
> > Declare efi_multiboot2 in a new header to reuse between implementations
> > and caller.
> >=20
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>=20
> I unfortunately do not have time to test this myself, but I have given a
> read through and it looks good to me. I will give it an R-b and let Marek
> provide the A-b when he is comfortable that CI failure is an artifact of =
the
> test system and not this series.
>=20
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Since it seems it's only the other patch causing issues, for this one:

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zq/RxTqbHHnc81SR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmb+grUACgkQ24/THMrX
1yxo4wf+NTP3LJ5nteM2M3SZ2Vsc5p0AphHpTJYcEuNcz/bCn8bjFQTbjTm6guaF
1IDR8qx924+Ej6cxnCVM0lauC2PATNb9fzH/6LwnkltRlEsggHJ8wMw2E3M546WE
jG/kOsDgR3JtrcUzGKuVECGZ/BEWIw8PU2id94+re3QQQsqaneTI3yYR3VDLCnyf
I/oLK3wGBeh6Zst8QeNSGkzKWIa5CibsEqu7pXnTbdhfC+H9/t+HZwdE6E8dSTf4
uuRWNdEp17aYG4uMinhQOdTXdnQiQp2aezfdYpbZGvH8jvCkwIjd4LyZiitTeE+X
HX6vLCGNRsl8eS/lAQCgTAJPIw34eQ==
=WUW8
-----END PGP SIGNATURE-----

--zq/RxTqbHHnc81SR--

