Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881EF1F7DFA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 22:09:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjpyq-0003nq-Ne; Fri, 12 Jun 2020 20:08:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u81f=7Z=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jjpyo-0003nl-Gf
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 20:08:46 +0000
X-Inumbo-ID: 84ef2c74-ace8-11ea-b60f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84ef2c74-ace8-11ea-b60f-12813bfff9fa;
 Fri, 12 Jun 2020 20:08:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B7BFCABE3;
 Fri, 12 Jun 2020 20:08:47 +0000 (UTC)
Message-ID: <0fc7034d696bbc601ccf2bd563ef9fb435499eea.camel@suse.com>
Subject: Re: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, "jgross@suse.com" <jgross@suse.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Fri, 12 Jun 2020 22:08:41 +0200
In-Reply-To: <51fce146-f2bd-6098-bef9-2fd925ec7f96@xen.org>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-2-volodymyr_babchuk@epam.com>
 <0ce0bbf8-fd15-e87b-727c-56dd7c09cdcb@suse.com>
 <7ec7b6568afb3df41f8407015c198b1ccb341c5b.camel@epam.com>
 <fcedf156-4ed6-c56a-482d-df2f867f7b3e@xen.org>
 <5bd54018f5e045816d25f686124395a1f27a2122.camel@epam.com>
 <51fce146-f2bd-6098-bef9-2fd925ec7f96@xen.org>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-a9RRqL44kgNEFokXkhUn"
User-Agent: Evolution 3.36.3 
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-a9RRqL44kgNEFokXkhUn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-06-12 at 13:21 +0100, Julien Grall wrote:
> On 12/06/2020 12:33, Volodymyr Babchuk wrote:
> > On Fri, 2020-06-12 at 12:29 +0100, Julien Grall wrote:
> > > > Basically, this value holds time span between calls to
> > > > schedule(). This
> > > > variable gets zeroed out every time scheduler requests for time
> > > > adjustment value. So, it should not depend on total VM run
> > > > time.
> > > This is assuming that the scheduler will be called. With the NULL
> > > scheduler in place, there is a fair chance this may never be
> > > called.
> > >=20
>
Yeah, this is a good point. I mean, I wouldn't be sure about "never",
as even there, we'd probably have softirqs, tasklets, etc... And I
still have to look at these patches in more details to figure out
properly whether they'd help for this.

But I'd say that, in general, we should depend of the frequency of the
scheduling events as few as possible. Therefore, using 64 bits from the
start would be preferrable IMO.

> > > So I think using a 64-bit value is likely safer.
> >=20
Yep.

> > Well, I wanted to use 64-bit value in the first place. But I got
> > the
> > impression that atomic_t supports only 32-bit values. At least,
> > this is
> > what I'm seeing in atomic.h
> >=20
> > Am I wrong?
>=20
> There is no atomic64_t support in Xen yet. It shouldn't be very=20
> difficult to add support for it if you require them.
>=20
Cool! That would be much appreciated. :-D

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-a9RRqL44kgNEFokXkhUn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7j4MkACgkQFkJ4iaW4
c+5AZQ//Zei1VtS8e4OqjD3aJm6mfxzS1VVqGut8VzP76PUF56gsqHreChryanVc
swlprXxpHd1h7xtmlUzUZCPzWcrtJbFfCpmVQH1iuJ3fL3YpMJevOL+8+2MkUS4S
LiewZteqkqPWmbwBTnFkYVxfdX+Lsogme0hv+PRDiePQ2RvzrmVKTo+BFtUVoWnw
5LGWgcUIpcgtC8wVVbTXx4mrHuVRUJcXQBK5b9UZRh7Grwn9TiH19jyMRzaylF3v
P30X37UUBHkgfpBgh38XQpka5iOlaCVNcJvAr1UbtjAvCjcdmm5RCujR5nQNlL99
TDE+Br/6teFQpeV8nKv73HII3OFddjXe5Qj68qmBGSBKOdiT0U19mxMq7DbAtSDO
wzeFfWGHFins4q4uoZBdO8UJRGbDeCHKFh3I3qgeg3kenBZouZn1H+aJuJps5Su3
89SaN66/OYHj9yDBqThbdE0g2uBRcdgM9tBuOOFH97WDeAtbORBC8nGHEte5vtrG
pxPxizZdFyKyQvu/bJDbC7muoPODhilsJd4aF5Qgrn9ST93CGsEASBcH/96TmFki
Wc7vAkcd58gALoxm9Nh/658cowUe5OQqy41NAy/2S+gyVswbBmN6tpBXV4H0e0G8
7cXyH9aniT9nvkcIxCDGymtnYyHGhdU/Czt3p317Jb2HaBmrLRM=
=McQc
-----END PGP SIGNATURE-----

--=-a9RRqL44kgNEFokXkhUn--


