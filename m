Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789DC3988C9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 14:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136005.252377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loPar-0003ZB-89; Wed, 02 Jun 2021 12:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136005.252377; Wed, 02 Jun 2021 12:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loPar-0003XH-3J; Wed, 02 Jun 2021 12:03:29 +0000
Received: by outflank-mailman (input) for mailman id 136005;
 Wed, 02 Jun 2021 12:03:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSCb=K4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1loPap-0003XB-5S
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 12:03:27 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9465871b-b965-4b2d-a28d-a1f5d97931bc;
 Wed, 02 Jun 2021 12:03:26 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx52C3K4kh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Jun 2021 14:03:20 +0200 (CEST)
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
X-Inumbo-ID: 9465871b-b965-4b2d-a28d-a1f5d97931bc
ARC-Seal: i=1; a=rsa-sha256; t=1622635400; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=o/k9BmSuh566IxKB34lOOia0hX76LEF/QGxZeQItKEFMoMnyk3JpSGJEKfR8ZF/qT1
    e3Nndi7nraZG6tiYTYd3u2BLbgyYleLYioXD2IeNcTTRK+JCkOORGsfi8bE3HBNU7RX9
    hsLR7SG4TQzqQvREe9uLRxlF1Re0Pn8Ms8wuCuPhxGxuyQDNyyXL1Bqj9H6++oCrQE80
    qIvbIfycH2L5Zuu5I+WJ/eaOkJ+bEbwJ9iF27mFPjycAKm9HjhTsE3fuwgS6Uy70GQk1
    6q6cftGkCl5PR/czGRjDWwP+pFjK9viMaUmtb39CYqzVcoLOoo9t7zNeiH7EJ1w0cJAr
    iNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622635400;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=FOduCrl90ZiaFx9X3ycOUkHkthPsCWuIsPfGUyiJQyk=;
    b=j7RzIrqEF1T/QZctBrmETPwg0K3qERUB1Krng1RCINS7gGQyfH4jjMb4XhejZSbzsU
    pLMv9S2N/ZxZb4NK09VkMFKnMoVURifmP71X6FHl7gxmn8pJC4VpiuEgwV6l3C8YwNy0
    1c7GW2T8i9SgpsluZvQHVYwqlP9XlNJ6dHhxewVKBdPbSS/yUKGn3z/ZFUF5DZ2p3/O1
    yjWkC9oTKmBXP9yOrY/kGYKYdCe0qP3tnVWIuylOCY/vFHZnOGAxq+ZvqJ/rjlGGov1v
    yLLpQsM+Pxa8K3eZTWXIgQnJXjAaBtT+OXzTjlzDZiKZwsdlrLzJuTDXkbOwefvuwqAJ
    2HTA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622635400;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=FOduCrl90ZiaFx9X3ycOUkHkthPsCWuIsPfGUyiJQyk=;
    b=ftAzWh0wULzVYaEote6eofUzJNg6pg+ZKWALlsNsck5N6oZzPvMcOv9+d1SUd+jkmV
    /oyXoMiIfhnpALA22nj3xpGSqxsQ/rABeuCe9TKDOHx3B1Wm50TR5TzFpf7n2hQ6gJdO
    ynJEC08IgxFnSJtykzS4k3nqT5i0P/XhsN3uUtcjXH6Ns4mlt+vBXTOkhaxc9pWjmg7b
    ++2/lC/ean9vMhTkxLo6u+X0bQEjZtiDa3miwKfWCy6UcjwrC79nJ0bb+8F1qDR/xE8L
    U94X9FQg3A0L6JnHKNlhmbFlwpXqEHNCIKb1UFLrTikQh+XKwPv61mT9PTuTml/8TVC5
    aCjA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Wed, 2 Jun 2021 14:03:05 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v20210601 09/38] tools/guest: prepare to allocate arrays
 once
Message-ID: <20210602140305.39eb417a.olaf@aepfle.de>
In-Reply-To: <531fe9c5-aa7f-be99-5d78-85d817139740@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-10-olaf@aepfle.de>
	<531fe9c5-aa7f-be99-5d78-85d817139740@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wdckj5UqH3WRIyOeSurKggp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Wdckj5UqH3WRIyOeSurKggp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 09:29:08 +0200
schrieb Juergen Gross <jgross@suse.com>:

> > +    ctx->restore.m =3D malloc(sizeof(*ctx->restore.m));
> > +    if ( !ctx->restore.m ) { =20
>=20
> ... this case might trigger without the full series applied, due to
> allocating zero bytes (same for the save side below).

Such bisection point with a libc that returns NULL would be just bad luck.

See git-bisect(1) "Avoiding testing a commit" how to deal with it, in the u=
nlikely case it actually triggers.


Olaf

--Sig_/Wdckj5UqH3WRIyOeSurKggp
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC3c3kACgkQ86SN7mm1
DoC7uw//SAZCXD0/4nuEPd2BKYrUe2N+Wlb4IpKJWH1jYcMuk2LBI+Ek8SYcv9AI
afH3rvwFispA6HWAFGzJL3h8/8dOltnPAYqFR/ee7yibQ6DoMViPKVrBcoTkGWCb
UUj0gzD2J9ThufTuvPGVsttQY9YpZPr1BI9pqSm/PIlGCNsOoc6zgFui0MYf+IdL
zDjvttw8fAWy726bYfaOMW7fg6H1nIFvzrGRQHNtSWSAZOJ2cyLDxKRQaLgS57uo
HViC+PPxBpRbeqJonY/fpVQ4Vr1h/ttguv+vGsQFsA9+b//DNxfvTHS8FcCxPrGW
sjtP43MVWAqgvSt6yJukXhw3tVPpjh/z2Ehpy833lx0BNUQEICqGDGzm0IMEGjwI
kNigftVUE1I8PG4YMgF6oWZnwB+PGYpHXwvSiLs8ssrYeoEa+BdVfneC5iG+p6/P
05KwdARU4P5fEPAfz6oDZuFRLvzN0ijVV7Dd7U7AX2lda0KpBLpeob2TP97AmxVd
9jEcBhy2woNnEAkK4j7jgqXoWRQRnAwlSwCf4o29PcY2X4Vy7C18FqgLO8QYIfx0
greM1JLgAPyOTYmMG/NSzxkdn1pRJ9rG27iVhQi4znF3KjEwdpH/oUOXG3XQNzHQ
lRODO5AMcWNuD/pRA/blZDuUB9+/wxmNZbWhnqd0nR6RBd48bDs=
=cSKW
-----END PGP SIGNATURE-----

--Sig_/Wdckj5UqH3WRIyOeSurKggp--

