Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D33BE12E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:23:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD95J-00054T-4E; Wed, 25 Sep 2019 15:20:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iD95H-00051v-Qt
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:20:03 +0000
X-Inumbo-ID: f1fe12da-dfa7-11e9-9636-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f1fe12da-dfa7-11e9-9636-12813bfff9fa;
 Wed, 25 Sep 2019 15:20:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0B7BCB662;
 Wed, 25 Sep 2019 15:20:02 +0000 (UTC)
Message-ID: <3ccca9314d883f656b88e63a2ef9cb226c6d0f58.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 17:20:00 +0200
In-Reply-To: <20190914085251.18816-20-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-20-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 19/47] xen: add sched_unit_pause_nosync()
 and sched_unit_unpause()
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============6743111930283705134=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6743111930283705134==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-isCsocYaVGZwgyGeBs0F"


--=-isCsocYaVGZwgyGeBs0F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> The credit scheduler calls vcpu_pause_nosync() and vcpu_unpause()
> today.=20
>
It does. And, FWIW, I hate it with all my heart because of that (among
other things! :-D).

> Add sched_unit_pause_nosync() and sched_unit_unpause() to
> perform the same operations on scheduler units instead.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
> diff --git a/xen/include/xen/sched-if.h b/xen/include/xen/sched-if.h
> index d624b81e53..b5967d26af 100644
> --- a/xen/include/xen/sched-if.h
> +++ b/xen/include/xen/sched-if.h
> @@ -432,6 +432,16 @@ static inline int sched_adjust_cpupool(const
> struct scheduler *s,
>      return s->adjust_global ? s->adjust_global(s, op) : 0;
>  }
> =20
> +static inline void sched_unit_pause_nosync(struct sched_unit *unit)
> +{
> +    vcpu_pause_nosync(unit->vcpu_list);
> +}
> +
> +static inline void sched_unit_unpause(struct sched_unit *unit)
> +{
> +    vcpu_unpause(unit->vcpu_list);
> +}
> +
So, isn't this another one of those places where we could have the
for_each_unit_vcpu() loop already?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-isCsocYaVGZwgyGeBs0F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2LhaAACgkQFkJ4iaW4
c+4NbBAAzTdf25RGtWJlW0PWlkZj/YupAU1y/7+M0vzNFncUHEa8EQZUpTtDZaVg
pjnyXty0yGYYBLr3iEJ7hOwH5yvZmViufegLouFDUX9/goG/ifnDd8e3jsR/bLcY
Um/465MZA00s98pkX7MrXCFLDfwrF9THf7pFuOQjejS/6PDYX6KGd1EOuFTqk8wR
jCl5b09lQjIVAmu5WFZLF/OgNewpkIXE0eODkxKYxP6hNkDuSsXnxsA+O/pQtRWS
ctqTNCG2GAky8vfva9rvub7OIqsYq1dHWlvOlBlR8bqr6KgSHnwIavnEweHhI39z
sEsP8VE4lfyGC7sp+F4SiMnOPqnnjuQmhxti6CrlgdGtwjluILGm5Imr+7eOmgZS
yVj+2vvPpx5tyx2MqmaY46sLySNQdO8aCrw1NNftrnXAUQqBHGexps2APLD3uUCu
a59oryznH0KvB28UotQXDIUrkboVQpzkm8wmvc+RXmdIw2lWE2Z3jK+k+Dre2tnW
zwKfQ/YBd5YUc7KdsTh44sYUsKxTbd5Gow2yM+9Nu9AGjgp5XzHVjrEjk1P0Fb98
xZzy0L4bS4bxVQYIVtDJKz5jEDCS2r8wgQIAdLr3r6iLIPgCwohLTpGdmapwtGgS
sqFVqoESfnxSatPr8AnGOIhoQZleXptYTtqlFm/1QA76B5GEwyc=
=JDz3
-----END PGP SIGNATURE-----

--=-isCsocYaVGZwgyGeBs0F--



--===============6743111930283705134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6743111930283705134==--


