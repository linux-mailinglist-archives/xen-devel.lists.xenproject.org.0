Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0989E189CF
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 14:32:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOi9l-0007Qg-77; Thu, 09 May 2019 12:28:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Daoc=TJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hOi9k-0007Qb-F6
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 12:28:12 +0000
X-Inumbo-ID: e7d62135-7255-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e7d62135-7255-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 12:28:11 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Thu, 09 May 2019 14:28:09 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Thu, 09 May 2019 13:27:46 +0100
Message-ID: <1b3b628e537db5f9a1738cf00ec558b076a3ec0b.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, George Dunlap
 <george.dunlap@citrix.com>,  xen-devel@lists.xenproject.org
Date: Thu, 09 May 2019 14:27:45 +0200
In-Reply-To: <a3e3370b-a4a9-9654-368b-f8c13b7f9742@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
 <1d5f7b35-304c-6a86-5f24-67b79de447dc@citrix.com>
 <2ca22195-9bdb-b040-ce12-df5bb2416038@suse.com>
 <0ed82a64-58e7-7ce4-afd1-22f621c0d56d@citrix.com>
 <a3e3370b-a4a9-9654-368b-f8c13b7f9742@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.1 
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============4565029395431376825=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4565029395431376825==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-y0zoWS/sNWD1rOslVoMU"


--=-y0zoWS/sNWD1rOslVoMU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-05-09 at 12:56 +0200, Juergen Gross wrote:
> On 09/05/2019 12:04, George Dunlap wrote:
> > On 5/9/19 6:32 AM, Juergen Gross wrote:
> > > On 08/05/2019 18:24, George Dunlap wrote:
> > > >=20
> > > > I think these would better as BUG_ON()s.  These aren't hot
> > > > paths, and if
> > > > we do somehow hit this situation in production, 1) it's safer
> > > > to
> > > > BUG_ON() than dereferencing NULL, and 2) you'll get a more
> > > > helpful error
> > > > message.
> > >=20
> > > Only for those 2 instances above? Or would you like BUG_ON()
> > > instead of
> > > ASSERT() in the other added inlines, too (maybe not for pick_cpu,
> > > but
> > > e.g. the ones in free_*) ?
> >=20
> > Why not for pick_cpu()?  It's the same basic logic -- in
> > production, if
> > it *is* NULL, then you'll either crash with a segfault, or start
> > executing an exploit.  Much better to BUG_ON().
>=20
> pick_cpu is called rather often, so maybe we should avoid additional
> tests.
>=20
+1

> Hmm, thinking more about it: why don't we just drop those
> ASSERT/BUG_ON
> for mandatory functions and test them when doing the global_init()
> loop
> over all schedulers. We could just reject schedulers with missing
> functions.
>=20
+10

:-D

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-y0zoWS/sNWD1rOslVoMU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzUHMEACgkQFkJ4iaW4
c+5q8BAA7luuVpPsxCmy9B8Ld1zCmz46yl2mYn3JE1zmX7/tuthJi0QbSrqTQs8R
P+lwQlqz+cGbBZkH+nJAKJk0ubQWSIa74ZAzPQToHDOntxnQIzLbK73WG42DluzA
KKX53UaRQ63p2k9fGY/bdiOV3IA5Oq1BPfZHe7IVN3j/UFqdnO7X2qPCOoM7SbxK
IwpHpROmEMYKNjLO4h2fh5Rr+eAGgdfXE7aM1RMe2Jb2IGAHPgrwsbUFoAF5H5IH
RI9OMPaTOPpAxweJHkffnJQdxvxS97p6695DE28AbmXpHYa8Q7aGDnCpBPCRwkm2
Kw9GnWdqhxFguUZVTHUjyiFXFSiz0wIM+IA7JISayr+ZVwpaMLUOhy4RFY2ca0Zt
lqd/z7TJnmEZKfCQNKLTZe7DvgpBLGQsosos6E4yAX59HnM24X15z2jtaLFcJelW
Y3AAubC5iklv1YOkoi235xe8zbM99NA+Ro2ETHMCd8MHmGMK4hyrVbFM4o+TLbjL
BMNzSOabeKa3vVgPu71BIRnQyFEANUJKtgKYOy27eaKom5QKdC7QI1ULRNox7wD+
Tax/JvJ+qsK5I40rFDqOEs4Uqlnrq2JE+uyZTBOIOCftv3+05xyyRLLgLGtWXj3A
4QYY5zdlyGZGOSAVGaFVk3spg3C13frB9ZeGpOvF7RR7bK8EKhg=
=JJ7R
-----END PGP SIGNATURE-----

--=-y0zoWS/sNWD1rOslVoMU--



--===============4565029395431376825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4565029395431376825==--


