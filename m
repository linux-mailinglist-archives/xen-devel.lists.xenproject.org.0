Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739C5BD4FD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 00:36:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCtNX-0003j1-J4; Tue, 24 Sep 2019 22:33:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCa0=XT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iCtNV-0003iw-Sh
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 22:33:49 +0000
X-Inumbo-ID: 5f955f52-df1b-11e9-9627-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 5f955f52-df1b-11e9-9627-12813bfff9fa;
 Tue, 24 Sep 2019 22:33:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BD52BB60E;
 Tue, 24 Sep 2019 22:33:46 +0000 (UTC)
Message-ID: <71a73c6c9224bcaaf1b47a3f0cd0c5a304334300.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 00:33:45 +0200
In-Reply-To: <20190914085251.18816-27-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-27-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 26/47] xen/sched: Change vcpu_migrate_*()
 to operate on schedule unit
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
Content-Type: multipart/mixed; boundary="===============7107878478177271522=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7107878478177271522==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bZE2WhiYhJGvY6/s/HNj"


--=-bZE2WhiYhJGvY6/s/HNj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Now that vcpu_migrate_start() and vcpu_migrate_finish() are used only
> to ensure a vcpu is running on a suitable processor=20
>
Is this sentence like this (I mean with that "Now" at the beginning)
because it was --in previous versions of the series-- right after the
patch that changed vcpu_force_reschedule()?

If yes, then that is not the case any longer, so we may want to re-
phrase.

> they can be
> switched to operate on schedule units instead of vcpus.
>=20
> While doing that rename them accordingly and make the _start()
> variant
> static.=20
>
What does this mean/refer to?

Wasn't vcpu_migrate_start() static already?

> As it is needed anyway call vcpu_sync_execstate() for each
> vcpu of the unit when changing processors.
>=20
Again, what do you mean with "As it is needed anyway"?

> diff --git a/xen/common/schedule.c b/xen/common/schedule.c
> index 0bd9f0d278..70271cdea2 100644
> --- a/xen/common/schedule.c
> +++ b/xen/common/schedule.c
>=20
>  /*
>   * Initiating migration
>   *
> - * In order to migrate, we need the vcpu in question to have stopped
> + * In order to migrate, we need the unit in question to have stopped
>   * running and had sched_sleep() called (to take it off any
>
Might be me (not a native speaker), but this reads weird. "and have
called sched_sleep()" or "and sched_sleep() to have been called" would
sound better.

It's, of course, not your fault, but I guess we can consider adjusting
it, since we are touching the line above it.

Or maybe you also want to queue it up for the cleanup series?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-bZE2WhiYhJGvY6/s/HNj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2KmckACgkQFkJ4iaW4
c+7JDQ//XM9HzZ58cRHw5UYNszwACvv4Q52Aq6x1IrN1PLGRtmj7SvmU09VoVSNS
YSVl8YTb0zb2C+HDvt+KqZemjeK2EzKupUWjf8tsdjWo/RJntUo+o2vY/yMw5kcC
J2YHm4qbzsKzX37h7jygcX3eKHverIIkSZiWToxW5dFvI/CNfQjuTQSf5BVpKMfZ
l6Z8V9A0ELuDbbu0PiVPfLhu9UOfegdp6iDzshmPK46HZZe9aH7iNkCBr9417dfx
6YVisNPgP8pbSJJLGZJ+gNMp4rtdJGNDUxi+aRXJBVHTp6DpdqKo1Zrz8oUTTtMB
yb87thnegzwjgXg7MCYmtE8pZaJqw92SRhuy/XpXoBxo5jU2e25HTu93i5klph/M
zKGwSVudC+OJm0FE/Qi6v8Id00Nu2K94uouiMRGmEA13vcxxOyrJpc7+UpYit06A
E0xxUsqn2UfjE2nAgwlCeiW9gbDI2yMgr/+87VzlaTEANMaj2VyqDQDUglGDW8IA
IcfL1m/h0t4ozeJnZ9905WOf3bnyIosIHxTHtg63cVfQ4nVWmfeYJe+neeTotrvu
1i3wuFpCAV8DKcLKxAEPs1OR9Pgd8JO++sSnxpx8Wh+O66gEX5xfmibxH4Z0d3Vi
b17TCXjxhj7LzpXLk1Wf2EUH6dDQGxGjdyNuaQD5jBVLxJgxFbM=
=XI/3
-----END PGP SIGNATURE-----

--=-bZE2WhiYhJGvY6/s/HNj--



--===============7107878478177271522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7107878478177271522==--


