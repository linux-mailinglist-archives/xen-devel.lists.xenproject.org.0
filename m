Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002756DD7F5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 12:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519618.806588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmBGs-0005KE-Cv; Tue, 11 Apr 2023 10:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519618.806588; Tue, 11 Apr 2023 10:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmBGs-0005He-9u; Tue, 11 Apr 2023 10:30:42 +0000
Received: by outflank-mailman (input) for mailman id 519618;
 Tue, 11 Apr 2023 10:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6J/=AC=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1pmBGq-0005HY-7j
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 10:30:40 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e56b8fec-d853-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 12:30:37 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9CA585C01FA;
 Tue, 11 Apr 2023 06:30:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 11 Apr 2023 06:30:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Apr 2023 06:30:33 -0400 (EDT)
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
X-Inumbo-ID: e56b8fec-d853-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm2; t=1681209035; x=
	1681295435; bh=uvIpKHbegzj4xJPF2DM2w/cwsEorqqtDcMgBzDcQiro=; b=M
	XRgYMx/i98nvYqN4igFeDSN8a7RAmtIwdDTTj/cwqHrzkOrZO6kl1Sht0uxQsxa+
	awf/kIEfOVg9PVGUSd34h3lvxW4QzsdGcPZBcixeC6trV83NmvfitqSm81nWC/Ci
	jgSdgn0JovxylGbSFyR3KmZMFY5pjPYq4rJjjY04Wmcr9R6RNA1gaeZT4Z/3ElG8
	DTd2iKQ5xMZZQaHbycv13Z8lZNMEhjPg9O5FAuyCpdEgRi8LPLtkfEoefJoLVq6m
	s2CiKi0J3Ut/19RRRQsSAaQU0XdlFRESEFRmP51+MtbGbPeIW3r4UL0C5RphgfeF
	4wa6+tMQ8sAqaCGJ+o2oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1681209035; x=1681295435; bh=uvIpKHbegzj4xJPF2DM2w/cwsEorqqtDcMg
	BzDcQiro=; b=K1avxbKVpjhEKX4yRjjGqz78k5/JPOdDrS3fgKY0SqX/EcEePoE
	nr8y7H/A1f5i8ePjjXo91IV+IPybpB8jTpR/96NGtwt4nuclMGORuD4ZCrbQUnYt
	aAFrT9Cq2FXEwYhTxHy5N71e6Lz1DaWRt/MXDehDCygdQoBgQ1/BOn1lEESnbo+K
	h9rUn7yXRl4zccj9q3kyPiAVW0f68ieT+H4DIMTzXQk2IX4JEOOtUPuJ4nniOJMl
	SZ95SVTk2vNbt2rYh1FXMCR7ZD4uvYMb4nHRN4hYlT6zQwEliuPsGKIQYOn/ZLwm
	fPi8Kf54eqCXyz2hb3m6lPZXWjoRY7c7rLw==
X-ME-Sender: <xms:yzY1ZOJGfGRPBNvoer34YdjAkV6Wb9bhOxnoBrKSMRzNKtsMNK1MMA>
    <xme:yzY1ZGJW5wx5hOT4rbeBsTVILU7Cg35FAzatMY154QVYPOfdcHfKK4zGOdfLAFBwD
    LocN3PiCMQRsts>
X-ME-Received: <xmr:yzY1ZOsr1Ou-2UTb22T4EFR4rfoNVOC2tzv7atkoZqoIyq-n9ZfrXuq2sQAksA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffggfvvefhufgtsehgtderredttdejnecuhfhrohhmpefuihhmohhnucfi
    rghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepheegfeelteekieeuvdduvdffheetieeiheelgfeiheff
    veefhffhgfejveevieehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihhmohhnsehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:yzY1ZDZBU5SdKulkYLqSWttrq8DkBfdMj2nlvRvuUuVV9ma_Y_SICQ>
    <xmx:yzY1ZFYMFSLhrR2opsIvXaYjOx53mGv986EKP7_9E3Q5rFdeAC1VLQ>
    <xmx:yzY1ZPAgOuANtqREZQjLKeat4Yf-3Eu0H8d1SsOjOJyQZt5JqpRJbA>
    <xmx:yzY1ZH0zZyJTLbcT50MxD9DSH0FyQUjh2EazBmFkRyLvJUQKn0hCGg>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com>
