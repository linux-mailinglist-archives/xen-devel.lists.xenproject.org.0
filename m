Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99C26EAB5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:34:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXfV-0005nO-1r; Fri, 19 Jul 2019 18:31:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7nr=VQ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoXfT-0005nJ-LS
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:31:43 +0000
X-Inumbo-ID: 6ef0b9dc-aa53-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6ef0b9dc-aa53-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 18:31:41 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 18:31:32 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 18:31:28 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 18:31:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0N/FnEKVlLWn4sMMtbycVZA4F9MD0v+0/LlGV6DtDseOJk6awghgtxQp7fPtlyeAWJmUJ4EvIoNOoGTipu3hFoN2GWUBRfCRv+oLnUn/NeT1G//ueWFAgZ09dar7lxD3WrAx9cBIkU8SaPtqq5LAUxT54wkput1Drz+fe/08Sl+eaXDqy7z+GekTZvjk/rSylxFJ3do8xTzlerGMCjoVqywtsUdhpCTJOvoHgdPV8pTFZcUimOso4vMGBKbIwhLAlxV6ZboBKAKYPpsNEj7nWta4fKFh76xsLl5xnlt8c1STQTP1TPdimrMJo8ZcV+04WTj2wrVxSfBJsDiLfByuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhlN4FSpShXD+0Rdz1nf27Y7Or0o4gy9eI1UoqFvBEY=;
 b=KrnEdpoFpGbGSb+KXHB0d4dq3pm9Y8HD7dOAlGZSPm2AXfe2T7e7X5jGbff1KMmJEKL/ki3t+Nis+iwOFI84i5Uwk4g9wJumsq8sNoHy9duJNEEUxhiW1Yn1AZm6VXx8mzlWbiQy1wP4KNqxsrJnYr8V1zeWvK83UkAYXBHB6zTD/rqW8cEGHz3Z9lYVda3Ou0HebTH8ARQQwjz71kzJzGLpQ2lltXDglhSFbmOe1lcdih4pqiJarsvmM8QGXeUg60uQQFOKZJCP97LoAGgbOfjA4n4VtPLC6jKnt9EQ5Basa4RDoNzdO4SFk/dce6C5wCH+NDBEfPmInFtlBouyfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1516.namprd18.prod.outlook.com (10.175.222.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 18:31:27 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 18:31:27 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 60/60] xen/sched: add scheduling granularity
 enum
Thread-Index: AQHVPmAsy+fup8qTeEKAGVaFvbo9Tw==
Date: Fri, 19 Jul 2019 18:31:26 +0000
Message-ID: <a34b43ae2c441f48dd0af5f014df135f0cac379f.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-61-jgross@suse.com>
In-Reply-To: <20190528103313.1343-61-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 846924c7-4774-43f9-1760-08d70c774f85
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1516; 
x-ms-traffictypediagnostic: DM5PR18MB1516:
x-microsoft-antispam-prvs: <DM5PR18MB151602FCAEA5E8236F3CBEECC5CB0@DM5PR18MB1516.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(199004)(189003)(478600001)(99286004)(966005)(66946007)(68736007)(76116006)(6116002)(91956017)(8936002)(305945005)(256004)(7736002)(446003)(71200400001)(118296001)(71190400001)(25786009)(229853002)(99936001)(14454004)(486006)(476003)(2616005)(8676002)(2501003)(81166006)(81156014)(11346002)(6486002)(186003)(102836004)(86362001)(316002)(6506007)(26005)(6512007)(36756003)(76176011)(110136005)(54906003)(4326008)(6436002)(5660300002)(66446008)(64756008)(66556008)(66066001)(66616009)(3846002)(53366004)(53376002)(6246003)(2906002)(6306002)(66476007)(53936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1516;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: D1jFUciMapncQEexlfeXbMXY1RtqSaojaw1kiUwXJ5Q+bTVsfXk39laAiyl4ac262LobX2YYM5ICSv4fFFjSbnPIG0ZHwL4+rwzE34CT3TzXmyBVsYnCKedroBkSUEaGCd9swCTWF0W6J74nQQ89NlmD/ZrcaEUH0ZY0Y7YaqB+ykelQNUScZwTnSSev/a2dSQeOBHmvTnJxUyc5hT7aBJoOaULvZrewcscJtHi0LGn3OBfE44UmYXY1UcQCAMztwA/KDB3BtNrouUEN5ZKo+wBn+t7ZkfFeUMoa+yhvy03WAryDPcXJdLFPb9RAYyRqlfg1qvC8kW+IW7/Xn+LLAaC9iu43cAtNhOJJ6xAfoR7DthAgF0CdTB0qDpL4E55gvAeaiM/X9xPNoDZ61Qo+X2qqaTuR7ZiarB+NaH4XBIM=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 846924c7-4774-43f9-1760-08d70c774f85
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 18:31:27.0087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1516
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 60/60] xen/sched: add scheduling granularity
 enum
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
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============0764729751553263103=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0764729751553263103==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-8/Vjw52BCCBHmoPXsg1g"

