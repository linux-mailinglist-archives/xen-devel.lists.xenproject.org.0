Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CE6145946
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 17:05:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuISf-0000dm-EP; Wed, 22 Jan 2020 16:02:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8xH2=3L=amazon.co.uk=prvs=28361e846=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iuISe-0000dh-EN
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 16:02:32 +0000
X-Inumbo-ID: 93f3b79e-3d30-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93f3b79e-3d30-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579708945; x=1611244945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mA53p8MB+pudhN3b5ksGfuYywN32fMQMNM+OrO2oGKM=;
 b=LvLojfeucnHzvuzDceBl5BDTcGUjPJfmaDhXNWSa0rdWxT+KBTefXmoR
 1dVQ3KYU81cLAc4QIPRu5HURYd6NfVwjjAkYla+pVlC483qSIbuWqg8NK
 aWFdwcS4BdA5KNaFhZ22apIdg9MFIMwdRchlcg02B9uJ/5gvFT2Fplb42 Y=;
IronPort-SDR: YgLjatoBPVoZ4ASD2acHf053vWB1EPMNK86OPwzvISHs6cMn4LMGQwoRrk0+bIb/H0oxXg2M2J
 2Pue6ODPvTYw==
X-IronPort-AV: E=Sophos;i="5.70,350,1574121600"; d="scan'208";a="12788801"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 22 Jan 2020 16:02:24 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3DCB1A37C5; Wed, 22 Jan 2020 16:02:20 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 22 Jan 2020 16:02:20 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 16:02:19 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 22 Jan 2020 16:02:19 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH 2/3] x86 / hvm: add domain_relinquish_resources() method
Thread-Index: AQHV0FJZRyIY+pOZxUu7LP3gD4xgXaf21tOAgAABMbCAAAF7AIAAAGQA
Date: Wed, 22 Jan 2020 16:02:19 +0000
Message-ID: <79ce797e5a62466788f80b52d80e4785@EX13D32EUC003.ant.amazon.com>
References: <20200121120009.1767-1-pdurrant@amazon.com>
 <20200121120009.1767-3-pdurrant@amazon.com>
 <018a1293-ad4f-44e3-ab73-90491077e434@suse.com>
 <9ad0b7eec02945dba00017f3bfe85730@EX13D32EUC003.ant.amazon.com>
 <6e32eeac-29d8-6e1b-f7be-5e2df9d104e4@suse.com>
In-Reply-To: <6e32eeac-29d8-6e1b-f7be-5e2df9d104e4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.87]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/3] x86 / hvm: add
 domain_relinquish_resources() method
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIyIEphbnVhcnkgMjAyMCAxNjowMQ0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsgSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsgS2V2aW4g
VGlhbg0KPiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8z
XSB4ODYgLyBodm06IGFkZCBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKQ0KPiBtZXRob2QN
Cj4gDQo+IE9uIDIyLjAxLjIwMjAgMTY6NTYsIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+ID4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4gPj4gU2VudDogMjIgSmFudWFyeSAyMDIwIDE1OjUxDQo+ID4+IFRvOiBE
dXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+DQo+ID4+IENjOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXINCj4gPj4gPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA+
PiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRl
bC5jb20+OyBLZXZpbg0KPiBUaWFuDQo+ID4+IDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gPj4g
U3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIHg4NiAvIGh2bTogYWRkIGRvbWFpbl9yZWxpbnF1aXNo
X3Jlc291cmNlcygpDQo+ID4+IG1ldGhvZA0KPiA+Pg0KPiA+PiBPbiAyMS4wMS4yMDIwIDEzOjAw
LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+PiBUaGVyZSBhcmUgdHdvIGZ1bmN0aW9ucyBpbiBo
dm0uYyB0byBkZWFsIHdpdGggdGVhci1kb3duIGFuZCBhIGRvbWFpbjoNCj4gPj4+IGh2bV9kb21h
aW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBhbmQgaHZtX2RvbWFpbl9kZXN0cm95KCkuIEhvd2V2
ZXIsDQo+ID4+IG9ubHkNCj4gPj4+IHRoZSBsYXR0ZXIgaGFzIGFuIGFzc29jaWF0ZWQgbWV0aG9k
IGluICdodm1fZnVuY3MnLiBUaGlzIHBhdGNoIGFkZHMNCj4gPj4+IGEgbWV0aG9kIGZvciB0aGUg
Zm9ybWVyIGFuZCBzdHViIGRlZmluaXRpb25zIGZvciBTVk0gYW5kIFZNWC4NCj4gPj4NCj4gPj4g
V2h5IHRoZSBzdHVicz8gU2ltcGx5IC4uLg0KPiA+Pg0KPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS9odm0uYw0KPiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPiA+Pj4gQEAg
LTcxNSw2ICs3MTUsOCBAQCBpbnQgaHZtX2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4g
KmQpDQo+ID4+Pg0KPiA+Pj4gIHZvaWQgaHZtX2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyhz
dHJ1Y3QgZG9tYWluICpkKQ0KPiA+Pj4gIHsNCj4gPj4+ICsgICAgaHZtX2Z1bmNzLmRvbWFpbl9y
ZWxpbnF1aXNoX3Jlc291cmNlcyhkKTsNCj4gPj4NCj4gPj4gLi4uIHN0aWNrIGEgTlVMTCBjaGVj
ayBhcm91bmQgdGhpcyBvbmUuIEkgYWxzbyB3b25kZXIgd2hldGhlciwgaXQNCj4gPj4gYmVpbmcg
ZW50aXJlbHkgbmV3LCB0aGlzIHdvdWxkbid0IGJldHRlciB1c2UgYWx0ZXJuYXRpdmUgY2FsbA0K
PiA+PiBwYXRjaGluZyByaWdodCBmcm9tIHRoZSBiZWdpbm5pbmcuIEl0J3Mgbm90IHRoZSBob3R0
ZXN0IHBhdGgsIGJ1dA0KPiA+PiBhdm9pZGluZyBpbmRpcmVjdCBjYWxscyBzZWVtcyBxdWl0ZSBk
ZXNpcmFibGUsIGVzcGVjaWFsbHkgd2hlbg0KPiA+PiBkb2luZyBzbyBpcyByZWxhdGl2ZWx5IGNo
ZWFwLg0KPiA+Pg0KPiA+DQo+ID4gSSdkIGxpa2UgaXQgdG8gYWxpZ24gd2l0aCB0aGUgcmVzdCBv
ZiB0aGUgaHZtX2Z1bmNzIHNvIEknbGwgYWRkIHRoZQ0KPiA+IE5VTEwgY2hlY2ssIGJ1dCBhbHRl
cm5hdGl2ZXMgcGF0Y2ggZm9yIGFsbCBodm1fZnVuY3Mgc2VlbXMgbGlrZSBhDQo+ID4gZ29vZCB0
aGluZyBJIHRoZSBsb25nZXIgdGVybS4NCj4gDQo+IFRoZSBmcmVxdWVudGx5IHVzZWQgb25lcyBo
YXZlIGJlZW4gY29udmVydGVkIGFscmVhZHkuIEhlbmNlIG15DQo+IHN1Z2dlc3Rpb24gdG8gbWFr
ZSBuZXcgb25lcyB1c2UgdGhhdCBtb2RlbCBmcm9tIHRoZSBiZWdpbm5pbmcuDQo+IA0KDQpPaCwg
b2suIEknbGwgZ28gbG9vayBmb3Igc29tZSBleGFtcGxlcy4NCg0KICBQYXVsDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
