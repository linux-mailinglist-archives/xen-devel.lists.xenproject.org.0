Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931DD603C1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 12:04:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjL1R-00031q-CP; Fri, 05 Jul 2019 10:00:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjL1Q-00031l-3P
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 10:00:52 +0000
X-Inumbo-ID: c32a2d4a-9f0b-11e9-b744-a782c99ea385
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c32a2d4a-9f0b-11e9-b744-a782c99ea385;
 Fri, 05 Jul 2019 10:00:49 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 09:57:09 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 10:00:34 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 10:00:34 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3300.namprd18.prod.outlook.com (10.255.137.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 10:00:33 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 10:00:33 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/ctxt-switch: Document and improve GDT handling
Thread-Index: AQHVMpH8SeWAGO01pk2vNreD2pOjXKa7y8+A
Date: Fri, 5 Jul 2019 10:00:33 +0000
Message-ID: <b6372724-920c-5798-8615-55c1e992b97b@suse.com>
References: <20190704175732.5943-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190704175732.5943-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0104.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:44::45) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 604c1da9-70ab-4288-15b4-08d7012f9e59
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3300; 
x-ms-traffictypediagnostic: BY5PR18MB3300:
x-microsoft-antispam-prvs: <BY5PR18MB3300A98A76FC3AFD6DE495FBB3F50@BY5PR18MB3300.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(199004)(189003)(66946007)(73956011)(66476007)(99286004)(3846002)(6512007)(53936002)(6116002)(486006)(52116002)(76176011)(64756008)(68736007)(66556008)(66446008)(36756003)(476003)(2616005)(72206003)(446003)(71190400001)(71200400001)(31686004)(11346002)(2906002)(80792005)(14454004)(6246003)(7736002)(305945005)(478600001)(8936002)(102836004)(81166006)(110136005)(54906003)(81156014)(8676002)(316002)(6486002)(256004)(6436002)(53546011)(386003)(6506007)(4326008)(186003)(66066001)(229853002)(86362001)(31696002)(14444005)(5660300002)(26005)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3300;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iFp459hVhBA33e/fp+kkWWJwVOsKwVNe4dDcv+wFZmVD07dFAcbIrDmjL4nxtLWGfeNktJAsOWSPAYTvKGWtACTPhznCmdudJYPjaujO6vk4KQizn1KxgM38BOw1KwBIoc/MUQpCXq3R60b9r6YvQA98dncQ5cxIJpEo3Upqp4faDcaLeg/zwO/e3mnY77Hu0ak7DUo64OpZ9hl318vZT+pLkQ5Y6f4z9sJGPDcoB1lvZ966cP+voJ3vVUnLBzeCUfhsd4SftwGeDyRlCTR3fSBOBfn56FHR6EK5HxgMh9mgjkDri1CXQ9wGMQQ6BP+WLTXHYVY/85W9DW6fh0g6yUShRhhUmmLO/rlFPn7WEwMTp18dhqYarvWVXvCvNoUyjyqNQ/E3ro+Txshuo/XiAn7CAv5N4UC7PfvUTqOLWgQ=
Content-ID: <1C621E57BC94FF42BF509EE1235F96CB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 604c1da9-70ab-4288-15b4-08d7012f9e59
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 10:00:33.3550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3300
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/ctxt-switch: Document and improve GDT
 handling
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
Cc: Juergen Gross <JGross@suse.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDcuMjAxOSAxOTo1NywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gd3JpdGVfZnVsbF9n
ZHRfcHRlcygpIGhhcyBhIGxhdGVudCBidWcuICBVc2luZyB2aXJ0X3RvX21mbigpIGFuZCBpdGVy
YXRpbmcNCj4gd2l0aCAobWZuICsgaSkgaXMgd3JvbmcsIGJlY2F1c2Ugb2YgUERYIGNvbXByZXNz
aW9uLiAgVGhlIGNvbnRleHQgc3dpdGNoIHBhdGgNCj4gb25seSBmdW5jdGlvbnMgY29ycmVjdGx5
IGJlY2F1c2UgTlJfUkVTRVJWRURfR0RUX1BBR0VTIGlzIDEuDQoNCldoZXRoZXIgdGhpcyBpcyBh
IChsYXRlbnQpIGJ1ZyBkZXBlbmRzIG9uIGhvdyB0aGUgYWxsb2NhdGlvbiBnZXRzDQpkb25lLiBB
cyBsb25nIGFzIGl0J3MgYSBzaW5nbGUgYWxsb2NfeGVuaGVhcF9wYWdlcygpLCB0aGlzIGlzDQpw
ZXJmZWN0bHkgZmluZS4gVGhlcmUgYXJlIG5vIGluZGl2aWR1YWwgYWxsb2NhdGlvbnMgd2hpY2gg
Y2FuIHNwYW4NCmEgUERYIGNvbXByZXNzaW9uIGhvbGUgKG9yIGVsc2UgTUZOIG9yIHN0cnVjdCBw
YWdlIHBvaW50ZXINCmFyaXRobWV0aWMgd291bGRuJ3Qgd29yayBlaXRoZXIsIGluZGVwZW5kZW50
IG9mIHRoZSBpbnZvbHZlbWVudCBvZg0KYSB2aXJ0dWFsIGFkZHJlc3MpLg0KDQo+IEFsc28sIGl0
IHNob3VsZCBub3cgYmUgdmVyeSBvYnZpb3VzIHRvIHBlb3BsZSB0aGF0IFhlbidzIGN1cnJlbnQg
R0RUIGhhbmRsaW5nDQo+IGZvciBub24tUFYgdmNwdXMgaXMgYSByZWNpcGUgc3VidGxlIGJ1Z3Ms
IGlmIHdlIGV2ZXIgbWFuYWdlIHRvIGV4ZWN1dGUgYSBzdHJheQ0KPiBtb3YvcG9wICVzcmVnIGlu
c3RydWN0aW9uLiAgV2UgcmVhbGx5IG91Z2h0IHRvIGhhdmUgWGVuJ3MgcmVndWxhciBHRFQgaW4g
YW4NCj4gYXJlYSB3aGVyZSBzbG90cyAwLTEzIGFyZSBlaXRoZXIgbWFwcGVkIHRvIHRoZSB6ZXJv
IHBhZ2UsIG9yIG5vdCBwcmVzZW50LCBzbw0KPiB3ZSBkb24ndCByaXNrIGxvYWRpbmcgYSBub24t
ZmF1bHRpbmcgZ2FyYmFnZSBzZWxlY3Rvci4NCg0KV2VsbCwgdGhlcmUncyBjZXJ0YWlubHkgcm9v
bSBmb3IgaW1wcm92ZW1lbnQsIGJ1dCBsb2FkaW5nIGEgc3RyYXkNCnNlbGVjdG9yIHNlZW1zIHBy
ZXR0eSB1bmxpa2VseSBhbiBldmVudCB0byBoYXBwZW4sIGFuZCB0aGUNCnJlc3BlY3RpdmUgY29k
ZSBoYXZpbmcgZ290IHNsaXBwZWQgaW4gd2l0aG91dCBhbnlvbmUgbm90aWNpbmcuDQpPdGhlciB0
aGFuIGluIGNvbnRleHQgc3dpdGNoaW5nIGNvZGUgSSBkb24ndCB0aGluayB0aGVyZSBhcmUgbWFu
eQ0KcGxhY2VzIGF0IGFsbCB3aGVyZSB3ZSB3cml0ZSB0byB0aGUgc2VsZWN0b3IgcmVnaXN0ZXJz
Lg0KDQo+IEBAIC0xNzE4LDE1ICsxNzM3LDEyIEBAIHN0YXRpYyB2b2lkIF9fY29udGV4dF9zd2l0
Y2godm9pZCkNCj4gICANCj4gICAgICAgcHNyX2N0eHRfc3dpdGNoX3RvKG5kKTsNCj4gICANCj4g
LSAgICBnZHQgPSAhaXNfcHZfMzJiaXRfZG9tYWluKG5kKSA/IHBlcl9jcHUoZ2R0X3RhYmxlLCBj
cHUpIDoNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBlcl9jcHUoY29t
cGF0X2dkdF90YWJsZSwgY3B1KTsNCj4gLQ0KPiAgICAgICBpZiAoIG5lZWRfZnVsbF9nZHQobmQp
ICkNCj4gLSAgICAgICAgd3JpdGVfZnVsbF9nZHRfcHRlcyhnZHQsIG4pOw0KPiArICAgICAgICB1
cGRhdGVfeGVuX3Nsb3RfaW5fZnVsbF9nZHQobiwgY3B1KTsNCj4gICANCj4gICAgICAgaWYgKCBu
ZWVkX2Z1bGxfZ2R0KHBkKSAmJg0KPiAgICAgICAgICAgICgocC0+dmNwdV9pZCAhPSBuLT52Y3B1
X2lkKSB8fCAhbmVlZF9mdWxsX2dkdChuZCkpICkNCj4gLSAgICAgICAgbG9hZF9kZWZhdWx0X2dk
dChnZHQsIGNwdSk7DQo+ICsgICAgICAgIGxvYWRfZGVmYXVsdF9nZHQoY3B1KTsNCg0KIEZyb20g
bG9va2luZyBhdCB0aGlzIHRyYW5zZm9ybWF0aW9uIEkgY2Fubm90IHNlZSBob3csIGFzIHNhaWQg
aW4NCnRoZSBkZXNjcmlwdGlvbiBhbmQgYXMgZXhwcmVzc2VkIGJ5IHJlbW92aW5nIHRoZSBnZHQg
cGFyYW1ldGVyDQpmcm9tIGxvYWRfZGVmYXVsdF9nZHQoKSwgdGhlIGdkdCBoYXZpbmcgZ290IHBh
c3NlZCBpbiBoZXJlIHdvdWxkDQphbHdheXMgaGF2ZSBiZWVuIHBlcl9jcHUoZ2R0X3RhYmxlLCBj
cHUpLiBJdCBwcmV0dHkgY2xlYXJseSB3YXMNCnRoZSBjb21wYXQgb25lIGZvciBuZCBiZWluZyAz
Mi1iaXQgUFYuIFdoYXQgYW0gSSBtaXNzaW5nPyBPciBpcw0KdGhlIGRlc2NyaXB0aW9uIHBlcmhh
cHMgaW5zdGVhZCBtZWFuaW5nIHRvIHNheSB0aGF0IGl0IGRvZXNuJ3QNCl9uZWVkXyB0byBiZSB0
aGUgY29tcGF0IG9uZSB0aGF0IHdlIGxvYWQgaGVyZSwgYXMgaW4gY2FzZSBpdCBpcw0KdGhlIHN1
YnNlcXVlbnQgbG9hZF9mdWxsX2dkdCgpIHdpbGwgcmVwbGFjZSBpdCBhZ2FpbiBhbnl3YXk/DQoN
Cj4gQEAgLTIwNTksNiArMjA2MSwxNCBAQCB2b2lkIF9faW5pdCB0cmFwX2luaXQodm9pZCkNCj4g
ICAgICAgICAgIH0NCj4gICAgICAgfQ0KPiAgIA0KPiArICAgIC8qIENhY2hlIHssY29tcGF0X31n
ZHRfdGFibGVfbDFlIG5vdyB0aGF0IHBoeXNpY2FsbHkgcmVsb2NhdGlvbiBpcyBkb25lLiAqLw0K
DQoicGh5c2ljYWwgcmVsb2NhdGlvbiIgb3IgInBoeXNpY2FsbHkgcmVsb2NhdGluZyI/DQoNCkph
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
