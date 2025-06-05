Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3BCACF0C4
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 15:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006887.1386142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAkS-0001NK-J7; Thu, 05 Jun 2025 13:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006887.1386142; Thu, 05 Jun 2025 13:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAkS-0001LR-GV; Thu, 05 Jun 2025 13:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1006887;
 Thu, 05 Jun 2025 13:35:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B23G=YU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uNAkQ-0001LF-Fg
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 13:35:10 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2f9033e-4211-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 15:35:04 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 4B60D13802B5;
 Thu,  5 Jun 2025 09:35:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 05 Jun 2025 09:35:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jun 2025 09:35:01 -0400 (EDT)
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
X-Inumbo-ID: e2f9033e-4211-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749130503;
	 x=1749216903; bh=Ig8lrPs2/XgtloRy6DLLL604F/dk4LIwQ/GemHxYXTk=; b=
	knnfLj+4zJxc8X+JwQnTdQpzKQkjhbMcLuxcUBus+H9/XQ+V41gg2TKOB97+Teux
	q2OQeSSiWZMyuvZHuqNBkOu0xZjiSxsC+BBcuF/9q2Ll0tFAJC6c4j/JQ7TBd1Nr
	qkQ2lS4vVn18xR3HtdSxoIxhIgpL5lHjV6iwJBN6m6Qqcd0nqkEqN+7GluEl/agd
	qbsMVhC9Y5nvMQPvNl1oOCLf8sLI7W/k2Q36NzzfaAquCFHKq8HoZVOrsCrSnBm9
	DNNBt0Fq4d8tZZJ5O+SpN1+XC+NkuMWf/XefwkAq1uI7PTFZN/YazS9X+gGSt+cW
	KEIn/qE1GKorEfUndEAC3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749130503; x=1749216903; bh=Ig8lrPs2/XgtloRy6DLLL604F/dk4LIwQ/G
	emHxYXTk=; b=YWWFWwhgB5MoaEGt40DnEX6VGmYsMQsKI4ZSSZY6puQPK0t6mxI
	3torkpX7PS5PtMoSIYC/Uh2HuJZkU+KaBlkCj7HEo9RdPRIli5ne5zJ2CAv+LqsS
	nsaecIRAilLo9Xin3Sx/tm7ZsvIE3fYqPyzqmpdIc2Tc0KChfCDhfznr6/pfc4U/
	W8H608Yp1kLoSAaqpWXE0M0ARAdJZVpgs7xQyelzkga+aRd9MjKsrrReiLtIgQ0Q
	85bcIiGY3gz6iGeaFozD31Xi41LX+zFmCUorr81l8Em+ldKShE1N7MS07KyeNvjZ
	LLWd8mO86CmIIM8lC5bwmHaLQPsxzIUO2Og==
X-ME-Sender: <xms:B51BaPOVUYTVE1P98y-HgGuo6gX1F8fJO_Jwzlow22rA3qKKF_DhiQ>
    <xme:B51BaJ9Gb-ERFOtxctD9E_1frJyS4qExNgGDRXugdWKJBOVL5RyPkytJoF7x32jJD
    8Efzg5bysVHtQ>
X-ME-Received: <xmr:B51BaORDyOmnOcFxtmO0g0sTnNQokP_ANEsYzttTjkCnJ48rl3eZJbb91TO4C2P8eBtDKuJU8SMRKJAZUC4Xi5BTbCCQxrLqU8M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepheegtdfgvedvueetheelgeetgefffeefvdehueelvdeiudefffelhf
    evveejveeinecuffhomhgrihhnpehgnhhurdhorhhgpdhkvghrnhgvlhdrohhrghenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrh
    gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthho
    peeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgthhesshhush
    gvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidr
    tghomhdprhgtphhtthhopehrohhsshdrlhgrghgvrhifrghllhestghithhrihigrdgtoh
    hmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthht
    ohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpth
    htohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:B51BaDssVwqKGr5SkOa8rjsMCPy1DtIQgobcfq73f4MBgWbuAsUjBg>
    <xmx:B51BaHebguXSYwZnhGvT3LFighpNvPXl3xcaz13wsrCsxXJ3Ad2YTw>
    <xmx:B51BaP234xTmAMHWFy_Jpczbj60jmMJo2w8bOZvlTtPJF2v_yRpkHw>
    <xmx:B51BaD82HPJq_N7CZfUe8W5VHP8bSDkEuadh14KY-2jmt9cVm5XuFg>
    <xmx:B51BaAXcIOlxIdMFn7pBp8Q4sGDv_liAJJRJCTg1d0SOHzlO2hwidIAe>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 5 Jun 2025 15:34:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
