Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9872AD0DE5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 13:46:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIAMJ-0000oN-NO; Wed, 09 Oct 2019 11:42:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ubei=YC=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1iIAMH-0000oI-OF
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 11:42:22 +0000
X-Inumbo-ID: d984d756-ea89-11e9-80e3-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d984d756-ea89-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 11:42:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpYb7kHJXP8aiXT4f4/coF5Qp0YG9HhbbqpgzG8ON0I3d31FcHa1BIEFBNLgCBdaXCTIpx4ytaHvq9STpVpfsi4ykP/LOaBhDMY7LsMyc6gz2zAsakpvjRgLBUEkZjVf6u/imy4N2yz0HQZUUEoq808I2N36jsRK0mEe5jLI4XQQ5cGUtwdZbNgqdVWozdCyguZQtDNT49vguGQEFMNLsOonZpi92oJI+ZxzzHEEFFbcmwrEGX0wmkXq8YGZzQLnq2gCSecaQXRZlI9JsctAW4lILVfp1mDymZZZ8Z7M/cWDT+5DKs2XsKOVuNsxmoStxxRbynNoz65Dt50PsYABKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOxJMxNkqREYsxq4TXAsCDRwvBimIbgUBGUqXZC8pV0=;
 b=eH9ccoEmce1agir4ZVMM+yysHLBmSninv701saTj13/ytGYWf14MkCf48YIRdkfAwvCZcVsEsBauhpm9H3OEAgBYSbCh9NVxNMK1BI2lVlDWdLx7CyhxEP2P3k324dWMw6xO15K4g7HR3MjzApU6VR/j4Y/uaQIU5dhpYAJ0Ki9QB1oodsHVtaR7DNAcwXr7xagEMno9+nVX/fjP0LiqqtClKSfmM92I23+jKTp5H4Ta6945jgxkLBzOyQy+mjvAQmMg/z1YUjIJImx8gPXw3DLi1gG5pCLQ/HAcejGJ58QfyqSkabyJWaqdy9YhsCjFKMQXhlfxnd5tGde93HLLWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOxJMxNkqREYsxq4TXAsCDRwvBimIbgUBGUqXZC8pV0=;
 b=B+APU4tSEIH4qIUifVGNDaDgzoc9VlnkVw8h6NL2bSfDNCMw8V1ENOV+aaMn2EaQf7yxDFyZFsvjcO4mpKvhxMZWSdb/IMZy4VdrtAA1bsd83KyX1qsCCFigyTkt49paDOn1mnGpCooEBQuYg+rJF3F3kmrpPxbw7qVSZZvKamw=
