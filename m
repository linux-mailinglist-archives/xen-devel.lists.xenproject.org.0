Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC66A4122
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:48:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502436.774235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbyu-0006PE-4S; Mon, 27 Feb 2023 11:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502436.774235; Mon, 27 Feb 2023 11:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbyu-0006N2-0v; Mon, 27 Feb 2023 11:47:48 +0000
Received: by outflank-mailman (input) for mailman id 502436;
 Mon, 27 Feb 2023 11:47:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8ZTe=6X=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1pWbys-0006Mv-7e
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:47:46 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b18b0c3-b694-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 12:47:43 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 04F925C0113
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 06:47:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 27 Feb 2023 06:47:42 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 06:47:40 -0500 (EST)
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
X-Inumbo-ID: 8b18b0c3-b694-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1677498462; x=1677584862; bh=yV4MrXXUxU
	9IU8DWFk78q7mVFHt7RwX9jjJngnV2xlk=; b=jf95fAWQqAG9eEShUWQAa17MGt
	vXN8QutZtU9JT42u8xrWnUZUe8hyufFJl6vuRCZWiYgvz/rKCqEPBEkQ1uFs4Akb
	zVXAXEjZ/KWJ57IsTlqgl5LxxBSPBiCwTduLbfargdmGt6Vgz+djEl7jMpOI2uMb
	wZ7Df3p8fV4upGUKaIM2wfZ4WNuRCihiP0HHVka8CDLyCtrKO6AVVHc/aECa4YVP
	TXlRuNReuMxpY1GcztS6jPv5+uVb4euNH0dLWEWKqm9dpqhiIUaCobqoOq/6UN+I
	fY08zQ5glwcvUDYwxKdvuxtaCw9sJg57h6G45y5OtGbo71vmqx73C2ecBnuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677498462; x=
	1677584862; bh=yV4MrXXUxU9IU8DWFk78q7mVFHt7RwX9jjJngnV2xlk=; b=c
	IkW0A7ZcD/KJHDq1nhzEkqkZDvWShbr+OjqU9z3mFxDqfNoBe56ofxnfiEs/CaAn
	AAM4JVPXQLCCi/9H8IbHJ1VIQiaKhS8C5tbInbmBxo7OAnKJvghOf3f/lP5eGu2L
	Al+oeUcesnhzcgMMK6M5jRHbiSGUKdt1l/zem1/8eN0ZkGW808ras+veuGOZ+Dn5
	Mz8nX2G/C0RyCuORAKGX9yt6VaOb01tf55rBmFGe9UYpXQ5GToqhmj9n/hGsY5h1
	17HkY92TUIHA1ArCSkwPmijpd0tl2+E9rPxlW5b8YY2/iWLPXASYrrXbgOPeTEuZ
	8vOXMJfCLagetGRCHm2gw==
X-ME-Sender: <xms:XZj8Y81JK0V-8LTmC1NHKeqbxVkuh67md6_9elCp-ERQ-yYHTmmMEg>
    <xme:XZj8Y3G2rm4jAlBVxz1y_okos735PZRiLnojw5iKgDA5_LgJRZ5rn6QVilYbLnzwc
    QBrtA45QIz6gU0>
X-ME-Received: <xmr:XZj8Y06M2T2dQeQw0-A3Q28qCL6-tCZecRkLCLUS0usYO0xzqun80-N3vlofVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggvffhufgtsehgtderredttd
    ejnecuhfhrohhmpefuihhmohhnucfirghishgvrhcuoehsihhmohhnsehinhhvihhsihgs
    lhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepfedvfedtueevve
    euffekueekheefgfetgfekgfevvefhteetieejieevledutefhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhimhhonhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:XZj8Y109egqQuna94y3A4Kp0Von07j3HPFnUQ9UHNtPzv0ih9sjDnw>
    <xmx:XZj8Y_FyLb34A2OMsq5VFlfjYqQl4M2TDyraO4c30CZTHJN8-CN25g>
    <xmx:XZj8Y-8Ssdbt61k4jqyH15Qcen0JwTDYbkmLeMQkn4Y0Uj8xKJSyHQ>
    <xmx:Xpj8YzRBXFew73EBp2Ec_7hJFBH2Xnkl9ggluo5U-Q_KphRT4s1nBw>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>
Date: Mon, 27 Feb 2023 12:48:03 +0100
MIME-Version: 1.0
Content-Language: en-US
To: xen-devel <xen-devel@lists.xenproject.org>
From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: S0ix support in Xen
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QrAJXv57Ra6xEPnOyKXrq10Q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QrAJXv57Ra6xEPnOyKXrq10Q
Content-Type: multipart/mixed; boundary="------------GnLahEIS1gQSpvTceurb00Oy";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>
Subject: S0ix support in Xen

