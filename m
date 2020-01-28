Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2A914BDD8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:35:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwTnW-0007ws-LJ; Tue, 28 Jan 2020 16:33:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0vDG=3R=amazon.co.uk=prvs=289a7b1b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwTnV-0007wn-0F
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:33:05 +0000
X-Inumbo-ID: db5821f0-41eb-11ea-8730-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db5821f0-41eb-11ea-8730-12813bfff9fa;
 Tue, 28 Jan 2020 16:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580229184; x=1611765184;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XXvkDU2TzIosLvVXMuWJisC8HhqRFlM3nfA/b9k1beo=;
 b=RcjM0eP/LSoqhDXH9dCaqqIt6G7OaeRju+T6V54cd2jmCtJG5JIoYN8z
 lNrhs+twD/blVpmCts8wiFwMAjxFWrmM3PWfhD96KC8fIaspUpSEk4egp
 gw9VZA6VpcXG+kUJR3JnZQmIWvQngPFmsuYgCavOq/0wr6U3kNfJreKfw Q=;
IronPort-SDR: s7m8GdaexNVuOvHRu4Jh52UV89roZa4FBHEJ5B+VNiRKZ0jfaaDSNJQVWRoNPMrqSCDkjZUSkx
 gt3gYF+qyXZw==
X-IronPort-AV: E=Sophos;i="5.70,374,1574121600"; d="scan'208";a="15137374"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 28 Jan 2020 16:33:02 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id BB3151A2A69; Tue, 28 Jan 2020 16:33:01 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 28 Jan 2020 16:33:01 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 28 Jan 2020 16:33:00 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 28 Jan 2020 16:33:00 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v4 6/7] x86/hyperv: retrieve vp_index from
 Hyper-V
Thread-Index: AQHV0WIB2MUXnCM2s0mWNu7Ejtkljqf4ZmMAgAfdfACAAAaIgIAAAzQw
Date: Tue, 28 Jan 2020 16:33:00 +0000
Message-ID: <c6a5c2bc7178499ca4618a76996dc8d4@EX13D32EUC003.ant.amazon.com>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-7-liuwe@microsoft.com>
 <c73aa226-df1a-552c-caea-f6a781dc63c6@suse.com>
 <20200128155510.ruie6ck4i3hg5dub@debian>
 <568d6410-ad85-74f8-84ab-2c5e47d2c314@suse.com>
In-Reply-To: <568d6410-ad85-74f8-84ab-2c5e47d2c314@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 6/7] x86/hyperv: retrieve vp_index from
 Hyper-V
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <liuwe@microsoft.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMjggSmFudWFyeSAyMDIwIDE2OjE5DQo+IFRvOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPjsgUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBDYzogWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBh
dUBjaXRyaXguY29tPjsgV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IE1pY2hhZWwgS2Vs
bGV5DQo+IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZl
bF0gW1BBVENIIHY0IDYvN10geDg2L2h5cGVydjogcmV0cmlldmUgdnBfaW5kZXggZnJvbQ0KPiBI
eXBlci1WDQo+IA0KPiBPbiAyOC4wMS4yMDIwIDE2OjU1LCBXZWkgTGl1IHdyb3RlOg0KPiA+IE9u
IFRodSwgSmFuIDIzLCAyMDIwIGF0IDA0OjQ4OjM4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPiA+PiBPbiAyMi4wMS4yMDIwIDIxOjIzLCBXZWkgTGl1IHdyb3RlOg0KPiA+Pj4gVGhpcyB3
aWxsIGJlIHVzZWZ1bCB3aGVuIGludm9raW5nIGh5cGVyY2FsbCB0aGF0IHRhcmdldHMgc3BlY2lm
aWMNCj4gPj4+IHZjcHUocykuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
bGl1d2VAbWljcm9zb2Z0LmNvbT4NCj4gPj4+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWxAeGVuLm9yZz4NCj4gPj4NCj4gPj4gRm9yIGZvcm1hbCByZWFzb25zDQo+ID4+IEFja2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+DQo+ID4+IEhvd2V2ZXIgSSB3
b25kZXIgd2hldGhlciB0aGUgVmlyaWRpYW4gZW50cnkgaW4gTUFJTlRBSU5FUlMgc2hvdWxkbid0
DQo+ID4+IGJlIGV4dGVuZGVkIGJ5DQo+ID4+DQo+ID4+IEY6CXhlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvDQo+ID4+DQo+ID4+IChhbmQgcG9zc2libHkgaGF2ZSBpdHMgdGl0bGUgYWRqdXN0ZWQp
LiBUaG91Z2h0cz8NCj4gPg0KPiA+IFRoaXMgaXNuJ3QgYWJvdXQgZW11bGF0aW5nIEh5cGVyLVYg
aW5zaWRlIFhlbiwgc28gSSBkb24ndCB0aGluayB0aGF0J3MNCj4gPiB0aGUgcmlnaHQgYXBwcm9h
Y2ggaGVyZS4NCj4gDQo+IFdlbGwsIGl0J3MgdGhlIGNvZGUgcHJvZHVjaW5nIHRoZSBpbnRlcmZh
Y2UgaW4gb25lIGNhc2UsIGFuZA0KPiBjb25zdW1pbmcgaXQgaGVyZS4gU28gdGhlcmUgaXMgc29t
ZSBvdmVybGFwIGF0IGxlYXN0Lg0KPiANCj4gPiBUaGF0IHNhaWQsIGlmIFBhdWwgd2FudHMgdG8g
dGFrZSB0aGlzIHVuZGVyIGhpcyBwdXJ2aWV3LCBpdCdzIGZpbmUgYnkgbWUNCj4gPiAtLSB0aGF0
IHdvdWxkIG1ha2UgbWUgZWFzaWVyIHRvIHVwc3RyZWFtIG15IHBhdGNoLiA7LSkgIEkgYWxzbyB3
b3VsZG4ndA0KPiA+IG1pbmQgYWRkaW5nIG15c2VsZiBhcyBtYWludGFpbmVyIGZvciB0aGlzIHBh
dGguDQo+IA0KPiBQZXJoYXBzIGJlc3QgYm90aCBvZiB5b3U/IFBhdWwsIEFuZHJldywgd2hhdCBk
byB5b3UgdGhpbms/DQo+IA0KDQpJTU8gaXQncyBwcm9iYWJseSBiZXN0IHRvIHRoZSBwdXQgdGhl
IEh5cGVyLVYgc3R1ZmYgdW5kZXIgJ1ZpcmlkaWFuJyBhbmQgYWRkIHlvdXJzZWxmIGFzIGEgbWFp
bnRhaW5lciB0aGVyZS4gVGhlcmUgcmVhbGx5IGlzIGxpa2VseSB0byBiZSBzaWduaWZpY2FudCBv
dmVybGFwIGFuZCBpdCdkIG1ha2UgaXQgZWFzaWVyIChmb3IgbWUgYXQgbGVhc3QpIHRvIGtlZXAg
dHJhY2sgb2YgdGhlIGJpZ2dlciBwaWN0dXJlIChpLmUuIFhlbiB1c2luZyBlbmxpZ2h0ZW5tZW50
cyBhcyB3ZWxsIGFzIGltcGxlbWVudGluZyB0aGVtKS4NCg0KICBDaGVlcnMsDQoNCiAgICBQYXVs
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
