Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC11C96B2
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 18:40:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWjYc-0003Jf-AO; Thu, 07 May 2020 16:39:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slKb=6V=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jWjYa-0003Ja-Nc
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 16:39:32 +0000
X-Inumbo-ID: 536933c6-9081-11ea-9f4d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 536933c6-9081-11ea-9f4d-12813bfff9fa;
 Thu, 07 May 2020 16:39:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D835B1AC;
 Thu,  7 May 2020 16:39:33 +0000 (UTC)
Message-ID: <b1cde2cfb29068e98f848af41e260ad635ac5fa4.camel@suse.com>
Subject: Re: [PATCH] xen/sched: always modify vcpu pause flags atomically
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 07 May 2020 18:39:28 +0200
In-Reply-To: <20200506151655.26445-1-jgross@suse.com>
References: <20200506151655.26445-1-jgross@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-28z0u6N0CAUKbwJByzYD"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-28z0u6N0CAUKbwJByzYD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-05-06 at 17:16 +0200, Juergen Gross wrote:
> credit2 is currently modifying the pause flags of vcpus non-
> atomically
> via sched_set_pause_flags() and sched_clear_pause_flags(). This is
> dangerous as there are cases where the paus flags are modified
> without
> any lock held.
>=20
Right.

> So drop the non-atomic pause flag modification functions and rename
> the
> atomic ones dropping the _atomic suffix.
>=20
> Fixes: a76255b4266516 ("xen/sched: make credit2 scheduler vcpu
> agnostic.")
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

> ---
> It should be noted that this issue wasn't introduced by core
> scheduling
> as even before credit2 was using the non-atomic __set_bit() and
> __clear_bit() variants.
>
Yes. I can see that in 222234f2ad17185 ("xen: credit2: use non-atomic
cpumask and bit operations"), where the svc->flags are switched to non-
atomic updates (as, for them, it is true that they're always accessed
while holding locks), switching of setting the _VPF_migrating
pause->flags non atomically also slipped in, but that was clearly a
mistake. :-(

I believe (but I haven't checked this part too thoroughly) that it was
the only one back then. Afterwords, when another instance was added, in
__runq_tickle(), we found the already existing one and followed suit.

Good catch, and thanks. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-28z0u6N0CAUKbwJByzYD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl60OcAACgkQFkJ4iaW4
c+7zHhAArUenfxoCOwbGoMzRknFnF3qY9XIrCsSR5jH81/E+k6gx/OZ6wwA37M12
GD3DGdv32pEhZBzvhmQg5hAq/ux+6JdXGU6OlC8PYX77u4/AYFOj+ez3SXQhgoVF
RJE+QTN3HGC1Zivdy13s0nNg6Sd9zRJ3mBcjGk8rTERMw30fizVsHZauLTUn5aII
grj1jPtMxXfqQWhnwtbrrdymKZinAManFAkjcPK9ex5QTrQzr7e0rc/qXeUvDjtc
mGj/T1tGgbSp4bVvuxgdZm5GkkCJUU36K4C1bNjTvScUah3kyOldEGSvI6vN2z9B
h6DLnD9n4LRdYtvtqDKRNcRt8tFYgTiHesETPXWvSMgUgpAVLpbLgFBJiPPYh9GA
hAyNVrUtzOCUL11WZ90Zr+CMaypS1mupqMEXhNoXnlmC9rnoGthvptidV+UM8Mzk
Ad53iiTX8Hxzo8cKVgShD5Esq/0jaaaFKn49XjPaTNvZ7eV4/75YfJeDi3Db/tn6
V3Q2IuVfP8tAB8JsZW/FqEJluyo99dJNbxtEp4ZolSU+57uHUC98gsUcEZ8N8yYf
urLjmUqhC2XYuBA3pb6sg2tvQxd6jXNToXP3AHfoGdTheGfu5wUtSSF5BSenQVmM
hikYn77ipV7J87kT9/QYxdj1MYoOCUC9s3n/xFWHsI5Dr4hVzlM=
=sweq
-----END PGP SIGNATURE-----

--=-28z0u6N0CAUKbwJByzYD--


