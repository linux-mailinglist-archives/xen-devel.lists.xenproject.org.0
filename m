Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6C91BFBDC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 16:02:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU9lM-0000c9-50; Thu, 30 Apr 2020 14:02:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VdV=6O=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jU9lK-0000c4-O6
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 14:02:02 +0000
X-Inumbo-ID: 29e57f6e-8aeb-11ea-9a55-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29e57f6e-8aeb-11ea-9a55-12813bfff9fa;
 Thu, 30 Apr 2020 14:02:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E2E1EAC24;
 Thu, 30 Apr 2020 14:01:59 +0000 (UTC)
Message-ID: <93b8fef9e1ec7a06fac3a697276d43564118df5b.camel@suse.com>
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
 xen-devel@lists.xenproject.org
Date: Thu, 30 Apr 2020 16:01:59 +0200
In-Reply-To: <7e039c65-4532-c3ea-8707-72a86cf48e0e@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <b368ccef-d3b1-1338-6325-8f81a963876d@suse.com>
 <d60d5b917d517b1dfa8292cfb456639c736ec173.camel@suse.com>
 <7e039c65-4532-c3ea-8707-72a86cf48e0e@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-JpCMH30dOivjgC0gYGpK"
User-Agent: Evolution 3.36.1 
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-JpCMH30dOivjgC0gYGpK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-30 at 14:52 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 30.04.20 14:28, Dario Faggioli wrote:
> > On Thu, 2020-04-30 at 09:35 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > >=20
> > With that, when the user removes 4 CPUs, we will have the 6 vs 10
> > situation. But we would make sure that, when she adds them back, we
> > will go back to 10 vs. 10, instead than, say, 6 vs 14 or something
> > like
> > that.
> >=20
> > Was something like this that you had in mind? And in any case, what
> > do
> > you think about it?
>=20
> Yes, this would be better already.
>=20
Right, I'll give a try at this, and let's see how it ends up looking
like.

> > This way if, in future, CPU 1 is removed from Pool-1 and added to
> > Pool-0, I am sure it can go in the same runqueue where CPU 0 is. If
> > I
> > don't consider CPUs which currently are in another pool, we risk
> > that
> > when/if they're added to this very pool, they'll end up in a
> > different
> > runqueue.
> >=20
> > And we don't want that.
> >=20
> Yes.
>=20
Cool. :-)

> You should add a comment in this regard.
>=20
Sure.

> And you should either reject the case of less cpus per queue than
> siblings per core, or you should handle this situation. Otherwise you
> won't ever find a suitable run-queue. :-)
>=20
Right, and in fact I had a check for that, rejecting smaller
max-cpus-per-runqueue than siblings, where we validate also the other
scheduling parameters. But indeed it's not there now, so I guess I
removed it by mistake before sending.

And now that I double check, I'm also missing documenting the new
parameters.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-JpCMH30dOivjgC0gYGpK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6q2lcACgkQFkJ4iaW4
c+4Xcw//WRmKpUHFdXw9LvUblxoFqFfZvlP84rWjxNCdaRpL87ZI2Emd3hMVUhvD
JR+L1VJgkxKWossI1kVQ5GPp/7N2LUitvqke57BAkqO87hcQGRigB4/CWGgBQH67
wEXMCzROWdmjIsAzqxmiSYK/7Gyx619rdlK0ewyQri/mt0nrxbVCIX/88DgtxGi9
vE6SEO7U21uHc9+eaD45sHwx0Axr6l6sfglMzJkz2H1YGpFaWOBZn8MAH2Wt+rNp
pQCpaO9DEX+cdDpglBwXp1XqQ1kcZ7tLHu3CpLUXAWOn6sioSRZ/jczl6gCeT7Er
mupydr088uHRO/sFXxtPDF+yiLVT/m6w9/wzaJ41wUVYmj8W/9lcB2bJ7ihVRSGr
b9yeIbVGuAoXHbkcaFYaDLVd0ld4SfH0xEgyN4UbaUs85zzMM5EpwuZ1V4zSpDBO
ASj/lBC1G/uZS+jQqL0mnJOf+VsPwmNmt9xDCubv6cgmPERxf4OE/SVrjAKZknuM
glN/u3wsTbAVcoc88sqrRtfgWkZPDo4ui4RSryPMGG5cRaYoxD+3z4TuL6m6zEb/
9jYMTBCNtuNdm+cubY5YcieL0ezIN3K9KlJQwDvFwbmTuY6RJD913iixSseymaXf
jPLYYIouG5l+TwTK8Ttync5TNR6K55hzKpIxIruQI7rb0LUHngk=
=0QnT
-----END PGP SIGNATURE-----

--=-JpCMH30dOivjgC0gYGpK--


