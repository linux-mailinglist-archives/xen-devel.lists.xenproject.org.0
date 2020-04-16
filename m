Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8AA1ACDF2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 18:44:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP7cL-0003jq-8m; Thu, 16 Apr 2020 16:43:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04wr=6A=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jP7cK-0003jk-5p
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 16:43:56 +0000
X-Inumbo-ID: 74e059d5-8001-11ea-8bcd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74e059d5-8001-11ea-8bcd-12813bfff9fa;
 Thu, 16 Apr 2020 16:43:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7172FACA1;
 Thu, 16 Apr 2020 16:43:53 +0000 (UTC)
Message-ID: <d2577c4b4ff040c8f256d203e647619d9d4d6ebb.camel@suse.com>
Subject: Re: [PATCH] sched: print information about scheduler granularity
From: Dario Faggioli <dfaggioli@suse.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
Date: Thu, 16 Apr 2020 18:43:52 +0200
In-Reply-To: <20200416083341.21122-1-sergey.dyasli@citrix.com>
References: <20200416083341.21122-1-sergey.dyasli@citrix.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-SnfX3jvJDGmwQRqGTV5c"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-SnfX3jvJDGmwQRqGTV5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-16 at 09:33 +0100, Sergey Dyasli wrote:
> Currently it might be not obvious which scheduling mode is being used
> by the scheduler. Alleviate this by printing additional information
> about the selected granularity.
>
I like the idea. However, I don't like how verbose and long that line
becomes.

>  Messages now look like these:
>=20
> 1. boot
> (XEN) [00089808f0ea7496] Using scheduler: SMP Credit Scheduler
> (credit) in core-scheduling mode
>=20
> 2. xl debug-keys r
> (XEN) [   45.914314] Scheduler: SMP Credit Scheduler (credit) in 2-
> way core-scheduling mode
>=20
What about adding an entry, just below these ones. Something looking
like, for instance (both at boot and in the debug-key dump):

"Scheduling granularity: cpu"

(or "core", or "socket")

Also

> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -38,7 +38,35 @@ static cpumask_t cpupool_locked_cpus;
>  static DEFINE_SPINLOCK(cpupool_lock);
> =20
>  static enum sched_gran __read_mostly opt_sched_granularity =3D
> SCHED_GRAN_cpu;
> -static unsigned int __read_mostly sched_granularity =3D 1;
> +static unsigned int __read_mostly sched_granularity;
> +
> +char *sched_gran_str(char *str, size_t size)
> +{
> +    char *mode =3D "";
> +
> +    switch ( opt_sched_granularity )
> +    {
> +    case SCHED_GRAN_cpu:
> +        mode =3D "cpu";
> +        break;
> +    case SCHED_GRAN_core:
> +        mode =3D "core";
> +        break;
> +    case SCHED_GRAN_socket:
> +        mode =3D "socket";
> +        break;
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
> +    }
> +
> +    if ( sched_granularity )
> +        snprintf(str, size, "%u-way %s", sched_granularity, mode);
>
I'm not sure about using the value of the enum like this.

E.g., in a system with 4 threads per core, enabling core scheduling
granularity would mean having 4 vCPUs in the scheduling units. But this
will still print "2-way core-scheduling", which I think would sound
confusing.

So I'd just go with "cpu", "core" and "socket" strings.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-SnfX3jvJDGmwQRqGTV5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6Yi0gACgkQFkJ4iaW4
c+7+Sg//UY/Widq8Kp3d0N6+YzrY8WXHDC6d5F/0VeLpArqweCv7Xfg7C4/zE0Rg
JZF75OOpOs6Lna6/5xICDJcM9kjjpFnIlToJlJ53jKSJ0Ghhqlo2LsygFkcPNWn9
F6rzpOM+1vAApCrdGqPv0mrx4ZGzXphgBIWtsdgVeRCjQCrtBojfp6/rKIodQCwa
0mzLUlUjmqJvIYKS8qUxaAe6dCPMKqCxz999waT+cM44FeAdIYgA7Fnsk2bZOQb0
twfoKCzW+ETTXUcMHWlvJX4m3PWAjDy+pffG5aazLCz+PPZnDpqSr8z8bsrqZdIy
3Tk6bqNd4/ka9522U9ke+uO8ZPbefo0YzDu76bg8RW4jIvJ1mucAJfza8FVq/63l
O1YKxmIMut9MjMzZ3rfJXLWVzG6TYnoBV+xDX0hxG/Y6vD0Xs5fxgpeK/UEm4gvX
ZTPKbhOih8Wp0xebKEvoCo7tyyHAqkZwdGjJ4NdSX5cTn16/Fd5KgP+LBFPViiuJ
aVZxH4h/VzIjI/449pwLR8tGCW+SJft6R6lX4Iyn6yf19r142B3VOTpQSy5glH8B
aIjESCaCP68I6lPjk88MQmBOZyKebXT5+q2iq6o/KQQf0svg3Saug8rZKqN6zlmt
3MSNA+bZlJCpbDHW3sGetMhtrwwPgFbcH7GBSDX7oxvORAI2h+Y=
=iycN
-----END PGP SIGNATURE-----

--=-SnfX3jvJDGmwQRqGTV5c--