Received: from VE1PR03MB5968.eurprd03.prod.outlook.com (20.179.30.10) by
 VE1PR03MB5808.eurprd03.prod.outlook.com (20.179.31.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 11:42:17 +0000
Received: from VE1PR03MB5968.eurprd03.prod.outlook.com
 ([fe80::3822:884f:bc7b:ac62]) by VE1PR03MB5968.eurprd03.prod.outlook.com
 ([fe80::3822:884f:bc7b:ac62%7]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 11:42:17 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rob Herring <robh@kernel.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] xen: Stop abusing DT of_dma_configure API
Thread-Index: AQHVfhBzhlN6OkxJQ0qTWpE9XJwQU6dSMRCA
Date: Wed, 9 Oct 2019 11:42:16 +0000
Message-ID: <fd2f61bb-1ff8-f90b-9514-e662db2ff19f@epam.com>
References: <20191008194155.4810-1-robh@kernel.org>
In-Reply-To: <20191008194155.4810-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5670dc36-b7d8-41c0-71b1-08d74cadbcde
x-ms-traffictypediagnostic: VE1PR03MB5808:
x-microsoft-antispam-prvs: <VE1PR03MB5808334CD8E62BE80FE89530E7950@VE1PR03MB5808.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(189003)(199004)(5660300002)(256004)(486006)(11346002)(7736002)(4326008)(110136005)(55236004)(316002)(54906003)(102836004)(80792005)(2616005)(25786009)(71200400001)(446003)(186003)(6512007)(26005)(76176011)(7416002)(71190400001)(6506007)(53546011)(6246003)(305945005)(99286004)(36756003)(81156014)(229853002)(81166006)(2906002)(478600001)(8676002)(86362001)(66946007)(76116006)(66476007)(3846002)(66066001)(6436002)(66446008)(66556008)(14454004)(64756008)(31686004)(8936002)(31696002)(476003)(6116002)(6486002)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR03MB5808;
 H:VE1PR03MB5968.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: efHG9KrMLfxnaaGGyHISosv2r5wbE7i+nLWND6UjET2TDVPD88G3APyoFw8b97y3rWNBBfrmu/V00YSs6bR6MfXmrli5UhZ7d6uSrsjY6+6SguISOlQoqdWCUutdv/QwrRlTxEu3ci3POFs3PrQzGfJ5m+/rt+uXR2OUQYz2FJYwHbtHGTKClvGoCe3jtZAJ1nYHC4p8JZvrohJpucGGP4jUuE8yiCOCtzTLsJFpRiLIB3q5a3acONUNygvkq4VsWS9NRj7cWBNw/omlTVNePq+XAunI7/73tlG2KRRzP2Ew0qa0crC4ey/kS978DnDky8+Ew2ZaVvV4QFn0z45DFdFljCH2qdkC20gUahJa7eF41gGS2o8uRXvv1Xs5rBkXety1VLiOwoY6SCyb1Bky4c2SjC6gLlwDFnxTQxIPkHQ=
x-ms-exchange-transport-forked: True
Content-ID: <74E3CC96C535DD4DB55943D102EB7193@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5670dc36-b7d8-41c0-71b1-08d74cadbcde
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 11:42:17.1655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vwl2WseM7fH8PpDOWFnCtUoAStjMvs+Q6xhP9htESqJhbexpU3mmxKGPPfpwnxTq0WIgouWzymkVoUSATOibYxdrYK71Y8nHglDxk8tdnnkcy26uFvKGrFj2M+Scp6Ij
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5808
Subject: Re: [Xen-devel] [PATCH v2] xen: Stop abusing DT of_dma_configure API
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Julien Grall <julien.grall@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvOC8xOSAxMDo0MSBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEFzIHRoZSByZW1vdmVk
IGNvbW1lbnRzIHNheSwgdGhlc2UgYXJlbid0IERUIGJhc2VkIGRldmljZXMuDQo+IG9mX2RtYV9j
b25maWd1cmUoKSBpcyBnb2luZyB0byBzdG9wIGFsbG93aW5nIGEgTlVMTCBEVCBub2RlIGFuZCBj
YWxsaW5nDQo+IGl0IHdpbGwgbm8gbG9uZ2VyIHdvcmsuDQo+DQo+IFRoZSBjb21tZW50IGlzIGFs
c28gbm93IG91dCBvZiBkYXRlIGFzIG9mIGNvbW1pdCA5YWI5MWU3YzVjNTEgKCJhcm02NDoNCj4g
ZGVmYXVsdCB0byB0aGUgZGlyZWN0IG1hcHBpbmcgaW4gZ2V0X2FyY2hfZG1hX29wcyIpLiBEaXJl
Y3QgbWFwcGluZw0KPiBpcyBub3cgdGhlIGRlZmF1bHQgcmF0aGVyIHRoYW4gZG1hX2R1bW15X29w
cy4NCj4NCj4gQWNjb3JkaW5nIHRvIFN0ZWZhbm8gYW5kIE9sZWtzYW5kciwgdGhlIG9ubHkgb3Ro
ZXIgcGFydCBuZWVkZWQgaXMNCj4gc2V0dGluZyB0aGUgRE1BIG1hc2tzIGFuZCB0aGVyZSdzIG5v
IHJlYXNvbiB0byByZXN0cmljdCB0aGUgbWFza3MgdG8NCj4gMzItYml0cy4gU28gc2V0IHRoZSBt
YXNrcyB0byA2NCBiaXRzLg0KPg0KPiBDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJt
LmNvbT4NCj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+IENjOiBO
aWNvbGFzIFNhZW56IEp1bGllbm5lIDxuc2FlbnpqdWxpZW5uZUBzdXNlLmRlPg0KPiBDYzogT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0K
PiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4NCj4gQ2M6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQpBY2tlZC1ieTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KDQpVbmZv
cnR1bmF0ZWx5IEkgY2Fubm90IHRlc3QgdGhpcyBwYXRjaCB3aXRoIHJlYWwgSFcgcnVubmluZyBY
ZW46DQpJIGFtIHN0aWxsIG9uIDQuMTQga2VybmVsIHdoaWNoIGlzIGRpY3RhdGVkIGJ5IHRoZSBi
b2FyZCdzIEJTUCBhbmQNCml0IGlzIG5vdCBwb3NzaWJsZSB0byBoYXZlIG1vcmUgcmVjZW50IG9u
ZSBhdCB0aGUgbW9tZW50Lg0KU28sIEkgaG9wZSB0aGUgcGF0Y2ggd2lsbCB3b3JrIGFzIGludGVu
ZGVkLg0KDQpUaGFuayB5b3UsDQpPbGVrc2FuZHINCj4gLS0tDQo+IHYyOg0KPiAgIC0gU2V0dXAg
ZG1hIG1hc2tzDQo+ICAgLSBBbHNvIGZpeCB4ZW5fZHJtX2Zyb250LmMNCj4gICANCj4gVGhpcyBj
YW4gbm93IGJlIGFwcGxpZWQgdG8gdGhlIFhlbiB0cmVlIGluZGVwZW5kZW50IG9mIHRoZSBjb21p
bmcNCj4gb2ZfZG1hX2NvbmZpZ3VyZSgpIGNoYW5nZXMuDQo+DQo+IFJvYg0KPg0KPiAgIGRyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jIHwgMTIgKystLS0tLS0tLS0tDQo+ICAgZHJp
dmVycy94ZW4vZ250ZGV2LmMgICAgICAgICAgICAgICAgfCAxMyArKy0tLS0tLS0tLS0tDQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQ0KPg0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMgYi9kcml2ZXJz
L2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYw0KPiBpbmRleCBiYTE4MjhhY2Q4YzkuLjRiZTQ5
YzFhZWY1MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMNCj4gQEAgLTcx
OCwxNyArNzE4LDkgQEAgc3RhdGljIGludCB4ZW5fZHJ2X3Byb2JlKHN0cnVjdCB4ZW5idXNfZGV2
aWNlICp4Yl9kZXYsDQo+ICAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZ4Yl9kZXYtPmRldjsNCj4g
ICAJaW50IHJldDsNCj4gICANCj4gLQkvKg0KPiAtCSAqIFRoZSBkZXZpY2UgaXMgbm90IHNwYXdu
IGZyb20gYSBkZXZpY2UgdHJlZSwgc28gYXJjaF9zZXR1cF9kbWFfb3BzDQo+IC0JICogaXMgbm90
IGNhbGxlZCwgdGh1cyBsZWF2aW5nIHRoZSBkZXZpY2Ugd2l0aCBkdW1teSBETUEgb3BzLg0KPiAt
CSAqIFRoaXMgbWFrZXMgdGhlIGRldmljZSByZXR1cm4gZXJyb3Igb24gUFJJTUUgYnVmZmVyIGlt
cG9ydCwgd2hpY2gNCj4gLQkgKiBpcyBub3QgY29ycmVjdDogdG8gZml4IHRoaXMgY2FsbCBvZl9k
bWFfY29uZmlndXJlKCkgd2l0aCBhIE5VTEwNCj4gLQkgKiBub2RlIHRvIHNldCBkZWZhdWx0IERN
QSBvcHMuDQo+IC0JICovDQo+IC0JZGV2LT5jb2hlcmVudF9kbWFfbWFzayA9IERNQV9CSVRfTUFT
SygzMik7DQo+IC0JcmV0ID0gb2ZfZG1hX2NvbmZpZ3VyZShkZXYsIE5VTEwsIHRydWUpOw0KPiAr
CXJldCA9IGRtYV9jb2VyY2VfbWFza19hbmRfY29oZXJlbnQoZGV2LCBETUFfQklUX01BU0soNjQp
KTsNCj4gICAJaWYgKHJldCA8IDApIHsNCj4gLQkJRFJNX0VSUk9SKCJDYW5ub3Qgc2V0dXAgRE1B
IG9wcywgcmV0ICVkIiwgcmV0KTsNCj4gKwkJRFJNX0VSUk9SKCJDYW5ub3Qgc2V0dXAgRE1BIG1h
c2ssIHJldCAlZCIsIHJldCk7DQo+ICAgCQlyZXR1cm4gcmV0Ow0KPiAgIAl9DQo+ICAgDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9nbnRkZXYuYyBiL2RyaXZlcnMveGVuL2dudGRldi5jDQo+
IGluZGV4IGE0NDZhNzIyMWUxMy4uODE0MDFmMzg2YzljIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3hlbi9nbnRkZXYuYw0KPiArKysgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYw0KPiBAQCAtMjIsNiAr
MjIsNyBAQA0KPiAgIA0KPiAgICNkZWZpbmUgcHJfZm10KGZtdCkgInhlbjoiIEtCVUlMRF9NT0RO
QU1FICI6ICIgZm10DQo+ICAgDQo+ICsjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4NCj4g
ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5o
Pg0KPiAgICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQo+IEBAIC0zNCw5ICszNSw2IEBADQo+ICAg
I2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvaGlnaG1lbS5oPg0K
PiAgICNpbmNsdWRlIDxsaW51eC9yZWZjb3VudC5oPg0KPiAtI2lmZGVmIENPTkZJR19YRU5fR1JB
TlRfRE1BX0FMTE9DDQo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+IC0jZW5kaWYN
Cj4gICANCj4gICAjaW5jbHVkZSA8eGVuL3hlbi5oPg0KPiAgICNpbmNsdWRlIDx4ZW4vZ3JhbnRf
dGFibGUuaD4NCj4gQEAgLTYyNSwxNCArNjIzLDcgQEAgc3RhdGljIGludCBnbnRkZXZfb3Blbihz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmxpcCkNCj4gICAJZmxpcC0+cHJpdmF0
ZV9kYXRhID0gcHJpdjsNCj4gICAjaWZkZWYgQ09ORklHX1hFTl9HUkFOVF9ETUFfQUxMT0MNCj4g
ICAJcHJpdi0+ZG1hX2RldiA9IGdudGRldl9taXNjZGV2LnRoaXNfZGV2aWNlOw0KPiAtDQo+IC0J
LyoNCj4gLQkgKiBUaGUgZGV2aWNlIGlzIG5vdCBzcGF3biBmcm9tIGEgZGV2aWNlIHRyZWUsIHNv
IGFyY2hfc2V0dXBfZG1hX29wcw0KPiAtCSAqIGlzIG5vdCBjYWxsZWQsIHRodXMgbGVhdmluZyB0
aGUgZGV2aWNlIHdpdGggZHVtbXkgRE1BIG9wcy4NCj4gLQkgKiBGaXggdGhpcyBieSBjYWxsaW5n
IG9mX2RtYV9jb25maWd1cmUoKSB3aXRoIGEgTlVMTCBub2RlIHRvIHNldA0KPiAtCSAqIGRlZmF1
bHQgRE1BIG9wcy4NCj4gLQkgKi8NCj4gLQlvZl9kbWFfY29uZmlndXJlKHByaXYtPmRtYV9kZXYs
IE5VTEwsIHRydWUpOw0KPiArCWRtYV9jb2VyY2VfbWFza19hbmRfY29oZXJlbnQocHJpdi0+ZG1h
X2RldiwgRE1BX0JJVF9NQVNLKDY0KSk7DQo+ICAgI2VuZGlmDQo+ICAgCXByX2RlYnVnKCJwcml2
ICVwXG4iLCBwcml2KTsNCj4gICANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
