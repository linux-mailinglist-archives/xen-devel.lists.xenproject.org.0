Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C78C08B2
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:37:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDsGe-0005Sl-Lv; Fri, 27 Sep 2019 15:34:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDsGc-0005Sb-Vo
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:34:47 +0000
X-Inumbo-ID: 54f42a06-e13c-11e9-bf31-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::621]) by localhost (Halon) with ESMTPS
 id 54f42a06-e13c-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 15:34:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUUtOlpylyL13DpQ6ugE7OUR+itIV+rnxd8lbSyU4YvZV3hnI2S7iSjH2hEpjHcFAc+Fdl2FrIhNGJ9akxzyvYrCb9WcpdRyevtUj7tiGfOpoEoCM5PO7S6mnOfFzO75MsQyTcC8r6gEHzQFXQlZPZMjh5WZZFw/jruHWFiUmfTOtds7cWhSc7P70A/jjzQFTMvLhDq9wTyL/X9IcL63r7lUoKxABcVIA0WoShxp80E5VrIo8es9rfBwB2LTYVsS4RgPrUj5dfz8WsRUIgvWXtzswSP0hoZvZLE3FwhF46XzbtRXi76lh+GeFYtC1eOm5VFKgm+BnoNvEPzlS1OS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc1K7PvVaakiog/+ssz6pIa48uAPTbxWsoa8AMjzl6o=;
 b=Trvf1ViW80cGieoORCGKxS+0BViUtdVjpH5DOoo8ApHtoLkMlQMYZ5EXNhEE/aMcrP/KvcfCdhWSfgDxrqnjDssmhFSLXYbHf2cxwqJBXdN7KHMS/y+VipJK+BoDAqGd/B5MTgB0Gy+fMGWBicE17OjF5A2Ef2ZYhpgi0pKwiRBFzlkyat6hBP/EHKLwpAnN1NBcBql12zFq+4iTc0KvxRRKKY54HmGyQVo+lfKfuyS+LxHudhNFD7g9vnZ1zTSz0ADuyk3kkQZWf/3Uwg8rFnzI8RZFTvs5cxISW0bFS/7ZQXGYicy8rJgluQwsQDobYjMBnkP3DQtWOoD7INX23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc1K7PvVaakiog/+ssz6pIa48uAPTbxWsoa8AMjzl6o=;
 b=jM3OUkdZXGAauHssyEAJ4yxYwmPZpzOrZnfD9h77rv9WrO6RRLlHj2QZRwEBEi8we0lb6YOx2JY5hl5ICDDPsbPVX/ViZCoNsKorAXC+UFAI2IXoZTZTJlx7tLZfrjfjVnlhXX+ePL1WNKayogtHGGLwdM89Mrl9jp8A+7wSLQI=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3891.eurprd03.prod.outlook.com (52.135.146.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Fri, 27 Sep 2019 15:34:44 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 15:34:44 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 08/10] xen/arm: alternative: add auto-nop
 infrastructure
