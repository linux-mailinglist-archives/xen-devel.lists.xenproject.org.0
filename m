Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22760176251
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 19:19:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8pc5-0008K2-Df; Mon, 02 Mar 2020 18:16:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L2M6=4T=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j8pc3-0008Ju-Ch
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 18:16:19 +0000
X-Inumbo-ID: e90d6cfc-5cb1-11ea-9fce-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e90d6cfc-5cb1-11ea-9fce-12813bfff9fa;
 Mon, 02 Mar 2020 18:16:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 225D4AF8A;
 Mon,  2 Mar 2020 18:16:17 +0000 (UTC)
Message-ID: <68fc62c1fab2e200374d9758784cc8e63972124f.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Date: Mon, 02 Mar 2020 19:16:15 +0100
In-Reply-To: <26a2f836-9d64-0507-63ec-1aad496dc8ae@suse.com>
References: <9b3423b9-6cf1-1cc3-5011-f383979f12aa@suse.com>
 <96b8db2cab78470bd7cab97b6bbca3049999dfd3.camel@suse.com>
 <26a2f836-9d64-0507-63ec-1aad496dc8ae@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] credit2: avoid NULL deref in
 csched2_res_pick() when tracing
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
Cc: George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/mixed; boundary="===============5788184282829969815=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5788184282829969815==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-jRORR250jTU56tRPkkbB"


--=-jRORR250jTU56tRPkkbB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-03-02 at 17:59 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 02.03.20 17:49, Dario Faggioli wrote:
> > On Mon, 2020-03-02 at 09:58 +0100, Jan Beulich wrote:
> > >=20
> > >     @@ -2360,6 +2360,8 @@
> > >                          unit->cpu_soft_affinity);
> > >              cpumask_and(cpumask_scratch_cpu(cpu),
> > > cpumask_scratch_cpu(cpu),
> > >                          &min_s_rqd->active);
> > >     +
> > >     +        BUG_ON(!min_rqd);
> > >          }
> > >          else if ( min_rqd )
> > >          {
> > >=20
> > > possibly accompanied by a comment. Thoughts?
> > >=20
> > Yes, I think this is a good idea.
> >=20
> > Personally, I'd put the BUG_ON() outside of the "if {} else if {}
> > else
> > {}" block (i.e., just above the cpumask_cycle().
>=20
> I don't think so.
>=20
> Otherwise the "else if ( min_rqd )" wouldn't make sense.
>=20
Why wouldn't it?=20

I mean, what I was saying is that I think it would be nice to have,
just before this:

 new_cpu =3D cpumask_cycle(min_rqd->pick_bias, cpumask_scratch_cpu(cpu));
 min_rqd->pick_bias =3D new_cpu;

A BUG_ON(!min_rqd), with a comment above it explainint that, no matter
how we got here, at this point we are sure that min_rqd is valid,
either because it already was before the if{} (in which case we took
either the first or the second branch of the if itself), or because we
did setup it in the if{} itself (in the third branch).

I see why one may want for something like that to be in the first
branch of the if{}... I was just saying that I personally like it
better for something like this to be close to where the pointer is
dereferenced...

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-jRORR250jTU56tRPkkbB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5dTXAACgkQFkJ4iaW4
c+7ccg//TM5zdGfY9iw1j75yJPBQaBglbyH6BMBR0qLEqUuQCBrluz+zbINqdXiW
IOz1w4z/P4+Jb9XT3XMmAha398CLXvvWUSh/Bftt8rtPCHPOAi0tJMjlLkAJgNE5
4zD3ZXaZxRkkjfF2JGvfrk5YfXOH1erQObKYERbD0L5yVDQ5cIc7vC/Sq0VFpbPc
DxICnhKxKl3EJx0xUDXXWXIb7CcHBaF9+olWfA7dOm2mFItJ1BCgMesykF5UiwRX
zqqMdmciIzfDOOmVdyVgQ2/h0t9R2+TJJvjrqMgKe5+X233BjnvZFjREtSUu0Pex
GlDOkf9bko/XNv1AVLfQ6umJvwxmvkuqUs/apZuncu8GnI5mpru3/gDQjJbAcG5b
ztfYu4XBghgeE+Bqqx7gx4BkfD3e3qYAeadnG6WvL64Xda1zDXXHAMUSWRGWZOQG
7eyw/mN83nME2l/hQaMcwNRm6cUbNdv/0XkTXYKjc+haaPuC3X30TbFDJ7DA4sqB
Du6MCznwLuvhFnuk6jQ9PrUVZeZsxsWgHL8yBnp9cJKEtfBnSKLeaLVpjhc1W6xw
2aio0MN6bkZlrn1EEoey+W7OmvwegUvPwXdbmDJ3WYQayvlAC4C0OfxiDIXS8Sbv
jhTFPNjXVmIlwMYWX5cEIYDNssK54RmfeHPGhyCj60BrhJc3W/w=
=okP2
-----END PGP SIGNATURE-----

--=-jRORR250jTU56tRPkkbB--



--===============5788184282829969815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5788184282829969815==--


