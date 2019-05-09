Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320C18DA5
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 18:07:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOlXm-00025k-6t; Thu, 09 May 2019 16:05:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Daoc=TJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hOlXl-00025f-3y
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 16:05:13 +0000
X-Inumbo-ID: 38caf752-7274-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 38caf752-7274-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 16:05:11 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Thu, 09 May 2019 18:05:10 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Thu, 09 May 2019 17:04:40 +0100
Message-ID: <3b72ad3ab0f8afdde8ee32fb2370dbbcb29c9fdd.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 09 May 2019 18:04:39 +0200
In-Reply-To: <20190508113132.19198-1-jgross@suse.com>
References: <20190508113132.19198-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix csched2_deinit_pdata()
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
Content-Type: multipart/mixed; boundary="===============6622695024258622103=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6622695024258622103==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-wdljtkcDW+0JlqPLlI9a"


--=-wdljtkcDW+0JlqPLlI9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-05-08 at 13:31 +0200, Juergen Gross wrote:
> Commit 753ba43d6d16e688 ("xen/sched: fix credit2 smt idle handling")
> introduced a regression when switching cpus between cpupools.
>=20
> When assigning a cpu to a cpupool with credit2 being the default
> scheduler csched2_deinit_pdata() is called for the credit2 private
> data
> after the new scheduler's private data has been hooked to the per-cpu
> scheduler data. Unfortunately csched2_deinit_pdata() will cycle
> through
> all per-cpu scheduler areas it knows of for removing the cpu from the
> respective sibling masks including the area of the just moved cpu.
> This
> will (depending on the new scheduler) either clobber the data of the
> new scheduler or in case of sched_rt lead to a crash.
>=20
These issues will drive us all crazy, at some point! :-(

I really wish I managed to put a cpupool test in OSSTest. I guess I can
pickup my old draft, but I need some time to put together an OSSTest
dev environment again. :-/

Anyway...

> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-wdljtkcDW+0JlqPLlI9a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzUT5cACgkQFkJ4iaW4
c+4LZw/6A7DjRkwI5xUyYsNqnBOWEyt2IvIGgh2BrOGjsJ1FucBqO3LTQyBL/0ia
KDw3CTNG6gQUbR9i+x7+BOXq34N4GsKOHl6eAWQMS7rD1LnlB5rSBoKadX7jtjGR
xQ5kHVLCI4vUhq3vlP+mQNiINgOVlBTjyfKj0sXukzoT71MAvMAC24GIYTSKG8dp
MI3+sZFGOiFPiakkMB2K83hNlWLB1A7el7e9RL5wR1WR6sY6SoDE3HoC6TWsSY20
71R+hRRsz9hZzE36ZR4r1jnEY/LMIy/HWrgJDvb8CWcj7AfQfGWdgaAw8vNzjzIa
/6gJDUD2IxUMtUCTEGqWWcbWEgrg6P2fB7s78zbkwOQnZPHD4u9HxuckoWcY1Ihv
qQQIPtAzmNAs/uHhQgollx37FaJhkMadq37AOP7ELYSNoaEPeOXhhNBrqlmAwrpn
Zv/Z2RAKtXVugMRKHWZN139t0dYhP2Gmw8gcdAMoD3IbWvINpfi17nOqdUD+wA6Z
VZ9TSIO0GABIu/uXcZ6kEueHRD2PJHKTFA4lkI9R7QVea6D1cfSqIrZjtLEvGns6
m4YBKvOZPYr97T/DlPdUWctMU4NyWJ09eIl6ICimCXZyJ6uMWI90dxx6sHzNMqYZ
FkobtUs/ASaN+akd2L3zOBPSqCibcPJ5pqcVPzz1Jg2ND9gmhTA=
=Y4ph
-----END PGP SIGNATURE-----

--=-wdljtkcDW+0JlqPLlI9a--



--===============6622695024258622103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6622695024258622103==--


