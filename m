Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD35B0427
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 20:52:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i87fY-0004yU-4k; Wed, 11 Sep 2019 18:48:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b1gu=XG=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i87fW-0004xx-Co
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 18:48:42 +0000
X-Inumbo-ID: c572e26a-d4c4-11e9-b299-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c572e26a-d4c4-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 18:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBHbAzUHf1b+HlBcqqrpxoj7NEXrc1md8WA3c6hwrm1w0N6OwFwIrChc5M7lFgU5J7vXmWQEfcXUCsbnx6JMgfWrZbWCOACKvOyFY8Uw9xS70lszQUcqDbK1+3LvE8eaobs9uYDRStUq6QqJ9+UD0vA2DOsITNSe8SBTTFxOwbWLm4egluAC5WgXLvc3AvR1nwRmf5y4gF/CEzEv0RQTM5SJe7qlLH8mmVHay8Z3Ssoy5Uy9WJ53Rs+a0N3dWn6x1JwdqmKs6ONtS8UcGuz8nyUZYPREOswZpjzOiSv9AZBfY59Tl60eKoveEYMlUDZsyS9vE01Beb8DVbq9LSnjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCNp7nmmnTGkbvBfGGeLqYbDTghMkRrAfai0syFg6c8=;
 b=ZRLlLfpVm9tC8cvEy8agUuSMIhGJN4ui61wTNiYXYaLXm4bxkFfpbZRKWtySXpgHxbNztZDqsnKjrkdxcEbt0gJEhzqIGisjHn9B6GELK2K+xpK16LV00zxBBJn2ulAubKDL5ZrRf+2SW5ZPo3Y8hxxiOpVUsy8vBGowCyacCmmakABWdzcGZOc4zMpkwBzlfoMoFCvtBgMbOEPdyp1G5nAw9cXjDNMJ9GN7ugyLW4Jwx4vklkQbSj05oCvrHU5liC2Zr8MBs3tzPIAvgObXUt4qryh6F9S8mGsXiwHkVB0ipKvC1MyFtOh4V0dJ2/O2NOiqjj1wO8ZK1pai+XcYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCNp7nmmnTGkbvBfGGeLqYbDTghMkRrAfai0syFg6c8=;
 b=EgnwnrULY2FRMxL5/Ozt97HsmDk0rY4qb+cVmj+MJZF1vzWw0WWoF2GvJ6N/2rkm57HLXMJW1Gp0f7Tl5znn50raxbB3P8P0yUEN6SHBTxEA/e9Ku4nV9LFxzLh/PGz7VbTMnwzq4dsodbE3DLYNTLcw6Mc5Esv/StpjI/0M8GM=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3779.eurprd03.prod.outlook.com (52.135.146.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Wed, 11 Sep 2019 18:48:39 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 11 Sep 2019
 18:48:39 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 1/5] xen/arm: optee: impose limit on shared buffer size
Thread-Index: AQHVWeNlCY0CqDi7zE2giEuaPhvOCqckA0sAgALr+QA=
Date: Wed, 11 Sep 2019 18:48:39 +0000
Message-ID: <87k1aefz3t.fsf@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-2-volodymyr_babchuk@epam.com>
 <45208af4-22b8-2870-f79d-a98960c4700d@arm.com>
