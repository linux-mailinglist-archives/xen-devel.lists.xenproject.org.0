Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC4E649689
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 22:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458976.716665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4Txx-0003xG-Mz; Sun, 11 Dec 2022 21:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458976.716665; Sun, 11 Dec 2022 21:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4Txx-0003tp-JZ; Sun, 11 Dec 2022 21:34:33 +0000
Received: by outflank-mailman (input) for mailman id 458976;
 Sun, 11 Dec 2022 21:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Bbr=4J=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p4Txw-0003tj-8T
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 21:34:32 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95187819-799b-11ed-91b6-6bf2151ebd3b;
 Sun, 11 Dec 2022 22:34:28 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0E78F32002B6;
 Sun, 11 Dec 2022 16:34:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 11 Dec 2022 16:34:23 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Dec 2022 16:34:21 -0500 (EST)
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
X-Inumbo-ID: 95187819-799b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670794462; x=
	1670880862; bh=k3gy3L5U3kYrwCtls0KfuKnkSKMEo9j7w1C7soQ/tgQ=; b=Q
	3EnF85wDpRHNLckMfYb3v5JN4pHg40PWrcmXep0sWLEmRaQzBFAJ6dqf2gKRl31S
	EMjC2plZdJ5mlj4X8+Kb4OGHdJUtLdDqrln7VpmD9NpDokkekfuBGcblr6oIQ5E+
	Ee95at+k95qrERd7YnjG4B7vFd9sYk1uVwu8QAeFWCF6JphdqOabPFEEb1iP6lkb
	ISWnVhzzvobFGic5NVcmRf1CMadEEnPuA3UG6V0EITzJaYAdUloFDc+CHV9FYri8
	z4idjfenk+MllDix8TN5SsSzPjbqiIcDxDRLV+ZtThiEnvfcsFRlsqUKM0l2+NS+
	NqFmDOw+6FCYkba7+30Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670794462; x=1670880862; bh=k3gy3L5U3kYrwCtls0KfuKnkSKME
	o9j7w1C7soQ/tgQ=; b=ebyAHeuk94C4dwt78faHr78EpZxZ+ZwMTRWoFdQG6Im6
	Ppsrx4dmFMQIGNOCWCXJ4YYhLc5Pb2IwZsrXpcSOiEJNyF2Gzj/HZGPq8uyijz8S
	rvrxcTURN0yzg6K82/uxJJjDNOKyKlmprRynEA+ZzlWkvI2B9Zr/l25aiGQHL3q7
	fjKyPBqBeiugpv5uFZI4VBv7KdePuKt/HuYRaWL8OGSkF0yTavCeFCDjkO42ACVM
	QTnyNYnrYfA8IvWCPRIQzsbuHRpuAMl04aMfIxFm2wWR20ASuBVbku6c/FfjSJkO
	B7uHqHLcBFwRPS9Zsh0pFsaZdV3rjxxbvInnhJmL5A==
X-ME-Sender: <xms:3kyWY1gJRSVBRCqCglQ6hilZn_kLVb1X5EwuGg__VT40dzcx0QSnxA>
    <xme:3kyWY6Am4BlmrU2VCY4sVfVvtuosxmx5aXNcNJkmMwMkdFj04QPBX2sbdqubMSnxh
    cqxtsaIwRRg-dI>
X-ME-Received: <xmr:3kyWY1GKBLoXlgobB0ziiHHTwrJHAeOXH1sQnAqlcmntvRTG8Yts9qBLS5lD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeigdduhedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggjsehttdertddttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegjeelleetfedufefgteetjeeghffg
    iedugeekffehfeekteeivddtteejffeuhfenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggv
    mhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:3kyWY6QWw021EUSdCqg6qZz9zSAGdSU_T_dV6XfX0efRNyGZ_vjTCA>
    <xmx:3kyWYyzA27Vom5Tk_-_A7JPv5FMJ3DAmhlZeGelSNuVORhomDmpjjw>
    <xmx:3kyWYw73rq4ly9VYAwiMdcBJkWBlNwzgMAJeSvi0jgdU1ElqWtVzig>
    <xmx:3kyWY2_wrXxY3i_YGrZ2K8YJEA-Q-Av1-cLMUZOiveaBBzdu89AEMw>
Feedback-ID: iac594737:Fastmail
Date: Sun, 11 Dec 2022 16:34:20 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>
Cc: kasan-dev <kasan-dev@googlegroups.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: kfence_protect_page() writing L1TF vulnerable PTE
Message-ID: <Y5ZM3HCnTcLvP2vy@itl-email>
References: <c18bc798-f484-ad66-fbb0-15192a74f8e3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; x-action=pgp-signed
In-Reply-To: <c18bc798-f484-ad66-fbb0-15192a74f8e3@suse.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Sun, Dec 11, 2022 at 01:15:06PM +0100, Juergen Gross wrote:
> During tests with QubesOS a problem was found which seemed to be related
> to kfence_protect_page() writing a L1TF vulnerable page table entry [1].
> 
> Looking into the function I'm seeing:
> 
> 	set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
> 
> I don't think this can be correct, as keeping the PFN unmodified and
> just removing the _PAGE_PRESENT bit is wrong regarding L1TF.
> 
> There should be at least the highest PFN bit set in order to be L1TF
> safe.
> 
> 
> Juergen
> 
> [1]: https://github.com/QubesOS/qubes-issues/issues/7935

Does that mean that Linux with kfence enabled is vulnerable to L1TF?  Or
are these pages ones that are not in any userspace page tables?  If the
former, then this is a security vulnerability in Linux and must be
fixed.  If the latter, then the two options I can think of are to revert
whatever change caused kfence to produce L1TF-vulnerable PTEs, or to
disable kfence when running paravirtualized under Xen.
- -- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOWTNwACgkQsoi1X/+c
IsHgTA/9HGyx+vlFqwhx7sRHVbF3ZpBdZUY7WEDI6cZzIRx8Kvh2QT3ZfYXW/32t
9EUELEKDKqXMsjWozdFcs6leohZBbYozV/luoQUrm1AsavffwrxH+d84FnZFg2qh
VVh+Sd8NL15EZV9nXIqqS94uopqWKL79qmxVcSBVkfujtiI57uGFdshePGMP3I1D
RGPRB5my7A/JQFhuITiZcqbhj0h4Cm5QSQaARAOEr4XQuso+4SFPZVGSw/+vD1nG
XQ4YAvnFKy3+6oabroJ37cway7cimp6/qlEqS3YE1SaMa6q37mgsyGFobpQWbNy5
p4OkEuqlZ85p/C7g4XR+EvIJhfFovh0Wfj4fM0h78VvB8h2aHL2ckhi5vx0Snb8L
p5NLh8MFI0PDoUaUWFb4Y3tN/Ksne9MbTQSy03mnXdnT+/6LQEHFVgUC90K0N52D
R46brLZEfPsTVB+Ro3uynpbXaE7mw/IdzdAXgxRPcMQIiuRmUthWO4O9HC9DCoPz
IHgqZg8+oBn2DCqUomg8Fz/9DQzWKb24dPKyzNuOmbtL63Tk63Qy1Smxu829LtCv
5mkfNPXwT2A3PbdngNrIT9QgI7ziXwUxYBDJ7onlb8Ad6dsimQ6QHOOWilg8mY7E
jvNVYkqFD98wLeR4FuWdrA+20/0o1i2ab6afOFvyzN4lItC6mKU=
=lz1X
-----END PGP SIGNATURE-----

