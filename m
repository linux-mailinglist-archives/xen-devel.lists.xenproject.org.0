Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29C7764FC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:00:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqyqL-0005Eb-TI; Fri, 26 Jul 2019 11:57:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqyqK-0005EW-Ip
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 11:57:00 +0000
X-Inumbo-ID: 77f905b7-af9c-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 77f905b7-af9c-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 11:56:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CC7C1AC32;
 Fri, 26 Jul 2019 11:56:56 +0000 (UTC)
Message-ID: <79b01757ee19b57ac43649a4d94e378891152887.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Date: Fri, 26 Jul 2019 13:56:55 +0200
In-Reply-To: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
Organization: SUSE
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC 0/6] XEN scheduling hardening
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============8971317218627693518=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8971317218627693518==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-4sCBAI7/ZedKqqh62w5v"


--=-4sCBAI7/ZedKqqh62w5v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Adding George plus others x86, ARM and core-Xen people]

Hi Andrii,

First of all, thanks a lot for this series!

The problem you mention is a long standing one, and I'm glad we're
eventually starting to properly look into it.

I already have one comment: I think I can see from where this come
from, but I don't think 'XEN scheduling hardening' is what we're doing
in this series... I'd go for something like "xen: sched: improve idle
and vcpu time accounting precision", or something like that.

On Fri, 2019-07-26 at 13:37 +0300, Andrii Anisov wrote:
> One of the scheduling problems is a misleading CPU idle time concept.
> Now
> for the CPU idle time, it is taken an idle vcpu run time. But idle
> vcpu run
> time includes IRQ processing, softirqs processing, tasklets
> processing, etc.
> Those tasks are not actual idle and they accounting may mislead CPU
> freq
> governors who rely on the CPU idle time.=20
>
Indeed! And I agree this is quite bad.

> The other problem is that pure hypervisor tasks execution time is
> charged from
> the guest vcpu budget.=20
>
Yep, equally bad.

> For example, IRQ and softirq processing time are charged
> from the current vcpu budget, which is likely the guest vcpu. This is
> quite
> unfair and may break scheduling reliability.=20
> It is proposed to charge guest
> vcpus for the guest actual run time and time to serve guest's
> hypercalls and
> access to emulated iomem. All the rest is calculated as the
> hypervisor run time
> (IRQ and softirq processing, branch prediction hardening, etc.)
>=20
Right.

> While the series is the early RFC, several points are still
> untouched:
>  - Now the time elapsed from the last rescheduling is not fully
> charged from
>    the current vcpu budget. Are there any changes needed in the
> existing
>    scheduling algorithms?
>
I'll think about it, but out of the top of my head, I don't see how
this can be a problem. Scheduling algorithms (should!) base their logic
and their calculations on actual vcpus' runtime, not much on idle
vcpus' one.

>  - How to avoid the absolute top priority of tasklets (what is obeyed
> by all
>    schedulers so far). Should idle vcpu be scheduled as the normal
> guest vcpus
>    (through queues, priorities, etc)?
>
Now, this is something to think about, and try to understand if
anything would break if we go for it. I mean, I see why you'd want to
do that, but tasklets and softirqs works the way they do, in Xen, since
when they were introduced, I believe.

Therefore, even if there wouldn't be any subsystem explicitly relying
on the current behavior (which should be verified), I think we are at
high risk of breaking things, if we change.

That's not to mean it would not be a good change, or that it is
impossible... It's, rather, just to raise some awareness. :-)

>  - Idle vcpu naming is quite misleading. It is a kind of system
> (hypervisor)
>    task which is responsible for some hypervisor work. Should it be
>    renamed/reconsidered?
>=20
Well, that's a design question, even for this very series, isn't it? I
mean, I see two ways of achieving proper idle time accounting:
1) you leave things as they are --i.e., idle does not only do idling,=20
   it also does all these other things, but you make sure you don't=20
   count the time they take as idle time;
2) you move all these activities out of idle, and in some other=20
   context, and you let idle just do the idling. At that point, time=20
   accounted to idle will be only actual idle time, as the time it=20
   took to Xen to do all the other things is now accounted to the new=20
   execution context which is running them.

So, which path this path series takes (I believe 1), and which path you
(and others) believe is better?

(And, yes, discussing this is why I've added, apart from George, some
other x86, ARM, and core-Xen people)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-4sCBAI7/ZedKqqh62w5v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl066ocACgkQFkJ4iaW4
c+6wexAA04YU4yiaCgfplYIX/TJ8VlO6l5JBoCB5m9jpV/ZtyhhvH4h/5wp6FKE0
vlOi5gP7Yp+SPGSljYeP+IJdSAvi6jOCTS/D45x3SFYGe3G+gwtoXnd6fEhxTb4q
kv/7S5F2hXrG4trFDQj/pTosH4FyeBHsuqzChUMNGvbOmyqY/9rG4fYbq3qkbgbx
eSUHLYvizNfonNzjBPlv/JWmYKKb3DSE9qroESZbU4HPJStCrA+YnYYlR3yrrB+Z
1prmc7l6Aalv3fm+ufs6bsn/jA4IXy+LX6OHoDZnVAm79lp912xrNYvfuFpFexAD
svO6wRcqroaINOQomcIQ/TtqaIzOA9qPylmWw4oI0AKJkoLJKyWgnhTXpsjgbnxz
NDAgLuBRxW6qgpbxyG/AKCkrSKhBWILHMm1cufyv4iP25HPBH9Yn018LlsO5sM6x
8iejFateH5hj4KULEwD02WyhyaVervDAdPGRJcPgzy4kfIAwHGlUIgyNidWzeTTC
oI0ZZkmyxkHAlaqXaSuP8n56wlfWjZEVpDW4I2/Wi3d39hoAm36snAnMzq9Si1F/
Rq6Yi1SjlGpmn2QgHyoitGvh1MmDwwDy5t/XCdx0p/BmVWEXXhrYxGKvmS7dQanG
0IDPFDwZtrjKZuP0anfrF5tjRkBTnXnNskOZDiacwpRjSw+PT2g=
=zFbV
-----END PGP SIGNATURE-----

--=-4sCBAI7/ZedKqqh62w5v--



--===============8971317218627693518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8971317218627693518==--