Thread-Index: AQHVdJmVEemrUGDvaUSmkI1ETa3zKqc/qPeA
Date: Fri, 27 Sep 2019 15:34:44 +0000
Message-ID: <87impd92i4.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-9-julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-9-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c6dee42-f83f-4300-bfc2-08d743603899
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3891; 
x-ms-traffictypediagnostic: AM0PR03MB3891:|AM0PR03MB3891:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB3891AF1D13E4AA7375951C46E6810@AM0PR03MB3891.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(189003)(199004)(486006)(11346002)(316002)(76116006)(80792005)(66946007)(7736002)(478600001)(4326008)(5660300002)(8936002)(229853002)(6246003)(256004)(6436002)(86362001)(6512007)(6486002)(186003)(55236004)(26005)(102836004)(36756003)(25786009)(14454004)(2906002)(71190400001)(71200400001)(91956017)(81166006)(6506007)(76176011)(54906003)(99286004)(2616005)(3846002)(8676002)(81156014)(6116002)(476003)(6916009)(66476007)(64756008)(66446008)(446003)(305945005)(66066001)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3891;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kUFLozgw5/NVJ1SXgZ4gYw6aJEdzgOMDwFzjcZ1li0p6tNydXwUQlafGxnheg0/t+bDWQq1uufR2SHVgMstF+LQwNZnp872gVUmVuaMjw+ZQ8AhWfTJlcigZe96GlRvXxfNWgtmDUEHvkbDisl2MWecGmdLftoueu8Iw9L3FXGMwNST9uOTrwHa+oWzvImqBnKByqIQWG/tENMLvgtX+d3GhL/x6dXPRUxPg8pPNerxxu4WBsmZQakbxSr9/8oFARy8Zj8rM0cEUZyrplR2Og1iiaCGHiHEqwNWNKVHP9iy7UhginSwl1rFsZEq1YYeBlHPfr4IC8uQMUruvCp5DeIEIECXr9krk/j2W7PPIxJo5r7R9oyNaW35JU+JeD+qOUxmF7y7OVvfGnkwQ8EjCsG2ZmdQrAO88l7+kH3YeopE=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6dee42-f83f-4300-bfc2-08d743603899
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 15:34:44.0356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGyavaH99nNHfn0E7tx4oEHBM8fq6IB3rvxnDHnm2FNCVbJaQpJ9m11pQvygA8Xi4gYC/ZZumW/0LhhSfsGy52V8lj31I5Q1OO8H3e75oOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3891
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 08/10] xen/arm: alternative:
 add auto-nop infrastructure
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Will Deacon <will.deacon@arm.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEZyb206IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5k
QGFybS5jb20+Cj4KPiBJbiBzb21lIGNhc2VzLCBvbmUgc2lkZSBvZiBhbiBhbHRlcm5hdGl2ZSBz
ZXF1ZW5jZSBpcyBzaW1wbHkgYSBudW1iZXIgb2YKPiBOT1BzIHVzZWQgdG8gYmFsYW5jZSB0aGUg
b3RoZXIgc2lkZS4gS2VlcGluZyB0cmFjayBvZiB0aGlzIG1hbnVhbGx5IGlzCj4gdGVkaW91cywg
YW5kIHRoZSBwcmVzZW5jZSBvZiBsYXJnZSBjaGFpbnMgb2YgTk9QcyBtYWtlcyB0aGUgY29kZSBt
b3JlCj4gcGFpbmZ1bCB0byByZWFkIHRoYW4gbmVjZXNzYXJ5Lgo+Cj4gVG8gYW1lbGlvcmF0ZSBt
YXR0ZXJzLCB0aGlzIHBhdGNoIGFkZHMgYSBuZXcgYWx0ZXJuYXRpdmVfZWxzZV9ub3BfZW5kaWYs
Cj4gd2hpY2ggYXV0b21hdGljYWxseSBiYWxhbmNlcyBhbiBhbHRlcm5hdGl2ZSBzZXF1ZW5jZSB3
aXRoIGEgdHJpdmlhbCBOT1AKPiBzbGVkLgo+Cj4gSW4gbWFueSBjYXNlcywgd2Ugd291bGQgbGlr
ZSBhIE5PUC1zbGVkIGluIHRoZSBkZWZhdWx0IGNhc2UsIGFuZAo+IGluc3RydWN0aW9ucyBwYXRj
aGVkIGluIGluIHRoZSBwcmVzZW5jZSBvZiBhIGZlYXR1cmUuIFRvIGVuYWJsZSB0aGUgTk9Qcwo+
IHRvIGJlIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGZvciB0aGlzIGNhc2UsIHRoaXMgcGF0Y2gg
YWxzbyBhZGRzIGEgbmV3Cj4gYWx0ZXJuYXRpdmVfaWYsIGFuZCB1cGRhdGVzIGFsdGVybmF0aXZl
X2Vsc2UgYW5kIGFsdGVybmF0aXZlX2VuZGlmIHRvCj4gd29yayB3aXRoIGVpdGhlciBhbHRlcm5h
dGl2ZV9pZiBvciBhbHRlcm5hdGl2ZV9lbmRpZi4KPgo+IFRoZSBhbHRlcm5hdGl2ZSBpbmZyYXN0
cnVjdHVyZSB3YXMgb3JpZ2luYWxseSBwb3J0ZWQgZnJvbSBMaW51eC4gU28gdGhpcwo+IGlzIHBy
ZXR0eSBtdWNoIGEgc3RyYWlnaHQgYmFja3BvcnQgZnJvbSBjb21taXQgNzkyZDQ3Mzc5ZjRkICJh
cm02NDoKPiBhbHRlcm5hdGl2ZTogYWRkIGF1dG8tbm9wIGluZnJhc3RydWN0dXJlIi4gVGhlIG9u
bHkgZGlmZmVyZW5jZSBpcyB0aGUKPiBub3BzIG1hY3JvIGFkZGVkIGFzIG5vdCB5ZXQgZXhpc3Rp
bmcgaW4gWGVuLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRA
YXJtLmNvbT4KPiBbd2lsbDogdXNlIG5ldyBub3BzIG1hY3JvIHRvIGdlbmVyYXRlIG5vcCBzZXF1
ZW5jZXNdCj4gU2lnbmVkLW9mZi1ieTogV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5jb20+
Cj4gW2p1bGllbjogQWRkIG5vcHMgYW5kIHBvcnQgdG8gWGVuXQo+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBWb2xvZHlteXIg
QmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+CgoKLS0gClZvbG9keW15ciBCYWJj
aHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
