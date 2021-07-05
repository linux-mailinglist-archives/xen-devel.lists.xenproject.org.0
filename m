Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41613BC245
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 19:27:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150560.278361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0SMb-0003aK-9p; Mon, 05 Jul 2021 17:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150560.278361; Mon, 05 Jul 2021 17:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0SMb-0003Xh-5j; Mon, 05 Jul 2021 17:26:33 +0000
Received: by outflank-mailman (input) for mailman id 150560;
 Mon, 05 Jul 2021 17:26:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0SMZ-0003Xb-T7
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 17:26:32 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04f1e885-a2e6-4c3a-b600-085b260391aa;
 Mon, 05 Jul 2021 17:26:30 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx65HQLNQG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 19:26:21 +0200 (CEST)
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
X-Inumbo-ID: 04f1e885-a2e6-4c3a-b600-085b260391aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625505982;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=U1Njhrsmj4VYt48gFRngpWwKpy3qu3a/IBxyAIMSsZs=;
    b=sDJjnDpXLWPAadQPjr+kCnbHUpb6E8fTnUaTi1XuYIVy7aXrJYvJi8i29jR4z1p8sH
    WfhqamGwGOWtdkWpP3WGgKaIbCZ0LXinF04ixzYgF8DGg/v4MlkLIgha+qEhW1vsTabR
    NV/jImOiJXisOvHDOXiGtSF+6Krds/LtqUZQFxLIR4/RpdLLiyIM+akzw62tuHnxbF0m
    MajN+J6rBi7D/tDvRHmcPtQodliXjcagvAqh2WV8yrDl8itx3OCgGZEBUCykulxbQqig
    iL1ijxIQfVtj35f79GMKENK3+5IhHZIBzug59MUkapgER7y1yoMIx7KanKidi+AFwo43
    TfXQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 19:26:12 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Juergen Gross
 <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
Message-ID: <20210705192612.5cf50887.olaf@aepfle.de>
In-Reply-To: <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
	<668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NQP3wWLlE4OYb3teQUTMgGm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NQP3wWLlE4OYb3teQUTMgGm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 5 Jul 2021 17:13:28 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

>      ctx->save.stats =3D (struct precopy_stats){
> -        .dirty_count =3D ctx->save.p2m_size,
> +        .dirty_count =3D -1,
>      };

As said earlier, a consumer of these data may now be unable to initialize i=
tself properly. Without the patch it would be able to size its private data=
 structures properly to p2m_size. With the patch it can not know in advance=
 what the upper limit might be.

There is no in-tree consumer that is affected, and I do not have an out-of-=
tree consumer that might be broken by this change.

Just saying..

Olaf

--Sig_/NQP3wWLlE4OYb3teQUTMgGm
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDjQLQACgkQ86SN7mm1
DoCu8RAAnFuQtN2WKxSyNXFkBlsJWLKwdZ+ZfQ+TY/uScCbvkrQMwtqNYiHLORMb
lyUoXJuhWKy7kVbJr+9tmMgLd9Q7K0GNjRCT4KK9nN5Zbwo+P7h09jZGB69C7XpK
abTc7oHNtz8m4GSarLEsY3JvuJqnvCM9ORbxmHNeQdQgWkXVFJa9wLu3gx0vYbMb
U5lm6qZO6Ia3aqpBAJVY4g+CglOyvOgHbb0H/JzGbEKAjudSqKDs/JNj5zWnhQqt
9VedFJKwwzbPs7sXdCY0+uLcvYgY0SQC9yVCka4v5CFIjCw02W/tGhPXK7zszMEz
1U+pT0CIKXGxkB1Pn3KsFgNKr+unpRUJRL9liVqdQ1p1idTbJW8vkQ7JWqFoYwQv
HC71/XoANR1xSvJ6JvHqqlKrI7PpnCJk2Arp3BYuJmDWfZQiO46XvNczpcks03aj
XerOGpmUXj+F6BEGaBNV53YzNDcQCoKh5Hzk0hIOILjwwrxOSUY7u3OYIP8HvOZC
sD/WdFd6ORMTtd9YrcK2F/lmEGktoh86ixQKKuby23NW/66xDGsw5MHvt7rBvR3n
ZNo5xS8OxoMdTe9KJuDr6rUiTs9LaM727vq1KVh6Q0KcFJrFi2bPBD5Lr9DvysrX
LHRWuIzGwHwO/rzjYB1IrkLQwypXyLmwC+NRHZTFemX+hjpblC0=
=32uK
-----END PGP SIGNATURE-----

--Sig_/NQP3wWLlE4OYb3teQUTMgGm--

