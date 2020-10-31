Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B822A1215
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 01:42:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16727.41528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYeyB-00021j-A8; Sat, 31 Oct 2020 00:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16727.41528; Sat, 31 Oct 2020 00:42:11 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYeyB-00021K-6i; Sat, 31 Oct 2020 00:42:11 +0000
Received: by outflank-mailman (input) for mailman id 16727;
 Sat, 31 Oct 2020 00:42:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0JK=EG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kYeyA-00021F-Gn
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 00:42:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87f1276a-f99f-4ff8-98f9-f93e534152e1;
 Sat, 31 Oct 2020 00:42:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A37C0B07D;
 Sat, 31 Oct 2020 00:42:07 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Q0JK=EG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kYeyA-00021F-Gn
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 00:42:10 +0000
X-Inumbo-ID: 87f1276a-f99f-4ff8-98f9-f93e534152e1
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 87f1276a-f99f-4ff8-98f9-f93e534152e1;
	Sat, 31 Oct 2020 00:42:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604104927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2EHFWQ8CihojlaDJ65dYND77qyv6QB1qxRCf5IyZwKA=;
	b=stQFBsYqbwD9xB527PI9aiX+GapOFIz3OszEpXfLLox0PIOYU6ZiDg86EOnescteMYE+Lq
	peCfgmS+ZT+wsVahVxv8+ShyURi9+pvdpMpp2J8HnKKUkA1PHGwqvg/2PIn+O7an95uXT3
	aBjG3bR+C5yAXp1E8rNw9xSHXcCcY9E=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A37C0B07D;
	Sat, 31 Oct 2020 00:42:07 +0000 (UTC)
Message-ID: <cb67b4beb9d9065a61071bf7236f40802ace4203.camel@suse.com>
Subject: Re: BUG: credit=sched2 machine hang when using DRAKVUF
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Cc: xen-devel@lists.xenproject.org, =?ISO-8859-1?Q?J=FCrgen_Gro=DF?=
	 <jgross@suse.com>
Date: Sat, 31 Oct 2020 01:42:06 +0100
In-Reply-To: <66f4b628-970c-9990-118a-572f971d6ed2@suse.com>
References: <157653679.6164.1603407559737.JavaMail.zimbra@nask.pl>
	 <a80f05ac-bd18-563e-12f7-1a0f9f0d4f6b@suse.com>
	 <1747162107.4472424.1603850652584.JavaMail.zimbra@nask.pl>
	 <66f4b628-970c-9990-118a-572f971d6ed2@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-vSzTJZVszvG3C28vxN6U"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-vSzTJZVszvG3C28vxN6U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-10-28 at 08:45 +0100, Jan Beulich wrote:
> On 28.10.2020 03:04, Micha=C5=82 Leszczy=C5=84ski wrote:
>=20
>=20
> I have to admit that the log makes me wonder whether this isn't a
> Dom0 internal issue:
>=20
> > [=C2=A0 338.968676] watchdog: BUG: soft lockup - CPU#5 stuck for 22s!
> > [sshd:5991]
> > [=C2=A0 346.963959] watchdog: BUG: soft lockup - CPU#2 stuck for 23s!
> > [xenconsoled:2747]
>=20
Yeah, weird.

