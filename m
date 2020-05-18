Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBB21D8652
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 20:25:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jakR7-0003iY-84; Mon, 18 May 2020 18:24:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDU1=7A=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jakR5-0003iT-Gn
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 18:24:23 +0000
X-Inumbo-ID: cab41962-9934-11ea-a88a-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cab41962-9934-11ea-a88a-12813bfff9fa;
 Mon, 18 May 2020 18:24:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkobl5YTEqhyqglGJRWOVM9735b9ubRfaIM3K1qxiqLWyB/3uJ+QZ1rCdoQ2loC+VTwEwlQcffQN6ATxN2DePTBcbEsDfX5gyLJwg9xv8C15+P1QufAEC7uOgbZyHnB6O/lW0fwewfocVALZBfgRMoMJ0VIRQTPJeWKKByFutI01tHsGEZxkTJjIuQsmwhcRyWidKjMpTNYC8ucm+FevTJnAYT6tubODmMdtzOmncUZq2n0d722Jm06a7nvlZgiKnyFNsHu41FjbRAF/iUOcbYViaSRytFDXKKLuG8b8Y3BY/TPGLEbVKH0TsP0L5li+DstWCbbji/N+U3mZjia5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgPW3PW0EWT7kCFuNFjnoCJ+6osYm/etA00TItnAUSY=;
 b=CiKBENJ88fMYdrz7sUoJiWcbynWQRKinA8te8GXeih0dwXDtoPbIhC25KZCvJ4DxMLaJJeHqE2BKqlBzvQS5bq+cE28JsPTqGw3uydUoIlppuNhZqxBJ5yUm0Nu1HzyHPigBu0cu+c/IQUdEFe44Wt3uueXj0V20GZ75F68lf20b4JmklmUi8DgkPYd85FxYFU/XkdtKE7Pxc00nT/RYkU8nn9lBIkhgZBogI09pEW9Qiv8vplz/waVffMs+gf4a8lA75vwlCiWl8lXqAnE9aAVQyLoG6mesxJNG4GXxkVz9TFzYnzLceIxD1CKx1MLcj5E4xBtx6sAyTfLJzVTrAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgPW3PW0EWT7kCFuNFjnoCJ+6osYm/etA00TItnAUSY=;
 b=Mq9+FgJJu9IZWAfAIVqbcXHQ+K5GX++kjneZBmdtRuPjqTVjcVEZeHPj+NRhKmGFSyYxcxJo99iRhquE7gD29zw1XO6v46kNR3tYVgM3yL/p53Dt8uBpGQXuV60LoNGbtH/CttlNJ5l7re7UJ7mMxF4yb++6ZNgMiLZZmoH5M4o=
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB2814.eurprd03.prod.outlook.com
 (2603:10a6:800:e3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Mon, 18 May
 2020 18:24:19 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 18:24:19 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "julien@xen.org" <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.14 1/3] xen/arm: Allow a platform to override the
 DMA width
Thread-Topic: [PATCH for-4.14 1/3] xen/arm: Allow a platform to override the
 DMA width
Thread-Index: AQHWLQe/10+te1SvfkynseIg0ziWG6iuKQYA
Date: Mon, 18 May 2020 18:24:19 +0000
Message-ID: <8e8afff48273589fd06192203c0452fb1e69cd1f.camel@epam.com>
References: <20200518113008.15422-1-julien@xen.org>
 <20200518113008.15422-2-julien@xen.org>
