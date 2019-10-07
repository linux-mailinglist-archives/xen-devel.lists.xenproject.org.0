Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA36CDE0B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 11:12:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHP0B-000710-De; Mon, 07 Oct 2019 09:08:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ttm0=YA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iHP0A-00070v-Es
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 09:08:22 +0000
X-Inumbo-ID: f957562a-e8e1-11e9-97a8-12813bfff9fa
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f957562a-e8e1-11e9-97a8-12813bfff9fa;
 Mon, 07 Oct 2019 09:08:20 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  7 Oct 2019 09:07:32 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 7 Oct 2019 09:05:59 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 7 Oct 2019 09:05:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xw7mRXHjrYVxmjDk2qAstn7FI5ilV30GDFTGEEGvWkKZpEuKZ571/L9uLZBUVi4JEajSICwUjX/h08JVPKoRu9iIOGGB4hgMxr3Au0BCNM4PEyhGnni/FfZXnmgtVaVWmIAU1QWXE9V6vDE6vTuUgIyDgZajELqvVhgugyhJ0EnXL9Qb04YG7YSGF3OdLACE8Y/PiXaXdVkilquly7m7XNb97LEhnOVSC2v6YArUR50ty+Q7+fGO12ujFcA2sVaj1A/RlT+hKovyipyJ4R7uomRYRssvuUxXbeF2H2GOne3jH32X1DPodBUIYtz9sBQrNTtPpurjIv4HFY1wf5V2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/VcrNH+velvr80HQ04/O9rEP13rc33jvgrQjA+Hc+4=;
 b=HRHbpvXTfwFCZRm9YlSeZfyvwe3OV3fHerZo04GXAJ2iRkEYEd5YuN3f8bu+8l5/1IadnZf+gKUuBIelCDTVigq9NkP/dncw99l0Ep9QajxVP8zJvsgaV1bV/sGSDD70y2bqKtzeO+LnmZWpcNxmBshUCypFdETWrGaz/xOH4vujIcLTt1YS8fGfNa8uLawXiEVtdF08S1xtqn1yDGKGocJ8MmqhR6ALYM/t5f8C3bp4T8wpj1ziEpkXMylE2FpLveJY6FD12a1meZuB3lcKZccMSHIrUHAajXc5s8/woa6k/UWFvSDuTYKe1V26tWQoH/cwaXo9JLOyIykVWiBpUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2440.namprd18.prod.outlook.com (20.179.91.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.25; Mon, 7 Oct 2019 09:05:57 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d%3]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 09:05:57 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] xen/sched: let credit scheduler control
 its timer all alone
Thread-Index: AQHVfNl2rPnfaEPQYEmSaQZb1rzRFqdO4yeA
Date: Mon, 7 Oct 2019 09:05:57 +0000
Message-ID: <c93415148774c679f415488befffaf31a1affeba.camel@suse.com>
References: <20191007063519.2912-1-jgross@suse.com>
In-Reply-To: <20191007063519.2912-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85e12cc0-149d-4ae7-77a9-08d74b059123
x-ms-traffictypediagnostic: BYAPR18MB2440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR18MB2440E88A6E9CBCBA1D4907E6C59B0@BYAPR18MB2440.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(189003)(199004)(316002)(229853002)(86362001)(4326008)(2501003)(99936001)(6436002)(6512007)(7416002)(6306002)(6486002)(7736002)(110136005)(54906003)(6246003)(305945005)(256004)(14444005)(66446008)(64756008)(66946007)(66616009)(66476007)(66556008)(91956017)(966005)(76116006)(478600001)(71200400001)(66066001)(25786009)(71190400001)(118296001)(102836004)(36756003)(14454004)(6506007)(186003)(26005)(2906002)(99286004)(6116002)(76176011)(3846002)(446003)(11346002)(8676002)(5660300002)(476003)(81166006)(81156014)(2616005)(486006)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2440;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oCgVj57ZaDCKtIHJpAthZJhFY5HfsHKeOEi+1xusYls6x2Mkv9LW48blf4nl3DDQHt7SvTv8qVjlRHA0arMRQrghcSMRGMaZdLr2fMdAGuFaZbFU4XHLPGrsk1uhamYVYZPlihPyQazCB+Jz70N/MT768JaOlbbR0++yXjxkrnmoJqe35SPaj5Zq2I0wNMfpn0NZwBQmgUG0siYDj0To0ZCAL7T1o7coNqe1Zex4tKTCaDx/T5mWwvVTjjXoZNJW1iWWbrkHGijkEru0vI5ts454GHc6/KhX4QdxmjPSj0SYC8pzmYyqsgcoH5aFVDOZjwaUWPkUsYUPq7/5VEkXGrt61cVoCR/vjLPf+kYXRvvsybU6eZuiPH121kthNnstUS+U8Aojl4AMgcz0I/7I8nWRzNwn36+I+FGbRB+nY2k=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e12cc0-149d-4ae7-77a9-08d74b059123
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 09:05:57.6815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gcnwl2enrZuRG3DStlNwrarVUsPuNSxZKNn80sDh82cRYKkCGFW3jv66fLxISqmBDAm1tp5zqkxaP75anKcGSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2440
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: let credit scheduler control
 its timer all alone
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============7819324181648451615=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7819324181648451615==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-CVpFPXd2OgYLxvkcNzUU"

