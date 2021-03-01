Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EB73288F2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91894.173442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmhA-0004Uz-J5; Mon, 01 Mar 2021 17:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91894.173442; Mon, 01 Mar 2021 17:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmhA-0004Ua-Fp; Mon, 01 Mar 2021 17:51:00 +0000
Received: by outflank-mailman (input) for mailman id 91894;
 Mon, 01 Mar 2021 17:50:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECex=H7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lGmh8-0004UV-Qv
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:50:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0348337c-8ea9-4830-a1e1-536fe6aafd1d;
 Mon, 01 Mar 2021 17:50:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E7E8AF4C;
 Mon,  1 Mar 2021 17:50:57 +0000 (UTC)
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
X-Inumbo-ID: 0348337c-8ea9-4830-a1e1-536fe6aafd1d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614621057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e5HKoGfB+y3kGY6j/M2cTra3AtFkg6Jyv/agP8L4YLE=;
	b=fE9yIycheN9ey4oOYZxyu5EHgROYIq5Uv60QQfQDCwi5GiSlLTNslO8CaPqLQNtdmv/6VY
	YrnXBQiYXeqgnAELupqBK/X1hMDkgAp+49P7SGBbKXtE8+eg0dGzTfueLvYGfRjetOUSGF
	dz1rGkFi1G3KGlOJ9/2RmtCeahBwpqo=
Message-ID: <c6042d2239aa2e4c579f5133a74ba0df725fabd3.camel@suse.com>
Subject: Re: [PATCH 1/2][4.15?] sched: fix build when NR_CPUS == 1
From: Dario Faggioli <dfaggioli@suse.com>
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Connor Davis <connojdavis@gmail.com>, George Dunlap
 <george.dunlap@citrix.com>
Date: Mon, 01 Mar 2021 18:50:55 +0100
In-Reply-To: <24637.3828.576373.217715@mariner.uk.xensource.com>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
	 <171d1da4-e87a-b154-5c63-a5627d4f93bc@suse.com>
	 <24637.3828.576373.217715@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-fccuFZjL47jbsyiNtCxn"
User-Agent: Evolution 3.38.4 (by Flathub.org) 
MIME-Version: 1.0


--=-fccuFZjL47jbsyiNtCxn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-03-01 at 15:57 +0000, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH 1/2][4.15?] sched: fix build when NR_CPUS
> =3D=3D 1"):
> > In this case the compiler is recognizing that no valid array
> > indexes
> > remain, and hence e.g. reports:
>=20
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-fccuFZjL47jbsyiNtCxn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmA9KX8ACgkQFkJ4iaW4
c+6ymA//RFzhIH5gRtTneO0vzKGGRudW8BWVKRCWCz1vMtrH/68At6K1n2217jXn
ETwdEVC2pmccK3zYDN5cnnV0Qg/assfeuB0mD/Emikw5dFKdOSk5hKxcYBaO0ltM
lAE8L2LBXRkZjLG8ae2X1OV+ekoNHMs0Oo14lNNqTy+eJfq0zpy6UKdeN4ly61Q7
7bNG7LruOQGE2HwAPZ5Kf+W83NzhVt+sh6lbITsJ2ybGNvIOisuSkysazHmczigC
yfukvxXM5/RXu36j1f2x/9LoDo0CoU4T2g/ULFh3ozKUpzqitL7IqEu+2Vk6iDHh
h3Bfef96mLPl8mTJ9qD/iMY8PWFxX/z06xdP1Je7a6XKZxfxIwt7YuEpn0G/X/iy
v9hNKr/pDA10vRpWTUlKbxrMEtb4DNiwcAHI2YeTnl3+oJEZL78H9/VwYblYWj/a
wXwA4UphglrEsJRwgmg9h1iHJVM5c0z/BZLRfn4ztz++diW6GD2oHCymCILM79ZI
oM8qQ+RzhEV7uYqHPqzGJ2PT+Bf3OTYDN9YmBe2Co7giVwJsviS9QjPihgTsHF8q
uEwyRKip1JAgpDvCltqvZHGDkm+NeqytHx0y16B75wV1+fj7L9XrAXMwPptpB0qQ
p65EFxCk9yAmz/td3tH2pNHb7AJlf1XFDxM8nq7WldGzcYfZQfs=
=TGRu
-----END PGP SIGNATURE-----

--=-fccuFZjL47jbsyiNtCxn--


