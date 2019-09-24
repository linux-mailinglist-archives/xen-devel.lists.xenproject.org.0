Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C5BC298
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 09:28:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCfAZ-0001Pk-C1; Tue, 24 Sep 2019 07:23:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DFh+=XT=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1iCfAY-0001Pf-In
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 07:23:30 +0000
X-Inumbo-ID: 328aab72-de9c-11e9-960d-12813bfff9fa
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.104]) by localhost (Halon) with ESMTPS
 id 328aab72-de9c-11e9-960d-12813bfff9fa;
 Tue, 24 Sep 2019 07:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTe30xLLToKHmzTTtf/z5skcTp6tyC6J/74qyUx4hm5yd3iJLTMXf2YSWCNG3xKK3diYIMjjnvBNEFwNU2TQAGgPyApV6Q+5ra5XWnAnrmoRBZh/OKMiM71YXnRA+Trc+GyRoYHGsuB2B3Tmy4UaJaRqQtL23t28RgYoiUInjLLJy1e6pk1V0A6dM4zt5ct0PCmwPkSaf7+WJj9AIfubM2SZUXAndHHuj91p0WkO5wajYSHEbsHM4qnJ8CswoduUZsC1a9bMYkA7EeqKm4hyjJvPAiI8QQ515egX0VJjDgZYbSrTanrG1n/MfcwjAfPbW+8OeR4hrgzbEqymFiiNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtzkhMwKm+ASvNfynXHbY6DNHuK9Bw9VtkdOpyCIDsY=;
 b=WYSuBZ5BU0L04G1ECzCxfcXRvd7YTH0+yj7lQrWXoTtUD9Sb+/fGtbl1EeJyfSYCdKIjuZv/lRdNqStgstdOUsw87CFC3+9uYsxur/afEN6R7P8nUEL2Z2edB2Uzgqeu1PWhktdkPxp4nmkZHSVhQvKQQV6PzZ6D6rsno+U8qz+L69hx8EI76ZUKmsmp2dgQi8JsZrQzfOq5Cw8+sWhQWAe8W/f9XoeGSmbC7VCyEZD3xCAInMqiSXOFAAEgQs84tOZ6MaQ9gxAEzMOD4E7l47jZOMsCtpudmggBhQ2vcrwHckdmRsMUHgm+6xg7/sU4LWL/ZT2CrTzjTGP4ZvOkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtzkhMwKm+ASvNfynXHbY6DNHuK9Bw9VtkdOpyCIDsY=;
 b=U4vOI5we2OrbnRwKsCQRegio1ACYJ3mTBc35+/xVOSxR6tPKvJc7bOA0IbvChDZ85xcKH5CZSZE57Wa1ljPlFsOIVHNjvQRJhjFeKPVgUzbQhFjJJxyLne2YCVP1JEuWOY0WDMYYuZpDhtef8LvJUSXV6h5VZRJnCUxhKjW5gKs=
