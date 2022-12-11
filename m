Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD82A649254
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 05:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458757.716564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4E2s-0004Bt-Gf; Sun, 11 Dec 2022 04:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458757.716564; Sun, 11 Dec 2022 04:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4E2s-00049N-E2; Sun, 11 Dec 2022 04:34:34 +0000
Received: by outflank-mailman (input) for mailman id 458757;
 Sun, 11 Dec 2022 04:34:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=97oD=4J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p4E2q-00049H-CM
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 04:34:32 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 196c47dd-790d-11ed-8fd2-01056ac49cbb;
 Sun, 11 Dec 2022 05:34:30 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C57A5C00A4;
 Sat, 10 Dec 2022 23:34:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 10 Dec 2022 23:34:28 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Dec 2022 23:34:27 -0500 (EST)
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
X-Inumbo-ID: 196c47dd-790d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670733268; x=
	1670819668; bh=chhYKh/CMMmsyYSQfasACEtZAA6+Sia57vZRrvVicoQ=; b=o
	QLrIjW5plTAFvPDbxLd7DJsR9m/tqfmadK2+JlvLylx4/xrkmk+C6avpcsGDKlB0
	y2OI6N2ahUaNKrORD1fBPXGsRKgCfaM2PnMlquZusySxbp+txpU/7sKGaYoc9CvA
	Cu9K4/lfKfDWn6rwjSojyOKGS0OY8YToOhmVcPwex18HpQMKzVdcMuTt6iIXzDm8
	i9kxv4aaSTxMQVm4OC5kGyhRXB4H5L/ZeaxSUF+5H+ER38HwyUzL9X4AWDJhhm3x
	KJBSfiuep1Y2sSD4NzgKL7HhIb3cvyzcrUrcyQbSDC8100awdn0WcchXx5K98Z/q
	6ky51c1HrXo/F5sGVJsiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670733268; x=1670819668; bh=chhYKh/CMMmsyYSQfasACEtZAA6+
	Sia57vZRrvVicoQ=; b=jO2fW3DDHsTllT3fn5xXl+xwPvHB81nQt3kGjmvgzYR7
	+/NLoPA4zswzGevhPFvZV3XZ0GsYdYGSiphB6i4/N+q5JRJriRemSUO8eIMtQe3b
	7fjjAVE6apgR0JjtxZEQXkuGYLXGofBWKqXE5pNFMIxhIqYXCJnBwvnst+hNf4qj
	X3dwCz/XC6/yC+Jza4vQtnypUhwzVp7lofPIdCZhp5GbkTRYTMDCqDN6nENxdGb6
	XAXDH0MYRHAlq1HoRx6tWrWw51U21zMUmr7vx5TKUWJlN4SqyNTOBZiJSZQY27Da
	C7JpPEL51uHgSxY+ULKMXSEEK9QPZDCscUQ6gLLFuw==
X-ME-Sender: <xms:1F2VY2t5kKxTTLcAM2fFh1xgZVV3mUIpbRWwaOdEHuuUlsJG4ND1vw>
    <xme:1F2VY7fwM0fD1vUr3r-skSZoQb6QeC7jyh5uXkyuQq5Hr3P4dRyXyJZYjHPo7JLjb
    -NEa_Zc11JdDw>
X-ME-Received: <xmr:1F2VYxxAdo3K66LMjY1jkPVSJaHGlNGmcHuJml8Dgh2m2_a1HeYFnEamvY-8ZJ7JNZbbX7a2hbt1Q1Ex0Xj6v3SFWV53PJCkXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeukeet
    teeggffgkeduheetgeeileejjeeiiefhjeegvefhtefggfetueetteeuteenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:1F2VYxPgpR9nIGChrJ2G4WsTQm0hWxutYOgXw5KlEZN8Y0LVbivhSg>
    <xmx:1F2VY28-uciQwWxvxPI0AZ6xQ8CbZlY5SVyg4JxrWT52uHcMFTl8mQ>
    <xmx:1F2VY5XrMTbcY7vTDFDr2jOLnuSMe3YmAVIMkqU62FRZtfRW1rzYBA>
    <xmx:1F2VY7HEaH5eiB012xPbSZR9WTIJssAsYLntGN6gs6_9hoG2XsOQNg>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 11 Dec 2022 05:34:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Linux 6.0.8 generates L1TF-vulnerable PTE if Xen's PAT is
 modified
