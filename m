Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880F875877F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 23:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565509.883709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLsba-0007pB-GG; Tue, 18 Jul 2023 21:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565509.883709; Tue, 18 Jul 2023 21:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLsba-0007mN-Br; Tue, 18 Jul 2023 21:51:38 +0000
Received: by outflank-mailman (input) for mailman id 565509;
 Tue, 18 Jul 2023 21:51:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju50=DE=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qLsbY-0007mG-VF
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 21:51:37 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42481d59-25b5-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 23:51:33 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4984D5C00B3;
 Tue, 18 Jul 2023 17:51:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 18 Jul 2023 17:51:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 17:51:28 -0400 (EDT)
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
X-Inumbo-ID: 42481d59-25b5-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689717092; x=1689803492; bh=BXP9MsmMNtsDSbAv3CYwTjiFEc9entx7JAG
	SpXBlmH0=; b=LcIZDyNwJmsKIt5ql1npDoo7tEVOlG71zqDRGKdzFGCIwwopI39
	2ahYFJ2B9kj86Un7A3YzjNAiuMKuuK8mdnfZMl7XsJL2Ocir2pEu/pd07fSAtcSB
	ALiVqtwW/llW78FL/bbAPBIQjsasVvOwmcYEYBpDOKK5hKc27j8jjATroTSC1Dr2
	Yel94ntPa0bfuR3WrnrkoUmgljuoToP/ryokrbylYmfheHUa+aCM/vCdD+RMKhZc
	aCvaeQxERKPq6N/a2CD9mf9vVlLd4NIQOV0c0qKKGQTSsbXOTXMZPNXeYyxbylAS
	ygEWv7nSxd2dfgKC0e6d9rYiXy93hkrBzXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689717092; x=1689803492; bh=BXP9MsmMNtsDS
	bAv3CYwTjiFEc9entx7JAGSpXBlmH0=; b=lSfAAGTaSWA/dgHnv937s5t0/FrjA
	xOmHDQ+TVyYduBMBa7AgUKUt9NhdC7GOJQIUI5Wx6mnNxe1REfJo2Aq5quzv+BNn
	r9pNk/+IeqJgoBOwNk7sKJSCVFWhmXp4L6sCeX3BEkUDRBsVyyWKzmHwNv1G8jnh
	LCYyHG+YKZNZ9O6lan6xY973clduKbuBTkbOnGETdjOZt9hu39+/rK9YJXsmGg4B
	KzC67MM7CnvnS6QZkDFQLqj/03xiehZoaxfm/1zi9nqcKT6z6n1dF4oaAH1IbtWk
	S/SfnJeJMnXXF91LILeLqAr2HLDQCJM7w9fjAVQlKklU6rdNnt8rQF73Q==
X-ME-Sender: <xms:Ywm3ZOi20DHwc2I2Q-vavZj3pYhf_oF_G2ogFB5-gguJC8DCQ3b2pg>
    <xme:Ywm3ZPBsCNCJ_dGUhPGWfO3rcsZMDdZssLrV2WD0UJUokgZsOTRoNJht842nf1dnC
    Vx6j0vtgstWf-g>
X-ME-Received: <xmr:Ywm3ZGFaFqqNhK9ashc4CUFan0oaqDOA6YV8NIILkaeBQgxLgHUGpczK6-aOKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeehgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekueffiedtgeffleeglefhledtfefgiedtveeiffeg
    hffgledtveehhfdugfetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:Ywm3ZHQNBzUHS3Kdu4LlZ2vDZEG3fcN-s4nMVl0FGwxvkW7fmo8ltg>
    <xmx:Ywm3ZLy2SiWro27YGXcxEsl16HqPZIBcCREl7NK8uwHaH8z2d34_7g>
    <xmx:Ywm3ZF5SM_9B0Xs0HaPZrfJ7v4sqZGQLzVGdsoHqOkprKLL64Qpu1w>
    <xmx:ZAm3ZL9lBPVjAm1ww6VVXKZDXBIi1tb7wCUHrGfneYWdwDVty2D2dQ>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <ac77ecba-6804-1d16-60dc-f184e5d31dcb@invisiblethingslab.com>
