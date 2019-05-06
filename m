Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9A715035
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 17:28:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNfVd-0007Pp-PU; Mon, 06 May 2019 15:26:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jZ4/=TG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hNfVc-0007Pj-O4
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:26:28 +0000
X-Inumbo-ID: 500c22e1-7013-11e9-843c-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 500c22e1-7013-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 15:26:27 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Mon, 06 May 2019 17:26:25 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Mon, 06 May 2019 16:26:07 +0100
Message-ID: <147f878a5931598d01aead0096d430fc479b56cc.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Mon, 06 May 2019 17:26:06 +0200
In-Reply-To: <20190506065644.7415-2-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============8405482156568616509=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8405482156568616509==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bQw4XG6+wDl6vyCw5jq/"


--=-bQw4XG6+wDl6vyCw5jq/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-05-06 at 08:56 +0200, Juergen Gross wrote:
> Instead of using the SCHED_OP() macro to call the different scheduler
> specific functions add inline wrappers for that purpose.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

> @@ -207,6 +250,141 @@ static inline void sched_free_domdata(const
> struct scheduler *s,
>          ASSERT(!data);
>  }
> =20
> +static inline void *sched_alloc_pdata(const struct scheduler *s, int
> cpu)
> +{
> +    if ( s->alloc_pdata )
> +        return s->alloc_pdata(s, cpu);
> +    else
> +        return NULL;
> +}
>=20
I agree with Jan about getting rid of the 'else' in cases like these.

And, possibly, here too:

> +static inline void sched_free_pdata(const struct scheduler *s, void
> *data,
> +                                    int cpu)
> +{
> +    if ( s->free_pdata )
> +        s->free_pdata(s, data, cpu);
> +    else
> +        /*
> +         * Check that if there isn't a free_pdata hook, we haven't
> got any
> +         * data we're expected to deal with.
> +         */
> +        ASSERT(!data);
> +}
>=20
Doing, maybe ASSERT(s->free_pdata || !data) as a first thing in the
function.

Regards=20
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-bQw4XG6+wDl6vyCw5jq/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzQUg4ACgkQFkJ4iaW4
c+7YuA/+LbDfS4+oLUXe39/FN4Vw7bu/xdQuvJTWWxvPkYSigzDtUwNV+iioI4Lt
cZGIno2Zonbdu6vJSHGEGwnnXfqYj5mzPr85cykQrfEi+AnYOr/8E4+Prp8aWq/V
rbfcftWpDu8jFohCNp1hpl7XAbYaSRf4mYP6sTufY9qidM3jlqvrQLOWiZe24Nnp
H81ib6oAyAPA8JaVqJZMhbuO84oA2dAi9xl6ZdBJUBp34IC/SMCyEdqYB/4M004t
e7Si+yJuZqU+Zr0OHRAZM+8EVaXQr+lmD+R7XBKbAM6i0mjFmxQksXH5oBBMsJZf
5H64d/sVsINDFwGinUFTjPJe+WSSLSWS4CYvstRDj2G/Agzs2jhcBnwuejkNNnbO
ipjWgXZlUksLooxyvR3pe3JJ8iBzLDIsn1Lcchm77zccE6qBHS1L1m7vcqPmSSng
cJu7fNAcIyFn21JDZOkhW+mF9jNJ7R2xln/tiHS10A/xBtTFvCfj313PCUJMqg9E
53YidryuAFpPQo+ZURKCV4oDDH7AhIt8rOYMwFfpmm3nNo2zHChHTwfoRtsXJrsA
gbHmjTjHO/n27l02ux9CbqD3vKolVu9McCIOroMzVCKrEnsuc2TMi+jsqzX/S3tm
J5HvNJ8R9MjSlJYvvceOqHG1nEEhvEKulcgPILu4PBee1XkFTbc=
=Bxz1
-----END PGP SIGNATURE-----

--=-bQw4XG6+wDl6vyCw5jq/--



--===============8405482156568616509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8405482156568616509==--


