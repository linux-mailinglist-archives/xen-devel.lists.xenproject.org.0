Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKyICYPEnWnORwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 16:32:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B7718909E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 16:32:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240152.1541643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuuNc-0006t1-MS; Tue, 24 Feb 2026 15:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240152.1541643; Tue, 24 Feb 2026 15:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuuNc-0006qY-J9; Tue, 24 Feb 2026 15:31:20 +0000
Received: by outflank-mailman (input) for mailman id 1240152;
 Tue, 24 Feb 2026 15:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eudq=A4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vuuNb-0006qS-RE
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 15:31:19 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db1c1ac4-1195-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 16:31:15 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id DE7611D00115;
 Tue, 24 Feb 2026 10:31:13 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Tue, 24 Feb 2026 10:31:14 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 10:31:12 -0500 (EST)
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
X-Inumbo-ID: db1c1ac4-1195-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1771947073;
	 x=1772033473; bh=lKRkqd72j0u5hpzvO3/RwcP4EA2Ot8NNWLi4+dgfm6A=; b=
	oVE6/5Xwe5jNM8GPeWL6Kdoq7dqLzVIdBK8gxe1TG/Cak6kQfI/KsxhXIQ3k1hkC
	7oYgRLq/qVIzoBKyKcPTRR7u/FEmTVyk1m1Kvv9M4NOL1zQKk+gXY2FxquWFtbkb
	816fpnfPYltnTcnFOzavB8kdYpf0XjGhHGLBi3L59OYOtG+pzN0WVNx2BKxJydr2
	4F4owH+ZJgf9oKEdSfpHLfrbslANMJFVY3AltWpiM7RPXzwU3nqpCNAR5me47Ivc
	Ozjyeh7I7q6lQ8Mrt356tSxIWYXaRwZwyhWb5TrfEiUWFdebreausDozLyVZEsro
	aRs1MH9/7PaSR+ztsYsIpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771947073; x=1772033473; bh=lKRkqd72j0u5hpzvO3/RwcP4EA2Ot8NNWLi
	4+dgfm6A=; b=t6nf7Righ/qRfsAMjNNlJGXsqFpzfZv+3Gtdc605yaclLYrzJyx
	Bduswn8ipx2XP2R6F0v/34T0QIBwXJ2BRpQ2Lr6cfDwAiL77a0uvg9DDDSPZSSlO
	d18XJyatU1GwejGtBhmv78Bt9+OxM8z8DYnowUDsl4AoY6JI7r9hl+9FTRh6xfC6
	PPvOwYGkTRoQ8F22tpBPNpyy6xo+g6gfTaBbQ8Ifh75nIo3yzelIZ8C01qx3krY5
	yzQAaqJw1Gwm+3mCjG5fRQsEQho1E04gQek9nBzgsmfyARrVcYO1tIm4r+57eqWf
	4mDbyXQwnGpFqHhSxIH/OhjKm22sg7H8rTQ==
X-ME-Sender: <xms:QcSdadl5eIIQyFKkMomFMhZ2tLRkYlSjRSrKpZoSUECrub2zJJAozw>
    <xme:QcSdaWrl8CXG5C0HysU0-8PGFkArd4evE-iuFGs4xrbrPbqlqOHsCExc6ANkwYUDg
    0h83q6RgQjnc5vzKthcXzD8g0YlqNdvs0z57w0PSR5jPUn_VQ>
X-ME-Received: <xmr:QcSdaeEfqKz0_zuDY8XtXvdPrg5CUr4SQioaGcVS6FRYV6iRNeRUvX7KFP4p3mf3oLF82OYgolKDHPBLJy__ZJ-VOC61z0xpYvU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedtheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvmhhiohgsvghnohhurhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprh
    gtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhr
    ghdprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhrvggvuggvshhkthhoph
    drohhrgh
