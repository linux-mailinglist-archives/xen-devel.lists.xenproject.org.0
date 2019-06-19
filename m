Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9B84C05D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 19:56:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdemW-0007uj-PI; Wed, 19 Jun 2019 17:54:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=33VD=US=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hdemU-0007ue-Q3
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 17:53:59 +0000
X-Inumbo-ID: 35425469-92bb-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::619])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 35425469-92bb-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 17:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X30nhnABw1J/U60XV9TMhYY/sW+N6ZWcWi4VqjwdXGY=;
 b=UlsmDrFmULEoGpiopuQ1dudQLoLR+a+g/XrYM3A9y8QMGVPMhEECTYSuEoHeTFuQO5APvradT37sBfx+mGxX6Wymr5WCO4iCzYhZJ4ceQ39v9RclykTw/jwcX3/snIe64HT26jPhVaUyVIk/jBycNpZz9Rbi35gC3yHQbMsK4t5elYYlffcMBfQKZ/aMzg/ALNfri/gIOoTfkbKDVXsn9ZTmHvH+fjAo9WzlZMnolu/v6g7N+VK+yISN1mHaYa6dwjktHrb2vETQCObz3Sr/TsvtDfVFWwLafj3W6o8AeuBqhG48hACzpi6eKC8S0VDtltw3c+5zbAs/ytrm2Wnh/A==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB6051.eurprd03.prod.outlook.com (10.255.31.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 17:53:54 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Wed, 19 Jun 2019
 17:53:54 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v7 0/5] TEE mediator (and OP-TEE) support in XEN
