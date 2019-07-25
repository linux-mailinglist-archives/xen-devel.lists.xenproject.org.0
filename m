Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5E975C1A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 02:28:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqo2J-0004KB-GH; Fri, 26 Jul 2019 00:24:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqo2H-0004Jn-Oe
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 00:24:37 +0000
X-Inumbo-ID: bd975e80-af3b-11e9-9df3-c313df8df4ee
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd975e80-af3b-11e9-9df3-c313df8df4ee;
 Fri, 26 Jul 2019 00:24:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A39E8AFFB;
 Fri, 26 Jul 2019 00:24:32 +0000 (UTC)
Message-ID: <46973d97cd17ebbf13fad0819cf91f16939fea78.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
In-Reply-To: <20190724112658.31495-3-jgross@suse.com>
References: <20190724112658.31495-1-jgross@suse.com>
 <20190724112658.31495-3-jgross@suse.com>
Organization: SUSE
MIME-Version: 1.0
Date: Thu, 25 Jul 2019 11:23:08 +0200
User-Agent: Evolution 3.32.3 
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen: merge temporary vcpu pinning
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============7812986325939561559=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7812986325939561559==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-cMxAfcnE9+cdqE9MztqS"


--=-cMxAfcnE9+cdqE9MztqS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-07-24 at 13:26 +0200, Juergen Gross wrote:
> Today there are two scenarios which are pinning vcpus temporarily to
> a single physical cpu:
>=20
> - wait_event() handling
> - SCHEDOP_pin_override handling
>=20
> Each of those cases are handled independently today using their own
> temporary cpumask to save the old affinity settings.
>=20
> The two cases can be combined as the first case will only pin a vcpu
> to
> the physical cpu it is already running on, while SCHEDOP_pin_override
> is
> allowed to fail.
>=20
> So merge the two temporary pinning scenarios by only using one
> cpumask
> and a per-vcpu bitmask for specifying which of the scenarios is
> currently active (they are both allowed to be active for the same
> vcpu).
>=20
> Note that we don't need to call domain_update_node_affinity() as we
> are only pinning for a brief period of time.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
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


--=-cMxAfcnE9+cdqE9MztqS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl05dPoACgkQFkJ4iaW4
c+6PVg//ReoBouBC74g90mSUo5wenCMpVhX2B3tOMOA67hIQeq/KKeKYskIED/w6
JjstAdXOjl5Xzik0gev3mF2xziOEQhwh+SSZG0gMm86KxI8apVTQd819/JUMz3UW
Rxvk9z6NOk90D7LIntQHO5Enwj4OABxeFdklMpkM56YVFG4IcT9d9aekpq6haemi
ieljRHyI/wX1vfpblsq1h2m1VqT9QmjMgObxYUSuirTm4Mx10STFbTIIWi7p++9y
CKxhf2YFVHI48NHVB0pygAd74PA8aEVtvtJ4FjKLUTDxPCZjQJO66CbxoxfXqSQQ
4ph/2fqWxL3FUialI6Z+pIssNPRcJ/4VkN7X5NnmzSj9eqvetPj18en8nY2gKXeR
mKBFIEnfaXoys5Y7uoEQhEb3HQMcLyGGefAkAxknGEcIk015/p2Mgz6FoZF95/B1
mIlTD0bzb9wNwkY7XQwZ/5cXX9huTrh2Cb4LZQXzGutoL0Fahjc6u0VbYQ8B+AWA
rriZXfEimKSRpGjRVHUAwSO+l/rPjHcUk6Ofq5HLd4YAOkuD1arx10wOemAGfZhr
eZjqnasOoQpUMpiFLQBbCXC47R8izjTDoX8iuMw46HO8mky5poQznx2rLeYdcAdL
5jqvcLf0zE6TOUbBgWnStXTgeF+xxD058TK87QpsFaPc8r1PWrI=
=Ioqz
-----END PGP SIGNATURE-----

--=-cMxAfcnE9+cdqE9MztqS--



--===============7812986325939561559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7812986325939561559==--


