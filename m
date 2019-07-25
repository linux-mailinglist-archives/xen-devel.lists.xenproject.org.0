Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46DE74E83
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 14:50:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdAN-0003KL-0G; Thu, 25 Jul 2019 12:48:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqdAL-0003KB-HJ
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 12:48:13 +0000
X-Inumbo-ID: 7481edd4-aeda-11e9-9905-f3de82fb36f9
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7481edd4-aeda-11e9-9905-f3de82fb36f9;
 Thu, 25 Jul 2019 12:48:11 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 12:48:09 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 12:47:03 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 12:47:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTqjKNkVyHataa+KJRDKjSvAmqkmsbuy0dEpE/ujHUleFer1j4Vay1piZwS3FvqzsyS0FdB71OLFe4wOYFqvqDf66vAlqS/JJ23EjtjH8E0ftzqchvyDGxtRiWN6RwB7eVazGoUpLv/gqvrM1gARu2A9mOfPNmEY44erqNV7N5zuvoNrsbgk0rQynd2jeGZbTCPO9ykXeXET2QHyGd11/cP2xNm2lOyHQstYzq7HAx1Lk9Y/HMVzWomefI+JoMc98r0+Tl1atrhWOHz05+XXhF6SvzOqRTu7ETOIJCWyClzP0GinaaSXasNF7k7i47yvJ7dF5m2LMpcOXAUMkRarGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtzMgpw8HqGU1yWSKbxabOGqDSryjBnukaMIcax4wyk=;
 b=k8ZtQtko1VKlpnt0/PnoJ3GqXCdSxU7M+EEZt7tYurUrfL8YbgQ/SZM39vvEWkTWoa8xkO1ru4rFA8UF+rPx8MzctDMjK/ONgPlog+kbkxUYJaS2XdHmjlB/O8w5FS52zwsrMTfpRAgAsL9TBIJ+V4TscLJ8GQgrOF7/qDQCV0DPwRHtLyibzGE2TRUbZfhuKIpITu4595NVtE+aXxSTfVwFNF+vJLpAAZDt9r44qIdm+MJW7VqXHkZcBkJNE31HCN5GyvWslTlTImRJ4/hsSPOJ9DsVljws38IjXd8jYJmUaKD/5eVh82Zy863zj6fbVbcNsTaStjJRXyddaYg92A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3282.namprd18.prod.outlook.com (10.255.138.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 12:47:02 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 12:47:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
 <roger.pau@citrix.com>
Thread-Topic: [PATCH 2/2] x86/iommu: avoid mapping the APIC configuration
 space for hwdom
Thread-Index: AQHVQW4zrYUYVM3HpUS5nJG7cGq72KbYXymAgAAKL3CAARxMgIABxZQA
Date: Thu, 25 Jul 2019 12:47:01 +0000
Message-ID: <10856269-2698-7791-3b43-3e47af14cbe7@suse.com>
References: <20190723154851.77627-1-roger.pau@citrix.com>
 <20190723154851.77627-3-roger.pau@citrix.com>
 <5017c875-a59d-e7d1-c8fc-325b4208d15e@suse.com>
 <cade48e9-5346-b325-e06a-ee4adf2c48f0@citrix.com>
 <cb952c0d-4111-2138-660e-c9dc0dd79c11@suse.com>
In-Reply-To: <cb952c0d-4111-2138-660e-c9dc0dd79c11@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR1001CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:4:b7::16) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d19c00a-e2c5-43e1-c49f-08d710fe307d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3282; 
x-ms-traffictypediagnostic: BY5PR18MB3282:
x-microsoft-antispam-prvs: <BY5PR18MB328252F1CC8121B3EAE3CF33B3C10@BY5PR18MB3282.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(199004)(189003)(4326008)(8676002)(71200400001)(71190400001)(76176011)(7736002)(316002)(102836004)(2906002)(486006)(305945005)(8936002)(110136005)(386003)(6506007)(2616005)(81156014)(99286004)(446003)(68736007)(26005)(256004)(53546011)(3846002)(14444005)(6116002)(11346002)(81166006)(52116002)(186003)(6486002)(80792005)(6512007)(478600001)(6436002)(476003)(66476007)(31696002)(66446008)(64756008)(66556008)(36756003)(66946007)(86362001)(6246003)(66066001)(229853002)(25786009)(5660300002)(14454004)(53936002)(31686004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3282;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KONG7NQMfy8JTyunxmDuPN+4zwjApX50UuiB+EE3Bmpf+GHGdYhb7DIk17B58Bp4xfTtY6lsWaVo8jSw4U4A/EzhNUn+iqfrRJxGioAA7IhBTwQfDxx8W/56A26oVR9esfrH7E81bPF6fiYhnc4NGjoqi1uoIfBBgWRsZ+emR73RIfdKuq9pVIMPgYx9Qbuix7Vo8Y7hudkAzRrOAaFZVAjahMcF/cp/7hZNfWkapQIXZOz+yCARrehGRZK7AchuIIHqE+NVW9voS/kEIYDmTDt1d6PGjxBTM1XJ4Q7+7fMeL4VDf2UDqN7f9qKaw230G/bGwvpG3sDFdJ8nULJvaCoqoZECzP5IZspC7Ie0BR7fSP82PR/W3tGwlmdxZKbgEa806bKVFut56ifXVp4rC4mQAs9lzFvI+jicmt33mzw=
Content-ID: <80069EF7A8A8C74CBAE7F2108E0EFF90@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d19c00a-e2c5-43e1-c49f-08d710fe307d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 12:47:01.9749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3282
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/2] x86/iommu: avoid mapping the APIC
 configuration space for hwdom
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMjAxOSAxMTo0MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjA3LjIwMTkg
MTg6NDUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMy8wNy8yMDE5IDE3OjA5LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAyMy4wNy4yMDE5IDE3OjQ4LCBSb2dlciBQYXUgTW9ubmUg
d3JvdGU6DQo+Pj4+IEN1cnJlbnQgY29kZSBvbmx5IHByZXZlbnRzIG1hcHBpbmcgdGhlIGlvLWFw
aWMgcGFnZSBpbnRvIHRoZSBndWVzdA0KPj4+PiBwaHlzaWNhbCBtZW1vcnkgbWFwLiBFeHBhbmQg
dGhlIHJhbmdlIHRvIGJlIDB4RkVDeF94eHh4IGFzIGRlc2NyaWJlZA0KPj4+PiBpbiB0aGUgSW50
ZWwgMyBTZXJpZXMgQ2hpcHNldCBEYXRhc2hlZXQgc2VjdGlvbiAzLjMuMSAiQVBJQw0KPj4+PiBD
b25maWd1cmF0aW9uIFNwYWNlIChGRUMwXzAwMDBo4oCTRkVDRl9GRkZGaCkiLg0KPj4+Pg0KPj4+
PiBBTUQgYWxzbyBsaXN0cyB0aGlzIGFkZHJlc3MgcmFuZ2UgaW4gdGhlIEFNRCBTUjU2OTAgRGF0
YWJvb2ssIHNlY3Rpb24NCj4+Pj4gMi40LjIgIk5vbi1TQiBJT0FQSUMgU3VwcG9ydCIuDQo+Pj4g
QnV0IHRoYXQncyBjaGlwc2V0IHNwZWNpZmljLiBJIGRvbid0IHRoaW5rIHdlIGNhbiBibGluZGx5
IGFzc3VtZQ0KPj4+IHRoaXMgcmFuZ2UuDQo+Pg0KPj4gVGhlIElPLUFQSUMgaGFzIGFsd2F5cyBs
aXZlZCBpbiB0aGF0IHJlZ2lvbiBzaW5jZSBpdHMgaW50cm9kdWN0aW9uLCBhbmQNCj4+IHRoZSBs
b2NhdGlvbiBpc24ndCBldmVuIGNvbmZpZ3VyYWJsZSBvbiBuZXdlciBjaGlwc2V0cyAoSWYgSSd2
ZSByZWFkIHRoZQ0KPj4gU0FEIHJvdXRpbmcgcnVsZXMgaW4gU2t5bGFrZSBjb3JyZWN0bHkuwqAg
QWxsIHRoYXQgY2FuIGJlIGNvbmZpZ3VyZWQgaXMNCj4+IG11bHRpcGxlIElPLUFQSUNzIGJlaW5n
IG1hcHBlZCBhZGphY2VudCB0byBlYWNoIG90aGVyLikNCj4gDQo+IEknbSBwcmV0dHkgc3VyZSBJ
J3ZlIHNlZW4gSU8tQVBJQ3Mgb3V0c2lkZSB0aGF0IHJhbmdlLg0KDQogRnJvbSBteSBBTUQgRmFt
MTUgc3lzdGVtOg0KDQo8Nz5BQ1BJOiBMb2NhbCBBUElDIGFkZHJlc3MgMHhmZWUwMDAwMA0KPDY+
SU9BUElDWzBdOiBhcGljX2lkIDAsIHZlcnNpb24gMzMsIGFkZHJlc3MgMHhmZWMwMDAwMCwgR1NJ
IDAtMjMNCjw2PklPQVBJQ1sxXTogYXBpY19pZCAxLCB2ZXJzaW9uIDMzLCBhZGRyZXNzIDB4Yzgw
MDAwMDAsIEdTSSAyNC01NQ0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