Date: Tue, 18 Jul 2023 23:51:20 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH] x86/hpet: Disable legacy replacement mode after IRQ
 test if not needed
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20230718122603.2002-1-simon@invisiblethingslab.com>
 <ZLaLLe2HFDN5oWUq@MacBook-Air-de-Roger.local>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <ZLaLLe2HFDN5oWUq@MacBook-Air-de-Roger.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------X67FO5taO38ffOaFRNu4C91f"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------X67FO5taO38ffOaFRNu4C91f
Content-Type: multipart/mixed; boundary="------------DwesYUbT4AhjqXaqynB78eJ2";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <ac77ecba-6804-1d16-60dc-f184e5d31dcb@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/hpet: Disable legacy replacement mode after IRQ
 test if not needed
References: <20230718122603.2002-1-simon@invisiblethingslab.com>
 <ZLaLLe2HFDN5oWUq@MacBook-Air-de-Roger.local>
In-Reply-To: <ZLaLLe2HFDN5oWUq@MacBook-Air-de-Roger.local>

--------------DwesYUbT4AhjqXaqynB78eJ2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Roger Pau Monn=C3=A9:
> On Tue, Jul 18, 2023 at 02:26:03PM +0200, Simon Gaiser wrote:
>> As far as I understand the HPET legacy mode is not required on systems=

>> with ARAT after the timer IRQ test.
>=20
> What's the relation with ARAT here?
>=20
> It would seem to me that keeping legacy replacement enabled should
> only be done when opt_hpet_legacy_replacement > 0, and the currently
> modified block is already in a opt_hpet_legacy_replacement < 0 gated
> chunk.

I was concerned that on systems without ARAT cpuidle might rely on HPET
legacy mode being available. See _disable_pit_irq and lapic_timer_init.
But now that I stared at this again, I think that condition isn't
actually needed. If we reach that code we know that we have no working
PIT, but HPET is working. So _disable_pit_irq which is run after
check_timer (__start_xen first calls check_timer via smp_prepare_cpus
and only later disable_pit_irq via do_initcalls) will setup HPET
broadcast, which should succeed since HPET worked previously.

So I guess we can just drop the condition (please double check, that
code is quite tangled and I'm not familiar with it).

Simon

--------------DwesYUbT4AhjqXaqynB78eJ2--

--------------X67FO5taO38ffOaFRNu4C91f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmS3CVoACgkQkO9xfO/x
ly8NuA//cWHloiu+HGskknLnmtn564hW/qtnSF7TrKxaaZiUqaeYz4yuA66AHgP5
deikZsaJ9t/xnbhdpMSZk2hqO+7XVrIjsq/fBV/uvvYy5je4JD6uq52xD3phZO4Z
UoCyoBD+1n8sRhS8468zT0LN0QqcSEktGaWWjgT/d3QzukbmHZRpHq+8Xb6RWrP+
dYJxfmTtUYnKeEmZaKmA9bGbMWCreQvJkrPJaff5ZIilrN0bdeR7ilaMNNWIG64S
VT2vTDmoDwokubmROv+tO+lx9PtFpo6B7HFR8Mt5YI15UNvbF0xE5nwzO/l6n1Kq
WnVc3Hwo6YZ8z/lwoWOVM43J/U/uQUZHgCFRk1cVNmdw0oESL6p+CRfvSfvGX2jU
vq8AvQ2Qy/Q0TDDUO/bpT6wcAen3eJ23JUCYapSV8rgpNkUdH7HdWxUCEhOUb9bP
ZFGJs1FwWAHCKcX2iA2eexU4DD1WoO6lOrWhAZAryksndmHlaC2y52xDAUq4GHJK
Di80IUyTs4mDI+I/wakU3RylnXnyFk3T7UfXvv0z3b8OoykVsBJW81yhfdhN3Ohe
IsnzshJpRxzpGFfwnIrgn1/ens28u16g56Eq1GBDREFGzw2BK4hocko1aaVZ0YGO
0nux02Ywa0acVu7ITCfLfuuZuSAFyCN+u0sb8fRffvClkZzIxtA=
=0C2s
-----END PGP SIGNATURE-----

--------------X67FO5taO38ffOaFRNu4C91f--

