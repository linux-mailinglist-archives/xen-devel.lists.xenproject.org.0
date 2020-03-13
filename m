Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5881840D4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 07:22:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCdf1-0007m5-TD; Fri, 13 Mar 2020 06:19:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8H7M=46=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jCdf0-0007lw-8f
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 06:19:06 +0000
X-Inumbo-ID: 88eb2f32-64f2-11ea-b291-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88eb2f32-64f2-11ea-b291-12813bfff9fa;
 Fri, 13 Mar 2020 06:19:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 665C7AE52;
 Fri, 13 Mar 2020 06:19:02 +0000 (UTC)
Message-ID: <a0d3f6d05a99a18014357cec015504e014f54b5d.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Fri, 13 Mar 2020 07:19:00 +0100
In-Reply-To: <20200312175924.GM24458@Air-de-Roger.citrite.net>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <20200312150852.GK24458@Air-de-Roger.citrite.net>
 <be999c842f3a47cffd14fe0709568fdd4580316a.camel@suse.com>
 <20200312175924.GM24458@Air-de-Roger.citrite.net>
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Glen <glenbarney@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Sarah Newman <srn@prgmr.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============0858493370960864955=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0858493370960864955==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YynoOlaAW1+mKk/gcHKi"


--=-YynoOlaAW1+mKk/gcHKi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-12 at 18:59 +0100, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 12, 2020 at 06:02:03PM +0100, Dario Faggioli wrote:
> > What do you mean with "Which timer does this hardware use" ?
>=20
> Xen uses a hardware timer (HPET, PMTIMER or PIT IIRC) in order to get
> interrupts at specified times, on my box I see for example:
>=20
> (XEN) Platform timer is 23.999MHz HPET
>=20
> You should also see something along those lines.=20
>
Right. If booted Xen, I see this, which looks fine to me (this is
currently Xen 4.12.2):

# xl dmesg |grep time
(XEN) [00018d6c323bf350] Platform timer is 14.318MHz HPET  <=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
(XEN) [   22.097647] TSC deadline timer enabled
(XEN) [   23.068865] mwait-idle: lapic_timer_reliable_states 0xffffffff
(XEN) [   27.316536] mcheck_poll: Machine check polling timer started.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-YynoOlaAW1+mKk/gcHKi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5rJdQACgkQFkJ4iaW4
c+7GDRAAmQ1i/2hPxXJWrDSvd4n5XwifD9POQT7gtup7XijofnwH/70osX8YsMaW
qYxZsCmgBi/iZ9bioO4NoDg2UJS0SYHwAbzE4pR8YS+CbwuIrTSGKxaJRN8AMDFA
v5tPLT8KFQLAdgIxZheqeVxK1kIfYUWKYXdNQCdpFiaJ4NGoTB/yzoLmJ0wXrK20
AY5D/J8HdbfYX6zxtlJH1CHTlYGhDzGvRbJYe0DMJ7JE/9OBCpMqjAIcX0ymRpBr
1RC9xG8dXUVyYy90t0/7PUmXtb0Zxa5M7dY3C1r7vUtducklE8lF69R4KQmBm9lR
0QDBNiqpL9lEL6SKpEXL9XnrQ9s+9SMkQpNWtM3EldoPiwdjI15j56p6cRsMehm1
XE0EepAsyFGUUvBR0Zr8w7wzIeqbJXz92Or0RyeaVZcPntbsb1Fi8U/ex7Vv2MSW
mekcc1K7BcIgFRnUhGBxRV3vQsup5yOlb9gSjxUR3eBBMoKkfWd2BYVb/chly8gx
DziUg2stWhmqsH7To45V/Onbx/xrEV7EQCuKtU3swIeDOAB5rB8VjbZelOREgWNS
3xtYJMhk+yDa7cw6C/uzx7lH8b1vx6b7bxduf2PhurHTi5AMZX7T9birLKGzCaZx
Tf9svPGI0Zpl0eD4+SoOM7HZ9zlV1MH6HOuUUnAgXao0zd6HEHY=
=rKdh
-----END PGP SIGNATURE-----

--=-YynoOlaAW1+mKk/gcHKi--



--===============0858493370960864955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0858493370960864955==--


