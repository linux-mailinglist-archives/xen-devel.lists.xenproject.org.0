Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330288BC37
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 16:56:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxYBf-0004Yy-5X; Tue, 13 Aug 2019 14:54:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wWNT=WJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hxYBd-0004Yt-VH
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 14:54:09 +0000
X-Inumbo-ID: 2e717a26-bdda-11e9-8b4b-33c7b83ba502
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e717a26-bdda-11e9-8b4b-33c7b83ba502;
 Tue, 13 Aug 2019 14:54:06 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 13 Aug 2019 14:53:37 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 13 Aug 2019 14:45:42 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 13 Aug 2019 14:45:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxnkQOflJi1rgTLvSNRv4r+yMDsd9cMEYwbP5r96NDNSiUS23ZithragFOKJTwMgCL30ZmeNRIod8jUOtqdHLImr+6AYEQY2ewECzQrJMm1w3meSYFv/8J4ZBYxgSX95zcxVZ2f/04vJG7DsapVtGFyrfo0F130QxCUPAWwE0LH9TR6PziduJ4q/EJJgYVj1EAdRdavRIsNRcR8suVuq1SPT0W8I9gFuKZ6h6IVfloK5SKl0Ozr3CiLgtCMBPaQ+PNVYzdJR1MSsboI3RuneGbUUEYh8J7lSy4il2hXML2i7tXUAajNIhbty+xbJZqav+9DxkfsBus8pe+Zj4gKsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZQaK0FCiBc2FkCTainZeuT6H1g691m+U/vGYu+1ndM=;
 b=GVMwCBjk0IKPbgn5Pbe39ZuGrlmYvozorQQDVfNm7395335Flw+tfzUpaDCjoCOdeMmJmK+uD56fY2GhUZgFbAd306hCnQTiyhiEDWG5YiySQdByjylQs6Cc8XnuIhuE7Ux1UdNgHBu7yBgtEk3wKDTv3qdEo8uz7DgygHmv0ilgH3nFXJ4NbG96Edd38M7HChEsCcTxE2wbTdNKxMPXVQIw9MjSQpW0RU1xQh0dIu4fzGs64WNBxlzn/gKY/2y+2cel0jLQ04PYdG812UskLIOYI02gca1PmlPaTTgHjA1zmqSVK2vu78kVPoBnf1JjdNrLLR3RWRywwHkYrTnHXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2807.namprd18.prod.outlook.com (20.179.57.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Tue, 13 Aug 2019 14:45:40 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e%7]) with mapi id 15.20.2157.015; Tue, 13 Aug 2019
 14:45:40 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
Thread-Index: AQHVSQcBz01X1+GS1EGqbA6JcY+nvabnk6IDgABBB2OAAMWuAIAFhDYwgAM0tQSAB+Y6AA==
Date: Tue, 13 Aug 2019 14:45:40 +0000
Message-ID: <8d5c4fdfacea5fa2fd4c209b80cf28cb9f0ae883.camel@suse.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <3d07492e9a9e1ebb1bff17a4f42afa2bd9ec1723.camel@suse.com>
 <a71ddd42-173d-32be-0674-47818316232e@gmail.com>
 <189da8d7-dee8-18f8-fbbf-699761f0b656@arm.com>
 <d92cecb0-397a-004f-aa80-e2761d9fadb5@gmail.com>
 <9c12cfb7c9b9b6c278f3f9e075d8ff117ac45190.camel@suse.com>
 <2476d08e-91cd-83ed-6637-9a801272570c@gmail.com>
 <5ec9039f-5b97-cfd3-a5a2-9adbdb4a7808@gmail.com>