> For these two vCPU-s we see ...
>=20
> > (XEN) Domain info:
> > (XEN)=C2=A0=C2=A0 Domain: 0 w 256 c 0 v 14
> > (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 1: [0.0] flags=3D20 cpu=3D0 credit=3D-100=
00000 [w=3D256]
> > load=3D4594 (~1%)
> > (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 2: [0.1] flags=3D20 cpu=3D2 credit=3D9134=
904 [w=3D256]
> > load=3D262144 (~100%)
> > (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 3: [0.2] flags=3D22 cpu=3D4 credit=3D-100=
00000 [w=3D256]
> > load=3D262144 (~100%)
> > (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 4: [0.3] flags=3D20 cpu=3D6 credit=3D-100=
00000 [w=3D256]
> > load=3D4299 (~1%)
> > (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 5: [0.4] flags=3D20 cpu=3D8 credit=3D-100=
00000 [w=3D256]
> > load=3D4537 (~1%)
> > (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 6: [0.5] flags=3D22 cpu=3D10 credit=3D-10=
000000 [w=3D256]
> > load=3D262144 (~100%)
>=20
> ... that both are fully loaded and ...
>=20
> > [...]
>=20
> ... they're actively running,
>
True indeed. But as I said in my other reply, it's weird that we have
so many vCPUs with the artificial value that we use to represent the
minimum value of credits we allow a vCPU to have.

And it's weird that, with some idle CPUs and with two vCPUs running
vCPUs with negative credits, we have one with positive credits sitting
in the runqueue.

Unless the debug-key captured a transient  state. Like, d0v1 is in the
runqueue because it just woke-up and the 'r' dump occurred between when
it's put in the runqueue and when a physical CPU (which is poked during
the wake-up itself) picks it up.

It seems unlikely, and this still would not explain nor justify the -
10000000. But, still, Micha=C5=82, can you perhaps check whether, while the
issue manifests, poking at the 'r' key a few times always show the same
(or a similar) situation?

> > (XEN) RUNQ:
> > (XEN) CPUs info:
> > (XEN) CPU[00] current=3Dd[IDLE]v0, curr=3Dd[IDLE]v0, prev=3DNULL
> > (XEN) CPU[02] current=3Dd[IDLE]v2, curr=3Dd[IDLE]v2, prev=3DNULL
> > (XEN) CPU[04] current=3Dd0v2, curr=3Dd0v2, prev=3DNULL
> > (XEN) CPU[06] current=3Dd[IDLE]v6, curr=3Dd[IDLE]v6, prev=3DNULL
> > (XEN) CPU[08] current=3Dd[IDLE]v8, curr=3Dd[IDLE]v8, prev=3DNULL
> > (XEN) CPU[10] current=3Dd0v5, curr=3Dd0v5, prev=3DNULL
>=20
> ... here. Hence an additional question is what exactly they're doing.
> '0' and possibly 'd' debug key output may shed some light on it, but
> to interpret that output the exact kernel and hypervisor binaries
> would need to be known / available.
>=20
Yes, I agree. Even considering all that I said (which seems to point
back at a Xen issue, rather than kernel), knowing more about what the
vCPUs are doing could indeed be helpful!

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-vSzTJZVszvG3C28vxN6U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+cst4ACgkQFkJ4iaW4
c+7I5w/7BnpDsKNKpgEfi0+Nf9z73RKRy83ITAAuI9caGsTUNMZtaf7Q+hZ/8d6K
vWoh5y1tlr+1ZRlpxKuzP+J9Z91G33mKL6oqtfRtg7kT+JHRZqeM4tdKwiO4jXJ3
Hgq0lJrSlFkCJ/Rsi/Fxk0CE9CSg/d28EiIqbnQQHvkl36vojIjYZpcU9ngzv42f
4JiwG6KCquXmrtmH2JQ3R8ek8vtGsu/qDEuFbgZytANEB4l6SpWHHa2WB+Wh3EA3
J+GVSnGgTersCg+9O3R9oEFuW8VlBWmXIOskfmEHwo3HmVCz2QXGvjHXGF8KT1RZ
3vRrEyMrQsB3G2s1T3RlIIrmq/5xc/gLYAdW62cf8zJI6WErrVmS3huS6l3OfwAC
FYGBqMRaYUv+lRUw22Qnt6ZHvRGs8oxYg3MuZu503CQsD/YkxuiPf61CEvteLQKW
cFN9WcrGKH/KDgB5w2eQvyEFLBlaE32oCxkdXIWNdcw8x+xwov/GQVnCE4ChK37A
dzxV+RxVmpiwZah7derhniJFdtQqI8/Ii2UX8RSLuoWxRNWnWeBrxNrREDxzxNgW
Cs/j0IVZC7WgO/Ydw31hTuDXg2n0PdH2wXmTy5RPm+viBkzAmIKCuyulpYSBe6yl
IFaN+Q791GqgZAFMQpV4bzGwqu6x2oowTLu3Gzti48mVOH2h8Zk=
=mhuD
-----END PGP SIGNATURE-----

--=-vSzTJZVszvG3C28vxN6U--


