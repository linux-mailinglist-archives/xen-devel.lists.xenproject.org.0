Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43211912FB2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 23:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745621.1152765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKm0w-0008O5-5w; Fri, 21 Jun 2024 21:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745621.1152765; Fri, 21 Jun 2024 21:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKm0w-0008LJ-20; Fri, 21 Jun 2024 21:41:46 +0000
Received: by outflank-mailman (input) for mailman id 745621;
 Fri, 21 Jun 2024 21:41:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puzB=NX=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1sKm0u-0008I0-4N
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 21:41:44 +0000
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b5f353c-3017-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 23:41:41 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 1337B1140155;
 Fri, 21 Jun 2024 17:41:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 21 Jun 2024 17:41:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Jun 2024 17:41:39 -0400 (EDT)
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
X-Inumbo-ID: 0b5f353c-3017-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719006100;
	 x=1719092500; bh=rmhRodD+faCYOHLVSgPBTODc2fv+/MTedd6HdinNApk=; b=
	S1thRR+vlTz6/nAMQsFKln/eKpbZ78H02w3ePnR/sczSKgCC6SFxFFsdsJcDFovV
	MN9ug4/n8PNhQvvS2220eUxEakkZM1cDlyzJXQN3Z84J0tOqeDyY+pMOqC0VKPU5
	0Z4B+Y/tvA0E+XAx3W2o1D5ubNdeyxvFaUCCFNoP3X2VIkmE891gA7esT4xgkiFz
	dtNNffedSlw08hy/aoj3JkaLytO3f4WXrZzP9xWtwlu6wVVFNfAPQm5+vLW05GbQ
	Bkc/2D9PmkXy2O7csLyPKVBfC5zi5Ypjni27wktPFTV7112in/BpC4smoS1zaCj/
	KmjVUFZm303MsIqNaoXwOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719006100; x=1719092500; bh=rmhRodD+faCYOHLVSgPBTODc2fv+
	/MTedd6HdinNApk=; b=PSzTmV7wdMKskz2OVouQcou9R76FFiCsDhSitGBU3uSQ
	pAAE1pvcgVV2sY1O3/sE6cugdQimtDoFdxqp2vY/xSbCAibvHoLwy/PQbLDCXhIp
	w0u/B3QK3gXCtcMuJ8kETQzmn7LIFtvC9Y3OWcjHG8R/5j8Ocy5ZPrQ3apKOiWIz
	2L0LNsGlX9R18A9G/OIgidGOMcwqUGzGoDoj8L3Lm8pn+EVlPCes2VAwHr++PpGS
	WXzKOdXCgKyHOcuNh64IX6DuicGr/LlZgWRt0bV01f7K6UPGdG/Fw/9IqXGfOgQ3
	zrI9xbv0BKZdSMDW5BKTITEA34lbDzwIXalJDXKAig==
X-ME-Sender: <xms:k_N1ZkZGaKDpWxifqG9s-k6jiZVAwvng3wv-cEkKAVOQf6ZkB_D9pA>
    <xme:k_N1ZvbrBsDQ2wZ39oxW5jy6t9-PHHvQ-xUEV7KXuTIaeKWkovcO35T3ktV_g5m-1
    k0kGWuwiXTHCSQ>
X-ME-Received: <xmr:k_N1Zu_TGc0NcNRBInJLkAnNoQv0UaigR80Kj635iB6D8Qg9gkUQAIO7_BlK-sSjUr7ZwCKniMf5KWAFPIUrBwI4lwpQs-jAB36FrwuAwGW_aZyI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefhedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuedthefhtddvffefjeejvdehvdej
    ieehffehkeekheegleeuleevleduteehteetnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:k_N1Zupin2-Onmnh7uJCnn8DA6icRLpE3C7PIFR2pMB0RBsDV9KiaQ>
    <xmx:k_N1ZvodtxHZIjBoy8SxGU74PGXOiT2rhgapZDJFR8TFZNXmNdO4ng>
    <xmx:k_N1ZsT7RP-ZKws8yEpz5ivoo880fXD-qCmxTF1ICKQV5Jo5MINOMg>
    <xmx:k_N1Zvrb3i3ow15ZzS5v_33KPeCWTWGKXZFdZnL79SLg1MHSwjdmWA>
    <xmx:lPN1ZgCAp6osZ5YboWyARvqrbKpl_IkTVnHb5lzVj5hclBJZG624Uqkt>
