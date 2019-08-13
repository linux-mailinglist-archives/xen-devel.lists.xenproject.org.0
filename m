Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 074758BFD7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 19:45:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxank-0005td-F5; Tue, 13 Aug 2019 17:41:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wWNT=WJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hxanj-0005tY-1R
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 17:41:39 +0000
X-Inumbo-ID: 990b8158-bdf1-11e9-b89a-0776c8247240
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 990b8158-bdf1-11e9-b89a-0776c8247240;
 Tue, 13 Aug 2019 17:41:37 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 13 Aug 2019 17:41:07 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 13 Aug 2019 17:34:28 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 13 Aug 2019 17:34:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtGKKkADSFRJkRuHYzqGIFIh2GxeAgtewaj6Q/3Ds95cJh6yxzGW7M0iNMc9mci36yjS7sPv4s1q1Ypi8kkh6yV7lK1gLmW54O31iSGpXbnX0yg73J4HbfMSUvacPQCuvuWNB2MOQxcx97GMok7Wn3KIv5GQhf2imIMX0YJpWS4aGlYrgWT10aeENJVWBDt5CyU9//HpdS/6bYzCV1ET3dsi/TMEr0mnNiGMp9g5Fa0tD3FwXEYphUUbS5N2oD9RMDLIVE50Ay0rj3q+/t8+41od2QmWtnNYjSvnEO/k/dYkIiJTLvz11oyvOig/2+Wl/ptNFgUKeTAdqmmtJCbkmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2aD901L8P8iwz7DRrZ55LwYsa5z01ofeXkyMDCvlv4=;
 b=mQv+lhLqDsz3oarA/7SW0u5jUlJu8DbYnVh5PB+C6gPy3OrELOtjHPzRIL71TLmESg59KGXbLuB221F8NPaXtWqugTCypeLw0A9fe6u3Hvw867CemyggNaOx3aqJvW7P58+ThxkGwQPWk4YNpzBD4GzFo4SK14j9LrpScHsq7zDYVVvyr48o1JCwe/QnpySiMiLFMaa4jyvKH+Z0tiPpngWo0Nay8M2iwD2+kCwasoqlZQXdGiw7QV8zB5smFGXMIV8GsKso9fqxQFjgO5rVla7vWhcP8EhbugNz/9JLjHRUx3UjNkKWNebSEjmh918YSoAirrRBfV27cPa/e5Mn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2535.namprd18.prod.outlook.com (20.179.93.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Tue, 13 Aug 2019 17:34:27 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e%7]) with mapi id 15.20.2157.015; Tue, 13 Aug 2019
 17:34:27 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien.grall@arm.com"
 <julien.grall@arm.com>
Thread-Topic: [Xen-devel] dom0less + sched=null => broken in staging
Thread-Index: AQHVTU0h+kfyo+Dyy0KGuLer1mUTwabzJpKlgAYWI4CAABfdQYAAC4UA
Date: Tue, 13 Aug 2019 17:34:26 +0000
Message-ID: <6f44856f428c936f9c1913f3f35196dff6044509.camel@suse.com>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <bfcd8473-a73b-932c-3cdf-7ad41c14e4c0@arm.com>
In-Reply-To: <bfcd8473-a73b-932c-3cdf-7ad41c14e4c0@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11d64ccb-f7db-4b7c-11be-08d720147d75
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:BYAPR18MB2535; 
x-ms-traffictypediagnostic: BYAPR18MB2535:
x-microsoft-antispam-prvs: <BYAPR18MB2535DA50DFAEDC353C37229DC5D20@BYAPR18MB2535.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(189003)(199004)(54906003)(446003)(110136005)(99286004)(6116002)(3846002)(2616005)(476003)(81166006)(81156014)(86362001)(11346002)(71190400001)(71200400001)(2501003)(8936002)(8676002)(53546011)(2906002)(6506007)(76176011)(186003)(316002)(102836004)(118296001)(486006)(26005)(256004)(99936001)(7736002)(305945005)(4326008)(53366004)(66066001)(36756003)(6246003)(6512007)(478600001)(91956017)(53936002)(6486002)(66616009)(66556008)(66946007)(966005)(64756008)(66446008)(76116006)(14454004)(53376002)(229853002)(6436002)(5660300002)(25786009)(66476007)(6306002)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2535;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LY00CQr7Qz/M1LIBiJs6K65lu+3itqo1BX5PJM9bdg74D3cSleXomj5lkaChZK0U2M5tCVRNJHoknI6xx5nIFuqSJFHoptb68uZOXn1nkSr3gxZYK/oUlvh/1xZEpzPiWANM1Q6uew13zrqZjYGqiMlgqnMMdNX77+o2lnQ295epE76rLxC6VKrzHDmTgbfoRKbm1otbwrk076XKjyCy3vJ/5HvWYFWhVfEnAaPVKT9rzC+ietfylN0zKgzuCX/iVhaQsw5FDCjFAmCrYhptc0X8OLVKJ3l1BVnHF8WnQe0SgTmQEUpHcsLZuFX9odRE2erYu0lG2vedUSKp42AtGjNgCo2PuUdO4xdwQwrGoJNhf2JqmB1/v4bo/3Vs1eKdE+Oktm74jXlLowOe3DCY62I9ML37QU4F9qVyUAhMeMI=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d64ccb-f7db-4b7c-11be-08d720147d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 17:34:27.0674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AP4rXqdEWVnCu5zp/cjQr81bo2liICJk9X/W5T+466iGlRh3HxR7ea2iPOKmsElAsUpAZjy2JKg2pUHqspKsjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2535
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============7211105221185589507=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7211105221185589507==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-Qp9Z0nWpHKxYQl7luuaa"