In-Reply-To: <5ec9039f-5b97-cfd3-a5a2-9adbdb4a7808@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc436227-26ba-4400-24f5-08d71ffce983
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:BYAPR18MB2807; 
x-ms-traffictypediagnostic: BYAPR18MB2807:
x-microsoft-antispam-prvs: <BYAPR18MB2807942C7E599C2398AD7875C5D20@BYAPR18MB2807.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(189003)(199004)(36756003)(2616005)(66066001)(6506007)(102836004)(64756008)(229853002)(6116002)(6436002)(6486002)(316002)(3846002)(66946007)(26005)(66476007)(76176011)(91956017)(53546011)(6512007)(76116006)(99286004)(66616009)(54906003)(66446008)(66556008)(81156014)(99936001)(6306002)(966005)(14454004)(2906002)(25786009)(118296001)(86362001)(110136005)(53366004)(53376002)(5660300002)(7736002)(11346002)(486006)(2501003)(14444005)(256004)(8676002)(305945005)(186003)(53936002)(8936002)(478600001)(476003)(81166006)(446003)(4326008)(71200400001)(6246003)(4744005)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2807;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WwFhAvVoDGXWg+qmAbuLBBLmvq5YVHQz9MsM8eRGI5rCURtXISHVhNj9j9PTxVOYCnejFJY5bO9o+scHmfGaBN7S6beanGjROPc3/okwYJKospijn/rzIs5fYVtPGaPXHZhu1X/gWLUrBVsN+RRov8pSmLZWQ1VK2im8jDx0s2ZBH07+ewNDJhl2FYqma9WQGW+gNAkYhY1m/rawjc6fnL5vcCxezo2Po60aBTdVSo21em1zkQU7vdjSkWVS6LZDeRlqEJr7I0J8zo1IUYl9mosiEUPq2fhrUTX+YnJCZs72uunj8qTMTghUioboMTKcTwFhch/ZXn0Cy/Sj2eOuiHtprIQ6ZE4/xLABIllnjTsQskMmHwSUQsO2d0Yvh/+mdKnqjomSjmGKMmy8YUkfKpIW4nkD7MRU18zJPBLxMPU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fc436227-26ba-4400-24f5-08d71ffce983
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 14:45:40.2822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B0TZkTHN1AC3SgjcOCIxFMlEGENTFd8iylUHGuz2e6JL/YAkj7e+KbIi6WcoUpHIjzlPjjac6gw8s6in8BYE6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2807
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============4750271641680240351=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4750271641680240351==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-5L+D8zKgRws9ncqamta1"

--=-5L+D8zKgRws9ncqamta1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-08-08 at 17:07 +0300, Andrii Anisov wrote:
> On 06.08.19 16:09, Andrii Anisov wrote:
> > p.p.s. I'm looking through freertos as well to get wider look on
> > the available approaches
>=20
> OK, basically Free-RTOS does not account the IRQ time separately. Yet
> its scheduling is very implementation dependent.
>
What do you mean with "Yet its scheduling is very implementation
dependant"?

> Any ideas about other open-source examples available for
> investigation?
>=20
Zephyr, maybe?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-5L+D8zKgRws9ncqamta1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1SzRIACgkQFkJ4iaW4
c+7Fzg/+JCAGcn1bXUTtYp7tktdV5IKicgX9I+0EMFlNPTKbLn9vxxozmX1zy9FK
iqnhwlC25x+Kn/3S8osja/VV4sw0D689qm9GkHkWy47QhACHPARGUTcua+FUzjFf
N53z9aeHBmOU+M2T4eKIOsj2s8qWta8d5Ipv1fhyNxQDeEX5bZyJUbwjVVNvLkVL
s2tkteMwmqjhkuzn2JxnLnXIxwTSK3s/PkRq0WPU6eLRgDHpO/fQNvMmkK/wO4He
XaE5RCp7a9LC8FCAjFo0mPsgX+G/h0uJ1B0Wb02WW6w5W0qYrditJTPuTGMGqsNm
FVfkTuf34cV2ate1psNL6E1T0T6rApuH+P3wd4rrUfLTz4ZbPqOa7AmTgN2Sf25j
+MOQzMOSAClZgbC6fd2lB/OES/HOlOIdIyE2EKQ02IzU10LXwUCu5URqGv+jUOQc
hG6VWMjCUMrn55mKHqDbo+yUqIGUN/rMh52lM5+XJxb0Z1PD5UiUWDBtHyLcajRF
QFW2F2QydneTVMHYT4gvwa3Z3pCoZ9jwdoOrgZ55YI23AzDBjctcxUEdESxUAz3v
hQ6f1KYWmhHuKja1I19cr0RwXovBnh1uI5IFgZcIyMthpiW01EFrMdkhfbMNa50k
X9WTwWw6IyYCuR3vjppyKPTiXaVJ7D8l8ME98n9grBT07S42IkI=
=jPB8
-----END PGP SIGNATURE-----

--=-5L+D8zKgRws9ncqamta1--


--===============4750271641680240351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4750271641680240351==--

