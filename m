Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F91E5C32
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 11:37:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeExo-0004g7-OH; Thu, 28 May 2020 09:36:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVz=7K=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jeExn-0004g2-AS
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 09:36:35 +0000
X-Inumbo-ID: b84028c2-a0c6-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b84028c2-a0c6-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 09:36:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4BEEFAD3A;
 Thu, 28 May 2020 09:36:33 +0000 (UTC)
Message-ID: <db0c02328a1fe60ed186638a6acd5c3df21686d5.camel@suse.com>
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Date: Thu, 28 May 2020 11:36:32 +0200
In-Reply-To: <9948ac59-af64-d77d-57df-38a771a472b4@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <b368ccef-d3b1-1338-6325-8f81a963876d@suse.com>
 <d60d5b917d517b1dfa8292cfb456639c736ec173.camel@suse.com>
 <7e039c65-4532-c3ea-8707-72a86cf48e0e@suse.com>
 <8bf86f0c2bcce449cf7643aa9b98aa26ea558c2c.camel@suse.com>
 <9948ac59-af64-d77d-57df-38a771a472b4@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-2OnZpGu9g/zF6PmSkDRF"
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
Cc: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, paul@xen.org,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-2OnZpGu9g/zF6PmSkDRF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-05-27 at 08:22 +0200, Jan Beulich wrote:
> On 26.05.2020 23:18, Dario Faggioli wrote:
> >=20
> > It looks like we need a way to rebalance the runqueues, which
> > should be
> > doable... But despite having spent a couple of days trying to come
> > up
> > with something decent, that I could include in v2 of this series, I
> > couldn't get it to work sensibly.
>=20
> CPU on-/offlining may not need considering here at all imo. I think
> it
> would be quite reasonable as a first step to have a static model
> where
> from system topology (and perhaps a command line option) one can
> predict which runqueue a particular CPU will end up in, no matter
> when
> it gets brought online.
>=20
Right.

IAC, just FYI, after talking to Juergen --who suggested a nice solution
to overcome the problem where I was stuck-- I have now a patch that
successfully implement dynamic online rebalancing of runqueues.

I'm polishing up the comments and changelog and will send it ASAP, as
I'd really like for this series to go in... :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-2OnZpGu9g/zF6PmSkDRF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7PhiAACgkQFkJ4iaW4
c+6IQg//Y5NRewHwSqke21nEdLFFGtz/mgKw+CeJIVi+jkKKznpQSfllqbEKnovG
piyjrgxtu1mT3gGmwM+bISd3gagFKadN6k50OaVbFFUE/R4IwveEtnmrQBfBDI7A
XdHfn7AsRKESfjpkUxjTn+BKAhFitmgWK6QMFgaZyhhqGN8jaqJoiQhsMaX6kTAX
B5eGiPguQ0Jaqz3diVrgYcBZqdjYDmi1hx47CpY/YYekbhAh+t31h4yZ23Kdi1N9
YRTmznforS5DIRwZHAcp/gaFjZULX5jEUgMdU21PYHgLjx2BUTzYGyGNJXSlQ+3f
kW6eIZ1OomHSDoz09LJ6f76Hq3fuWnZqeC/V1UHGQa1TDJkqqqF6CY//fltLk5/d
uQ/N2zZ+ZmFDXvq8vSFX5bxK/7bYKek+qyqNGixc7XKgepiV3o7k1sfNZZwP6sNY
dF74zR/mzIE5ouAnPY4k07zI7x6oWz6N9NErrOndYISRlFLeY1opuZnzl0zvGp0T
nDrvoWD8RlqZzlHF4mu9Ks5GbsXkbWvK+sNnjinzR/2v4zdH7dhH073rD8Vm22c5
pA+QaRuhTqgamKsapBoHupSWDm8hIMVdqv8rVa2dwSkGd/CJpoimsDyJ15O7tFF0
IsClCNsXWcOoHY6eMo6pK3KCnzw88NZ3sDbRUKlmYxseSfACYrw=
=kj2r
-----END PGP SIGNATURE-----

--=-2OnZpGu9g/zF6PmSkDRF--


