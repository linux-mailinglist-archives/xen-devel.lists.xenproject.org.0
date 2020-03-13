Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D6B184183
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 08:29:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCeiV-0006Gs-3S; Fri, 13 Mar 2020 07:26:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8H7M=46=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jCeiT-0006Gn-E0
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 07:26:45 +0000
X-Inumbo-ID: fd36c3fc-64fb-11ea-b299-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd36c3fc-64fb-11ea-b299-12813bfff9fa;
 Fri, 13 Mar 2020 07:26:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B933DAE2A;
 Fri, 13 Mar 2020 07:26:42 +0000 (UTC)
Message-ID: <a6084dc725aedd9c6e5e25b7ec56a5e23dac2ccc.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?ISO-8859-1?Q?J=FCrgen_Gro=DF?=
 <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 13 Mar 2020 08:26:40 +0100
In-Reply-To: <a4bddd49-6a9a-6f66-9154-745d0648b42b@citrix.com>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <03f34120-8420-a526-1b03-03601c169be1@suse.com>
 <a4bddd49-6a9a-6f66-9154-745d0648b42b@citrix.com>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 0/2] xen: credit2: fix vcpu starvation due
 to too few credits
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
Cc: Charles Arnold <carnold@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Glen <glenbarney@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Sarah Newman <srn@prgmr.com>
Content-Type: multipart/mixed; boundary="===============2488033526875896350=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2488033526875896350==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ABYY22q6/sJSJW9eVWFq"


--=-ABYY22q6/sJSJW9eVWFq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-12 at 16:27 +0000, Andrew Cooper wrote:
> On 12/03/2020 15:51, J=C3=BCrgen Gro=C3=9F wrote:
> > - Could it be the vcpu is busy for very long time in the
> > hypervisor?
> >   So either fighting with another vcpu for a lock, doing a long
> >   running hypercall, ...
>=20
> Using watchdog=3D2 might catch that.  (There is a counting issue which
> I've not had time to fix yet, which makes the watchdog more fragile
> with
> a smaller timeout, but 2 should be ok.)
>=20
Done (actually, I used "watchdog=3D1 watchdog_timeout=3D2"), both with and
without these patches applies.

I don't see any watchdog firing.

While I was there, I tried 1 too. Nothing either.

> > - The timer used is not reliable.
> >=20
> > - The time base is not reliable (tsc or whatever is used for
> > getting
> >   the time has jumped 2 seconds into the future).
>=20
> Worth instrumenting the TSC rendezvous for unexpectedly large jumps?
>=20
Yes, we should look into that.

> > - System management mode has kicked in.
>=20
> There are non-architectural SMI_COUNT MSRs (0x34 on Intel, can't
> remember AMD off the top of my head) which can be used to see if any
> have occurred, and this has proved useful in the past for debugging.
>=20
I'll have to look up at how to check and dump these from where I need.
Let's see if I can do that... hints, code pointer or anything else you
may have handy would be much appreciated. :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-ABYY22q6/sJSJW9eVWFq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5rNbEACgkQFkJ4iaW4
c+5TRhAAyCKwmZKLeb+Q7Zy6guq16SNVMGPTHpXFu2XX+scCJbIWa5vStF2yoKId
s9uxHWHfw8J1ePAFcIsyvh39nI2az8Czk5qDEs7LbXMvDjOF7rFulElsCBtLiyBX
KdmkmYcrpo55CKLUP/7qk7aLQjA1xAZUGxCt6OKD5fVyoQOW0JNBPwTROzWi19/T
vEd+y4WaeVhWYLQxZl5Kufeis3bQWxHky9hvgao803eQEDMoFQcF/m0kUfCxWIuu
I4lRVJTbuE9w+wQx+DprisMJrNh6jzaP08UciIk0mQWBQGrAMUQ3OdOm/lTkbti/
aGOKtOIbSWsmF4wxjhqDGvxSAgFCwhy9qzdWUUbJVgXs8P9AQVhJ4As805sVuyqz
0A0Lnyd5q0MDGEJ88rjOOfcWjw2SNtgqOm3SikuaocO3jSR/RxT3749qx4JAU5g8
/2cGuRo1UQKW0XQT1bSLiaV4NmDLj+6Ua2gIkfhZBaeAoPBqAzEo7pYADJu2d+WX
vw/hg1aosQlLkOz1rwKuiNM2ibw58EyeJhMZ9H52nmbeoWKCZoVZ2YJXL1KZiD+1
PqFrkBtrpvwYTycx3jp6c3Pa+ScvaqV7OGRvTcCymCK70ricBgTE3GTSq9JdsaXY
2tWQDmj8eM1qkBILa01HoXC4giZ7iMngZmea2TTAiB64IhqMCDk=
=Yh8M
-----END PGP SIGNATURE-----

--=-ABYY22q6/sJSJW9eVWFq--



--===============2488033526875896350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2488033526875896350==--