Feedback-ID: iac594737:Fastmail
Date: Fri, 21 Jun 2024 17:41:24 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 v2] tools/xl: Open xldevd.log with O_CLOEXEC
Message-ID: <ZnXzkUclprH8TPLR@itl-email>
References: <20240621161656.63576-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XuZz6rjuyGgiM3Xk"
Content-Disposition: inline
In-Reply-To: <20240621161656.63576-1-andrew.cooper3@citrix.com>


--XuZz6rjuyGgiM3Xk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Jun 2024 17:41:24 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 v2] tools/xl: Open xldevd.log with O_CLOEXEC

On Fri, Jun 21, 2024 at 05:16:56PM +0100, Andrew Cooper wrote:
> `xl devd` has been observed leaking /var/log/xldevd.log into children.
>=20
> Note this is specifically safe; dup2() leaves O_CLOEXEC disabled on newfd=
, so
> after setting up stdout/stderr, it's only the logfile fd which will close=
 on
> exec().
>=20
> Link: https://github.com/QubesOS/qubes-issues/issues/8292
> Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Also entirely speculative based on the QubesOS ticket.
>=20
> v2:
>  * Extend the commit message to explain why stdout/stderr aren't closed by
>    this change
>=20
> For 4.19.  This bugfix was posted earlier, but fell between the cracks.
> ---
>  tools/xl/xl_utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
> index 17489d182954..060186db3a59 100644
> --- a/tools/xl/xl_utils.c
> +++ b/tools/xl/xl_utils.c
> @@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char *pidfil=
e)
>          exit(-1);
>      }
> =20
> -    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY|O_CREAT|O_APPEND, 06=
44));
> +    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY | O_CREAT | O_APPEND=
 | O_CLOEXEC, 0644));
>      free(fullname);
>      assert(logfile >=3D 3);

Definitely an improvement.  I would also add O_NOCTTY to work around a
particularly unfortunate Linux kernel design decision, but that can
either be fixed up on commit or be a separate patch.

Reviewed-by: Demi Marie Obenour <demi@invisiblethingslab.com>
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--XuZz6rjuyGgiM3Xk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZ185EACgkQsoi1X/+c
IsG+Lw//SZp5UlD/jH/152jWbKOm9LiZzzaLTCM9vLsYyUwP1sNlTy1bkhDQhhRe
lsVibpcfV5HTzgM1TBuaCBatqKsUVLQ/XzDK89BUtVtFukQq5MDSmQshixkC3Nnn
em8uaEKczu2fxEiu22XL+IFkn/5RIssZcf/HY8QZEqIfgoDfLrkIYEJ3MWB6sKiH
Mav5clRX5iVWFV5qqae/PY8UUF6q7bJ0pE3TgNB2OBSmr+Iu2cWNR3XcAVAs7fdF
4Aund9SvzhvsQWj2Cz6Rf57be8R1K+/9xjrSxeJV3+ORJAp5JE58w69dturpltxu
dvwd62mf5g9DoYxpRN45Cp2VFVME3it67tqc4qvlznNGpiY7jIOsznoAQrUNDVdt
AJ/EMDtb8rD34ft4JafLHQnid9k0CpTN9u4mElZB+cN89ebSJ6rzFYBDfDsSbb7H
1EY3+wNXEKA+5af1IvGISt7hncGgWW2Qa4ggsaPCGVwXNEHtxvEHnagux+/shjgB
J2dOsne578dFoGBUp4ee5zX1ErVfC9eks/msU/iLixgar2WkHhjiLkqN0n1t1RO1
2fRITrgfqfdYw4ms/Lkyu2G3F+1Qkv0fpjgl9arSVkZykB1RCoNiRRZ4Q0++1PpD
RztwcIDC3GnaJX+wPmngQASvU7G8FO9+x+4rxby9gnqCztpSpjQ=
=/IB5
-----END PGP SIGNATURE-----

--XuZz6rjuyGgiM3Xk--

