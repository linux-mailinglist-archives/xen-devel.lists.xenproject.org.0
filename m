Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3FA84FB2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:21:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvNhv-000581-0j; Wed, 07 Aug 2019 15:18:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vVu/=WD=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hvNht-00057r-OQ
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:18:29 +0000
X-Inumbo-ID: 9abbae0f-b926-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9abbae0f-b926-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:18:28 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  7 Aug 2019 15:18:12 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 7 Aug 2019 15:12:52 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 7 Aug 2019 15:12:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JC1JKyvQcm8La15r9d7DvLoO4O1Olr7T9hnqRbRuwDw1GsS9pDmNmVtmH17RwKYm+4a6eCKbCXbgIQj8saUy+uhophsbJJpUG41x6VL+l97b/Iqh42KbiD6RHMKgu+PywEj9NRMeUZkzOsijMh2LVmoicZQAU8xGkunWevMx7rxcitKAuNMVJpW9AG0jnWR8/krZVGoMlx4qEySnbXZmE7+gq5zfY0mNhgCFobI6M87GA9C/o9hRtfZ8mKjDGV6ctKaq0pat+G0j0niitMTEyVN70hqvOMLP1gqRQgcbfvc2SySc+ZmXPAjvs2oBqWh7j4SbDHXv7yXa6fpE9CBeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m68OxLpv5hp+ybRbDh6oxGP6PmUW+/tuxmQBiZCnPiE=;
 b=SYCwlXhTWYk7OeH1l8YB8c7mMrDOY+FnOpO54WA9rzyVv28yNzntS1+iHkA/sTZwMXklub69nOPDI8cCTTUTq6hvcbKiOpks19pQanYp9FQA1tkVW06We0+BaJlq7fR/tQ0QiJhbWF/uHEMIYzo+r/N1o51UOTyTRhfAwFO8EDGPs5L0rBhi4jA0ApdErimodFPIqwKcTUsIgYtdUZAdMPySbylkuBRQQYbdjHflVF4UPUqy0tIfiHtG13DuPtmBd3yKxgfxhVOSvmNbBXsBsRz6PJXhFp+ybmlFR3cUzXFF3cKns0lHH6O48mfzkukKj59sL3FPj9Z3zffiwf8eIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB3048.namprd18.prod.outlook.com (20.179.60.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 15:12:51 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e%7]) with mapi id 15.20.2157.015; Wed, 7 Aug 2019
 15:12:51 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] xen/sched: fix memory leak in credit2
Thread-Index: AQHVTQ/+b3fS/IO4cUOhmg4Djvcn3abvywaA
Date: Wed, 7 Aug 2019 15:12:51 +0000
Message-ID: <80cac7b3225dfaf90cf066eb32943b415c94fce6.camel@suse.com>
References: <20190807110449.2947-1-jgross@suse.com>
In-Reply-To: <20190807110449.2947-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d40d0b1a-8ae3-4d54-ea1b-08d71b49b757
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:BYAPR18MB3048; 
x-ms-traffictypediagnostic: BYAPR18MB3048:
x-microsoft-antispam-prvs: <BYAPR18MB30489D38F9E7B4C702F1C11BC5D40@BYAPR18MB3048.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(189003)(199004)(66616009)(486006)(99936001)(66066001)(6246003)(6486002)(25786009)(11346002)(229853002)(478600001)(2906002)(6306002)(53936002)(6436002)(446003)(6512007)(4326008)(68736007)(966005)(66946007)(2616005)(64756008)(14454004)(66476007)(476003)(8676002)(118296001)(36756003)(316002)(99286004)(7736002)(110136005)(256004)(102836004)(6506007)(76116006)(2501003)(76176011)(26005)(81156014)(81166006)(305945005)(66446008)(5660300002)(8936002)(4744005)(71200400001)(53376002)(6116002)(53366004)(3846002)(186003)(86362001)(91956017)(71190400001)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB3048;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Eh5S67AV1XZteNzflBvs06WhnJGZO0VJrS0M8kW2vY+YjdiubodIKKt8hWB4huUAic/9Q/cMpToDaXHHPppebRaPs6Dc+hzElCzN+Gc5q8XotaOU59hxZ8807nB1YmAewKC0k2girsoQd863NMePI7GpRJGcKqN6rEMPqpLMgg/HIw7xkVx0Dvc2dPKx2TTdtgqcS+fMERHYStDIC0fatABtBcvl1oWnoUfAw4fgo4uvgH8Lv1/uprOFcTlNK5HxolGwVqUUKF63GrpS2ZlVCzaJVGKtr7YcGVvPDCKPEE/pE5QrGuoRCdN2tnbNTK2Hv4o7DtHawQ/BPO6xed6edEn5ZbY+wjr+PPkqyWw5uU0F4XrtC+jBIbqdr/y8Mjnof5A4YXVkXTqlToEK2APlb1syWTMW6tDFjB4TlrDONtY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d40d0b1a-8ae3-4d54-ea1b-08d71b49b757
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 15:12:51.7400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DG125jQWUyGd8egSYnU2qf1y7OhKyt2zWbFm+sZoNNUq3qKJZlV8hxKCEEmoR9nNt9FR4MMOj1jMwixNUlirKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB3048
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix memory leak in credit2
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
Content-Type: multipart/mixed; boundary="===============2294773976452833822=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2294773976452833822==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-UPvmcSnpfWrOGp6UfBwK"

--=-UPvmcSnpfWrOGp6UfBwK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-08-07 at 13:04 +0200, Juergen Gross wrote:
> csched2_deinit() is leaking the run-queue memory.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards=20
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-UPvmcSnpfWrOGp6UfBwK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1K6nEACgkQFkJ4iaW4
c+7Kvg//b3Stsr2ZuoIkNjAeBGw874me+XetdDsGz716hO0Cq9fr/BTXRyYVTOUT
6x2lX470oaFXEp4wUwJQ/X8Ib7wBuq5Ka8kpdBhKiZ5yvKOpytpy36aH0DImACyV
dwqzHyG41/RXdYlvV732tXz2YabelQK9sBVovEdx/AEMsx6AqTEbCt5yTA4LN3/s
bDLfaWmUUPgHLYswcvGvYxjgUArTiYss8AbXt/WTBlnrEXyNPsoYWDwJCz2evK/b
+ca4MxQCiVesotTg+81FasKYJFEivwIHWxsz8bNer9/gvAF4Sx9ZeRbnZQL9Nu6O
wVOxnysZOyQ9Gt+anORP9lB5UsTMoIed9EwhqZU4g8jT6sbJU5wkysW31pP7Z7bE
yHRwG06ZudDWJ7l//QSGWmh2wTozmojfTYF74QdIxpAGCP3ReJQTDQT1rHueJFpm
Ga2M3OYk4gEx10phBTqvYyaJV0TJpVxbyok8zEweiXwCDU6vqylrynxxxJ7AoDJM
NwAYPiIJyYYVmi6cPEqWzyPqXBktz2rWspC1NFTnSjxc0wmIJzLsHz9eXuNqUAUe
J1reRVGmYGcKenb06xoLZtwW0uWaiWu3EXTlVjzsU8/yYUV1NyRGFAuGNpPBmerb
KRm0kAslSH36E+P6I8RYD0bXuUun+D/20myweqbBJRSEj+H1tDM=
=EXr0
-----END PGP SIGNATURE-----

--=-UPvmcSnpfWrOGp6UfBwK--


--===============2294773976452833822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2294773976452833822==--