In-Reply-To: <45208af4-22b8-2870-f79d-a98960c4700d@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd119fff-e8ac-4d74-c6ec-08d736e8a920
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB3779; 
x-ms-traffictypediagnostic: AM0PR03MB3779:|AM0PR03MB3779:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB37792D5AB07E0E8FAD7BFD25E6B10@AM0PR03MB3779.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(52084003)(189003)(199004)(81166006)(81156014)(6436002)(8936002)(26005)(86362001)(229853002)(6916009)(8676002)(5660300002)(99286004)(6246003)(76116006)(91956017)(486006)(66476007)(11346002)(476003)(66946007)(66446008)(64756008)(66556008)(316002)(6512007)(446003)(80792005)(186003)(25786009)(2616005)(53936002)(4326008)(76176011)(6486002)(54906003)(71190400001)(71200400001)(2906002)(478600001)(66066001)(102836004)(14454004)(6116002)(305945005)(7736002)(55236004)(6506007)(256004)(14444005)(53546011)(3846002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3779;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: o031nHqepszZ9VTEIp5VDRHXJF0+zy+jiQNeAn+DWY1uhmYeyopK3LEp7TnxzDtKxCojfkKmaEi5V2RZuU2gZiIMqMJDFiqw7n29WJWNHGerioeAOKfAN/1Ez6neWCke9dF6V9KXyJ/SbnKCKUei93FRLrWBfeaFXo4AMHSUcNCEWVk0vTecp8xJC6Vju0fD5pZqJPd3g0WVP2OM0cIiEtni5qdUTBdKbsVtZGU4U9JePeT0J2VDSK/S0aZHYpJLJs1tHsx6ubziunyhvHmsWnCFGVI1dr8dm6I24Xyc8UZls+yk66+eyGhlSmY58JkaCGXZQywRr68FHMTJaMyspc49/aD6WkJuq34fuMdXaYOK/bd+6XXiPczB75OHsfIjFBSMii6jsSaRk4gfUAGli24vnzEOBXhjJUZdZhuC5t0=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd119fff-e8ac-4d74-c6ec-08d736e8a920
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 18:48:39.3055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1zDnaby2aT1pECkZZMLOjTDniWpx+ti0X7kNGPDenQUACrqhGfB04oLnKMQX7bBo3JkFccRU/aYuhr49S8f772gQGDlyjDN0bsM3ELqeiGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3779
Subject: Re: [Xen-devel] [PATCH 1/5] xen/arm: optee: impose limit on shared
 buffer size
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpIFZvbG9keW15ciwKPgo+IE9uIDgvMjMvMTkgNzo0
OCBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+IFdlIHdhbnQgdG8gbGltaXQgbnVtYmVy
IG9mIGNhbGxzIHRvIGxvb2t1cF9hbmRfcGluX2d1ZXN0X3JhbV9hZGRyKCkKPj4gcGVyIG9uZSBy
ZXF1ZXN0LiBUaGVyZSBhcmUgdHdvIHdheXMgdG8gZG8gdGhpczogZWl0aGVyIHByZWVtcHQKPj4g
dHJhbnNsYXRlX25vbmNvbnRpZygpIG9yIHRvIGxpbWl0IHNpemUgb2Ygb25lIHNoYXJlZCBidWZm
ZXIgc2l6ZS4KPj4KPj4gSXQgaXMgcXVpdGUgaGFyZCB0byBwcmVlbXB0IHRyYW5zbGF0ZV9ub25j
b250aWcoKSwgYmVjYXVzZSBpdCBpcyBkZWVwCj4+IG5lc3RlZC4gU28gd2UgY2hvc2Ugc2Vjb25k
IG9wdGlvbi4gV2Ugd2lsbCBhbGxvdyA1MTIgcGFnZXMgcGVyIG9uZQo+PiBzaGFyZWQgYnVmZmVy
LiBUaGlzIGRvZXMgbm90IGludGVyZmVyZSB3aXRoIEdQIHN0YW5kYXJkLCBhcyBpdAo+PiByZXF1
aXJlcyB0aGF0IHNpemUgbGltaXQgZm9yIHNoYXJlZCBidWZmZXIgc2hvdWxkIGJlIGF0IGxlc3Qg
NTEya0IuCj4KPiBEbyB5b3UgbWVhbiAibGVhc3QiIGluc3RlYWQgb2YgImxlc3QiPwpZZXMKCj4g
SWYgc28sIHdoeSA1MTIgcGFnZXMgKGkuZSAxTUIpCj4gaXMgcGxlbnR5IGVub3VnaCBmb3IgbW9z
dCBvZiB0aGUgdXNlIGNhc2VzPyBXaGF0IGRvZXMgInh0ZXN0IiBjb25zaXN0Cj4gb24/CkJpZ2dl
ciBidWZmZXIgeHRlc3QgdHJpZXMgdG8gYWxsb2NhdGUgaXMgbWVyZSAzMktCLiBJIGJlbGlldmUg
dGhhdCAxTUIKaXMgZW5vdWdoIGZvciB0aGUgbW9zdCBjYXNlcywgYmVjYXVzZSBPUC1URUUgaXRz
ZWxmIGhhdmUgYSB2ZXJ5IGxpbWl0ZWQKcmVzb3VyY2VzLiBCdXQgdGhpcyB2YWx1ZSBpcyBjaG9z
ZW4gYXJiaXRyYXJ5LgoKPgo+PiBBbHNvLCB3aXRoIHRoaXMgbGltaXRhdGlvbiBPUC1URUUgc3Rp
bGwgcGFzc2VzIG93biAieHRlc3QiIHRlc3Qgc3VpdGUsCj4+IHNvIHRoaXMgaXMgb2theSBmb3Ig
bm93Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2Jh
YmNodWtAZXBhbS5jb20+Cj4+IC0tLQo+PiAgIHhlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYyB8IDMw
ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS90ZWUvb3B0ZWUuYyBiL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYwo+PiBpbmRleCBlYzU0
MDJlODliLi5mNGZhOGE3NzU4IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL29wdGVl
LmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jCj4+IEBAIC03Miw2ICs3MiwxNyBA
QAo+PiAgICAqLwo+PiAgICNkZWZpbmUgTUFYX1RPVEFMX1NNSF9CVUZfUEcgICAgMTYzODQKPj4g
ICArLyoKPj4gKyAqIEFyYml0cmFyeSB2YWx1ZSB0aGF0IGxpbWl0cyBtYXhpbXVtIHNoYXJlZCBi
dWZmZXIgc2l6ZS4gSXQgaXMKPj4gKyAqIG1lcmVseSBjb2luY2lkZW5jZSB0aGF0IGl0IGVxdWFs
cyB0byBib3RoIGRlZmF1bHQgT1AtVEVFIFNITSBidWZmZXIKPj4gKyAqIHNpemUgbGltaXQgYW5k
IHRvICgxIDw8IENPTkZJR19ET01VX01BWF9PUkRFUikuIFBsZWFzZSBub3RlIHRoYXQKPj4gKyAq
IHRoaXMgZGVmaW5lIGxpbWl0cyBudW1iZXIgb2YgcGFnZXMuIEJ1dCB1c2VyIGJ1ZmZlciBjYW4g
YmUgbm90Cj4+ICsgKiBhbGlnbmVkIHRvIGEgcGFnZSBib3VuZGFyeS4gU28gaXQgaXMgcG9zc2li
bGUgdGhhdCB1c2VyIHdvdWxkIG5vdAo+PiArICogYmUgYWJsZSB0byBzaGFyZSBleGFjdGx5IE1B
WF9TSE1fQlVGRkVSX1BHICogUEFHRV9TSVpFIGJ5dGVzIHdpdGgKPj4gKyAqIE9QLVRFRS4KPj4g
KyAqLwo+PiArI2RlZmluZSBNQVhfU0hNX0JVRkZFUl9QRyAgICAgICA1MTIKPj4gKwo+PiAgICNk
ZWZpbmUgT1BURUVfS05PV05fTlNFQ19DQVBTIE9QVEVFX1NNQ19OU0VDX0NBUF9VTklQUk9DRVNT
T1IKPj4gICAjZGVmaW5lIE9QVEVFX0tOT1dOX1NFQ19DQVBTIChPUFRFRV9TTUNfU0VDX0NBUF9I
QVZFX1JFU0VSVkVEX1NITSB8IFwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBP
UFRFRV9TTUNfU0VDX0NBUF9VTlJFR0lTVEVSRURfU0hNIHwgXAo+PiBAQCAtNjk3LDE1ICs3MDgs
MTcgQEAgc3RhdGljIGludCB0cmFuc2xhdGVfbm9uY29udGlnKHN0cnVjdCBvcHRlZV9kb21haW4g
KmN0eCwKPj4gICAgICAgc2l6ZSA9IFJPVU5EVVAocGFyYW0tPnUudG1lbS5zaXplICsgb2Zmc2V0
LCBPUFRFRV9NU0dfTk9OQ09OVElHX1BBR0VfU0laRSk7Cj4+ICAgICAgICAgcGdfY291bnQgPSBE
SVZfUk9VTkRfVVAoc2l6ZSwKPj4gT1BURUVfTVNHX05PTkNPTlRJR19QQUdFX1NJWkUpOwo+PiAr
ICAgIGlmICggcGdfY291bnQgPiBNQVhfU0hNX0JVRkZFUl9QRyApCj4+ICsgICAgICAgIHJldHVy
biAtRU5PTUVNOwo+PiArCj4+ICAgICAgIG9yZGVyID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMoZ2V0
X3BhZ2VzX2xpc3Rfc2l6ZShwZ19jb3VudCkpOwo+PiAgICAgICAgIC8qCj4+IC0gICAgICogSW4g
dGhlIHdvcnN0IGNhc2Ugd2Ugd2lsbCB3YW50IHRvIGFsbG9jYXRlIDMzIHBhZ2VzLCB3aGljaCBp
cwo+PiAtICAgICAqIE1BWF9UT1RBTF9TTUhfQlVGX1BHLzUxMSByb3VuZGVkIHVwLiBUaGlzIGdp
dmVzIG9yZGVyIDYgb3IgYXQKPj4gLSAgICAgKiBtb3N0IDY0IHBhZ2VzIGFsbG9jYXRlZC4gVGhp
cyBidWZmZXIgd2lsbCBiZSBmcmVlZCByaWdodCBhZnRlcgo+PiAtICAgICAqIHRoZSBlbmQgb2Yg
dGhlIGNhbGwgYW5kIHRoZXJlIGNhbiBiZSBubyBtb3JlIHRoYW4KPj4gKyAgICAgKiBJbiB0aGUg
d29yc3QgY2FzZSB3ZSB3aWxsIHdhbnQgdG8gYWxsb2NhdGUgMiBwYWdlcywgd2hpY2ggaXMKPj4g
KyAgICAgKiBNQVhfU0hNX0JVRkZFUl9QRy81MTEgcm91bmRlZCB1cC4gVGhpcyBidWZmZXIgd2ls
bCBiZSBmcmVlZAo+PiArICAgICAqIHJpZ2h0IGFmdGVyIHRoZSBlbmQgb2YgdGhlIGNhbGwgYW5k
IHRoZXJlIGNhbiBiZSBubyBtb3JlIHRoYW4KPj4gICAgICAgICogbWF4X29wdGVlX3RocmVhZHMg
Y2FsbHMgc2ltdWx0YW5lb3VzbHkuIFNvIGluIHRoZSB3b3JzdCBjYXNlCj4+IC0gICAgICogZ3Vl
c3QgY2FuIHRyaWNrIHVzIHRvIGFsbG9jYXRlIDY0ICogbWF4X29wdGVlX3RocmVhZHMgcGFnZXMg
aW4KPj4gKyAgICAgKiBndWVzdCBjYW4gdHJpY2sgdXMgdG8gYWxsb2NhdGUgMiAqIG1heF9vcHRl
ZV90aHJlYWRzIHBhZ2VzIGluCj4+ICAgICAgICAqIHRvdGFsLgo+PiAgICAgICAgKi8KPj4gICAg
ICAgeGVuX3BncyA9IGFsbG9jX2RvbWhlYXBfcGFnZXMoY3VycmVudC0+ZG9tYWluLCBvcmRlciwg
MCk7Cj4+IEBAIC03NDcsMTMgKzc2MCw2IEBAIHN0YXRpYyBpbnQgdHJhbnNsYXRlX25vbmNvbnRp
ZyhzdHJ1Y3Qgb3B0ZWVfZG9tYWluICpjdHgsCj4+ICAgICAgICAgICAgICAgeGVuX2RhdGEgPSBf
X21hcF9kb21haW5fcGFnZSh4ZW5fcGdzKTsKPj4gICAgICAgICAgIH0KPj4gICAtICAgICAgICAv
Kgo+PiAtICAgICAgICAgKiBUT0RPOiBUaGF0IGZ1bmN0aW9uIGNhbiBwaW4gdXAgdG8gNjRNQiBv
ZiBndWVzdCBtZW1vcnkgYnkKPj4gLSAgICAgICAgICogY2FsbGluZyBsb29rdXBfYW5kX3Bpbl9n
dWVzdF9yYW1fYWRkcigpIDE2Mzg0IHRpbWVzCj4+IC0gICAgICAgICAqIChhc3N1bWluZyB0aGF0
IFBBR0VfU0laRSBlcXVhbHMgdG8gNDA5NikuCj4+IC0gICAgICAgICAqIFRoaXMgc2hvdWxkIGJl
IGFkZHJlc3NlZCBiZWZvcmUgZGVjbGFyaW5nIE9QLVRFRSBzZWN1cml0eQo+PiAtICAgICAgICAg
KiBzdXBwb3J0ZWQuCj4+IC0gICAgICAgICAqLwo+PiAgICAgICAgICAgQlVJTERfQlVHX09OKFBB
R0VfU0laRSAhPSA0MDk2KTsKPgo+IFdpdGhvdXQgdGhlIGNvbW1lbnQsIHRoZSBCVUlMRF9CVUdf
T04oKSBsb29rcyByYW5kb20uIFNvIGVpdGhlciB5b3UKPiB3YW50IHRvIGhhdmUgYSBkaWZmZXJl
bnQgdmVyc2lvbiBvZiB0aGUgY29tbWVudCBvciB5b3Ugd2FudCB0byBtb3ZlCj4gdGhlIEJVSUxE
X0JVR19PTigpIHRvIHNvbWV3aGVyZSBlbHNlLgoKSXQgaXMgc3RpbGwgYmVmb3JlIGdldF9kb21h
aW5fcmFtX3BhZ2UoKSBjYWxsLiBCdXQgZm9yIGNsYXJpdHkgSSBjYW4gYWRkCmNvbW1lbnQgbGlr
ZSAiT25seSA0ayBwYWdlcyBhcmUgc3VwcG9ydGVkIHJpZ2h0IG5vdyIuCj4+ICAgICAgICAgICBw
YWdlID0gZ2V0X2RvbWFpbl9yYW1fcGFnZShnYWRkcl90b19nZm4oZ3Vlc3RfZGF0YS0+cGFnZXNf
bGlzdFtpZHhdKSk7Cj4+ICAgICAgICAgICBpZiAoICFwYWdlICkKPj4KPgo+IENoZWVycywKCgot
LSAKVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
