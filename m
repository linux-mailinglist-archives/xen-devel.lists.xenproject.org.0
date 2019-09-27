Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240CAC07C4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 16:41:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDrOK-0006g4-ES; Fri, 27 Sep 2019 14:38:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDrOJ-0006fz-EG
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:38:39 +0000
X-Inumbo-ID: 7df22852-e134-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 7df22852-e134-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 14:38:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6266AB165;
 Fri, 27 Sep 2019 14:38:37 +0000 (UTC)
Message-ID: <2593186ce659b1242c05bff5eeb1fd29479d085b.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 16:38:35 +0200
In-Reply-To: <20190927070050.12405-29-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-29-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 28/46] xen/sched: add code to sync
 scheduling of all vcpus of a sched unit
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============2158856417480321538=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2158856417480321538==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Dnyrptyrvfnix/jv6oR9"


--=-Dnyrptyrvfnix/jv6oR9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> When switching sched units synchronize all vcpus of the new unit to
> be
> scheduled at the same time.
>=20
> A variable sched_granularity is added which holds the number of vcpus
> per schedule unit.
>=20
> As tasklets require to schedule the idle unit it is required to set
> the
> tasklet_work_scheduled parameter of do_schedule() to true if any cpu
> covered by the current schedule() call has any pending tasklet work.
>=20
> For joining other vcpus of the schedule unit we need to add a new
> softirq SCHED_SLAVE_SOFTIRQ in order to have a way to initiate a
> context switch without calling the generic schedule() function
> selecting the vcpu to switch to, as we already know which vcpu we
> want to run. This has the other advantage not to loose any other
> concurrent SCHEDULE_SOFTIRQ events.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Dnyrptyrvfnix/jv6oR9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2OHusACgkQFkJ4iaW4
c+7lZRAAzKcPHF26dXUj4OIuWh/qTpdZBaDEO7qh6QhEq+aShSXd07SeCtaDEiL4
b3ltSgcg37GlH87sh5l3l1uFAITcyjmc8KE7WNKJgFLhVW9IZpLeimTcgJgVGaYb
Y2Av9s6gaHle/ynzh2dHmy1MMSqVMZI2ZzkT3mCVC2vHVGybvjI+pkTaUyeDg8BH
7YRTdoiX3CpNmtTknfRJLtHO4HL0twh9i+vq3Tjcmm9wov1T7z43d1XtB5F/ozbr
IZzEc7rdM+Xqxy4Z/1dKgdrOdX2GHkKDsF19hLzYpBmEfO2rL2GN36aOUNhmu1+r
KvVnKuzYgHOd4SfslbmjhlhjAdaJlbJGnG895qwZ9dSNzs2zhpC0elK5Rc+MPtWu
m2IE7OAvnKKRLpA8FlvlDbtGQsFZcOhBvXVgqtqrAYSBm4G2mswBlzGn01xOLXwx
74wPK3TjJE7TcURWOusTHU3OghuFIEnyk7Buoz6PSZPnMmuA61GMICfGtX9qFrAp
QbFfyfLB+C9KsIncpBYQ9TM6QJRB7muwJ+JK4mc14qxPf4JpdSxxPmrWtVju6HVV
PyTJp5iKMlNhW6uRylXxrBGa+y9yc4lyGrz9nxpXN+PYo8wMa9u8atfjeAks+0gN
GUApf/2MTJdILZH02Hhu1XigtIFoF1ZNRtrVp1kcIdKOXbqrjn4=
=oQq1
-----END PGP SIGNATURE-----

--=-Dnyrptyrvfnix/jv6oR9--



--===============2158856417480321538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2158856417480321538==--


