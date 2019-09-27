Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C1CC08A5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:32:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDsC9-000557-9k; Fri, 27 Sep 2019 15:30:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDsC8-00051s-5q
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:30:08 +0000
X-Inumbo-ID: ae972ab4-e13b-11e9-bf31-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.74]) by localhost (Halon) with ESMTPS
 id ae972ab4-e13b-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 15:30:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FA+fMhfr6gaLLH+PR2s7qz1Eqsi6Qv2fSCatDHke36W4Fp2g2NJoDG0gz+BLycz4eBxEU3ETm34OkpCYvzqNcSlB442ewROQ+OJeGLw3Q/uhiyiJf7I2krqFDvqO/bAKOrUpgJqBO3LsYY7PlAfEwSsTidl6AFMgV/pgJoQhYjGCoi1Yav7ejSKSC5nc0BxgpZPgkkmz2Ezo8RmOD+XEEZqAz6iTnMnAMG5Okq86OYayAFzHPQPtrHjeKXdBa7LtW5KNN+BbGJ5l/pkIeZcGJGVpzDeu+11UpgDB+tv6MhPfw4L91eUunKCfOT0ErFwME9epdT6yRBibXuIHv+8tBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG2xXp9Dg0nsTHmECDsXay2H2BuZ4YGFXDGn+rWb9YM=;
 b=giokO2e9Ko/sg5KQYidkVTDv9Bbv26yIZu//SL6/Jd7DyzoIJfy3iTTHqYZLsFZkNCXZdYFFFi8Zrpd95oUvJOB6i2UHbBhfGt6X6Fhs0ip1K3dDL1NMUBnQki68+xREtlaFXxxVRaAhOyQ5VM9d9zBaNDf+z7+Lp6T7zhcCGsFjLpKUqIDQo0b8P9IG6UmQueDBEJgRvjAeWKMt62WFymVD1Tc/PoclaVFbReR8vZYJmFGPq2p+KXCkTo6Uez8G7+27gN98yzLJXkKs7HviO8nSi9KhaXjkV8Yuf8DdBCAjSCu3edMxvm8RFDD9dSv5TYZYwCIPvi7LbJ40gXHh1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG2xXp9Dg0nsTHmECDsXay2H2BuZ4YGFXDGn+rWb9YM=;
 b=kjgxsv/0eSb/yB1WhSR7zcaKaVsgpiWFvu0y7530r62L8X7TTYafmOr0nKpHK2BXzgGDa8Utz1vwQE562V58otE6dDh9O4E3V0p0me6/wW3IRlztMMd8hW6k79DvVyBs7sV0kE6+4IbiZl9Q8ZWfMywN52Be3dx5dCeBAf9V9xQ=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3571.eurprd03.prod.outlook.com (52.134.87.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Fri, 27 Sep 2019 15:30:05 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 15:30:05 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 10/10] xen/arm64: entry: Ensure the guest
 state is synced when receiving a vSError
