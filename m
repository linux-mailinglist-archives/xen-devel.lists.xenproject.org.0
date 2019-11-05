Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816F2F0173
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 16:30:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS0kH-0006tN-Ld; Tue, 05 Nov 2019 15:27:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61et=Y5=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iS0kG-0006tI-SB
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 15:27:48 +0000
X-Inumbo-ID: d1fa4cac-ffe0-11e9-b678-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::701])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1fa4cac-ffe0-11e9-b678-bc764e2007e4;
 Tue, 05 Nov 2019 15:27:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxlrEnlzpj3K1y5Q5ENSG3Wq5YP3iVW14xW6xXXhGixPswL9kMPLe2uWSCrKRaKbLJEHE+7vE2Gtmc9RgAK9/h+svj4Nh+JLMxXMuWVYrg5WNkuXiFAX1A0SU4ZtQd5seMM4002si5gTysz3iI6IkVxvYki0q257AemgIM0OZ1HFRFXRUzB1Wo9Utz3Xw2jkQcx01LYGmiLdugyp68tp5bLjUg23/hEQQTQ5IcT1k47GpLHO3XN392CSjIHmxokw0V/2KIEYZl1ACSplUDXZaIq2MmBwzexptzYo8e6Z3MrvfFknERQr1XH+ti4/QNxueBJUsXpwZtEKzBLc5Kbqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlRH2mD8bJ+hSCmPJZ3uubw4yaNUZcnr/TPqjNYSR9A=;
 b=PptHuyA/uIsv6F+f1l4TW/AOr5MZrUXMlFABztVC5oLUMwq6S5YXJPI6mLZ8QwcfgPZd+y/u089pbjz4u8XTFiWNOnfOZKfYZ+S1GQg2qcsdJ9t+uLC+T4SK/uvEjLV/kCQuMaLk3NxEobf6UWXnaBJosu3LMMpSkzfJ1HAcA1Pn8S9TktFh5wP1RJYIYoxgVR/mH5GQcO+uJbD03LRIDrADTUPoFxR3CHzCZ2PIKFS79nvmyPDCngmqHTgtiLrD/iVxbkzxRvtG5VQBgmkl/0QLuAWSMzCZ5DbNx8uCgCB26ziXvTiMWdPnT/X1y6uGn752+ep4LXdAg1eAkVwAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlRH2mD8bJ+hSCmPJZ3uubw4yaNUZcnr/TPqjNYSR9A=;
 b=iXa+QMYX2rBKfxadtes8PsTe3+I1a3b9oZirHbnaaW6HWJ+K+7T74EITxCmdA0kdTtWBSX/C/J9duNZUrnUFcdafM/bLdlPEFWahrxwDUItHS+FNZWnkyJq9IUYVxps+XsG818oqVsHwMobmKmAl9Zo07Hv7pEiCNE86d+p1tDs=
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com (52.133.30.28) by
 AM6PR0202MB3493.eurprd02.prod.outlook.com (52.133.31.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 15:27:46 +0000
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::a569:5be5:9861:577d]) by AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::a569:5be5:9861:577d%5]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 15:27:46 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH V1 1/2] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVk9ao9wGZEUCF0UWADMZln2TA+qd8sN6AgAACmAA=
Date: Tue, 5 Nov 2019 15:27:46 +0000
Message-ID: <6b211f88-5273-92b1-fb17-8541e2aff1c0@bitdefender.com>
References: <20191105124332.4380-1-aisaila@bitdefender.com>
 <CABfawhmjDvjTUyijCs1OyHxfeHq+mfhrGyZqbcPutMSKAgd4Lw@mail.gmail.com>