--------------GnLahEIS1gQSpvTceurb00Oy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have been looking into using S0ix with Xen. On systems with with 11th
gen (Tiger Lake) Intel mobile CPUs or newer this is often the only
supported suspend method, thus we want to support it in Qubes OS.

Below a summary of my current understanding of what's needed (and known
unknowns). I would appreciate some feedback (what's missing, preferred
solutions, etc.).

Note this topic is much above my previous experience with Xen and x86
power management internals, so sorry if I'm missing things that are
obvious to you.

PIT timer: During some previous private discussion it was mentioned that
the PIT timer that Xen initializes for IO-APIC testing prevents S0ix
residency and therefore that part needs to be reworked. But if I'm
reading the current code correctly Xen can already use the HPET timer
instead, either with an automatic fallback if PIT is unavailable or by
forcing it via hpet=3Dlegacy-replacement=3D1. Looking at the rest I think=

the PIT isn't used if Xen finds another clocksource. Did I miss
something?

mwait idle driver: While mwait-idle.c share a lot of code with Linux's
intel_idle.c and the imported code seems to have been updated (for
example for Alder Lake) it only supports the CPUs with hardcoded
cstates. Linux's code also has a code path to read the cstate config
from ACPI if the driver doesn't has a hard coded config for the model.
This is needed for example for Tiger Lake. For my current testing I
added the values the Linux code reads from ACPI by hand. But that's of
course no proper solution. How should this be handled in Xen (IIUC some
ACPI things are handled by Xen and some by dom0)?

The debugging code in xen/arch/x86/acpi/cpu_idle.c (and maybe other
places) need to learn about deeper package C states, for example for
Tiger Lake.

In general having the power management debugging available that you have
under plain Linux through /sys/kernel/debug/pmc_core, etc. would be
nice. Some things are as easy as allowing some dom0 to read some MSRs.
But didn't looked into it further, some functions might also be required
more complex integration (like extending xenpm's functionality).

I'm not sure yet is what else in Xen needs to learn about S0ix. Running
domains need to be halted, that can be handled by the toolstack. What
other Xen internal things need to be aware of S0ix? Like avoiding
unnecessary timer wakeups or similar. That's currently my biggest
unknown and it would be great if someone with more insight and overview
could give some hints here.

On my test system (NUC11TNHi5, Tiger Lake) I haven't seen it reaching
cstates lower PC7 with Xen (so it can of course not reach S0ix
residency). With plain Linux I got it working on that system although it
was rather fiddly and probably something is fishy on the firmware side.
After seeing it very occasionally not working under plain Linux I have
installed a newer firmware version. With that Xen currently doesn't wake
up after triggering s2idle in dom0. I'm currently looking into that and
will follow up if I have more details on that part.

Thanks, Simon

--------------GnLahEIS1gQSpvTceurb00Oy--

--------------QrAJXv57Ra6xEPnOyKXrq10Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmP8mHUACgkQkO9xfO/x
ly+OTw//Ttuj24tsus8Vf2WApd6pfTZtp2AfbMwl5OmmvAz85tUaxmocrLNBnAPd
yu3QtPj2HzFPk3mneV/798S/LaoRz0P6k0sO/30cNabd3Jl3wz7MmlBb+06NK/33
hIYWO1uQe4DfN1DWy5gWZkKZz2wSbvQeTXMPF7ANlRb478Na0GCA1d02JOFWJoLk
jB5RcFk4a30rmM/I7MUsO9uinfAj+nc+h7Hu5L8s7Y/etVhjbg3RE2Mjp9Y87fID
Kb80XMHFs8BMZSmyV0pRNthMx09Zwv20O89rooqy8WbdrU6IVPjjyxPVUVax3DvQ
nRZREwO1ib5TTn9IsiWPe87I1OG8/QRilmFQBdHqIfPlf9S7o+K4fR1hSqOlv2DM
rnnCyFwntE6UPpvKwnhFS/gT7EavMk7o/yhCrQ3eDSJf7hA9D8/j/NrIK8EfKC0P
AFSnoT/BKNLXzPIUhsBqvqvHAwqbnwcRoTkX5eoyUvXDeRkVlmARdl0BHvqclfum
0Ik5XNNiIoyZwUtT8iVjjsgP9dbC9C15mNlLtbeNYKwZ2/Vm+zldYfOdMhniajay
2tJw1yJaPokYaTC0Mmfbx66P6x7u5fDFst5hCWTQ51jEBFsT/2CP5kyzWr8Vj+XU
X8bU5vu6G5jrzV2plOjBgqyxpjukCrDw4tk9yagM+90+SF5JDQ8=
=fmDO
-----END PGP SIGNATURE-----

--------------QrAJXv57Ra6xEPnOyKXrq10Q--

