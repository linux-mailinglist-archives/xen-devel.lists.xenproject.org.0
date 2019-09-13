Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9463EB24A2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 19:31:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8pLx-0004O1-J0; Fri, 13 Sep 2019 17:27:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEUq=XI=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i8pLw-0004Nw-DX
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 17:27:24 +0000
X-Inumbo-ID: beb96650-d64b-11e9-95b6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id beb96650-d64b-11e9-95b6-12813bfff9fa;
 Fri, 13 Sep 2019 17:27:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB2BCAF47;
 Fri, 13 Sep 2019 17:27:21 +0000 (UTC)
Message-ID: <bdf39183da171d3780318f3c50818906a6a4b487.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 13 Sep 2019 19:27:20 +0200
In-Reply-To: <20190909093339.7134-3-jgross@suse.com>
References: <20190909093339.7134-1-jgross@suse.com>
 <20190909093339.7134-3-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 2/4] xen/sched: remove cpu from pool0
 before removing it
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============8508143160037393214=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8508143160037393214==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VlqetZ7AOxkwXPqDT4Mb"


--=-VlqetZ7AOxkwXPqDT4Mb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-09 at 11:33 +0200, Juergen Gross wrote:
> Today a cpu which is removed from the system is taken directly from
> Pool0 to the offline state. This will conflict with the new idle
> scheduler, so remove it from Pool0 first. Additionally accept
> removing
> a free cpu instead of requiring it to be in Pool0.
>=20
> For the resume failed case we need to call the scheduler code for
> that
> situation after the cpupool handling, so move the scheduler code into
> a function and call it from cpupool_cpu_remove_forced() and remove
> the
> CPU_RESUME_FAILED case from cpu_schedule_callback().
>=20
> Note that we are calling now schedule_cpu_switch() in stop_machine
> context so we need to switch from spinlock_irq to spinlock_irqsave.
>=20
So, I was looking at this patch, and while doing that, also trying it
out.

I've done the following:

# echo 0 > /sys/devices/system/xen_cpu/xen_cpu7/online

And CPU 7 went offline, and was listed among the free CPUs:

(XEN) Online Cpus: 0-6
(XEN) Free Cpus: 7
(XEN) Cpupool 0:
(XEN) Cpus: 0-6
(XEN) Scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Active queues: 1
(XEN) 	default-weight     =3D 256
(XEN) Runqueue 0:
(XEN) 	ncpus              =3D 7
(XEN) 	cpus               =3D 0-6
(XEN) 	max_weight         =3D 256
(XEN) 	pick_bias          =3D 1
(XEN) 	instload           =3D 1
(XEN) 	aveload            =3D 3992 (~1%)
(XEN) 	idlers: 0000006f
(XEN) 	tickled: 00000000
(XEN) 	fully idle cores: 0000004f

Then, I did:

# echo 1 > /sys/devices/system/xen_cpu/xen_cpu7/online

And again it appear to have worked, i.e., the CPU is back online and in
Pool-0:

(XEN) Online Cpus: 0-7
(XEN) Cpupool 0:
(XEN) Cpus: 0-7
(XEN) Scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Active queues: 1
(XEN) 	default-weight     =3D 256
(XEN) Runqueue 0:
(XEN) 	ncpus              =3D 8
(XEN) 	cpus               =3D 0-7
(XEN) 	max_weight         =3D 256
(XEN) 	pick_bias          =3D 1
(XEN) 	instload           =3D 2
(XEN) 	aveload            =3D 271474 (~103%)
(XEN) 	idlers: 000000af
(XEN) 	tickled: 00000000
(XEN) 	fully idle cores: 0000008f

Then I did:

# echo 0 > /sys/devices/system/xen_cpu/xen_cpu7/online

And, after that:

# xl cpupool-cpu-remove Pool-0 7

And the system hanged.

I don't have a working serial console on that testbox, unfortunately,
so I can't poke at debug keys, etc.

Is this anything that you've seen or that you can reproduce?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-VlqetZ7AOxkwXPqDT4Mb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl170XgACgkQFkJ4iaW4
c+5WAhAAn9wP7m/U9UREO4KvEA3/lLNSiSPHfiYNc4qn9tB3OmFHd2bB14IVOPLi
Fq0fWT0kWuVwjdk2Qwq+lcayvdDSsQrxX94gxCLE0RKseDk1julTLk9/VgQH92RT
NM5/r5PkeVF7xYOmAWGNBwGuvNuXRC7dBH7tmE5oM/x/vEE5iXPUy+2PM6fjulCH
ABmcMJJe0W+19/6bmYB7uAjRWRg82urDa6CJX6WpryzPHHu9wrPVmzpgzTIhY6lE
daF+gt7HkC6hzZLMjm18A/VkD+7axc9rLqWixN6IWj1aFi+4LOnpCkkUyKrmJxiS
p5qsH9mBbknwNTS7rxWx86H52xs9enK57/Fpf7mHDa9qyfWofVk+zSPXVEt2LdQz
x5MLoijHuDZeZpMm7sV+RU3PUH+0mJzG8Evv9Gs6VCrAiAIt9SDeyT9gcFLAvnMT
iD0Dkxbs1E5uiJWEM6JkeyCz4gVqJoqvVFYeO9jua6EQIhEbEpHsgy1OdJXq/M9v
pO/hco6ZbanJZUvkI8IHD8f69OJiypyBqTwgeQLmNVZ8w/WjSGofjqJlrZNrXB0e
IDV4e+zv3xx2GDyqbIcm6z0hYjbPO8pTtqw2TMAAzBD6TG9mwobV0ggLAQGMdWtP
Zt8K3NjAGwWGP3zGPo9hN3MpN1WFVBD8k+ebgIyRhT1wqn4DOkM=
=UBLi
-----END PGP SIGNATURE-----

--=-VlqetZ7AOxkwXPqDT4Mb--



--===============8508143160037393214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8508143160037393214==--