--=-Qp9Z0nWpHKxYQl7luuaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-08-13 at 17:52 +0100, Julien Grall wrote:
> Hi Dario,
>=20
Hello!

> On 8/13/19 4:27 PM, Dario Faggioli wrote:
> > On Fri, 2019-08-09 at 11:30 -0700, Stefano Stabellini wrote:
> > >=20
> > In my (x86 and "dom0full") testbox, this seems to come from
> > domain_unpause_by_systemcontroller(dom0) called by
> > xen/arch/x86/setup.c:init_done(), at the very end of __start_xen().
> >=20
> > I don't know if domain construction in an ARM dom0less system works
> > similarly, though. What we want, is someone calling either
> > vcpu_wake()
> > or vcpu_unpause(), after having cleared _VPF_down from pause_flags.
>=20
> Looking at create_domUs() there is a call to=20
> domain_unpause_by_controller for each domUs.
>=20
Yes, I saw that. And I've seen the one done don dom0, at the end of
xen/arch/arm/setup.c:start_xen(), as well.

Also, both construct_dom0() (still from start_xen()) and
construct_domU() (called from create_domUs()) call construct_domain(),
which does clear_bit(_VPF_down), setting the domain to online.

So, unless the flag gets cleared again, or something else happens that
makes the vCPU(s) fail the vcpu_runnable() check in
domain_unpause()->vcpu_wake(), I don't see why the wakeup that let the
null scheduler start scheduling the vCPU doesn't happen... as it
instead does on x86 or !dom0less ARM (because, as far as I've
understood, it's only dom0less that doesn't work, it this correct?)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Qp9Z0nWpHKxYQl7luuaa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1S9KEACgkQFkJ4iaW4
c+4TDBAApwV/6o83LbAJmiDyV3zo0NHSVIVEpasNLAOYdcoMtRzlfDDJjmWnFfOv
G7FA2br3hehmwp6OsoTFCOt6tpixWqhj28EfnZ9TFI14pc+hQZ+VnC9MADnzg/wu
GLZHFcbfOZrp9nDa/xvTJIzwFo2bTYI7NRree8JVsf3Mk/JjOtm/Ut6FUGoctbBm
vWoGV/ZFI7cQ/pFI24HAMTTABsW27mHiNWpQvmBdjsafDHdrYDjRrUouykW80MUz
oewRefy+lvQWURKV8+Wa77EWhowU3TbPVyvo/z//RHiPcRgb6f5muG6npVPLJHqU
Ykh8HWvWE9xaHlgtOxOb4lXGk566BiFjwQAkf9vTSbpWJxuogyuMC9YKgejEghhp
9CQAZv80QN8rWPjTYXhoOdunQDQmV9pT3mU+pqC8EvVJK1T82yo905ctCddY9uU3
rC0DllVHHjxlcixmXsrKxYvCBilh1AMMf8eHEfsWSXiFCNJAD2nqGdO1ZfH1w+i9
WihxwbGXnX3F9SosfCIjxwuHgyoX4VFF/5OYVcqtaTocgq/hlDfRcDPTZh5MFTky
VKCCDueU3NnZ3IwUyCyukE2owKuTXmT9tPR6jiSqJSkZHptE23ABlWgH+ivql6Ne
lcRVE6W3Q0qcd78iG966HgPSE5kcJo0uIF9EgB/0NJ9EzzOGPBk=
=d41o
-----END PGP SIGNATURE-----

--=-Qp9Z0nWpHKxYQl7luuaa--


--===============7211105221185589507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7211105221185589507==--

