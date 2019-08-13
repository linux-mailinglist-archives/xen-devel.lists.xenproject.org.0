Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9688BF86
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 19:20:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxaQJ-00033K-Cw; Tue, 13 Aug 2019 17:17:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wWNT=WJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hxaQI-00033F-Mo
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 17:17:26 +0000
X-Inumbo-ID: 35ab50b4-bdee-11e9-bd8d-83d8e76e96ce
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35ab50b4-bdee-11e9-bd8d-83d8e76e96ce;
 Tue, 13 Aug 2019 17:17:23 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 13 Aug 2019 17:17:08 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 13 Aug 2019 17:07:04 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 13 Aug 2019 17:07:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PF2Bp5S7eBxswcZ1Fz7vfSLdDo9CIi1Yh9Rw8ak9dMTnbOv+Sz+2SKJ3xSWiRiCvhNRXc2V3bhhUwv9+JlSIwcPDFEJY64GWqL5Rw3kpFmc0CRcOX7OuudWpRw8kUYAQPa70i1x+QIq1xTg2StVkfIiJ3LH7UsNCldGOiXiBVZQy6+QyvPFd7XcGOwxQGtqpUI5JV7S9Ut5G4A6gYoV1tremqNUsdiPC1owchkeVQP7+rySLmxfJzT0dYaCTLQDgKYl1hzMKUjTbAyzK6dU4kS5DvCIm8XnX2kfVFb0ayr2Qz2YvrrYDV9dXqEYt1id2SRN2xR3p5NGxoPBoW+9GIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT9x9ssFu3j9y0cCQXjgxnA/OWe+6jbkRxdSrFqrU2A=;
 b=S0OHU7pHGVxZqFM4+gdY3MaNrus6uwpwSSRKiN7YtCqOx8V2qFtasC0Tlf/2CMV/FTbZPryfyjPgYNgm8CaaL9TMi4xT9P8DiK9i6Qac3Ds2v6yrGziZTIcFOTJB2COGGGRgaLPacdDOs3uOVfe6FUJeSvHo552fjtdb+TTGA+s85nACQMBSaD51lA8WCkuYyBgRatycT4iG/vT0pxVTCf5w1+lLotvrSPqwnRA9zJKNIkKvCGbujuFDE16FNf2CDKQ7O5Ks+fNTHOYRtBVV3oqYFqBKsaeMA4h+jwdNZAczcB0pSz5i/N8RHpB5QeolIWhhTK6RDFciTdoC7xRVcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2423.namprd18.prod.outlook.com (20.179.91.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Tue, 13 Aug 2019 17:07:03 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e%7]) with mapi id 15.20.2157.015; Tue, 13 Aug 2019
 17:07:03 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 3/3] xen/sched: add minimalistic idle
 scheduler for free cpus
Thread-Index: AQHVSTNNPQrZHYVslUWAFrIN9jYoOKb5YKMA
Date: Tue, 13 Aug 2019 17:07:03 +0000
Message-ID: <cd687a6127981f56d0436d4b9780af6dce70db4d.camel@suse.com>
References: <20190802130730.15942-1-jgross@suse.com>
 <20190802130730.15942-4-jgross@suse.com>
