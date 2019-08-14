Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791F98D8E0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 19:04:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxwc3-0000NF-Qu; Wed, 14 Aug 2019 16:59:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Whf=WK=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hxwc2-0000NA-F3
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 16:59:02 +0000
X-Inumbo-ID: cf134858-beb4-11e9-8b93-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf134858-beb4-11e9-8b93-12813bfff9fa;
 Wed, 14 Aug 2019 16:58:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 74211AD1E;
 Wed, 14 Aug 2019 16:58:58 +0000 (UTC)
Message-ID: <5996e059f0babfad9f79c1bf535f80dcc68cd14e.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: George Dunlap <dunlapg@umich.edu>, Juergen Gross <jgross@suse.com>
Date: Wed, 14 Aug 2019 18:58:56 +0200
In-Reply-To: <CAFLBxZa=ymiPSQP+Z8_3+6UFnt1eu15Wv5Km-xpShwB=Mpx0MA@mail.gmail.com>
References: <20190802130730.15942-1-jgross@suse.com>
 <20190802130730.15942-2-jgross@suse.com>
 <CAFLBxZa=ymiPSQP+Z8_3+6UFnt1eu15Wv5Km-xpShwB=Mpx0MA@mail.gmail.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/3] xen/sched: populate cpupool0 only after
 all cpus are up
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3862574779972442057=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3862574779972442057==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-J+Mo835r0E3VqbI2b1Lv"


--=-J+Mo835r0E3VqbI2b1Lv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-08-14 at 17:15 +0100, George Dunlap wrote:
> On Fri, Aug 2, 2019 at 2:08 PM Juergen Gross <jgross@suse.com> wrote:
> > --- a/xen/common/cpupool.c
> > +++ b/xen/common/cpupool.c
> > @@ -762,18 +762,28 @@ static struct notifier_block cpu_nfb =3D {
> >      .notifier_call =3D cpu_callback
> >  };
> >=20
> > -static int __init cpupool_presmp_init(void)
> > +static int __init cpupool_init(void)
> >  {
> > +    unsigned int cpu;
> >      int err;
> > -    void *cpu =3D (void *)(long)smp_processor_id();
> > +
> >      cpupool0 =3D cpupool_create(0, 0, &err);
> >      BUG_ON(cpupool0 =3D=3D NULL);
> >      cpupool_put(cpupool0);
> > -    cpu_callback(&cpu_nfb, CPU_ONLINE, cpu);
> >      register_cpu_notifier(&cpu_nfb);
> > +
> > +    spin_lock(&cpupool_lock);
> > +
> > +    cpumask_copy(&cpupool_free_cpus, &cpu_online_map);
> > +
> > +    for_each_cpu ( cpu, &cpupool_free_cpus )
> > +        cpupool_assign_cpu_locked(cpupool0, cpu);
> > +
> > +    spin_unlock(&cpupool_lock);
>=20
> Just to make sure I understand what's happening here --
> cpu_callback()
> now won't get called with CPU_ONLINE early in the boot process; but
> it
> will still be called with CPU_ONLINE in other circumstances (e.g.,
> hot-plug / suspend / whatever)?
>=20
Exactly.

It is not used for resume (from suspend) any longer, since commit
6870ea9d1fad ("xen/cpupool: simplify suspend/resume handling).

But it is used for putting the various CPUs in Pool-0, as they come-up,=20
during boot.

This patch remove the "hack" of calling it directly, during cpupool
initialization, for the BSP.

> Sorry that's an overly-basic question; I don't have a good picture
> for
> the cpu state machine.
>=20
Well, I used to... I tried to quickly double check things, and what I
said above should be still valid, even after the latest changes (or so
I hope :-) ).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-J+Mo835r0E3VqbI2b1Lv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1UPdEACgkQFkJ4iaW4
c+53CA//YCZTM+DnqVI7V0Td7xqEsqF07n8MmYQ12eqI1Dw5zoa09gLos4v9Zjnp
E3e3kkTIfONGPM01ugNWX485p0X48WLm4/MsAcUpSva3JrcvA9nw2Q7GIiCQ/yNG
uJWDMUwhd1fta0Mk2Y/dny6/Su1TTKBf9a2Y2sGbQ4zz2lU7tAj+emlaB8OZiBS6
hpsCNMfT88taHHPUhj2nlwwbytJGeGWoZ6GU9xJAibBQ4GlYWii0yBT8Wpob58fW
1KE5glpaTSivgeBZ+2RSH9uZ12qQq9IpabmvO18TcJhb4QHwlZ36hZC7Uhhk/fv4
M8mXT+UXKQMkNARiWgwRsx2BUuln+IH7ADMGDkuxMdq2RcVHj0zdTqm7R2IqywAD
J0qYvrsjMtXoXX2k4ffOL5ViV85Qto3cK5ht62kmrzf6iAJyPbHJgqgT9uD6dhE4
rSzkmgnEZdt1PSLcRhAlQaq0XZLrz2mU9JGvdW+GxpsHJEsHUACOUElbQWlVlI1W
dguZ9CtndYCrnBcnDV3fmRrlnLfbFcuoDBhu/3BlNZ6V5XxAHGMOBJAk+0I6bGsj
tSaBtt7uCFnYz8C+CYYM9q4RGGoSghrq7KXiAIivMMtE6Bt5aRTlcaD1OPEG6Ei2
qSX/7prV9xNdtwrwT1wicIxxUEK81qWGGeDKzQxI8nkF8P9a2gc=
=jPEN
-----END PGP SIGNATURE-----

--=-J+Mo835r0E3VqbI2b1Lv--



--===============3862574779972442057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3862574779972442057==--


