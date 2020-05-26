Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998101E31E2
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 00:01:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdhd7-0006ok-Qy; Tue, 26 May 2020 22:01:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCAZ=7I=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jdhd6-0006of-5M
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 22:01:00 +0000
X-Inumbo-ID: 6160eaee-9f9c-11ea-81bc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6160eaee-9f9c-11ea-81bc-bc764e2007e4;
 Tue, 26 May 2020 22:00:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AB79CABEC;
 Tue, 26 May 2020 22:01:00 +0000 (UTC)
Message-ID: <7b34b1b2c4b36399ad16f6e72a872e15d949f4bf.camel@suse.com>
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Date: Wed, 27 May 2020 00:00:56 +0200
In-Reply-To: <3db33b8a-ba97-f302-a325-e989ff0e7084@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <3db33b8a-ba97-f302-a325-e989ff0e7084@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-qMHuAGZ7ymoi6esFNIdU"
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-qMHuAGZ7ymoi6esFNIdU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

thanks for the review, and sorry for replying late... I was busy with
something and then was trying to implement a better balancing logic, as
discussed with Juergen, but with only partial success...

On Thu, 2020-04-30 at 08:45 +0200, Jan Beulich wrote:
> On 29.04.2020 19:36, Dario Faggioli wrote:
> > @@ -852,14 +862,61 @@ cpu_runqueue_match(const struct=20
> > [...]
> > +        ASSERT(rcpu !=3D cpu);
> > +        if ( !cpumask_test_cpu(rcpu, cpumask_scratch_cpu(cpu)) )
> > +        {
> > +            /*
> > +             * For each CPU already in the runqueue, account for
> > it and for
> > +             * its sibling(s), independently from whether such
> > sibling(s) are
> > +             * in the runqueue already or not.
> > +             *
> > +             * Of course, if there are sibling CPUs in the
> > runqueue already,
> > +             * only count them once.
> > +             */
> > +            cpumask_or(cpumask_scratch_cpu(cpu),
> > cpumask_scratch_cpu(cpu),
> > +                       per_cpu(cpu_sibling_mask, rcpu));
> > +            nr_smts +=3D nr_sibl;
>=20
> This being common code, is it appropriate to assume all CPUs having
> the same number of siblings?=20
>
You mention common code because you are thinking of differences between
x86 and ARM? In ARM --althought there might be (I'm not sure)-- chips
that have SMT, or that we may want to identify and treat like if it was
SMT, we currently have no support for that, so I don't think it is a
problem.

On x86, I'm not sure I am aware of cases where the number of threads is
different among cores or sockets... are there any?

Besides, we have some SMT specific code around (especially in
scheduling) already.

> Even beyond that, iirc the sibling mask
> represents the online or parked siblings, but not offline ones. For
> the purpose here, don't you rather care about the full set?
>=20
This is actually a good point. I indeed care about the number of
siblings a thread has, in general, not only about the ones that are
currently online.

In v2, I'll be using boot_cpu_data.x86_num_siblings, of course wrapped
in an helper that just returns 1 for ARM. What do you think, is this
better?

> What about HT vs AMD Fam15's CUs? Do you want both to be treated
> the same here?
>=20
Are you referring to the cores that, AFAIUI, share the L1i cache? If
yes, I thought about it, and ended up _not_ dealing with them here, but
I'm still a bit unsure.

Cache oriented runqueue organization will be the subject of another
patch series, and that's why I kept them out. However, that's a rather
special case with a lot in common to SMT... Just in case, is there a
way to identify them easily, like with a mask or something, in the code
already?

> Also could you outline the intentions with this logic in the
> description, to be able to match the goal with what gets done?
>=20
Sure, I will try state it more clearly.

> > @@ -900,6 +990,12 @@ cpu_add_to_runqueue(struct csched2_private
> > *prv, unsigned int cpu)
> >          rqd->pick_bias =3D cpu;
> >          rqd->id =3D rqi;
> >      }
> > +    else
> > +        rqd =3D rqd_valid;
> > +
> > +    printk(XENLOG_INFO "CPU %d (sibling=3D{%*pbl}) will go to
> > runqueue %d with {%*pbl}\n",
> > +           cpu, CPUMASK_PR(per_cpu(cpu_sibling_mask, cpu)), rqd-
> > >id,
> > +           CPUMASK_PR(&rqd->active));
>=20
> Iirc there's one per-CPU printk() already. On large systems this
> isn't
> very nice, so I'd like to ask that their total number at least not
> get
> further grown. Ideally there would be a less verbose summary after
> all
> CPUs have been brought up at boot, with per-CPU info be logged only
> during CPU hot online.
>=20
Understood. Problem is that, here in the scheduling code, I don't see
an easy way to tell when we have finished bringing up CPUs... And it's
probably not worth looking too hard (even less adding logic) only for
the sake of printing this message.

So I think I will demote this printk as a XENLOG_DEBUG one (and will
also get rid of others that were already DEBUG, but not super useful,
after some more thinking).

The idea is that, after all, exactly on which runqueue a CPU ends up is
not an information that should matter much from an user/administrator.
For now, it will be possible to know where they ended up via debug
keys. And even if we feel like making it more visible, that is better
achieved via some toolstack command that queries and prints the
configuration of the scheduler, rather than a line like this in the
boot log.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)





--=-qMHuAGZ7ymoi6esFNIdU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7NkZgACgkQFkJ4iaW4
c+46wxAAg6a8Btt5duG6yWc/heO5YGNXnJXfgb2/6uNV/MQzX5ehEpMRzoOVFOxV
wipVArdQBUjg156E8Qj2xvWZqMsYCimqjVxc3J8FMX+UpSrUB8pOaYz6iTR132hc
mocB1AP3Wkf8hO1eazGmTy7kKu+6X3VL7AbjIG4MDpCAAEP3xr3cLNBqJrSe0R2h
ZjmCN0Fa16T6paBvJlfNwkM6Muck3NLfdCyBv8gq9R8TkS6uXl+2FGK0uJISFu1K
ZK66IBN1LuYKe3MQt+cYw9UZ8X87pZUj6frRv9O+XykXWA3scXBsQ4A+ZiFOsFx8
SxaXcYvqJS6qUhkQPP9upseZ6eTijPZKijiNQ8hpKPSBz60qYIax9cTFUC7O8yu5
5ILFgbomoDvcDuMaDuVDaatGLXN7LdvaPc/5SEkDyPZmfHY9QmGv/L9MUBUtyk+3
gV5CglSBoShgYGWZtj0B9EBajJxMb1soiXk6I68TlaLTq51J2o8IAz2B8bJ5xXeF
ImaxKvLGJzrzsQjZjsNdjUZcuXxCwJHI+MqG9WqabI1gPAY+FaCLMHfIkTBpBylO
31GRX8VvuHYxnkfEYhcgV8fSs5U8bhSyiGLIa8dps/IPmgoOXol+FkBJx/5JX1wQ
0cOchwVDGP4aoE0VSNoDOeLJG8DVk+YttBe0xXJtx7J94m22eGE=
=zTYs
-----END PGP SIGNATURE-----

--=-qMHuAGZ7ymoi6esFNIdU--


