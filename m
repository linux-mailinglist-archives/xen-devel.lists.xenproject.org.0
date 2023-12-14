Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A695812F99
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 13:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654515.1021463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkP3-00004t-E1; Thu, 14 Dec 2023 12:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654515.1021463; Thu, 14 Dec 2023 12:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkP3-0008U9-BO; Thu, 14 Dec 2023 12:01:21 +0000
Received: by outflank-mailman (input) for mailman id 654515;
 Thu, 14 Dec 2023 12:01:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1CT4=HZ=alyssa.is=hi@srs-se1.protection.inumbo.net>)
 id 1rDkP0-0008U3-TA
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 12:01:20 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a327db0-9a78-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 13:01:16 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B10D45C0166;
 Thu, 14 Dec 2023 07:01:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 14 Dec 2023 07:01:12 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Dec 2023 07:01:10 -0500 (EST)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
 id CA06894F7; Thu, 14 Dec 2023 13:01:09 +0100 (CET)
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
X-Inumbo-ID: 7a327db0-9a78-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1702555272; x=1702641672; bh=1B4ThV600u
	QJHMyzGQwCFJGfVJ0JM9hKUZygdHA8jvY=; b=QxG9+FzVUnxG1xQHfwDHotyTDI
	4WbBVE/grZ3na48o2hQurbCrzTLdLS0nfAIGugLqe6tCH7Hz/K3xdTR8plhIgysM
	CLshuII9GWg678c62IkMQLgbadvrq7dnYnydAKvDWWkDnRG1moLH9bpVVY+xD1NW
	snK4pu3GdOqcouXMbW544fGvG+Jm3DpeX3a1XSmpVXy88sg6a7YntKyETOkWJzh7
	+d3Z/G1UB1ZnoQ/lBey6pi+Tu2H+cfEGa7Kg10D3P+/KTwK8UPDQzWoYri2vJ6b1
	KJcFt8pME5p21PqelvRaowAtDqkUNbAMaewSQzuSaXNB6qwDkgcWwk/VcChQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702555272; x=1702641672; bh=1B4ThV600uQJHMyzGQwCFJGfVJ0J
	M9hKUZygdHA8jvY=; b=XI87XLh3jv1ua4maFylcDpTJDEwnanYfQEz4juby/+ED
	RZ6sR87y+wVy4Hfq9F8ECXMwwguW2j+aZnR/tHlpsREsuH7FoLw2bNGhKj8kmjfK
	iVHJd1CvlVl3R98KlEaD5R+QFprvtCnY7bnw6lP2bhIYjVADVaIsQis+1fkMObAo
	TXxsUzlG1K/mJTS6tq+UUo1yzpvKEfUpxozwqrSMHvxdjWsg3KNH3hgmHaES9EzQ
	Sp5A7XWdU+GGBJtTXz5HS3NraQLDivuImFdTd9Ww2TsaNQwAvHaHs8MX9s8/liIv
	Skya9q/KlusOCoYhYh2cniP9AtDEAQg018CmsLHvKA==
X-ME-Sender: <xms:h-56ZQVsKPUqJ3SpOgQKUv3L-79KwwNf3RF76RxGjI8AVo-TaOXHMA>
    <xme:h-56ZUmY1OUliHUS_6tTbkXbSJqxDC6WPzQ760gCzaDSp96lWrqSzXoMhFqbykDQi
    Gv6lvXGvnF1zjLOeg>
X-ME-Received: <xmr:h-56ZUbFAoWyVrzzKOasOFDwiMT-RhI5oyseAt0fldW18ZHo4jEELGabknceIJ_j2tI5laOwZX0pDSVfEbEo1XaGpEqq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelledgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomheptehlhihs
    shgrucftohhsshcuoehhihesrghlhihsshgrrdhisheqnecuggftrfgrthhtvghrnheptd
    ejueetkeehfeeuleeugfevieffkefhteefiedvfeehuefhjeegvdeiffeihfeinecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhisegrlhihsh
    hsrgdrihhs
X-ME-Proxy: <xmx:h-56ZfVO1vQmL2Y9Ydla-TqlDcd1qUHxqTCj_cUGWEqXt7wrqdoIhw>
    <xmx:h-56ZamAT0ZgS7clk3lojibHg-HxeD8WepAdXTuFVCvEx5_eiEAciQ>
    <xmx:h-56ZUc6JAjYIF_wbVyhPgLkfA6i2kfPuSIvpipMz70EYByVWlVy3Q>
    <xmx:iO56ZfgWIZuUM1RvE3xItuBBcEDsy7JAtgKRRLepvIGKvBmmdBGiAA>
