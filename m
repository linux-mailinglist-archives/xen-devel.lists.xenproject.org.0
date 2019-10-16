Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FBED9243
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 15:19:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKj9p-0006B6-VG; Wed, 16 Oct 2019 13:16:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iHQC=YJ=amazon.com=prvs=185805445=hongyax@srs-us1.protection.inumbo.net>)
 id 1iKj9p-0006B1-4N
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 13:16:05 +0000
X-Inumbo-ID: 1b41b2c6-f017-11e9-a531-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b41b2c6-f017-11e9-a531-bc764e2007e4;
 Wed, 16 Oct 2019 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1571231764; x=1602767764;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+zUfcq3BbDgnBV1Hg+6kXuQlgvYvs3TZE5E8FNhkxUk=;
 b=OM/WAHsQmM+xqW5XpE92HyHpm/GD13KtceONTGER9jKUd7okObUKsduW
 qHu95e33F+kBCMi+HJjBZKnq0vBMo3qbUBmnu+d4yEfuOtnWRk25kkg1L
 IDUS8lG+wlMMixRS3aCLCMr8KPFWtwKuPhvpKXXuF1mG70ctW91CCZYxa Q=;
X-IronPort-AV: E=Sophos;i="5.67,303,1566864000"; d="scan'208";a="429716898"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 16 Oct 2019 13:16:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7FA1BA26EB; Wed, 16 Oct 2019 13:16:02 +0000 (UTC)
Received: from EX13D28EUB004.ant.amazon.com (10.43.166.176) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 16 Oct 2019 13:16:02 +0000
Received: from EX13D28EUB003.ant.amazon.com (10.43.166.124) by
 EX13D28EUB004.ant.amazon.com (10.43.166.176) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 16 Oct 2019 13:16:01 +0000
Received: from EX13D28EUB003.ant.amazon.com ([10.43.166.124]) by
 EX13D28EUB003.ant.amazon.com ([10.43.166.124]) with mapi id 15.00.1367.000;
 Wed, 16 Oct 2019 13:16:00 +0000
From: "Xia, Hongyan" <hongyax@amazon.com>
To: "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
Thread-Index: AQHVbXGtVtzaOawZ+kKh9XlzSl08aKdVWJuAgAgMCwCAAAgrAA==
Date: Wed, 16 Oct 2019 13:16:00 +0000
Message-ID: <63908235de248e9fdd68f271c4e49f2ca1009d21.camel@amazon.com>
References: <20190917160202.16770-1-julien.grall@arm.com>
 <0acfc39467986475acddea19da96b55f2468b8fe.camel@amazon.com>
 <6175492e-7e15-4338-2aed-0b5eee494782@arm.com>
