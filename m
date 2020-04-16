Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02BB1ACCCF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 18:10:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP74l-0000IU-BA; Thu, 16 Apr 2020 16:09:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04wr=6A=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jP74j-0000IP-A2
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 16:09:13 +0000
X-Inumbo-ID: 9c0fc71a-7ffc-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c0fc71a-7ffc-11ea-b4f4-bc764e2007e4;
 Thu, 16 Apr 2020 16:09:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3ED57AC50;
 Thu, 16 Apr 2020 16:09:10 +0000 (UTC)
Message-ID: <f3e7c6bfc2203119b2dfc36bd1fb9167b4fbfb2c.camel@suse.com>
Subject: Re: [Xen-devel] [PATCH] sched/core: Fix bug when moving a domain
 between cpupools
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jeff Kubascik
 <jeff.kubascik@dornerworks.com>, xen-devel@lists.xenproject.org, George
 Dunlap <george.dunlap@citrix.com>
Date: Thu, 16 Apr 2020 18:09:07 +0200
In-Reply-To: <9969e5ea-1378-3439-c9a5-19fb9b5c91ac@suse.com>
References: <20200327193023.506-1-jeff.kubascik@dornerworks.com>
 <9969e5ea-1378-3439-c9a5-19fb9b5c91ac@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-KqD7d3f6zIwiA7UyClwN"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Nathan Studer <Nathan.Studer@dornerworks.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-KqD7d3f6zIwiA7UyClwN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-04-15 at 11:08 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 27.03.20 20:30, Jeff Kubascik wrote:
> > For each UNIT, sched_set_affinity is called before unit->priv is
> > updated
> > to the new cpupool private UNIT data structure. The issue is
> > sched_set_affinity will call the adjust_affinity method of the
> > cpupool.
> > If defined, the new cpupool may use unit->priv (e.g. credit), which
> > at
> > this point still references the old cpupool private UNIT data
> > structure.
> >=20
> > This change fixes the bug by moving the switch of unit->priv earler
> > in
> > the function.
> >=20
> > Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
>=20
> Reviewed-by: Juergen Gross <jgross@suse.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Sorry it took a while. And thanks Juergen for also having a look.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-KqD7d3f6zIwiA7UyClwN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6YgyQACgkQFkJ4iaW4
c+6QkBAA3MtTipEeb+IAbi+rUcCc25N6+aPXu2vxCfuMEP7hWH8NZgA1CfIxGlvc
XHC+wXpgrnPBaowE9x9V3QQ+b9I79T5YgcbZR1KJL06ZzREvtEHfV0yTvYAmULlH
TsnYrtihmh7VwB0Gh57U2VONc+OwKA9D5ghaqbbXrhO1skilHhNqLcAaubFNrevA
oGWNCYqIF5fARxEB61aAltYatLgq7XFEDEqfKvopPibv6bUBTN2ArJ7bdfmmJbOg
J55IFJM8LI/1LtO9/CSbg8WIT/qahPcnPMnvl9LsDDOYU9wdX8o1azP9NAxI3koQ
IvQBJDSx1+zcxl29LSHXFNl20X08uT31EPJ4PYTSItzLi62MhU8afsTOQgeztYt+
1zvOXL4tO71wXMDgXnyUQuT4UbrUUm+0oqTbTz8Xkgqc8G3brAlsSc/9g7UMrGBG
HKZGf7NcqM4KOn9a6j8AYeLNDMf8eylf6C+MtHeMY8axsRMZSD2PjzElyidcuPFn
GvIlm9z8mChBpRyol/iGgJUbtPx9RlXzUwP9XSB8JGrZwd2D0fYwGo1QRbo+S7FN
dnp/rIsbKL3hZOnADHU40xdsomIT7qQB/SsLIHnQLLIML210xaMO6PCrgDHQoIk7
MfK/MY4xbJ7v0VLXC08pGN6JSeM0M7PnaBUJOOd1jtVW+CduI48=
=skAQ
-----END PGP SIGNATURE-----

--=-KqD7d3f6zIwiA7UyClwN--


