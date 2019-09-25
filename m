Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAABDED7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:23:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD7DQ-0001WE-Bu; Wed, 25 Sep 2019 13:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iD7DP-0001W9-9e
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:20:19 +0000
X-Inumbo-ID: 37af445e-df97-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 37af445e-df97-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 13:20:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7832CAFCC;
 Wed, 25 Sep 2019 13:20:17 +0000 (UTC)
Message-ID: <71ab93d871dbc7a96a452aa37491309ef67a1722.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 15:20:16 +0200
In-Reply-To: <20190914085251.18816-16-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-16-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 15/47] xen/sched: make rt scheduler vcpu
 agnostic.
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Meng Xu <mengxu@cis.upenn.edu>
Content-Type: multipart/mixed; boundary="===============0811986834978069266=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0811986834978069266==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Ghblsp6PBd9OclFHMnyb"


--=-Ghblsp6PBd9OclFHMnyb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Switch rt scheduler completely from vcpu to sched_unit usage.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

With just one additional note.

>   * This scheduler follows the Preemptive Global Earliest Deadline
> First (EDF)
>   * theory in real-time field.
> - * At any scheduling point, the VCPU with earlier deadline has
> higher priority.
> - * The scheduler always picks highest priority VCPU to run on a
> feasible PCPU.
> - * A PCPU is feasible if the VCPU can run on this PCPU and (the PCPU
> is idle or
> - * has a lower-priority VCPU running on it.)
> + * At any scheduling point, the UNIT with earlier deadline has
> higher priority.
>
=46rom the real-time scheduling theory point of view, whether this really
makes sense (i.e., it still makes it possible to provide real-time
scheduling guarantees to guests, and if yes, how) has to be thought and
considered.

But this of course applies to the case when core-scheduling is actually
used, which is not (at least by default) for now. Moreover, we're
planning to make it possible to have it enabled on a per-pool basis,
which means it will be possible to have sched_rt cpupools with core
scheduling disabled.

On this grounds, I'm ok with the changes to this scheduler. When the
series is in, I'll add a note to this respect in some sched_rt related
piece of documentation.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Ghblsp6PBd9OclFHMnyb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2LaZAACgkQFkJ4iaW4
c+5EvBAAgHlRfoy7pEC6H6UBT0kkCP0DX7ENSNXI9X9Pue39PLIQxeNH9w4Psbw/
G2uuANopAmC+mrLoNKprYHvUqw4ptsc4a72qYAyl1wNrDemMz5AVyT2QsU8oYIky
mCvf3hDYD71sMGQypUedybTjT409RtbNElKuZSJPHUy5ZVbdarsEDgBO+PQJ5gQL
Bh3S5j/irzolPeoINYdG6/deNQ6eer8EsxU/k5zNr3cdv+iApdhrlHTKrSOjooyA
pCq04kkNbK6k5kSlHipfvnnQ6fR/ssGNgG58xwxHNjDjLh2sl38DuPidRKIbR2/D
3aMOX/C7U3KRGBcNoeatFI47v3ncGXwDLKOzOcnbUXqB9jzu6D9mV0YicENa6PB2
oL2s5jAaHB0Cv4AjjWe+leBwQzJ6XRhiev/GKtMac9nZHJX8DmacKu9m8N4iVLaj
Fp1KwQbCp4FzpZR1aThWSLWWagAxQPa52kgFF73a1v6M0+gFYoIUdlzGtoISRBuc
qpv0pf+JnLY7POmvs45Z6anWTJVNwqRFvpGq7LGbKglFnx7sU7Yc34PsuYVaVYdn
0NfOGPDm5K30yTuAF78gqQFGFEBwBTHWPWwBBOZ7IHLcjYYu5pdA+ZfaXL5FvOwI
yfGt6wRKdmSSBQ+2cUN4v/MZZwwhKT5YgfVTUajpHp+lVJwYGJU=
=B+0j
-----END PGP SIGNATURE-----

--=-Ghblsp6PBd9OclFHMnyb--



--===============0811986834978069266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0811986834978069266==--


