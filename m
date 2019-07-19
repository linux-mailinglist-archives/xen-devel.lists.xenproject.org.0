Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2366EA81
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:09:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXH9-0003AU-RU; Fri, 19 Jul 2019 18:06:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7nr=VQ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoXH8-0003AN-Hj
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:06:34 +0000
X-Inumbo-ID: e851a227-aa4f-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e851a227-aa4f-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 18:06:32 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 18:06:21 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 18:06:06 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 18:06:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jaOgvlPATaBhBgP7zsDHN6/BlPKEsvuC7dNoByJZopN4sWyKCCiM2zypkcJHsdom6s2/ksdQyBthUV2Ws1aE2EhFElr6FiHuXZ36Fwe6A063lY9Qm4Ayg4CfBt6M+wJzOgnTXPVGXJ2Ryn71TX/ULoo8C6nF+On8aQUu7FV0cdyZupU6C/vEliG1E6qoh2AN1ayPELzL0gRQtpej3Svdo27sHjl0pNMjXcdywZeRc8/lIAzh/leBQZoC+Dz9U/I2khTbSS2Olo+DxwEol4fID8TV6mnLwl4h7Js4I+5pSE1Hy5R74fvcRQbRxUjs9Keb4HQC0cfXwgTwF1vPyZMOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BWnAHtb8ovmtioYmNfahf5uVstMM6zjev/XueH8Blg=;
 b=LL1h9rtiw9f62e7zfRN7pxzBFwye7h1xCeCZKMRUtRcSm4D5yq8/LTOmN1JfU7qBtEV+l9ShG0w/mG6u3c2qv07PSb1FNLwZxy29ePFMb3KIzP9Pjx1gZqUzY1Rz36cz0b6F0EaAnRvNO4QLUYUmVT2NgG+T7zISEPTc5lwU3pdvhQicOooVnGI/2MZ/g5ODt964EdPGGHt+5spOXzP6BlhYmWp1a5Za/sh0ZiffEiSJkBU2Ml322yf7F9LyM/wTfiN5tHtUAmMK7aRCDZDZB+tVKMGS/z7hAeE9Ka5l2ot4zbwpoQjPnXn3VtnZt88Jf4W3UJaBV3squHk41FOJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB2104.namprd18.prod.outlook.com (52.132.143.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 18:06:04 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 18:06:04 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 09/60] xen/sched: let pick_cpu return a
 scheduler resource
Thread-Index: AQHVPlyhdL9O67r6BUmrsKV8zN3O1A==
Date: Fri, 19 Jul 2019 18:06:04 +0000
Message-ID: <ab0cc9539019986fe32f0034010371a69c2ef16a.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-10-jgross@suse.com>
In-Reply-To: <20190528103313.1343-10-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49fbe544-60c9-4c7f-f6df-08d70c73c3f4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB2104; 
x-ms-traffictypediagnostic: DM5PR18MB2104:
x-microsoft-antispam-prvs: <DM5PR18MB2104F1575D46F5A9A5581EB4C5CB0@DM5PR18MB2104.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:185;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(189003)(199004)(54906003)(305945005)(110136005)(2501003)(316002)(91956017)(229853002)(7736002)(76116006)(99936001)(36756003)(53936002)(6246003)(64756008)(53366004)(53376002)(6486002)(66556008)(66476007)(66066001)(66616009)(6512007)(6306002)(6436002)(2906002)(25786009)(4744005)(68736007)(14454004)(5660300002)(66946007)(81166006)(66446008)(966005)(478600001)(7416002)(3846002)(6116002)(118296001)(76176011)(99286004)(186003)(86362001)(486006)(476003)(2616005)(11346002)(446003)(8936002)(6506007)(256004)(102836004)(71200400001)(71190400001)(26005)(8676002)(4326008)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB2104;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z3Mic2F8RocIMmvhxivL7e8Cw2MoJCPbcegy2XYEF4SIStrQF1fX22tzuPYKtZ2VNUUdgKL3lss5TBZCO3nO1bdOSKWIXOxohOy3UGMmidt9gZZJCL4RXibRcgMp2zZdgPAyVK5/AfLzvyV5RtZ6LE/TN8YqHQMfgK7+dwdegLCdnBWmWnn2+HVqUhRhaHnJyU2M2bk3Ha0usIU1eI3hIsExdblo9kOMLBzyriJ/N/Ur0oRlBQcW9ApaOfPUzS9Ezm2NC0WTwQzRcb00z4Kjxhv6COW+kGVB3aw4AFDCxD6SDAmmiAvZMiXNx2qpDXrAymaZItN+yr6juSiA7mE98akUFnrVIJhH7EPaqnpoe7YRxa8pN+nMOJ5Cyqfz3jthcUumqOFf/J6VK2z+Fg8+o2RpiiyrTCcJEFqBRVPBID0=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fbe544-60c9-4c7f-f6df-08d70c73c3f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 18:06:04.3416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2104
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 09/60] xen/sched: let pick_cpu return a
 scheduler resource
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
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============5563307113880207356=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5563307113880207356==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-5TWOmebalROq3MiZKF/u"

