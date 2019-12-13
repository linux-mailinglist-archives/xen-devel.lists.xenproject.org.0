Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D211E730
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:58:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnIV-0005fN-Ps; Fri, 13 Dec 2019 15:56:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RhJP=2D=amazon.com=prvs=2436cd82a=hongyxia@srs-us1.protection.inumbo.net>)
 id 1ifnIT-0005fE-EN
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 15:56:05 +0000
X-Inumbo-ID: 1062c250-1dc1-11ea-8f51-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1062c250-1dc1-11ea-8f51-12813bfff9fa;
 Fri, 13 Dec 2019 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576252564; x=1607788564;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uzX2TtGOr0DLAFQu6iPbslKd7pcbSGgslWtcyi9V+qE=;
 b=MDv8xiH/+P0NTZJUmeeT5H2Vk8P7PU7qtYAaGU3h7RSd9g+yfKNMMEU/
 Iyzx2i8LqLiTHcx7fSsJ7Qgnoix2Woa8NK7jan01SKhdweF3uvqM8A9EJ
 m27n+XqcBqXBwylFt9zvfBV6ferkLP3d4DVVFvuOqEk+xsApCvv2B3LwJ 0=;
IronPort-SDR: NMVOnnycP3KBCp27g96675sfq17cs78ayPjK2o3nONEOlatWBMo89qug+XUrJBB0cw/zmOr85P
 pnDpo/R7+rxA==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; d="scan'208";a="14753572"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 13 Dec 2019 15:55:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id D4D07A1C83; Fri, 13 Dec 2019 15:55:50 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 15:55:50 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 15:55:49 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Fri, 13 Dec 2019 15:55:49 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 1/2] x86/mm: factor out the code for shattering an l3
 PTE
Thread-Index: AQHVscBm1RkMKh7+EEeoRcWu0gs6Aae4OBEA
Date: Fri, 13 Dec 2019 15:55:49 +0000
Message-ID: <30fe3dd53b0e5f57d4d79bf6bd9bc7bee9cb0c40.camel@amazon.com>
References: <cover.1576154413.git.hongyxia@amazon.com>
 <77acf62cab293ae99bd1fc079e1b0853faaf1242.1576154413.git.hongyxia@amazon.com>
 <2717096f-21d7-f184-b606-a3defffad847@citrix.com>
