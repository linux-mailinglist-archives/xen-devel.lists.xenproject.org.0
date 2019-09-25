Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AABBE28A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:34:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDACk-0000Oi-2W; Wed, 25 Sep 2019 16:31:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDACi-0000Oc-CF
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:31:48 +0000
X-Inumbo-ID: f73ff826-dfb1-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f73ff826-dfb1-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 16:31:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 69402AFB0;
 Wed, 25 Sep 2019 16:31:43 +0000 (UTC)
Message-ID: <a2450a0079973d7019997aecfff314feb8d94ac0.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 18:31:41 +0200
In-Reply-To: <20190914085251.18816-21-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-21-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 20/47] xen: let vcpu_create() select
 processor
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7845916170885279481=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7845916170885279481==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-itk3MAj8BxuHdVfTVcTo"


--=-itk3MAj8BxuHdVfTVcTo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Today there are two distinct scenarios for vcpu_create(): either for
> creation of idle-domain vcpus (vcpuid =3D=3D processor) or for creation
> of
> "normal" domain vcpus (including dom0), where the caller selects the
> initial processor on a round-robin scheme of the allowed processors
> (allowed being based on cpupool and affinities).
>=20
> Instead of passing the initial processor to vcpu_create() and passing
> on to sched_init_vcpu() let sched_init_vcpu() do the processor
> selection. For supporting dom0 vcpu creation use the node_affinity of
> the domain as a base for selecting the processors. User domains will
> have initially all nodes set, so this is no different behavior
> compared
> to today. In theory this is not guaranteed as vcpus are created only
> with XEN_DOMCTL_max_vcpus being called, but this call is going to be
> removed in future and the toolstack doesn't call
> XEN_DOMCTL_setnodeaffinity before calling XEN_DOMCTL_max_vcpus.
>=20
> To be able to use const struct domain * make cpupool_domain_cpumask()
> take a const domain pointer, too.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Julien Grall <julien.grall@arm.com>
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


--=-itk3MAj8BxuHdVfTVcTo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Llm4ACgkQFkJ4iaW4
c+4Ipw/+NJkVN3HXVcYKwQhfJCMqaG4W0LzpoPDTCBTpw/8yl5ce42QQ3W/ky/Hf
fxZyV7X7wPZz0Sp/kiAEk92YpGRKC1wHBh9p/PuxKTl8VNv0VwCTBefmHSwqyE/e
C5dHu7h3cz1vojCaILgPQCblyPwH3qVUeeZNiygE6ns9sScgiZtoFqQI5ZgbS2Wk
ZUE03lwJncygJ4Fv66KvEpu4lv4YX3pLT9rF4r8G5tPtEYa+Qg84nz37soKPvn1q
TQkjnqermywlD6Ry2pGurTTT0fPlKzZg744V3Vjv09DwBkLr1VNrg0TruZ96bb0Z
L486qz02tD81Msx1wsXggYVyyXbuRqUm3C1uHMBtGZ9iSZdPRBtLx6lwRG8MsY+m
29DEEvwB4z1Sa+Fi9nVuXZL2TMcstthyRv1xvXJRbcwchTlR4f04oLaVPRyVYT3F
wMEoCqfXkZXSeVReOyGTTdO9OwIjrSWrHy4/DWfbZvU7CjkRfrz2G8het0lhc4Kj
d4PBltkZEXquO3z20uvz9ch42PL4qVbBNQwtnz/9gpn+I9TgRpQm5zfkl4pCPmBk
MFRnTJ07Fvq/wLEcAxuy7K6ixJHjVwJu9UK8OeOnVNMK2f2eA6Fw3O9VwCNdrf+f
cNKZzZ08lww1Yv15V241d1w5QQ6EjM/oACFi0OwNpvezG6Qk35U=
=JUh5
-----END PGP SIGNATURE-----

--=-itk3MAj8BxuHdVfTVcTo--



--===============7845916170885279481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7845916170885279481==--


