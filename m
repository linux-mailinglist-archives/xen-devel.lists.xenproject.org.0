Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DADA6B9C4
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 12:10:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hngqL-0006ol-FR; Wed, 17 Jul 2019 10:07:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hngqJ-0006og-R5
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 10:07:23 +0000
X-Inumbo-ID: a878d2aa-a87a-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a878d2aa-a87a-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 10:07:22 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 10:07:16 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 10:06:36 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 10:06:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTJbEw3HL5r54mKCYYMp08audFEaOvutLhG8Bxq2g0djC9ooGjCfRHAtT1fgbq4fIe/meF/r7RsGaSKgT6VX8Uh2SGe11QjeheDorQ1NkFJRl0bmt575TH7KMwRvxoo+JAb1xaauYGNv+fXW2WuJnT8wnI/kUdCjCMCXEBRKVXSLPKT74zNjTdS8NIfFrd5rno0wFSHnbVnQxV7FDzGkPujgvhBH1wNgerXhpQTFpqPtqdLqTNdyK6aaJgkM87+8o3mrIwcw+KU9Vg74uNqsewL+u6TEm1bK1Q5iOGxdC9fJzHG6FXLJ61UoZO4czc05fWoS93zbiEENqexwHudUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly3T6Y+ks00e+rWijev/0Qj2trc7VP3/tVpDiaUbZJo=;
 b=mMlxTXwzhg2w5XwT+E25Ha1h6zidlfCEm80Lz/lCt2LinAdWKcBhHTMQg/+4HKdbX1nOYpMTFMyBKyPFYF7Ptx64nisMrBTJu2aLWTIG7wdGH5DrNWV5xHc5/NEkyVoYXAuHv1j5VI0pvGrlvXbJM7+T2NvA6hWql3Vi32GwW6TgbROsK9oZY0LIZfe7HWtxCMZyWmrlpOnYkXAymcWgRFRi6YZ1qUI2LZxH+jbXX0Q+PkXnFI6SiD2thwLSiITmxxWGc4lSR/L7bto9QnDKkZxlCqBxKAZdMdMkMY4SM1wwcFDw2YNZZvWlIb7maITn8rFpZkHmCqwHQ6l2vdKKIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2938.namprd18.prod.outlook.com (20.179.52.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 10:06:35 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 10:06:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ja8zGHp8jkY0SwPhMewFAvpabOlqkA
Date: Wed, 17 Jul 2019 10:06:34 +0000
Message-ID: <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0082.eurprd07.prod.outlook.com
 (2603:10a6:6:2b::20) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: caa41573-67a7-406d-8d9d-08d70a9e72f9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2938; 
x-ms-traffictypediagnostic: DM6PR18MB2938:
x-microsoft-antispam-prvs: <DM6PR18MB2938E2DA7D316FCA0EBD33A8B3C90@DM6PR18MB2938.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(199004)(189003)(71200400001)(8936002)(53936002)(81156014)(6512007)(478600001)(81166006)(71190400001)(186003)(2906002)(99286004)(6116002)(26005)(4326008)(6916009)(6436002)(6486002)(6246003)(80792005)(66946007)(31696002)(86362001)(8676002)(476003)(68736007)(25786009)(36756003)(256004)(14444005)(7736002)(5660300002)(66066001)(305945005)(64756008)(31686004)(76176011)(66446008)(66476007)(386003)(53546011)(7416002)(229853002)(486006)(102836004)(54906003)(6506007)(52116002)(446003)(66556008)(316002)(3846002)(11346002)(14454004)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2938;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XXXse7rXe0FQQUbF7pjkYbL7OJ74rLmmm7r+nKTBW1fcP98sj8JMXvjIgIAMJ7FaWdWnd0qZGYp+vuxlzhbiRpDLkkVYDp1GJxvZ7DHItjnVCSeaRZ7Xqycl2klYBUbMtwVfSFX+kTTea/vvEpmV6E5FIOAW0IPex+p9Q61SESJsVKgvTtZClZSrNDjjYRbaEmj6VFwU2zMg6Wj5Ww1Cqi4L9x82THyyl8o6okNDfVFS+Jp/AQWP0Xqe9YBYAyTknzUbRqGF5KinV/u9ob6FgoldN0TTAKOL+ctFRcRqIZyLJzm0EX5XOIFL+RnZ9Sr7yWkyD5/S/4bM5p7m/OUhwg2OqLkWrlmnyN7LenO8ZwBAVFNiSn9rWozyeQWavKPAzfCsSM5kL1vdbb+0rkfIim5iPdn8gtPDKc+ogqqm6+E=
Content-ID: <FD1B3099CB15614FB84EECC16F91B2FC@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: caa41573-67a7-406d-8d9d-08d70a9e72f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 10:06:34.8760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2938
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxOTowNiwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOg0KPiArc3RhdGljIHZv
aWQgdm1fZXZlbnRfY2hhbm5lbHNfZnJlZV9idWZmZXIoc3RydWN0IHZtX2V2ZW50X2NoYW5uZWxz
X2RvbWFpbiAqaW1wbCkNCj4gICB7DQo+IC0gICAgdm1fZXZlbnRfcmluZ19yZXN1bWUodG9fcmlu
Zyh2LT5kb21haW4tPnZtX2V2ZW50X21vbml0b3IpKTsNCj4gKyAgICBpbnQgaTsNCj4gKw0KPiAr
ICAgIHZ1bm1hcChpbXBsLT5zbG90cyk7DQo+ICsgICAgaW1wbC0+c2xvdHMgPSBOVUxMOw0KPiAr
DQo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBpbXBsLT5ucl9mcmFtZXM7IGkrKyApDQo+ICsgICAg
ICAgIGZyZWVfZG9taGVhcF9wYWdlKG1mbl90b19wYWdlKGltcGwtPm1mbltpXSkpOw0KPiAgIH0N
Cg0KV2hhdCBndWFyYW50ZWVzIHRoYXQgdGhlcmUgYXJlIG5vIG1hcHBpbmdzIGxlZnQgb2YgdGhl
IHBhZ2VzIHlvdSBmcmVlDQpoZXJlPyBTaGFyaW5nIHBhZ2VzIHdpdGggZ3Vlc3RzIGlzIChzbyBm
YXIpIGFuIChhbG1vc3QpIGlycmV2ZXJzaWJsZQ0KYWN0aW9uLCBpLmUuIHRoZXkgbWF5IGdlbmVy
YWxseSBvbmx5IGJlIGZyZWVkIHVwb24gZG9tYWluIGRlc3RydWN0aW9uLg0KU2VlIGdudHRhYl91
bnBvcHVsYXRlX3N0YXR1c19mcmFtZXMoKSBmb3IgYSBjYXNlIHdoZXJlIHdlIGFjdHVhbGx5DQpt
YWtlIGFuIGF0dGVtcHQgYXQgZnJlZWluZyBzdWNoIHBhZ2VzIChidXQgd2hlcmUgd2UgZmFpbCB0
aGUgcmVxdWVzdA0KaW4gY2FzZSByZWZlcmVuY2VzIGFyZSBsZWZ0IGluIHBsYWNlKS4NCg0KRnVy
dGhlcm1vcmUsIGlzIHRoZXJlIGFueSBndWFyYW50ZWUgdGhhdCB0aGUgcGFnZXMgeW91IGZyZWUg
aGVyZQ0Kd2VyZSBhY3R1YWxseSBhbGxvY2F0ZWQ/IC0+bnJfZnJhbWVzIGdldHMgc2V0IGFoZWFk
IG9mIHRoZSBhY3R1YWwNCmFsbG9jYXRpb24uDQoNCj4gK2ludCB2bV9ldmVudF9uZ19nZXRfZnJh
bWVzKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZCwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZnJhbWUsIHVuc2lnbmVkIGludCBucl9mcmFtZXMs
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5fcGZuX3QgbWZuX2xpc3RbXSkNCj4g
K3sNCj4gKyAgICBzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQ7DQo+ICsgICAgaW50IGk7DQo+
ICsNCj4gKyAgICBzd2l0Y2ggKGlkICkNCj4gKyAgICB7DQo+ICsgICAgY2FzZSBYRU5fVk1fRVZF
TlRfVFlQRV9NT05JVE9SOg0KPiArICAgICAgICB2ZWQgPSBkLT52bV9ldmVudF9tb25pdG9yOw0K
PiArICAgICAgICBicmVhazsNCj4gKw0KPiArICAgIGRlZmF1bHQ6DQo+ICsgICAgICAgIHJldHVy
biAtRU5PU1lTOw0KDQpWYXJpb3VzIG90aGVyIGVycm9yIGNvZGVzIG1pZ2h0IGJlIGZpbmUgaGVy
ZSwgYnV0IEVOT1NZUyBpcyBub3QNCihkZXNwaXRlIHByZS1leGlzdGluZyBtaXN1c2UgZWxzZXdo
ZXJlIGluIHRoZSB0cmVlKS4NCg0KPiArICAgIH0NCj4gKw0KPiArICAgIGlmICggIXZtX2V2ZW50
X2NoZWNrKHZlZCkgKQ0KPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArICAgIGlm
ICggZnJhbWUgIT0gMCB8fCBucl9mcmFtZXMgIT0gdG9fY2hhbm5lbHModmVkKS0+bnJfZnJhbWVz
ICkNCj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQoNCklzIHRoZXJlIGEgcGFydGljdWxhciBy
ZWFzb24gZm9yIHRoaXMgYWxsLW9yLW5vdGhpbmcgbW9kZWw/DQoNCj4gKyAgICBzcGluX2xvY2so
JnZlZC0+bG9jayk7DQo+ICsNCj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IHRvX2NoYW5uZWxzKHZl
ZCktPm5yX2ZyYW1lczsgaSsrICkNCj4gKyAgICAgICAgbWZuX2xpc3RbaV0gPSBtZm5feCh0b19j
aGFubmVscyh2ZWQpLT5tZm5baV0pOw0KPiArDQo+ICsgICAgc3Bpbl91bmxvY2soJnZlZC0+bG9j
ayk7DQoNCldoYXQgaXMgdGhlIGxvY2tpbmcgZ29vZCBmb3IgaGVyZT8gWW91IG9idmlvdXNseSBj
YW4ndCBiZSBhZnJhaWQgb2YNCnRoZSB2YWx1ZXMgYmVjb21pbmcgc3RhbGUsIGFzIHRoZXkgc3Vy
ZWx5IHdvdWxkIGJlIGJ5IHRoZSB0aW1lIHRoZQ0KY2FsbGVyIGdldHMgdG8gc2VlIHRoZW0gKGlm
IHRoZXkgY2FuIGdvIHN0YWxlIGluIHRoZSBmaXJzdCBwbGFjZSkuDQoNCj4gLS0tIGEveGVuL2lu
Y2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwu
aA0KPiBAQCAtMzgsNyArMzgsNyBAQA0KPiAgICNpbmNsdWRlICJodm0vc2F2ZS5oIg0KPiAgICNp
bmNsdWRlICJtZW1vcnkuaCINCj4gICANCj4gLSNkZWZpbmUgWEVOX0RPTUNUTF9JTlRFUkZBQ0Vf
VkVSU0lPTiAweDAwMDAwMDExDQo+ICsjZGVmaW5lIFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJ
T04gMHgwMDAwMDAxMg0KDQpUaGlzIGxvb2tzIHRvIGJlIG5lZWRlZCBvbmx5IGJlY2F1c2Ugb2Yg
Li4uDQoNCj4gQEAgLTc4MSwxMiArNzgxLDIwIEBAIHN0cnVjdCB4ZW5fZG9tY3RsX2dkYnN4X2Rv
bXN0YXR1cyB7DQo+ICAgc3RydWN0IHhlbl9kb21jdGxfdm1fZXZlbnRfb3Agew0KPiAgICAgICB1
aW50MzJfdCAgICAgICBvcDsgICAgICAgICAgIC8qIFhFTl9WTV9FVkVOVF8qICovDQo+ICAgICAg
IHVpbnQzMl90ICAgICAgIHR5cGU7ICAgICAgICAgLyogWEVOX1ZNX0VWRU5UX1RZUEVfKiAqLw0K
PiArIC8qIFVzZSB0aGUgTkcgaW50ZXJmYWNlICovDQo+ICsjZGVmaW5lIF9YRU5fVk1fRVZFTlRf
RkxBR1NfTkdfT1AgICAgICAgICAwDQo+ICsjZGVmaW5lIFhFTl9WTV9FVkVOVF9GTEFHU19OR19P
UCAgICAgICAgICAoMVUgPDwgX1hFTl9WTV9FVkVOVF9GTEFHU19OR19PUCkNCj4gKyAgICB1aW50
MzJfdCAgICAgICBmbGFnczsNCg0KLi4uIHRoaXMgYWRkaXRpb24uIElzIHRoZSBuZXcgZmllbGQg
cmVhbGx5IHdhcnJhbnRlZCBoZXJlPyBDYW4ndA0KeW91IGUuZy4gc2ltcGx5IGRlZmluZSBhIG5l
dyBzZXQgb2Ygb3BzIChlLmcuIGJ5IHNldHRpbmcgdGhlaXINCmhpZ2ggYml0cyk/DQoNCkkndmUg
b21pdHRlZCBhbGwgc3R5bGUgY29tbWVudHMgKGZvcm1hdHRpbmcsIHBsYWluIHZzIHVuc2lnbmVk
IGludA0KZXRjKSAtIEknZCBsaWtlIHRvIGxlYXZlIHRoYXQgdG8gdGhlIFZNIGV2ZW50IG1haW50
YWluZXJzLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
