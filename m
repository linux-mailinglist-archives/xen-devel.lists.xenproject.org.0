Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5538F5B97D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 12:53:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhttC-0006iq-Pi; Mon, 01 Jul 2019 10:50:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhttB-0006ik-C0
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 10:50:25 +0000
X-Inumbo-ID: b801fb64-9bed-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b801fb64-9bed-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 10:50:23 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 10:48:07 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 10:47:22 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 10:47:22 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3410.namprd18.prod.outlook.com (10.255.139.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Mon, 1 Jul 2019 10:47:21 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 10:47:21 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Petre Ovidiu PIRCALABU
 <ppircalabu@bitdefender.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] vfree crash
Thread-Index: AQHVLdtKR3tMnDvHzU6ntSjZrlUsUaa1cLWAgAAGYACAAANV/oAAHoaA
Date: Mon, 1 Jul 2019 10:47:20 +0000
Message-ID: <e76f8645-5963-3df6-320c-37cd16455372@suse.com>
References: <19d3bbfa82ffe542367c676d83db65e37d013544.camel@bitdefender.com>
 <e277e40ad1c54b209a6f6107cbfaf5a0@AMSPEX02CL03.citrite.net>
 <527abac0d7a9a25bb69c7af30afa8ab209c90737.camel@bitdefender.com>
 <f753b819-d5eb-f627-3520-38c36e6d48d2@citrix.com>
In-Reply-To: <f753b819-d5eb-f627-3520-38c36e6d48d2@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0075.eurprd03.prod.outlook.com
 (2603:10a6:10:72::16) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e55f8d7f-c783-4a8a-cb94-08d6fe117e40
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3410; 
x-ms-traffictypediagnostic: BY5PR18MB3410:
x-microsoft-antispam-prvs: <BY5PR18MB341007669CFBCEB9AF4B6085B3F90@BY5PR18MB3410.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(199004)(189003)(99286004)(68736007)(102836004)(72206003)(53936002)(4326008)(256004)(6246003)(486006)(478600001)(8676002)(25786009)(5660300002)(305945005)(2501003)(476003)(36756003)(386003)(53546011)(7736002)(6436002)(229853002)(81166006)(316002)(6486002)(76176011)(54906003)(110136005)(2616005)(3846002)(6506007)(11346002)(26005)(6116002)(81156014)(52116002)(8936002)(31696002)(14454004)(31686004)(6512007)(71200400001)(71190400001)(66066001)(80792005)(66556008)(66946007)(2906002)(66446008)(64756008)(73956011)(66476007)(186003)(86362001)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3410;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QX2+8NIrbfWrquLPupBIeGTVy5250cGo/Qlzh6Bb6wM2b9ePuKcspFc6aDHAc0HjRRedFFgeBYOBai/iae9w6VbASCAnFBc7AwqVUCH88FVFikmsRRCbG0Ix1UB+eaYhVIDIQLaQtQBsN89EnFux8L29tE2ACY1bj4BOe1Bsd46wd/xByG2dl+oE6JYYVuoXoCHek/Fi/YiGFLNY+kmrylmwwqTFwEPr8irO9fSkqlh8hSCp44EtI3m3MwOm+FqGcwRKw78S1EBgr7vREQg5lD7udbwMHfMkL+GVBYpAEz+VJmqBWjYPoDJ6SNl+c4N5eLnMWJAwuikMe8ljKaBV90pCe7Def1kecDNXbT3OLPS7LUYxY0ZLY4s1GSaMmglormywpME0JjHniLFN4JUWzso21rpd10X0Kq6c0MHHSrQ=
Content-ID: <4DFAEFB931B88B48920B5B85007106DA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e55f8d7f-c783-4a8a-cb94-08d6fe117e40
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 10:47:20.9176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3410
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] vfree crash
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
Cc: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxMDo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDEvMDcvMjAx
OSAwOTo0NSwgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToNCj4+IFRoZSBwcm9ibGVtIGxp
ZXMgd2l0aCB2ZnJlZSBiZWNhdXNlIGl0IGNyZWF0ZXMgYSBuZXcgbGlzdCB3aXRoIHRoZQ0KPj4g
cGFnZXMsIHVubWFwcyB0aGUgdmEgcG9pbnRlciBhbmQgdGhlbiBmcmVlcyB0aGUgcGFnZXMuIElm
IEkgZG8gdGhlc2UNCj4+IHN0ZXBzIG1hbnVhbGx5ICh3aXRob3V0IGFkZGluZyB0aGVtIHRvIGEg
bmV3IGxpc3QpIGl0IHdvcmtzLg0KPiANCj4gVGhlIHByb2JsZW0gaGVyZSBpcyB0aGF0IHN0cnVj
dCBwYWdlX2luZm8gb25seSBoYXMgYSBzaW5nbGUgbGlua2VkIGxpc3QNCj4gcG9pbnRlciwgYW5k
IHZmcmVlKCkgYmxpbmRseSBhc3N1bWVzIGl0IGlzIGF2YWlsYWJsZSBmb3IgdXNlLCB3aGljaA0K
PiBpc24ndCB0cnVlIG9uY2UgeW91J3ZlIGNhbGxlZCBhc3NpZ25fcGFnZXMoKSBvbiB0aGUgdm1h
cCBhcmVhLg0KPiANCj4gQXQgdGhlIG1vbWVudCwgaXQgZG9lc24ndCBsb29rIGxpa2UgaXQgaXMg
cG9zc2libGUgdG8gc2V0IHYqYWxsb2MoKSdkDQo+IHBhZ2VzIHVwIHN1aXRhYmx5IHRvIGJlIG1h
cHBlZCBieSBhIGd1ZXN0LsKgIChTaW1pbGFyIGNvcnJ1cHRpb24gd2lsbA0KPiBvY2N1ciB2aWEg
c2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCgpIGFuZCB0aGUgeGVuaGVhcCBsaXN0KS4NCg0KV2Vs
bCwgd2hvZXZlciBhc3NpZ25zIHBhZ2VzIHRvIGEgZG9tYWluIGJlaGluZCB2bWFsbG9jKCkncyBi
YWNrIGhhcyBnb3QNCnRvIG1ha2Ugc3VyZSB0byBkZS1hc3NpZ24gdGhvc2UgcGFnZXMgYmVmb3Jl
IGZyZWVpbmcgdGhlbS4gQW4gYWx0ZXJuYXRpdmUNCl9taWdodF8gYmUgdG8gbGVhdmUgZnJlZWlu
ZyB0byB0aGUgbm9ybWFsIGNsZWFudXAgcHJvY2Vzc2VzICh3aGVuIHRoZQ0KbGFzdCBwYWdlIHJl
ZiBnZXRzIHB1dCksIGFuZCBqdXN0IHZ1bm1hcCgpLWluZyB0aGUgcmFuZ2Ugd2hlbiB0aGUgbWFw
cGluZw0KaXNuJ3QgbmVlZGVkIGFueW1vcmUuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
