Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D14AB3DB1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 17:29:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9su3-00079u-4b; Mon, 16 Sep 2019 15:26:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TDFE=XL=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i9su1-00079o-90
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 15:26:57 +0000
X-Inumbo-ID: 6a21bbe0-d896-11e9-b76c-bc764e2007e4
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::608])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a21bbe0-d896-11e9-b76c-bc764e2007e4;
 Mon, 16 Sep 2019 15:26:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El0l2+X0lGqi4mzrsgB7nKRIPvkqx2V+9u77VFcDArwvXOEo4uA65dlgpOP1xF5RWJexvXGg/aWjAhHdIj6TS7qwJ2wN0Cv3qxWbBNo26XkOsZZbPltYWMrSJmVK7Y7hFBENKZMLv3LrVUdfojcRCnFWFdeeLytqhlEStjhuJUJYiSjoNgDW2hWxTl0Cfcv+PpQ+/4+VtsFt/PyqPc7IsO/4taLyoZWEtbPst/SbhR7EV5YtA4ROA1PSdzMdD3GRvwotIOtH/mlgz+YOwOyzBacHyrIg6uX47pvuCSQiJBxwMnoo6W2taLWEdgaXJfbnswLe8DaWnbPVbWaFD8Cy1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+kaucB7fQFjx5Wg65KDQjhmjJZysKUDhh1z5wcbPTw=;
 b=g9FST1EVylhrLV5GSQN1YLAXPvf9FesXMaRCZkbvRFDwppCcsZhYwmWI+sWwCTs/k+yQlUgWwCA5gkCMRiUhpBPbUjoi+Tmpo9+QSwX/6vzEPuwmc6NE50LMd0XdpMieqzmT3WxfdDwT+XvY3DGZnXmo9xsHoldFRhMAzJtc4mWjDzm//oVdvGWGRdP34Sv21S+mw6kOXQ9W6Gc8c3NixM8FbrfzJWI8Id2F7qIR3hVydXwxPhlcmSYiKM5jhZsGGR8KSrsA7uXRCA57G7kTWIAwBGSsjW1mlEtxlSVbHWcfMyUB8I4Epuhv/5dA5URH7EL8m0I8hOC9g4NyISHFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+kaucB7fQFjx5Wg65KDQjhmjJZysKUDhh1z5wcbPTw=;
 b=VrHtqlLm+K46MhZqkS/wbCGEpG3edxO9A+2w+uBI4o/Mbv+Ha7ec4BM5SU6egwlSpJ+NJ+wZNZtramyufkP1u43nGW+B0j+izpYtlc1b9Vn7hi5fF0RwMeSjnNfifuunxFJWNHTVZ/pJoI89R8byZ7slmBA8KNZgNS4tpBkbIRc=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB6291.eurprd03.prod.outlook.com (10.186.173.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Mon, 16 Sep 2019 15:26:53 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Mon, 16 Sep 2019
 15:26:53 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 1/5] xen/arm: optee: impose limit on shared buffer size
Thread-Index: AQHVWeNlCY0CqDi7zE2giEuaPhvOCqckA0sAgALr+QCAAZ6qAIAAA5eAgAABlACABf90AA==
Date: Mon, 16 Sep 2019 15:26:53 +0000
Message-ID: <87d0g0feir.fsf@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-2-volodymyr_babchuk@epam.com>
 <45208af4-22b8-2870-f79d-a98960c4700d@arm.com> <87k1aefz3t.fsf@epam.com>
 <1cc4bd9c-44fc-0e6e-254c-c07f4b17ba4c@arm.com> <87h85hfgda.fsf@epam.com>
 <24f24620-99c9-d266-5691-4e1962d67b27@arm.com>