X-ME-Proxy: <xmx:QcSdaawGPGD10mkm8wjsnc0O6am0DqaJ3w4DYx2i424Znjrjc6onjw>
    <xmx:QcSdabpyCL4UwwqjaMnxxDzA_4XYOnkA0lpHcrMKuTZQ4Fgm389nOQ>
    <xmx:QcSdacjbUKshq0O37aWG_yFxkXHduLVfOul0SDeGFidGP4FlPe4C0w>
    <xmx:QcSdaQjXVUa19R39aTFcNlhal6X3NwsnWGZ1cSaHD6EBsVKSpb7vEQ>
    <xmx:QcSdadWzjAt3Mi_yT-Bns2wXYky6v8b99gL8ZD2aonCZg04bxhunkgT->
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Feb 2026 16:31:10 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aZ3EPnJD_KunoQh-@mail-itl>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
 <aY58-gyarcVoBS2a@mail-itl>
 <a41a15ca-b26e-482a-9084-fc61645fb24e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hjkw3E9BoIh06IIo"
Content-Disposition: inline
In-Reply-To: <a41a15ca-b26e-482a-9084-fc61645fb24e@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:demiobenour@gmail.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 20B7718909E
X-Rspamd-Action: no action


--Hjkw3E9BoIh06IIo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Feb 2026 16:31:10 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19

On Fri, Feb 13, 2026 at 12:31:47AM -0500, Demi Marie Obenour wrote:
> On 2/12/26 20:23, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monn=C3=A9 wrote:
> >> On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-G=C3=B3re=
cki wrote:
> >>> Hi,
> >>>
> >>> Recently I started testing compatibility with Intel Lunar Lake. This =
is
> >>> the first one that uses "xe" instead of "i915" Linux driver for iGPU.
> >>> I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
> >>> Linux 6.17.9 in this test.
> >>
> >> Not sure it's going to help a lot, but does using a PVH dom0 make any
> >> difference?
> >=20
> > Ok, now with the correct Xen version, it's better with PVH dom0. At
> > least on the login screen and few applications (from both dom0 and domU)
> > I don't see the glitches anymore. I can't do a full test, because PCI
> > passthrough doesn't seem to work with PVH dom0 on Xen 4.19 - and I need
> > it to start most VMs.
> >=20
> > So, if the above test is representative, it's only about PV dom0.
>=20
> This reminds me of a problem that I helped debug a while back,
> and which also affected Qubes OS.  That one was due to some part
> of Linux core MM clobbering the high bit of the PAT part of PTEs.
> As a result, a PTE that should have referenced entry X in the PAT
> wound up referencing entry (X & 3).
>=20
> On native Linux, the bug was mostly harmless, which is why nobody
> found it earlier.  However, on Xen PV, the different PAT caused memory
> to be cached that should not be.  The resulting symptoms were very
> similar to what Marek described, though a bit less dramatic.
>=20
> Can you try removing the Qubes downstream patch that changes the PAT?

I'd assume removing such patch would make things only worse (it either
shouldn't matter, or if the driver assumes Linux version, changing it
would actually break stuff).
Anyway, removing the patch didn't change anything.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Hjkw3E9BoIh06IIo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmdxD4ACgkQ24/THMrX
1yzNKwf8D5XRQrqlh3kLHY4RnTkKDpzpidlSTt0P3ifmwdqFCR42vBkbdX7qE1+5
l0f6EjapaDSAj/Yx3+4yUztyiXLW+zsu6ashquVN6CzTJU9Q0mrRKqC229TYgi6k
SGyy0glmFlOfBYLklhF51jFO2r1NKp9ok736zecSYjg1KdwNHgpQgITnEEQxhCcw
/b4ajkkKZ6of0ulhxoEIHA5P7m/kg7I63jQapborsL0PHwdzEgTLqjpwBV0CqZ+W
9uZgRdUVfU0urRblL6/tFKj8/seQTBSiYoUT6bP0u3cIeIfF5r9bYaWC2xOFPfBh
sFX4fVag7XkIoeAwH/szlikJ4qdI8w==
=4qyA
-----END PGP SIGNATURE-----

--Hjkw3E9BoIh06IIo--

