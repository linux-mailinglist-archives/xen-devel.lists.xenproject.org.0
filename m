Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C34F1C9965
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 20:34:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWlLy-00056E-5R; Thu, 07 May 2020 18:34:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slKb=6V=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jWlLx-000569-5S
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 18:34:37 +0000
X-Inumbo-ID: 66da9cf0-9091-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66da9cf0-9091-11ea-9887-bc764e2007e4;
 Thu, 07 May 2020 18:34:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8F817AD6C;
 Thu,  7 May 2020 18:34:37 +0000 (UTC)
Message-ID: <7bdf9bd021ff4bd1131a8a41f42b37d6559f600f.camel@suse.com>
Subject: Re: [PATCH 1/3] xen/sched: allow rcu work to happen when syncing
 cpus in core scheduling
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 07 May 2020 20:34:33 +0200
In-Reply-To: <20200430151559.1464-2-jgross@suse.com>
References: <20200430151559.1464-1-jgross@suse.com>
 <20200430151559.1464-2-jgross@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-tzvKayGra/mLBcidFyB9"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-tzvKayGra/mLBcidFyB9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-30 at 17:15 +0200, Juergen Gross wrote:
> With RCU barriers moved from tasklets to normal RCU processing cpu
> offlining in core scheduling might deadlock due to cpu
> synchronization
> required by RCU processing and core scheduling concurrently.
>=20
> Fix that by bailing out from core scheduling synchronization in case
> of pending RCU work. Additionally the RCU softirq is now required to
> be of higher priority than the scheduling softirqs in order to do
> RCU processing before entering the scheduler again, as bailing out
> from
> the core scheduling synchronization requires to raise another softirq
> SCHED_SLAVE, which would bypass RCU processing again.
>=20
> Reported-by: Sergey Dyasli <sergey.dyasli@citrix.com>
> Tested-by: Sergey Dyasli <sergey.dyasli@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
In general, I'm fine with this patch and it can have my:

Acked-by: Dario Faggioli <dfaggioli@suse.com>

I'd ask for one thing, but that doesn't affect the ack, as it's not
"my" code. :-)

> diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
> index b4724f5c8b..1f6c4783da 100644
> --- a/xen/include/xen/softirq.h
> +++ b/xen/include/xen/softirq.h
> @@ -4,10 +4,10 @@
>  /* Low-latency softirqs come first in the following list. */
>  enum {
>      TIMER_SOFTIRQ =3D 0,
> +    RCU_SOFTIRQ,
>      SCHED_SLAVE_SOFTIRQ,
>      SCHEDULE_SOFTIRQ,
>      NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ,
> -    RCU_SOFTIRQ,
>      TASKLET_SOFTIRQ,
>      NR_COMMON_SOFTIRQS
>  };
>
So, until now, it was kind of intuitive (at least, it was to me :-) )
that the TIMER_SOFTIRQ, we want it first, and the SCHEDULE one right
after it. And the comment above the enum ("Low-latency softirqs come
first in the following list"), although brief, is effective.

With the introduction of SCHED_SLAVE, things became slightly more
complex, but it still is not too far a reach to figure out the fact
that we want it to be above SCHEDULE, and the reasons for that.

Now that we're moving RCU from (almost) the very bottom to up here, I
think we need some more info, there in the code. Sure all the bits and
pieces are there in the changelogs, but I think it would be rather
helpful to have them easily available to people trying to understand or
modifying this code, e.g., with a comment.

I was also thinking that, even better than a comment, would be a
(build?) BUG_ON if RCU has no smaller value than SCHED_SLAVE and SLAVE.
Not here, of course, but maybe close to some piece of code that relies
on this assumption. Something that, if I tomorrow put the SCHED* ones
on top again, would catch my attention and tell me that I either take
care of that code path too, or I can't do it.

However, I'm not sure whether, e.g., the other hunk of this patch would
be a suitable place for something like this. And I can't, out of the
top of my head, think of a really good place for where to put it.
Therefore, I'm "only" asking for the comment... but if you (or others)
have ideas, that'd be cool. :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-tzvKayGra/mLBcidFyB9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl60VLkACgkQFkJ4iaW4
c+6mdRAAyGsYwy5ZeAYgtoLaXPBpAQXg36zl35RzQyVFnAJ92N8BGDRSQUfOOTSp
anX+pWE79941pJdVMzCiWzBzFqYDwGM9w+y1xntaJOYQxX9aTP4ub/zTAJEgMBtI
uTuHGSCPEe0pNckeICYBEDEGSadtPU0FOIQqrh45c16oQSLu7aJONdJE9CH2LMaI
Km+HP4CuIirvJmJNwoF4PqNAxKG0rSoOkUQTYwNd/wR4flQF/St7kZ++uL+Xj6Wq
gPWVe70wHGhf4szxEUuzMnRRzwT6apijZvUr8wDyXv5yfiddAw9pKDwPA/8rwctG
YNJw8ezagWenTMjbhJUwRoZKRSmMTy1bzDjywR8RZoAPA0A8dvtP5UNp3OhZXKrx
Lfvn2ZAETTw5OdOf6LBHtdNCgvGoqxlTbMHqeifWL2fKHe0JsZjIWqk5WEdxVmqJ
h0KjQEyTZKdHYRxigB6FmRbFseOh0SERsjgt6UgeCmKKIUeE1goDnp56OgAHZCiX
/93IOcyNxm8b1f59XfFCVVB4jhit8XQwRSLGE+jejq48LXKAqyPm8h2W/WlGBTIo
6TSj8yVKZim2T3dNVbUFKLNTLNeja2CW6opY2qpSNobi2NZfS74PpzcASe1wc6KM
ztfFmYvi/DS69S/RVANvuLg5E3/eO6HQxL2nbWX0g7k5UxA5y3Q=
=6PTh
-----END PGP SIGNATURE-----

--=-tzvKayGra/mLBcidFyB9--