In-Reply-To: <2717096f-21d7-f184-b606-a3defffad847@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.37]
Content-ID: <CBAC402E03F9964BAD253E204A496B89@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Grall, Julien" <jgrall@amazon.com>, "wl@xen.org" <wl@xen.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIEZyaSwgMjAxOS0xMi0xMyBhdCAxNDoxOSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToNCj4gT24gMTIvMTIvMjAxOSAxMjo0NiwgSG9uZ3lhbiBYaWEgd3JvdGU6DQo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMNCj4gPiBpbmRl
eCA3ZDRkZDgwYTg1Li44ZGVmNGZiOGQ4IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tLmMNCj4gPiBAQCAtNTE1MSw2ICs1MTUxLDUy
IEBAIGwxX3BnZW50cnlfdCAqdmlydF90b194ZW5fbDFlKHVuc2lnbmVkIGxvbmcNCj4gPiB2KQ0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmx1c2hfYXJlYV9sb2NhbCgoY29uc3Qgdm9p
ZCAqKXYsIGYpIDogXA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmx1c2hfYXJlYV9h
bGwoKGNvbnN0IHZvaWQgKil2LCBmKSkNCj4gPiAgDQo+ID4gKy8qIFNoYXR0ZXIgYW4gbDMgZW50
cnkgYW5kIHBvcHVsYXRlIGwyLiBJZiB2aXJ0IGlzIHBhc3NlZCBpbiwgYWxzbw0KPiA+IGRvIGZs
dXNoLiAqLw0KPiA+ICtzdGF0aWMgYm9vbCBzaGF0dGVyX2wzZShsM19wZ2VudHJ5X3QgKnBsM2Us
IHVuc2lnbmVkIGxvbmcgdmlydCwNCj4gPiBib29sIGxvY2tpbmcpDQo+ID4gK3sNCj4gPiArICAg
IHVuc2lnbmVkIGludCBpOw0KPiA+ICsgICAgbDNfcGdlbnRyeV90IG9sM2UgPSAqcGwzZTsNCj4g
PiArICAgIGwyX3BnZW50cnlfdCBsMmUgPSBsMmVfZnJvbV9pbnRwdGUobDNlX2dldF9pbnRwdGUo
b2wzZSkpOw0KPiA+ICsgICAgbDJfcGdlbnRyeV90ICpsMnQgPSBhbGxvY194ZW5fcGFnZXRhYmxl
KCk7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCAhbDJ0ICkNCj4gPiArICAgICAgICByZXR1cm4gZmFs
c2U7DQo+ID4gKw0KPiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBMMl9QQUdFVEFCTEVfRU5UUklF
UzsgaSsrICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBsMmVfd3JpdGUobDJ0ICsgaSwgbDJl
KTsNCj4gPiArICAgICAgICBsMmUgPSBsMmVfZnJvbV9pbnRwdGUoDQo+ID4gKyAgICAgICAgICAg
ICAgICAgIGwyZV9nZXRfaW50cHRlKGwyZSkgKyAoUEFHRV9TSVpFIDw8DQo+ID4gUEFHRVRBQkxF
X09SREVSKSk7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBsb2NraW5nICkNCj4g
PiArICAgICAgICBzcGluX2xvY2soJm1hcF9wZ2Rpcl9sb2NrKTsNCj4gPiArICAgIGlmICggKGwz
ZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJFU0VOVCkgJiYNCj4gPiArICAgICAgICAgKGwz
ZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNFKSApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAg
ICAgbDNlX3dyaXRlX2F0b21pYyhwbDNlLA0KPiA+ICsgICAgICAgICAgICBsM2VfZnJvbV9wYWRk
cih2aXJ0X3RvX21hZGRyKGwydCksDQo+ID4gX19QQUdFX0hZUEVSVklTT1IpKTsNCj4gPiArICAg
ICAgICBsMnQgPSBOVUxMOw0KPiA+ICsgICAgfQ0KPiA+ICsgICAgaWYgKCBsb2NraW5nICkNCj4g
PiArICAgICAgICBzcGluX3VubG9jaygmbWFwX3BnZGlyX2xvY2spOw0KPiA+ICsNCj4gPiArICAg
IGlmICggdmlydCApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgdW5zaWduZWQgaW50IGZsdXNo
X2ZsYWdzID0NCj4gPiArICAgICAgICAgICAgRkxVU0hfVExCIHwgRkxVU0hfT1JERVIoMiAqIFBB
R0VUQUJMRV9PUkRFUik7DQo+ID4gKw0KPiA+ICsgICAgICAgIGlmICggbDNlX2dldF9mbGFncyhv
bDNlKSAmIF9QQUdFX0dMT0JBTCApDQo+ID4gKyAgICAgICAgICAgIGZsdXNoX2ZsYWdzIHw9IEZM
VVNIX1RMQl9HTE9CQUw7DQo+IA0KPiBBbm90aGVyIHByb2JsZW1hdGljIHVzZSBvZiBvbDNlIHdo
aWNoIGlzIHJhY3kgb24gY29uZmxpY3QuICBZb3UgbmVlZA0KPiB0bw0KPiBzdHJpY3RseSB1c2Ug
dGhlIGNvbnRlbnQgb2YgKnBsM2UgZnJvbSB3aXRoaW4gdGhlIGxvY2tlZCByZWdpb24uDQo+IA0K
DQpUaGlzIGlzIGFjdHVhbGx5IGp1c3QgcmVmYWN0b3JpbmcsIGFsdGhvdWdoIGlmIHRoZSBvcmln
aW5hbCBjb2RlIGlzDQp3cm9uZywgaXQgaXMgYWxzbyB3b3J0aCBmaXhpbmcuDQoNCkluIGZhY3Qs
IGluIHRoZSBsYXN0IGNvdXBsZSBvZiBkYXlzLCB0aGUgbW9yZSBJIHJlYWQgdGhlIGNvZGUgaW4N
Cm1hcF9wYWdlc190b194ZW4sIHRoZSBtb3JlIEkgYW0gd29ycmllZCBhYm91dCBpdHMgcmFjZSBj
b25kaXRpb25zIGFuZA0KY29ycmVjdG5lc3MuIFRoZSBsb2NrIGlzIG1vc3RseSB1c2VkIGZvciB3
cml0ZXMsIHNvIHRoZXJlIGFyZSBzbyBtYW55DQpyZWFkcyBvdXRzaWRlIHRoZSBsb2NrZWQgcmVn
aW9uIHdoaWNoIGNvdWxkIHBvdGVudGlhbGx5IHJlYWQgc3RhbGUNCnZhbHVlcy4gT25lIGV4YW1w
bGUgSSBmb3VuZCBpcyAoYWZ0ZXIgcmVmYWN0b3JpbmcpOg0KDQogICAgICAgICAgICAgZWxzZSBp
ZiAoIGwyZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFNFICkNCiAgICAgICAgICAgICB7DQoJ
ICAgICAgICAgLi4uDQogICAgICAgICAgICAgICAgIC8qIFBhc3MgdmlydCB0byBpbmRpY2F0ZSB3
ZSBuZWVkIHRvIGZsdXNoLiAqLw0KICAgICAgICAgICAgICAgICBpZiAoICFzaGF0dGVyX2wyZShw
bDJlLCB2aXJ0LCBsb2NraW5nKSApDQogICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsNCgkgICAgIH0NCg0KCSAgICAgcGwxZSAgPSBsMmVfdG9fbDFlKCpwbDJlKSArIGwxX3RhYmxl
X29mZnNldCh2aXJ0KTsNCg0KSXQgdHJpZXMgdG8gc2hhdHRlciBhbiBsMiBwYWdlIGJlZm9yZSBh
Y2Nlc3NpbmcgYSBwbDFlLCBidXQgaXMgdGhlcmUNCmFueSBndWFyZCBiZXR3ZWVuIHRoZSBzaGF0
dGVyaW5nIGFuZCB0aGUgcmVhZCBvZiBwbDFlPyBJZiBhbm90aGVyIGNhbGwNCmNvbWVzIGluIGJl
dHdlZW4gdGhlIHR3byBhbmQgbWVyZ2VzIHRoaXMgcGFnZSBiYWNrIHRvIGEgc3VwZXJwYWdlLCB0
aGUNCnBsMWUgdGhlbiBhY2Nlc3NlcyB0aGUgc3VwZXJwYWdlIG1lbW9yeSBpbnN0ZWFkIG9mIGEg
UFRFIHBhZ2UhIChQbGVhc2UNCmNoZWNrIG15IGxvZ2ljLikgQWxzbyBpbiBvdGhlciBwbGFjZXMs
IHdlIHNlZSB0aGUgcmFjZXMgYmV0d2VlbiBQVEUNCm1vZGlmaWNhdGlvbnMgYW5kIGZsdXNoZXMu
DQoNClRoZXJlIGNvdWxkIGJlIG1vcmUgZXhhbXBsZXMgbGlrZSB0aGlzLiBPZiBjb3Vyc2UsIHJl
bW92aW5nIHRoZSBjb2RlDQpmb3IgbWVyZ2luZyBjYW4gYXZvaWQgYSBsb3Qgb2YgdGhlIHByb2Js
ZW1zLCBhbHRob3VnaCBKdWxpZW4gZXhwbGFpbmVkDQp0byBtZSB0aGF0IGl0IGNvdWxkIGJlIHVz
ZWZ1bCBkdXJpbmcgYm9vdC4gSWYgcmVtb3ZpbmcgaXMgbm90IGFuDQpvcHRpb24sIGlzIGl0IGEg
YmlnIHByb2JsZW0gdG8gZXh0ZW5kIHRoZSBsb2NrLCBlLmcuLCB0byB0aGUgd2hvbGUNCmZ1bmN0
aW9uPyBJdCBpcyBtb3N0bHkganVzdCB1c2VkIGJ5IHZtYXAgYWZ0ZXIgYm9vdCwgYW5kIGEgbGFy
Z2VyIGxvY2sNCmNhbiBzaW1wbGlmeSB0aGlzIGZ1bmN0aW9uIGFuZCBpdHMgbG9naWMgc2lnbmlm
aWNhbnRseS4gdm1hcCBpcyBhbHJlYWR5DQp0YWtpbmcgb3RoZXIgZ2xvYmFsIGxvY2tzIGJlZm9y
ZSBtYXBfcGFnZXNfdG9feGVuIGFueXdheSB0aG91Z2guDQoNCkhvbmd5YW4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
