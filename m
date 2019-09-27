Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41752C0897
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:29:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDs8c-0004C4-OD; Fri, 27 Sep 2019 15:26:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDs8b-0004Bz-AZ
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:26:29 +0000
X-Inumbo-ID: 2cbc1d4c-e13b-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2cbc1d4c-e13b-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 15:26:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5FBDAD87;
 Fri, 27 Sep 2019 15:26:27 +0000 (UTC)
Message-ID: <134451031c9a9d0ff944f62541d32931e4ec71f8.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 17:26:26 +0200
In-Reply-To: <20190927070050.12405-36-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-36-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 35/46] xen/sched: make vcpu_wake() and
 vcpu_sleep() core scheduling aware
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============9057385873639323403=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============9057385873639323403==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-wLPFNUT1JGPBJmts41h7"


--=-wLPFNUT1JGPBJmts41h7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> vcpu_wake() and vcpu_sleep() need to be made core scheduling aware:
> they might need to switch a single vcpu of an already scheduled unit
> between running and not running.
>=20
> Especially when vcpu_sleep() for a vcpu is being called by a vcpu of
> the same scheduling unit special care must be taken in order to avoid
> a deadlock: the vcpu to be put asleep must be forced through a
> context switch without doing so for the calling vcpu. For this
> purpose add a vcpu flag handled in sched_slave() and in
> sched_wait_rendezvous_in() allowing a vcpu of the currently running
> unit to switch state at a higher priority than a normal schedule
> event.
>=20
> Use the same mechanism when waking up a vcpu of a currently active
> unit.
>=20
> While at it make vcpu_sleep_nosync_locked() static as it is used in
> schedule.c only.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
I'm ok with the code in this patch.

I'd just like to see the comment(s) around the asymmetry between
vcpu_sleep_xxx() and vcpu_wake() added, as agreed upon this morning (in
the V3 thread).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-wLPFNUT1JGPBJmts41h7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2OKiIACgkQFkJ4iaW4
c+41yA/8C2w0nVtN2/UdQiTx14a0ba26+n19Zz0TGETE9PWskUgo3wFaQm+roibd
7Sl/sAmzsuc3thb6TlTDeXcFat2WNwmlH53TLhxvnWzneTQpWx8B9ewwr/zMsah1
mEmj6DDydSh569bIKiLgopfK3nHn+68UqbsCuMl6VPU+nzXRi+biRMpeoJGrbVHS
5Qdewq3iJ9tD3jWy57bjJ/9Wz7PM7VSoQ6e0tLBctCV2lW5gF12VmqXiWtui7VVa
wNv8ZAJ0jvzo7b8dsTENokweN075Yb8joAI3akC+x+Sa9jdjabHFpKiJeFokksZu
T8eoqARSiIVolTrqi1M75D6ESMZdkTPgUyzEmZDhAXiEuq8ZjiaWftkmfg13RXEu
o5kfQFPIK7U/GpySm4ncVI8RUpNJTFuubV04SXqOtpYZ5Q1jxU2IVg5kuuwnyXEV
AvurBszGTLnm35Kfc/1brr0bA1JU2Ma3x27YNnFqv201+Bcr159BAMq7+YbsFRCX
MiyBbm7tkdZO3+htJbL75ZA4A3IVxuvLvPGjKNhEKZqmJSQySY8q73JIN7zBR9H/
3rTUHH8bMmiI8UWQ0lRYbo4rApRa4kut2r2bo+RXVdJ3OtLjNMmLuV8v77wrAQB5
pF5DvPs2AYrlr5ooHlEy/LAb8EspGr0XcY+OtqMVOuKDi24BylU=
=nk9C
-----END PGP SIGNATURE-----

--=-wLPFNUT1JGPBJmts41h7--



--===============9057385873639323403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9057385873639323403==--


