Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10C575FFA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 09:41:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqunB-00006A-3v; Fri, 26 Jul 2019 07:37:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YaH9=VX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqun9-000065-0h
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 07:37:27 +0000
X-Inumbo-ID: 33fc0c74-af78-11e9-be80-63c17a017c8c
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33fc0c74-af78-11e9-be80-63c17a017c8c;
 Fri, 26 Jul 2019 07:37:22 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 07:37:21 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 07:33:55 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 07:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUIOQ99axduekaTKNarX1xhwU55K2OLwYHLVzqFMFtw8vHAx2YmlGejeJSyA4hc5+GQMYyNxisPYHkcD0tb7ixYJfoZMOKRg7QDewu6de7WSkGDbHx+8xMjyKflckr/1Uperw32ykKSgQRxxleV6PDhbQ673Gp5APk/CrcB8y334POhWVkWLeU952+wmevhkfJAj6Bf7awJ2tEwWvf7/QeeDrsjVM6+RVKas6YPqUc7n2/WJOzLHnAtrkUfoCFIOf/KJUE5DbuRJekNERtOJpoZRi2nUgrylA+h45w682Malsg9AS6hzJfTVmqkLf6oNzCXh9aEP5rCSbgfkTOUBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttB0aa3Gv9e9mWKiQ8yhAkvxFpOqidAXngnWBtWza1w=;
 b=ALvOfChoId7hp7gMIBaEdN7mvamwFfPtCsdfiEdBQs5he9qdOSq2apk7IEw2mjuJDdwk60lhcF0QTGzJctk4Dkc+mZ2ZYFjzOmCqKRdzJdttyjxlNpAvPsiPoxkzipnIWTbuntF15FXcTP0n1/5FRP/gskWbYP/KPZRjHc73wDyXaG+/trzleONAcWxzPPTnh8g+jnGc9pgCTqCTQds51YV4HIDwGTwPZNLmZXa8X255dkI0Feq3bPPAU0xzUtOnkydGz32jwP85/a81M4re8sR4hQxpSIogI3R5EH8Ikbh+5OPIAoMyKwtsZeoo4EisrscPOb00nefJz2EBG4lahw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3347.namprd18.prod.outlook.com (10.255.138.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 07:33:53 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 07:33:53 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 1/2] x86/ubsan: Don't perform alignment checking on
 supporting compilers
Thread-Index: AQHVQ4R5ovDVdvhS/keGiUf3ND87nw==
Date: Fri, 26 Jul 2019 07:33:52 +0000
Message-ID: <05c5aab4-11e0-cd0c-0940-09ea94f707c2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P192CA0019.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::29)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f01b7b38-c1c6-4add-8aa8-08d7119b9bc8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3347; 
x-ms-traffictypediagnostic: BY5PR18MB3347:
x-microsoft-antispam-prvs: <BY5PR18MB33479F706E87C8CD8C5C1AD0B3C00@BY5PR18MB3347.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(189003)(199004)(478600001)(386003)(2906002)(31696002)(6246003)(53936002)(102836004)(52116002)(6486002)(36756003)(66476007)(66556008)(25786009)(64756008)(229853002)(316002)(66446008)(6506007)(54906003)(4326008)(80792005)(7736002)(68736007)(26005)(53546011)(305945005)(3846002)(6116002)(8676002)(186003)(66066001)(81156014)(81166006)(71190400001)(71200400001)(14454004)(6512007)(256004)(476003)(4744005)(2616005)(6916009)(31686004)(14444005)(486006)(99286004)(5660300002)(8936002)(6436002)(66946007)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3347;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hai7n5HuntgUhUX3MgdBJc+m0ccBxM8hDUzml1UGNjr8/CqH7igSKTKV1gmtVefixfah632ZdQH8L0wRp5iYoCLdeaaYvXhl3NIrpiP7IIAzpq2D2jkNthLJ3Q8G78MrGhQi/Wr/m/wArCEZaBIkJm9gh7J1U5LBw1RSwU2G5zgglfzdCjeY2KRkXO/t55WexlQBDPoEpbLSTQ9h5LpBzlQOtzPNouVkbzluRqBSAANW44sl7hbN22tl/2JgIKCDOhNcS3fYiTljLOKOnppcHekyNwe/IW79TbVHpQOHDiR8ByHqZlaJH7ttI2j/DBZvyP5csyVOS9wtdDFCMOMXHC38kxC3Y0uyHL432bM78U31GjQidMW1J8idhdE7yZev9YfGC3hzORfrN5dTUZozFcXfDkO6NkgFrubLtAWwnfk=
Content-ID: <D8DF6E813916C34A92C574BA140E0111@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f01b7b38-c1c6-4add-8aa8-08d7119b9bc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 07:33:52.8817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3347
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 1/2] x86/ubsan: Don't perform alignment
 checking on supporting compilers
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA2LjE5IGF0IDIwOjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6DQo+IEdDQyA1IGludHJvZHVjZWQgLWZzYW5pdGl6ZT1hbGlnbm1lbnQgd2hpY2ggaXMgZW5h
YmxlZCBieSBkZWZhdWx0IGJ5DQo+IENPTkZJR19VQlNBTi4gIFRoaXMgdHJpcHMgYSBsb2FkIG9m
IHdvbnQtZml4IGNhc2VzIGluIHRoZSBBQ1BJIHRhYmxlcyBhbmQgdGhlDQo+IGh5cGVyY2FsbCBw
YWdlIGFuZCBzdHVicyB3cml0aW5nIGxvZ2ljLg0KPiANCj4gSXQgYWxzbyBjYXVzZXMgdGhlIG5h
dGl2ZSBYZW4gYm9vdCB0byBjcmFzaCBiZWZvcmUgdGhlIGNvbnNvbGUgaXMgc2V0IHVwLCBmb3IN
Cj4gYW4gYXMteWV0IHVuaWRlbnRpZmllZCByZWFzb24gKG1vc3QgbGlrbGV5IGEgd29udC1maXgg
Y2FzZSBlYXJsaWVyIG9uIGJvb3QpLg0KPiANCj4gRGlzYWJsZSBhbGlnbm1lbnQgc2FuaXRpc2F0
aW9uIG9uIGNvbXBpbGVycyB3aGljaCB3b3VsZCB0cnkgdXNpbmcgaXQuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpJJ20gc29ycnkgZm9y
IHRoZSBkZWxheSAtIGl0IHdhcyBvbmx5IG5vdyB0aGF0IEkndmUgYmVlbiB0b2xkIGhvdw0KdG8g
YWNjZXNzIHRoZSBtYWlscyBzdGlsbCBkZWxpdmVyZWQgdG8gbXkgb2xkIG1haWxib3ggYmV0d2Vl
biBtZQ0KbGVhdmluZyB0aGUgb2ZmaWNlIHRoYXQgZGF5IGFuZCB0aGUgc3dpdGNoIG9mIG1haWxi
b3hlcyBhY3R1YWxseQ0KaGF2aW5nIGhhcHBlbmVkLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
