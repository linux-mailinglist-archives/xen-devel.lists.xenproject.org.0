Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BBC3ACAC9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 14:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144562.266061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDZX-0005gn-O6; Fri, 18 Jun 2021 12:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144562.266061; Fri, 18 Jun 2021 12:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDZX-0005du-KS; Fri, 18 Jun 2021 12:26:07 +0000
Received: by outflank-mailman (input) for mailman id 144562;
 Fri, 18 Jun 2021 12:26:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ygMg=LM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1luDZW-0005do-ER
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 12:26:06 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 210882b9-42e7-41a0-866c-45128d271e39;
 Fri, 18 Jun 2021 12:26:04 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.3 AUTH)
 with ESMTPSA id x0a371x5ICPx46K
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 18 Jun 2021 14:25:59 +0200 (CEST)
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
X-Inumbo-ID: 210882b9-42e7-41a0-866c-45128d271e39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624019159;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=/TW4BiEvBDjllDQnZAPrJ+uArR9mZmtaUguutBvsnN8=;
    b=AHhDuUfHTCOzj3u3kQ56HMsDRmNXTyZKC64+QCWxomMkVBJp9AYhIMRyX1p5ZhSdPw
    e/BT50+PSJ+GMzs2e6CGfNcW3RhwMFtFkeu15DZRfE8yvvYYpzs49g7vTprm8mJhlbJH
    iWvohJbsLz/VsT1Ph11w3ngcIb45V8ImdCQNdFzRxMhT8S2rdqpMeu4FvFvY1Sez6SED
    TDRhoZTpNtfhaeuYXU3W4sjTRqwbpyV4nCmnYQQLUhO9K+S5minXfyAL89rS44ZVsEsy
    nyKxAKB9eo3Oj0GpHJA2R+/7zLsA2JLmKOMkid0IqB657QShaVthekaAV/N2ExzjOZY0
    Sg/w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsVxSIbR7sf0kebs4Z3Zpqv+Sabl5o7CzRq+Ps8Q=="
X-RZG-CLASS-ID: mo00
Date: Fri, 18 Jun 2021 14:25:51 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v20210601 07/38] tools: unify type checking for data
 pfns in migration stream
Message-ID: <20210618142551.62d4fd3c.olaf@aepfle.de>
In-Reply-To: <9045add9-0cd0-7f9d-87ef-26cea15b74cd@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-8-olaf@aepfle.de>
	<9045add9-0cd0-7f9d-87ef-26cea15b74cd@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ukvn0dd5zXdv3TUlbCUnVnj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ukvn0dd5zXdv3TUlbCUnVnj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 08:59:13 +0200
schrieb Juergen Gross <jgross@suse.com>:

> > @@ -152,9 +152,8 @@ int populate_pfns(struct xc_sr_context *ctx, unsign=
ed int count,
> >  =20
> >       for ( i =3D 0; i < count; ++i )
> >       {
> > -        if ( (!types || (types &&
> > -                         (types[i] !=3D XEN_DOMCTL_PFINFO_XTAB &&
> > -                          types[i] !=3D XEN_DOMCTL_PFINFO_BROKEN))) &&
> > +        if ( (!types ||
> > +              (types && page_type_has_stream_data(types[i]) =3D=3D tru=
e)) && =20
>=20
> What about XEN_DOMCTL_PFINFO_XALLOC? Is this case impossible here, or
> are you changing behavior?

I guess this needs to be handled somehow, a large enough HVM domU will have=
 XEN_DOMCTL_PFINFO_XALLOC in the stream. Not sure why this was thrown away =
with the v2 format.

Olaf

--Sig_/Ukvn0dd5zXdv3TUlbCUnVnj
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDMkM8ACgkQ86SN7mm1
DoD2xQ//fO3Xbt+r/BIIt+o6qptSirExEnovM11pchpLRlN3od7LameRXtwixCAR
8WKObbiZ+7KR2hj+Ip7hGEc2fzTuoOYnqT1hh3k5oJdj+Cup3Q8R/H5tLNZb69F0
yGinbKKdFWC37ytGUgQcMHWpohjJN9dF7e1qhaEM9cXz2EpT74lvc8riwWOHH2Lr
9QLtXvuts3zB/flWlfEoEZPui9dtaZVtb/mno+yIgFUtoXB5FF8RIGknaoTMQqnY
88LiwLriMhJ3a8b5Q4wMfG9hfmEwS5Mf8RY5yoyWx5QT0yvrE7w1Rg7wuy7PVJfG
36DiUjhoyW6dZ3lbdVYnAN2zFFQWXwL/HCoq7IFZ0Y3z6Q1CCk7X8QX7+09llyv1
0D5E1WRMiBT9bVGW2JKx+Olew0JIskLybfD4ZzLVyU826L4I9nR+Z1n6vHWoBhX8
RNb/xSsS5q/Vfp7LW3nATK6KzmnAiMo36NgGOowtWec2PJ/rcExuiAU2RRqeESrE
5uVX1uYgfU9ciWymHLa9aDtt9b0nd3QMW0corKek3O2D12GwJquawCJbO0OuJYjZ
zotttuhaGSGFh03npMcJzCV5LBQj4xU+zoIkuipp4ySMdIDox9FMGPUmkEID2hiM
SyZzlqFafv6eC5++2d1FN/tUXuf13TJVUQoa0iN9ySNSsOMoeYI=
=6T+w
-----END PGP SIGNATURE-----

--Sig_/Ukvn0dd5zXdv3TUlbCUnVnj--

