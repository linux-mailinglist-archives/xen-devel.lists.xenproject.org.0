Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A78714CD4A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 16:24:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwp9c-0003Nh-1y; Wed, 29 Jan 2020 15:21:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwp9b-0003Nc-62
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 15:21:19 +0000
X-Inumbo-ID: ff49e2be-42aa-11ea-a933-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff49e2be-42aa-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 15:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580311279; x=1611847279;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iShA71jijG8AgJKdiK7BAwrWhaXBy8zQGhONLRb9DKw=;
 b=OgjI6LYhRo7UN4G1UB23zlA4OfDaN9SLG4WCDXKLwFlN7WVOgnIwbOVk
 h0PyFRqZZ1XX9RCSTlndeNvR7ieJT8JWGiGrZW3vCCFX4iH1BY0+mCZFc
 m0amiSFuYnl03PGll0lLCIkDla0rXhyPSzERs5TN9TOLoO8e0jfRuFNgt w=;
IronPort-SDR: 3uF21vSldfjlQOAxyBnL1VWDv8jq0YZkcfwHlG9jiNeoinioxBu8pjxmtOFCOsRBEBaSwFkJMu
 URRr8z/peNLA==
X-IronPort-AV: E=Sophos;i="5.70,378,1574121600"; d="scan'208";a="15309829"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 29 Jan 2020 15:21:15 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 461BFA2313; Wed, 29 Jan 2020 15:21:13 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 15:21:13 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 15:21:11 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 29 Jan 2020 15:21:11 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v6 3/4] mm: make MEMF_no_refcount pages safe to assign
Thread-Index: AQHV1rHQ/Piab1nOT0mBjoShOjje0qgBwGcAgAAAjBA=
Date: Wed, 29 Jan 2020 15:21:11 +0000
Message-ID: <eeb84baf44c746099f1f0cba2c6c497e@EX13D32EUC003.ant.amazon.com>
References: <20200129143831.1369-1-pdurrant@amazon.com>
 <20200129143831.1369-4-pdurrant@amazon.com>
 <36b4b20b-60b5-806a-ca5d-8253823427ce@suse.com>
