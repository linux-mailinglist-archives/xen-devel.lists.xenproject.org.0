Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC091833FB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 16:00:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPI4-00023c-BQ; Thu, 12 Mar 2020 14:58:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yTGL=45=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jCPI3-00023S-7S
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:58:27 +0000
X-Inumbo-ID: ecef92b0-6471-11ea-b1a6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecef92b0-6471-11ea-b1a6-12813bfff9fa;
 Thu, 12 Mar 2020 14:58:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1218AABE9;
 Thu, 12 Mar 2020 14:58:25 +0000 (UTC)
Message-ID: <32e8d197e0d0a0ca4be4cb0078ef329b6ed98e3f.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Thu, 12 Mar 2020 15:58:22 +0100
In-Reply-To: <57b1c260-0d1b-76de-83e5-65e043263325@citrix.com>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <158402065414.753.15785539969715690913.stgit@Palanthas>
 <57b1c260-0d1b-76de-83e5-65e043263325@citrix.com>
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Sarah Newman <srn@prgmr.com>
Content-Type: multipart/mixed; boundary="===============3743334602482624120=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3743334602482624120==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-EIZ6jO6gNv4mctVJybiP"


--=-EIZ6jO6gNv4mctVJybiP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-12 at 13:55 +0000, Andrew Cooper wrote:
> On 12/03/2020 13:44, Dario Faggioli wrote:
> >=20
> > NOTE: investigations have been done about _how_ it is possible for
> > a
> > vCPU to execute for so long that its credits becomes so low. While
> > still
> > not completely clear, there are evidence that:
> > - it only happens very rarely
> > - it appears to be both machine and workload specific
> > - it does not look to be a Credit2 (e.g., as it happens when
> > running
> >   with Credit1 as well) issue, or a scheduler issue
>=20
> On what basis?
>=20
On the basis that I have traced execution times of vCPUs, when running
on both Credit1 and Credit2, on a system where I can sort-of reproduce
the issue, and I see them being able to execute for ginormous
timeslices, with both scheduler.

That's what this paragraph above, plus similar ones in the cover letter
,were supposed to mean. If it is not clear enough, sorry.

> Everything reported to xen-devel appears to suggests it is a credit2
> problem.  It doesn't manifest on versions of Xen before credit2
> became
> the default, and switching back to credit1 appears to mitigate the
> problem.
>=20
Yes, because even if the issue is there in both cases, when you use
Credit2 it manifests as vCPUs being starved (because of the "they end
up having less priority than the idle vCPU" thing). When you use
Credit1, this does not happen, because time accounting and
prioritization are done differently there.

Switching to Credit1, at least on the box where I could reproduce the
problem, did not make the issue that the vCPUs run for way too long
disappear. It's the symptoms that this issue cause that are different
for the two schedulers.

> Certainly as far as XenServer is concerned, we haven't seen symptoms
> like this in a decade of running credit1.
>=20
I am only able to reproduce this issue on one box, and not really 100%
deterministically. I have never noticed anything like this in the past
few years, on Credit2. At least, nothing as severe as this (or we would
have noticed, which is what, in fact, has happened!).

With Credit1, even if the issue is there, you won't notice it in this
form, se we really can't know.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-EIZ6jO6gNv4mctVJybiP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5qTg8ACgkQFkJ4iaW4
c+6BhxAAryyy2ohqUHsIt5BC/VA2OR7gdhEQTIVhiJBWtDkxktXkpaxha3DqKTHv
4T55DMYnzXeIIwN3GTx30mk1FGPd6Ye2HpPlQIhdUv/yLhFBxQH7Ld/cXqXuDOrQ
28A1E43cKeYuE3oHtvCe1YeZcNkGp/8zaFt4xpX7o6kw+wuK42szjLuzeKc1XLiJ
6hdwjNkxTSmhPI/dK7xfPScZyOfJm4J0lO8C2Bdnl8R3ynoy2Px8/HKIRLGHirAk
bN9Hy5Z6oduqf9/XnGa8nI2cb+8Z6zP57+sN6aWQKizlc9i7Mw2+I2GdiHzGS+t+
HyXTcCNnxzMiJFj6MzAv+YcturQaqBkn8RAukvNZFIb8TU3+RFN9FspCeFOcAaVp
/KeMqA53nyhG9olZKyPsCUyA+tW7kAIN7GAXmthvJFceqGOs8udpxObCXMfKbmZY
pFVJ9Sd+4zn3wIMBXA8E2+Y8EPLWU5Sf2y2TZCcDqdumkBiYcgUw/8Ln0wBMpFSf
CROlbK4I0B4NiPiD+XyO3Wjjj5TRRVsZE+seeLFsXrJ3BzKICb1lbQ8DnmaaCK2O
UG70ZejZ8WeTnRgkKiB8iCNSapCi1RGKa0ndKOQUffWHlaGOfZWbrNecMuJ8IzuM
ODghEVWqmnfsTuZXHzbMpBA2az710HhwpptiOqez4SVxugpXHmA=
=qX/Y
-----END PGP SIGNATURE-----

--=-EIZ6jO6gNv4mctVJybiP--



--===============3743334602482624120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3743334602482624120==--


