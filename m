Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B67164926
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 16:50:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4RZw-0004pH-NP; Wed, 19 Feb 2020 15:48:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NMhh=4H=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j4RZv-0004pC-3g
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 15:47:59 +0000
X-Inumbo-ID: 33067740-532f-11ea-83b4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33067740-532f-11ea-83b4-12813bfff9fa;
 Wed, 19 Feb 2020 15:47:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE280B515;
 Wed, 19 Feb 2020 15:47:56 +0000 (UTC)
Message-ID: <c7177a105c0ffddf37e8db385e80720fee7078b4.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Date: Wed, 19 Feb 2020 16:47:54 +0100
In-Reply-To: <5b7eee77-776b-1e5e-e25c-a783520748e1@suse.com>
References: <20200213125449.14226-1-jgross@suse.com>
 <20200213125449.14226-4-jgross@suse.com>
 <3f11237e-09a8-4003-597a-c02e1b60711b@suse.com>
 <5b7eee77-776b-1e5e-e25c-a783520748e1@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/8] xen/sched: don't use irqsave locks in
 dumping functions
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Meng Xu <mengxu@cis.upenn.edu>
Content-Type: multipart/mixed; boundary="===============6983718008963020782=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6983718008963020782==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-KLx6gtdWhhliE/mrJUMb"


--=-KLx6gtdWhhliE/mrJUMb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-02-19 at 16:02 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 19.02.20 15:27, Jan Beulich wrote:
> > On 13.02.2020 13:54, Juergen Gross wrote:
> > > All dumping functions invoked by the "runq" keyhandler are called
> > > with
> > > disabled interrupts,
> >=20
> > Is this actually needed for anything? It means not servicing
> > interrupts for perhaps an extended period of time. Debug keys
> > aren't promised to be non-intrusive, but they also shouldn't
> > be more intrusive than really needed. Wouldn't it therefore
> > be better to keep locking as it is now, and instead make sure
> > interrupts get turned off elsewhere (if needed) for much
> > shorter periods of time?
>=20
> Indeed this is the better option. I just checked the code and
> think blindly turning interrupts off is not needed.
>=20
Well, yes... Assuming you are referring to the IRQ being disabled in
cpupool.c:dump_runq(), my impression is that we can get rid of that,
and leave the sched-specific code (more or less) as it is (for the sake
of runqueue lock irq-safety).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-KLx6gtdWhhliE/mrJUMb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5NWKoACgkQFkJ4iaW4
c+4S+hAA4kfPkL5PhcUsWvvRxz+q3j/qwzPS7VVz7btiMgyacmR3hSlw29SqI1pD
MIui/naFd4phdXIOPnMrroJTST5BctPbyiZKW0L1OytQrxkjgwIIPNzE3l0KxsRs
d0wLiLHCaBJPL+7r1Sdwyhwq0BpYSO7X/ZxiEkyokLn4hv1/lLxr59ghduaP0sHt
xfJCXtaCXTnVVqX+1mVOqCn+jvxoCOmK+tGagOvXtR3jdHYtWZlbemA/vAFDc60f
eVj6ya0On6gERAvZFK7p6PObGyx755U1C59rnpYYCBVg9AqMNlhSM02pFdlCALHX
8O+9YuhJsQpIUU4G3JOy1mw9HboyFn+nTqVYsQ0QmOipUgmT2XfE1WPrzbghSTpl
peTleRXkc0RmsuyyTffUThqKC92UTZIF5BHEdRQFe9ugXP/BJEqlDFYX//dSplzc
NTYI7dGV2E/WE/+KJSEmCXvY/DdZRgpMne2JzDgGU96UmhZRwm8wNWZfLNPfA6qV
hq0rjWZ2awSxAgUFq8xavZRVQU29zUcFCNq0P4XZeS30pr0i1wjlkNcKmpwbTe+c
A3i6cN374g2e9VMVD1uvhqsTqFkBaX76ddxX93X/Ike5vmU2SyKx+TCUhuwZ1qaf
D39O9HpqNn26xGDygahTY633vL8rTT1or+hkKD/ActU4Bf/GVCc=
=dUbh
-----END PGP SIGNATURE-----

--=-KLx6gtdWhhliE/mrJUMb--



--===============6983718008963020782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6983718008963020782==--


