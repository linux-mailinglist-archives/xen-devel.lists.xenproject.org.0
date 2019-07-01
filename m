Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE65BAFE
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 13:50:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhumj-0005It-5z; Mon, 01 Jul 2019 11:47:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhumh-0005Io-85
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 11:47:47 +0000
X-Inumbo-ID: 0a09c77a-9bf6-11e9-b96b-0f5603c5ae16
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a09c77a-9bf6-11e9-b96b-0f5603c5ae16;
 Mon, 01 Jul 2019 11:47:45 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 11:44:10 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:47:08 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:47:08 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3137.namprd18.prod.outlook.com (10.255.136.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 11:47:06 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:47:06 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/6] x86emul: further work
Thread-Index: AQHVMAK16Ej1nJLcOUCzei/GD+/BMw==
Date: Mon, 1 Jul 2019 11:47:06 +0000
Message-ID: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:2e::34)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70dbd433-1bdf-43f9-b3c3-08d6fe19d769
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3137; 
x-ms-traffictypediagnostic: BY5PR18MB3137:
x-microsoft-antispam-prvs: <BY5PR18MB31373C3DEFBD6F2137DD4BABB3F90@BY5PR18MB3137.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(2351001)(186003)(8676002)(2906002)(102836004)(54906003)(256004)(6512007)(6916009)(71190400001)(2501003)(66946007)(66556008)(66476007)(81156014)(53936002)(3846002)(6116002)(71200400001)(80792005)(305945005)(4326008)(81166006)(6506007)(26005)(386003)(486006)(31696002)(558084003)(73956011)(64756008)(66446008)(2616005)(36756003)(476003)(5640700003)(5660300002)(68736007)(6436002)(31686004)(86362001)(7736002)(478600001)(25786009)(72206003)(99286004)(8936002)(14454004)(316002)(6486002)(52116002)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3137;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3FXVnL8c0JRfqqEhVygEGGvNCiLpfeazihbdtQN4dJcA545S0AXeSBAkLT6Gyv4koXpG3hfUUMrxXbkAQ+PjLQvvTauXaFbBJlqzlnZiptxkLSlYxEsIJxhTk09W4KGfmcXPDYIbcXRZ5YkaM09/bVJ513F6GpyuzKB8KpKBSpnaZaAi3XubqjJHN6EY9HW+icUR8BeV8EZbNOfn29t2GfqVZ29cPFdIbpMgzEQLPkdTLFZlCr35QI9V9OyxZE2FGH7zBFOVcb/vvPr3eCrW4gC9N+z20OBNCQLvgtj0WYlhljQv2hmRugyaMTeschZs/dsLo/de59juhhsNqVVdW1Jz8pCTYhl9+8fUL241wWRw2fOAQq97vL/sqwBVkmIL4o5KORIBrlA0Oy4bcpGEqs41JhgW1Iez4r63BoOdtIk=
Content-ID: <6EED5ED07026B44F8102AED740F4EE26@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dbd433-1bdf-43f9-b3c3-08d6fe19d769
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:47:06.3228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3137
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH 0/6] x86emul: further work
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gdG9wIG9mIHRoZSBBVlg1MTIgc2VyaWVzIEknZCBsaWtlIHRvIHB1dCBvdXQgZm9yIHJldmll
dy9kaXNjdXNzaW9uDQoNCjE6IGdlbmVyYWxpemUgd2JpbnZkKCkgaG9vaw0KMjogc3VwcG9ydCBX
Qk5PSU5WRA0KMzogZ2VuZXJhbGl6ZSBpbnZscGcoKSBob29rDQo0OiBtb3ZlIElOVlBDSURfVFlQ
RV8qIHRvIHg4Ni1kZWZucy5oDQo1OiBzdXBwb3J0IElOVlBDSUQNCjY6IHN1cHBvcnQgTU9WRElS
e0ksNjRCfSBpbnNucw0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
