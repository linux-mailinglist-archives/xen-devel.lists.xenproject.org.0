Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC02BC65C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:13:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCihr-0004E4-AH; Tue, 24 Sep 2019 11:10:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCa0=XT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iCihp-00043q-M9
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:10:05 +0000
X-Inumbo-ID: 1caf1426-deb7-11e9-ae5c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 1caf1426-deb7-11e9-ae5c-bc764e2007e4;
 Tue, 24 Sep 2019 10:36:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 69DD7ACEC;
 Tue, 24 Sep 2019 10:36:04 +0000 (UTC)
Message-ID: <3ecd3f6a83f02a29b30f4b437d076e9bce697633.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Date: Tue, 24 Sep 2019 12:36:02 +0200
In-Reply-To: <60d95799-e760-c7ea-0c81-60f350ff32df@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <60d95799-e760-c7ea-0c81-60f350ff32df@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 00/47] xen: add core scheduling support
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6226274881102096966=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6226274881102096966==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2gse21NvQdgW1cZFTPOg"


--=-2gse21NvQdgW1cZFTPOg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-20 at 18:14 +0200, Jan Beulich wrote:
> On 14.09.2019 10:52, Juergen Gross wrote:
> > This is achieved by switching the scheduler to no longer see vcpus
> > as
> > the primary object to schedule, but "schedule units". Each schedule
> > unit consists of as many vcpus as each core has threads on the
> > current
> > system. The vcpu->unit relation is fixed.
>=20
> There's another aspect here that, while perhaps obvious, I didn't
> realize so far: Iirc right now schedulers try to place vCPU-s on
> different cores, as long as there aren't more runnable vCPU-s than
> there are cores.=20
>
Indeed they do.

> This is to improve overall throughput, since
> vCPU-s on sibling hyperthreads would compete for execution
> resources. With a fixed relation this is going to be impossible.
>
It is. And that is the reason why my benchmarks show rather bad
performance for a 4 vCUPUs VMs on a 8 CPUs (4 cores, with
hyperthreading) host. In fact, as Juergen showed during his Xen Summit
talk, in such a case core-scheduling achieves much worse performance
than "regular" cpu-scheduling, both when hyperthreading is enabled and
disabled.

It's an intrinsic characteristic of this solution that we have decided
to go for (i.e., introducing the 'virtual core' and 'scheduling
resource' concepts, and act almost entirely at the schedule.c level).

> Otoh I can of course see how, once we have proper virtual
> topology, this allows better scheduling decisions inside the
> guest, in particular if - under the right circumstances - it is
> actually wanted to run two entities on sibling threads.
>=20
Yes, this is indeed one aspect. There is also the fact that, currently,
as soon as you have 1 more vCPU than there are cores, e.g. coming from
another VM, the guest that had each of its vCPUs running on one core,
experiences a slowdown. While, with core-scheduling enabled from the
beginning, performance stays consistent.

In any case, this all happens with core-scheduling actually enabled.
With these patches applied, but cpu-scheduling selected at boot, fully
idle cores are still preferred, and the vCPUs will still be spread
among them (as soon as there's any available).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-2gse21NvQdgW1cZFTPOg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2J8ZIACgkQFkJ4iaW4
c+7UBBAAyYw4DRQZO+RWHAZ1bt2RFpt8Q6LcUQ0ka5I9eLmcaVsnMUa2O0sFNp1L
0iM0VAIox4EV3DanE5QwcqhA50H9+5qYZAXXRh0Z/anOTa/zZdfdH1Hz3vyt7Duh
ewYs7edih4l6wKY2tTMO/o+39vIKWjEeQHsyICjKVHdINJkfOiOAiHrB1au3mGJG
li7y+TDPdbwDhBCoxI3vm0BcWy6U1SKH0Ru8hD2dO0TSWJBDobzO7XckIFwSMWcH
/oFcAHS1J36I8ir+VNGsesjh5iB6gFllEeKwxoaNH/yl/NAo8hHKi8Y2AF/M1D7s
wo14cAN4OfwmaJfs7f3BK0k3Szi1iAz69OM29ysgEUa4RAHSdpqfAI8U3cEoU8gY
MYhmxEPG1JpSpgbysxXeGwmh65yVvI2r9W/Hyr7CP2f8eU7ORjVzM/I6g4htpw2s
HguZzw7pGhb1Hojurf8qzgWw5iGkkXNnQfBC56dpwZmlRsDmeSfhVyT7mVTVD1Ay
i+s4hqDhYEEfb8Mye7iqJIAw0HSug9X+ceEiUox+ZyK9lJvSD5UD9lpeyekaMmZQ
2n0iG/4uoEgy5GorgpRgRNt9oc9C2iDUWfA66XJfP1hZ7oWOTVbebE/sxpyLOKlW
dOmnk/yr0pyEB3IgFwluMKR71c0EP0Uj3BOnKLVimqj9tUw+lUE=
=3moq
-----END PGP SIGNATURE-----

--=-2gse21NvQdgW1cZFTPOg--



--===============6226274881102096966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6226274881102096966==--


