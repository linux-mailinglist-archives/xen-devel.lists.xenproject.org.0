Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE23087B5
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77898.141421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Qpg-0004Ne-Qq; Fri, 29 Jan 2021 10:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77898.141421; Fri, 29 Jan 2021 10:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Qpg-0004NF-NI; Fri, 29 Jan 2021 10:16:52 +0000
Received: by outflank-mailman (input) for mailman id 77898;
 Fri, 29 Jan 2021 10:16:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fPE=HA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l5Qpe-0004NA-TU
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:16:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a9fef2f-fd33-4c80-96e9-6a0a75fe2b14;
 Fri, 29 Jan 2021 10:16:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83C6DAC41;
 Fri, 29 Jan 2021 10:16:48 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0a9fef2f-fd33-4c80-96e9-6a0a75fe2b14
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611915408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SYTUZdSEI5/fj0CkqhbuKI9K9n/5U1mxpb4YiZvwq4w=;
	b=Z/EUMv/NsTjb2X3wvwf9Oq2Lq/vVFFofjAVhl831bV8T3/GDS9pqW8TfnhgPFs+23B0ba4
	8LqNv9PQHBkp26GRmftIiXJ7Am6LU+zDNnyBONZexC4urxyIvYKZT9kB999UQ8327wsww2
	gAi2wLmkA/djLr+oTM8QEtYbXB5DTfg=
Message-ID: <98331cca73412d13d594015c046c64809a7d221c.camel@suse.com>
Subject: Re: Null scheduler and vwfi native problem
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Anders
	=?ISO-8859-1?Q?T=F6rnqvist?=
	 <anders.tornqvist@codiax.se>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Date: Fri, 29 Jan 2021 11:16:46 +0100
In-Reply-To: <bfe8b2fe-57c4-79e2-f2e7-3e1cb9b7963b@suse.com>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
	 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
	 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
	 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
	 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
	 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
	 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
	 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
	 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
	 <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
	 <bfe8b2fe-57c4-79e2-f2e7-3e1cb9b7963b@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-KLQlUtLQc23L8Bgp9pW0"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-KLQlUtLQc23L8Bgp9pW0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-29 at 09:18 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 29.01.21 09:08, Anders T=C3=B6rnqvist wrote:
> > >=20
> > > So it using it has only downsides (and that's true in general, if
> > > you
> > > ask me, but particularly so if using NULL).
> > Thanks for the feedback.
> > I removed dom0_vcpus_pin. And, as you said, it seems to be
> > unrelated to=20
> > the problem we're discussing.=C2=A0
>
Right. Don't put it back, and stay away from it, if you accept an
advice. :-)

> > The system still behaves the same.
> >=20
Yeah, that was expected.

> > When the dom0_vcpus_pin is removed. xl vcpu-list looks like this:
> >=20
> > Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ID=C2=A0 VCPU=C2=A0=C2=A0 CPU=
 State Time(s)=20
> > Affinity (Hard / Soft)
> > Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 29.4
> > all / all
> > Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=
=A0 1=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28.7
> > all / all
> > Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=
=A0 2=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28.7
> > all / all
> > Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0=C2=A0=C2=
=A0 3=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28.6
> > all / all
> > Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 4=C2=A0=C2=A0=C2=
=A0 4=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28.6
> > all / all
> > mydomu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=
=A0 5=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21.6 5
> > / all
> >=20
Right, and it makes sense for it to look like this.

> > =C2=A0From this listing (with "all" as hard affinity for dom0) one migh=
t
> > read=20
> > it like dom0 is not pinned with hard affinity to any specific pCPUs
> > at=20
> > all but mudomu is pinned to pCPU 5.
> > Will the dom0_max_vcpus=3D5 in this case guarantee that dom0 only
> > will run=20
> > on pCPU 0-4 so that mydomu always will have pCPU 5 for itself only?
>=20
> No.
>
Well, yes... if you use the NULL scheduler. Which is in use here. :-)

Basically, the NULL scheduler _always_ assign one and only one vCPU to
each pCPU. This happens at domain (well, at the vCPU) creation time.
And it _never_ move a vCPU away from the pCPU to which it has assigned
it.

