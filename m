Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8668918342C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 16:12:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPTr-0003wT-68; Thu, 12 Mar 2020 15:10:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yTGL=45=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jCPTq-0003wO-4d
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 15:10:38 +0000
X-Inumbo-ID: a0ce4ea6-6473-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0ce4ea6-6473-11ea-92cf-bc764e2007e4;
 Thu, 12 Mar 2020 15:10:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97C4FABF4;
 Thu, 12 Mar 2020 15:10:36 +0000 (UTC)
Message-ID: <23d68fd3cefbcdd0766a21973184ca4cf2fabfd2.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>
Date: Thu, 12 Mar 2020 16:10:35 +0100
In-Reply-To: <49F5E83F-DB7A-4756-A1C5-DDF47C9312F3@citrix.com>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <158402065414.753.15785539969715690913.stgit@Palanthas>
 <57b1c260-0d1b-76de-83e5-65e043263325@citrix.com>
 <49F5E83F-DB7A-4756-A1C5-DDF47C9312F3@citrix.com>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] xen: credit2: avoid vCPUs to ever reach
 lower credits than idle
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Glen <glenbarney@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Sarah Newman <srn@prgmr.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============2481435245000445341=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2481435245000445341==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-r3OCYLtt0yiksqD1Ymas"


--=-r3OCYLtt0yiksqD1Ymas
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-12 at 14:40 +0000, George Dunlap wrote:
> > On Mar 12, 2020, at 1:55 PM, Andrew Cooper <
> > Andrew.Cooper3@citrix.com> wrote:
> >=20
> > Certainly as far as XenServer is concerned, we haven't seen
> > symptoms
> > like this in a decade of running credit1.
>=20
> One reason could be because the symptoms are different.  On credit1,
> credits and =E2=80=9Cpriority=E2=80=9D are separated; it=E2=80=99s not po=
ssible in credit1
> for a vcpu to end up with a lower priority than the idle domain, and
> no matter how low the credits become, a vcpu will always end up with
> some =E2=80=9Cpeers=E2=80=9D at the same priority level, meaning it alway=
s has a
> chance at some cpu.
>=20
Indeed. Under many respects, Credit1 is basically a slightly more
powerful variant of Round-Robin.

The actual time vCPUs spend executing influences the scheduling
decisions a lot less than in Credit2 (well, it influences the
scheduling decisions a lot less than in any scheduler of any OS or
hypervisor conceived and implemented in the last decade, or maybe even
more).

As a matter of fact, this property happens to have shield it from the
nastiest effects of the issue at hand.

> What Dario is saying (if I understand him correctly) is that the
> *proximate* cause (allowing a vcpu to have an effective priority of
> less than idle) is certainly credit2-only; but the *deeper* cause
> (vcpus racking up massive amounts of negative credit) is not.
>=20
Yes, that's exactly what I meant. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-r3OCYLtt0yiksqD1Ymas
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5qUOsACgkQFkJ4iaW4
c+58IRAA7POAFktky/Ke89DSo03vuRrhyEpmMKjXEomO1UuU8GKnXMKv9n2gJ3E2
yA+1HLpADEXh8GHf7LxhcNnHVGvtOYsOBDcSxiqJG9VdI6Ye2aMkuParhFz6qiCU
KhGOQggIrumeEupa7U7jEgQLYVtY6OsLZWh51hQWfFGqv/6tYmz8RD5+V2DZkCge
EoWQ+8DCh1AGEbtCs3LZYsCitdSlDsrcwbmu15OtUOwa8/SpJRO3O2vdtowJIFoi
sZ9KmSyx06CfCtGAOlHZZADBbm17amMw3cS3rWyE/JLI28KLd4Kg8lTzhxOxbtI6
3iVTEQutVZ56Ia6k6/aGp2oETHNVf0yw9hFlglqLi6pFIwtzuUh4KjRZP6qfnwXB
rBdq+aXl3nuoskXoPLS1dfNpk/5TaR46W7akxaWopsIW6rBlEj+uDODI5oeUYv4B
mWKRke064tOsman/iDqur6wEiCxqxq1sP9J7XJXnX8rTLTTOURNDuWGuEu0emQsa
oEYSvUsnqHmn+MeJJgFWlwb2Uzk1WOCRBVQm29jK2zfS/+mcUt8t7DVPOnEPqNz3
9SxSYNJMszRATzH0EUS91dfAaiMNSLEHOnsTUXg6xCuFgjpa+BKFPkRalZOJIln9
Lekb37Zxm2JG+HgcYb6iOV/ln6to0dFEFnKMr6vWGH5TDetNeEQ=
=pEdY
-----END PGP SIGNATURE-----

--=-r3OCYLtt0yiksqD1Ymas--



--===============2481435245000445341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2481435245000445341==--


