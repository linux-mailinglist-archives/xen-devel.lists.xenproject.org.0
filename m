Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1496097D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 17:42:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjQIr-0000xR-Jj; Fri, 05 Jul 2019 15:39:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjQIp-0000xG-BL
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 15:39:11 +0000
X-Inumbo-ID: fdeb2757-9f3a-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fdeb2757-9f3a-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 15:39:10 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 15:38:48 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 15:37:42 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 15:37:41 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3233.namprd18.prod.outlook.com (10.255.137.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.15; Fri, 5 Jul 2019 15:37:40 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 15:37:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v2] x86/mm: Clean IOMMU flags from p2m-pt code
Thread-Index: AQHVMZ3eVPiN3NnZMUe+cwMyPT0RlKa8HFuAgAAGt4CAAAjXgA==
Date: Fri, 5 Jul 2019 15:37:40 +0000
Message-ID: <b28e2003-59a6-2239-ff41-37ac0b894a0c@suse.com>
References: <20190703125004.25451-1-aisaila@bitdefender.com>
 <0b68a345-9eeb-1f21-bd0e-8a12a3f0e126@suse.com>
 <b0bd291c-2408-5f64-446c-34abfaa3bf63@bitdefender.com>
In-Reply-To: <b0bd291c-2408-5f64-446c-34abfaa3bf63@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR06CA0034.eurprd06.prod.outlook.com
 (2603:10a6:10:100::47) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77e05308-da30-4667-860f-08d7015eb6e7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3233; 
x-ms-traffictypediagnostic: BY5PR18MB3233:
x-microsoft-antispam-prvs: <BY5PR18MB32330B601E3E125750EF2DB9B3F50@BY5PR18MB3233.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(199004)(189003)(80792005)(256004)(72206003)(229853002)(6436002)(2906002)(31686004)(6486002)(2616005)(53936002)(25786009)(476003)(478600001)(6512007)(76176011)(68736007)(14454004)(11346002)(6246003)(66066001)(446003)(8676002)(102836004)(7736002)(6916009)(386003)(71190400001)(6506007)(66476007)(5660300002)(64756008)(486006)(66946007)(66446008)(66556008)(73956011)(81166006)(52116002)(81156014)(71200400001)(8936002)(26005)(36756003)(4326008)(4744005)(3846002)(305945005)(53546011)(54906003)(31696002)(86362001)(316002)(6116002)(186003)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3233;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3sqBoxKqe1r9IZPKF0GkyOkwNzHzyLQSGplW+LGwy1hS2yAkmy2ZQ30ocdOnJOom93nnStXyRipJOHEfh9fO7+YlFMWjhIbG8Q9nYbfudzWKeS1Tz9gZRFjlbpJ9HWN769mgW9WLJ7ye8Y6TlCUNLtTX+5WiyPTt86oYWIefm9rHmpM6IAIEQ1JW33MFvB4yLPqMeQVxt0Um3vMqyyrMSEye9/TPC2H4QUSjZWB60umTknn6ntstq36Yf4zTiLbPcsplr0Iv1vqCc//Wlf5zR3vFeR9ry3NQFQvbChPTlSkRi8HAbMlUJupvMI0XwcLDpsdnhZPJIlcSwEBJw3CIIRfs/5uS/Ji6EuPqdYnVd6VYlWrBNeLPmnCJclFLZZ7VdL5REV5Tki+BnjLgIH9AeeIVlozIYQHDiFqaxvMz9+g=
Content-ID: <8E57E4501D5B3E4CBB5373203DB7B42E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e05308-da30-4667-860f-08d7015eb6e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 15:37:40.5443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3233
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] x86/mm: Clean IOMMU flags from p2m-pt
 code
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
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDcuMjAxOSAxNzowNiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+PiBP
biAwMy4wNy4yMDE5IDE0OjUwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEFu
ZCB0aGVuIEkgd291bGQgb2YgY291cnNlIGhhdmUgd2lzaGVkIHRoYXQgYSBjbGVhbnVwIHBhdGNo
IGxpa2UgdGhpcw0KPj4gb25lIGRlYWx0IHdpdGggYm90aCBzaWRlcywgaS5lLiByZW1vdmVkIHB0
IHNoYXJpbmcgcmVtYWlucyBmcm9tDQo+PiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvIGF0
IHRoZSBzYW1lIHRpbWUgKGkuZS4gaWYgbm90IGluIG9uZQ0KPj4gcGF0Y2gsIHRoZW4gYXQgbGVh
c3QgaW4gdGhlIHNhbWUgc2VyaWVzKS4gQnV0IHRoaXMgbWF5IGFnYWluIGJlIGp1c3QNCj4+IG1l
IC4uLg0KPiANCj4gSnVzdCB0byBjbGFyaWZ5LCBhcmUgeW91IHRhbGtpbmcgYWJvdXQgdGhlIGFt
ZF9pb21tdV9zaGFyZV9wMm0oKQ0KPiBmdW5jdGlvbiB0aGF0IHdpbGwgbm90IGJlIGNhbGxlZCBh
bnkgbW9yZSBpZiB0aGUgaW9tbXVfaGFwX3B0X3NoYXJlIGZsYWcNCj4gd2lsbCBiZSBkZWxldGVk
PyBJZiBzbyBJIGNhbiBhZGQgdGhpcyBpbiBhIDIgcGF0Y2ggc2VyaWVzLg0KDQpUaGF0IGFuZCB0
aGVyZSBhcmUgYSBjb3VwbGUgb2YgaW9tbXVfdXNlX2hhcF9wdCgpIHVzZXMgdGhhdCBzaG91bGQN
CmJlIGRlbGV0ZWQgb3IgaGF2ZSBBU1NFUlRfVU5SRUFDSEFCTEUoKSBhZGRlZC4gSSBkaWRuJ3Qg
Y2hlY2sNCmZ1cnRoZXIuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
