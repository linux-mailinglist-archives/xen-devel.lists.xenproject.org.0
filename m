Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EEEB5081
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 16:35:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAEXW-0002pR-9O; Tue, 17 Sep 2019 14:33:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8DX=XM=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iAEXV-0002pD-5e
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 14:33:09 +0000
X-Inumbo-ID: 10d0651a-d958-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10d0651a-d958-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 14:33:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 147F9B667;
 Tue, 17 Sep 2019 14:33:07 +0000 (UTC)
Message-ID: <04ddefb4e66b349135631bd6dd63f3091d0707ec.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 17 Sep 2019 16:33:05 +0200
In-Reply-To: <20190914064217.4877-1-jgross@suse.com>
References: <20190914064217.4877-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: rework and rename
 vcpu_force_reschedule()
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8927049015020845364=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8927049015020845364==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-GffDWQIRVuhBqrMKHErn"


--=-GffDWQIRVuhBqrMKHErn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 08:42 +0200, Juergen Gross wrote:
> vcpu_force_reschedule() is only used for modifying the periodic timer
> of a vcpu. Forcing a vcpu to give up the physical cpu for that
> purpose
> is kind of brutal.
>=20
> So instead of doing the reschedule dance just operate on the timer
> directly. By protecting periodic timer modifications against
> concurrent
> timer activation via a per-vcpu lock it is even no longer required to
> bother the target vcpu at all for updating its timer.
>=20
> Rename the function to vcpu_set_periodic_timer() as this now reflects
> the functionality.
>=20
Personally, I'm rather happy to see the code which was doing that very
weird "let's go through rescheduling" dance going away. I, FWIW, never
understood why periodic timer handling was implemented that way (and
looking back at relevant changelogs does not help).

The code, as it results after applying this patch, is a lot better, and
easier to understand.

Performance and scalability wise, I don't have benchmarks for this
specific patch (but the ones I did included it, as it back then was
part of the core-scheduling series), but I agree with Juergen. I.e., I
think the patch is either neutral or, if it does something, it improves
things.

Furthermore, periodic timer is *not* used any longer (and since quite
some time/kernel versions). Basically, all we do with the periodic
timer is to disable it during boot. At least for Linux, but I think
this is the case for FreeBSD too. So, even if the patch would have a
negative impact (which again I don't think it's the case), we probably
won't see them.

On this grounds (and, of course, on the one that I've looked at the
code, and think it's correct), for the scheduling part:

> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Then, if some words about the outcome of the discussion in this thread,
e.g., a mention to the fact that the old code wasn't really lockless,
and that the new code is a lot more straightforward, it'd be even
better.

But my Rev-by stands, with or without this.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-GffDWQIRVuhBqrMKHErn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2A7qEACgkQFkJ4iaW4
c+5DmBAArie4EepGP79XEmTUDnx+oPXK993OYPtFS6R8C4Oa+gfF0g1L0AUtgJqK
3xDxtJDSDKigjsiIjeVoDuuqC0zU7kU5w0x4l4cH356WzleKy/IlzuO8nurPK4AL
t6oumyCLZniMG6ik40Jad2RV9sSSxkEfqYuKPjEfqmI7f90q6hctguyi/f+/nEpA
8/XZdqUcvp6Q+9VHEHDYfk0wYErYJErwNwGhtgZRMtrDshIbDuz/eyjv2eQTiNln
AQ4TrvOglGmr5z7h+2hA8r+BYCdwr4yCrssv8QTFl+evjnGRoJACX0FYYEyedcFA
bEDW/xDZ+Hg33Nfnk8NQS4LvtKDbwKLi1RrC3xEY788gDj4RFTjbj6uxdSPDH65O
WJMJi68QzOsugPCMiFSqYO3/m/EdtkWzUv37MgxLjY+1JRT3dUtLWOO05Th4HCGq
c3zHuThEDorbO74d/fIadia4hk9136+lP6e7G+wDGVEBvB9Ilz3s7ATH9fpuIiSZ
HgFFBz6fFg/d5UHPDq01EY2l2BU/JqYtCbv5u5OFjKZjh9Co4fAUr7rDLVblEweF
4womIKUNp6UgUeCZ/Rs9HmmXcmSWILWCR5edrNPxEVgSmwnzqyJVVbg0gG18RHI1
iXXJP1q3hI16HN1xpV67NW16Und0USUwO02LrnXLP9UlLHkNz2s=
=r+oH
-----END PGP SIGNATURE-----

--=-GffDWQIRVuhBqrMKHErn--



--===============8927049015020845364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8927049015020845364==--


