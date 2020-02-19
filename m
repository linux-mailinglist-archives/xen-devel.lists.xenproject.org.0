Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D2164AF0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:49:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4SVK-0003qX-QZ; Wed, 19 Feb 2020 16:47:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NMhh=4H=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j4SVJ-0003qR-TS
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:47:17 +0000
X-Inumbo-ID: 7c957b74-5337-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c957b74-5337-11ea-b0fd-bc764e2007e4;
 Wed, 19 Feb 2020 16:47:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 67A08ACE8;
 Wed, 19 Feb 2020 16:47:16 +0000 (UTC)
Message-ID: <95f651ddc1639d1c498067e4af71759585aa48b3.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 19 Feb 2020 17:47:14 +0100
In-Reply-To: <20200123085504.30911-1-jgross@suse.com>
References: <20200123085504.30911-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: rework credit2 run-queue
 allocation
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============0039065992735132300=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0039065992735132300==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-wb2jRvPJHKVdykESzqI+"


--=-wb2jRvPJHKVdykESzqI+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-01-23 at 09:55 +0100, Juergen Gross wrote:
> Currently the memory for each run-queue of the credit2 scheduler is
> allocated at the scheduler's init function: for each cpu in the
> system
> a struct csched2_runqueue_data is being allocated, even if the
> current scheduler only handles one physical cpu or is configured to
> work with a single run-queue. As each struct contains 4 cpumasks this
> sums up to rather large memory sizes pretty fast.
>=20
Ok, I finally found the time to look at this... And I like it. :-)

> In fact this fixes a bug in credit2 related to run-queue handling:
> cpu_to_runqueue() will return the first free or matching run-queue,
> which ever is found first. So in case a cpu is removed from credit2
> this could result in e.g. run-queue 0 becoming free, so when another
> cpu is added it will in any case be assigned to that free run-queue,
> even if it would have found another run-queue matching later.
>=20
That's a good catch... Thanks!

So, I only have a request, and a question:

> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -849,51 +822,71 @@ static inline bool same_core(unsigned int cpua,
> unsigned int cpub)
>             cpu_to_core(cpua) =3D=3D cpu_to_core(cpub);
>  }
> =20
> -static unsigned int
> -cpu_to_runqueue(const struct csched2_private *prv, unsigned int cpu)
> +static struct csched2_runqueue_data *
> +cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
>  {
> -    const struct csched2_runqueue_data *rqd;
> -    unsigned int rqi;
> +    struct csched2_runqueue_data *rqd, *rqd_new;
> +    struct list_head *rqd_ins;
> +    unsigned long flags;
> +    int rqi =3D 0;
> +    bool rqi_unused =3D false, rqd_valid =3D false;
> +
> +    rqd_new =3D xzalloc(struct csched2_runqueue_data);
> =20
>
So, I'm not sure I see why it's better to allocating this here, and
then free it if we didn't need it, instead than allocating it later,
only if we actually need it... What am I missing? :-)