Thread-Index: AQHVJsf122+ynJomNU+/Y8TohUcOOw==
Date: Wed, 19 Jun 2019 17:53:54 +0000
Message-ID: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 912eff33-359a-4669-7b4f-08d6f4df187a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6051; 
x-ms-traffictypediagnostic: AM0PR03MB6051:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <AM0PR03MB605122A5FEEC904E694A2AEFE6E50@AM0PR03MB6051.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(396003)(136003)(39860400002)(346002)(189003)(199004)(81156014)(186003)(3846002)(76116006)(26005)(6506007)(14454004)(72206003)(64756008)(6436002)(2616005)(1076003)(2351001)(54906003)(486006)(4326008)(5660300002)(36756003)(6486002)(80792005)(66556008)(8936002)(66446008)(55236004)(66946007)(71190400001)(476003)(102836004)(68736007)(66476007)(71200400001)(99286004)(53936002)(6512007)(7736002)(6306002)(86362001)(8676002)(966005)(25786009)(73956011)(305945005)(316002)(2501003)(66066001)(14444005)(6116002)(478600001)(256004)(2906002)(5640700003)(91956017)(81166006)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6051;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BdSTZgy38jZJL5rFs2fK99CfH7WQ0NN13jZRG+0+2pqKel/VnVgXj2lgsk40yHXMzgfz5x2ON/ELIzh+FTtfxyWAtHHUCLFe/p4YTfvET7pdKuPAAtfg2tczRY4VY6d7U1u0vAF1d0b12weje1hqmYv+aXS99O+AAXZyCNyyzZQPL00EwabdIZJ+EVQALmD9pYSV1iIrDXZKwXLbFSvj9EdmcCGJNDmvIh0sZGzNGyxTsFz/r3/SPCKF70qBXDdI8hIwkvwlCI44NvN+BxnDcsb8I/NRCsbZCAWQDYQwIc5Z7yIsrRBC511U1Q/1oRNckfBWfoocjfv+wihDi/pMu/qE0gtTwHhIX0KPdwMqM2vFHzrXY3KGeTSHAlsR5/05kpOwHtYGmNvvR0bcle/VvOC1CS1ZFeyUjpKr29werBU=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912eff33-359a-4669-7b4f-08d6f4df187a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 17:53:54.3769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6051
Subject: [Xen-devel] [PATCH v7 0/5] TEE mediator (and OP-TEE) support in XEN
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gY29tbXVuaXR5LAoKUGxlYXNlIGZpbmQgbmV3IHZlcnNpb24gb2YgT1AtVEVFIHBhdGNo
IHNlcmllcy4gVGhpcyBpcyB0aGUga2luZCBvZgpmb2xsb3ctdXAgZm9yIHRoZSBwcmV2aW91cyB2
ZXJzaW9uLCBhcyBtb3N0IG9mIHRoZSBwYXRjaGVzIG9mIHRoZQpwcmV2aW91cyB2ZXJzaW9uIHdl
cmUgY29tbWl0ZWQuCgpUaGlzIHNlcmllcyBpbmNsdWRlcyBsZWZ0b3ZlcnMgb2YgdGhlIHByZXYu
IHZlcnNpb24gYW5kIHRocmVlIG5ldyBwYXRjaGVzLgpPbmUgb2YgdGhlIG5ldyBwYXRjaGVzIGFk
ZHMgYSB3YXkgdG8gZGV0ZWN0IGlmIE9QLVRFRSB3ZXJlIGJ1aWxkCndpdGggdmlydHVhbGl6YXRp
b24gc3VwcG9ydCBhbmQgdHdvIG90aGVycyBiZWFyIGNvc21ldGljIGNoYW5nZXMgdG8KS2NvbmZp
ZyBmaWxlcy4KClRoaXMgcGF0Y2hlcyBhbHNvIGNhbiAgYmUgcHVsbGVkIGZyb20gWzRdCgo9PQpD
aGFuZ2VzIGluIHY3OgogLSA4IG9mIDEwIHBhdGNoZXMgd2VyZSBjb21taXRlZAogLSBOZXcgcGF0
Y2ggInhlbi9hcm06IHRlZTogcGxhY2UgT1AtVEVFIEtjb25maWcgb3B0aW9uIHJpZ2h0IGFmdGVy
IFRFRSIKICAgcGxhY2VzIG9wdGlvbnMgaW4gbWVudWNvbmZpZyBpbiBtb3JlIG5hdHVyYWwgd2F5
CiAtIE5ldyBwYXRjaCAieGVuL2FybTogb3B0ZWU6IGNoZWNrIGlmIE9QLVRFRSBpcyB2aXJ0dWFs
aXphdGlvbi1hd2FyZSIKICAgZW5zdWVzIHRoYXQgT1AtVEVFIGlzIHZpcnR1YWxpemF0aW9uLWF3
YXJlCiAtIE5ldyBwYXRjaCAieGVuL2FybTogb3B0ZWU6IGRvY3VtZW50IE9QVEVFIG9wdGlvbiBp
biB0ZWUvS2NvbmZpZyIKICAgYWRkIHNob3J0IGRlc2NyaXB0aW9uIG9mIE9QLVRFRSBtZWRpYXRv
cgogLSBEb2N1bWVudGF0aW9uIGluICJ0b29scy9hcm06IHRlZTogYWRkICJ0ZWUiIG9wdGlvbiBm
b3IgeGwuY2ZnIgogICB3YXMgdXBkYXRlZAoKPT09CkNoYW5nZXMgaW4gdjY6CiAtIFNlcmllcyBy
ZWJhc2VkIHRvIHN0YWdpbmcgYnJhbmNoIGluc3RlYWQgb2YgbWFzdGVyIG9uZS4KIC0gT1AtVEVF
IHByb3RvY29sIGhlYWRlcnMgd2FzIHRha2VuIGZyb20gT1AtVEVFIHRyZWUgaW5zdGVhZCBvZgog
ICBMaW51eCBvbmUKIC0gQWRkZWQgYWNrZWQtYnkgdGFncwogLSBGaXhlZCAoYW5kIHRlc3RlZCkg
aXNzdWUgd2hlbiBYRU4gd291bGQgbm90IGJvb3QgaWYgaXQgaXMgYnVpbGQKICAgd2l0aCBDT05G
SUdfVEVFPW4KCj09PT0KQ2hhbmdlcyBpbiB2NToKIC0gU3Vic3RhbnRpYWwgcmV3b3JrIG9mIE9Q
LVRFRSBtZWRpYXRvci4gTm93IGl0IHRyaWVzIHRvIHJldHVybiBtZWFuaW5nZnVsCiAgIGVycm9y
IGNvZGVzIGJhY2sgdG8gdGhlIGd1ZXN0LgogLSBPUC1URUUgbWVkaWF0b3IgZG9lcyBub3QgdXNl
IHN0cnVjdCBjcHVfdXNlcl9yZWdzIGFzIGEgc3RvcmFnZSBmb3IKICAgcGFyYW1ldGVycyBhbmQg
cmV0dXJuIHZhbHVlcyB3aGVuIGNhbGxpbmcgT1AtVEVFLiBUaGlzIG1ha2VzIGl0CiAgIGNvbXBh
dGJpbGUgd2l0aCByZXF1aXJlbWVudCBmcm9tIFNNQ0NDLgogLSB0ZWU9bmF0aXZlIG9wdGlvbiBy
ZXBsYWNlZCB3aXRoIHRlZT1vcHRlZQogLSBBdXRob3JzaGlwIGFuZCBzLW8tYiB0YWcgcmVzZXQg
dG8gbXkgRVBBTSBtYWlsIGFkZHJlc3MKCj09PT0KQ2hhbmdlcyBpbiB2NDoKIC0gUGF0Y2ggImFy
bTogYWRkIHRlZV9lbmFibGVkIGZsYWcgdG8geGVuX2FyY2hfZG9tYWluY29uZmlnIiB3YXMKICAg
c3F1YXNoZWQgaW50byAieGVuL2FybTogYWRkIGdlbmVyaWMgVEVFIG1lZGlhdG9yIGZyYW1ld29y
ayIKIC0gSSBpbXBsZW1lbnRlZCBtb3JlIGVsYWJvcmF0ZSBlcnJvciByZXBvdGluZyB0byBhIGd1
ZXN0LiBOb3cgZ3Vlc3QKICAgd2lsbCBnZXQgbWVhbmluZ2Z1bCBlcnJvciBjb2RlcyBpbnN0ZWFk
IG9mIGdlbmVyaWMKICAgQVJNX1NNQ0NDX0VSUl9VTktOT1dOX0ZVTkNUSU9OLgoKPT09PQpDaGFu
Z2VzIGluIHYzOgogLSBVc2UgZG9tYWluIGZsYWdzIGluc3RlZCBvZiBkb21jdGwgaW50ZXJmYWNl
IHRvIGVuYWJsZSBvcHRlZSBmb3IgZ3Vlc3RzCiAtIFJlbW92ZSBwYXRjaCAibGlieGM6IGFkZCB4
Y19kb21fdGVlX2VuYWJsZSguLi4pIGZ1bmN0aW9uIiBiZWNhdXNlCiAgIG9mIHByZXZpb3VzIGNo
YW5nZQogLSBNZWRpYXRvciBub3cgc3RvcmVzIG93biBjb250ZXh0IGluIGFyY2ggcGFydCBvZiBz
dHJ1Y3QgZG9tYWluLCBzbwogICBJIHJlbW92ZWQgcGF0Y2ggIm9wdGVlOiBhZGQgZG9tYWluIGNv
bnRleHRzIgoKPT09PQpDaGFuZ2VzIGluIHYyOgoKVGhpcyBpcyB2MiBvZiBwYXRjaCBzZXJpZXMg
Zm9yIE9QLVRFRSBtZWRpYXRvciBzdXBwb3J0IGluIFhFTi4gQ2hhbmdlcyBmcm9tIHYxOgoKIC0g
QWRkZWQgZG9tY3RsIGludGVyZmFjZSwgc28gbm93IHhsIGRlY2lkZXMgd2hhdCBkb21haW4gc2hv
dWxkIHdvcmsgd2l0aCBURUUKIC0gUmVtb3ZlZCBYU00gc3VwcG9ydCBkdWUgdG8gY2hhbmdlIGRl
c2NyaWJlZCBhYm92ZQogLSBQYXRjaCB3aXRoIE9QLVRFRSBtZWRpYXRvciB3YXMgc3BsaXRlZCB0
byA3IHNlcGFyYXRlIHBhdGNoZXMKIC0gUmVtb3ZlZCBwYXRjaCB3aXRoIGNhbGxfc21jY2MoKSBm
dW5jdGlvbi4gTm93IHRoaXMgc2VyaWVzIGRlcGVuZCBvbgogICBKdWxpZW4gR3JhbGwncyBzZXJp
ZXMgInhlbi9hcm06IFNNQ0NDIGZpeHVwIGFuZCBpbXByb3ZlbWVudCIgWzNdCgo9PT09PQp2MToK
ClRoaXMgaXMgZm9sbG93IGZvciBwYXRjaCBzZXJpZXMgWzFdLiBUaGVyZSB3YXMgbG90cyBvZiBk
aXNjdXNzaW9ucwpmb3IgdGhhdCBzZXJpZXMgYW5kIEkgdHJpZWQgdG8gYWRkcmVzcyBhbGwgb2Yg
dGhlbSBpbiB0aGlzIG5ldyBwYXRjaHNldC4KCkN1cnJlbnRseSwgSSBoYWQgYSB3b3JraW5nIHNv
bHV0aW9uIGZvciBPUC1URUUgdmlydHVhbGl6YXRpb24gYW5kIGl0IGlzIGJlaW5nCnVwc3RyZWFt
ZWQgcmlnaHQgbm93IChbMl0pLiBTbywgSSB0aGluayBpdCBpcyBhIGdvb2QgdGltZSB0byBpbnRy
b2R1Y2Ugc3VwcG9ydAppbiBYRU4gYXMgd2VsbC4KClRoaXMgc2VyaWVzIGluY2x1ZGUgZ2VuZXJp
YyBURUUgbWVkaWF0b3IgZnJhbWV3b3JrIGFuZCBmdWxsLXNjYWxlIE9QLVRFRSBtZWRpYXRvcgp3
aGljaCBpcyB3b3JraW5nIHdpdGggbWVudGlvbmVkIGNoYWdlcyBpbiBPUC1URUUuIFNvLCBtdWx0
aXBsZSBkb21haW5zIGNhbgp3b3JrIHNpbXVsdGFuZW91c2x5IHdpdGggT1AtVEVFLgoKSSBhZGRl
ZCBYU00gc3VwcG9ydCwgc28gbm93IGl0IGlzIHBvc3NpYmxlIHRvIGNvbnRyb2wgd2hpY2ggZG9t
YWlucyBjYW4gd29yawp3aXRoIFRFRXMuIEFsc28gSSBjaGFuZ2VkIHdheSBob3cgVEVFIGRpc2Nv
dmVyeSBpcyBkb25lLiBOb3cgIGl0IGlzIHZlcnkKZ2VuZXJpYyBhbmQgc2hvdWxkIHN1cHBvcnQg
YW55IHBsYXRmb3JtLgoKWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxNy0xMC9tc2cwMTQ1MS5odG1sClsyXSBodHRwczovL2dpdGh1Yi5j
b20vT1AtVEVFL29wdGVlX29zL3B1bGwvMjM3MApbM10gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA4L21zZzAyMTM4Lmh0bWwKWzRdIGh0
dHBzOi8vZ2l0aHViLmNvbS9sb3JjL3hlbi90cmVlL29wdGVlX3Y3CgpWb2xvZHlteXIgQmFiY2h1
ayAoNSk6CiAgdG9vbHMvYXJtOiB0ZWU6IGFkZCAidGVlIiBvcHRpb24gZm9yIHhsLmNmZwogIHRv
b2xzL2FybTogb3B0ZWU6IGNyZWF0ZSBvcHRlZSBmaXJtd2FyZSBub2RlIGluIERUIGlmIHRlZT1v
cHRlZQogIHhlbi9hcm06IHRlZTogcGxhY2UgT1AtVEVFIEtjb25maWcgb3B0aW9uIHJpZ2h0IGFm
dGVyIFRFRQogIHhlbi9hcm06IG9wdGVlOiBjaGVjayBpZiBPUC1URUUgaXMgdmlydHVhbGl6YXRp
b24tYXdhcmUKICB4ZW4vYXJtOiBvcHRlZTogZG9jdW1lbnQgT1BURUUgb3B0aW9uIGluIHRlZS9L
Y29uZmlnCgogZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAgIHwgMjkgKysrKysrKysrKysrKysr
KysrKysrKysrKwogdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgIHwgIDUgKysrKysKIHRvb2xz
L2xpYnhsL2xpYnhsX2FybS5jICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIHRvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCB8ICA2ICsrKysrKwogdG9vbHMv
eGwveGxfcGFyc2UuYyAgICAgICAgIHwgIDkgKysrKysrKysKIHhlbi9hcmNoL2FybS9LY29uZmln
ICAgICAgICB8ICA0ICsrLS0KIHhlbi9hcmNoL2FybS90ZWUvS2NvbmZpZyAgICB8ICA1ICsrKysr
CiB4ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMgICAgfCAxMCArKysrKysrKysKIDggZmlsZXMgY2hh
bmdlZCwgMTA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
