Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E4B6EA62
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 19:53:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoX1K-00020k-AF; Fri, 19 Jul 2019 17:50:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7nr=VQ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoX1I-00020f-Gk
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 17:50:12 +0000
X-Inumbo-ID: a273a5cd-aa4d-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a273a5cd-aa4d-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 17:50:11 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 17:46:15 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 17:49:51 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 17:49:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxjuWmpdZDgiMD76C8arPUp7XHHf8CFpT5MS4SApqy1kvR9LWUS+6nFWE5YWDwht505NuqC0OH/sUhPUjoJhTiQpVZxOcyDRb5SzpDTtLrjTlnfOdV7M9F/pxnUuNSrnXLNyXNyfWjgdCanzGCFJCv2vm0MYV8FWfSzm16r/P9+C2Wn48HstsA8wPUc2Bjdm8oNOscAUdVaDtqtMfccdXdzFRtdnxLtH+G7cWL1Iwpl8zkITbbjZNUvL1Y9uEvyOPMPegoMs8xUF+QiIfMjCApsDyITiWq/vHcEVaE8fbzZ84vYxAQd8G9WU+sDaKWdpRmUB7MFeLPqFScTjWAqJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm39oxigH91iV+YN8qVzzTrBJXiYqgHUh2dFxQJER48=;
 b=EwqkF1u406hiW3U8+uTNayVilSg5YItDCjCXI/tD28FIIwy1Mjmsv4U5kSDGnsIhqpVmvD6AmhNil7PESDdVRg9CBHvY7me2KMUXaQjOzeGLfNg7Gnf9tHJpQK1EJAQvf5U28uffUcfloAzjkI0FxHrlGdP8l8u7VhcrtCcI2XIy30M3FVYJk4dt2hpx6dC2jQhAY6j3pjicm6JvZa01gzWSiLIquHAC9VDnsS0TwOp3ZoVdQmgy4jzq0k+q6+shz33brTk9+jHDGFCVEk3QTQKU3wmgjKmL0GyPjsz27SAp1rLvElP/98Sf8S3ZKo9FfmH0zIuPIurpVdc/d+3soQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1035.namprd18.prod.outlook.com (10.168.119.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 17:49:50 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 17:49:50 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 08/60] xen/sched: introduce struct
 sched_resource
Thread-Index: AQHVPlpcQU4DYQ9xtkOujbzWGotmdA==
Date: Fri, 19 Jul 2019 17:49:50 +0000
Message-ID: <78595b135058bffde7ea256e5564ff471c6c8d18.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-9-jgross@suse.com>
In-Reply-To: <20190528103313.1343-9-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2602e30c-54aa-4169-bef8-08d70c717f48
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1035; 
x-ms-traffictypediagnostic: DM5PR18MB1035:
x-microsoft-antispam-prvs: <DM5PR18MB103588BB2292398800B9908BC5CB0@DM5PR18MB1035.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(189003)(199004)(305945005)(7736002)(102836004)(476003)(6116002)(3846002)(11346002)(446003)(486006)(25786009)(186003)(71200400001)(66066001)(8676002)(54906003)(14454004)(4326008)(110136005)(86362001)(71190400001)(6512007)(53376002)(76176011)(256004)(64756008)(66446008)(66556008)(6436002)(91956017)(53366004)(6486002)(26005)(6246003)(68736007)(6306002)(76116006)(66946007)(66616009)(5660300002)(478600001)(53936002)(81156014)(99936001)(229853002)(2501003)(316002)(2616005)(99286004)(81166006)(2906002)(118296001)(36756003)(8936002)(6506007)(7416002)(66476007)(966005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1035;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XZDjeJvaY4h9Z74F8Jla1nGpJIRR25si53BmyvY8o43VMuerHZ+VS9dMe1RxqYFcTznNCRrcvXor81dmLTHpiWehlBE1ZOw88MvkOYMUBm69AlyULPyaAvvP7+eAeFattBXg0x8xXEDDwUu+Z1wr7i5lIaH3P14SvGT1rsNwgJCKwYOtk0XPN9gwwl+uD0XmqfTCdo9iCVYuTmHLgrgaUduPxDxRvh2AbvVIWGAUDRBvNIvYGQtFU16tCI6sXiDIepzTd4N4ctB/j9Q5M60YaXPPzN7ofaWUWL+L/tYFjAmL5IHuXGuDZq5ou0O/NuBi16y6f1Ax4wAGceNBNaCAlFNG38pDUbyq5NolYOb5NubO1cc1S0W98wXgCj3TKkNM90oxMt/SGlAPZ8yokNVB/HxCXPCKkgW5Lrd3DCup5mk=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2602e30c-54aa-4169-bef8-08d70c717f48
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 17:49:50.1285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1035
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 08/60] xen/sched: introduce struct
 sched_resource
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
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============7375139188849271278=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7375139188849271278==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-2qcAqhO4aJ0DpS2t8IQJ"

