Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DC226DDCB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 16:16:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIuiC-0003F5-7L; Thu, 17 Sep 2020 14:16:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yDaX=C2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kIuiA-0003Ez-Ve
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 14:16:35 +0000
X-Inumbo-ID: 36cea0e3-dc9d-43a1-9ef8-79be5b2f1387
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36cea0e3-dc9d-43a1-9ef8-79be5b2f1387;
 Thu, 17 Sep 2020 14:16:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600352193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJE42jTMkhvzQ+5i7Bfz+aCaIt/uRESuRXw69aHqyyE=;
 b=L/GGFEzBp7jVLrXQeLPDUvvrXCXEcxRBXl8xHgk2JbeDeBHE9eRxLDbjSoufMQufcl8aWJ
 VVDsCOCp4k1lRLRFE7buEhnBsktbD/kjt8hwDAOS0XXqxjGqNlfOGjOmseBhMnmPdkev/w
 kyeBWsiw7pZhKdOq83zFqucRHBtFID8JhBXnUP7JtQ7H4RkL5TSeLMCKMqn5dtdKphkgIt
 3qtEqpMs28k1PPoI2yieTLcXNikfY7iC2XhAJLKFrg+GK9bWGyIfkXGJZxSVW+L2Rvu44W
 WVcNwGiqa8f7FD2cC9iBd+ETWpOnSN1COAnw2ClEWUOWBzXg9CAElGdR+71MVw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1DB1AC24;
 Thu, 17 Sep 2020 14:17:06 +0000 (UTC)
Message-ID: <3828f62a38d84c7fd27cfaacc0d29d428d19d55e.camel@suse.com>
Subject: Re: [PATCH 4/5] sched/arinc653: Reorganize function definition order
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Jeff Kubascik
 <jeff.kubascik@dornerworks.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com, Josh
 Whitehead <josh.whitehead@dornerworks.com>, Stewart Hildebrand
 <stewart.hildebrand@dornerworks.com>, George Dunlap
 <george.dunlap@citrix.com>
Date: Thu, 17 Sep 2020 16:16:31 +0200
In-Reply-To: <67010159-2bde-cb52-434c-d75c27f8ce7a@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-5-jeff.kubascik@dornerworks.com>
 <67010159-2bde-cb52-434c-d75c27f8ce7a@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-g6Hd0bwVRhyEsuw39EVx"
User-Agent: Evolution 3.36.5 (by Flathub.org) 
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-g6Hd0bwVRhyEsuw39EVx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-17 at 10:12 +0200, Jan Beulich wrote:
> On 16.09.2020 20:18, Jeff Kubascik wrote:
> > @@ -517,27 +516,35 @@ static const struct scheduler
> > sched_arinc653_def =3D {
> >      .sched_id       =3D XEN_SCHEDULER_ARINC653,
> >      .sched_data     =3D NULL,
> > =20
> > +    .global_init    =3D NULL,
> >      .init           =3D a653sched_init,
> >      .deinit         =3D a653sched_deinit,
> > =20
> > -    .free_udata     =3D a653sched_free_udata,
> > -    .alloc_udata    =3D a653sched_alloc_udata,
> > +    .alloc_pdata    =3D NULL,
> > +    .switch_sched   =3D a653sched_switch_sched,
> > +    .deinit_pdata   =3D NULL,
> > +    .free_pdata     =3D NULL,
> > =20
> > +    .alloc_domdata  =3D NULL,
> > +    .free_domdata   =3D NULL,
> > +
> > +    .alloc_udata    =3D a653sched_alloc_udata,
> >      .insert_unit    =3D NULL,
> >      .remove_unit    =3D NULL,
> > +    .free_udata     =3D a653sched_free_udata,
> > =20
> >      .sleep          =3D a653sched_unit_sleep,
> >      .wake           =3D a653sched_unit_wake,
> >      .yield          =3D NULL,
> >      .context_saved  =3D NULL,
> > =20
> > -    .do_schedule    =3D a653sched_do_schedule,
> > -
> >      .pick_resource  =3D a653sched_pick_resource,
> > +    .migrate        =3D NULL,
> > =20
> > -    .switch_sched   =3D a653sched_switch_sched,
> > +    .do_schedule    =3D a653sched_do_schedule,
> > =20
> >      .adjust         =3D NULL,
> > +    .adjust_affinity=3D NULL,
>=20
> Adding all these not really needed NULL initializers looks to rather
> move
> this scheduler away from all the others.
>
Agreed, no need for more "=3D NULL". On the contrary, the ones that are
there should go away.

About this:

>  (Oddly enough all of them
> explicitly set .sched_data to NULL - for whatever reason.)
>=20
Yes, we decided to keep it like that, back then. I think now it would
be ok for it to go away too.

So, Jeff, feel free to zap it with this patch or series. Or I can send
a patch to zap all of them, as you wish.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-g6Hd0bwVRhyEsuw39EVx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl9jb78ACgkQFkJ4iaW4
c+4pZBAAs1RabwbuWnosX1CycAi1GEcnYHF6T2ZX5KxW/NjKA7PKdcPCpuOibHH/
0EUBI5iQczZvMslmr13p7lIQApAaO85x0tpbnierMbKjMHHpUN1ZwGJuk8sk55YC
3h1MT3j2io3g/5faEV5sNYL9VWqRAodDYzSdpn9P6pjnnSjn5hFsF7XaJo/r2CbL
dUv7VdWmiVO7LH+deXmEW90RuUfDjiG/Gwe3pK4ZXbIZUJFAVnUKcCj6RxV3JhFU
dpk46uBn8I9L6X73fga/L1rKwYZJkKk4LQ1QQM333YTLPFI2H7gwZPuSd5iLePET
fqOuBvAAbxRWjFYldLGbNq31Qj5miaFX+7oaqhSuuLx+6pOgvi0PkHleVEkqHOi8
8mjzdu5ImmbCf+7gVLXcElVj9ro7MSWd1EjW7QRspxsBbNOCbWCOy8zMnufnHGq2
zkhiyHgp5+WSAV9qE3mwXcds5ZzqEcp3PMI7Gu1OP2gwFCNPuxcIRo7W8yHAuvlc
wJVIRkFONou0194bLTh7+PBzjNFxxMyW0vWlxCN145gOC/ZkMptCbtljAVU20P+x
VfzHI9PiB/CuAgwlga7GWHlC7l3pnTNoZJ9p2vRUkUYM+onMykVt+5x8IaCPdyLX
2oAc8jNbXto6oq3GROtjWhLsP2NXneZYFwLjptdX3vjK+5YsNCs=
=DCP1
-----END PGP SIGNATURE-----

--=-g6Hd0bwVRhyEsuw39EVx--


