Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D34B03CC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 20:44:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i87Yk-0004bi-ML; Wed, 11 Sep 2019 18:41:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b1gu=XG=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i87Yj-0004bU-2Z
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 18:41:41 +0000
X-Inumbo-ID: ca536bf2-d4c3-11e9-83dc-12813bfff9fa
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca536bf2-d4c3-11e9-83dc-12813bfff9fa;
 Wed, 11 Sep 2019 18:41:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGXekX+E8MniaPO3UWprptRujUEUdfX0AtfNP6iOzTBV+CEI3Q3e7Qlh2CjTIifXfdGgKh4NY6Z0bcyizdNyxRnS7F1kY9fJZOA+PA3D0GJs7vpsAdgjJG7k1XI5apVXRk5WtYr1/w2qmjncIJtX3O1A4lGuNFa/ljjQINXTSgn4DqEO4epYlSPB3NlUtlugkrUWKK31mjQpfLHHFZAdIiBgVfv+A4nj4KR0bHVBs3uXTJfvFJBx1kUc4LArQmLVyZ4k00inLi2zb9DrmYAMlsv7GqiILI8bMAgC08zIDa6G/3T0ORgRIL31h4Q/h3DfO4kTGwlDyjtBb0xRsk+cAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNYxMrhBvIT3xwfqi39Uu1JAQG7jmqSRsa/X33tSNuU=;
 b=P5TEgm0q2FxQ70ouGKLQzBUC/FB4T6xZ/ZocDrV1/gJRewmh4SWRkpTEIDT47L/OytJIwk9OXgxddsKyofbhhnU7DLx99nvpxovgsMCm43CBLlJpqVfM/2fyi9zHU6/HEQGHEckFwIvlxN+0aAcG/CoYmM5KZSsoRTqHIYKrMxV8tqdEG3/anRHAuQ8ukGejC/nxMt6r6fSLQJ/8o/qE+mDuLT7icNPxvavzLb6Gqwjka1+L43DYfXbaASUdCrPyH47rr7tCtWQv5Z3WtaEc0E+Gav7KybRqWacOna9D74Z5qjAD5QqXU0XDgiFMGjBKUlj3zwuM7IyqN1WtxQPG7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNYxMrhBvIT3xwfqi39Uu1JAQG7jmqSRsa/X33tSNuU=;
 b=tAFqMNEan6eVRvBNiXhbJs6b9QPWYNApGxQzLkNvg0gRiofFYogjBbVg5eAKXFWxQdNnLhrEDFnjrXixejJ3CDUBHbQrDc2R8UlW/m+ewczxoMfvaKM1zhTy9YV7Vh2D/TpJLWuQXn3r8Hgm9N7bst57EWRtZXhgpUX65BLEQFo=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB6002.eurprd03.prod.outlook.com (10.255.31.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 11 Sep 2019 18:41:36 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 11 Sep 2019
 18:41:36 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 5/5] xen/arm: optee: remove experimental status
Thread-Index: AQHVWeNoGYDEXCwUxUmqcOQgXXsTCKcJF84AgAAEMICAGtv+gIAC9VCA
Date: Wed, 11 Sep 2019 18:41:36 +0000
Message-ID: <87lfuufzfk.fsf@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-6-volodymyr_babchuk@epam.com>
 <d54ec451-7aa5-d289-8080-708e91d9e39d@arm.com> <87v9ung02w.fsf@epam.com>
 <a094fc62-5bcd-edb1-e970-3ec023860ec6@arm.com>
