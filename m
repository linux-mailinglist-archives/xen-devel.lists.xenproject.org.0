Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ACF7AF7EA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 04:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608623.947239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlJpr-0004dA-W1; Wed, 27 Sep 2023 01:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608623.947239; Wed, 27 Sep 2023 01:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlJpr-0004aT-Sp; Wed, 27 Sep 2023 01:59:31 +0000
Received: by outflank-mailman (input) for mailman id 608623;
 Wed, 27 Sep 2023 01:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odcs=FL=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1qlJpq-0004aI-96
 for xen-devel@lists.xen.org; Wed, 27 Sep 2023 01:59:30 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79d8489f-5cd9-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 03:59:25 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 50A255C26F3;
 Tue, 26 Sep 2023 21:59:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Sep 2023 21:59:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Sep 2023 21:59:20 -0400 (EDT)
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
X-Inumbo-ID: 79d8489f-5cd9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1695779961; x=1695866361; bh=LdVIWQ3zdC2JQGYSV6uGe+Xx0lvi4SgBaLz
	jz8Feerg=; b=cU7igk30miSG1RQN6wVx2H5R/zy5Cy3HeM/rcevgtrERdAmOqNg
	vk8+UULrnTBmnczz2XzcinKzOhSl84Gbre5JZ6mhxzURIayTxo+d1i4w8oxA0zZi
	yfSH0A2Kd87HbYjHBpixMJAF6h1l5vpEq66taSiTgxtnItmxPGfSURso+/yA6KfT
	UuKqJSV/0EiPm7QKb1qO9fes6wSMiGuraNTsLXvWFS0xEYc646M5fH/e8dpUJhbx
	7JNyNFg0ePmGHppRl92FlSd6xvbuWbvS/U5LSY7EJFyKnEYKOPnSEB1olJc3aLJP
	ixkiPGPnTQ5xC7Ho4+HxUefqfxTCeaqzGHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695779961; x=1695866361; bh=LdVIWQ3zdC2JQ
	GYSV6uGe+Xx0lvi4SgBaLzjz8Feerg=; b=mt7rXoHeMym4rTU+BsKQbssq3w67q
	T3BYAKMqHiJh4UeVHbAzHSdd/t+/Mtyl82SjkBPk0eKm5y/XZq50SzgZqywddQGE
	3YQcnLPhKUBU4Tqa4+LmMQ49JbiM4QGo/Cn8SMRF8k1FnyPZAQoHwaKD82tPT8U8
	tASY/wMExSuvngQpNcPUXxqJaAFcggK4qWDQDzmZELKnoOpkBzZh0wgsBMl6n0iq
	yX+jQmTsz5sAAfPAVjVkoaL7F+G9Rb2w02WFTsTKZZ5dhg5tHO0zLRxsRjDuih4Z
	mFPYJCZ6aHH+sB7DAXXfc2SdqbUaLK/7PK+sFz5gSIDv0NV42YgONbG8g==
X-ME-Sender: <xms:eIwTZT6ZiSBd5iETkZnzuUGO9X0lu8SeN7J--ZYZ5eOuffTanUSEtA>
    <xme:eIwTZY4PYsvxcodrdiP_INtcJLBmkwzoPSZCRp3Gm-R9DRLwy8jfwrLjnYWEsWvOn
    TojSvt9ETpTasA>
X-ME-Received: <xmr:eIwTZaeLAiVYvo9yyTsXZDa1YGWinCnUrjTX7EXQjBO8PQyZRo83h7mXiT_EasgYjPUZcYJhKtomauclE3xdCNetU2KHv-uuNzuTYiKjxEmYAop_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtddugdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtjgesthdtredttddtvdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepjedtveegfedtgfeigffgiedtveeuueei
    fefffeeuhfdtffekgefhvdfgiefhuefgnecuffhomhgrihhnpegrmhgurdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:eIwTZULsZOBJ40wDeOHZfOblk4Rc-SumeUJQroYAuf1sKmKYYtiIlg>
    <xmx:eIwTZXKoV3yEq3y_CeG57KKcMhMsrkT3L4fijQCwBpdOjglBRjxiww>
    <xmx:eIwTZdzAp1iwMLZr69Vv8Vexm_FoyuO_XctUQlhwa2gopT41k0sM4A>
    <xmx:eYwTZUHafhNhZ6d26LiwzPn02IhZrkYpDjb8hlvw9yo9nuh0VSYtuQ>
Feedback-ID: iac594737:Fastmail
Date: Tue, 26 Sep 2023 21:59:19 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: oss-security@lists.openwall.com, xen-announce@lists.xen.org,
	xen-devel@lists.xen.org, xen-users@lists.xen.org,
	kvm@lore.kernel.org, devel@sel4.systems
Cc: "Xen.org security team" <security-team-members@xen.org>
Subject: Re: [oss-security] Xen Security Advisory 439 v1 (CVE-2023-20588) -
 x86/AMD: Divide speculative information leak
