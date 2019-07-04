Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEF55F64C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 12:05:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiyZq-0003OE-GW; Thu, 04 Jul 2019 10:02:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiyZo-0003NT-RN
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 10:02:52 +0000
X-Inumbo-ID: ded37520-9e42-11e9-a219-bbe02b6b96b6
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ded37520-9e42-11e9-a219-bbe02b6b96b6;
 Thu, 04 Jul 2019 10:02:48 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 10:02:24 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 10:01:50 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 10:01:49 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3252.namprd18.prod.outlook.com (10.255.136.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 4 Jul 2019 10:01:48 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 10:01:48 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 12/15] x86/IRQ: add explicit tracing-enabled check to
 trace_irq_mask()
Thread-Index: AQHVMk9+x2GXh8K5OEuc6s3MDPCtpg==
Date: Thu, 4 Jul 2019 10:01:48 +0000
Message-ID: <62684b4d-e844-61e0-8677-2d839b7c184c@suse.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE924602000078002300B7@prv1-mh.provo.novell.com>
 <515e8701-efbb-5388-2407-9ce0834bdd4e@citrix.com>
In-Reply-To: <515e8701-efbb-5388-2407-9ce0834bdd4e@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR02CA0027.eurprd02.prod.outlook.com
 (2603:10a6:10:52::40) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc3fb123-b425-49bd-9f0d-08d70066a0f6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3252; 
x-ms-traffictypediagnostic: BY5PR18MB3252:
x-microsoft-antispam-prvs: <BY5PR18MB3252D5088357258DFAD2E371B3FA0@BY5PR18MB3252.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(189003)(199004)(52314003)(11346002)(68736007)(6246003)(446003)(2616005)(8676002)(53936002)(476003)(81166006)(81156014)(7736002)(305945005)(14454004)(66066001)(6436002)(256004)(6486002)(25786009)(2906002)(229853002)(6512007)(72206003)(478600001)(54906003)(31686004)(4326008)(71190400001)(71200400001)(486006)(36756003)(31696002)(3846002)(102836004)(386003)(53546011)(186003)(86362001)(5660300002)(26005)(110136005)(6506007)(73956011)(66476007)(66946007)(316002)(80792005)(66446008)(64756008)(66556008)(52116002)(99286004)(4744005)(76176011)(8936002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3252;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m73CmgTkph1w8GdXyp293XjF80qQV0LHOlBCQKQUiMdmSMDJ2uSqbIAjNv4dKbeSS20DOnlLWkGFMoxDeTGhwRLgulHtDvBV9rlBX+cFbLbYjKVKwipmuP0h+mGYoOq89QLiOCrB4A4Q03JoePy1tee5Odv1TKvyZfS9tO5OXnuSbUaXlw1O59bIGSDiMjlUunplAtNYnSPPn8GgRbS7WIqGMdaqjA+O0CrZ7DXBRcqnMXR+brkxfdsGxM7TQcOnsnKawLMtZwjb/r1M+jU987Zq3527cJURa8c4PuTTPjpjrnYNwSuMJ222Ucm/WQnWE+VIQxiYmLbkHzC7qbqWMYpq/OU7F+RR/p7iH2AGlQaxAUons8Ttdm6z5IABLLweXCfVc0gw2LuLRw9woDwYOPpi+q5IctwXdeb5aZKleKQ=
Content-ID: <5AE60D08C126CD4DA5007AC108FCBC17@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3fb123-b425-49bd-9f0d-08d70066a0f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 10:01:48.6514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3252
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 12/15] x86/IRQ: add explicit
 tracing-enabled check to trace_irq_mask()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAyMDo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDUvMjAx
OSAxMTo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMN
Cj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYw0KPj4gQEAgLTEzNyw2ICsxMzcsMTMgQEAgc3Rh
dGljIHZvaWQgdHJhY2VfaXJxX21hc2sodWludDMyX3QgZXZlbg0KPj4gICAgICAgdHJhY2VfdmFy
KGV2ZW50LCAxLCBzaXplb2YoZCksICZkKTsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgdHJhY2VfaXJxX21hc2sodWludDMyX3QgZXZlbnQsIGludCBpcnEsIGludCB2ZWN0
b3IsDQo+IA0KPiBObyBpbmxpbmUuDQoNCldlbGwsIEkgdGhpbmsgaW4gY2FzZXMgbGlrZSB0aGlz
IG9uZSB3ZSByZWFsbHkgd2FudCBpdCwgYnV0IGFueXdheSwNCkknbGwgZHJvcCBpdCBqdXN0IHRv
IG1ha2UgcHJvZ3Jlc3MgaGVyZS4NCg0KPsKgIE90aGVyd2lzZSwgQWNrZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClRoYW5rcywgSmFuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