In-Reply-To: <20190802130730.15942-4-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c77f1fe0-8d29-4c3a-bcec-08d72010a9a6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:BYAPR18MB2423; 
x-ms-traffictypediagnostic: BYAPR18MB2423:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR18MB2423D22B0578FE63F85F4354C5D20@BYAPR18MB2423.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(54534003)(199004)(189003)(478600001)(4744005)(99286004)(14444005)(256004)(4326008)(81156014)(118296001)(81166006)(5660300002)(14454004)(25786009)(8936002)(966005)(305945005)(7736002)(66066001)(6116002)(2906002)(6512007)(6486002)(186003)(26005)(6246003)(53936002)(6506007)(6436002)(8676002)(2616005)(11346002)(446003)(476003)(102836004)(316002)(486006)(76116006)(110136005)(91956017)(36756003)(2501003)(66616009)(86362001)(66476007)(66946007)(53366004)(76176011)(99936001)(229853002)(64756008)(66446008)(66556008)(6306002)(3846002)(53376002)(71200400001)(71190400001)(4533004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2423;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xN1e872Gg+WbNza2hVO8GuEzs2qA4RAjYWkKl8vS+Z5T5uoROdrX4YEGvHhS/UeZXYc0cpzW2RCf0a50SKX+SppwOEsVOuEiuCF+8JeN9j7Ds5t4Qj26vtE+PYN7uNFwa8T7U2xP/BmyHbpW3A0I4JreRCJxXrq32x1Q2tBfqeCr2sh3Dq6UL82jKFCRVaSgADfTKcWP3Y19IIRAkGN5v1wvK8ChsyfOOdKLm6BmXEw5Iy4xtFHpscP6V+NpXubr3pa9o9jqKnDOoVwwOL/nMc3UPwoiEPm7BIo2410kSf4RdI9Ro0YRej5mW/q8sPe9+z4KJ3eT48HNqoZWG4aoggnfbllggpmEJjqZubgYpSNv68buH2bWYTNPh1Qtf/NrRkJgCGLa8ovTyiwGco3omi2vjpQl48xyRMlZyujiC8Q=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c77f1fe0-8d29-4c3a-bcec-08d72010a9a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 17:07:03.1788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Skrc32Y1Jvn59EOuoIKIACzxNejX3bECZdUn6qCauND/k8XjBsLFCv675BnZSr/LDeWhMUD8ih+VcWOJrYo+1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2423
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 3/3] xen/sched: add minimalistic idle
 scheduler for free cpus
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
Content-Type: multipart/mixed; boundary="===============7654847734803920553=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7654847734803920553==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-/UMPhLO8Ss3VL95Y5oda"

--=-/UMPhLO8Ss3VL95Y5oda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-02 at 15:07 +0200, Juergen Gross wrote:
> Instead of having a full blown scheduler running for the free cpus
> add a very minimalistic scheduler for that purpose only ever
> scheduling
> the related idle vcpu. This has the big advantage of not needing any
> per-cpu, per-domain or per-scheduling unit data for free cpus and in
> turn simplifying moving cpus to and from cpupools a lot.
>=20
> This new scheduler will just use a common lock for all free cpus.
>=20
> As this new scheduler is not user selectable don't register it as an
> official scheduler, but just include it in schedule.c.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
This patch looks fine to me.

With the changelog adapted as I mentioned in my reply to patch 0, this
is:

Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-/UMPhLO8Ss3VL95Y5oda
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1S7jQACgkQFkJ4iaW4
c+7yEA/+PqBShe4uYc+yv4pBqL/KtMyk2b8cUa7MTvTjnQKcFmkeZQPB5QxstIF7
JFVH16Fvete9St1zcj+xDp6mSTtQPOBpG0azjnq+54EYtGuCDgnfSnB/ZyKrFCEZ
wbmtJR/1nBR0qNaPIJDgEgBY/0dxkaglrVJp5FmWixe9ApKooR/5eabDGBVXtoAg
Xp/6QKK5XE9G1j700uZ/x1KTGkKdrCXjxSAvVOuRgd2rB3xWeM/zfXtrKSdwVOia
QKVEYJAYT6alI0B82z769vLekhKwKV2CwxKRqAeNOdd9A7VDLWgxr6iYhd12IXzW
DmERTq2s2rC0cQB1MXCaEUd3OevQAYqD3+Aw3WuaEIxO+FrRTSbFKVmbcSxPIa+U
2MEJpHTaNGa16hT7DYmGMDb2ehXvcoOYc9N7C3Ih7f2ApEOOacX1+CdZ0sSv+H+v
aqkKQv1Vmbe7F3lBbhWnWJQN911kWmTOX6No3L+nVKClO000dVYLLq3uqoPy7Ak4
IryWbx8Hkeb0EiE1GHgU+C5KHyWQ7v1J3rCuQWOV3oLSIaE68ZYVy17Uw1oSGo8B
5St2XNw5RXoB4RwhZjHg5YVmOLDhYSGtJH+jZGTfXHh3FNq4Ig0NjQM6Vc7Ymc93
jKn/+OLjrQlFjYmZWP1Ctw3OF1DDyfakTZedpcZGrwOsX2lWGFM=
=KyjK
-----END PGP SIGNATURE-----

--=-/UMPhLO8Ss3VL95Y5oda--


--===============7654847734803920553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7654847734803920553==--