--=-5TWOmebalROq3MiZKF/u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> Instead of returning a physical cpu number let pick_cpu() return a
> scheduler resource instead. Rename pick_cpu() to pick_resource() to
> reflect that change.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

with:

> --- a/xen/include/xen/sched-if.h
> +++ b/xen/include/xen/sched-if.h
> @@ -351,14 +351,14 @@ static inline void sched_migrate(const struct
> scheduler *s,
>      else
>      {
>          unit->vcpu->processor =3D cpu;
> -        unit->res =3D per_cpu(sched_res, cpu);
> +        unit->res =3D get_sched_res(cpu);
>      }
>  }
> =20
this hunk moving in patch 8, as noted while reviewing it already. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-5TWOmebalROq3MiZKF/u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0yBokACgkQFkJ4iaW4
c+7ohw/9GQUc7ZrAb7ety1PqdFmRbvuCzmErRby9u7dOHrESRGgXYVhnFTO3OJ55
sxpifZAqkHbAdoFdtjI7Xe7+vwgd/XJ8fmNxEcA8gZAYXeGhrYknx9Tfy7V0DIFp
l9eeWY51k7gOdmmbAYXN9fMpNjWOSg7tYtCo9iK/RFNPdX6kXREx4+plhCGGWzm3
b14H1kmWwLRve6gx6/rTSky/0DiaL/nUesX0YD9kZO1iTQUwrxOEDYv6tReB40M8
TRqrGCJNMq3D8YzKE81pDkIWnhRN1gT7l2k25g7nW8/hKBKUwNanQqWi3pOGukjU
s/cE+xbe3UHbaEEKxaZ+7hRlhT178lT6UejGeB6Y3oCpqpvKWBvcKBK11Xp8Iw/Z
Wp2Cza2RQPOfLOiVZ6AwhwaZ85SNXTNVsWU4/C5srh2LfZZlJR8UQY6FPC54mlba
WkefT5b5iOTYonWzBs14ZJIr/SnziBFcjRbPNEJNlRGu/35YlvO+/CkX3w2guP0w
CqHTKGo/ZDMKr8VgmFKxkacoBjpVjpNAHPSn2VIXSS1u57p2DcgL91OHlZWtSx2W
06s0F3xmmwYg13LmXa6W7yYzW8X9G6HDr7Sk9iez+t3KWrh53kWzLAjl38OmJB8F
fTk/4SJjXHqvEC8GZ2fV1BI8lDC9+1v1XeSmAE9OXHYwyVDer0I=
=bil1
-----END PGP SIGNATURE-----

--=-5TWOmebalROq3MiZKF/u--


--===============5563307113880207356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5563307113880207356==--

