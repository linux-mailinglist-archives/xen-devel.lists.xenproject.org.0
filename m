Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49731ED340
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 17:23:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgVEQ-0000z4-PL; Wed, 03 Jun 2020 15:23:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TRmg=7Q=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jgVEP-0000yz-4M
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 15:23:05 +0000
X-Inumbo-ID: 1e03105c-a5ae-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e03105c-a5ae-11ea-8993-bc764e2007e4;
 Wed, 03 Jun 2020 15:23:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9D135AE39;
 Wed,  3 Jun 2020 15:23:05 +0000 (UTC)
Message-ID: <6f090fd58272b1daceae95eb4ff27c1d2e6494c5.camel@suse.com>
Subject: Re: [Xen-devel] [RFC 1/9] schedule: Introduce per-pcpu time accounting
From: Dario Faggioli <dfaggioli@suse.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Wed, 03 Jun 2020 17:22:59 +0200
In-Reply-To: <061528bf93664a3ca00fce5d4bd3c585af1282e9.camel@epam.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
 <1568197942-15374-2-git-send-email-andrii.anisov@gmail.com>
 <8c74cacb-ff73-eddc-626c-f6fa862cf5a6@arm.com>
 <f3767489-e46a-3830-8b3c-0b637b71e0b8@gmail.com>
 <0e46fc4b29b7c3b3e6b4ca4704b9e7dac5738868.camel@epam.com>
 <6fcdb69457e5768b0fa2259f83a23158e9c939f5.camel@suse.com>
 <061528bf93664a3ca00fce5d4bd3c585af1282e9.camel@epam.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-boRCyQDAoLs8jWz6/Fgf"
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-boRCyQDAoLs8jWz6/Fgf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-06-02 at 01:12 +0000, Volodymyr Babchuk wrote:
> On Fri, 2020-05-29 at 10:48 +0200, Dario Faggioli wrote:
> >=20
> Actually, I tried to not only rebase this patch series to the current
> mainline, but also to add x86 support. This gave me deeper
> unsterstanding of the inner workings. At least I hope so :)
>=20
Right.

> Anyways, I want to discuss the matter before continuing reworking the
> patches. The goal of those patches is to account guest time more
> precisely.=20
>=20
Yes, I agree. IIRC, the patches are doing more than that, e.g.,
discriminating between the runtime of the idle vCPUs and the time
during which the CPUs were actually idle, and even trying to classify
somehow what the hypervisor was actually doing (guest sync, etc).

But, indeed, I would very much start with the one yous stated above, as
a goal.

> Right now I can see only two main reasons, when guest can be charged
> for a time it dindn't used: interrupts and soft irqs.=20
>=20
> - do_softirq() is called every time we leave hypervisor mode. It is
> used to do housekeeping for the hypervisor itself. But, some random
> guest will charged for time spent in do_softirq() unless this
> function
> is not called on a idle vcpu.
>=20
> - also, pCPU can be interrupted by IRQ assigned to some other guest
> or
> to hypervisor itself. But time spent in interrupt handler will be
> charged for a guest being interrupted.
>=20
I think those are the ones, yes.

> So, basically, to account guest time correctly, we need to substract
> time spent in do_softirq() and in do_IRQ().=20
>=20
That's how I'd try to do this, if it were me doing it.

> Actually, we can charge the correct guest for time spent in do_IRQ(),
> because handler code will eventually know target vCPU for the
> interrupt. There is technical problem with interrupt nesting. We will
> need some stack to track nesting correctly. But this is doable.
>=20
Yes, there's this, and maybe a few other "dependencies" that we may
discuss about, and try to track and account for, for even greather
fairness. But maybe this can come as a second step?

> Just for statistical purposes we can track hypervisor time somwhere,
> but it is not needed for scheduling decisions.
>=20
What we need is, I think, a way to tell the used/admin that that time
is being spent in the hypervisor. E.g., if we were spending (let's
exaggerate) 20% of the time processing interrupts and softirqs, the
user would see some of this 20% load coming from each guest. It
certainly wasn't ideal, but we do not want for such 20% to suddenly
vanish either.

> Am I missing something?
>
To me, it seems you're not. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-boRCyQDAoLs8jWz6/Fgf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7XwFMACgkQFkJ4iaW4
c+7q5w/9HVCMnBwn9QhwUbdraYKesML82Aps2WpbgWx2SdATI6IH5TKEp/xHI5uo
/bQDt0DJKLMRfenlNcpS3rhbI/xgzAvo0vVJr8r+ZOVb+chjwOWb9jPjp18kXArW
u92/DTl44duad+ZfuyG8VSr4FucDnvL7xWHFInRMYMwxuXE0nYwbgdqQ6WAwIId4
/7lX3rKXAfTwYvq397Qxo/14wgDpSsTEsln+xpPscQEBSwbbF2P+bN+kc172y6ZB
wQzAo39nTxOyMAmhTWW/fqpMsKY9Lk3uFxHsQW1nu4JnPjTiC3l4oz48pF1fFf+K
VaagEtFmhuF30J2CEu2zENEtQF8jVQGV0FbkVFy0e3ujNDn/t5Q4FAko7aCV7DTA
LhFvE8pm2jdG9RxHXxnWHwprRliOnoYjiC+uR9gtHIZjxv+ZjVpVxuL/ome92GW5
xL+eQl0npwisNa3P7V/d+tcyKzvv5qghLWnSPG2DpozXoJqJU6WfubwIEe0xWmrQ
xBeGk7v7IikXUrj22pGn8IBdlrLpvw39eVZF6XBzuoHT37MGJheVMED7ZjSU1YS0
6YMYSC9+t0eUXF5hCyS1ujVMUChkvrZeCQS8hCLzQb3jgpF9nCwSis0odcFuCkjS
TTXMyDwDldxe7oTCAhX/anyNCNY64Dcl4WkQdy9SHJNOLvNSIG0=
=ZgGZ
-----END PGP SIGNATURE-----

--=-boRCyQDAoLs8jWz6/Fgf--


