Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C96158BEA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 10:33:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Rrd-0007Xk-GO; Tue, 11 Feb 2020 09:29:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H8PB=37=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j1Rrc-0007Xf-3s
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 09:29:52 +0000
X-Inumbo-ID: 0db78684-4cb1-11ea-b539-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0db78684-4cb1-11ea-b539-12813bfff9fa;
 Tue, 11 Feb 2020 09:29:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B1F07AC77;
 Tue, 11 Feb 2020 09:29:50 +0000 (UTC)
Message-ID: <042afa6eee4bc8e9316e636bf30f0a2190f7ee11.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 11 Feb 2020 10:29:49 +0100
In-Reply-To: <20200210164533.29549-1-jgross@suse.com>
References: <20200210164533.29549-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: remove pointless ASSERT() in
 credit2
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
Content-Type: multipart/mixed; boundary="===============3732408143134362694=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3732408143134362694==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-F7RVruf2HW26vIPYIS+a"


--=-F7RVruf2HW26vIPYIS+a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-02-10 at 17:45 +0100, Juergen Gross wrote:
> The ASSERT() at the top of csched2_context_saved() is completely
> pointless, as the BUG_ON() just in front of it catches the same
> problem
> already.
>=20
Yep, I went double checking and this is my fault. :-(

Apparently, in ccf2ead7f52 ("xen: credit2: make the code less
experimental"), for this specific case, I added the assert but forgot
to remove the BUG_ON().

Thanks for noticing and acting on this. :-)

TBH, though, considering the nature of the check, I'd rather keep the
ASSERT() and kill the BUG_ON().

I can do the patch myself if you don't want to respin it that way.

Thanks again and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-F7RVruf2HW26vIPYIS+a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5CdA0ACgkQFkJ4iaW4
c+4JEw//Rg9Gh7iRE7RyR/T8ahvkQjQH3XjAJcpti7LxkLhNaNQvAgnw1878glu7
xpFh8JNDJZvQAHpUEzkvcGPh7OE7dXeza1IQwsquTPKMGXX3UQIFuGrlpAHnG4qn
TS0W29Zqz8r+9qZWIwgCkNuVSh4lqBVAYRnVqC+SCVad1hHmSE7CTswDmArOVZze
3P1rQFBOh1kr9QIkq+BmquO6eHjliiZwMiT9pWaPE+RkjUuf8UldcU7pW/FSSs0w
+PC+qMDbysR9m6XC+yfXVaGeBacknKHPlUTSjtT6eRukTH6AohmG6C/oXIOtzC1l
JiCawbYpTId34jBRDrnggmkeS5kPCA8pQxmkwkSCr8xjrFrYldoTEEsy8HiM+pn7
K0MapSCGIBHYMD5mEXAhxchSR3jNyadC51icir3m4Cq2mvOTUbSftBSwrUF3DEi/
4AWMWYR5CU3y4M61AHJ4+YNorHCn9tFGFoVJjO4YuQLbHteayUQ3URu61nARKbbN
gst7WQfjY2PcRGeqqPp4NwmpqCvloMdStvfLyokyLw76wuzrlgT7DVE4G428dG8Q
heo0PpIWQWIE5GY0l0a572G3LmVooFPXoV5u9JxiQsxMdDObffmetMh6HaClpJsI
mkgmSpWC1HJPXo8xkJpt443tD97kQZ7F/iaBDJFZpAmZsG5oIWE=
=MSyD
-----END PGP SIGNATURE-----

--=-F7RVruf2HW26vIPYIS+a--



--===============3732408143134362694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3732408143134362694==--


