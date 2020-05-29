Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F0E1E7A64
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:20:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jec6p-0006rq-Cf; Fri, 29 May 2020 10:19:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsAk=7L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jec6o-0006rK-0X
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:19:26 +0000
X-Inumbo-ID: de5e6184-a195-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de5e6184-a195-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 10:19:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 401A4B123;
 Fri, 29 May 2020 10:19:23 +0000 (UTC)
Message-ID: <d95076bab67035437d1e055c76adf4ad824b81e8.camel@suse.com>
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Date: Fri, 29 May 2020 12:19:21 +0200
In-Reply-To: <bc005ca2-7bf2-3bb0-b9cd-0be05c914f3f@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <3db33b8a-ba97-f302-a325-e989ff0e7084@suse.com>
 <7b34b1b2c4b36399ad16f6e72a872e15d949f4bf.camel@suse.com>
 <cd566bb2-753f-b0eb-3c6a-bc2dc01cf37c@suse.com>
 <a959e9e807dc1f832d151ab72f324f2c084c2461.camel@suse.com>
 <bc005ca2-7bf2-3bb0-b9cd-0be05c914f3f@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-wy4INCHohOVOxGNLEbcq"
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-wy4INCHohOVOxGNLEbcq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-05-29 at 11:58 +0200, Jan Beulich wrote:
> On 28.05.2020 16:55, Dario Faggioli wrote:
> >=20
> > Which means I will be treating HTs and CUs the same which, thinking
> > more about it (and thinking actually to CUs, rather than to any
> > cache
> > sharing relationship), does make sense for this feature.
> >=20
> > Does this make sense, or am I missing or misinterpreting anything?
>=20
> Well, it effectively answers the question I had raised: "What about
> HT
> vs AMD Fam15's CUs? Do you want both to be treated the same here?"
>=20
Exactly! :-)

And, in fact, the answer is "Yes, I want them being treated the same,
and the patches are actually doing ".

Sorry for not getting it right away, and just replying like that in the
first place.

At least, this led to better (more generic) comments and variable names
in v2 of this patch.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-wy4INCHohOVOxGNLEbcq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7Q4aoACgkQFkJ4iaW4
c+6fahAAlWVhZCevkedtkPUe2HQMxQP1cguOA5KzczytT02SExMXj/FO3/zkswN2
WsJIpkRBvdkrjq71YSjW9NsCxyTdKsv/twwVO7VOj7tR9rAaB0VU7d1zes0bWfN9
H4gRSa+L82wdI0xW9q+ZxlZRmqhJK0MjhTzaWz6bevM7D3Wrx+t8POW0iTMmCiMB
tjljMe7BlqxCgxsb/2fXoGmYzOXSNVLD7IgfDzhPnmOZ2YTjteCsHtpTq/jvCdMU
hDjBSoLfWKH5wkkb/SkBwqdNx3lXgsf6/6Alq3wXxmVYf05R6CHkbxVqzB2qVBm+
AIkbxrG3aPJ3KqQOuZoA0sk4uppPqqKvZXuRXlD3PaKt86qeI2W2HsTOXLh4TkCz
dQPxs/AZUsCwtJKMOZKRQFwiGsfE59cyFXGWaal7TibYAlUyYH0gtwgPxM+Kc305
wksJzr1GaDigSvOCznZpuYLrw2AJG7XGcwFqtqUPWy0nsFVfP7eLN2r5Ps7KgtPu
D7sGz1SqPN2ModAyp96O+Ixh2kslf7P8Xf7xb0nW772CX2XA1c4wtcL3uWnUnoBQ
C1OYttENwlnuVkBEpF2nU8vEZIBpUvuZIVMCo5ASnfZr49G143gfC2ovV7KGk79n
JmKfDvWd2UwW2uxYTgJns84f4gLXMYkJX+0IHMc8mBfmy9ilILw=
=tv67
-----END PGP SIGNATURE-----

--=-wy4INCHohOVOxGNLEbcq--


