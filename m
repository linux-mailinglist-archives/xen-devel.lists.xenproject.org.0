Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C7863D3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:01:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvix1-00034r-Vv; Thu, 08 Aug 2019 13:59:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvix0-00034l-Jr
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 13:59:30 +0000
X-Inumbo-ID: b9a9f360-b9e4-11e9-b1a4-4bb684b09eb8
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9a9f360-b9e4-11e9-b1a4-4bb684b09eb8;
 Thu, 08 Aug 2019 13:59:28 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 13:59:15 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 13:57:22 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 13:57:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzHZ/94r5KMHQ3PjPUjT1g5rWZJnNDcaJxa+I7gaNAcVCjd4/3pPsiBRfb64E/pH3zxcauxNMZB/6JcoYmuQTZ0SsfpCswoU9WBSxNvXE9uQ7292YWqZK1Jv6QesYhdGWfuajprwE33dF+mxPhMolpE5jpBi4s2Skcqx0Ttqc6X+5pSmK/QoejJXuv6DA6E/YOLns3c7fVjyC4/pB6w89IhgEFZipABC1pWz8lvt8aVZLIqJrlowueTsP2j1M9/q9eUDLBdwlsIspMBZzSD3uEGC0eAZwnzoLSFsXUyhC3NeRTV1cx5n8pZ8CZs80STh3wXK9zM6U3OnYP6xMDB1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QtXvvIgs6BhBNAMIA2c01UDV8X6l4dnVkAv3f38jtU=;
 b=YnXsFV2d1IQKSYTk3OpL4pSPYAIEZTAW+WHFtFJV7TXcr5qgKnImgVeZ8lFIslFg5RpFtsLgbapTPE5gv2vm6gOlXHVBenpE2MEMq8wZZ43oUmVyvcO9hJ6QtheHqVJBn4bVPXxq2SuBmW/0E6CjwRfnGTxI1BQkfbzPxmL91ms9R4u/ca3s0Xn015Znxqgo5eYWkXMHdVfwU14gdQVhnJ11HQNczcPIZ3jeEhmiEnKsSXRkdh35IaJNem/ju7j4bnUGmasd89qGKB+cl/D/6czdzTFPkhcjHImGFPVEHEzJ7nqP/9Gr5iTotZ4On7EEX6usnPwf62UlKspnpFDVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2528.namprd18.prod.outlook.com (20.179.80.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 13:57:19 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 13:57:19 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2 2/4] xen/console: Rework HYPERCALL_console_io interface
Thread-Index: AQHVS5H5pzxcqbmNhkST9HIKVDZInabxSzqA
Date: Thu, 8 Aug 2019 13:57:19 +0000
Message-ID: <ae2cd958-e0ac-670a-2e2e-96cca2c9b82e@suse.com>
References: <20190805132955.1630-1-julien.grall@arm.com>
 <20190805132955.1630-3-julien.grall@arm.com>
In-Reply-To: <20190805132955.1630-3-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0013.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::25)
 To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30d53827-22ea-4335-b6eb-08d71c085448
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2528; 
x-ms-traffictypediagnostic: MN2PR18MB2528:
x-microsoft-antispam-prvs: <MN2PR18MB2528B1348CAF56BE3A6923F8B3D70@MN2PR18MB2528.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(189003)(199004)(54906003)(64756008)(66476007)(66446008)(66556008)(76176011)(71190400001)(99286004)(31696002)(5660300002)(66946007)(86362001)(3846002)(7736002)(478600001)(256004)(6486002)(36756003)(6916009)(71200400001)(305945005)(8936002)(6116002)(66066001)(52116002)(31686004)(316002)(229853002)(6246003)(2616005)(53936002)(446003)(486006)(25786009)(4326008)(11346002)(476003)(81156014)(4744005)(6512007)(6506007)(53546011)(386003)(80792005)(81166006)(186003)(6436002)(8676002)(2906002)(14454004)(102836004)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2528;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PGugJjkF3bBajMVd8Zh76kicEsYaoalvZ9CzRgX1xhHV0nIrZ8rk6v078/BlWvpvUIQVRwJ2bcZswfbC7xhpH6woz1Ax3e71IYpNswOO5+DJO8xWjGn2BEtcZAKrlejDMD9Mn/9ULLu1Mo4MPaChjbET2vfJISscyMMtW0ZaNNQeWB2xJSegmUGjl8B3YO8IZfVabbGCd1LtdKhXGK+gobhhXgHnJK1oobNon0oAqvUHUc1K09LIAUVxVY2rzqlGWkPIobqhimXYmUrJxd8t2WuHeyJ65SklTsAaflIu0yydz3Ysw1Hrt12eorDONpkYxREaJNezW3dGxqgb6CSoYSiXwzTu70kLICqxgrxcRe1Ju0j15SdmnSvmPUonhruS1j1WUwkj5oHzEoPV7poLWzu1jWs/Amv2WJOb0QAty2U=
x-ms-exchange-transport-forked: True
Content-ID: <D19627BD5BD16E4DBF3967F7FD3E748D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d53827-22ea-4335-b6eb-08d71c085448
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 13:57:19.8070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PNZkne9zxdQLb5zGC0sPrs19T6h8Zk4ejEjXdV7OT2IN7C3MLZuruO2DRrKp+FMifBrZOdIOJDUbwv5qilFMjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2528
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 2/4] xen/console: Rework
 HYPERCALL_console_io interface
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxNToyOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBAQCAtNjI3LDYgKzYy
OSwxNSBAQCBsb25nIGRvX2NvbnNvbGVfaW8oaW50IGNtZCwgaW50IGNvdW50LCBYRU5fR1VFU1Rf
SEFORExFX1BBUkFNKGNoYXIpIGJ1ZmZlcikNCj4gICAgICAgICAgIHJjID0gZ3Vlc3RfY29uc29s
ZV93cml0ZShidWZmZXIsIGNvdW50KTsNCj4gICAgICAgICAgIGJyZWFrOw0KPiAgICAgICBjYXNl
IENPTlNPTEVJT19yZWFkOg0KPiArICAgICAgICAvKg0KPiArICAgICAgICAgKiBUaGUgcmV0dXJu
IHZhbHVlIGlzIGVpdGhlciB0aGUgbnVtYmVyIG9mIGNoYXJhY3RlcnMgcmVhZCBvcg0KPiArICAg
ICAgICAgKiBhIG5lZ2F0aXZlIHZhbHVlIGluIGNhc2Ugb2YgZXJyb3IuIFNvIHdlIG5lZWQgdG8g
cHJldmVudA0KPiArICAgICAgICAgKiBvdmVybGFwIGJldHdlZW4gdGhlIHR3byBzZXRzLg0KPiAr
ICAgICAgICAgKi8NCj4gKyAgICAgICAgcmMgPSAtRTJCSUc7DQo+ICsgICAgICAgIGlmICggKGlu
dCljb3VudCA8IDAgKQ0KPiArICAgICAgICAgICAgYnJlYWs7DQoNCkEgbW9yZSBwb3J0YWJsZSAo
YWZhaWN0KSBhcHByb2FjaCB3b3VsZCBiZSB0byBjaGVjayBhZ2FpbnN0IElOVF9NQVguDQpFaXRo
ZXIgd2F5DQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