Received: from DB7PR02MB4490.eurprd02.prod.outlook.com (20.178.41.82) by
 DB7PR02MB4570.eurprd02.prod.outlook.com (20.178.41.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 07:23:24 +0000
Received: from DB7PR02MB4490.eurprd02.prod.outlook.com
 ([fe80::112c:58dc:ae42:1cc2]) by DB7PR02MB4490.eurprd02.prod.outlook.com
 ([fe80::112c:58dc:ae42:1cc2%6]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 07:23:22 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v13] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVcgc/RjZRGBRqJUWCjIFeFraK9Kc6bdKA
Date: Tue, 24 Sep 2019 07:23:22 +0000
Message-ID: <f5d3f67954f3a5017b5765e1fce75d15457506a0.camel@bitdefender.com>
References: <20190923120539.25242-1-aisaila@bitdefender.com>
In-Reply-To: <20190923120539.25242-1-aisaila@bitdefender.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR03CA0058.eurprd03.prod.outlook.com
 (2603:10a6:207:5::16) To DB7PR02MB4490.eurprd02.prod.outlook.com
 (2603:10a6:10:65::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3c61128-ddfc-4ac6-4718-08d740c014cb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB7PR02MB4570; 
x-ms-traffictypediagnostic: DB7PR02MB4570:|DB7PR02MB4570:|DB7PR02MB4570:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR02MB4570ED25AEFC8D6A639A5D3AD6840@DB7PR02MB4570.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(376002)(346002)(396003)(39860400002)(189003)(199004)(81166006)(6486002)(2616005)(476003)(25786009)(36756003)(386003)(6506007)(66556008)(66446008)(6246003)(229853002)(86362001)(99286004)(5660300002)(50226002)(81156014)(66476007)(2501003)(6512007)(4326008)(186003)(6436002)(64756008)(66066001)(26005)(52116002)(446003)(7736002)(11346002)(486006)(305945005)(71190400001)(8936002)(8676002)(256004)(102836004)(2906002)(478600001)(76176011)(54906003)(3846002)(6116002)(66946007)(14454004)(316002)(118296001)(71200400001)(110136005)(14444005)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB7PR02MB4570;
 H:DB7PR02MB4490.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c0zzmIiDsudRLL4WSyJhjA9FxzA1xhcB8agVy1D8NL6YOwIc4WqOHPjh+y9b6d/+4W4O9O0Y6x+VxmEWyDd7vsyutqHzOYIBtYW5odJOvyOP3l/ViEgkcXJUWT0Z7pHuAYF0FNaHbrheVTNS3JIAqg1OG9let5Uj95sIxW5stnnr7SgWiGVg4emhruoxspHK85YCCZ7xXT+xTSxhJA7i2dePkDjmhI0zYCNzqqV259723KIvqVCrtqW9fgFpc9C+ltV53RagsOrU752qKKzGW7RWfQ+78KDfVRZBiNB3g08itythWmiW/oGmyAhMqj4HqwYhtFhxNPvIXyFPVIgIeBz2nL2iUuFOSmVhDXmuc70MevS++s0kUBmEDlKjbCwjncGcyqyciNk2KGGldZhmpJIn1ZewQ1eSvWOUYcVTmiw=
Content-ID: <A50566522EA59B479588AF6265B5CDAB@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c61128-ddfc-4ac6-4718-08d740c014cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 07:23:22.7146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/uJv5l6Tr1GIRTTxEEoptVYCfSTJQLvdzXitkXI8V/4hHuCx7zxqny18+jt8xi++N/yzB2VMVvg8YF4w630MUA1fvw4VOEr58gSwLMUYYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4570
Subject: Re: [Xen-devel] [PATCH v13] x86/emulate: Send vm_event from emulate
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
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDE5LTA5LTIzIGF0IDE1OjA1ICswMzAwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlM
QSB3cm90ZToNCj4gQS9EIGJpdCB3cml0ZXMgKG9uIHBhZ2Ugd2Fsa3MpIGNhbiBiZSBjb25zaWRl
cmVkIGJlbmlnbiBieSBhbg0KPiBpbnRyb3NwZWN0aW9uDQo+IGFnZW50LCBzbyByZWNlaXZpbmcg
dm1fZXZlbnRzIGZvciB0aGVtIGlzIGEgcGVzc2ltaXphdGlvbi4gV2UgdHJ5DQo+IGhlcmUgdG8N
Cj4gb3B0aW1pemUgYnkgZmlsdGVyaW5nIHRoZXNlIGV2ZW50cyBvdXQuDQo+IEN1cnJlbnRseSwg
d2UgYXJlIGZ1bGx5IGVtdWxhdGluZyB0aGUgaW5zdHJ1Y3Rpb24gYXQgUklQIHdoZW4gdGhlDQo+
IGhhcmR3YXJlIHNlZXMNCj4gYW4gRVBUIGZhdWx0IHdpdGggbnBmZWMua2luZCAhPSBucGZlY19r
aW5kX3dpdGhfZ2xhLiBUaGlzIGlzLA0KPiBob3dldmVyLA0KPiBpbmNvcnJlY3QsIGJlY2F1c2Ug
dGhlIGluc3RydWN0aW9uIGF0IFJJUCBtaWdodCBsZWdpdGltYXRlbHkgY2F1c2UgYW4NCj4gRVBU
IGZhdWx0IG9mIGl0cyBvd24gd2hpbGUgYWNjZXNzaW5nIGEgX2RpZmZlcmVudF8gcGFnZSBmcm9t
IHRoZQ0KPiBvcmlnaW5hbCBvbmUsDQo+IHdoZXJlIEEvRCB3ZXJlIHNldC4NCj4gVGhlIHNvbHV0
aW9uIGlzIHRvIHBlcmZvcm0gdGhlIHdob2xlIGVtdWxhdGlvbiwgd2hpbGUgaWdub3JpbmcgRVBU
DQo+IHJlc3RyaWN0aW9ucw0KPiBmb3IgdGhlIHdhbGsgcGFydCwgYW5kIHRha2luZyB0aGVtIGlu
dG8gYWNjb3VudCBmb3IgdGhlICJhY3R1YWwiDQo+IGVtdWxhdGluZyBvZg0KPiB0aGUgaW5zdHJ1
Y3Rpb24gYXQgUklQLiBXaGVuIHdlIHNlbmQgb3V0IGEgdm1fZXZlbnQsIHdlIGRvbid0IHdhbnQN
Cj4gdGhlIGVtdWxhdGlvbg0KPiB0byBjb21wbGV0ZSwgc2luY2UgaW4gdGhhdCBjYXNlIHdlIHdv
bid0IGJlIGFibGUgdG8gdmV0byB3aGF0ZXZlciBpdA0KPiBpcyBkb2luZy4NCj4gVGhhdCB3b3Vs
ZCBtZWFuIHRoYXQgd2UgY2FuJ3QgYWN0dWFsbHkgcHJldmVudCBhbnkgbWFsaWNpb3VzDQo+IGFj
dGl2aXR5LCBpbnN0ZWFkDQo+IHdlJ2Qgb25seSBiZSBhYmxlIHRvIHJlcG9ydCBvbiBpdC4NCj4g
V2hlbiB3ZSBzZWUgYSAic2VuZC12bV9ldmVudCIgY2FzZSB3aGlsZSBlbXVsYXRpbmcsIHdlIG5l
ZWQgdG8gZmlyc3QNCj4gc2VuZCB0aGUNCj4gZXZlbnQgb3V0IGFuZCB0aGVuIHN1c3BlbmQgdGhl
IGVtdWxhdGlvbiAocmV0dXJuIFg4NkVNVUxfUkVUUlkpLg0KPiBBZnRlciB0aGUgZW11bGF0aW9u
IHN0b3BzIHdlJ2xsIGNhbGwgaHZtX3ZtX2V2ZW50X2RvX3Jlc3VtZSgpIGFnYWluDQo+IGFmdGVy
IHRoZQ0KPiBpbnRyb3NwZWN0aW9uIGFnZW50IHRyZWF0cyB0aGUgZXZlbnQgYW5kIHJlc3VtZXMg
dGhlIGd1ZXN0LiBUaGVyZSwNCj4gdGhlDQo+IGluc3RydWN0aW9uIGF0IFJJUCB3aWxsIGJlIGZ1
bGx5IGVtdWxhdGVkICh3aXRoIHRoZSBFUFQgaWdub3JlZCkgaWYNCj4gdGhlDQo+IGludHJvc3Bl
Y3Rpb24gYXBwbGljYXRpb24gYWxsb3dzIGl0LCBhbmQgdGhlIGd1ZXN0IHdpbGwgY29udGludWUg
dG8NCj4gcnVuIHBhc3QNCj4gdGhlIGluc3RydWN0aW9uLg0KPiANCj4gQSBjb21tb24gZXhhbXBs
ZSBpcyBpZiB0aGUgaGFyZHdhcmUgZXhpdHMgYmVjYXVzZSBvZiBhbiBFUFQgZmF1bHQNCj4gY2F1
c2VkIGJ5IGENCj4gcGFnZSB3YWxrLCBwMm1fbWVtX2FjY2Vzc19jaGVjaygpIGRlY2lkZXMgaWYg
aXQgaXMgZ29pbmcgdG8gc2VuZCBhDQo+IHZtX2V2ZW50Lg0KPiBJZiB0aGUgdm1fZXZlbnQgd2Fz
IHNlbnQgYW5kIGl0IHdvdWxkIGJlIHRyZWF0ZWQgc28gaXQgcnVucyB0aGUNCj4gaW5zdHJ1Y3Rp
b24NCj4gYXQgUklQLCB0aGF0IGluc3RydWN0aW9uIG1pZ2h0IGFsc28gaGl0IGEgcHJvdGVjdGVk
IHBhZ2UgYW5kIHByb3Zva2UNCj4gYSB2bV9ldmVudC4NCj4gDQo+IE5vdyBpZiBucGZlYy5raW5k
ID09IG5wZmVjX2tpbmRfaW5fZ3B0IGFuZCBkLQ0KPiA+YXJjaC5tb25pdG9yLmluZ3Vlc3RfcGFn
ZWZhdWx0X2Rpc2FibGVkDQo+IGlzIHRydWUgdGhlbiB3ZSBhcmUgaW4gdGhlIHBhZ2Ugd2FsayBj
YXNlIGFuZCB3ZSBjYW4gZG8gdGhpcw0KPiBlbXVsYXRpb24gb3B0aW1pemF0aW9uDQo+IGFuZCBl
bXVsYXRlIHRoZSBwYWdlIHdhbGsgd2hpbGUgaWdub3JpbmcgdGhlIEVQVCwgYnV0IGRvbid0IGln
bm9yZQ0KPiB0aGUgRVBUIGZvciB0aGUNCj4gZW11bGF0aW9uIG9mIHRoZSBhY3R1YWwgaW5zdHJ1
Y3Rpb24uDQo+IA0KPiBJbiB0aGUgZmlyc3QgY2FzZSB3ZSB3b3VsZCBoYXZlIDIgRVBUIGV2ZW50
cywgaW4gdGhlIHNlY29uZCBjYXNlIHdlDQo+IHdvdWxkIGhhdmUNCj4gMSBFUFQgZXZlbnQgaWYg
dGhlIGluc3RydWN0aW9uIGF0IHRoZSBSSVAgdHJpZ2dlcnMgYW4gRVBUIGV2ZW50Lg0KPiANCj4g
V2UgdXNlIGh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKCkgdG8gaW50ZXJjZXB0IHdyaXRlIGFjY2Vz
cyBhbmQNCj4gX19odm1fY29weSgpIHRvIGludGVyY2VwdCBleGVjLCByZWFkIGFuZCB3cml0ZSBh
Y2Nlc3MuDQo+IA0KPiBBIG5ldyByZXR1cm4gdHlwZSB3YXMgYWRkZWQsIEhWTVRSQU5TX25lZWRf
cmV0cnksIGluIG9yZGVyIHRvIGhhdmUNCj4gYWxsDQo+IHRoZSBwbGFjZXMgdGhhdCBjb25zdW1l
IEhWTVRSQU5TKiByZXR1cm4gWDg2RU1VTF9SRVRSWS4NCj4gDQo+IGh2bV9lbXVsYXRlX3NlbmRf
dm1fZXZlbnQoKSBjYW4gcmV0dXJuIGZhbHNlIGlmIHRoZXJlIHdhcyBubw0KPiB2aW9sYXRpb24s
DQo+IGlmIHRoZXJlIHdhcyBhbiBlcnJvciBmcm9tIG1vbml0b3JfdHJhcHMoKSBvciBwMm1fZ2V0
X21lbV9hY2Nlc3MoKS4NCj4gLUVTUkNIIGZyb20gcDJtX2dldF9tZW1fYWNjZXNzKCkgaXMgdHJl
YXRlZCBhcyByZXN0cmljdGVkIGFjY2Vzcy4NCj4gDQo+IE5PVEU6IGh2bV9lbXVsYXRlX3NlbmRf
dm1fZXZlbnQoKSBhc3N1bWVzIHRoZSBjYWxsZXIgd2lsbA0KPiBlbmFibGUvZGlzYWJsZQ0KPiBh
cmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUg
SXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NCj4gDQpSZXZpZXdlZC1ieTogUGV0cmUg
UGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