Thread-Index: AQHVdJmXIorHdthDnUCQMEMpZACXoqc/p6sA
Date: Fri, 27 Sep 2019 15:30:05 +0000
Message-ID: <87k19t92pv.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-11-julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-11-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d7f8e27-579a-410f-45ab-08d7435f925e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3571; 
x-ms-traffictypediagnostic: AM0PR03MB3571:|AM0PR03MB3571:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB3571036CBC8471FB3FCA0020E6810@AM0PR03MB3571.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(199004)(189003)(66066001)(6486002)(25786009)(8936002)(99286004)(2906002)(6436002)(6916009)(91956017)(66556008)(76116006)(54906003)(71190400001)(14454004)(64756008)(14444005)(71200400001)(6506007)(316002)(66946007)(36756003)(86362001)(256004)(66446008)(66476007)(80792005)(5660300002)(186003)(6116002)(446003)(2616005)(7736002)(81156014)(11346002)(81166006)(486006)(476003)(6246003)(229853002)(26005)(6512007)(478600001)(55236004)(3846002)(8676002)(102836004)(107886003)(76176011)(4326008)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3571;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U47qe5Dn7hkfeSuXv3a6ZBLaxq4VJFPsD9NLjfc45WegJSOyQIA9XQC1K6d2p1A3xpr81EzajHtFZTt7PCI54n81Vv7/eoFoRwBa+8YlPR+MxTcjKZwyxqJNIkh5RuV8yg9CmskgYBWm2nxkN+8xO0089tAYMXBmL03FjFDs1hgFEjyrOr5AUtpF/2dZju1PuN4Csa/3KRVNAFaq0UOoHlbYnTurcFHRqTVtWloBr1fvbALXPoB6iwDtZQDEFH2ub6ikfQlNzBBKic/6X651Z5fcB/mEQEihPBIpJIN+C/cddeeC9Bzk57ZZw48tS0DbPtQEmZmJ9B6fBzdVQPxuTyyAl1HgE83SykUtCcNAyO6tU81nxiAuZfgzVL2FEIrBU1qLxQ8BD9NnXOT9FHWbUm9TXLOGThFoZuYbgmnFs6I=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7f8e27-579a-410f-45ab-08d7435f925e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 15:30:05.1161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gvdYyX2iR9LpY1s9/U8c46XawmHFBmfOCSpyGTiIOeSsX2iSMrVFL8MNGgm+kBdYsfnL0u5/PJySnJt9NbkmSaQYJU445WomHuk0JXPCM4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3571
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 10/10] xen/arm64: entry: Ensure
 the guest state is synced when receiving a vSError
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEF0IHRoZSBtb21lbnQsIHdoZW4g
YSBTRXJyb3IgaXMgcmVjZWl2ZWQgd2hpbGUgY2hlY2tpbmcgZm9yIGEgcGVuZGluZwo+IG9uZSwg
d2Ugd2lsbCBza2lwIHRoZSBoYW5kbGluZyB0aGUgaW5pdGlhbCBleGNlcHRpb24uCj4KPiBUaGlz
IGluY2x1ZGVzIGNhbGwgdG8gZXhpdF9mcm9tX2d1ZXN0eywgX25vaXJxfSB0aGF0IGlzIHVzZWQg
dG8KRGlkIHlvdSBtZWFuIGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdHssIF9ub2lycX0gdGhl
cmU/IE90aGVyd2lzZSwgSSdtCmNvbmZ1c2VkIGEgbG90LgoKPiBzeW5jaHJvbml6ZSBwYXJ0IG9m
IHRoZSBndWVzdCBzdGF0ZSB3aXRoIHRoZSBpbnRlcm5hbCByZXByZXNlbnRhdGlvbi4KPiBIb3dl
dmVyLCB3ZSBzdGlsbCBjYWxsIGxlYXZlX2h5cGVydmlzb3JfdGFpbCgpIHdoaWNoIGlzIHVzZWQg
Zm9yIHByZWVtcHRpbmcKPiB0aGUgZ3Vlc3QgYW5kIHN5bmNocm9uaXppbmcgYmFjayBwYXJ0IG9m
IHRoZSBndWVzdCBzdGF0ZS4KPgo+IGV4aXRfZnJvbV9ndWVzdHssIF9ub2lycX0gd29ya3MgaW4g
cGFpciB3aXRoIGxlYXZlX2h5cGVydmlzb3JfdGFpbCgpLCBzbwo+IHNraXBwaW5nIGlmIGZvcm1l
ciBtYXkgcmVzdWx0IHRvIGEgbG9zcyBvZiBzb21lIHBhcnQgb2YgIGd1ZXN0IHN0YXRlLgo+IEFu
IGV4YW1wbGUgaXMgdGhlIG5ldyB2R0lDIHdoaWNoIHdpbGwgc2F2ZSB0aGUgc3RhdGUgb2YgdGhl
IExSUyBvbiBleGl0Cj4gZnJvbSB0aGUgZ3Vlc3QgYW5kIHJld3JpdGUgYWxsIG9mIHRoZW0gb24g
ZW50cnkgdG8gdGhlIGd1ZXN0Lgo+Cj4gRm9yIG5vdywgY2FsbGluZyBsZWF2ZV9oeXBlcnZpc29y
X3RhaWwoKSBpcyBub3QgbmVjZXNzYXJ5IHdoZW4gaW5qZWN0aW5nCj4gYSB2U0Vycm9yIHRvIHRo
ZSBndWVzdC4gQnV0IGFzIHRoZSBwYXRoIGlzIHNwcmVhZCBhY2Nyb3NzIG11bHRpcGxlIGZpbGUs
Cj4gaXQgaXMgaGFyZCB0byBlbmZvcmNlIHRoYXQgZm9yIHRoZSBmdXR1cmUgKHNvbWVvbmUgd2Ug
bWF5IHdhbnQgdG8gY3Jhc2ggdGhlCj4gZG9tYWluKS4gVGhlcmVmb3JlIGl0IGlzIGJlc3QgdG8g
Y2FsbCBleGl0X2Zyb21fZ3Vlc3R7LCBfbm9pcnF9IGluIHRoZQo+IHZTRXJyb3IgcGF0aCBhcyB3
ZWxsLgo+Cj4gTm90ZSB0aGF0IHRoZSByZXR1cm4gdmFsdWUgb2YgY2hlY2tfcGVuZGluZ192c2Vy
cm9yIGlzIG5vdyBzZXQgaW4geDE5Cj4gaW5zdGVhZCBvZiB4MC4gVGhpcyBpcyBiZWNhdXNlIHdl
IHdhbnQgdG8ga2VlcCB0aGUgdmFsdWUgYWNyb3NzIGNhbGwgdG8KPiBDLWZ1bmN0aW9uIGFuZCB4
MCwgdW5saWtlIHgxOSwgd2lsbCBub3QgYmUgc2F2ZWQgYnkgdGhlIGNhbGxlZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4KPiAtLS0KPgo+
IEkgYW0gbm90IGF3YXJlIG9mIGFueSBpc3N1ZXMgb3RoZXIgdGhhbiB3aXRoIHRoZSBuZXcgdkdJ
Qy4gQnV0IEkKPiBoYXZlbid0IGxvb2tlZCBoYXJkIGVub3VnaCBzbyBJIHRoaW5rIGl0IHdvdWxk
IGJlIHdvcnRoIHRvIHRyeSB0byBmaXggaXQKPiBmb3IgWGVuIDQuMTMuCj4gLS0tCj4gIHhlbi9h
cmNoL2FybS9hcm02NC9lbnRyeS5TIHwgMjEgKysrKysrKysrKysrKystLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5
LlMKPiBpbmRleCA5MWNmNmVlNmY0Li5mNTM1MDI0N2UxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L2FybS9hcm02NC9lbnRyeS5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKPiBA
QCAtMTY4LDExICsxNjgsMTMgQEAKPiAgICAgICAgICAvKgo+ICAgICAgICAgICAqIFRoZSB2U0Vy
cm9yIHdpbGwgYmUgY2hlY2tlZCB3aGlsZSBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9F
WElUCj4gICAgICAgICAgICogaXMgbm90IHNldC4gSWYgYSB2U0Vycm9yIHRvb2sgcGxhY2UsIHRo
ZSBpbml0aWFsIGV4Y2VwdGlvbiB3aWxsIGJlCj4gLSAgICAgICAgICogc2tpcHBlZC4gRXhpdCBB
U0FQCj4gKyAgICAgICAgICogc2tpcHBlZC4KPiArICAgICAgICAgKgo+ICsgICAgICAgICAqIEhv
d2V2ZXIsIHdlIHN0aWxsIG5lZWQgdG8gY2FsbCBleGl0X2Zyb21fZ3Vlc3R7LF9ub2lycX0gYXMg
dGhlCj4gKyAgICAgICAgICogcmV0dXJuIHBhdGggdG8gdGhlIGd1ZXN0IG1heSByZWx5IG9uIHN0
YXRlIHNhdmVkIGJ5IHRoZW0uCj4gICAgICAgICAgICovCj4gICAgICAgICAgYWx0ZXJuYXRpdmVf
aWYgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllfRVhJVAo+ICAgICAgICAgIGJsICAgICAg
Y2hlY2tfcGVuZGluZ192c2Vycm9yCj4gLSAgICAgICAgY2JueiAgICB4MCwgMWYKPiAgICAgICAg
ICBhbHRlcm5hdGl2ZV9lbHNlX25vcF9lbmRpZgo+ICAKPiAgICAgICAgICBtb3YgICAgIHgwLCBz
cAo+IEBAIC0xODAsNiArMTgyLDExIEBACj4gICAgICAgICAgbXNyICAgICBkYWlmY2xyLCBcaWZs
YWdzCj4gICAgICAgICAgbW92ICAgICB4MCwgc3AKPiAgICAgICAgICBibCAgICAgIGVudGVyX2h5
cGVydmlzb3JfZnJvbV9ndWVzdAo+ICsKPiArICAgICAgICBhbHRlcm5hdGl2ZV9pZiBTS0lQX1NZ
TkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUCj4gKyAgICAgICAgY2JueiAgICB4MTksIDFmCj4g
KyAgICAgICAgYWx0ZXJuYXRpdmVfZWxzZV9ub3BfZW5kaWYKPiArCj4gICAgICAgICAgbW92ICAg
ICB4MCwgc3AKPiAgICAgICAgICBibCAgICAgIGRvX3RyYXBfXHRyYXAKPiAgMToKPiBAQCAtMzgz
LDkgKzM5MCw5IEBAIHJldHVybl9mcm9tX3RyYXA6Cj4gIC8qCj4gICAqIFRoaXMgZnVuY3Rpb24g
aXMgdXNlZCB0byBjaGVjayBwZW5kaW5nIHZpcnR1YWwgU0Vycm9yIGluIHRoZSBnYXAgb2YKPiAg
ICogRUwxIC0+IEVMMiB3b3JsZCBzd2l0Y2guCj4gLSAqIFRoZSB4MCByZWdpc3RlciB3aWxsIGJl
IHVzZWQgdG8gaW5kaWNhdGUgdGhlIHJlc3VsdHMgb2YgZGV0ZWN0aW9uLgo+IC0gKiB4MCAtLSBO
b24temVybyBpbmRpY2F0ZXMgYSBwZW5kaW5nIHZpcnR1YWwgU0Vycm9yIHRvb2sgcGxhY2UuCj4g
LSAqIHgwIC0tIFplcm8gaW5kaWNhdGVzIG5vIHBlbmRpbmcgdmlydHVhbCBTRXJyb3IgdG9vayBw
bGFjZS4KPiArICogVGhlIHJlZ2lzdGVyIHgxOSB3aWxsIGJlIHVzZWQgdG8gaW5kaWNhdGUgdGhl
IHJlc3VsdHMgb2YgZGV0ZWN0aW9uLgo+ICsgKiB4MTkgLS0gTm9uLXplcm8gaW5kaWNhdGVzIGEg
cGVuZGluZyB2aXJ0dWFsIFNFcnJvciB0b29rIHBsYWNlLgo+ICsgKiB4MTkgLS0gWmVybyBpbmRp
Y2F0ZXMgbm8gcGVuZGluZyB2aXJ0dWFsIFNFcnJvciB0b29rIHBsYWNlLgo+ICAgKi8KPiAgY2hl
Y2tfcGVuZGluZ192c2Vycm9yOgo+ICAgICAgICAgIC8qCj4gQEAgLTQzMiw5ICs0MzksOSBAQCBh
Ym9ydF9ndWVzdF9leGl0X2VuZDoKPiAgCj4gICAgICAgICAgLyoKPiAgICAgICAgICAgKiBOb3Qg
ZXF1YWwsIHRoZSBwZW5kaW5nIFNFcnJvciBleGNlcHRpb24gdG9vayBwbGFjZSwgc2V0Cj4gLSAg
ICAgICAgICogeDAgdG8gbm9uLXplcm8uCj4gKyAgICAgICAgICogeDE5IHRvIG5vbi16ZXJvLgo+
ICAgICAgICAgICAqLwo+IC0gICAgICAgIGNzZXQgICAgeDAsIG5lCj4gKyAgICAgICAgY3NldCAg
ICB4MTksIG5lCj4gIAo+ICAgICAgICAgIHJldAoKCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBF
UEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
