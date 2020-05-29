Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EEA1E8133
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:07:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegay-0003wt-4C; Fri, 29 May 2020 15:06:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsAk=7L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jegaw-0003wm-BH
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:06:50 +0000
X-Inumbo-ID: 051a158e-a1be-11ea-81bc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 051a158e-a1be-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 15:06:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E5D2ACC5;
 Fri, 29 May 2020 15:06:48 +0000 (UTC)
Message-ID: <60c7224bf3f502e62a21deeb4d45f0aec9cdd943.camel@suse.com>
Subject: Re: [PATCH 0/2] xen: credit2: limit the number of CPUs per runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 29 May 2020 17:06:46 +0200
In-Reply-To: <ab810b293ca8324ca3fba22476401a58435243fa.camel@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <ab810b293ca8324ca3fba22476401a58435243fa.camel@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-GwpRhYkaFr/g6S+yArtv"
User-Agent: Evolution 3.36.2 
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-GwpRhYkaFr/g6S+yArtv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-05-29 at 13:46 +0200, Dario Faggioli wrote:
> Basically, if we just consider patches 1 and 4 we will end up, right
> after boot, with a system that has smaller runqueues.
>
Actually, to be fully precise, given how I reorganized the series, it's
not patches 1 and 4, it's patches 1, 3 and 4.

Hopefully, that is not a big deal, but it patch 3 is really a problem,
I can re-arrange patch 4 for working without it.