And it also _never_ change this vCPU-->pCPU assignment/relationship,
unless some special event happens (such as, either the vCPU and/or the
pCPU goes offline, is removed from the cpupool, you change the affinity
[as I'll explain below], etc).

This is the NULL scheduler's mission and only job, so it does that by
default, _without_ any need for an affinity to be specified.

So, how can affinity be useful in the NULL scheduler? Well, it's useful
if you want to control and decide to what pCPU a certain vCPU should
go.

So, let's make an example. Let's say you are in this situation:

Name                                ID  VCPU   CPU State Time(s) Affinity (=
Hard / Soft)
Domain-0                             0     0    0   r--     29.4   all / al=
l
Domain-0                             0     1    1   r--     28.7   all / al=
l
Domain-0                             0     2    2   r--     28.7   all / al=
l
Domain-0                             0     3    3   r--     28.6   all / al=
l
Domain-0                             0     4    4   r--     28.6   all / al=
l

I.e., you have 6 CPUs, you have only dom0, dom0 has 5 vCPUs and you are
not using dom0_vcpus_pin.

The NULL scheduler has put d0v0 on pCPU 0. And d0v0 is the only vCPU
that can run on pCPU 0, despite its affinities being "all"... because
it's what the NULL scheduler does for you and it's the reason why one
uses it! :-)

Similarly, it has put d0v1 on pCPU 1, d0v2 on pCPU 2, d0v3 on pCPU 3
and d0v4 on pCPU 4. And the "exclusivity guarantee" exaplained above
for d0v0 and pCPU 0, applies to all these other vCPUs and pCPUs as
well.

With no affinity being specified, which vCPU is assigned to which pCPU
is entirely under the NULL scheduler control. It has its heuristics
inside, to try to do that in a smart way, but that's an
internal/implementation detail and is not relevant here.

If you now create a domU with 1 vCPU, that vCPU will be assigned to
pCPU 5.

Now, let's say that, for whatever reason, you absolutely want that d0v2
to run on pCPU 5, instead of being assigned and run on pCPU 2 (which is
what the NULL scheduler decided to pick for it). Well, what you do is
use xl, set the affinity of d0v2 to pCPU 5, and you will get something
like this as a result:

Name                                ID  VCPU   CPU State Time(s) Affinity (=
Hard / Soft)
Domain-0                             0     0    0   r--     29.4   all / al=
l
Domain-0                             0     1    1   r--     28.7   all / al=
l
Domain-0                             0     2    5   r--     28.7     5 / al=
l
Domain-0                             0     3    3   r--     28.6   all / al=
l
Domain-0                             0     4    4   r--     28.6   all / al=
l

So, affinity is indeed useful, even when using NULL, if you want to
diverge from the default behavior and enact a certain policy, maybe due
to the nature of your workload, the characteristics of your hardware,
or whatever.

It is not, however, necessary to set the affinity to:
 - have a vCPU to always stay on one --and always the same one too--=C2=A0
   pCPU;
 - avoid that any other vCPU would ever run on that pCPU.

That is guaranteed by the NULL scheduler itself. It just can't happen
that it behaves otherwise, because the whole point of doing it was to
make it simple (and fast :-)) *exactly* by avoiding to teach it how to
do such things. It can't do it, because the code for doing it is not
there... by design! :-D

And, BTW, if you now create a domU with 1 vCPU, that vCPU will be
assigned to pCPU  2.

>=20
> What if I would like mydomu to be th only domain that uses pCPU 2?

Setup a cpupool with that pcpu assigned to it and put your domain into
that cpupool.

Yes, with any other scheduler that is not NULL, that's the proper way
of doing it.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-KLQlUtLQc23L8Bgp9pW0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAT4I8ACgkQFkJ4iaW4
c+7p7hAAlfDnBif0a8Ff+1sItxAKcNyIs9IIxefX2PLnB5aEQVDFyZnYmvbpyPmh
ulHM2ZpG82kPw1IleTqfZs8Jeer/PrPdB03bhXSlOMxO5/M0VSE9/gLTO2i42Tob
EByeTT1emAP3oBOuxUXmufZZ+M/61+fAUEDNT94f+z2XMyAZvNmWj5fqTEzWHNJP
dG/5mp4mSDyrFUuATuFeBTeIfixdqrBytVhvwT/eXRXWoZ3U49vT+Nad3V3+sO6l
+Y0Ee2oOB1R5pIG5A9ve8H1tx9qCYNYuvc0SAfqm3OCXy/A5pAOsU8VIJ6FmMd9g
CnXDRnjcZqnE179YVcQFs7zKKzKOhBArYYH5m9g5q7gNorGBNesl6BFbia36OxwU
c5xLGJnBJ8V7C8vYS3O1UNG5N0SUbby44dmgGBSEhuFzMz/R/GuQMJB9sx7FF4SR
PjEDNCroYFrzGqXM+DjBepfVTFChY/wC7+E8ykpp22f2+vcbW9wFUrDRo4vAt8tZ
7s+faE2ISIDUk1bcajBwGW8dGrgTUkTKElJkmFzfqEA7nACEbPVMhtvccalSqCuO
TakGlh/h/bYvTgtG57AOlCrfy8LLKAGl8/QnT4yl2J7wpMEH9DQJWANeJ0SBAbM0
166lnQY0T051k5JG89jYZVLgEK/1NozDXGhATomIl00JNdA9Pps=
=h7QO
-----END PGP SIGNATURE-----

--=-KLQlUtLQc23L8Bgp9pW0--