In-Reply-To: <24f24620-99c9-d266-5691-4e1962d67b27@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7d695e2-7cc9-4b8d-5c34-08d73aba4da3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB6291; 
x-ms-traffictypediagnostic: AM0PR03MB6291:|AM0PR03MB6291:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB62915AE7CAC2AD17F83E7AACE68C0@AM0PR03MB6291.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(52084003)(189003)(199004)(256004)(14444005)(8676002)(4326008)(6116002)(8936002)(76176011)(81166006)(80792005)(6506007)(316002)(53546011)(6246003)(81156014)(11346002)(99286004)(6512007)(6486002)(186003)(446003)(54906003)(6436002)(476003)(2906002)(229853002)(14454004)(26005)(3846002)(2616005)(53936002)(36756003)(66446008)(7736002)(486006)(6916009)(55236004)(102836004)(64756008)(76116006)(91956017)(66556008)(86362001)(66946007)(5660300002)(71190400001)(71200400001)(66066001)(25786009)(66476007)(478600001)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6291;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OnfUs0cL2pA59fJm5be8WJcRuOOUTRnwEoNdDbXiJ3UhvaXOVtLpiR4ylA0cp3hkIy7v3VUnZtVDND67GcFYMHqANygV4KBy0Nk8JEH1bmx593+SNB1vdq2bdAbJriFBrbdRzrmN4Z4f40TYPWP28U2HBKS3MHWaS35aiwDfn/bv7aL0JkmZr777yvrcOSQk+kk7bY2X5C2B5uVxYd/4+dgYH/nSMmBg3qLuFHBwCElwph65wQ5ZGsOsDAI4HrJrvogKVsJvwhyioDFOV7fjrjTJHFQgALO19XUCNGcLxDNcx31SVwuvvZdLzVmstm4UntFNdVYRTLr20BJJ2SstgqfC3HAJTSQj0Jc7pg+t0a1y8tigiXtpMBOfw0i5XJWua4CSwaG4VdMf3wT39E+RKhCYHAWjxFOWC0PQ6eG76Iw=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d695e2-7cc9-4b8d-5c34-08d73aba4da3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 15:26:53.5695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ih0LR0MO2PCmqZwRgNYuDJ68vhTAboJnS3Y9yq11Y28kKGOoAn30a/FzLhCA8KXsRcM/TNiPpuKy+ywj6BRq3vHigsE9fSHZbEfmvViYcWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6291
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

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gOS8xMi8xOSA4
OjQ1IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4KPj4gSGkgSnVsaWVuLAo+Pgo+PiBK
dWxpZW4gR3JhbGwgd3JpdGVzOgo+Pgo+Pj4gSGkgVm9sb2R5bXlyLAo+Pj4KPj4+IE9uIDkvMTEv
MTkgNzo0OCBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4KPj4+PiBKdWxpZW4gR3Jh
bGwgd3JpdGVzOgo+Pj4+Cj4+Pj4+IEhpIFZvbG9keW15ciwKPj4+Pj4KPj4+Pj4gT24gOC8yMy8x
OSA3OjQ4IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+Pj4+IFdlIHdhbnQgdG8gbGlt
aXQgbnVtYmVyIG9mIGNhbGxzIHRvIGxvb2t1cF9hbmRfcGluX2d1ZXN0X3JhbV9hZGRyKCkKPj4+
Pj4+IHBlciBvbmUgcmVxdWVzdC4gVGhlcmUgYXJlIHR3byB3YXlzIHRvIGRvIHRoaXM6IGVpdGhl
ciBwcmVlbXB0Cj4+Pj4+PiB0cmFuc2xhdGVfbm9uY29udGlnKCkgb3IgdG8gbGltaXQgc2l6ZSBv
ZiBvbmUgc2hhcmVkIGJ1ZmZlciBzaXplLgo+Pj4+Pj4KPj4+Pj4+IEl0IGlzIHF1aXRlIGhhcmQg
dG8gcHJlZW1wdCB0cmFuc2xhdGVfbm9uY29udGlnKCksIGJlY2F1c2UgaXQgaXMgZGVlcAo+Pj4+
Pj4gbmVzdGVkLiBTbyB3ZSBjaG9zZSBzZWNvbmQgb3B0aW9uLiBXZSB3aWxsIGFsbG93IDUxMiBw
YWdlcyBwZXIgb25lCj4+Pj4+PiBzaGFyZWQgYnVmZmVyLiBUaGlzIGRvZXMgbm90IGludGVyZmVy
ZSB3aXRoIEdQIHN0YW5kYXJkLCBhcyBpdAo+Pj4+Pj4gcmVxdWlyZXMgdGhhdCBzaXplIGxpbWl0
IGZvciBzaGFyZWQgYnVmZmVyIHNob3VsZCBiZSBhdCBsZXN0IDUxMmtCLgo+Pj4+Pgo+Pj4+PiBE
byB5b3UgbWVhbiAibGVhc3QiIGluc3RlYWQgb2YgImxlc3QiPwo+Pj4+IFllcwo+Pj4+Cj4+Pj4+
IElmIHNvLCB3aHkgNTEyIHBhZ2VzIChpLmUgMU1CKQpJIGhhdmUgbWlzc2VkIHRoYXQgZWFybGll
ci4gQnV0IDUxMiBwYWdlcyBpcyAyTUIsIGFjdHVhbGx5LgoKPj4+Pj4gaXMgcGxlbnR5IGVub3Vn
aCBmb3IgbW9zdCBvZiB0aGUgdXNlIGNhc2VzPyBXaGF0IGRvZXMgInh0ZXN0IiBjb25zaXN0Cj4+
Pj4+IG9uPwo+Pj4+IEJpZ2dlciBidWZmZXIgeHRlc3QgdHJpZXMgdG8gYWxsb2NhdGUgaXMgbWVy
ZSAzMktCLiBJIGJlbGlldmUgdGhhdCAxTUIKPj4+PiBpcyBlbm91Z2ggZm9yIHRoZSBtb3N0IGNh
c2VzLCBiZWNhdXNlIE9QLVRFRSBpdHNlbGYgaGF2ZSBhIHZlcnkgbGltaXRlZAo+Pj4+IHJlc291
cmNlcy4gQnV0IHRoaXMgdmFsdWUgaXMgY2hvc2VuIGFyYml0cmFyeS4KPj4+Cj4+PiBDb3VsZCB3
ZSBwb3RlbnRpYWxseSByZWR1Y2UgdG8gbGV0IHNheSA1MTJLQiAob3IgbWF5YmUgbG93ZXIpIGlm
IHh0ZXN0Cj4+PiBvbmx5IGFsbG9jYXRlIDMyS0I/Cj4+IFBvdGVudGlhbGx5IC0geWVzLiBCdXQg
b25seSB0byA1MTJLQiBpZiB3ZSB3YW50IHRvIGJlIGNvbXBhdGlibGUgd2l0aAo+PiB0aGUgR2xv
YmFsIFBsYXRmb3JtIHNwZWNpZmljYXRpb24uIFdoeSBhcmUgeW91IGFza2luZywgdGhvdWdoPwo+
Cj4gRG9lcyB0aGUgR2xvYmFsIFBsYXRmb3JtIHNwZWNpZmljYXRpb24gbGltaXQgdG8gNTEyS0I/
IE9yIGlzIGl0IGEgbWluaW11bT8KR1AgU3BlYyBzYXlzLCB0aGF0IHBsYXRmb3JtIHNob3VsZCBh
bGxvdyAqYXQgbGVzdCogNTEyS0IuIFVwcGVyIGxpbWl0IGlzCm5vdCBzZXQuCgo+IEJlY2F1c2Us
IHRoZSBzbWFsbGVyIHRoZSBidWZmZXIgaXMsIHRoZSBsZXNzIHRpbWUgaXQgd2lsbCB0YWtlIHRv
Cj4gcHJvY2VzcyBpbiB0aGUgd29yc3QgY2FzZS4gQWxzbywgaWYgd2UgY2FuIGhhdmUgYSByZWFz
b24gZm9yIHRoZSBzaXplCj4gKHlvdSBzZWVtIHRvIHN1Z2dlc3QgdGhlIHNwZWMgZGVmaW5lIGEg
c2l6ZS4uLikgdGhlbiBpdCBpcyBtdWNoIGJldHRlcgo+IHRoYW4gYSByYW5kb20gdmFsdWUuCkkg
aGF2ZSBubyBzdHJvbmcgYXJndW1lbnRzIGhlcmUsIGJ1dCBJIHdhbnQgdG8gYWxsb3cgdGhlIGJp
Z2dlc3Qgc2l6ZQpwb3NzaWJsZS4gSXQgc2VlbXMsIHRoYXQgNTEyIHBhZ2VzIGlzIHRoZSBhY2Nl
cHRlZCBsaW1pdCBpbiBoeXBlcnZpc29yCmNvZGUgKGF0IGxlYXN0LCBpbiBwMm0uYyksIHNvIEkg
Y2hvc2UgdGhpcyB2YWx1ZS4KCgotLSAKVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
