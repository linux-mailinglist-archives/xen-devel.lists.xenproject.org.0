Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AC5124648
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 12:56:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXuk-0003i5-2k; Wed, 18 Dec 2019 11:54:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lBFt=2I=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ihXui-0003hu-JU
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:54:48 +0000
X-Inumbo-ID: 304593ac-218d-11ea-9066-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 304593ac-218d-11ea-9066-12813bfff9fa;
 Wed, 18 Dec 2019 11:54:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96C11AA35;
 Wed, 18 Dec 2019 11:54:46 +0000 (UTC)
Message-ID: <acaca6d590dd4fb9a50b2c84f132605639e1f273.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 12:54:44 +0100
In-Reply-To: <20191218074859.21665-8-jgross@suse.com>
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-8-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 7/9] xen/sched: switch scheduling to bool
 where appropriate
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Content-Type: multipart/mixed; boundary="===============6181835846270959523=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6181835846270959523==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-y4ISgFiWQtQjS4xzO2+u"


--=-y4ISgFiWQtQjS4xzO2+u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-12-18 at 08:48 +0100, Juergen Gross wrote:
> Scheduling code has several places using int or bool_t instead of
> bool.
> Switch those.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
I'm fine with pretty much everything in this patch. Just two comments:

> diff --git a/xen/common/sched/sched_rt.c
> b/xen/common/sched/sched_rt.c
> index 264a753116..8646d77343 100644
> --- a/xen/common/sched/sched_rt.c
> +++ b/xen/common/sched/sched_rt.c
> @@ -490,10 +490,10 @@ rt_update_deadline(s_time_t now, struct rt_unit
> *svc)
>  static inline bool
>  deadline_queue_remove(struct list_head *queue, struct list_head
> *elem)
>  {
> -    int pos =3D 0;
> +    bool pos =3D false;
> =20
>      if ( queue->next !=3D elem )
> -        pos =3D 1;
> +        pos =3D true;
> =20
>      list_del_init(elem);
>      return !pos;
>
IIRC, this code was "inspired" by similar functions in Credit2, where
we store in 'pos' the actual position of the entity in the runq (only
for tracing purposes, these days, but that's another story).

In here, it is indeed used only as a flag so it must be bool, and it
can also have a better name like, for instance, 'first' or 'head' (I
probably like 'first' better).

> @@ -505,14 +505,14 @@ deadline_queue_insert(struct rt_unit *
> (*qelem)(struct list_head *),
>                        struct list_head *queue)
>  {
>      struct list_head *iter;
> -    int pos =3D 0;
> +    bool pos =3D false;
> =20
>      list_for_each ( iter, queue )
>      {
>          struct rt_unit * iter_svc =3D (*qelem)(iter);
>          if ( compare_unit_priority(svc, iter_svc) > 0 )
>              break;
> -        pos++;
> +        pos =3D true;
>      }
>      list_add_tail(elem, iter);
>      return !pos;
>
And this is similar, but the logic is inverted.

I think the best solution for this hunk, without subverting the code
too much, would be to also rename 'pos' into 'fist' and initialize it
to true.

Then, in the loop, we set it to false. So that it will still be true,
if we exit immediately, false if we do at least one step.

And finally we return 'first' and not its negation.

Thoughts?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-y4ISgFiWQtQjS4xzO2+u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl36E4QACgkQFkJ4iaW4
c+6apg//VMPhRFwWphEf2yDDxdnyDVoq4BtAwrcf+wVTeRANvgVqrXtGkrKaPSwv
Z5AsW6/hTvOcqZJhpP4bTSaZU6N7Uwir6pudOPIwu5u50MLdcLY7Xe06CCG8B+Ao
ZXNgGXRwhCaPVvVcn9mRhIVwdpeYOwpSMBc6/aVDUamdKaKNxbuZaS1gpbJDtRbM
1VYZYCkVdfLbEuRz0iOtNOQhOx1F+QRZPuPC9qsJ5NJTIOww8d03Bbl/cAwLRs0V
Qp0kdFIFc23R9xatqXB0oEgdbhW5luIPsYdr/CTGovyj9lSRwo6CnkmRJmG19FTO
LgjmkpvkHJPY6wc0KP8UKNDBcu8VPa3KyCEKZJQavjloIRLThU2k9Te/FZv5hWjS
3x65KA5osN9s0QhS4g/Qn3F6tHReX2z1SnPE5Nt+TA4K6I4/3pyjt/veBW+SHvfm
IpJV6tRQofw2H9lGGTlXuSOfofBc3ZaEwv0fdoO82DyIerpH+OHzIxF8zFCpcF0X
MaQjQzdHMho87BJg+PNTxbjyCwjn0cwo52FT7XdKxMU2JwHRyhNwWI7SBu/XwSfA
YSDC4veJxT4YTekVi7PejjdzLXGRcE0fJ1UDjn/eGonR1b/cKVCXROrrve9Ija65
pq7EqsqVdHaDFe21MUlLRsOqjixOGfZz0+o2mntzWg/at28qLjM=
=MsJR
-----END PGP SIGNATURE-----

--=-y4ISgFiWQtQjS4xzO2+u--



--===============6181835846270959523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6181835846270959523==--