In-Reply-To: <6175492e-7e15-4338-2aed-0b5eee494782@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.130]
Content-ID: <565109D39A4BD347807E7A041C4404D3@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLA0KDQpTdXJlLiBZb3Ugc2hvdWxkIGJlIGFibGUgdG8gZmluZCBpdCBvbiBkaXJl
Y3Rub25tYXAtdjIuMyBicmFuY2ggYXQNCmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRw
L3Blb3BsZS9oeDI0Mi94ZW4uZ2l0Lg0KDQpDb21taXQ6IGE0ZmVmMzFiOTkzODg1MjRkM2Y3NzQ4
OTY3YzVkMDRhOTI0Y2I3ZTMNCiAgICB4ODY6IGFkZCBQZXJzaXN0ZW50IE1hcCAoUE1BUCkgaW5m
cmFzdHJ1Y3R1cmUNCg0KT25lIHRoaW5nIHRvIG5vdGUgaXMgdGhhdCB0aGUgUE1BUCBzdHJ1Y3R1
cmUgaXMgcmVhbGx5IGxvdy1wZXJmb3JtYW5jZQ0KYmVjYXVzZSB3ZSBkbyBub3Qgd2FudCB0byBi
dXJuIHRvbyBtYW55IGZpeG1hcCBlbnRyaWVzLiBJdCBzaG91bGQgbm8NCmxvbmdlciBiZSBpbiB1
c2UgdGhlIG1vbWVudCB3ZSBib290c3RyYXBwZWQgb3RoZXIgbWFwcGluZw0KaW5mcmFzdHJ1Y3R1
cmVzLiBUaGUgb25seSBpbnRlbnRpb24gb2YgaXQgaXMgdG8gYmUgYWJsZSB0byBtYXAgcGFnZXMN
CnZlcnkgZWFybHkgb24uDQoNCkhvbmd5YW4NCg0KT24gV2VkLCAyMDE5LTEwLTE2IGF0IDEzOjQ2
ICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIEhvbmd5YW4sDQo+IA0KPiBPbiAxMS8x
MC8yMDE5IDEwOjUzLCBYaWEsIEhvbmd5YW4gd3JvdGU6DQo+ID4gTm90IGNvbW1lbnRpbmcgb24g
dGhlIHBhdGNoLCBidXQgSSBoYWQgZXhhY3RseSB0aGUgc2FtZSBwcm9ibGVtDQo+ID4gd2hlbg0K
PiA+IHJlbW92aW5nIHRoZSBkaXJlY3QgbWFwIGluIHg4Ni4gbWFwX2RvbWFpbl9wYWdlIGhhcyB0
byBiZSB1c2FibGUNCj4gPiB3aXRob3V0IHRoZSBkaXJlY3QgbWFwIGFuZCBldmVuIGJlZm9yZSBh
bGxvY19ib290X3BhZ2VzIGNhbiBiZSB1c2VkDQo+ID4gKHNvDQo+ID4gdGhhdCBJIGNhbiBtYXAg
dGhlIGJvb3RtZW1fcmVnaW9uc19saXN0LCBhbHRob3VnaCBJIGhhdmUgbWFkZSBpdA0KPiA+IHN0
YXRpY2FsbHkgYWxsb2NhdGVkIG5vdykuDQo+ID4gDQo+ID4gVGhlIGRpcmVjdCBtYXAgdGVhcmRv
d24gc2VyaWVzIGluIHRoZSBlbmQgaW50cm9kdWNlcyBhIHBlcnNpc3RlbnQNCj4gPiBtYXBwaW5n
IGluZnJhc3RydWN0dXJlIHRvIG1hcCBwYWdlIHRhYmxlcyB3aGljaCBvY2N1cGllcyBhIGZldw0K
PiA+IGZpeG1hcA0KPiA+IGVudHJpZXMsIGFuZCBhdm9pZCBzZXRfZml4bWFwIGJ1dCBpbnN0ZWFk
IG1vZGlmeSB0aGUgZW50cmllcw0KPiA+IGRpcmVjdGx5DQo+ID4gdG8gYXZvaWQgaW52b2NhdGlv
biBsb29wcy4gVGhlIHJlc3VsdCBpcyB0aGF0IG1hcF94ZW5fcGFnZXRhYmxlIGFuZA0KPiA+IG1h
cF9kb21haW5fcGFnZSBpcyB1c2FibGUgZnJvbSB0aGUgdmVyeSBiZWdpbm5pbmcgb2Ygc3RhcnRf
eGVuLg0KPiANCj4gV291bGQgeW91IG1pbmQgdG8gcG9pbnQgdG8gdGhlIHBhdGNoIGFkZGluZyB0
aGUgaW1wbGVtZW50YXRpb24gb24NCj4geDg2Pw0KPiANCj4gT24gYXJtMzIsIHdlIGFyZSBub3Qg
dXNpbmcgYSBkaXJlY3QgbWFwLiBTbyB3ZSBhcmUgdXNpbmcgYSBwZXItY3B1DQo+IG1hcHBpbmcg
KHNlZSANCj4gbWFwX2RvbWFpbl9wYWdlKCkgaW1wbGVtZW50YXRpb24gaW4gYXJjaC9hcm0vbW0u
YykuDQo+IA0KPiBPbiBhcm02NCwgd2UgYXJlIHVzaW5nIHRoZSBkaXJlY3QgbWFwIHNvIGZhci4g
QnV0IHdlIGNvdWxkIHVzZSBhbnkgb2YNCj4gdGhlIHR3byANCj4gc29sdXRpb25zIGlmIG5lZWRl
ZC4NCj4gDQo+IENoZWVycywNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