In-Reply-To: <CABfawhmjDvjTUyijCs1OyHxfeHq+mfhrGyZqbcPutMSKAgd4Lw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::15) To AM6PR0202MB3413.eurprd02.prod.outlook.com
 (2603:10a6:209:1c::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33e0fee4-d81c-4ab7-bf14-08d76204b565
x-ms-traffictypediagnostic: AM6PR0202MB3493:|AM6PR0202MB3493:|AM6PR0202MB3493:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0202MB34937EAF9E18F9AB3388831AAB7E0@AM6PR0202MB3493.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(346002)(396003)(39860400002)(376002)(189003)(199004)(99286004)(7416002)(26005)(316002)(256004)(76176011)(186003)(305945005)(7736002)(86362001)(107886003)(446003)(11346002)(476003)(2616005)(6436002)(14454004)(52116002)(66946007)(4326008)(81166006)(66066001)(8676002)(229853002)(81156014)(966005)(8936002)(14444005)(66476007)(66556008)(66446008)(64756008)(5660300002)(2906002)(6486002)(486006)(102836004)(6306002)(53546011)(386003)(6116002)(36756003)(3846002)(6506007)(31696002)(31686004)(71190400001)(71200400001)(6512007)(54906003)(6246003)(6916009)(25786009)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0202MB3493;
 H:AM6PR0202MB3413.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TGrFBBLz/X7lS15l9lPAlj8r39GNTx5gwkwkYjmqE0iobWZOaRdNAHr6GQ6VBxTYNcjresmsgy8wxu6SOMFNIAeD5uUa17fPCkEb42UGMADpfcahX/pFOL6TeNN459IZXoSy3s40i9QPB0OR2hjzBS+d4RrG5UxICI/zvii/mBDk5dfauOlybDAd6/vzNW39pDRogtTz6OaKofyvUyd4QvQmE1tLbxr7CvbHJ9PTHcfvAlshu5qBRUEnvrviue/h+Vz6BHbjpYX85pJFPHoPhJxGMaWcARJ12BeDOmDPJd5BPxyg9NtDQiep1lW1dCHpuK67oQ9jk6A+tE1LFWS2NcapWTpJSHV2470Ug1Q9b3pCRYoqN8ajtE6HDKKVtAVdjqQ0Gzr4oNUB1DjF8Ur+u5t5H23vzY9vnTe7CFl9z6eqsKLZeOLIQNSxpqe1FDFktqr1Uh3OuBe6D1vSsRvJURD31AvHEo5kiFwhvlwJiyQ=
Content-ID: <BF75A7452014944FA3C7782AF0851849@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e0fee4-d81c-4ab7-bf14-08d76204b565
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 15:27:46.1098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zx/utzG044rWoq6QBnWAWCnRuFzSIVd/Zvf6VumjgArqmeCaDvDg4LiWIW1cHO0TQnT81f6Nvjy9zUrQTTJjGWONUe6TrgD+7EYe2zN4A2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3493
Subject: Re: [Xen-devel] [PATCH V1 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA1LjExLjIwMTkgMTc6MTgsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gT24gVHVl
LCBOb3YgNSwgMjAxOSBhdCA1OjQzIEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBDQo+IDxhaXNh
aWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6DQo+Pg0KPj4gQnkgZGVmYXVsdCB0aGUgc3ZlIGJp
dHMgYXJlIG5vdCBzZXQuDQo+PiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgaHlwZXJjYWxsLCB4Y19h
bHRwMm1fc2V0X3N1cHJlc3NfdmVfbXVsdGkoKSwNCj4+IHRvIHNldCBhIHJhbmdlIG9mIHN2ZSBi
aXRzLg0KPj4gVGhlIGNvcmUgZnVuY3Rpb24sIHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoKSwg
ZG9lcyBub3QgYnJha2UgaW4gY2FzZQ0KPj4gb2YgYSBlcnJvciBhbmQgaXQgaXMgZG9pbmcgYSBi
ZXN0IGVmZm9ydCBmb3Igc2V0dGluZyB0aGUgYml0cyBpbiB0aGUNCj4+IGdpdmVuIHJhbmdlLiBB
IGNoZWNrIGZvciBjb250aW51YXRpb24gaXMgbWFkZSBpbiBvcmRlciB0byBoYXZlDQo+PiBwcmVl
bXB0aW9uIG9uIGJpZyByYW5nZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElz
YWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQo+PiAtLS0NCj4+ICAgdG9vbHMvbGlieGMv
aW5jbHVkZS94ZW5jdHJsLmggICB8ICAzICsrDQo+PiAgIHRvb2xzL2xpYnhjL3hjX2FsdHAybS5j
ICAgICAgICAgfCAyNSArKysrKysrKysrKysrKw0KPj4gICB4ZW4vYXJjaC94ODYvaHZtL2h2bS5j
ICAgICAgICAgIHwgMjggKysrKysrKysrKysrKy0tDQo+PiAgIHhlbi9hcmNoL3g4Ni9tbS9wMm0u
YyAgICAgICAgICAgfCA2MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAg
eGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaCB8ICA0ICsrLQ0KPj4gICB4ZW4vaW5jbHVk
ZS94ZW4vbWVtX2FjY2Vzcy5oICAgIHwgIDMgKysNCj4+ICAgNiBmaWxlcyBjaGFuZ2VkLCAxMjEg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMv
bGlieGMvaW5jbHVkZS94ZW5jdHJsLmggYi90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaA0K
Pj4gaW5kZXggZjQ0MzE2ODdiMy4uMjFiNjQ0ZjQ1OSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xp
YnhjL2luY2x1ZGUveGVuY3RybC5oDQo+PiArKysgYi90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0
cmwuaA0KPj4gQEAgLTE5MjMsNiArMTkyMyw5IEBAIGludCB4Y19hbHRwMm1fc3dpdGNoX3RvX3Zp
ZXcoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRvbWlkLA0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQpOw0KPj4gICBpbnQgeGNfYWx0cDJt
X3NldF9zdXBwcmVzc192ZSh4Y19pbnRlcmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsDQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQsIHhlbl9w
Zm5fdCBnZm4sIGJvb2wgc3ZlKTsNCj4+ICtpbnQgeGNfYWx0cDJtX3NldF9zdXByZXNzX3ZlX211
bHRpKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQsIHhlbl9wZm5fdCBzdGFy
dF9nZm4sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBu
ciwgYm9vbCBzdmUpOw0KPj4gICBpbnQgeGNfYWx0cDJtX2dldF9zdXBwcmVzc192ZSh4Y19pbnRl
cmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQsIHhlbl9wZm5fdCBnZm4sIGJvb2wgKnN2ZSk7DQo+
PiAgIGludCB4Y19hbHRwMm1fc2V0X21lbV9hY2Nlc3MoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVp
bnQzMl90IGRvbWlkLA0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2FsdHAybS5jIGIv
dG9vbHMvbGlieGMveGNfYWx0cDJtLmMNCj4+IGluZGV4IDA5ZGFkMDM1NWUuLjY2MDVkOWFiYmUg
MTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJ4Yy94Y19hbHRwMm0uYw0KPj4gKysrIGIvdG9vbHMv
bGlieGMveGNfYWx0cDJtLmMNCj4+IEBAIC0yMzQsNiArMjM0LDMxIEBAIGludCB4Y19hbHRwMm1f
c2V0X3N1cHByZXNzX3ZlKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwNCj4+
ICAgICAgIHJldHVybiByYzsNCj4+ICAgfQ0KPj4NCj4+ICtpbnQgeGNfYWx0cDJtX3NldF9zdXBy
ZXNzX3ZlX211bHRpKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQsIHhlbl9w
Zm5fdCBzdGFydF9nZm4sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50MzJfdCBuciwgYm9vbCBzdmUpDQo+PiArew0KPj4gKyAgICBpbnQgcmM7DQo+PiArICAgIERF
Q0xBUkVfSFlQRVJDQUxMX0JVRkZFUih4ZW5faHZtX2FsdHAybV9vcF90LCBhcmcpOw0KPj4gKw0K
Pj4gKyAgICBhcmcgPSB4Y19oeXBlcmNhbGxfYnVmZmVyX2FsbG9jKGhhbmRsZSwgYXJnLCBzaXpl
b2YoKmFyZykpOw0KPj4gKyAgICBpZiAoIGFyZyA9PSBOVUxMICkNCj4+ICsgICAgICAgIHJldHVy
biAtMTsNCj4+ICsNCj4+ICsgICAgYXJnLT52ZXJzaW9uID0gSFZNT1BfQUxUUDJNX0lOVEVSRkFD
RV9WRVJTSU9OOw0KPj4gKyAgICBhcmctPmNtZCA9IEhWTU9QX2FsdHAybV9zZXRfc3VwcHJlc3Nf
dmVfbXVsdGk7DQo+PiArICAgIGFyZy0+ZG9tYWluID0gZG9taWQ7DQo+PiArICAgIGFyZy0+dS5z
dXBwcmVzc192ZS52aWV3ID0gdmlld19pZDsNCj4+ICsgICAgYXJnLT51LnN1cHByZXNzX3ZlLmdm
biA9IHN0YXJ0X2dmbjsNCj4+ICsgICAgYXJnLT51LnN1cHByZXNzX3ZlLnN1cHByZXNzX3ZlID0g
c3ZlOw0KPj4gKyAgICBhcmctPnUuc3VwcHJlc3NfdmUubnIgPSBucjsNCj4+ICsNCj4+ICsgICAg
cmMgPSB4ZW5jYWxsMihoYW5kbGUtPnhjYWxsLCBfX0hZUEVSVklTT1JfaHZtX29wLCBIVk1PUF9h
bHRwMm0sDQo+PiArICAgICAgICAgICAgICAgICAgSFlQRVJDQUxMX0JVRkZFUl9BU19BUkcoYXJn
KSk7DQo+PiArICAgIHhjX2h5cGVyY2FsbF9idWZmZXJfZnJlZShoYW5kbGUsIGFyZyk7DQo+PiAr
ICAgIHJldHVybiByYzsNCj4+ICt9DQo+PiArDQo+PiAgIGludCB4Y19hbHRwMm1fc2V0X21lbV9h
Y2Nlc3MoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRvbWlkLA0KPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQsIHhlbl9wZm5fdCBnZm4sDQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGVubWVtX2FjY2Vzc190IGFjY2VzcykN
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2
bS9odm0uYw0KPj4gaW5kZXggMDZhN2I0MDEwNy4uZDNkOWY4YzMwZiAxMDA2NDQNCj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMN
Cj4+IEBAIC00NTM1LDYgKzQ1MzUsNyBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgNCj4+ICAg
ICAgIGNhc2UgSFZNT1BfYWx0cDJtX2Rlc3Ryb3lfcDJtOg0KPj4gICAgICAgY2FzZSBIVk1PUF9h
bHRwMm1fc3dpdGNoX3AybToNCj4+ICAgICAgIGNhc2UgSFZNT1BfYWx0cDJtX3NldF9zdXBwcmVz
c192ZToNCj4+ICsgICAgY2FzZSBIVk1PUF9hbHRwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpOg0K
Pj4gICAgICAgY2FzZSBIVk1PUF9hbHRwMm1fZ2V0X3N1cHByZXNzX3ZlOg0KPj4gICAgICAgY2Fz
ZSBIVk1PUF9hbHRwMm1fc2V0X21lbV9hY2Nlc3M6DQo+PiAgICAgICBjYXNlIEhWTU9QX2FsdHAy
bV9zZXRfbWVtX2FjY2Vzc19tdWx0aToNCj4+IEBAIC00NjgxLDcgKzQ2ODIsNyBAQCBzdGF0aWMg
aW50IGRvX2FsdHAybV9vcCgNCj4+ICAgICAgICAgICBicmVhazsNCj4+DQo+PiAgICAgICBjYXNl
IEhWTU9QX2FsdHAybV9zZXRfc3VwcHJlc3NfdmU6DQo+PiAtICAgICAgICBpZiAoIGEudS5zdXBw
cmVzc192ZS5wYWQxIHx8IGEudS5zdXBwcmVzc192ZS5wYWQyICkNCj4+ICsgICAgICAgIGlmICgg
YS51LnN1cHByZXNzX3ZlLnBhZDEgKQ0KPj4gICAgICAgICAgICAgICByYyA9IC1FSU5WQUw7DQo+
PiAgICAgICAgICAgZWxzZQ0KPj4gICAgICAgICAgIHsNCj4+IEBAIC00NjkzLDggKzQ2OTQsMzEg
QEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoDQo+PiAgICAgICAgICAgfQ0KPj4gICAgICAgICAg
IGJyZWFrOw0KPj4NCj4+ICsgICAgY2FzZSBIVk1PUF9hbHRwMm1fc2V0X3N1cHByZXNzX3ZlX211
bHRpOg0KPj4gKyAgICAgICAgaWYgKCBhLnUuc3VwcHJlc3NfdmUucGFkMSB8fCAhYS51LnN1cHBy
ZXNzX3ZlLm5yICkNCj4+ICsgICAgICAgICAgICByYyA9IC1FSU5WQUw7DQo+PiArICAgICAgICBl
bHNlDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcmMgPSBwMm1fc2V0X3N1cHByZXNz
X3ZlX211bHRpKGQsIGEudS5zdXBwcmVzc192ZS5nZm4sDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGEudS5zdXBwcmVzc192ZS5uciwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYS51LnN1cHByZXNzX3ZlLnN1cHBy
ZXNzX3ZlLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBh
LnUuc3VwcHJlc3NfdmUudmlldyk7DQo+IA0KPiBJIGhhdmUgdG8gc2F5IEknbSBub3QgYSBmYW4g
b2Ygc3R1ZmZpbmcgdGhlIGN1cnJlbnQgZ2ZuIHByb2dyZXNzIGludG8NCj4gcmMsIHBlcmhhcHMg
YSBzZXBhcmF0ZSBwb2ludGVyIGJlaW5nIHBhc3NlZCBpbiBmb3Igc3RvcmluZyB0aGF0IGFuZA0K
PiByZXR1cm5pbmcgLUVSRVNUQVJUIHdvdWxkIGJlIGNsZWFuZXIuDQoNClRoaXMgc291bmRzIGNs
ZWFuZXIsIEkgd2lsbCBoYXZlIGl0IGNoYW5nZWQgaW4gdjIuDQoNCj4gDQo+PiArICAgICAgICAg
ICAgaWYgKCByYyA+IDAgKQ0KPj4gKyAgICAgICAgICAgIHsNCj4+ICsgICAgICAgICAgICAgICAg
YS51LnN1cHByZXNzX3ZlLmdmbiA9IHJjOw0KPiANCj4gVGhlcmUgaGFkIGJlZW4gZGlzY3Vzc2lv
biBpbiB0aGUgcGFzdCB3aGV0aGVyIGl0cyBhY2NlcHRhYmxlIHRvDQo+IG92ZXJ3cml0ZSBmaWVs
ZHMgdGhhdCB3ZXJlIHBhc3NlZCBpbiBsaWtlIHRoaXMuIFRoaXMgbWF5IG5vdCBiZSB0aGUNCj4g
ZXhwZWN0ZWQgYmVoYXZpb3IuIEZvciB0aGUgbWVtX3NoYXJpbmcgc2lkZSBhdCBsZWFzdCB3ZSBo
YXZlDQo+IGludHJvZHVjZWQgYW4gIm9wYXF1ZSIgZmllbGQgaW4gdGhlIHN0cnVjdHVyZSB0byBz
dG9yZSB0aGF0DQo+IGNvbnRpbnVhdGlvbiB2YWx1ZSAoc2VlDQo+IGh0dHBzOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXhlbi9pbmNsdWRlL3B1YmxpYy9tZW1v
cnkuaDtoPWNmZGRhNmUyYTg3ZWQzMGJlZDU5MDAzNGQ4ZDcxNzY3NGFiZmJjNzk7aGI9SEVBRCNs
NTI0KS4NCg0KSSB3YW50ZWQgdG8ga2VlcCB0aGUgc2l6ZSBvZiB0aGUgc3RydWN0LiBJdCBpdCBp
cyBvayB0byBoYXZlIGEgbmV3IA0KdWludDY0X3Qgb3BhcXVlIGhlcmUgYW5kIHRoZW4gcGFkIHRo
ZSByZXN0IG9mIHRoZSBzdHJ1Y3R1cmVzIHRoZW4gSSB3aWxsIA0KY2hhbmdlIHRoaXMgaW4gdjIu
DQoNClRoYW5rcywNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
