Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907585BA73
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 13:17:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhuG5-00008i-2b; Mon, 01 Jul 2019 11:14:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhuG3-00008d-Kz
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 11:14:03 +0000
X-Inumbo-ID: 52ce85c2-9bf1-11e9-9346-834a5bf3ec97
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52ce85c2-9bf1-11e9-9346-834a5bf3ec97;
 Mon, 01 Jul 2019 11:13:59 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 11:13:54 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:13:28 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:13:28 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3186.namprd18.prod.outlook.com (10.255.137.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 11:13:27 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:13:27 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 00/23] x86emul: remaining AVX512 support
Thread-Index: AQHVL/4BusDdmQSOHUaMCbTXiIXEsA==
Date: Mon, 1 Jul 2019 11:13:27 +0000
Message-ID: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR02CA0026.eurprd02.prod.outlook.com
 (2603:10a6:6:15::39) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45c191cd-3aa2-40b3-db28-08d6fe152402
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3186; 
x-ms-traffictypediagnostic: BY5PR18MB3186:
x-microsoft-antispam-prvs: <BY5PR18MB3186F19173C82E44EF4D982CB3F90@BY5PR18MB3186.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(199004)(189003)(5660300002)(68736007)(7736002)(86362001)(66066001)(6436002)(31686004)(386003)(26005)(31696002)(5640700003)(476003)(2616005)(66446008)(64756008)(73956011)(36756003)(316002)(72206003)(478600001)(99286004)(14454004)(25786009)(8936002)(6486002)(486006)(6916009)(4744005)(6506007)(66556008)(66476007)(71190400001)(66946007)(2501003)(186003)(2906002)(102836004)(2351001)(8676002)(256004)(14444005)(6512007)(54906003)(305945005)(4326008)(81166006)(81156014)(80792005)(53936002)(3846002)(52116002)(6116002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3186;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5CH+GkVqtLtj8q+3lbd/iKnT94Z2sR/R7pdFIPVlllp0kYph9Z71sMv8LLendrbP6ueuuH62BbcAfg8inn0AxPVTjx1E4mXq/pp8ZRzfkaHxROjwbkbo7XyEcGI1lw4ChOdUPkTF+BXWlGGNeVV1oohse5f08Bgvgsl2E09KBayZmUJStdj769odiy7YVTbhVR/YwRqM96d3ASWqMVUpy9Nbtojin6OBt9fF3Oyhacyc2HsSh/qnWhWWMY+77KO1WkC4W3DT4ffgGnhAl9vH6/qhkbYVQOAiBoI+om1iQbTomTt/fr4usCvg7P+Doxp1GBBkDAt6kCSG2tVJpk+815x47Qc6NiGu3H9G753LBb8YBUul7/tDO4xCHojhZqu7mv/p8HCqzgjNY88C4a9g6WtDzB+V6c9Rt/zQIh/yv84=
Content-ID: <584A27CE13D6004391D2BBAAFB7C36D4@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c191cd-3aa2-40b3-db28-08d6fe152402
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:13:27.3897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3186
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v9 00/23] x86emul: remaining AVX512 support
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBnb2VzIG9uIHRvcCBvZiAieDg2ZW11bDogYXZvaWQgc3BlY3VsYXRpdmUgb3V0IG9mIGJv
dW5kcw0KYWNjZXNzZXMiLCBvciBlbHNlIHRoZXJlJ3MgYSBjb25mbGljdCBpbiBhdCBsZWFzdCB0
aGUgImdhdGhlciIgcGF0Y2gNCmhlcmUuDQoNCjAxOiBzdXBwb3J0IEFWWDUxMntGLF9WQk1JMn0g
Y29tcHJlc3MvZXhwYW5kIGluc25zDQowMjogc3VwcG9ydCByZW1haW5pbmcgbWlzYyBBVlg1MTJ7
RixCV30gaW5zbnMNCjAzOiBwcmVwYXJlIGZvciBBVlg1MTJGIFMvRyBpbnNucw0KMDQ6IHRlc3Qg
aGFybmVzcyBhZGp1c3RtZW50cyBmb3IgQVZYNTEyRiBTL0cgaW5zbnMNCjA1OiBzdXBwb3J0IEFW
WDUxMkYgZ2F0aGVyIGluc25zDQowNjogYWRkIGhpZ2ggcmVnaXN0ZXIgUy9HIHRlc3QgY2FzZXMN
CjA3OiBzdXBwb3J0IEFWWDUxMkYgc2NhdHRlciBpbnNucw0KMDg6IHN1cHBvcnQgQVZYNTEyUEYg
aW5zbnMNCjA5OiBzdXBwb3J0IEFWWDUxMkNEIGluc25zDQoxMDogY29tcGxldGUgc3VwcG9ydCBv
ZiBBVlg1MTJfVkJNSSBpbnNucw0KMTE6IHN1cHBvcnQgb2YgQVZYNTEyKiBwb3B1bGF0aW9uIGNv
dW50IGluc25zDQoxMjogc3VwcG9ydCBvZiBBVlg1MTJfSUZNQSBpbnNucw0KMTM6IHN1cHBvcnQg
cmVtYWluaW5nIEFWWDUxMl9WQk1JMiBpbnNucw0KMTQ6IHN1cHBvcnQgQVZYNTEyXzRGTUFQUyBp
bnNucw0KMTU6IHN1cHBvcnQgQVZYNTEyXzRWTk5JVyBpbnNucw0KMTY6IHN1cHBvcnQgQVZYNTEy
X1ZOTkkgaW5zbnMNCjE3OiBzdXBwb3J0IFZQQ0xNVUxRRFEgaW5zbnMNCjE4OiBzdXBwb3J0IFZB
RVMgaW5zbnMNCjE5OiBzdXBwb3J0IEdGTkkgaW5zbnMNCjIwOiByZXN0b3JlIG9yZGVyaW5nIHdp
dGhpbiBtYWluIHN3aXRjaCBzdGF0ZW1lbnQNCjIxOiBhZGQgYW4gQUVTL1ZBRVMgdGVzdCBjYXNl
IHRvIHRoZSBoYXJuZXNzDQoyMjogYWRkIGEgU0hBIHRlc3QgY2FzZSB0byB0aGUgaGFybmVzcw0K
MjM6IGFkZCBhIFBDTE1VTC9WUENMTVVMIHRlc3QgY2FzZSB0byB0aGUgaGFybmVzcw0KDQpKYW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
