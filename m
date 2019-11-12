Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F5BF9917
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 19:50:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUbAk-0002G5-LK; Tue, 12 Nov 2019 18:45:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xf4I=ZE=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iUbAj-0002G0-64
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 18:45:49 +0000
X-Inumbo-ID: a20c3e50-057c-11ea-9631-bc764e2007e4
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a20c3e50-057c-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 18:45:45 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 12 Nov 2019 18:44:47 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 12 Nov 2019 18:45:06 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 12 Nov 2019 18:45:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQAikhnTnJJlfwCqQWXg8EWCNfd3hnZeHAI5SKtz22McmszeCsCaTCng9hO+xjaQnN/Ac+Ipo0Kut+7qEWyJGx+m2YxkbfhUpRz3oZEDpCoqcZ6IiUWI/bQh9puiGb24lLwn/DgtW+LVQiBPJc/AqSRRTJ5oVWjiubPTiJeKNqmt2BvYHE5XEHveogdcAGr6/Lj8H48xjUtNwv9HA1/pFlCUT7Uv5SUYJZZfKsvkxUQXrSFw2UJbJWfYV9EYwS8GVa1ZQ9JFr+YPoCb1Kyob6XZ2fc8ZJEOZoI32q/DMi8awT9jS8njuTqzCKlkdliBfyg/xoH8g4CWdaonjF2xOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9dPRfEFqMG5ezRax52fPy+0JDPyj9yLKluq+oc6cBk=;
 b=g08Nxamt7yrHAtQMy08XIhjf3CSYsokKQcBvZP8AlvDlhCsfCVFb9PA5NkIx+WRerDlk3xaCvvfSP1JJwJbuc84EwTUXo9lnZRWN8Nz39eUBLB8AbySlC/WqU5jagkG7cuciimyS9DwpeI9V8Ha5gFD1EGFIGNplf1jZMCKiIpTVYd7IPUQYwV08dvpMJRZ/rovZovIgcfYaj+Ljn4xRfPFu3veDJY/i4Kvmd9/injbol7FYElO7JJKKs5Sc4aT5nKBTNhaGtZ2g/7m48ZuJPSmX9uVAc5/Lw4UziFvcPzDVkABU/CVC1gjRyW35UwRiuaSoxmvFsqBUamZBDL3tlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3143.namprd18.prod.outlook.com (52.132.247.205) by
 CH2PR18MB3254.namprd18.prod.outlook.com (52.132.244.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Tue, 12 Nov 2019 18:45:04 +0000
Received: from CH2PR18MB3143.namprd18.prod.outlook.com
 ([fe80::e4d7:bcc5:f13c:7ee]) by CH2PR18MB3143.namprd18.prod.outlook.com
 ([fe80::e4d7:bcc5:f13c:7ee%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 18:45:04 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] xen/sched: remove wrong assertions in
 csched2_free_pdata()
Thread-Index: AQHVlgeY8Z6/EjFwCU6F3Z36wZlID6eH5oWA
Date: Tue, 12 Nov 2019 18:45:04 +0000
Message-ID: <0a1d2ac39634ce062a1fa0438d72804f2a300691.camel@suse.com>
References: <20191108073837.5797-1-jgross@suse.com>
In-Reply-To: <20191108073837.5797-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bc69a7e-54af-4a4e-4e8b-08d767a06ea4
x-ms-traffictypediagnostic: CH2PR18MB3254:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3254A75945212321CA0B4261C5770@CH2PR18MB3254.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(199004)(189003)(6512007)(8676002)(6306002)(256004)(14444005)(446003)(81156014)(81166006)(2906002)(11346002)(26005)(2501003)(186003)(8936002)(4326008)(2616005)(476003)(6246003)(486006)(6116002)(36756003)(6506007)(3846002)(6436002)(76176011)(66066001)(305945005)(91956017)(76116006)(118296001)(478600001)(14454004)(110136005)(102836004)(66556008)(66476007)(66616009)(66446008)(99286004)(64756008)(86362001)(6486002)(71190400001)(71200400001)(316002)(7736002)(229853002)(5660300002)(66946007)(966005)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3254;
 H:CH2PR18MB3143.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sffivykwBU2Y96G+gPvCykIorKu0JG9wo/8tsa4sx2m70ZRzED+N6j1/SrAPx3vMuTL69r1HzjrPrrrIo/IIf/Js3AY5YkCdVL0Y4mIKNvwn3nnHBOpgP5aUJqF/vFZPSfJyBhtuNStxh8y23MTtcLwn8TPdZDLgoT8eDzNCerSGQyQESNyFW+oq50wMXQIw3FH37LRHNlH2OAbF1xoQPllwoa1vGR4b/tQOqK6fJceFdepIY6aCbRRTbirrDZ6MzlSWj6w7PQLXSjW08By1FmbD3sqAlqxeAQCGpattSLSxPCPQaVzk09jRpBdGDc8EHZjhjjTfhedhsJ4NQTGVcB1xV6dWVSChTQMUARx9Sftibjw4vsjnR8IaBRz9GcmuU3hg5XJGz4dXEBidCTc3mtU8mVL/WERUvkhOz64qDFaDHvmJCYFV1HXiJHOpIl4J
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc69a7e-54af-4a4e-4e8b-08d767a06ea4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 18:45:04.2995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3cu+XGK4/3QgQ/c9pRQ7+ZMwJ60WLh/l+eo+LckB87nYfZ+gwwTV2xTiuTNkVQBoDyilNUrZtE/zioIVYznzLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3254
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xen/sched: remove wrong assertions in
 csched2_free_pdata()
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
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============2289967128767479612=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2289967128767479612==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-5llbp/tRuj485LtyFJCs"

--=-5llbp/tRuj485LtyFJCs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-11-08 at 08:38 +0100, Juergen Gross wrote:
> The assertions in csched2_free_pdata() are wrong as in case it is
> called by schedule_cpu_add() after a failure of sched_alloc_udata()
> the init pdata function won't have been called.
>=20
Sorry, maybe too much time has passed since when I wrote this code, and
I'm rusty, but the comment says:

 "we want to be sure that either init_pdata has never been called, or=20
  deinit_pdata has been called already"

So, the case of init_pdata not having been called is considered.

And yet, you are saying it is wrong because:

 "in case it is called [..] after a failure of sched_alloc_udata() the=20
  init pdata function won't have been called"

But, as just said, init_pdata not having been called was one of the
possibilities... wasn't it?

Or am I misunderstanding the meaning of the sentence above?

Don't get me wrong, I never particularly loved these ASSERT()s and I'd
be more than fine seeing them go... :-)

Have you seen them triggering inappropriately, either before or after
the core-scheduling series (and either with core-scheduling on or off)?

Regards

(leaving the patch in context on purpose, in case it's useful)

> ---
>  xen/common/sched_credit2.c | 16 ----------------
>  1 file changed, 16 deletions(-)
>=20
> diff --git a/xen/common/sched_credit2.c b/xen/common/sched_credit2.c
> index af58ee161d..a995ff838f 100644
> --- a/xen/common/sched_credit2.c
> +++ b/xen/common/sched_credit2.c
> @@ -3914,10 +3914,6 @@ csched2_deinit_pdata(const struct scheduler
> *ops, void *pcpu, int cpu)
> =20
>      write_lock_irqsave(&prv->lock, flags);
> =20
> -    /*
> -     * alloc_pdata is not implemented, so pcpu must be NULL. On the
> other
> -     * hand, init_pdata must have been called for this pCPU.
> -     */
>      /*
>       * Scheduler specific data for this pCPU must still be there and
> and be
>       * valid. In fact, if we are here:
> @@ -3969,18 +3965,6 @@ csched2_deinit_pdata(const struct scheduler
> *ops, void *pcpu, int cpu)
>  static void
>  csched2_free_pdata(const struct scheduler *ops, void *pcpu, int cpu)
>  {
> -    struct csched2_pcpu *spc =3D pcpu;
> -
> -    /*
> -     * pcpu either points to a valid struct csched2_pcpu, or is NULL
> (if
> -     * CPU bringup failed, and we're beeing called from
> CPU_UP_CANCELLED).
> -     * xfree() does not really mind, but we want to be sure that
> either
> -     * init_pdata has never been called, or deinit_pdata has been
> called
> -     * already.
> -     */
> -    ASSERT(!pcpu || spc->runq_id =3D=3D -1);
> -    ASSERT(!cpumask_test_cpu(cpu, &csched2_priv(ops)->initialized));
> -
>      xfree(pcpu);
>  }
> =20
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-5llbp/tRuj485LtyFJCs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl3K/a4ACgkQFkJ4iaW4
c+4S4BAAhLI1eZ6HNKZ0AdOnytUEtiixbGTJwoZHNS2xA/z6oNLf3wPsppFY2TLG
9mHQgPy3Zw6cfJfP3d30nX9r1d1jSJ5ZljbLb6PbXNsRBmIa7Ib/FBOyt5tiO1m/
/0/vJtlqhjNrczSx6r1zY5yp7SqCT8xPCOLoJ8F2rQ7JTB4tC4cR1ajWrO3jtO71
Y58HXE8bGOyesYHN+gYPBNfG4KBTr8IV5abN7SgdZmeXHy1ePE2FOjMqurckRGFW
45Anb+40BI1jrKoh3zTAs7rnd5c0tNyRwTxZIJveveEDp6S8g9nkrPxLHXN5riJd
lyGIxpdt4pU87ZAfOMYfGSCRtvji4u7Cgl563vXJgGOdTE/IeY4PUygOd24PBgxy
E6v5pBNQ9HfggrYfZyz/B5iOTmuJe8220gFBtrsw8IHd1EHokf3dyjVdBID8U42Q
Qwm0HOt+5A4R9Bmz/+eGYAeYHJlwtU711L3rcTzK8bRLnmaJcGRYsh+FATI7240p
fgJy6cBZ9wdkPPCdblJsE88dCE/a90NYTdstsfh0PEJnCr7CK/0vP6i0F5kWPLA/
rGUi7eAyukHMCBaVGDYqgFLaUDxrlPVSahj6V6Jfmh4zeNdJ7lpwmtzMcaO23odQ
51D4XIucc9Bi2Tje4i8x9QOjQbkevhm9MamMqP3Gd5DyRbgOfCU=
=Gdsw
-----END PGP SIGNATURE-----

--=-5llbp/tRuj485LtyFJCs--


--===============2289967128767479612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2289967128767479612==--

