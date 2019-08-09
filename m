Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE1487352
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 09:44:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvzWN-0005V1-5r; Fri, 09 Aug 2019 07:41:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XXK4=WF=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hvzWL-0005Uw-Da
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 07:41:05 +0000
X-Inumbo-ID: 0869d4e0-ba79-11e9-817f-731b47f53fd3
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0869d4e0-ba79-11e9-817f-731b47f53fd3;
 Fri, 09 Aug 2019 07:41:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 49334AECD;
 Fri,  9 Aug 2019 07:41:00 +0000 (UTC)
Message-ID: <f7d360fd10d53565198cfb9eed432c04ba8a9d8d.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap
 <george.dunlap@citrix.com>
Date: Fri, 09 Aug 2019 09:40:59 +0200
In-Reply-To: <alpine.DEB.2.21.1908081342390.22196@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <35a1ab11-5bba-866c-40fc-6366c65317f0@citrix.com>
 <alpine.DEB.2.21.1908081342390.22196@sstabellini-ThinkPad-T480s>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: George.Dunlap@eu.citrix.com, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============0746966750850235550=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0746966750850235550==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RqCCkrHYeBiyUZ/yiPKP"


--=-RqCCkrHYeBiyUZ/yiPKP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-08-08 at 13:44 -0700, Stefano Stabellini wrote:
> On Thu, 8 Aug 2019, George Dunlap wrote:
> > On 8/7/19 7:22 PM, Stefano Stabellini wrote:
> > > Hi Dario, George,
> > >=20
> > > Dom0less with sched=3Dnull is broken on staging, it simply hangs
> > > soon
> > > after Xen is finished loading things. My impression is that vcpus
> > > are
> > > not actually started. I did a git bisection and it pointed to:
> > >=20
> > > commit d545f1d6c2519a183ed631cfca7aff0baf29fde5 (refs/bisect/bad)
> > > Author: Dario Faggioli <dfaggioli@suse.com>
> > > Date:   Mon Aug 5 11:50:55 2019 +0100
> > >=20
> > >     xen: sched: deal with vCPUs being or becoming online or
> > > offline
> >=20
> > That's Dario's patch -- Dario, can you take a look?
> >=20
> > Stefano, how urgent is it for things to work for you -- i.e., at
> > what
> > point do you want to consider reverting the patch?
>=20
Ok... Patches works for me, in a "dom0full" configuration. :-)

> Of course, we cannot make a release with this issue. I can live with
> it
> for now because I have a revert for
> d545f1d6c2519a183ed631cfca7aff0baf29fde5 at the top of all my working
> branches and the production branches at Xilinx are based on the last
> release.
>
I'll take a look.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-RqCCkrHYeBiyUZ/yiPKP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1NI4sACgkQFkJ4iaW4
c+7r/BAA3inbS11SebCI7p8AhkeWAxP2EZmEO989qnEP9T4gpoIsDoHfG1+MzU0S
BhXlXWRd0fERBIBvmoF4v45qPWQHwPl/WorWOEV0btR5j4vG1Jti/0bbH2rPmqg3
6WlsRpd2Kp64p4Y2t2lODiwx8U9IH1MWWh/qW7LPcmxZiCrh8cXN44yANK2gj0Oj
LLAGsI7ypZuOYNAz1hTHLLAXb/3SUvYcZqQbBSI8U1hfAGCGlbkZGv5QvJyC1u87
axtvaKr7IJDErW/WyDiRRaOfmibAGGDKFzCEWd9NE2NXg4yVqnZb05o6yNZ9/PYU
mpIAAKbM1nY1STYKpDprGrbdpCcbzXK+Xw4/7bw6EQeDGviEmVxn0BZZtnAIuruF
6NZ9whaV4LoIaNORAHUr6naROtSGiOM/cHB3Fo+S8KtKDx8ulXinZN4bBalqU/Sx
DzQh7p7bjXsliqouWg6eEyPPdKQ3PPzGCmjptrzmVmmI9he0w0tDB+Dom7bxZB9K
iWdQfjEqnyIYE6YH0z/oSTzfToTjgQaGuF4/9T5unJkNIlraVKKPCx2FLerTNKQU
OmkrzxsQpRAfXJKaVrZIZoxsGwxpny+3+amzBufJx2qaCSe5g6VJvJYCJEsHnPla
zVo/eH54cF6oDYciTXSAlpLTP77cUjmwt6hqR9fTfFzIdPWstPQ=
=nDHS
-----END PGP SIGNATURE-----

--=-RqCCkrHYeBiyUZ/yiPKP--



--===============0746966750850235550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0746966750850235550==--


