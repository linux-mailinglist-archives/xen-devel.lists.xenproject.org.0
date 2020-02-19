Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF83416470A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 15:34:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4QO7-0005Pe-3i; Wed, 19 Feb 2020 14:31:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NMhh=4H=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j4QO5-0005PY-5Y
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 14:31:41 +0000
X-Inumbo-ID: 8a9f8024-5324-11ea-8382-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a9f8024-5324-11ea-8382-12813bfff9fa;
 Wed, 19 Feb 2020 14:31:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 819B6ACCA;
 Wed, 19 Feb 2020 14:31:39 +0000 (UTC)
Message-ID: <d7959af74649ea04ba0236b47f23ac4c561b8506.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 19 Feb 2020 15:31:38 +0100
In-Reply-To: <20200213125449.14226-6-jgross@suse.com>
References: <20200213125449.14226-1-jgross@suse.com>
 <20200213125449.14226-6-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 5/8] xen/sched: use keyhandler locks when
 dumping data to console
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
Content-Type: multipart/mixed; boundary="===============1797895447277034140=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1797895447277034140==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-CTHXzyZ8X4WRwH0OQ7C6"


--=-CTHXzyZ8X4WRwH0OQ7C6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-13 at 13:54 +0100, Juergen Gross wrote:
> Instead of using the normal locks use the keyhandler provided
> trylocks
> with timeouts. This requires a special primitive for the scheduler
> lock.
>=20
So, FWIW, I tend to agree with Andrew on the general aspects of this.
I.e., I personally don't think that the added complexity, however small
one may judge it to be, is worth it... I'm not even sure not using
regular locks is really an improvement.

When you mentioned, in your other mail, that having something like this
would have saved a lot of reboots during the development of core-
scheduling, would _just_ disabling the watchdog have achieved the same?

Anyway, I've had a look at this patch. _If_ we go with this new lock
thing, the modifications to the scheduler code done here seems fine to
me.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-CTHXzyZ8X4WRwH0OQ7C6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5NRsoACgkQFkJ4iaW4
c+4gTRAAsWcvavCEk0LPMHwt3V62ErulR1pLAtXsSDy6ZI7MCTBlMO0mONNfBFn5
u1345C4qWad2twv4KRZGDhVXp0CNjdufH8IAN0/faNko+myW6BxTZ9hWoIHAqnrF
7BoeHOSjoaNG9h/DDl2LdqX6haXRLN+5CBt/eSp1zDzL+1re5naTNwpFEVn/qN/L
xPJYg3r0gW9Jl+v9J8SE9EVYpiz+TOAh4OuV/M/xNzPxUHgCR3aPWDsmg8NSDvDA
y7m7JisBHTBxKOeMhAZT7TPPyNgZbnS0KfS1sN0TpH/SUwiML5hPF8S5YaRoppYW
P4MNtgLwqXoReRxTTxcN1vBjDn9CC/U3CcC3KGihnjo4wc+NZSaq1fHOznkBAVYV
lAvdifiCG7vBHtyoj5VQtoTzpqNz2b0F0C7kc2e5nxGqHqmCSUXqYlcl0EJ1Wgm9
CEPkHdKm6PNNoB4WlgtAfnKV8k5sx8xE2AtQ9NNaGFXL52t75JZX+EvYFckHxoHZ
H+Jw3SYGcqtBdlhQEZr0hBcmmQxan72qt2tPGCFTZW7vx2o7FXbBOBqR4tuazETi
r1CMOB6Jsam5GzZzEAzLcwhNWRdl8Q6asR9z4h2Uy9SJqYCVQbk+GUCDRTK3nnyX
lvjkjhFoCxTqbzEPaMZ7+PB5bYegfb0N9UScKN0S56gQ8uiJx38=
=mzuf
-----END PGP SIGNATURE-----

--=-CTHXzyZ8X4WRwH0OQ7C6--



--===============1797895447277034140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1797895447277034140==--


