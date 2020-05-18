Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE01D893B
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 22:35:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jamSz-00060F-4D; Mon, 18 May 2020 20:34:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDU1=7A=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jamSw-00060A-U2
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 20:34:27 +0000
X-Inumbo-ID: f684cb9c-9946-11ea-a89a-12813bfff9fa
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.60]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f684cb9c-9946-11ea-a89a-12813bfff9fa;
 Mon, 18 May 2020 20:34:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkhxZv6tHjTqIVMoJQlO+A21klSBq2eslo1RmA8kRTKeDJUYRkDA+drM45JbPLVTadeKtAYbPhLEsDg9GYcLw18G6Y3Sm16E5pteGOcUbqbRY08tZBmw6tp+tZZWTa4NgD6NOIM9/xr9UZ1hjPkhq7WPhLpu7fzsM+snV9Yg91p4dIqNsSkuWV0PXtenPC5Q7cD00aBgXh7EmWNDwNpHuyxEkBCXm/KIa91+IqOJHhJjsayVSiW/lIzGMzeUeD2MlMo1Sgt5hWoRux1IQKw33ZUR6O/H+SS+Vf0oGI70zaIfi4spNmkwGcY3tTaSTqnMi8d+rgUGcD8izchE5JRqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNc84L0gIWpd4BowBxoWBAW970PLb7AWSyx/lVpLhBw=;
 b=M2vGpoza23cid5qfz2pdo2qlSI6Q3RrEdDI6gMTrj9YgdaEIfAw2UcacRRW35f5tRP0ueqiJ+ATIiTV3hkWq4bHdDzSz2es0TrBkceajbYPiheYrLpR7HOzhoVvdrnN2cPJNTWZ/04Lb3ICskxAbVpJG++Lc8hVejW/cjKH7hr2WmEJIAmdbLJxcBEWqTM//aPpyoErHpMwIXFoo7jm2Wz7I3YnY5nkrJt9fH3H8stWzOT+QfgvKCMeVXqe/SdnDIHVjrtM3Uu3XDYHoGq194tHV86kzt0GPLVTzuuGpRYMBzgaKMnqWElgGhI0gfRUxUrlrWGg5D1N9jdIxinw0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNc84L0gIWpd4BowBxoWBAW970PLb7AWSyx/lVpLhBw=;
 b=MS8atY4t000BLBwlhev/VRFUCO0wAKCAv38ZT1AZDyMW335wQ7mpwp6lFLn1ORNdMLCdxlVV8QsLtLm9aPlmTdqXSYDmBf6QtM+lg4OqqrUZwjI7tzN4trEnmOo3EV9fRpElK2I7p+lZHDgdYrYDFC26vP3irY9F3gTHe+WKT10=
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB3280.eurprd03.prod.outlook.com
 (2603:10a6:803:21::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Mon, 18 May
 2020 20:34:23 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 20:34:23 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "julien@xen.org" <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.14 2/3] xen/arm: Take into account the DMA width
 when allocating Dom0 memory banks
Thread-Topic: [PATCH for-4.14 2/3] xen/arm: Take into account the DMA width
 when allocating Dom0 memory banks
Thread-Index: AQHWLQfAliF6MoKavkWMBTAyxOognaiuTV0A
Date: Mon, 18 May 2020 20:34:22 +0000
Message-ID: <aa95369bf22df89404243dd4e7374f8015ccc9ad.camel@epam.com>
References: <20200518113008.15422-1-julien@xen.org>
 <20200518113008.15422-3-julien@xen.org>
