Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB53124579
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 12:17:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXGz-00086o-Tt; Wed, 18 Dec 2019 11:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNHo=2I=amazon.com=prvs=24851c453=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihXGy-00086j-Fv
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:13:44 +0000
X-Inumbo-ID: 736608fc-2187-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 736608fc-2187-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 11:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576667623; x=1608203623;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QdHNmc/M7RPqJu/X9GIHF4y6HRzBy8HOnTtilQgsfg8=;
 b=n3CAa9skUBfjqagU6mooQH9sqFb5WrBL8grbK+LZO5ye5Qix13OVhdyU
 k0VkBsNOLfD5LzYkIGgUZs4qVZC3PUr1bfNnGyVjDIXBvsBIO6vaxsyzn
 JVd71Ir4mdHr2o/dmftTa3GXPNfkoBrezz0sEqWddrJHjn/5zOYXHUiwt 4=;
IronPort-SDR: BWbRXe1KEw/NmvUMuH1PAOXEtLPjPekf2pQgnSE17NPq7UpQp/MGstMaXSfHiW2MlDrhz3BqF6
 DlK6AzAQZ/Iw==
X-IronPort-AV: E=Sophos;i="5.69,329,1571702400"; 
   d="scan'208";a="5824772"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 18 Dec 2019 11:13:32 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id DF4B7A1C9C; Wed, 18 Dec 2019 11:13:30 +0000 (UTC)
Received: from EX13D22EUA002.ant.amazon.com (10.43.165.125) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Dec 2019 11:13:30 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D22EUA002.ant.amazon.com (10.43.165.125) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 11:13:29 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 18 Dec 2019 11:13:28 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: "Gautam, Varad" <vrd@amazon.de>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
Thread-Index: AQHVtZG9Q7vObVpbNU6uve/wGV0d8Ke/vPRw
Date: Wed, 18 Dec 2019 11:13:28 +0000
Message-ID: <e8adf66822eb4dbaba19c3b42c39a73f@EX13D32EUC003.ant.amazon.com>
References: <1562165173-31383-1-git-send-email-vrd@amazon.de>
 <1576666417-20989-1-git-send-email-vrd@amazon.de>
