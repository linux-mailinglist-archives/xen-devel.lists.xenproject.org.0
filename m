Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC11934D
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 22:19:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOpUP-0001Hq-Ta; Thu, 09 May 2019 20:18:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kt3J=TJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOpUO-0001He-Gs
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 20:18:00 +0000
X-Inumbo-ID: 893731eb-7297-11e9-8980-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::617])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 893731eb-7297-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IZ9R9sgIwsLcrX2cVL5sT3kjY8Q+N1IuPTmkkkzMkE=;
 b=nALCZvsXRxHEKFbg0FSXTeoU7mcWP0NA0iwYZVm7WYoWhmk8Jms8MhIYKuVdSPl3BCKwS3i9lmhPcmNr7LL9NaA5pSsSLcTg5y5Kfz4d0GKZp6zAD91WMb4GCqYHOxhvXyOqrNy6xIQ+CvplupzMxIDDeg5gAPihmlPIfqcliXE=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB2963.eurprd08.prod.outlook.com (52.134.90.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 9 May 2019 20:17:56 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b%7]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 20:17:56 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v2 2/7] xen/arm: Remove flush_xen_text_tlb_local()
Thread-Index: AQHVBblbKALX8820BUG/oOz9kicoEaZjOSWAgAAD+QA=
Date: Thu, 9 May 2019 20:17:56 +0000
Message-ID: <70083080-d924-9eea-1190-61f8d03201fa@arm.com>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-3-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091253010.25766@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1905091253010.25766@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR05CA0003.eurprd05.prod.outlook.com
 (2603:10a6:6:14::16) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51b7d9d1-f728-4389-d45f-08d6d4bb6c86
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB2963; 
x-ms-traffictypediagnostic: AM0PR08MB2963:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB2963DB3C2EFC5D59A86EF00F80330@AM0PR08MB2963.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(376002)(39860400002)(346002)(189003)(199004)(2906002)(31696002)(446003)(25786009)(6916009)(68736007)(44832011)(8936002)(66946007)(66476007)(66446008)(66556008)(64756008)(73956011)(7736002)(54906003)(5660300002)(53936002)(186003)(305945005)(11346002)(81156014)(8676002)(6246003)(81166006)(4326008)(6436002)(14454004)(71200400001)(86362001)(3846002)(52116002)(99286004)(6116002)(229853002)(71190400001)(53546011)(386003)(476003)(256004)(72206003)(478600001)(316002)(76176011)(6506007)(66066001)(6486002)(6512007)(102836004)(2616005)(31686004)(486006)(36756003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB2963;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mVpF9imjAzguyS5QiLr+Q5ijzhLDZXHKHcN7e9xRGo5zzErqQo3Kin1Xpf8QHGikwws6yaDExY6XeU8ZJh2cgymPyrwxPKs9+H1i4TIvwqeCMUnMOhmY0wJvcZBvP5ZHy+e66fH9g9gwt9TVCR235gxwX7HiC3Bgm8PKa8uSzCKNIo/gQs0wGQ6N3G3efg10/kBiYJAH+0wwQkoVyoFTSHjPkb6pheJwuf6qFItlGuuJ9aarqmmbr/LjTQMoWpnG4QFZLpRy0s9zljuIv4qQKqA7aAdnBBz0YYayR4EUlEBkoBiQkJmok1yTdUK9IhIK/jAtTV4Mp82WqZ87oCfWiGzd8TrfAJHrFyGwTpvDmZX5LTypWIwH2al5xgG0JJAcQNxknvaqfqI1JFZGoA847R3dZB43bEUBMk26B0CscoU=
Content-ID: <28C42D81BF41D446BE3BD6DB2B1916C6@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b7d9d1-f728-4389-d45f-08d6d4bb6c86
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 20:17:56.7090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2963
Subject: Re: [Xen-devel] [PATCH v2 2/7] xen/arm: Remove
 flush_xen_text_tlb_local()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDA5LzA1LzIwMTkgMjE6MDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gV2VkLCA4IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBUaGUgZnVuY3Rpb24g
Zmx1c2hfeGVuX3RleHRfdGxiX2xvY2FsKCkgaGFzIGJlZW4gbWlzdXNlZCBhbmQgd2lsbCByZXN1
bHQNCj4+IHRvIGludmFsaWRhdGUgdGhlIGluc3RydWN0aW9uIGNhY2hlIG1vcmUgdGhhbiBuZWNl
c3NhcnkuDQo+Pg0KPj4gRm9yIGluc3RhbmNlLCB0aGVyZSBhcmUgbm8gbmVlZCB0byBpbnZhbGlk
YXRlIHRoZSBpbnN0cnVjdGlvbiBjYWNoZSBpZg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBe
IGlzDQo+IA0KPiANCj4+IHdlIGFyZSBzZXR0aW5nIFNDVExSX0VMMi5XWE4uDQo+Pg0KPj4gVGhl
cmUgYXJlIGVmZmVjdGl2ZWx5IG9ubHkgb25lIGNhbGxlciAoaS5lIGZyZWVfaW5pdF9tZW1vcnko
KSB3b3VsZA0KPiAgICAgICAgICBeIGlzDQo+IA0KPj4gd2hvIG5lZWQgdG8gaW52YWxpZGF0ZSB0
aGUgaW5zdHJ1Y3Rpb24gY2FjaGUuDQo+ICAgIF4gd291bGQgd2hvIC8gd2hvIHdvdWxkDQo+IA0K
Pj4NCj4+IFNvIHJhdGhlciB0aGFuIGtlZXBpbmcgYXJvdW5kIHRoZSBmdW5jdGlvbiBmbHVzaF94
ZW5fdGV4dF90bGJfbG9jYWwoKQ0KPj4gYXJvdW5kLCByZXBsYWNlIGl0IHdpdGggY2FsbCB0byBm
bHVzaF94ZW5fdGxiX2xvY2FsKCkgYW5kIGV4cGxpY2l0ZWx5DQo+ICAgIF4gcmVtb3ZlDQoNCkkg
d2lsbCBmaXggdGhlIHR5cG9lcyBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiANCj4+IGZs
dXNoIHRoZSBjYWNoZSB3aGVuIG5lY2Vzc2FyeS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+PiAgICAgIENoYW5n
ZXMgaW4gdjI6DQo+PiAgICAgICAgICAtIEFkZCBBbmRyaWkncyByZXZpZXdlZC1ieQ0KPj4gLS0t
DQo+PiAgIHhlbi9hcmNoL2FybS9tbS5jICAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysr
KystLS0NCj4+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9wYWdlLmggfCAyMyArKysrKysr
KystLS0tLS0tLS0tLS0tLQ0KPj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L3BhZ2UuaCB8
IDIxICsrKysrLS0tLS0tLS0tLS0tLS0tLQ0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDI4IGluc2Vy
dGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jDQo+PiBpbmRleCA5M2FkMTE4MTgzLi5kZmJlMzlj
NzBhIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMNCj4+ICsrKyBiL3hlbi9hcmNo
L2FybS9tbS5jDQo+PiBAQCAtNjEwLDggKzYxMCwxMiBAQCB2b2lkIF9faW5pdCByZW1vdmVfZWFy
bHlfbWFwcGluZ3Modm9pZCkNCj4+ICAgc3RhdGljIHZvaWQgeGVuX3B0X2VuZm9yY2Vfd254KHZv
aWQpDQo+PiAgIHsNCj4+ICAgICAgIFdSSVRFX1NZU1JFRzMyKFJFQURfU1lTUkVHMzIoU0NUTFJf
RUwyKSB8IFNDVExSX1dYTiwgU0NUTFJfRUwyKTsNCj4+IC0gICAgLyogRmx1c2ggZXZlcnl0aGlu
ZyBhZnRlciBzZXR0aW5nIFdYTiBiaXQuICovDQo+PiAtICAgIGZsdXNoX3hlbl90ZXh0X3RsYl9s
b2NhbCgpOw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBUaGUgVExCcyBtYXkgY2FjaGUgU0NUTFJf
RUwyLldYTi4gU28gZW5zdXJlIGl0IGlzIHN5bmNocm9uaXplZA0KPj4gKyAgICAgKiBiZWZvcmUg
Zmx1c2hpbmcgdGhlIFRMQnMuDQo+PiArICAgICAqLw0KPj4gKyAgICBpc2IoKTsNCj4+ICsgICAg
Zmx1c2hfeGVuX2RhdGFfdGxiX2xvY2FsKCk7DQo+PiAgIH0NCj4+ICAgDQo+PiAgIGV4dGVybiB2
b2lkIHN3aXRjaF90dGJyKHVpbnQ2NF90IHR0YnIpOw0KPj4gQEAgLTExMjMsNyArMTEyNyw3IEBA
IHN0YXRpYyB2b2lkIHNldF9wdGVfZmxhZ3Nfb25fcmFuZ2UoY29uc3QgY2hhciAqcCwgdW5zaWdu
ZWQgbG9uZyBsLCBlbnVtIG1nIG1nKQ0KPj4gICAgICAgICAgIH0NCj4+ICAgICAgICAgICB3cml0
ZV9wdGUoeGVuX3hlbm1hcCArIGksIHB0ZSk7DQo+PiAgICAgICB9DQo+PiAtICAgIGZsdXNoX3hl
bl90ZXh0X3RsYl9sb2NhbCgpOw0KPj4gKyAgICBmbHVzaF94ZW5fZGF0YV90bGJfbG9jYWwoKTsN
Cj4gDQo+IEkgdGhpbmsgaXQgd291bGQgbWFrZSBzZW5zZSB0byBtb3ZlIHRoZSByZW1haW5pbmcg
Y2FsbCB0bw0KPiBmbHVzaF94ZW5fZGF0YV90bGJfbG9jYWwgZnJvbSBzZXRfcHRlX2ZsYWdzX29u
X3JhbmdlIHRvIGZyZWVfaW5pdF9tZW1vcnkNCj4gYmVmb3JlIHRoZSBjYWxsIHRvIGludmFsaWRh
dGVfaWNhY2hlX2xvY2FsLiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KV2Ugc3RpbGwgbmVlZCB0aGUg
VExCIGZsdXNoIGZvciB0aGUgdHdvIGNhbGxlcnMuIFRoZSBmaXJzdCBvbmUgZm9yIA0KcmVtb3Zl
IGFsbCBUTEJzIHdpdGggdGhlIHByZXZpb3VzIHBlcm1pc3Npb24sIHRoZSBzZWNvbmQgd2hlbiB0
aGUgDQptYXBwaW5ncyBhcmUgcmVtb3ZlZCBmcm9tIHRoZSBUTEJzLg0KDQpUb2RheSwgaXQgaXMg
bm90IHBvc3NpYmxlIHRvIHJlLXVzZSB0aGUgdmlydHVhbCBhZGRyZXNzIG9mIHRoZSBpbml0IA0K
c2VjdGlvbiwgc28gaXQgaXMgYXJndWFibHkgbm90IG5lY2Vzc2FyeS4gSG93ZXZlciwgSSBkb24n
dCB3YW50IHRvIHRha2UgDQp0aGUgY2hhbmNlIHRvIGludHJvZHVjZSBwb3RlbnRpYWwgY29oZXJl
bmN5IGlzc3VlcyBpZiB0aGUgVExCcyBlbnRyaWVzIA0Kd2hlcmUgc3RpbGwgcHJlc2VudCB3aGVu
IHJlLXVzaW5nIHRoZSB2aXJ0dWFsIGFkZHJlc3MuDQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4g
R3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
