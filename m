Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D119A6B28
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 15:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823536.1237541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2sri-00042D-EQ; Mon, 21 Oct 2024 13:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823536.1237541; Mon, 21 Oct 2024 13:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2sri-0003z2-BD; Mon, 21 Oct 2024 13:54:34 +0000
Received: by outflank-mailman (input) for mailman id 823536;
 Mon, 21 Oct 2024 13:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kyLN=RR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t2srg-0003yt-F7
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 13:54:32 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd0b81b8-8fb3-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 15:54:28 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 52CE913806CA;
 Mon, 21 Oct 2024 09:54:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Mon, 21 Oct 2024 09:54:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Oct 2024 09:54:25 -0400 (EDT)
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
X-Inumbo-ID: fd0b81b8-8fb3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729518867;
	 x=1729605267; bh=OVvohps445LY4Ocyxh36b8xLuT44vmvyNSU/Hs8Em14=; b=
	W2BL4VaFqzY1jPg43V6mlfO+9HAx9/obBgwHECrt0Jjjn1b9nIXceIuDPSjEJbe0
	4m2TqD55lr/bGAtipUDxGXMG4BtW90818gi9UbHKn8hAsTqu0OWvLMwMGNclr0ve
	/AkB/QDzNFUvK1ckq9VDvFtjThtJKVFzjZeV3VRRexCqIPS/V0C3I10DbMSQf8JT
	BXzdFvnBhVpT7aGbPz46fjB/Elw213uOjcDnSysIQm7HM8j4+0uqQ4f/dYIf5Jl7
	yJGEgBCXA9aYSENriayHE0PXDMvrUpQzpR6yNfZhkzgl07M5A9zWRGIsQQORYdiL
	PDrLzJnppThTsIdXJrh+Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729518867; x=1729605267; bh=OVvohps445LY4Ocyxh36b8xLuT44
	vmvyNSU/Hs8Em14=; b=E3kSlB3qb9v/k3hNmVfFwoIrERpmqSWAflyBZ3Thy0K5
	BuQ4SC8uAZBdx9r0fneAzZDjC4FT0BCqswUShq//QSYfCMhkIK6ZXpAgzwCsxww4
	4mlu+xexuVpdA/ikWzFb8h7t2t6Dh6N381wubcPyo4k6taDr1HPUEC7qBKCcm+66
	ToSQYsv3zT7JQ+Hd/ZSujKaHLaNbTL6k8Ovkbdf4YEEGwtEonBaJza0osT5dLrQC
	ORP9impNZQG0+M+HCX0sr6q9HYurDD+s9QbE+3D/4VhOKC1yiPN9y+rqIUxT90gy
	1oWwlDRDOFiq9HAaUFXHaCoU+XY96zaW5iHvMhZGUA==
X-ME-Sender: <xms:El0WZ4zF-4c7Y5DoRi6hpFZCUJclT2uKQVilUvI5_qbgr3vZ5OEsHg>
    <xme:El0WZ8QAtebSMyXk4j8Y8svkJb0WQzkoO9DEZ7PbMWGYfgZhnf8AWj-G016hzIucg
    Yohvl5wT2I13Q>
X-ME-Received: <xmr:El0WZ6XD0X1UpMGiutbSk8uSaCNmJyMbI0DQzb045cybWkuj7cnTZPwcFmdmm8mdtWrLtA3L0DOeSTj-ASilzQZEGuqRxrMhCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughr
    vgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvg
    hvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehjsggv
    uhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghith
    hrihigrdgtohhmpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluhht
    ihhonhhsrdgtohhm
X-ME-Proxy: <xmx:El0WZ2j3Fb8aJbvx84NcHZuF-JJKOEgzmkubumNgjRIliHOxssEISg>
    <xmx:El0WZ6CLxZjkbsN0GbjJBilRzlm8TgDWSDriU69l-3kDirsL32OXvQ>
    <xmx:El0WZ3LP9H_EBT-ItuOoucpquKGSVCubSUqc62S76LrpilebmQIBhg>
    <xmx:El0WZxBRUvmeewkKNxW6A5b3DMz55aF3zxNPo7DBbg8DuX1lL9UGZw>
    <xmx:E10WZ9_xNkBhw5wqsvz58QG9QuE9cd2NwNFJ4MgF-zRo4fsZoJ_BonxZ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 21 Oct 2024 15:54:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86/boot: Fix PVH boot following the start of the
 MBI->BI conversion
Message-ID: <ZxZdD-LtTZo4qTzk@mail-itl>
References: <20241019182054.3842879-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RVHBqWdD+4k30F0s"
Content-Disposition: inline
In-Reply-To: <20241019182054.3842879-1-andrew.cooper3@citrix.com>


--RVHBqWdD+4k30F0s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Oct 2024 15:54:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86/boot: Fix PVH boot following the start of the
 MBI->BI conversion

On Sat, Oct 19, 2024 at 07:20:54PM +0100, Andrew Cooper wrote:
> pvh_init() sets up the mbi pointer, but leaves mbi_p at 0.  This isn't
> compatbile with multiboot_fill_boot_info() starting from the physical add=
ress,
> in order to remove the use of the mbi pointer.
>=20
> Fixes: 038826b61e85 ("x86/boot: move x86 boot module counting into a new =
boot_info struct")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>=20
> This is a testiment to how tangled the boot code really is.

Did it causes crash in some boot configuration? If so, did some test
tripped on this (from what I see, not a gitlab one)?

> ---
>  xen/arch/x86/setup.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 6746ed8cced6..bfede5064e8c 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1048,6 +1048,7 @@ void asmlinkage __init noreturn __start_xen(unsigne=
d long mbi_p)
>      {
>          ASSERT(mbi_p =3D=3D 0);
>          pvh_init(&mbi, &mod);
> +        mbi_p =3D __pa(mbi);
>      }
>      else
>      {
>=20
> base-commit: e9f227685e7204cb2293576ee5b745b828cb3cd7
> --=20
> 2.39.5
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--RVHBqWdD+4k30F0s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcWXQ8ACgkQ24/THMrX
1yzMogf9FH69iDN/aInhRMer0ef0mpKLmGPw4JJgDFygBPHeIyvQ/uJ/5CunKbVu
nBG58wcG6WyJ1LTsMQ95kH+2OxVyXr2RB5UAvDPw0XqE5Ox4SivsTsDIJ96tyB8d
B6LYn0sp+ODdsvnDDJ+NYH4WUNklQC2Sex3iK38RrpAs51BeS7nJjyXBaLR1jalK
d1zH8QX0Z2MIivwQqbhLw9mGwIjsB8mq7aDR+nPv+nmy/A5cKI6V3sf0S3tdxRLn
xDFlxSrsLLxvlRBBiQ+80LGHfp9mlJBfw8YLJXmnyUHxPTASwqa+cgmRrOT59nCB
Q0/mNNdyfKfHLWVrPCpevZ6VO16LlQ==
=LX1G
-----END PGP SIGNATURE-----

--RVHBqWdD+4k30F0s--

