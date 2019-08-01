Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B0F7DA2E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 13:23:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht97Y-0007VP-Mn; Thu, 01 Aug 2019 11:19:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=buLn=V5=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ht97X-0007VK-A7
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 11:19:43 +0000
X-Inumbo-ID: 401ea87e-b44e-11e9-89d9-6b6be9b12cf6
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 401ea87e-b44e-11e9-89d9-6b6be9b12cf6;
 Thu, 01 Aug 2019 11:19:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4780FB65D;
 Thu,  1 Aug 2019 11:19:38 +0000 (UTC)
Message-ID: <3d07492e9a9e1ebb1bff17a4f42afa2bd9ec1723.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, Julien Grall
 <julien.grall@arm.com>,  xen-devel@lists.xenproject.org
Date: Thu, 01 Aug 2019 13:19:37 +0200
In-Reply-To: <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
Organization: SUSE
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Andrii Anisov <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============3980624383500116104=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3980624383500116104==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/ctN6ks8K1xHgICjqrQ7"


--=-/ctN6ks8K1xHgICjqrQ7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-08-01 at 09:45 +0300, Andrii Anisov wrote:
> Hello Julien,
>=20
> On 30.07.19 23:10, Julien Grall wrote:
>=20
> > > In this series I think I need interrupts locked until I start
> > > time accounting for hypervisor. Time accounting is started by
> > > `tacc_head()` function. I prefer to have it called from C,
> > > because it is more convenient and obvious for those who are less
> > > familiar with the ARM code.
>=20
> Here is the question to you: what is the best place (and way) to
> start hypervisor time tracking?
>=20
This is actually quite an important question... And I'd like to throw
it back at you (Andrii)! :-D :-P :-)

In fact, I was about to ask myself something similar, such as, can we
take a bit of a step back and define:

- what's the, let's say, accounting granularity we want? "Just" guest
and hypervisor? Or more fine grained?

- assuming we "just" want hypervisor and guest, which are the
events/turning points at which we should switch "timing accounting
bucket"? Can we make a list?

And I'd be fine for such list to be generic, in the first place (e.g.,
hypercall, IRQ, etc)... Then we'll turn the entries into actual
locations in the code, as a second step.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-/ctN6ks8K1xHgICjqrQ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1CyskACgkQFkJ4iaW4
c+7dphAA7TEobLoush/y9QKX+DQF/4KivFxaUqBUzcaykEyp8bxYCKV2/48InqGv
czBO1+oarCWAlzT8GDy9jEn5oyJC42jWr/fYa1o8I48TIQUoEX/E0YtglernUBTl
Dj59zv1l2ZS3Bxkq2AmNzax6njvOmSSBB7BUGUY0GkAIH5+eG6MrQhAfZu63VCo5
p8XIo0kj12uDBnQZk1cWPzSErYmiBgywSBSIIXhLuZaJvTkubTxzdgbbiATDCh0S
JKgUTa0jgZzBa7XEhm8Phc7V5lyvaxs5mKSvJNbSJ5yp5clOLaTXazTKzRVkrf28
QPPAY9Id3NIMEozqgXbt+JUrtzKubflxJrEzXcemNHnnt1EkH9bYRf62aXmoMqqI
z1CPBZRzhpNLLh8uFqVwOcRwjPnJ4KB3QU2PW0rKlYpym4MC6T+4EZmvKTKmgwJ6
hjJTr0zp+tOCfDueT0FesRGpVem4Tm/2H6bCq8m+70kkoOu7oQcCNtg0DwOP/Gfz
gcPUtBPZq37KYYMzgWxLem1yXMehCWg+9LkQ7ZSYWziH860JGntkSpPVYmP/wZYp
SclXqvXvzR07bSLYuvpawR8V4hkbLKLy3HyjdYs1ZTI+L8ZEw1akiIXioyG8zoVE
rSAnGGj6pPwJoxbNerQkiQ6ahsDyjX5Ymwq5H5AkNJE91za8d5Q=
=oY37
-----END PGP SIGNATURE-----

--=-/ctN6ks8K1xHgICjqrQ7--



--===============3980624383500116104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3980624383500116104==--