Message-ID: <ZROMd1GCpD8uDtbE@itl-email>
References: <E1qko5Z-0003cF-KD@xenbits.xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; x-action=pgp-signed
In-Reply-To: <E1qko5Z-0003cF-KD@xenbits.xenproject.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Mon, Sep 25, 2023 at 04:05:37PM +0000, Xen Security wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
> 
>             Xen Security Advisory CVE-2023-20588 / XSA-439
> 
>              x86/AMD: Divide speculative information leak
> 
> ISSUE DESCRIPTION
> =================
> 
> In the Zen1 microarchitecure, there is one divider in the pipeline which
> services uops from both threads.  In the case of #DE, the latched result
> from the previous DIV to execute will be forwarded speculatively.
> 
> This is a covert channel that allows two threads to communicate without
> any system calls.  In also allows userspace to obtain the result of the
> most recent DIV instruction executed (even speculatively) in the core,
> which can be from a higher privilege context.
> 
> For more information, see:
>  * https://www.amd.com/en/resources/product-security/bulletin/amd-sb-7008.html
> 
> IMPACT
> ======
> 
> An attacker might be able to infer data from a different execution
> context on the same CPU core.
> 
> VULNERABLE SYSTEMS
> ==================
> 
> All versions of Xen are vulnerable.
> 
> Only AMD Zen1 CPUs are believed to be vulnerable.
> 
> MITIGATION
> ==========
> 
> There is no mitigation.
> 
> RESOLUTION
> ==========
> 
> The patches for Xen overwrite the buffer in the divider on the
> return-to-guest path.
> 
> However, as with some prior speculative vulnerabilities, the fix is only
> effective in combination with disabling SMT.  For the same reasons as
> before, Xen does not disable SMT by default.
> 
> The system administrator is required to risk-assess their workload, and
> choose whether to enable or disable SMT.  Xen will issue a warning if
> SMT is active and the user has not provided an explicit choice via the
> smt=<bool> command line option.
> 
> Details of the vulnerability became public before the Xen patches were
> complete.  Hence the patches are already applied to the appropriate
> trees.  They are:
> 
> Xen-unstable: 1c18d7377453^..b5926c6ecf05
> Xen 4.17:     d2d2dcae879c^..9ac2f49f5fa3
> Xen 4.16:     08539e8315fd^..de751c3d906d
> Xen 4.15:     db3386e6cad6^..d7b78041dc81
> -----BEGIN PGP SIGNATURE-----
> 
> iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmURr2UMHHBncEB4ZW4u
> b3JnAAoJEIP+FMlX6CvZA1QH/RNSR1O6QJjd7z2gSGA9Yka7VWyYOMB2J01AaIl7
> 69zCRkpqg+baF1aQaAVR0fj39aF7M7xXrd/LSk+E4BBiCRSxxRzbWUGYn9qTLR9w
> srbpGXqy0aWod9MiwfbTuEzf9uG8XpwOGoRg6p6YBRYE3WrQxIVnYY+KjeeToTEs
> +UXZ0iZPrjaGaqKnF+PpkX4CMsqHhxk3iJw+ZFX2V4fVNRYgCOpjejmMjbWM4ABr
> eSsCjTU92/YZvFOsTeIzu74h5yM6SH+XTPW2S8Ve5j3mk7sM8nIiYbIyTMWNCJID
> HXeodt6eHjhZzV2z7f+/zEngnoITIqz+X3tRcTkHB9+H5jU=
> =AtsG
> -----END PGP SIGNATURE-----

These detailed security advisories are one of the things I love about
Xen.  It's hard to trust a hypervisor (KVM) that will not issue them,
for then one has no way to know if a particular problem got fixed.

I'm CCing KVM here to make sure they have a fix.  From their Git commit
history, I am almost certain that seL4 does not.  I'm CCing the seL4
developers to alert them of this and suggest that the x86 port be
removed or at least have a big warning.
- -- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmUTjHcACgkQsoi1X/+c
IsH6/w//RbvVlls3bC5IUSv+cB3e8aQmiFOuosxycKki3PjMeHD/nmTnlQIZteQU
EXRJRilEIfI8QsDiHKXtLz/gv9oDAvPKoUnqvdoRp9XKtUJ/USueDfujtWXSZB92
yhXMvCQ7m8Jaz0am7MbVBnZP3l2MTopHXxTe9ukeBJ2OAbGPFpjgv5d7uBpjmfTb
vb2YE8fL1iS2hK1njBWifL+Ss70JNlSfIHBHRVMtNZg6xyC0B7fW7PPtXHWfVjMd
PR6huOFg1v504ijacOYYW0eWjUv2aaURsKKAJaw5OnxbLzv6m+AxNBVAnss00PH7
B8KxhCNFOliGIm0Ih2S4F7EXFIYBQlzzAp1M95qzgY6FEurBasQ7OAQcsOFx1yae
UCm56PCZcoQhEKDbA96zJhxi1E320W5MMQeYm3ByB1/jCRQxq+4gRVUp2T00tFAu
C/LwdQJ5p5iHqhtZ9Y6YceA7OPbU+N4NhHC8azKj7gDvkpAYWrq1LzQrGaGE65Ax
Th8BdD06iMK4ZZljl1MwkwLrZw3PMOpNz6I2YKQ/NktDGIDDIDDYQXCsoRb2Z+NU
ZFAyaj5aUKMQCvzya+MYXP48r+CQl3nl4jLr6Fa0yEvn1ouWEByYuPOWR4JuyZI/
WtNSpCHRoyqX7SF60FWM5yDGCwJ07eJrmzIKWje6uthjmqjDmFc=
=WiIH
-----END PGP SIGNATURE-----