Message-ID: <aEGdA1T3F1NTtcvO@mail-itl>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
 <aEGLjhw8kTXKbkdV@mail-itl>
 <f2077d30-3324-4b86-91e5-54e3a6273c48@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P0ORzQzBCX5mHtyo"
Content-Disposition: inline
In-Reply-To: <f2077d30-3324-4b86-91e5-54e3a6273c48@suse.com>


--P0ORzQzBCX5mHtyo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Jun 2025 15:34:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid

On Thu, Jun 05, 2025 at 03:08:07PM +0200, Jan Beulich wrote:
> On 05.06.2025 14:20, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Jun 05, 2025 at 02:02:21PM +0200, Jan Beulich wrote:
> >> On 05.06.2025 13:16, Andrew Cooper wrote:
> >>> The format of the buildid is a property of the binary, not a property=
 of how
> >>> it was loaded.  This fixes buildid recognition when starting xen.efi =
=66rom it's
> >>> MB2 entrypoint.
> >>>
> >>> Suggested-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> >>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>
> >> I'll pick this up without a Fixes: tag, but I think it ought to have o=
ne. (I
> >> didn't check whether MB2 or build-id support came later, hence introdu=
cing the
> >> issue.)
> >>
> >>> --- a/xen/common/version.c
> >>> +++ b/xen/common/version.c
> >>> @@ -203,8 +203,11 @@ void __init xen_build_init(void)
> >>>      rc =3D xen_build_id_check(n, sz, &build_id_p, &build_id_len);
> >>> =20
> >>>  #ifdef CONFIG_X86
> >>> -    /* Alternatively we may have a CodeView record from an EFI build=
=2E */
> >>> -    if ( rc && efi_enabled(EFI_LOADER) )
> >>> +    /*
> >>> +     * xen.efi built with a new enough toolchain will have a CodeVie=
w record,
> >>> +     * not an ELF note.
> >>> +     */
> >>> +    if ( rc )
> >>
> >> Instead of dropping the efi_enabled(), I think you want to replace EFI=
_LOADER
> >> by EFI_BOOT.
> >=20
> > Part of the motivation for MB2 entry point in xen.efi is using the
> > same binary in all boot modes, including legacy boot - in which case
> > none of EFI_* checks would be appropriate here. The grub series adds
> > support for loading PE binaries, and IIUC it isn't tied to booting via
> > EFI.
>=20
> "The grub series" being which one?=20

https://lists.gnu.org/archive/html/grub-devel/2024-03/msg00080.html
| This patch series implements support for loading and verifying a signed
| xen binary. This would allow the same xen binary to be used for BIOS
| boot, UEFI boot, and UEFI boot with Secure Boot verification.
| There is an accompanying Xen patch series.

> I didn't know xen.efi's non-EFI MB2 entry
> point could be used; instead I was under the impression that someone was
> having (half?) a patch eliminating the MB data from xen.efi, as being dead
> code.

See also
https://lore.kernel.org/xen-devel/CAG7k0EroeA=3DcRRDWnJqzH8esoaSmtg8-xjTwc-=
01og5R9JwPzg@mail.gmail.com/
for some extra context.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--P0ORzQzBCX5mHtyo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhBnQMACgkQ24/THMrX
1ywnhwf/bAZrULA8myvNFHOWMClznpeJ3V+/Ex76QCVuzPtWzx4xdfpLGIukQWqL
erl6hYDbaM8YyzUgGPcMfqIDKSh/hL3nuET/ZACWklqTA5XVGhTbTOZb/Hs7u+TR
PgCzAhc3GLGx46/RggZrUDrbBh77jmD/rEC25n7wd9SzeKkpEZWChMoXShjAIsq8
6I2uG4+pAwY2LqD/javYkdoz1TNkwflBMts0SfyGXWO2cfrmqJ23YWM4WE0Q4UmF
6hBZjVTebIe+/rT28y67NnR//GNHo7HAJNPeXFM9LrPYfKDyb+uZ7Xrh9uvMeri4
SvkmAuTDOh/xQj/V58kkBowiih1/9g==
=/rtk
-----END PGP SIGNATURE-----

--P0ORzQzBCX5mHtyo--

