Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6821C16FA15
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 09:58:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6sTL-0003BH-Nv; Wed, 26 Feb 2020 08:55:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vaS8=4O=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j6sTK-0003BC-Jq
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 08:55:14 +0000
X-Inumbo-ID: b398b6a2-5875-11ea-93de-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b398b6a2-5875-11ea-93de-12813bfff9fa;
 Wed, 26 Feb 2020 08:55:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2F028AD72;
 Wed, 26 Feb 2020 08:55:13 +0000 (UTC)
Message-ID: <faa40424c77ea0a6d8cc59c41bbd6c634b223138.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 26 Feb 2020 09:55:11 +0100
In-Reply-To: <20200220133949.29832-1-jgross@suse.com>
References: <20200220133949.29832-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: rework credit2 run-queue
 allocation
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
Content-Type: multipart/mixed; boundary="===============0298873997359733438=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0298873997359733438==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-kIVGGcGbbtzCXUaq2Ip5"


--=-kIVGGcGbbtzCXUaq2Ip5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-20 at 14:39 +0100, Juergen Gross wrote:
> Currently the memory for each run-queue of the credit2 scheduler is
> allocated at the scheduler's init function: for each cpu in the
> system
> a struct csched2_runqueue_data is being allocated, even if the
> current scheduler only handles one physical cpu or is configured to
> work with a single run-queue. As each struct contains 4 cpumasks this
> sums up to rather large memory sizes pretty fast.
>=20
> Rework the memory allocation for run-queues to be done only when
> needed, i.e. when adding a physical cpu to the scheduler requiring a
> new run-queue.
>=20
> In fact this fixes a bug in credit2 related to run-queue handling:
> cpu_to_runqueue() will return the first free or matching run-queue,
> which ever is found first. So in case a cpu is removed from credit2
> this could result in e.g. run-queue 0 becoming free, so when another
> cpu is added it will in any case be assigned to that free run-queue,
> even if it would have found another run-queue matching later.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards=20
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-kIVGGcGbbtzCXUaq2Ip5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5WMm8ACgkQFkJ4iaW4
c+4nkQ/7BDvAGzPWUBfPVDpm9ogctil7IVDKQRNlLWJruuI1WNR5oSk89qHqyHlW
eLoE3So7fnRGKLynGjQYSMP0pwVtusmZEdlilxLAOnyHRw28zVXEd4ROrRRVJxRT
hQSpYTTTNQpLuoInvd/cWoIBstXHxT4Q1WzM4ryd85karHUpcVA7fnzLIc8UuDuZ
fiKlzlWnEgfSeKn0rLjWBFVb9hlRUxcmiZe0qk4jkLR7Vchv5u5pVx/YOKG9mdAt
DWbSTPjo4TuPzeYCW9dwOpqfE2QCbxphvSM8ggjwdjohoCISuOAoTs9DQqZAzMiv
Q6vDYSqDO9tbMy+Yhq3W8scOMDg71o8H3Avgxcq8AQqDXGJtEcHblK31oUzYMRcP
DqoIXX8RbeGbwhh4G5roIF1DnifXBElUr/AWB7GnBAwhHnzlRo/NzmwHppygUcP3
kREzA+L/A+3NbNmKc8iJTiQE510qZOQFNxWB3iWuCS+5OSTu9NTtBcxV8nHFXyko
0fAHmrBIst6EYitli/G9HojH6bKq/9lbAYhYLlRwAoV6rrES0jsJ0UNsCUiHnjL4
wXLDEPeUfbkRSM4RNEphVgJNxHx3BfcbGdq9EiUqyAqX053bRCRlUVP0FPUtQv8a
GeqCreLxGUWBR0L/Scu5u+YVR9zdhuv3BZBavcyji3j4Vaa5agY=
=7gCt
-----END PGP SIGNATURE-----

--=-kIVGGcGbbtzCXUaq2Ip5--



--===============0298873997359733438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0298873997359733438==--


