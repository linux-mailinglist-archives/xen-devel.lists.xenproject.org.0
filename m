Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBAA71915
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 15:21:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpug2-000429-9y; Tue, 23 Jul 2019 13:17:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+BnY=VU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hpug0-000424-K7
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 13:17:56 +0000
X-Inumbo-ID: 4804c630-ad4c-11e9-a324-b7abb75e3442
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4804c630-ad4c-11e9-a324-b7abb75e3442;
 Tue, 23 Jul 2019 13:17:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 57DF3ACB8;
 Tue, 23 Jul 2019 13:17:54 +0000 (UTC)
Message-ID: <ba586dc38c9b83cb726c8bcaf82e4eb1f7d5fd97.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <JGross@suse.com>
Date: Tue, 23 Jul 2019 15:17:52 +0200
In-Reply-To: <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============1186729157065318629=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1186729157065318629==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Yw6qWOGx5reA07Fws8YU"


--=-Yw6qWOGx5reA07Fws8YU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-23 at 12:42 +0000, Jan Beulich wrote:
> On 23.07.2019 11:20, Juergen Gross wrote:
> > Today there are three scenarios which are pinning vcpus temporarily
> > to
> > a single physical cpu:
> >=20
> > - NMI/MCE injection into PV domains
> > - wait_event() handling
> > - vcpu_pin_override() handling
> >=20
> > Each of those cases are handled independently today using their own
> > temporary cpumask to save the old affinity settings.
>=20
> And what guarantees that no two of them will be in use at the same
> time?
> You don't even mention ...
>=20
AFAIUI, the case of any two of the above being in use at the same time
is handled. Basically, it is fine, as far as they (temporarily) set the
affinity to the same CPU, which is said to always be the case, here...

> > The three cases can be combined as the two latter cases will only
> > pin
> > a vcpu to the physical cpu it is already running on, while
> > vcpu_pin_override() is allowed to fail.
>=20
...for the first two. For vcpu_pin_override(), if it is called for
pinning the vcpu to CPU X, with any of the other twos in effect, and
having temporarily pinned the vcpu to CPU X already, then things are
fine again. If vcpu_pin_override() wants to pin to CPU Y, it fails.

All that being said, I agree it'd be good to have a bit more comments
(and I asked the same, although about a different path, in my own
reply).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Yw6qWOGx5reA07Fws8YU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl03CQEACgkQFkJ4iaW4
c+4hEBAAjMuCkvo+V7VBS0K0Qi6Bw9ivQy17ONnFFT9fDUIPoK783/FKfnvP51fA
P42eKngxwsffZ33j4FQxH3Wu+i3SKCWW5zKCnrvZ/5CkwoeM+VNlDq3EIdp7/+F3
SmTOpF8J/BE6p3r5EUp0KVLByTe+BJU4Xp0kTiipyZu1ZsQWsonTWBAmp+BdtwNR
Ttj0x0f9IqMVeIeDcnq77JakxcipNUdGDThysRKuuIkaE2+sGgSF0fR9eBpOQAyM
gAIWD40o6n5+Vaxc9T9cB2DItBgodFSImma5bFG4o797SMijqWsaHNJgMZ7uIcUQ
tQGNA8Qh6G2JqDHZLRa8mWDHfLATT3v2Q7C0ND6EqDaMDLrF08eZLWIIxCQVzn5+
XzeWhXi1t7fJQxDbHOXS0pia1uxDGLqzEoPX6txwb81K7D1uUFVm44NoTFTALgYS
BPNq7aQOUw5zcFmKwGS8ppT4EjWPN58lgxtTMimAgngmHMq3ZeV/6ayxTUGEKAB+
s8T/bYM3nm+AqVmNoo0SxFrHDdz2WquEm0wdtGsDZEwJo3ezsKPRUqYb7jZilOXB
a1OH81CDHK7eMlwbqJYJ+QYuRVVMHNNouceG1acLjLr/Dunzxg79MYyopI8BkFUL
wcHqR7EUm3IhpAGGfOaVxT+wqQAQEEL13CyJl/OUSMpokdK0LU4=
=4UC8
-----END PGP SIGNATURE-----

--=-Yw6qWOGx5reA07Fws8YU--



--===============1186729157065318629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1186729157065318629==--


