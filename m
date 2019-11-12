Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E3F8B8E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 10:17:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUSGR-0002k3-8O; Tue, 12 Nov 2019 09:15:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xf4I=ZE=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iUSGP-0002jv-I1
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 09:15:05 +0000
X-Inumbo-ID: e93ac5b2-052c-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e93ac5b2-052c-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 09:15:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 466F7B3AB;
 Tue, 12 Nov 2019 09:15:03 +0000 (UTC)
Message-ID: <8cccef1789872091a80d639bc5c08c1048021ba7.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
In-Reply-To: <20191108065739.21345-1-jgross@suse.com>
References: <20191108065739.21345-1-jgross@suse.com>
Organization: SUSE
MIME-Version: 1.0
Date: Tue, 12 Nov 2019 10:14:56 +0100
User-Agent: Evolution 3.34.1 
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix a potential issue with core
 scheduling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============2195460220659796574=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2195460220659796574==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ajOzTc0IowPKe215xUGd"


--=-ajOzTc0IowPKe215xUGd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-11-08 at 07:57 +0100, Juergen Gross wrote:
> cpupool_online_cpumask() is used by credit and rt scheduler. It
> returns
> all the cpus of a cpupool or all online cpus in case no cpupool is
> specified.
>=20
> The "no cpupool" case can be dropped, as no scheduler other than the
> init scheduler will ever work on cpus not associated with any
> cpupool.
>=20
Yes, this is a cool thing about having the init cpupool/idle scheduler
in place. It's even cooler in Credit2, where it will allow us to drop
some of the cpumask_and() cpumask_or() operations.

It's the reason why, even before core scheduling, I was considering
doing an idle scheduler myself.

I'll get to write that patch (the one for Credit2, I mean) at some
point. :-)

> As the individual schedulers should only ever work on scheduling
> resources instead of individual cpus, their cpupool_online_cpumask()
> use should be replaced by cpupool->res_valid.
>=20
> Note that only with core scheduling active this might result in
> potential problems, as with cpu scheduling both masks are identical.
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


--=-ajOzTc0IowPKe215xUGd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl3KeAsACgkQFkJ4iaW4
c+4qjw//dhhtLeeSfi7uapVy7cMdQUHzg4mMaHxqBjMOluU9ggY9lV7osKunLnyV
QiGC59mbCTY18gLCxlIX6DzHmCEjXJWkNp1h/8nR5c0DnVUDEGhBIKNsAByu7Wvj
oZ0Ca+9QhlYqNTGkV/1ArJnZ/rg0Jv2RiQx9sOVcubKGHr3r1Ag1DxTZLzgw0wgB
RLLZEhwLcDsEWYAaZ2iyfDIO/Kvb4vb5SGeqRjSuVTBdMztC5auQZcD08GpdlnxT
O5JFjPzxk1pSdjTt0RFGgU3KD8+5tXslbgcZYsPdtNBKhZqXps3Cv/ZHw6DnWnsE
eMhZqeNrzz5y6UQPcFuMDiqTNa2TcxWBebB455xIcqbMxJowUAMSnUr4/hgsDPsV
Nw4ajlJgWAOja5RxbaehZgoWM6OuwI+W8LVuNeOOQS0KslGopTLLydx8Wedk8DGV
0N3Gds6qzw9h+BOrPM3Ibm6jmysAptEoZC2iGNnnlxvMMsTbJCtwiuOrOsx9+lxg
hEvbACZKpL9tF0W//84m4Mf44ud/K9TfJS137JMAStQQN8wqMFdRr4ChOq2MXAlZ
jLGJjNLFZOpKHbIzKGO4PlN8AiMJchjXHGcxyPVAzWdR4f8eg2BcP0TLIShIxh8y
MAPgr3+vGG+t3/wvuIKuf8/LODOF5Y239C0+1gpz4X/OI3Zvq/A=
=Ju+9
-----END PGP SIGNATURE-----

--=-ajOzTc0IowPKe215xUGd--



--===============2195460220659796574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2195460220659796574==--