In-Reply-To: <1576666417-20989-1-git-send-email-vrd@amazon.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.146]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Gautam, Varad" <vrd@amazon.de>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gVmFyYWQgR2F1
dGFtDQo+IFNlbnQ6IDE4IERlY2VtYmVyIDIwMTkgMTA6NTQNCj4gVG86IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47IEdhdXRhbSwgVmFyYWQNCj4gPHZyZEBhbWF6b24uZGU+OyBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dlci5wYXVAY2l0cml4
LmNvbT4NCj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENIIHYyXSB4ODY6IGlycTogRG8gbm90
IEJVR19PTiBtdWx0aXBsZSB1bmJpbmQNCj4gY2FsbHMgZm9yIHNoYXJlZCBwaXJxcw0KPiANCj4g
WEVOX0RPTUNUTF9kZXN0cm95ZG9tYWluIGNyZWF0ZXMgYSBjb250aW51YXRpb24gaWYgZG9tYWlu
X2tpbGwgLUVSRVNUQVJUUy4NCj4gSW4gdGhhdCBzY2VuYXJpbywgaXQgaXMgcG9zc2libGUgdG8g
cmVjZWl2ZSBtdWx0aXBsZSBfcGlycV9ndWVzdF91bmJpbmQNCj4gY2FsbHMgZm9yIHRoZSBzYW1l
IHBpcnEgZnJvbSBkb21haW5fa2lsbCwgaWYgdGhlIHBpcnEgaGFzIG5vdCB5ZXQgYmVlbg0KPiBy
ZW1vdmVkIGZyb20gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgYXM6DQo+ICAgZG9tYWluX2tpbGwo
KQ0KPiAgICAgLT4gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkNCj4gICAgICAgLT4gcGNp
X3JlbGVhc2VfZGV2aWNlcygpDQo+ICAgICAgICAgLT4gcGNpX2NsZWFuX2RwY2lfaXJxKCkNCj4g
ICAgICAgICAgIC0+IHBpcnFfZ3Vlc3RfdW5iaW5kKCkNCj4gICAgICAgICAgICAgLT4gX19waXJx
X2d1ZXN0X3VuYmluZCgpDQo+IA0KPiBGb3IgYSBzaGFyZWQgcGlycSAobnJfZ3Vlc3RzID4gMSks
IHRoZSBmaXJzdCBjYWxsIHdvdWxkIHphcCB0aGUgY3VycmVudA0KPiBkb21haW4gZnJvbSB0aGUg
cGlycSdzIGd1ZXN0c1tdIGxpc3QsIGJ1dCB0aGUgYWN0aW9uIGhhbmRsZXIgaXMgbmV2ZXINCj4g
ZnJlZWQNCj4gYXMgdGhlcmUgYXJlIG90aGVyIGd1ZXN0cyB1c2luZyB0aGlzIHBpcnEuIEFzIGEg
cmVzdWx0LCBvbiB0aGUgc2Vjb25kDQo+IGNhbGwsDQo+IF9fcGlycV9ndWVzdF91bmJpbmQgc2Vh
cmNoZXMgZm9yIHRoZSBjdXJyZW50IGRvbWFpbiB3aGljaCBoYXMgYmVlbiByZW1vdmVkDQo+IGZy
b20gdGhlIGd1ZXN0c1tdIGxpc3QsIGFuZCBoaXRzIGEgQlVHX09OLg0KPiANCj4gTWFrZSBfX3Bp
cnFfZ3Vlc3RfdW5iaW5kIHNhZmUgdG8gYmUgY2FsbGVkIG11bHRpcGxlIHRpbWVzIGJ5IGxldHRp
bmcgeGVuDQo+IGNvbnRpbnVlIGlmIGEgc2hhcmVkIHBpcnEgaGFzIGFscmVhZHkgYmVlbiB1bmJv
dW5kIGZyb20gdGhpcyBndWVzdC4gVGhlDQo+IFBJUlEgd2lsbCBiZSBjbGVhbmVkIHVwIGZyb20g
dGhlIGRvbWFpbidzIHBpcnFfdHJlZSBkdXJpbmcgdGhlIGRlc3RydWN0aW9uDQo+IGluIGNvbXBs
ZXRlX2RvbWFpbl9kZXN0cm95IGFueXdheXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWYXJhZCBH
YXV0YW0gPHZyZEBhbWF6b24uZGU+DQo+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ0M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5
OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQoNCj4gDQo+IHYyOiBTcGxpdCB0
aGUgY2hlY2sgb24gYWN0aW9uLT5ucl9ndWVzdHMgPiAwIGFuZCBtYWtlIGl0IGFuIEFTU0VSVCwN
Cj4gcmV3b3JkLg0KPiAtLS0NCj4gIHhlbi9hcmNoL3g4Ni9pcnEuYyB8IDExICsrKysrKysrKyst
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pcnEuYyBiL3hlbi9hcmNoL3g4Ni9pcnEuYw0K
PiBpbmRleCA1ZDBkOTRjLi4zZWI3YjIyIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaXJx
LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2lycS5jDQo+IEBAIC0xODYzLDcgKzE4NjMsMTYgQEAg
c3RhdGljIGlycV9ndWVzdF9hY3Rpb25fdCAqX19waXJxX2d1ZXN0X3VuYmluZCgNCj4gDQo+ICAg
ICAgZm9yICggaSA9IDA7IChpIDwgYWN0aW9uLT5ucl9ndWVzdHMpICYmIChhY3Rpb24tPmd1ZXN0
W2ldICE9IGQpOyBpKysNCj4gKQ0KPiAgICAgICAgICBjb250aW51ZTsNCj4gLSAgICBCVUdfT04o
aSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyk7DQo+ICsgICAgaWYgKCBpID09IGFjdGlvbi0+bnJfZ3Vl
c3RzICkgew0KPiArICAgICAgICBBU1NFUlQoYWN0aW9uLT5ucl9ndWVzdHMgPiAwKSA7DQo+ICsg
ICAgICAgIC8qIEluIGNhc2UgdGhlIHBpcnEgd2FzIHNoYXJlZCwgdW5ib3VuZCBmb3IgdGhpcyBk
b21haW4gaW4gYW4NCj4gZWFybGllciBjYWxsLCBidXQgc3RpbGwNCj4gKyAgICAgICAgICogZXhp
c3RlZCBvbiB0aGUgZG9tYWluJ3MgcGlycV90cmVlLCB3ZSBzdGlsbCByZWFjaCBoZXJlIGlmDQo+
IHRoZXJlIGFyZSBhbnkgbGF0ZXINCj4gKyAgICAgICAgICogdW5iaW5kIGNhbGxzIG9uIHRoZSBz
YW1lIHBpcnEuIFJldHVybiBpZiBzdWNoIGFuIHVuYmluZA0KPiBoYXBwZW5zLiAqLw0KPiArICAg
ICAgICBpZiAoIGFjdGlvbi0+c2hhcmVhYmxlICkNCj4gKyAgICAgICAgICAgIHJldHVybiBOVUxM
Ow0KPiArICAgICAgICBCVUcoKTsNCj4gKyAgICB9DQo+ICsNCj4gICAgICBtZW1tb3ZlKCZhY3Rp
b24tPmd1ZXN0W2ldLCAmYWN0aW9uLT5ndWVzdFtpKzFdLA0KPiAgICAgICAgICAgICAgKGFjdGlv
bi0+bnJfZ3Vlc3RzLWktMSkgKiBzaXplb2YoYWN0aW9uLT5ndWVzdFswXSkpOw0KPiAgICAgIGFj
dGlvbi0+bnJfZ3Vlc3RzLS07DQo+IC0tDQo+IDIuNy40DQo+IA0KPiANCj4gDQo+IA0KPiBBbWF6
b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSA0KPiBLcmF1c2Vuc3RyLiAzOA0KPiAx
MDExNyBCZXJsaW4NCj4gR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBK
b25hdGhhbiBXZWlzcw0KPiBFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVy
ZyB1bnRlciBIUkIgMTQ5MTczIEINCj4gU2l0ejogQmVybGluDQo+IFVzdC1JRDogREUgMjg5IDIz
NyA4NzkNCj4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
