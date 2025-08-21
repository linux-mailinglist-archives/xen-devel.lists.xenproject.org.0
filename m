Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5E2B2FC59
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 16:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088727.1446453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6Dy-0001VA-5i; Thu, 21 Aug 2025 14:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088727.1446453; Thu, 21 Aug 2025 14:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6Dy-0001Sz-35; Thu, 21 Aug 2025 14:25:06 +0000
Received: by outflank-mailman (input) for mailman id 1088727;
 Thu, 21 Aug 2025 14:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hypg=3B=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1up6Dx-0001St-4I
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 14:25:05 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f97450d-7e9a-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 16:25:02 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfhigh.stl.internal (Postfix) with ESMTP id EB5C57A017A;
 Thu, 21 Aug 2025 10:25:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Thu, 21 Aug 2025 10:25:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 10:24:59 -0400 (EDT)
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
X-Inumbo-ID: 9f97450d-7e9a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755786300;
	 x=1755872700; bh=OhNxsoFFQkWTaZaZT00LqF9GNpUuUugqkBvIccRcWlw=; b=
	Ms6l39ER5nIGQx2FJumqxhwu+WrmrnJ6sLljRyIdojiTcnFKvSZStq4fB+NfwSCH
	fXAVN+FVEtc287BgT12UobkUBm9CwPzIb0MuCsjFof+26A09OTHlI2gSwBW5mN0W
	HVPtpA1ptouwaFSjg5OraeYs6uCIYPRxQVUgTVgS/7vVbtZpFjJpESfPMW6lhDY4
	Vch2LsNWhxC1DR4+2uCCEyZLy3aAKLl+q87Yq5rjJYrsZJhPeou96AuadwUe69nS
	CC49Iw6DK5IBICfgv2Qd4IPOIKhSaED66hrGxU0pVSSFwe9f/3dor57nmxf4QhUD
	6AhGkzFimGY0k5JFbBSEQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755786300; x=1755872700; bh=OhNxsoFFQkWTaZaZT00LqF9GNpUuUugqkBv
	IccRcWlw=; b=lKzZUpE1KHLROxrq5+gxaXLFRn6ZGznzPNpGTbUAbRtzBDNszKG
	G3holoYGgat3DznEoc/YlwkEKH+isQB3nijHsd8LGNN0Snzd0Bi0Eq0dkiNYr/gA
	R45shUK9AH33P9tGN7Z6xIh2bsMpTVuV84yzs7+lH02NQB0RrLamm6xD7uJ5DUnL
	QDk7X74IGeMBCFyQJio1AU5hA5/vNM4Ghag00bAmVtwaULHuzxFNbQQTr9Agtwkf
	fPK9S/FoqrJ8N2HwZ1IaX3ZhDr8U1mi2MIZE3Uuvqgz6dA5ZD0vAgMBKdvCkucia
	IbzH2W8NmXVLjLxeS5enWyosFriH7AGKvAg==
X-ME-Sender: <xms:PCynaB395SiLFYhLJMq4OasDFxxGB1ita5yuN2u65gtAWZ-4LDbzhw>
    <xme:PCynaCrh-vWNokDwB4-ZDG0cDymxO1Xxx3PvWVDDx5BzkjqyCZ9JBrshT5NzfGYQ-
    fL8BwG4enJIVQ>
X-ME-Received: <xmr:PCynaOeo9fntOHP7wmctoeD4iwTMM4WRwOMK-JvMqg9u-y4cAWaXy9zcXuXF4ZnVuTT9pyXL6WOvK-xOJqZMvu6oM2Db3IGS1Oc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedugeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdfhlefh
    vefgheefkefhieeivdeivefghefgfffggfdvhfektdffvdehudfhteegnecuffhomhgrih
    hnpehprghttghhvgifrdhorhhgpdhgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegumhihthhrohgpphhrohhkohhptghhuhhkudesvg
    hprghmrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhp
    rhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsoh
    hluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mh
