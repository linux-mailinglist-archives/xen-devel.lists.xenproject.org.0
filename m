Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D67BD096
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:27:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCoWt-0003nE-3t; Tue, 24 Sep 2019 17:23:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCa0=XT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iCoWq-0003n6-TF
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:23:08 +0000
X-Inumbo-ID: f968df2c-deef-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f968df2c-deef-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 17:23:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1BED4AFB0;
 Tue, 24 Sep 2019 17:23:07 +0000 (UTC)
Message-ID: <238a922676b615f5aed44ba4c7060fd89b42815d.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 19:23:05 +0200
In-Reply-To: <20190914085251.18816-10-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-10-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 09/47] xen/sched: move some per-vcpu
 items to struct sched_unit
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
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============6623153856342469918=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6623153856342469918==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-TRBfxprDYyCtVbTIL2U9"


--=-TRBfxprDYyCtVbTIL2U9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Affinities are scheduler specific attributes, they should be per
> scheduling unit. So move all affinity related fields in struct vcpu
> to struct sched_unit. While at it switch affinity related functions
> in
> sched-if.h to use a pointer to sched_unit instead to vcpu as
> parameter.
>=20
> The affinity_broken flag must be kept per vcpu as it is related to
> guest actions on specific vcpus. When support of multiple vcpus per
> sched_unit is being added, a unit is regarded as being subject to
> "broken affinity" when any of its vcpus has the affinity_broken flag
> set.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-TRBfxprDYyCtVbTIL2U9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2KUPoACgkQFkJ4iaW4
c+6pDw/+NFrpG3ZGI+t9ZjW6n0YxPgvQqGOjlIoNu9qaQPQy+E8k6AUvAIYNqI5k
RpZ7MH4yE6ko3ZZUo0EjDPc9g1aY2otlvlh5Q4QodizNxoZT15HKMoZ84DR4ezW3
QXPZbgPPxR/RIvEtKer9CoZPkAeRQn9dkmTnaAbdktQHC7tATKy2mSX0JJQH3qiY
SKdVgsOyNJj507yqVT0w164T4NiXGxmUwtyjrItVZrqb9bh67b06Fx/nllnZXLIh
WNySiyW4PH/Iy8bZfHF+pNsVpugaAQ++tO1VKbSFlKhiWGhXaY/PZCetEfm0c603
1kx/5wv37K8wRtNMBIGzykaEePvNxmpq8vEd9fweuopBOKQZFhtpojXMLFMZyeu+
/Qzfd2uGvFIwP2W6varzBpeifIrAd2wKQThRVqn9dnjHzclCget+tnlypJaTN9zt
2IqSK6NuJYj06fgwvRTZbiro4aSNAxT/Np20UqFhgoxRr5YbN/mW9kqsBH/oX1IG
Id08tjKJGZWhPXNlNNGvon92eIsttLNbM67NROTT3WhukZctOARY+hlVoT2RnOZF
ISTpC3g3f9kmjxMwuohIxEanPMT0KCzIPQQdOitdmdBFbZX7L0CXE8saO/54yukE
gqQtjSuaZcAhSTd/XktCopULNV4+H3cIUAqks9GoqHHQe3n5hQc=
=qoXx
-----END PGP SIGNATURE-----

--=-TRBfxprDYyCtVbTIL2U9--



--===============6623153856342469918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6623153856342469918==--