In-Reply-To: <36b4b20b-60b5-806a-ca5d-8253823427ce@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v6 3/4] mm: make MEMF_no_refcount pages safe
 to assign
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiAyOSBKYW51YXJ5IDIwMjAgMTU6MTUNCj4gVG86IER1
cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT47DQo+IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47DQo+IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFdl
aSBMaXUgPHdsQHhlbi5vcmc+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NiAzLzRdIG1tOiBtYWtlIE1FTUZfbm9fcmVmY291bnQgcGFn
ZXMgc2FmZSB0byBhc3NpZ24NCj4gDQo+IE9uIDI5LjAxLjIwMjAgMTU6MzgsIFBhdWwgRHVycmFu
dCB3cm90ZToNCj4gPiBAQCAtMjM3MSw2ICsyMzgzLDggQEAgdm9pZCBmcmVlX2RvbWhlYXBfcGFn
ZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsDQo+IHVuc2lnbmVkIGludCBvcmRlcikNCj4gPg0KPiA+
ICAgICAgICAgIGlmICggbGlrZWx5KGQpICYmIGxpa2VseShkICE9IGRvbV9jb3cpICkNCj4gPiAg
ICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIGxvbmcgcGFnZXMgPSAwOw0KPiA+ICsNCj4gPiAg
ICAgICAgICAgICAgLyogTkIuIE1heSByZWN1cnNpdmVseSBsb2NrIGZyb20gcmVsaW5xdWlzaF9t
ZW1vcnkoKS4gKi8NCj4gPiAgICAgICAgICAgICAgc3Bpbl9sb2NrX3JlY3Vyc2l2ZSgmZC0+cGFn
ZV9hbGxvY19sb2NrKTsNCj4gPg0KPiA+IEBAIC0yMzg2LDkgKzI0MDAsMTEgQEAgdm9pZCBmcmVl
X2RvbWhlYXBfcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsDQo+IHVuc2lnbmVkIGludCBvcmRl
cikNCj4gPiAgICAgICAgICAgICAgICAgICAgICBCVUcoKTsNCj4gPiAgICAgICAgICAgICAgICAg
IH0NCj4gPiAgICAgICAgICAgICAgICAgIGFyY2hfZnJlZV9oZWFwX3BhZ2UoZCwgJnBnW2ldKTsN
Cj4gPiArICAgICAgICAgICAgICAgIGlmICggIShwZ1tpXS5jb3VudF9pbmZvICYgUEdDX25vX3Jl
ZmNvdW50KSApDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgcGFnZXMtLTsNCj4gPiAgICAgICAg
ICAgICAgfQ0KPiA+DQo+ID4gLSAgICAgICAgICAgIGRyb3BfZG9tX3JlZiA9ICFkb21haW5fYWRq
dXN0X3RvdF9wYWdlcyhkLCAtKDEgPDwgb3JkZXIpKTsNCj4gPiArICAgICAgICAgICAgZHJvcF9k
b21fcmVmID0gIWRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKGQsIHBhZ2VzKTsNCj4gDQo+IEZvbGxv
d2luZyBmcm9tIHdoYXQgSSd2ZSBqdXN0IHNhaWQgb24gdGhlIHByZXZpb3VzIHBhdGNoLCB0aGlz
IG5lZWRzDQo+IGZ1cnRoZXIgY2hhbmdpbmcgdGhlbiBhcyB3ZWxsLiBUaGVyZSdsbCBuZWVkIHRv
IGJlIGEgcGVyLWRvbWFpbg0KPiAibm9uLXJlZmNvdW50ZWQtcGFnZXMiIGNvdW50LCB3aGljaCAt
IHdoZW4gdHJhbnNpdGlvbmluZyBmcm9tIHplcm8NCj4gdG8gbm9uLXplcm8gaXMgYWNjb21wYW5p
ZWQgYnkgb2J0YWluaW5nIGEgZG9tYWluIHJlZiwgYW5kIHdoZW4NCj4gdHJhbnNpdGlvbmluZyBi
YWNrIHRvIHplcm8gY2F1c2VzIHRoaXMgZG9tYWluIHJlZiB0byBiZSBkcm9wcGVkLg0KPiBPdGhl
cndpc2UsIG9uY2UgdGhlIGxhc3QgcmVmLWNvdW50ZWQgcGFnZSB3YXMgZnJlZWQsIHRoZSBkb21h
aW4NCj4gbWF5IGJlY29tZSByZWFkeSBmb3IgZmluYWwgZGVzdHJ1Y3Rpb24sIG5vIG1hdHRlciBo
b3cgbWFueSBub24tDQo+IHJlZmNvdW50ZWQgcGFnZXMgdGhlcmUgc3RpbGwgYXJlIG9uIGl0cyBw
YWdlIGxpc3RzLiAoQW4gYWx0ZXJuYXRpdmUNCj4gbW9kZWwgbWlnaHQgYmUgdG8gaW5jbHVkZSBh
bGwgcGFnZXMgaW4gLT50b3RfcGFnZXMsIGtlZXAgdXNpbmcganVzdA0KPiB0aGF0IGZvciB0aGUg
ZG9tYWluIHJlZiBhY3F1aXJlL3JlbGVhc2UsIGFuZCBzdWJ0cmFjdCB0aGUgbmV3DQo+IGNvdW50
IHdoZW4gZS5nLiBjb21wYXJpbmcgYWdhaW5zdCAtPm1heF9wYWdlcy4pDQoNClllcywgSSB0aGlu
ayBJJ2xsIGFkanVzdCB0b3RwYWdlcyB1bmNvbmRpdGlvbmFsbHkgYW5kIHRoZW4gc3VidHJhY3Qg
dGhlIHNlY29uZGFyeSBjb3VudCBmb3IgY29tcGFyaXNvbiBhcyBpdCBtZWFucyBJIGNhbiBsZWF2
ZSB0aGUgcmVmIGNvdW50aW5nIGFsb25lLg0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