> -    for ( rqi =3D 0; rqi < nr_cpu_ids; rqi++ )
> +    write_lock_irqsave(&prv->lock, flags);
> +
> +    rqd_ins =3D &prv->rql;
> +    list_for_each_entry ( rqd, &prv->rql, rql )
>      {
>          unsigned int peer_cpu;
> =20
> -        /*
> -         * As soon as we come across an uninitialized runqueue, use
> it.
> -         * In fact, either:
> -         *  - we are initializing the first cpu, and we assign it to
> -         *    runqueue 0. This is handy, especially if we are
> dealing
> -         *    with the boot cpu (if credit2 is the default
> scheduler),
> -         *    as we would not be able to use cpu_to_socket() and
> similar
> -         *    helpers anyway (they're result of which is not
> reliable yet);
> -         *  - we have gone through all the active runqueues, and
> have not
> -         *    found anyone whose cpus' topology matches the one we
> are
> -         *    dealing with, so activating a new runqueue is what we
> want.
> -         */
> -        if ( prv->rqd[rqi].id =3D=3D -1 )
> -            break;
> +        /* Remember first unused queue index. */
> +        if ( !rqi_unused && rqd->id > rqi )
> +            rqi_unused =3D true;
> =20
> -        rqd =3D prv->rqd + rqi;
> -        BUG_ON(cpumask_empty(&rqd->active));
> -
> -        peer_cpu =3D cpumask_first(&rqd->active);
> +        peer_cpu =3D rqd->pick_bias;
>          BUG_ON(cpu_to_socket(cpu) =3D=3D XEN_INVALID_SOCKET_ID ||
>                 cpu_to_socket(peer_cpu) =3D=3D XEN_INVALID_SOCKET_ID);
> =20
> -        if (opt_runqueue =3D=3D OPT_RUNQUEUE_CPU)
> -            continue;
>          if ( opt_runqueue =3D=3D OPT_RUNQUEUE_ALL ||
>               (opt_runqueue =3D=3D OPT_RUNQUEUE_CORE &&
> same_core(peer_cpu, cpu)) ||
>               (opt_runqueue =3D=3D OPT_RUNQUEUE_SOCKET &&
> same_socket(peer_cpu, cpu)) ||
>               (opt_runqueue =3D=3D OPT_RUNQUEUE_NODE &&
> same_node(peer_cpu, cpu)) )
> +        {
> +            rqd_valid =3D true;
>              break;
> +        }
>
So, OPT_RUNQUEUE_CPU is just disappearing. If I understood the
algorithm correctly, that is because in such case we just scan through
the whole list, without finding any match, and the we'll allocate a new
runqueue (while, for any of the other options, we stop as soon as we
found a runqueue with a CPU inside it which match the criteria).

Can we add a comment about this. Not necessary to describe the
algorithm in details, I don't think... just a few words, especially
about the fact that the enum has a _CPU item that, at a first and quick
look, we seem to be ignoring here?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-wb2jRvPJHKVdykESzqI+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5NZpMACgkQFkJ4iaW4
c+5PYg/+NefZs9UVbCYQoNQ8NlKL5xcrWMHhYZCKlJZbZIG1J8EYa1CxX8UTxhdH
VviteVauMuBS5kmEaAhSnOuEPn4cs7qd/FexVdfdo3I9BiOq6nkqCqzOQTrHJbHu
/Xm+0ZuMG1usYt0SCqbYLDFPJAkSlKoGSaU/5xbAiLuy1vBUiEbxqSmLdHb1sZ1K
q6rH0Enm76nmsiaq4z+lsNrol1cFJLV0xiPcITJGOokOgDyJtKTjNzF9uANt3o66
3qJgrw7+dVKsz9fRQ/yo1fHZo6RX+za/ztMrIs8R50GxlBYlbe4leRyuTumUfG9J
bLPLqv39oIwaMxhTDSNk1jL/T1tfTEo9QP45x8kSkzh6ySL1hqvGOQmmlUXT6cwS
qOb6yO9TWCNZxN3MLuZbuAuT54VDQk9UF6xVeZ2ZvSx9hmyWC2WNB9U9fbMKyCaK
x+mJaaKe0y8H1rfYOEaaVBu/08Ee8NTJEE+NaAMsIAsXs8HM7AFdsSipZiNrZeXM
glhoZJK/rpgenQhJLWiIVGkXpl25I6E62GYsS/vPlilBX6YoyPviDGlTZ1n0aLH7
245G5fNw2Du48iMxP2BHmRMkf9pxl7BKJ/Yp7C4HtCYitn7ut3wgR+zwEvNYlkd5
kqf+D+Aa3JM5r003T/tXY8AVDKrPG+h4rArQR5DlobjdRvZpskQ=
=Uy58
-----END PGP SIGNATURE-----

--=-wb2jRvPJHKVdykESzqI+--



--===============0039065992735132300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0039065992735132300==--


