Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ED36D17F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 18:07:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho8tC-0007ah-GN; Thu, 18 Jul 2019 16:04:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHH2=VP=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ho8tB-0007ac-Ix
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 16:04:13 +0000
X-Inumbo-ID: ae761070-a975-11e9-84e5-839c2586be03
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae761070-a975-11e9-84e5-839c2586be03;
 Thu, 18 Jul 2019 16:04:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6B7AAD69;
 Thu, 18 Jul 2019 16:04:10 +0000 (UTC)
Message-ID: <d616dd9d00c7dcd990f8b4a5616dcc689704c4a0.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, Juergen Gross
 <jgross@suse.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
In-Reply-To: <864742f0-9b84-e8fe-75be-fa94e217383f@citrix.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
 <3cb1c2b777e623a55bf87dc12a155734667ab23e.camel@suse.com>
 <c8f4c719-ce7c-9ca0-7d5b-c34db3f21e38@citrix.com>
 <a57d18f4-e947-5c3e-3d8d-6e1371f0c9af@suse.com>
 <864742f0-9b84-e8fe-75be-fa94e217383f@citrix.com>
Organization: SUSE
MIME-Version: 1.0
Date: Thu, 18 Jul 2019 18:04:03 +0200
User-Agent: Evolution 3.32.3 
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 RobertVanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============1876966835337469683=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1876966835337469683==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-uToNS6DDbN6Fgq+Fvk7Z"


--=-uToNS6DDbN6Fgq+Fvk7Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-07-18 at 16:14 +0100, Sergey Dyasli wrote:
> On 18/07/2019 15:48, Juergen Gross wrote:
> >=20
> > I can easily reproduce the issue with any PV guest with more than 1
> > vcpu
> > by doing "xl save" and then "xl restore" again.
> >=20
> > With the reproducer being available I'm now diving into the
> > issue...
>=20
> One further thing to add is that I was able to avoid the crash by
> reverting
>=20
> 	xen/sched: rework and rename vcpu_force_reschedule()
>=20
Ah, interesting!

> which is a part of the series. This made all tests with PV guests
> pass.
>=20
That's good news. :-)

> Another question I have is do you have a git branch with core-
> scheduling
> patches rebased on top of current staging available somewhere?
>=20
For my benchmarks, I used this:

https://github.com/jgross1/xen/tree/sched-v1-rebase

I don't know if Juergen has another one which is even more updated.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-uToNS6DDbN6Fgq+Fvk7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0wmGsACgkQFkJ4iaW4
c+7lNRAA2ucj/zxPQoZ5RwvvHXQ4juWWBD5AtRSQ1MxoqlGCZa8uYGv8wzZW6Z1D
JaPQQ+KbpDlol+scwqTAICp0rHxJeKCjIqnS9wcemNZiIx8g2am1KTxZHSXEgmF7
kqKxtQiQ7LPulFuMbJh3KXAkL0A8eL4omN/VK77uK+QxCUYNIcawhS9ilQRw/EDL
VU8zNIjNgLeB9C1MJH7hyKFRMPVCwcRR0w+KA2ol2GRnI2I6ssvyek7yupmlD3Pf
9fyXzHpaQYLCC1ZAHHzHPAj1oJqaYDXsnAtKeLZykmE4QBHxCnqPD8uL1BuJAsfa
I992onrL5TT6swZcWD94n3HM3Lb2mIsYGnCerKfeCbpkPdCISdL8SFGqLmcANOh/
cP9iR+UNaZNBqopTwx/TYYXMRK8pTivmUnm4FsTo6w0Lk7ZGCpZskSzsJNEvFAJm
pFLV1Ze4I+0xPEJZaUr6z9o7h5zBgpod5Mye8dy45ADWY8VhMN5qqCi/uZtw1IDT
pQGFr3SFYGh93XInLl29kC7kBbaiSSMaRz1GQ4CVUVTjOZK4HwmLFUo7NB0MPl3I
wKE/RL7TXSzN6e0Pk7HJCWqoUtrcSbb1kdH9/R3jKMnSbyURYyhI/bIBhE+YaWhN
wfSG0J/98LeqQYEdppzfng8WYp7prJzyPTmhzc3K8Gnp+5U4g5g=
=mB8o
-----END PGP SIGNATURE-----

--=-uToNS6DDbN6Fgq+Fvk7Z--



--===============1876966835337469683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1876966835337469683==--


