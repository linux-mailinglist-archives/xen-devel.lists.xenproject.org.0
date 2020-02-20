Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C32165ADD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 11:00:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4iaF-0005k7-V5; Thu, 20 Feb 2020 09:57:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=10iu=4I=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j4iaE-0005k2-Mg
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 09:57:26 +0000
X-Inumbo-ID: 64efa298-53c7-11ea-84f2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64efa298-53c7-11ea-84f2-12813bfff9fa;
 Thu, 20 Feb 2020 09:57:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18261ABE7;
 Thu, 20 Feb 2020 09:57:24 +0000 (UTC)
Message-ID: <215dd48f64d3d2b867dbc4897aba31f3b672b819.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 20 Feb 2020 10:57:23 +0100
In-Reply-To: <20200211122736.16714-1-jgross@suse.com>
References: <20200211122736.16714-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: add some diagnostic info in
 the run queue keyhandler
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============1285742974925745058=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1285742974925745058==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/D51d9MA8eUAcpTYuXq2"


--=-/D51d9MA8eUAcpTYuXq2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-02-11 at 13:27 +0100, Juergen Gross wrote:
> When dumping the run queue information add some more data regarding
> current and (if known) previous vcpu for each physical cpu.
>=20
> With core scheduling activated the printed data will be e.g.:
>=20
> (XEN) CPUs info:
> (XEN) CPU[00] current=3Dd[IDLE]v0, curr=3Dd[IDLE]v0, prev=3DNULL
> (XEN) CPU[01] current=3Dd[IDLE]v1
> (XEN) CPU[02] current=3Dd[IDLE]v2, curr=3Dd[IDLE]v2, prev=3DNULL
> (XEN) CPU[03] current=3Dd[IDLE]v3
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
I'm fine with this patch, i.e., I think the additional logging it is
adding is useful and the locking is correct and in line with the
current (scheduling) keyhandler locking practices.

And thanks for making the requested adjustments to the changelog. :-)

So, I think it should go in:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

If/when, as a result of the discussion going on in the thread about
keyhandler locking, we decide to change all the locks for all the
keyhandlers, then we'll change them here as well.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-/D51d9MA8eUAcpTYuXq2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5OWAMACgkQFkJ4iaW4
c+6GexAAu6K5aw8p7qgY7jOFloXFUH21W8tI43mM89Se4DW5ja57BgTCYENdM+hj
MCm+SAdbdhTWQN/ggAljBJ8nWfvlpDh6M/UT01UILTvxhnlX/+9AiC3bdOZlIYhW
aMlxK5sXF4lISD6ycheP/Mq3iaRN/TSST990o4LAHdkzQkSy9FxBBkLnAV1pYEk/
hSGC6wGJYS70XOwOcdOGPJQLJRAlLVpnqAyURlXWmJmOQ0OxvSMB6vY5v1cajrWe
qvQpO0fXNwr0x1JHSJbfW0SER5taR7Hn2oYHBHqk80tnZayPQ5XiWN93fMms58sa
wZoPWFgxMg5F+4ltYWmfSfwDn2BA8OoFDDFgdJyWXdkCE9lpJK2vdXAJzQ60pc1h
XaaKbxEKeuMBdpkjMe/HBXaLDFmNeWvS5lq1JRNA7KqnEvauGTrfz3/jahXu+x2y
q8dyT0pRIVAiJYYuxKFZizNgjEmDRinKHs1pM/nB2wMfVChwezcN29siVIP4XqpC
9/bJ3okWQr5AS+Lvms94C8YqFKkvY4WEWGrPBMxs3+MlXewuiIGiRlLNINH9Q6xE
uYcX+7SVu5OJYponKnxiA0EamrsT5L5diODF4vhC9kPa8PufiOr6ClBSII/Pe5WP
MXw276Zk3N2FOZToDCRndr1KyTyFJucrPYv0JGrmZtiDnk7RntE=
=CuNW
-----END PGP SIGNATURE-----

--=-/D51d9MA8eUAcpTYuXq2--



--===============1285742974925745058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1285742974925745058==--