X-ME-Proxy: <xmx:PCynaBqqjdcP1hqKx_0u6tSDsWOC6R1N6kAntS9ypvwS3Pccst7bIA>
    <xmx:PCynaPEWs7iBGkl82ASqeq1oXEWmYGhHvibpbL04G8i33Zmrb4CWVg>
    <xmx:PCynaBte9DYPuLXEQPW6a8aE2tjgCUHw72w7wkSE4905I8UxHTwmBg>
    <xmx:PCynaBU6qTiWMR1kKva6KZe1VqXCT-vP2I4q1otOmDdvIduAZr-Z1Q>
    <xmx:PCynaPLeZqRhZ9ZTBBg5j3lapMAV80Vfje7Ip9ARLFuP98f-vGNp5Y0N>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 21 Aug 2025 16:24:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3] common/efi: fix Rule 2.1 violation in read_file()
Message-ID: <aKcsObV9UssO8ckZ@mail-itl>
References: <4a1a4a3406d227348afa1ad2ce90dc5264fdb44a.1755783750.git.dmytro_prokopchuk1@epam.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BuoLVtSrTj8aCcHX"
Content-Disposition: inline
In-Reply-To: <4a1a4a3406d227348afa1ad2ce90dc5264fdb44a.1755783750.git.dmytro_prokopchuk1@epam.com>


--BuoLVtSrTj8aCcHX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Aug 2025 16:24:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3] common/efi: fix Rule 2.1 violation in read_file()

On Thu, Aug 21, 2025 at 01:56:28PM +0000, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 2.1 states: "A project shall not contain unreachable code."
>=20
> The return statements in the 'read_file()' function is unreachable due
> to function 'PrintErrMesg()' which has 'noreturn' attribute:
>         PrintErrMesg(name, ret);
>         /* not reached */
>         return false;
>     }
>=20
> No explicit return statement is needed here. Remove the statement and
> write a justification comment instead. No functional changes.
>=20
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Link to v2:
> https://patchew.org/Xen/c20a58f24875806adfaf491f9c6eef2ca8682d18.17557115=
94.git.dmytro._5Fprokopchuk1@epam.com/
>=20
> Changes in v3:
> - removed unreachable code instead of deviation
> - updated commit subject and message
>=20
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/19964394=
44
> ---
>  xen/common/efi/boot.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 50ff1d1bd2..325de05b18 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -851,9 +851,13 @@ static bool __init read_file(EFI_FILE_HANDLE dir_han=
dle, CHAR16 *name,
>      PrintErr(what);
>      PrintErr(L" failed for ");
>      PrintErrMesg(name, ret);
> -
> -    /* not reached */
> -    return false;
> +    /*
> +     * No explicit return statement is needed here because 'PrintErrMesg=
()' is
> +     * marked as 'noreturn', which guarantees that it never returns cont=
rol to
> +     * the caller. If the 'noreturn' attribute of 'PrintErrMesg()' is re=
moved
> +     * in the future, compiler will emit an error about the missing retu=
rn
> +     * statement (build-time safeguard).
> +     */

I don't think this verbose code comment is needed here. Other similar places
use simply "Doesn't return." next to the function call, or nothing at
all if the function name already suggests it (which IMO is not the case
here). The longer explanation may be put in the commit message.

With that addressed:

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BuoLVtSrTj8aCcHX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAminLDkACgkQ24/THMrX
1yyUaAgAiB7ExZW4a01QoXccHKyss6IfgsRjlpvz8ODoSiMIMXHQi6Cvob9iDKyx
F+RQKrbDIDKGTEbBB1bFvQ/amtxP5EYBto4vU20YM/ugqYedbNMRg8Zxqs3MtVM3
CIMDtecd7yyFkgGwfEvgCVv+Fihrbf8kWcq/fcrAgfMVRLsjJhU0WHANWGrtpxfr
c6svlwG+wzlnTi8Spd9OiSjun0jK20W6v9xm5rpKM1o6gHLZurCy/wJxfDbCpJLW
llSsVl39Vi2NiyBr3i3B2b13oOiAOaycb4F9wJU0GqJ+rg8bJ+uJeIGHB9nIubyH
WfAkv2Hy5kBWxLet2qTpfeuADUiojw==
=I3kr
-----END PGP SIGNATURE-----

--BuoLVtSrTj8aCcHX--