Feedback-ID: i12284293:Fastmail
Date: Thu, 14 Dec 2023 13:01:09 +0100
From: Alyssa Ross <hi@alyssa.is>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] x86/xen: add CPU dependencies for 32-bit build
Message-ID: <snd4jotxfjwcekc52dhkyhn6gcxtaqyo3fchxd5acgvsvcoiqi@douctxdas3fu>
References: <20231204084722.3789473-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bjargecwevzoc6i5"
Content-Disposition: inline
In-Reply-To: <20231204084722.3789473-1-arnd@kernel.org>


--bjargecwevzoc6i5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 04, 2023 at 09:47:01AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Xen only supports modern CPUs even when running a 32-bit kernel, and it now
> requires a kernel built for a 64 byte (or larger) cache line:
>
> In file included from <command-line>:
> In function 'xen_vcpu_setup',
>     inlined from 'xen_vcpu_setup_restore' at arch/x86/xen/enlighten.c:111:3,
>     inlined from 'xen_vcpu_restore' at arch/x86/xen/enlighten.c:141:3:
> include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert_287' declared with attribute error: BUILD_BUG_ON failed: sizeof(*vcpup) > SMP_CACHE_BYTES
> arch/x86/xen/enlighten.c:166:9: note: in expansion of macro 'BUILD_BUG_ON'
>   166 |         BUILD_BUG_ON(sizeof(*vcpup) > SMP_CACHE_BYTES);
>       |         ^~~~~~~~~~~~
>
> Enforce the dependency with a whitelist of CPU configurations. In normal
> distro kernels, CONFIG_X86_GENERIC is enabled, and this works fine. When this
> is not set, still allow Xen to be built on kernels that target a 64-bit
> capable CPU.
>
> Fixes: db2832309a82 ("x86/xen: fix percpu vcpu_info allocation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

This fixes 32-bit distro kernel builds in Nixpkgs, which regressed
with a recent stable kernel update.  Thanks!

Tested-by: Alyssa Ross <hi@alyssa.is>

>  arch/x86/xen/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
> index 9b1ec5d8c99c..a65fc2ae15b4 100644
> --- a/arch/x86/xen/Kconfig
> +++ b/arch/x86/xen/Kconfig
> @@ -9,6 +9,7 @@ config XEN
>  	select PARAVIRT_CLOCK
>  	select X86_HV_CALLBACK_VECTOR
>  	depends on X86_64 || (X86_32 && X86_PAE)
> +	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MCORE2 || MATOM || MK8)
>  	depends on X86_LOCAL_APIC && X86_TSC
>  	help
>  	  This is the Linux Xen port.  Enabling this will allow the
> --
> 2.39.2
>

--bjargecwevzoc6i5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmV67oEACgkQ+dvtSFmy
ccAnEw//dm9vi/PyxEvDgewLQcikutEaQ4Mr/mlXW1mcleyv2baqH09M6PSn/g4D
GeZIGzxLMK54gwgw0b+zqgXD1r7x2A27qQLsFOpEFM+LE3LcejJcULczHvznQ1IX
3kFLjGWh0zzFPrQYZ/CST9RtP0w57LF0QHgZ8Mc4Am4n5+irPeLX8/K14LiK//6i
79L1E/3N4w3L3TG2QP/6KinYgjhDNMJlzUgclSv6etMkZ35FRV+vAeZbh8porE/j
vkba4GuxjuHiBXGe4oKBDjtNJJyxVbEJzW+CHguwxtYimxq1cuwQNBhZpDZ5xjVn
5n53mxAeOX0IwXUoiQfhVUJ4OIidpUiDn9+9OCZPk/jDGCh0QbGkRxNTXw1iywSJ
iQ3EX3Iron/n1wwP/cX3ntCkJZkQxbSNwqXJ0OZtxqTeOcBJKqFibiytCGAPuzaf
iXDiowlss71+d005qC7+RmCVr2lj81B60OIungWzBUfN606XLrTLZk7u5Q2Y/0Md
nDPx123HMbHxon+2aiTsKHJwQ6gcebUGNVPKXv5zTHyLBS6Nm4ngWTrAVCU1srDg
K01jNFSd2vFGYXDpbxHF8nDczQ207UxHv80BYcbKT9UejszhTY8Bv7ApKsDpU5Ax
1vs0Q92y0gbzq56sB+v30doKgMH5Afkw5+M+HBT1ZtDdiBGJ/O8=
=hV3v
-----END PGP SIGNATURE-----

--bjargecwevzoc6i5--

