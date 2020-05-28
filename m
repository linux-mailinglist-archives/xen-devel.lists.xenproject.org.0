Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DFE1E5BF4
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 11:33:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeEu3-0004VE-3y; Thu, 28 May 2020 09:32:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVz=7K=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jeEu1-0004V9-6g
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 09:32:41 +0000
X-Inumbo-ID: 2c568de2-a0c6-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c568de2-a0c6-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 09:32:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96255AD3A;
 Thu, 28 May 2020 09:32:38 +0000 (UTC)
Message-ID: <9f807e10a188ad0877b6d9e769a37575db12c570.camel@suse.com>
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Date: Thu, 28 May 2020 11:32:37 +0200
In-Reply-To: <5939e797-09be-53d1-b87f-d6c6c97ea3a3@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <3db33b8a-ba97-f302-a325-e989ff0e7084@suse.com>
 <7b34b1b2c4b36399ad16f6e72a872e15d949f4bf.camel@suse.com>
 <5939e797-09be-53d1-b87f-d6c6c97ea3a3@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-RT0obdPu5SaH1+O+jnCD"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-RT0obdPu5SaH1+O+jnCD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-05-27 at 06:26 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 27.05.20 00:00, Dario Faggioli wrote:
> >=20
> > Understood. Problem is that, here in the scheduling code, I don't
> > see
> > an easy way to tell when we have finished bringing up CPUs... And
> > it's
> > probably not worth looking too hard (even less adding logic) only
> > for
> > the sake of printing this message.
>=20
> cpupool_init() is the perfect place for that.
>=20
Yes, at least for boot time, it is indeed, so I'll go for it.

OTOH, when for instance one creates a new cpupool (or adding a bunch of
CPUs to one, with `xl cpupool-add Pool-X 7,3-14-22,18`), CPUs are added
one by one, and we don't really know in Xen which one would be the last
one, and print a summary.

But yeah, I'll go for cpupool_init() and get rid of the rest, for now.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-RT0obdPu5SaH1+O+jnCD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7PhTUACgkQFkJ4iaW4
c+7kThAAxnCZvME7HLmR8t9EeOSTfvm00OcIzK6Izeq/qXf1zwZf7nPaSqSAmFPy
9OyKgZYQna/kDLcOwn1LxUnJkX0W3zY5tPbSr0Jrue67NYgafgYhKA0OqC4oVbem
esf4M+q1idXbizNAo0HpJC2WcNCACfLXP8VOjFGibxz79IVriqOLkwP8AZ4Gkw6i
ek+6RQM/lFv5/K5ahyokKBGElXthKIsV5KLk8pRfWR1Xn+2I+j/tPWiXaKarVnuS
+2Kj1yAQsz3sPXGLFKRuu76YzLRsc5QqDz2FJVm+GJPZOALNeW8A5l6klkVwx9OQ
zMUiTVoopL2YliIcf5eReBpoR6W7bAD/1xy6InrAKO3ANKHBLHvyuG5v+S2PbdFQ
LajYRc3z75iH1nAakBu/kHr/OXXBTflEXpqniunB0YwIybcaz37wuh9O7bGxpHfJ
SgviQQOCJ9SuAk8fdUxp4zJRsq+cn+ZL8JdekKjIoJnKAOqqAKs2bxPQhARj+SNq
JFG4GLlfM82ubYeUHKM6n4KX6hvAi5/JrWoQJyMdeyNz1LlvwGJbTsTwvaczDtjO
2N+FKdwGP5ZB+SpSkqcTVwTfp8fbq6MzlRGC535ULy/AlEYK9UlcddRAN60nBGtJ
oQaxzWzmYNjszQf+sknFec69y9NT0PbngNpKuvBnvlAzonOZDuM=
=duRl
-----END PGP SIGNATURE-----

--=-RT0obdPu5SaH1+O+jnCD--