--=-2qcAqhO4aJ0DpS2t8IQJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> Add a scheduling abstraction layer between physical processors and
> the
> schedulers by introducing a struct sched_resource. Each scheduler
> unit
> running is active on such a scheduler resource. For the time being
> there is one struct sched_resource per cpu, but in future there might
> be one for each core or socket only.
>=20
Ah, one more thing.

> +++ b/xen/common/schedule.c
> @@ -63,6 +63,7 @@ static void poll_timer_fn(void *data);
>  /* This is global for now so that private implementations can reach
> it */
>  DEFINE_PER_CPU(struct schedule_data, schedule_data);
>  DEFINE_PER_CPU(struct scheduler *, scheduler);
> +DEFINE_PER_CPU(struct sched_resource *, sched_res);
> =20
I wouldn't expect this to change too much.

Therefore, does DEFINE_PER_CPU_READ_MOSTLY() make sense?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-2qcAqhO4aJ0DpS2t8IQJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0yArsACgkQFkJ4iaW4
c+4YUQ//ZzUX/9Alv8ShP9m/+Va9+RpIB5AeoV4QD6WrlUS0w12RNCR1zq+09rhj
MRrP3Y291WRXMFqmJiBmi582VvijmMAPbzl+qK4ylIogVETtTJMtLu+JMEgv+NNI
0JM30olFXNlhLfYBmc9tdu3vsTUS0kiqK5miGN3tFdOc34LGcJv8U0eMkiIOC6sF
xH+pXjzSsQnU8R6mfRl4D0htjAz4HEa0rccpzU5xlcPbBky5RpM6uOedLD4TRaBl
rXgR4FIDyNj4hIxngj/lNQTZwPY+Ww1gc3Eu2VuHNQW3st5wokqjjWFt8DLAN/g2
yRFuO2Ek+I2mmEwE2D0p6X1w3iGsRbq54AX6eW+BN9nw90XSvnhLn6Fea5FaxnH4
7n4/bN4WSjQTfIPSnYvEQRzX2tso8hd2d6oN6r5mEZ9xJqsjXQ2HJ1YseIeH57jV
7bfCkchyoZBpW6riJNL+fgdWZoYyUdFiX9eT4+VFjKEGbMozphGmmYG3cTkKdLbL
1t9PrUxcSDt+SI6u0zPHFRvI8uTXAyfKpGHHyDDaeQFYJSYEhtokx9xPWtl2I4+L
HCvl+1X/od1qgWs73wQI288gikL72kjuSJk7hs/yFRm75Klhs/hvUfmggv6csJYM
4cygI3yP74VapYypCb37bH00C7GJaa09lnrgLsafK3N7eCWJQME=
=Ik0K
-----END PGP SIGNATURE-----

--=-2qcAqhO4aJ0DpS2t8IQJ--


--===============7375139188849271278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7375139188849271278==--

