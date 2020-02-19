Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ADD16444D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 13:31:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4OSo-0000Qk-RC; Wed, 19 Feb 2020 12:28:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NMhh=4H=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j4OSn-0000Qf-91
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 12:28:25 +0000
X-Inumbo-ID: 524d9eec-5313-11ea-8348-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 524d9eec-5313-11ea-8348-12813bfff9fa;
 Wed, 19 Feb 2020 12:28:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 73577B9ED;
 Wed, 19 Feb 2020 12:28:23 +0000 (UTC)
Message-ID: <f378d39c9eeeb676aa82f8d3c9fc40975eade3ea.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 19 Feb 2020 13:28:22 +0100
In-Reply-To: <20200213143504.23777-1-jgross@suse.com>
References: <20200213143504.23777-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix get_cpu_idle_time() with
 core scheduling
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
Content-Type: multipart/mixed; boundary="===============1383395988327196756=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1383395988327196756==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ELLv93RooXWOm2cT2CJd"


--=-ELLv93RooXWOm2cT2CJd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-13 at 15:35 +0100, Juergen Gross wrote:
> get_cpu_idle_time() is calling vcpu_runstate_get() for an idle vcpu.
> With core scheduling active this is fragile, as idle vcpus are
> assigned
> to other scheduling units temporarily, and that assignment is changed
> in some cases without holding the scheduling lock, and
> vcpu_runstate_get() is using v->sched_unit as parameter for
> unit_schedule_[un]lock_irq(), resulting in an ASSERT() triggering in
> unlock in case v->sched_unit has changed meanwhile.
>=20
> Fix that by using a local unit variable holding the correct unit.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

And...

> I have verified that all other uses of v->sched_unit are not
> problematic: they are all for non-idle vcpus, or in scheduling paths
> dealing with scheduling themselves and thus being aware of the
> potential problem or not vulnerable by it.
>
... Thanks for having done this as well. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-ELLv93RooXWOm2cT2CJd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5NKeYACgkQFkJ4iaW4
c+6Yaw//ShXpxnAzKie/YS2BKittJJUEHAgOAp8mK6WjUhosf+YEM/HJc2Kikj9q
iWrl0Iyk1JX8FrYFms2zgMCk66NzC+HV929RcNw/XB/zAn+RSgG8ScVdSR0IGKBo
dlEemxOTaTMpsGt33RBwBx4d8fDkerBT3NAZ8h5LKsX3zh5QUr1jcluBaktRurKC
vTfLkW8QrB8SlQYfdEb4bMcMV6B85RguNgGfAx4jzHIECHfITsYw+qjWehh+HyLN
ooB10DBf5yr5L/+2qM2JVQuwMcjHVzpPb0f1WITYNgVpmu/rMCKuj2iYndSWvoqz
KRhiyIQFBH4HxeH7XvY0aahUj0fZ8gOJ+YFmxGXjIubpP9OE0g1bIrsUB2IGJwVr
yuqPmYI5mlpKFh+OK04uEGdXmJPMzS6y5yrb1UQf/xWUnpVz5zr90l1WRh/Aov9j
iIGZhPsGBUJLPzpfN3j3TxkW0cBVwmQyUZNqQNSeI88/asmtWVHrEgB5WcQP11Cq
md0P4t2cJThxq7+xcN5c7OOBxSUKlyX0pIvppomFIoZhm+UDxY4kbyULH2QHLZI5
9dz09UYSsp1Yn4Kwl/tfKEWKiesuu0nWaGzgDkdsQ2YcPW9utX1eft5qPJHT7JLf
YJREDl5rQmkhzrqYJmRaSEp+csipLkQtcYKj2dNEvoQ5h+YCtGY=
=uaBX
-----END PGP SIGNATURE-----

--=-ELLv93RooXWOm2cT2CJd--



--===============1383395988327196756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1383395988327196756==--