Apart from this, and for adding more information, on a system with 96
CPUs in 2 sockets, this is how the runqueues looks like (with these
patches:

(XEN) Online Cpus: 0-95
(XEN) Cpupool 0:
(XEN) Cpus: 0-95
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Active queues: 6
(XEN)   default-weight     =3D 256
(XEN) Runqueue 0:
(XEN)   ncpus              =3D 16
(XEN)   cpus               =3D 0-15
(XEN)   max_weight         =3D 256
(XEN)   pick_bias          =3D 0
(XEN)   instload           =3D 0
(XEN)   aveload            =3D 1223 (~0%)
(XEN)   idlers: 00000000,00000000,00000000,00000000,00000000,00000000,0000f=
fff
(XEN)   tickled: 00000000,00000000,00000000,00000000,00000000,00000000,0000=
0000
(XEN)   fully idle cores: 00000000,00000000,00000000,00000000,00000000,0000=
0000,0000ffff
(XEN) Runqueue 1:
(XEN)   ncpus              =3D 16
(XEN)   cpus               =3D 16-31
(XEN)   max_weight         =3D 256
(XEN)   pick_bias          =3D 16
(XEN)   instload           =3D 0
(XEN)   aveload            =3D 3324 (~1%)
(XEN)   idlers: 00000000,00000000,00000000,00000000,00000000,00000000,ffff0=
000
(XEN)   tickled: 00000000,00000000,00000000,00000000,00000000,00000000,0000=
0000
(XEN)   fully idle cores: 00000000,00000000,00000000,00000000,00000000,0000=
0000,ffff0000
(XEN) Runqueue 2:
(XEN)   ncpus              =3D 16
(XEN)   cpus               =3D 32-47
(XEN)   max_weight         =3D 256
(XEN)   pick_bias          =3D 32
(XEN)   instload           =3D 1
(XEN)   aveload            =3D 8996 (~3%)
(XEN)   idlers: 00000000,00000000,00000000,00000000,00000000,0000feff,00000=
000
(XEN)   tickled: 00000000,00000000,00000000,00000000,00000000,00000000,0000=
0000
(XEN)   fully idle cores: 00000000,00000000,00000000,00000000,00000000,0000=
fcff,00000000
(XEN) Runqueue 3:
(XEN)   ncpus              =3D 16
(XEN)   cpus               =3D 48-63
(XEN)   max_weight         =3D 256
(XEN)   pick_bias          =3D 48
(XEN)   instload           =3D 0
(XEN)   aveload            =3D 2424 (~0%)
(XEN)   idlers: 00000000,00000000,00000000,00000000,00000000,ffff0000,00000=
000
(XEN)   tickled: 00000000,00000000,00000000,00000000,00000000,00000000,0000=
0000
(XEN)   fully idle cores: 00000000,00000000,00000000,00000000,00000000,ffff=
0000,00000000
(XEN) Runqueue 4:
(XEN)   ncpus              =3D 16
(XEN)   cpus               =3D 64-79
(XEN)   max_weight         =3D 256
(XEN)   pick_bias          =3D 66
(XEN)   instload           =3D 0
(XEN)   aveload            =3D 1070 (~0%)
(XEN)   idlers: 00000000,00000000,00000000,00000000,0000ffff,00000000,00000=
000
(XEN)   tickled: 00000000,00000000,00000000,00000000,00000000,00000000,0000=
0000
(XEN)   fully idle cores: 00000000,00000000,00000000,00000000,0000ffff,0000=
0000,00000000
(XEN) Runqueue 5:
(XEN)   ncpus              =3D 16
(XEN)   cpus               =3D 80-95
(XEN)   max_weight         =3D 256
(XEN)   pick_bias          =3D 82
(XEN)   instload           =3D 0
(XEN)   aveload            =3D 425 (~0%)
(XEN)   idlers: 00000000,00000000,00000000,00000000,ffff0000,00000000,00000=
000
(XEN)   tickled: 00000000,00000000,00000000,00000000,00000000,00000000,0000=
0000
(XEN)   fully idle cores: 00000000,00000000,00000000,00000000,ffff0000,0000=
0000,00000000

Without the patches, there would be just 2 of them (on with CPUs 0-47
and another with CPUs 48-95).

On a system with "just" 16 CPUs, in 2 sockets, they look like this:

(XEN) Online Cpus: 0-15
(XEN) Cpupool 0:
(XEN) Cpus: 0-15
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Active queues: 2
(XEN) 	default-weight     =3D 256
(XEN) Runqueue 0:
(XEN) 	ncpus              =3D 8
(XEN) 	cpus               =3D 0-7
(XEN) 	max_weight         =3D 256
(XEN) 	pick_bias          =3D 0
(XEN) 	instload           =3D 0
(XEN) 	aveload            =3D 7077 (~2%)
(XEN) 	idlers: 00000000,000000ff
(XEN) 	tickled: 00000000,00000000
(XEN) 	fully idle cores: 00000000,000000ff
(XEN) Runqueue 1:
(XEN) 	ncpus              =3D 8
(XEN) 	cpus               =3D 8-15
(XEN) 	max_weight         =3D 256
(XEN) 	pick_bias          =3D 8
(XEN) 	instload           =3D 1
(XEN) 	aveload            =3D 11848 (~4%)
(XEN) 	idlers: 00000000,0000fe00
(XEN) 	tickled: 00000000,00000000
(XEN) 	fully idle cores: 00000000,0000fc00

There are still 2, because there are 2 sockets, and we still honor the
topology (and 8 CPUs in a runqueue is fine, because is lower than 16).

I'll share the same output on a 256 CPU system, as soon as I finish
installing it.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-GwpRhYkaFr/g6S+yArtv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7RJQYACgkQFkJ4iaW4
c+4uixAAlTOJjjZ9Rj6VGZf5eymjfRW7DlYb3IhIAiTcOLVrTYUF8+OCDJ+8AJLS
+OCPR9ANqIoJ5HBNgPcvPtMTmS0VqMSxkVIBS/bQseQixJl9mBLqbENCNwE4wOBk
8Q9h7LIzmaANn4P8FuhnjnWU6UJYbOv9UfiUN3OSQqANS3cjqtA8g1PGzCII2kV5
rwJhAOuuX3GQ0AGRu/8kvqN3lz3stSLhdyvLAtCjFhvQ2xnRNycnEVZJc8j21yZ6
CS551p7exO4UBw5KdSERPe/XuwtMZfpvtWJBOI9ufC6tAWIB5mDGCGZUDIw9flNZ
ckLbcVsA+qFyf2UITVRqoFOlnLaEeBP4YkZ9aMZF/KhL0L4zNeVK7/u9Kzgxm2FD
NrrXd641CSU+NmNEsasPEEA2d2iHzv8vA1Wv8mRQzOQGXr0lyDq03Vra5xZbmfwl
gmbI2lQu/9hCpK0UZDGW8x1l5r8RhTKWyUOrOxibPotlBsZWgN0i/FYh9Ikr2ste
OCg9UtHXXUvEOk6dytQAjz50N4NDDAJKKoyQgG45Wd1znuwQpeNRX9VDKveGN+67
iI+4U9SAgYBFwSPXVBn34PefT7USHf9FfGKcduSuL+PYMfhE/SmG6V+SoP0ZOJq2
vzMcfmBN1dbJy15Fh+1k7dlWJi+wqUZkMTaQAmhb9OUgR7A3+/I=
=LxRn
-----END PGP SIGNATURE-----

--=-GwpRhYkaFr/g6S+yArtv--