Message-ID: <Y5Vd0Oqu1J7Z0j4R@mail-itl>
References: <Y5OBOHd7hFGR+4GT@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nud4phUDaN+ZKygB"
Content-Disposition: inline
In-Reply-To: <Y5OBOHd7hFGR+4GT@itl-email>


--Nud4phUDaN+ZKygB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Dec 2022 05:34:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Linux 6.0.8 generates L1TF-vulnerable PTE if Xen's PAT is
 modified

On Fri, Dec 09, 2022 at 01:40:53PM -0500, Demi Marie Obenour wrote:
> If Xen is patched to use the same PAT Linux does, it appears to break
> L1TF mitigations in PV Linux 6.0.8.  Linux 5.15.81 works fine.  The
> symptom is that Linux fails to boot, with Xen complaining about an
> L1TF-vulnerable PTE with shadow paging disabled.
>=20
> Details are at https://github.com/QubesOS/qubes-issues/issues/7935.

Call trace:

(early) [    0.417527] RIP: e030:xen_hypercall_mmu_update+0x8/0x20
(early) [    0.417534] Code: cc cc 51 41 53 b8 00 00 00 00 0f 05 41 5b 59 c=
3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 51 41 53 b8 01 00 0=
0 00 <0f> 05 41 5b 59 c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc
(early) [    0.417537] RSP: e02b:ffffffff82c03d68 EFLAGS: 00000046
(early) [    0.417540] RAX: 0000000000000001 RBX: 000000039f788000 RCX: fff=
fffff81e2502a
(early) [    0.417543] RDX: 0000000000000000 RSI: 0000000080000001 RDI: fff=
fffff82c03d80
(early) [    0.417546] RBP: 8010000013600066 R08: ffff888018f88000 R09: 000=
0000000000000
(early) [    0.417548] R10: 0000000000007ff0 R11: 0000000000000246 R12: 000=
0000000000000
(early) [    0.417550] R13: 0000000000000000 R14: 0000000000000000 R15: 000=
0000000000000
(early) [    0.417557] FS:  0000000000000000(0000) GS:ffff888013e00000(0000=
) knlGS:0000000000000000
(early) [    0.417560] CS:  10000e030 DS: 0000 ES: 0000 CR0: 00000000800500=
33
(early) [    0.417562] CR2: ffffc900007cf000 CR3: 0000000002c10000 CR4: 000=
0000000040660
(early) [    0.417567] Call Trace:
(early) [    0.417570]  <TASK>
(early) [    0.417573]  ? __xen_set_pte+0xdc/0x210
(early) [    0.417578]  ? kfence_protect_page+0x68/0xd0
(early) [    0.417582]  ? kfence_init_pool+0x12d/0x280
(early) [    0.417586]  ? kfence_init_pool_early+0x4c/0x281
(early) [    0.417591]  ? kfence_init+0x3f/0xc4
(early) [    0.417594]  ? start_kernel+0x40d/0x6ef
(early) [    0.417599]  ? xen_start_kernel+0x5c4/0x5e9
(early) [    0.417603]  ? startup_xen+0x1f/0x1f
(early) [    0.417607]  </TASK>

Automated bisect in progress.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Nud4phUDaN+ZKygB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOVXdAACgkQ24/THMrX
1yxSaggAgvftqn9tgFVvaPpsZRK6mBvsIaQpA5F6U8mG+YJuH+0jDX0cAKTqFGre
we7nV62vqcr3JrcD0Us+n0+ZgcGPCYQx4Sn6WF7pSNVKcrfrhR8nTgschW55gGKC
XKL69Mx8S2odx9byxdDYsyajY4hvJy6bxZ+T9giTC1oPWed5G56fiAZX745vYpFG
+9a9vv+hxDXyz/JuesXhxAAcYHAEq3ceZlrM61v77Kcy/vWNANf1VRkHZxovtdJo
iVz8XUxTAjkGVSEQhY8Le3wFWS+8fGhmnJW1Jfm8p3Z4f3HUaFZ3lFmMh5KUGUsD
QHg+WZIjtmj9whxNo3tRmKdotMyrUg==
=oTV6
-----END PGP SIGNATURE-----

--Nud4phUDaN+ZKygB--