In-Reply-To: <a094fc62-5bcd-edb1-e970-3ec023860ec6@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 581e27ea-3fa9-4ca2-bceb-08d736e7ad31
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6002; 
x-ms-traffictypediagnostic: AM0PR03MB6002:|AM0PR03MB6002:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB6002139A1576AFDD6BE7E702E6B10@AM0PR03MB6002.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(189003)(199004)(8936002)(186003)(53546011)(102836004)(6246003)(55236004)(2616005)(5660300002)(26005)(6512007)(476003)(486006)(25786009)(76176011)(7736002)(305945005)(36756003)(64756008)(66446008)(91956017)(66556008)(66476007)(99286004)(76116006)(256004)(66946007)(14444005)(6116002)(316002)(3846002)(86362001)(71200400001)(71190400001)(229853002)(6486002)(478600001)(66066001)(8676002)(6436002)(14454004)(53936002)(81166006)(81156014)(446003)(4326008)(6916009)(11346002)(80792005)(2906002)(54906003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6002;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6J1qZu7EQHcp2K+ctSD9CGAKkD5cLyIPguE8guCCoKerAeBlsu4qn4o5AQFtMNbermG4jLysMmkwdA0yYMeyUkwsQhU39MxnzwwBXgkxHpu2ELYf6DOQELycMnZ3IqaXvfeRSABec7XtVLnbSK8dweuS9j/BV1pVJesADLNeULSjixmPkfNguC/bU7QKAgHb2Ms4MkmohFYYy/DMeQUImMQgbRSxFYJtXWiWjF9vxAy0dDwou2TW4pNVC55+k3wMs23rz4lRmWTZezaVu86sJ/P6SgYjnKV8BhAoybutWdzaxSDl3CgNgzR4np1Tn56yP3ouh1jVmgt5dN0I5eYMXYnwT3OGxbU0XYuzO19MeH2kjWADhnJAsxbDvrW/LF5XFXwReaotpOmjE2om7UgSKzMryU/WAnjW58tok1C7S90=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581e27ea-3fa9-4ca2-bceb-08d736e7ad31
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 18:41:36.6148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C8J7vAeOKRHPLvWFjQ/cQCdcYyGKDQM42XNmStcn0kC5vRxeK1mQ3aJ5rw0td4PyHBjgg9ochl4+RXnTwpyySfg3b1FZx8AcMa7Vtj/YwpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6002
Subject: Re: [Xen-devel] [PATCH 5/5] xen/arm: optee: remove experimental
 status
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

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDgvMjMvMTkgODoyMCBQTSwgVm9sb2R5bXlyIEJh
YmNodWsgd3JvdGU6Cj4+Cj4+IEhpIEp1bGllbiwKPgo+IEhpLAo+Cj4gQXBvbG9naWVzIGZvciB0
aGUgZGVsYXkuCkl0IGlzIG9rYXkuIEkgbXlzZWxmIHdhcyBidXN5IGEgYml0LgoKPgo+Pgo+PiBK
dWxpZW4gR3JhbGwgd3JpdGVzOgo+Pgo+Pj4gSGksCj4+Pgo+Pj4gT24gOC8yMy8xOSA3OjQ4IFBN
LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+PiBBcyBhbGwgVE9ET3MgYW5kIHBvdGVudGlh
bCBzZWN1cml0eSBpc3N1ZXMgYXJlIHJlc29sdmVkIG5vdywKPj4+PiByZW1vdmUgZXhwZXJpbWVu
dGFsIHN0YXR1cyBmcm9tIE9QLVRFRSBtZWRpYXRvci4KPj4+Cj4+PiBMb29raW5nIGF0IFNVUFBP
UlQuTUQsIEkgdGhpbmsgT1AtVEVFIHdpdGhvdXQgdGhpcyBzZXJpZXMgd291bGQgYmUKPj4+IGNv
bnNpZGVyZWQgYXMgIkV4cGVyaW1lbnRhbCIuCj4+IFJpZ2h0Lgo+Pgo+Pj4KPj4+IFdpdGggdGhp
cyBzZXJpZXMgYXBwbGllZCwgSSBzdGlsbCB0aGluayB3ZSBzaG91bGQga2VlcCB0aGUgS2NvbmZp
Zwo+Pj4gYmVoaW5kIEVYUEVSVCBidXQgbWFyayBpdCBhcyAiVGVjaG5pY2FsIFByZXZpZXciIGZv
ciBhdCBsZWFzdCBhCj4+PiByZWxlYXNlLiBUaGlzIHdvdWxkIGVuY291cmFnZSBwZW9wbGUgdG8g
dGVzdCBhbmQgcmVwb3J0IGFueSBwb3RlbnRpYWwKPj4+IGlzc3VlcyB3aXRoIE9QLVRFRS4KPj4+
Cj4+PiBXZSBjYW4gcmUtZGlzY3VzcyBhYm91dCB0aGUgc3RhdGUgaW4gYSBmZXcgbW9udGhzIGZv
ciBmdXR1cmUgcmVsZWFzZS4KPj4+Cj4+PiBCVFcsIFNVUFBPUlQuTUQgc2hvdWxkIGJlIHVwZGF0
ZWQgdG8gcmVmbGVjdCB0aGUgc3RhdGUgb2YgT1AtVEVFIGluIFhlbi4KPj4gRmFpciBlbm91Z2gu
IEluIHRoZSBuZXh0IHZlcnNpb24gSSdsbCByZXBsYWNlIHRoaXMgcGF0Y2ggd2l0aCBwYXRjaCB0
bwo+PiBTVVBQT1JULm1kLiBPciBpdCBpcyBiZXR0ZXIgdG8gcHVzaCBzZXBhcmF0ZSBwYXRjaCBm
b3IgdGhlIGRvY3VtZW50YXRpb24/Cj4KPiBJIHRoaW5rIHRoZSBwYXRjaCBpbiBTVVBQT1JULk1E
IHNob3VsZCBnbyByZWdhcmRsZXNzIG9mIHRoZSBzdGF0ZSBvZgo+IHRoZSByZXN0LiBJdCBpcyBm
aW5lIHRvIGtlZXAgaXQgaW4gdGhpcyBzZXJpZXMuCk9rYXkuIEJ5IHRoZSB3YXksIEkgc2tpbW1l
ZCB0aHJ1IFNVUFBPUlQuTUQgYW5kIEknbSBub3Qgc3VyZSB3aGF0IGlzIHRoZQpiZXN0IHBsYWNl
IHRvIGRlc2NyaWJlIG1lZGlhdG9yLiBTbyBJIGNvdWxkIHVzZSBzb21lIGFkdmljZSB0aGVyZS4K
CgotLSAKVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
