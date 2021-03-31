Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4793350527
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 18:55:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104025.198510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRe7e-0008GM-5K; Wed, 31 Mar 2021 16:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104025.198510; Wed, 31 Mar 2021 16:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRe7e-0008Fz-1w; Wed, 31 Mar 2021 16:55:14 +0000
Received: by outflank-mailman (input) for mailman id 104025;
 Wed, 31 Mar 2021 16:55:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Uer=I5=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lRe7c-0008Fq-A8
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 16:55:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 941dd7ca-0e42-461d-9f73-260e717c1de9;
 Wed, 31 Mar 2021 16:55:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A83B1B1B7;
 Wed, 31 Mar 2021 16:55:10 +0000 (UTC)
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
X-Inumbo-ID: 941dd7ca-0e42-461d-9f73-260e717c1de9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617209710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dwXYn06xsaariBCOWNv8xq5GNcJP9Qy8s3k2lCYS7XY=;
	b=KFwW1tNE1NnNL8MfWroksI7JIIodcu+/jNcADswDc+a3L79J/BiFqt28esEN46x6tcED5/
	uTNC8zLRijFxonJcMnqLIPkYgcUxBqNbaIj82Oif17gnUJ1tE+MLEssrMvIu88sjwOK8BL
	aGXvCczU1aYgLE7/Oh9GaBqQv/7c/bw=
Message-ID: <800b163affc6334837006a6ef6f8e21415d874e9.camel@suse.com>
Subject: Re: [PATCH] fix for_each_cpu() again for NR_CPUS=1
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	 <wl@xen.org>
Date: Wed, 31 Mar 2021 18:55:09 +0200
In-Reply-To: <4d993e67-2bdf-9ac3-f78e-daf279642de1@suse.com>
References: <4d993e67-2bdf-9ac3-f78e-daf279642de1@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-FQnXAOw4QSFuFtBZxbUv"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0


--=-FQnXAOw4QSFuFtBZxbUv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-03-31 at 16:52 +0200, Jan Beulich wrote:
> Unfortunately aa50f45332f1 ("xen: fix for_each_cpu when NR_CPUS=3D1")
> has
> caused quite a bit of fallout with gcc10, e.g. (there are at least
> two
> more similar ones, and I didn't bother trying to find them all):
>=20
Oh, wow... Sorry about that. I was sure I had checked (and with gcc10),
but clearly I'm wrong.

> [...]
>=20
> Re-instate a special form of for_each_cpu(), experimentally "proven"
> to
> avoid the diagnostics.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-FQnXAOw4QSFuFtBZxbUv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmBkqW0ACgkQFkJ4iaW4
c+6sxxAAgBtep+8nzDMx2uwG47MWgbH1esYdefEipNxfYMJfpUuVABJqkFh89TnO
orUg0nmIfFkPxvwFFfcy3yPh0WoLxVZZNT2t+UYmtiqXJRJEYU6E7hFg67KBpcgx
o8g/DChpwU54zsiaE3II4PbYvmUwhJExzDqh7PPyIAMxjn/eZzS1MRlHbhj54HyL
tXYpYikjenqQsk7lHC95MXBo4E+yFKWm7WcFeOxu25JoJV0xvofZDkl82julLoMN
SdR/eEhtgT9GxoyisC3OOaXm/eNJfrEWu3zYfXTauNO8x6qUnZqfvpeWiDzjfrn9
6bNTOHAOnXyLLu7BLBcJARE4pkAxFshGSU4BfONqgExMkANMDiq3+d0hXWfYvTRy
7h6XfWhCJo1HD+JlZVSY/JveCLPp8TCwqLjG3D9bdE8QKIOUEytZHhqI7EoynxwE
P9A4akah+AIF90wC/iNvVcA9feAYRq5Hmj31S72p0zESWyaO0FjuRj1pT1L/mXzN
BGSYmsCMAmruQNEXFjoOsNxAmQHxzFmbJP1oJKpzaBhIRGDcav5K/KxGpJvuo9rD
1e5I0Wy5In7+zgaIdYmk6EdCxtz9+Fenoe3qt7TdNbaVBVkbuyGO7cVL91BQ8rES
+2lhujFQ2KMhHi/phf+B/hBDFBhcW8WUnmVOJ+sUTz6gkpvj78o=
=7O1+
-----END PGP SIGNATURE-----

--=-FQnXAOw4QSFuFtBZxbUv--