Date: Tue, 11 Apr 2023 12:30:10 +0200
MIME-Version: 1.0
Content-Language: en-US
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: RFC: disable HPET legacy mode after timer check
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xK2STNKhiONHp1GmYwabHL6P"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xK2STNKhiONHp1GmYwabHL6P
Content-Type: multipart/mixed; boundary="------------voXpEBUiwVU5bYblL6WJgkAT";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com>
Subject: RFC: disable HPET legacy mode after timer check

--------------voXpEBUiwVU5bYblL6WJgkAT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have been recently looking into getting S0ix working on Xen [1].

Thanks to a tip from Andrew I found that the HPET legacy mode was
preventing my test system from reaching a package C-state lower than PC7
and thereby also preventing S0ix residency.

For testing I simply modified check_timer() to disable it again after it
checked the timer irq:

--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1966,6 +1969,8 @@ static void __init check_timer(void)
=20
             if ( timer_irq_works() )
             {
+                hpet_disable_legacy_replacement_mode();
                 local_irq_restore(flags);
                 return;
             }


With this [2] I'm able to reach S0ix residency for some time and for shor=
t
periods the systems power consumption goes down to the same level as with=

native Linux!

It reaches low power states only for a fraction of the suspend to idle
time, so something still makes the CPU/chipset think it should leave the
low power mode, but that's another topic.

I tried to understand how all the timer code interacts with disabling
the legacy mode. I think it only would break cpuidle if X86_FEATURE_ARAT
is not available (Which is available on my test system and indeed I
didn't run into obvious breakage).=20

Is this (disabled PIT && !ARAT) a configuration that exists (and needs
to be supported)?

Did I miss something else? (Very much possible, given that this is way
above my existing experience with X86 and Xen internals.)

Simon

[1]: https://lore.kernel.org/xen-devel/9051e484-b128-715a-9253-48af8e47bb=
9d@invisiblethingslab.com/
[2]: Plus [3] and some hack to have mwait-idle on Tiger Lake.
[3]: https://lore.kernel.org/xen-devel/20230313134102.3157-1-simon@invisi=
blethingslab.com/

--------------voXpEBUiwVU5bYblL6WJgkAT--

--------------xK2STNKhiONHp1GmYwabHL6P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmQ1NrQACgkQkO9xfO/x
ly82/hAAnCpnkQefmNsAVFIbmpZOLKU3sQajgcA5wswNrvFXk9ApnZ3MbGfgjYxv
gyZtgTjbl1yTdC07CNA5upmqu2jO1wFmSyq/dpVgWHlXVtbBF/zxPf+AbFk252wb
f4eEm7hSjBnUr8TrG59ZcM5VrQDa/jQkzodE0C7pEpzyBt9HECFc0blmPNL1Ot85
FdjvZvHfbXP1wn8/5znpArBldab68vh4bA7puA9Wrmr2zuBr/Jo/7pA/+7DACo4I
wYMBLUkAra8fA+EDKT14OfwvDGkF5MuutFQRkgYDgFNP0j0qrZ0HgqTCmOJgp2+Z
WjKi5FSab50KPTPJhFO7fjsvEXwHrT9i/p6gB+LsVxTbCJwLFH8wbMsjkvaowzKA
H6CK1AN3yUSQo1uW59bmZYqXe5ZlaNIM2l8dGpX/CsKQ83z5NdlhwalkQIadYy5t
nCDrV02fQzIQw+otyoj23rkzKU9mJOabw5q0kfDHy6t6Wr9GD930SdLb5nK+Rl5z
XWbv5CM/pVoJjXv2ksDPqdKnv5uqIi8ZIEtiuYicaJM3bOFrqG4uGZmdP4yX021D
cNThqzSnMb46QihF/rbaHOh4rEYTM9eUXWvSqTjxeoh7Hjuih7hOYupARwpoy64U
D/xfOVZEPt2zwuQMgrBuUj4VnAMd78vaXGa4vUKzmO2A5yAzdrk=
=zCNu
-----END PGP SIGNATURE-----

--------------xK2STNKhiONHp1GmYwabHL6P--

