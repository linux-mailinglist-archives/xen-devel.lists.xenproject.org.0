Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA29C08CA
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:42:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDsL3-0005pE-LO; Fri, 27 Sep 2019 15:39:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDsL1-0005p8-M2
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:39:19 +0000
X-Inumbo-ID: f7d187f0-e13c-11e9-967e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f7d187f0-e13c-11e9-967e-12813bfff9fa;
 Fri, 27 Sep 2019 15:39:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AA900AC31;
 Fri, 27 Sep 2019 15:39:17 +0000 (UTC)
Message-ID: <de1f3168f845d7c6c347595316c966204acbb308.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 17:39:16 +0200
In-Reply-To: <20190927070050.12405-42-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-42-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 41/46] xen/sched: protect scheduling
 resource via rcu
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============5925732042568369165=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5925732042568369165==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dHTawD4VKDlvroKcatPw"


--=-dHTawD4VKDlvroKcatPw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> In order to be able to move cpus to cpupools with core scheduling
> active it is mandatory to merge multiple cpus into one scheduling
> resource or to split a scheduling resource with multiple cpus in it
> into multiple scheduling resources. This in turn requires to modify
> the cpu <-> scheduling resource relation. In order to be able to free
> unused resources protect struct sched_resource via RCU. This ensures
> there are no users left when freeing such a resource.
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


--=-dHTawD4VKDlvroKcatPw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2OLSQACgkQFkJ4iaW4
c+5ENQ/+Pn2w82Vxqk4UH4AS+UZKc7pcQZFN5KnMYTDXdJKvZBFr6FNdTZqUU8et
uam/PnbmheZLQgqan6aEm1ULuwgwiZm60DKpuGAYj5HmIJKa/s6h9KKGSYV4Olkr
cftWfR6EFQtPT79Wk30WWcgnxIYGj7Ys+d8iRkpiHx18CvR4ymIfTFEYGnj5yTEW
K3ppJs56tdnOS7UGqfDZGdndTZewiazn5Aoe9fuC1xgTxxYLKbugg+k3P9zdoMh3
d2smkRSmxH164vzUzimgYh8ffohcllFj37eYsK91RUMeWN2TUm+ZXc8tUusgEjBW
rOANrQzqFBCOUMLSZwxhKePtHOsZ7iwYhOclzfOVGrw4dWgD3JPIWHgzpDqeDRLf
M+cFIq+i7tvNXf68VCcUQnFdiyv2HcHXOkkCTnb22K2VNSwvfjLGPZA1JcUXOMtW
ROKfsBWwlFiLeE9OqFRk6mNY9v+jHKcrJpp2o6dYhtQ9lAZDaKW0XgU3Z+yeQvk3
PUOrqmn7NJ5x/cuzMu+ruXtPo55HhRJyHev1bhkoYuJinJg5z3zJ2+phxXD06d5k
pLwTSkM5uBJ8+/8Y+AgvWbU3XOOWpYjgKsbGMqdUFH7wNxsGx5TxPZWLszVHjARz
l8iehz1A02QkSVXIKvP2i15eICHGfHEvAwc2s0yciabKoFTnt9Q=
=SfDg
-----END PGP SIGNATURE-----

--=-dHTawD4VKDlvroKcatPw--



--===============5925732042568369165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5925732042568369165==--