In-Reply-To: <20200518113008.15422-2-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 726e0bb0-0c34-4b29-b0f0-08d7fb58ae0b
x-ms-traffictypediagnostic: VI1PR0302MB2814:
x-microsoft-antispam-prvs: <VI1PR0302MB2814F467A286866178D18D0BE6B80@VI1PR0302MB2814.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MXLGsyYBnsoLQb+64DVRC3fHpMKSwOdFA+K/rw3x6NkVG6+HiwPia0E59jv7lghnxG0kjkfU6hlJKyw+hjr6i6WEOSDqlTfJ/43zrzDpOdnVPU8zvNfraPIcRO1CzW2kp0Fab8Gz9wU54BIpjS4GLG2vZo4DTDobXYreAejlPeIbPBbJsUcfx6C93HMGIsOQE08Tg8PBJX+F4hZ7s4VMJwKNF1n0XdhqLgvEfFDJUiH/m8iWiGgn5yDaYqEu4um6tBfZj5WsIFbQ/Z9yshxWyjB/9SSD+nPNCwD9XwpjXLqzRndkLtgAHlKj8jqne6CzaMXjYbOQ8A/hQcVOkFJu5Oz9uT8pzTY6Cs8V2CGPxZ5mbjEzjOuFjttnh9tBUje2PxtA4Pl9kVTPbXDDzN7uIe8oV25fWykndu4WuX5GJB5lZ2ZXrvIjZ/iel5UDjbDL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(71200400001)(55236004)(478600001)(110136005)(6506007)(316002)(4326008)(26005)(36756003)(54906003)(7416002)(2906002)(186003)(8936002)(8676002)(5660300002)(6486002)(2616005)(66446008)(66946007)(86362001)(91956017)(76116006)(66476007)(66556008)(64756008)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 4QnbFypUdsYjpSfheUhrrN/GP2Ro4yruht7Od4gHBKRAbdXkdoEV4GyQ5nYXbHzjyPQ6A7LBl3Z3cfdwBC/KhBzA2mmSbEU3sj4AD8iQQ2jlTcJ4oGlwzbZxUNFiSaf/SV4FVkASFwLo4o/0jHxR1oTsEMqSBh9LLscCq3dAqbUbnsXK7SLKOb/+OZO9SHY822BXZgevgPjht0BbHGLTKEqdRwXfXTWvChRxhZzl7jdjttTi1BtJsMScAjp5uA+3E0NiCEqokVVCXfskozjVZeaPXIuUYNxZzntJNVSgKveSsjy6IZp5d3zIwQcm3PYJ1gBkolfWFjuLAKJBIiye8mkGAaMNzA7v0zZuA3CLqj2b7tgoB6HnzIVSTqRoMUWejD5Wmx7S5u1h3rInzYjYCnn9gbSfvdLJeAWCk63xPfbCLOniJuCvb4C3HK+sYjIoFN3rlYmhRHgX9YP9xtr/4aG+Pd2Drh3kTP4PYTREHZk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7590272FCF9D6142A147185D06DD12B2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726e0bb0-0c34-4b29-b0f0-08d7fb58ae0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 18:24:19.1110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: td5TtZkPeYRBRwZDYaBJfHv+GGZpjmTN78dnBbgixJc4XYNaolbEsHv0V0qbFVhg8//T+6jaWZMgPLP+s/FkyhEG+kjgeeQaJ/TzLpcFI9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2814
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "minyard@acm.org" <minyard@acm.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "jgrall@amazon.com" <jgrall@amazon.com>, "roman@zededa.com" <roman@zededa.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLA0KDQpPbiBNb24sIDIwMjAtMDUtMTggYXQgMTI6MzAgKzAxMDAsIEp1bGllbiBH
cmFsbCB3cm90ZToNCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4g
DQo+IEF0IHRoZSBtb21lbnQsIFhlbiBpcyBhc3N1bWluZyB0aGF0IGFsbCB0aGUgZGV2aWNlcyBh
cmUgYXQgbGVhc3QgMzItYml0DQo+IERNQSBjYXBhYmxlLiBIb3dldmVyLCBzb21lIFNvQyBoYXZl
IGRldmljZXMgdGhhdCBtYXkgYmUgYWJsZSB0byBhY2Nlc3MNCj4gYSBtdWNoIHJlc3RyaWN0ZWQg
cmFuZ2UuIEZvciBpbnN0YW5jZSwgdGhlIFJQSSBoYXMgZGV2aWNlcyB0aGF0IGNhbg0KPiBvbmx5
IGFjY2VzcyB0aGUgZmlyc3QgMUdCIG9mIFJBTS4NCj4gDQo+IFRoZSBzdHJ1Y3R1cmUgcGxhdGZv
cm1fZGVzYyBpcyBub3cgZXh0ZW5kZWQgdG8gYWxsb3cgYSBwbGF0Zm9ybSB0bw0KPiBvdmVycmlk
ZSB0aGUgRE1BIHdpZHRoLiBUaGUgbmV3IGlzIHVzZWQgdG8gaW1wbGVtZW50DQo+IGFyY2hfZ2V0
X2RtYV9iaXRfc2l6ZSgpLg0KPiANCj4gVGhlIHByb3RvdHlwZSBpcyBub3cgbW92ZWQgaW4gYXNt
LWFybS9tbS5oIGFzIHRoZSBmdW5jdGlvbiBpcyBub3QgTlVNQQ0KPiBzcGVjaWZpYy4gVGhlIGlt
cGxlbWVudGF0aW9uIGlzIGRvbmUgaW4gcGxhdGZvcm0uYyBzbyB3ZSBkb24ndCBoYXZlIHRvDQo+
IGluY2x1ZGUgcGxhdGZvcm0uaCBldmVyeXdoZXJlLiBUaGlzIHNob3VsZCBiZSBmaW5lIGFzIHRo
ZSBmdW5jdGlvbiBpcw0KPiBub3QgZXhwZWN0ZWQgdG8gYmUgY2FsbGVkIGluIGhvdHBhdGguDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KUmV2
aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4N
Cg0KPiAtLS0NCj4gDQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBDYzogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KPiANCj4gSSBub3RpY2VkIHRoYXQg
YXJjaF9nZXRfZG1hX2JpdF9zaXplKCkgaXMgb25seSBjYWxsZWQgd2hlbiB0aGVyZSBpcyBtb3Jl
DQo+IHRoYW4gb25lIE5VTUEgbm9kZS4gSSBhbSBhIGJpdCB1bnN1cmUgd2hhdCBpcyB0aGUgcmVh
c29uIGJlaGluZCBpdC4NCj4gDQo+IFRoZSBnb2FsIGZvciBBcm0gaXMgdG8gdXNlIGFyY2hfZ2V0
X2RtYV9iaXRfc2l6ZSgpIHdoZW4gZGVjaWRpbmcgaG93IGxvdw0KPiB0aGUgZmlyc3QgRG9tMCBi
YW5rIHNob3VsZCBiZSBhbGxvY2F0ZWQuDQo+IC0tLQ0KPiAgeGVuL2FyY2gvYXJtL3BsYXRmb3Jt
LmMgICAgICAgIHwgNSArKysrKw0KPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oICAgICAgIHwg
MiArKw0KPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmggICAgIHwgNSAtLS0tLQ0KPiAgeGVu
L2luY2x1ZGUvYXNtLWFybS9wbGF0Zm9ybS5oIHwgMiArKw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL3BsYXRmb3JtLmMgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm0uYw0KPiBpbmRleCA4ZWIw
YjZlNTdhNWEuLjRkYjViYmI0YzUxZCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL3BsYXRm
b3JtLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3JtLmMNCj4gQEAgLTE1NSw2ICsxNTUs
MTEgQEAgYm9vbCBwbGF0Zm9ybV9kZXZpY2VfaXNfYmxhY2tsaXN0ZWQoY29uc3Qgc3RydWN0IGR0
X2RldmljZV9ub2RlICpub2RlKQ0KPiAgICAgIHJldHVybiAoZHRfbWF0Y2hfbm9kZShibGFja2xp
c3QsIG5vZGUpICE9IE5VTEwpOw0KPiAgfQ0KPiAgDQo+ICt1bnNpZ25lZCBpbnQgYXJjaF9nZXRf
ZG1hX2JpdHNpemUodm9pZCkNCj4gK3sNCj4gKyAgICByZXR1cm4gKCBwbGF0Zm9ybSAmJiBwbGF0
Zm9ybS0+ZG1hX2JpdHNpemUgKSA/IHBsYXRmb3JtLT5kbWFfYml0c2l6ZSA6IDMyOw0KPiArfQ0K
PiArDQo+ICAvKg0KPiAgICogTG9jYWwgdmFyaWFibGVzOg0KPiAgICogbW9kZTogQw0KPiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9t
bS5oDQo+IGluZGV4IDdkZjkxMjgwYmM3Ny4uZjhiYTQ5YjExODhmIDEwMDY0NA0KPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5o
DQo+IEBAIC0zNjYsNiArMzY2LDggQEAgaW50IGFyY2hfYWNxdWlyZV9yZXNvdXJjZShzdHJ1Y3Qg
ZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgdHlwZSwgdW5zaWduZWQgaW50IGlkLA0KPiAgICAgIHJl
dHVybiAtRU9QTk9UU1VQUDsNCj4gIH0NCj4gIA0KPiArdW5zaWduZWQgaW50IGFyY2hfZ2V0X2Rt
YV9iaXRzaXplKHZvaWQpOw0KPiArDQo+ICAjZW5kaWYgLyogIF9fQVJDSF9BUk1fTU1fXyAqLw0K
PiAgLyoNCj4gICAqIExvY2FsIHZhcmlhYmxlczoNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS1hcm0vbnVtYS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmgNCj4gaW5kZXggNDkw
ZDFmMzFhYTE0Li4zMWE2ZGU0ZTIzNDYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vbnVtYS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+IEBAIC0yNSwx
MSArMjUsNiBAQCBleHRlcm4gbWZuX3QgZmlyc3RfdmFsaWRfbWZuOw0KPiAgI2RlZmluZSBub2Rl
X3N0YXJ0X3BmbihuaWQpIChtZm5feChmaXJzdF92YWxpZF9tZm4pKQ0KPiAgI2RlZmluZSBfX25v
ZGVfZGlzdGFuY2UoYSwgYikgKDIwKQ0KPiAgDQo+IC1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGlu
dCBhcmNoX2dldF9kbWFfYml0c2l6ZSh2b2lkKQ0KPiAtew0KPiAtICAgIHJldHVybiAzMjsNCj4g
LX0NCj4gLQ0KPiAgI2VuZGlmIC8qIF9fQVJDSF9BUk1fTlVNQV9IICovDQo+ICAvKg0KPiAgICog
TG9jYWwgdmFyaWFibGVzOg0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9wbGF0
Zm9ybS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wbGF0Zm9ybS5oDQo+IGluZGV4IGVkNGQzMGEx
YmU3Yy4uOTk3ZWIyNTIxNjMxIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3Bs
YXRmb3JtLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wbGF0Zm9ybS5oDQo+IEBAIC0z
OCw2ICszOCw4IEBAIHN0cnVjdCBwbGF0Zm9ybV9kZXNjIHsNCj4gICAgICAgKiBMaXN0IG9mIGRl
dmljZXMgd2hpY2ggbXVzdCBub3QgcGFzcy10aHJvdWdoIHRvIGEgZ3Vlc3QNCj4gICAgICAgKi8N
Cj4gICAgICBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX21hdGNoICpibGFja2xpc3RfZGV2Ow0KPiAr
ICAgIC8qIE92ZXJyaWRlIHRoZSBETUEgd2lkdGggKDMyLWJpdCBieSBkZWZhdWx0KS4gKi8NCj4g
KyAgICB1bnNpZ25lZCBpbnQgZG1hX2JpdHNpemU7DQo+ICB9Ow0KPiAgDQo+ICAvKg0K