In-Reply-To: <20200518113008.15422-3-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa7be173-5fd4-4761-a867-08d7fb6ad98c
x-ms-traffictypediagnostic: VI1PR0302MB3280:
x-microsoft-antispam-prvs: <VI1PR0302MB3280682F3A3460D150C6CDB0E6B80@VI1PR0302MB3280.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QFazzduIufV7tsGobL+RFowHffUnzE7UfxI5WWVCilwQ6erwSGHhe0AjlqwmwTnVBADhyn9HmIUhQd/UxKbBb6M6K7KwNMwyVWU639A0OJGevCCInY8xOkzIMrFttF3AZpjRmerr/9Niqpg56rbbPvc1wV+UAljf49iq0kyHebUqqXBXDAaEkLeLCGHqdMEMkRay402MujzjMDDO8tjgxT7PP2xStoqa/ycv7cygN/mr4TtbFKJ1RHCto4qRZ9VzIv9/UvOqkLOglYRKLDGgdM+nVeK1qhjiwj/9+uchXLYz9N2PUT+n1/lc2BDP8VY5AuwaAf73Z8w21n5/HCT6X627ckGyeJKZHDy85DPbAzLnHkzyIznuUEiHPYTmtxB7kMgB6rXOufEg9ELJWbw4NnOdCyEBTxOJt5JpLu47erx0QXWENhlPMmx5q6h1eN+P
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(5660300002)(55236004)(316002)(6512007)(36756003)(478600001)(8936002)(54906003)(110136005)(8676002)(15650500001)(6506007)(4326008)(26005)(6486002)(186003)(66446008)(64756008)(66556008)(76116006)(91956017)(2906002)(86362001)(66946007)(2616005)(66476007)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: z0m/W3GbX+kBHXxQWuLbExhbMaU6fmExvkXQvENwKTMm71Y56nXA0cCrKDcxBElthjarU17b8/E4Dj3UwOvk7cPvMOMQWbukCm7ddxggNKu31VG4XqsyFE1fVUnU5Ta//Ld9EGY0EVICfDzEimhelV37ysicwNYvdRB4codLyjjZxtuYXjl/J9nZmD/fuZFGPcZtMJ0dMpYttrVNyyayPMdP+AcX2YXpy9djFlvKjMg5VwvG/29rMAhbqpB+Agr+wl0/fPgNXvkZNE9jq2/j/OOEL+FV8rlKRpZdmcVVInVGI5exaPpakoS4Ex/ZZ11j2Khs9plYgPXI6EgpyuPG0x/3P4OPG9g/8N75eJN5egZDqvJ/F9m8LIaQ/fmYA3+IsyxO6vzaB07sXKqIzlCNv/0099xHPduBzFRxf/nre46KO0zeDo2IYsrkfnEfJjH46noeePTl+iPEs9irO2bHabDTOm4nrRJM9mWgcYbpv20=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C87E15FCE3EAA4BB76ACFE7812BFC16@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7be173-5fd4-4761-a867-08d7fb6ad98c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 20:34:22.9774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3kQ9mKCPX1ZsbEfQ+f4FhYFeLM9rwBvJ09+PrEww+q+R/Zm5jF2sOxCRHLOQaoQWncjlfiBF3/l/Y8OvHvXqvmA2aRsrIm5z9vGP/A6bW7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3280
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 "jgrall@amazon.com" <jgrall@amazon.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "roman@zededa.com" <roman@zededa.com>, "minyard@acm.org" <minyard@acm.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLA0KDQpPbiBNb24sIDIwMjAtMDUtMTggYXQgMTI6MzAgKzAxMDAsIEp1bGllbiBH
cmFsbCB3cm90ZToNCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4g
DQo+IEF0IHRoZSBtb21lbnQsIFhlbiBpcyBhc3N1bWluZyB0aGF0IGFsbCB0aGUgZGV2aWNlcyBh
cmUgYXQgbGVhc3QgMzItYml0DQo+IERNQSBjYXBhYmxlLiBIb3dldmVyLCBzb21lIFNvQ3MgaGF2
ZSBkZXZpY2VzIHRoYXQgbWF5IGJlIGFibGUgdG8gYWNjZXNzDQo+IGEgbXVjaCByZXN0cmljdGVk
IHJhbmdlLiBGb3IgaW5zdGFuY2UsIHRoZSBSYXNwYmVycnkgUEkgNCBoYXMgZGV2aWNlcw0KPiB0
aGF0IGNhbiBvbmx5IGFjY2VzcyB0aGUgZmlyc3QgR0Igb2YgUkFNLg0KPiANCj4gVGhlIGZ1bmN0
aW9uIGFyY2hfZ2V0X2RtYV9iaXRfc2l6ZSgpIHdpbGwgcmV0dXJuIHRoZSBsb3dlc3QgRE1BIHdp
ZHRoIG9uDQo+IHRoZSBwbGF0Zm9ybS4gVXNlIGl0IHRvIGRlY2lkZSB3aGF0IGlzIHRoZSBsaW1p
dCBmb3IgdGhlIGxvdyBtZW1vcnkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbEwg
PGpncmFsbEBhbWF6b24uY29tPg0KPiAtLS0NCj4gIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YyB8IDMyICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
DQo+IGluZGV4IDQzMDcwODc1MzY0Mi4uYWJjNGU0NjNkMjdjIDEwMDY0NA0KPiAtLS0gYS94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jDQo+IEBAIC0yMTEsMTAgKzIxMSwxMyBAQCBmYWlsOg0KPiAgICogICAgdGhlIHJhbWRpc2sg
YW5kIERUQiBtdXN0IGJlIHBsYWNlZCB3aXRoaW4gYSBjZXJ0YWluIHByb3hpbWl0eSBvZg0KPiAg
ICogICAgdGhlIGtlcm5lbCB3aXRoaW4gUkFNLg0KPiAgICogMy4gRm9yIGRvbTAgd2Ugd2FudCB0
byBwbGFjZSBhcyBtdWNoIG9mIHRoZSBSQU0gYXMgd2UgcmVhc29uYWJseSBjYW4NCj4gLSAqICAg
IGJlbG93IDRHQiwgc28gdGhhdCBpdCBjYW4gYmUgdXNlZCBieSBub24tTFBBRSBlbmFibGVkIGtl
cm5lbHMgKDMyLWJpdCkNCj4gKyAqICAgIGJlbG93IDRHQiwgc28gdGhhdCBpdCBjYW4gYmUgdXNl
ZCBieSBub24tTFBBRSBlbmFibGVkIGtlcm5lbHMgKDMyLWJpdCkuDQpJcyBmdWxsIHN0b3AgcmVh
bGx5IG5lZWRlZCB0aGVyZT8NCg0KPiAgICogICAgb3Igd2hlbiBhIGRldmljZSBhc3NpZ25lZCB0
byBkb20wIGNhbiBvbmx5IGRvIDMyLWJpdCBETUEgYWNjZXNzLg0KPiAtICogNC4gRm9yIDMyLWJp
dCBkb20wIHRoZSBrZXJuZWwgbXVzdCBiZSBsb2NhdGVkIGJlbG93IDRHQi4NCj4gLSAqIDUuIFdl
IHdhbnQgdG8gaGF2ZSBhIGZldyBsYXJnZXJzIGJhbmtzIHJhdGhlciB0aGFuIG1hbnkgc21hbGxl
ciBvbmVzLg0KPiArICogNC4gU29tZSBkZXZpY2VzIGFzc2lnbmVkIHRvIGRvbTAgY2FuIG9ubHkg
ZG8gMzItYml0IERNQSBhY2Nlc3Mgb3INCj4gKyAqICAgIGV2ZW4gYmUgbW9yZSByZXN0cmljdGVk
LiBXZSB3YW50IHRvIGFsbG9jYXRlIGFzIG11Y2ggb2YgdGhlIFJBTQ0KPiArICogICAgYXMgd2Ug
cmVhc29uYWJseSBjYW4gdGhhdCBjYW4gYmUgYWNjZXNzZWQgZnJvbSBhbGwgdGhlIGRldmljZXMu
Lg0KPiArICogNS4gRm9yIDMyLWJpdCBkb20wIHRoZSBrZXJuZWwgbXVzdCBiZSBsb2NhdGVkIGJl
bG93IDRHQi4NCj4gKyAqIDYuIFdlIHdhbnQgdG8gaGF2ZSBhIGZldyBsYXJnZXJzIGJhbmtzIHJh
dGhlciB0aGFuIG1hbnkgc21hbGxlciBvbmVzLg0KPiAgICoNCj4gICAqIEZvciB0aGUgZmlyc3Qg
dHdvIHJlcXVpcmVtZW50cyB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBsb3dlc3QNCj4g
ICAqIGJhbmsgaXMgc3VmZmljaWVudGx5IGxhcmdlLg0KPiBAQCAtMjQ1LDkgKzI0OCw5IEBAIGZh
aWw6DQo+ICAgKiB3ZSBnaXZlIHVwLg0KPiAgICoNCj4gICAqIEZvciAzMi1iaXQgZG9tYWluIHdl
IHJlcXVpcmUgdGhhdCB0aGUgaW5pdGlhbCBhbGxvY2F0aW9uIGZvciB0aGUNCj4gLSAqIGZpcnN0
IGJhbmsgaXMgdW5kZXIgNEcuIEZvciA2NC1iaXQgZG9tYWluLCB0aGUgZmlyc3QgYmFuayBpcyBw
cmVmZXJyZWQNCj4gLSAqIHRvIGJlIGFsbG9jYXRlZCB1bmRlciA0Ry4gVGhlbiBmb3IgdGhlIHN1
YnNlcXVlbnQgYWxsb2NhdGlvbnMgd2UNCj4gLSAqIGluaXRpYWxseSBhbGxvY2F0ZSBtZW1vcnkg
b25seSBmcm9tIGJlbG93IDRHQi4gT25jZSB0aGF0IHJ1bnMgb3V0DQo+ICsgKiBmaXJzdCBiYW5r
IGlzIHBhcnQgb2YgdGhlIGxvdyBtZW0uIEZvciA2NC1iaXQsIHRoZSBmaXJzdCBiYW5rIGlzIHBy
ZWZlcnJlZA0KPiArICogdG8gYmUgYWxsb2NhdGVkIGluIHRoZSBsb3cgbWVtLiBUaGVuIGZvciBz
dWJzZXF1ZW50IGFsbG9jYXRpb24sIHdlDQo+ICsgKiBpbml0aWFsbHkgYWxsb2NhdGUgbWVtb3J5
IG9ubHkgZnJvbSBsb3cgbWVtLiBPbmNlIHRoYXQgcnVucyBvdXQgb3V0DQo+ICAgKiAoYXMgZGVz
Y3JpYmVkIGFib3ZlKSB3ZSBhbGxvdyBoaWdoZXIgYWxsb2NhdGlvbnMgYW5kIGNvbnRpbnVlIHVu
dGlsDQo+ICAgKiB0aGF0IHJ1bnMgb3V0IChvciB3ZSBoYXZlIGFsbG9jYXRlZCBzdWZmaWNpZW50
IGRvbTAgbWVtb3J5KS4NCj4gICAqLw0KPiBAQCAtMjYyLDYgKzI2NSw3IEBAIHN0YXRpYyB2b2lk
IF9faW5pdCBhbGxvY2F0ZV9tZW1vcnlfMTEoc3RydWN0IGRvbWFpbiAqZCwNCj4gICAgICBpbnQg
aTsNCj4gIA0KPiAgICAgIGJvb2wgbG93bWVtID0gdHJ1ZTsNCj4gKyAgICB1bnNpZ25lZCBpbnQg
bG93bWVtX2JpdHNpemUgPSBtaW4oMzJVLCBhcmNoX2dldF9kbWFfYml0c2l6ZSgpKTsNCj4gICAg
ICB1bnNpZ25lZCBpbnQgYml0czsNCj4gIA0KPiAgICAgIC8qDQo+IEBAIC0yODIsNyArMjg2LDcg
QEAgc3RhdGljIHZvaWQgX19pbml0IGFsbG9jYXRlX21lbW9yeV8xMShzdHJ1Y3QgZG9tYWluICpk
LA0KPiAgICAgICAqLw0KPiAgICAgIHdoaWxlICggb3JkZXIgPj0gbWluX2xvd19vcmRlciApDQo+
ICAgICAgew0KPiAtICAgICAgICBmb3IgKCBiaXRzID0gb3JkZXIgOyBiaXRzIDw9IChsb3dtZW0g
PyAzMiA6IFBBRERSX0JJVFMpOyBiaXRzKysgKQ0KPiArICAgICAgICBmb3IgKCBiaXRzID0gb3Jk
ZXIgOyBiaXRzIDw9IGxvd21lbV9iaXRzaXplOyBiaXRzKysgKQ0KPiAgICAgICAgICB7DQo+ICAg
ICAgICAgICAgICBwZyA9IGFsbG9jX2RvbWhlYXBfcGFnZXMoZCwgb3JkZXIsIE1FTUZfYml0cyhi
aXRzKSk7DQo+ICAgICAgICAgICAgICBpZiAoIHBnICE9IE5VTEwgKQ0KPiBAQCAtMjk2LDI0ICsz
MDAsMjYgQEAgc3RhdGljIHZvaWQgX19pbml0IGFsbG9jYXRlX21lbW9yeV8xMShzdHJ1Y3QgZG9t
YWluICpkLA0KPiAgICAgICAgICBvcmRlci0tOw0KPiAgICAgIH0NCj4gIA0KPiAtICAgIC8qIEZh
aWxlZCB0byBhbGxvY2F0ZSBiYW5rMCB1bmRlciA0R0IgKi8NCj4gKyAgICAvKiBGYWlsZWQgdG8g
YWxsb2NhdGUgYmFuazAgaW4gdGhlIGxvd21lbSByZWdpb24uICovDQo+ICAgICAgaWYgKCBpc18z
MmJpdF9kb21haW4oZCkgKQ0KPiAgICAgICAgICBwYW5pYygiVW5hYmxlIHRvIGFsbG9jYXRlIGZp
cnN0IG1lbW9yeSBiYW5rXG4iKTsNCj4gIA0KPiAtICAgIC8qIFRyeSB0byBhbGxvY2F0ZSBtZW1v
cnkgZnJvbSBhYm92ZSA0R0IgKi8NCj4gLSAgICBwcmludGsoWEVOTE9HX0lORk8gIk5vIGJhbmsg
aGFzIGJlZW4gYWxsb2NhdGVkIGJlbG93IDRHQi5cbiIpOw0KPiArICAgIC8qIFRyeSB0byBhbGxv
Y2F0ZSBtZW1vcnkgZnJvbSBhYm92ZSB0aGUgbG93bWVtIHJlZ2lvbiAqLw0KPiArICAgIHByaW50
ayhYRU5MT0dfSU5GTyAiTm8gYmFuayBoYXMgYmVlbiBhbGxvY2F0ZWQgYmVsb3cgJXUtYml0Llxu
IiwNCj4gKyAgICAgICAgICAgbG93bWVtX2JpdHNpemUpOw0KPiAgICAgIGxvd21lbSA9IGZhbHNl
Ow0KPiAgDQo+ICAgZ290X2JhbmswOg0KPiAgDQo+ICAgICAgLyoNCj4gLSAgICAgKiBJZiB3ZSBm
YWlsZWQgdG8gYWxsb2NhdGUgYmFuazAgdW5kZXIgNEdCLCBjb250aW51ZSBhbGxvY2F0aW5nDQo+
IC0gICAgICogbWVtb3J5IGZyb20gYWJvdmUgNEdCIGFuZCBmaWxsIGluIGJhbmtzLg0KPiArICAg
ICAqIElmIHdlIGZhaWxlZCB0byBhbGxvY2F0ZSBiYW5rMCBpbiB0aGUgbG93bWVtIHJlZ2lvbiwN
Cj4gKyAgICAgKiBjb250aW51ZSBhbGxvY2F0aW5nIGZyb20gYWJvdmUgdGhlIGxvd21lbSBhbmQg
ZmlsbCBpbiBiYW5rcy4NCj4gICAgICAgKi8NCj4gICAgICBvcmRlciA9IGdldF9hbGxvY2F0aW9u
X3NpemUoa2luZm8tPnVuYXNzaWduZWRfbWVtKTsNCj4gICAgICB3aGlsZSAoIGtpbmZvLT51bmFz
c2lnbmVkX21lbSAmJiBraW5mby0+bWVtLm5yX2JhbmtzIDwgTlJfTUVNX0JBTktTICkNCj4gICAg
ICB7DQo+IC0gICAgICAgIHBnID0gYWxsb2NfZG9taGVhcF9wYWdlcyhkLCBvcmRlciwgbG93bWVt
ID8gTUVNRl9iaXRzKDMyKSA6IDApOw0KPiArICAgICAgICBwZyA9IGFsbG9jX2RvbWhlYXBfcGFn
ZXMoZCwgb3JkZXIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb3dtZW0g
PyBNRU1GX2JpdHMobG93bWVtX2JpdHNpemUpIDogMCk7DQo+ICAgICAgICAgIGlmICggIXBnICkN
Cj4gICAgICAgICAgew0KPiAgICAgICAgICAgICAgb3JkZXIgLS07DQo=