--=-CVpFPXd2OgYLxvkcNzUU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-10-07 at 08:35 +0200, Juergen Gross wrote:
> The credit scheduler is the only scheduler with tick_suspend and
> tick_resume callbacks. Today those callbacks are invoked without
> being
> guarded by the scheduler lock which is critical when at the same the
> cpu those callbacks are active is being moved to or from a cpupool.
>=20
> Crashes like the following are possible due to that race:
>=20
> (XEN) ----[ Xen-4.13.0-8.0.12-d  x86_64  debug=3Dy   Not tainted ]----
> (XEN) CPU:    79
> (XEN) RIP:    e008:[<ffff82d0802467dc>] set_timer+0x39/0x1f7
> (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
> <snip>
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0802467dc>] set_timer+0x39/0x1f7
> (XEN)    [<ffff82d08022c1f4>]
> sched_credit.c#csched_tick_resume+0x54/0x59
> (XEN)    [<ffff82d080241dfe>] sched_tick_resume+0x67/0x86
> (XEN)    [<ffff82d0802eda52>] mwait-idle.c#mwait_idle+0x32b/0x357
> (XEN)    [<ffff82d08027939e>] domain.c#idle_loop+0xa6/0xc2
> (XEN)
> (XEN) Pagetable walk from 0000000000000048:
> (XEN)  L4[0x000] =3D 00000082cfb9c063 ffffffffffffffff
> (XEN)  L3[0x000] =3D 00000082cfb9b063 ffffffffffffffff
> (XEN)  L2[0x000] =3D 00000082cfb9a063 ffffffffffffffff
> (XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 79:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=3D0000]
> (XEN) Faulting linear address: 0000000000000048
> (XEN) ****************************************
>=20
> The callbacks are used when the cpu is going to or coming from idle
> in
> order to allow higher C-states.
>=20
> The credit scheduler knows when it is going to schedule an idle
> scheduling unit or another one after idle, so it can easily stop or
> resume the timer itself removing the need to do so via the callback.
> As this timer handling is done in the main scheduling function the
> scheduler lock is still held, so the race with cpupool operations can
> no longer occur. Note that calling the callbacks from
> schedule_cpu_rm()
> and schedule_cpu_add() is no longer needed, as the transitions to and
> from idle in the cpupool with credit active will automatically occur
> and do the right thing.
>=20
> With the last user of the callbacks gone those can be removed.
>=20
Which is great! :-0

> Suggested-by: George Dunlap <george.dunlap@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Well, unless I'm missing something, I guess that, at this point:

> --- a/xen/common/schedule.c
> +++ b/xen/common/schedule.c
> @@ -3082,32 +3078,14 @@ void schedule_dump(struct cpupool *c)
> =20
>  void sched_tick_suspend(void)
>  {
> -    struct scheduler *sched;
> -    unsigned int cpu =3D smp_processor_id();
> -
> -    rcu_read_lock(&sched_res_rculock);
> -
> -    sched =3D get_sched_res(cpu)->scheduler;
> -    sched_do_tick_suspend(sched, cpu);
> -    rcu_idle_enter(cpu);
> +    rcu_idle_enter(smp_processor_id());
>      rcu_idle_timer_start();
> -
> -    rcu_read_unlock(&sched_res_rculock);
>  }
>=20
sched_tick_suspend() could go away and rcu_idle_enter() be called
directly (with rcu_idle_timer_start() becoming static, and called
directly by rcu_idle_timer_enter() itself)

And the same for sched_tick_resume(), rcu_idle_timer_stop() and
rcu_idle_exit().

I'll give my:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

To this patch, though, as I appreciate we want it in to be able to
continue testing core-scheduling during 4.13 rc-phase.

It'd be cool if the adjustments described above (if agreed upon), could
come as a follow-up.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-CVpFPXd2OgYLxvkcNzUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2a//MACgkQFkJ4iaW4
c+5oIg/+IHJHNr7fWbkC3GVRO5nIfxbwbRLgeOuQd361U9zngc8/v3Q2QHC7SFBm
Ad5EooveFgK5kUusW+jf4AoGUvX2rPP0BCXd7kycp8NTm7h7BVi0rqwRpoOnk4pq
8Fb5dYkTIrEjrhmS8OvLnSrjRKC5y/Fh/h/XxDtnTAzLBR1PjhfOfYNdFzZLf952
E6vnYie8PIS3TPMTcrzNGwrBs8g4zJFEE89TsppoWhpZgxmKCpr5WBFneYyceeC+
kkFtD2lLH8CTSuRKwFqoN9CkzdczEHMSkctfqdREPDTUWsdqRnTte+Y595TN02EG
gNrImInp5xMflVOLCEwC3zmfoW9wKJoBdUQspLXGvRBtzbW87j+HVrNcvMbBf7dk
7BiXAnNEH8Ew12X+iykcMh7pBONyiVtyXgNo5N3/k7ESzcN2FrSzce0ehoM1vKSv
KUMfHPpQG4m2fjWY/RdlgdPHjFXqZfXrWB+e15znO0t2iQG6tGGuP6zFPgblYdLp
IY2Y1Ubd3GD1xNSLizq1eJjyB2OZZq4qbZjc5NpGqlMy0ZGHgNkIsROzjypGuARl
QvVvHWbLKQqRn2UIwb+Y4AuetcNd4v+OiwDRBHPdyEfLw+ZG0jCVqhz19tVLbz1E
CrlgKRPIPwJ6Tm3VZU7MZgFjlVSo6/fqXWyvOLZOpBZwAqER1hE=
=2dEH
-----END PGP SIGNATURE-----

--=-CVpFPXd2OgYLxvkcNzUU--


--===============7819324181648451615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7819324181648451615==--