--=-8/Vjw52BCCBHmoPXsg1g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:33 +0200, Juergen Gross wrote:
> Add a scheduling granularity enum ("cpu", "core", "socket") for
> specification of the scheduling granularity. Initially it is set to
> "cpu", this can be modified by the new boot parameter (x86 only)
> "sched-gran".
>=20
> According to the selected granularity sched_granularity is set after
> all cpus are online.
>=20
> A test is added for all sched resources holding the same number of
> cpus. Fall back to core- or cpu-scheduling in that case.
>
Might be me (non-native speaker), but this reads weird.

Perhaps the second sentence should have ended with "is that _is_not_
the case" ?

As in, "if it is not the case that all sched resources hold the same
number of cpus, we fallback". While right now it seems to me to say
that we fall back in the case that the resources hold the same number
of cpus...

> Signed-off-by: Juergen Gross <jgross@suse.com>
>
With the above clarified:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-8/Vjw52BCCBHmoPXsg1g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0yDHwACgkQFkJ4iaW4
c+5SoRAAsZXpZjueWRAt87uw3+DnGwT9Gt24dpbOF+LucRiJvxMDu6Xjg0Ho3iIV
bP4YAyzjdyZXrystKem3bNqk22N2lrBJArEWBg3SUu56sp7Lf8ba92ox/htrAP+2
m4wc0BXb0O/afHtWJO/iEgG5pyO0qdSr6vNul2Jq3761dqanG5ouBr9dB8knsWgx
pJphv/H3pUo2g76ltWeMh/mJdNkvMOmWHDpNEV+vtM+xO0uHTTOorqbwxEOWLYAQ
siCSyIF6R0ZXjMSAEp4SbO8GG7cmvWK9S8NNfcIUttm45O79/r6ikr9qWX0okfq1
YK0e/lzOAHrCqntWkn4u7PRqJBbPUKjp+GbzuP3ck+zL7e/0z5h69yzMeRSVPWYi
XHTuPw6F5aXDfaMlQo62XGsV4W9Gup9KcfMXMkVMqcQt0BV4Ul62dMlH4Yb2uOrb
gxmbBbs1jBlycrUkZiH1txuzPTOokkRVAnLL2A/OAY0slM5TB2SeBUwXhEBUaJtM
qGzeklp8NIaxR9DUwv6h1oIEY0OMTEzc1xDOldBaHYw4AiySh+uD6nJ3qq1m4nZg
alqJY61f2r+TQoY0bF5Of0/LnbbHiTfUwhecjAS6UtnHrxJ8w+4Crczj6jNNPkPR
WG4DF5O0fP5VakwBlLX7k230b6cR9QFUrmxqyX2j5/fsoK7rpjQ=
=TVfu
-----END PGP SIGNATURE-----

--=-8/Vjw52BCCBHmoPXsg1g--


--===============0764729751553263103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0764729751553263103==--

