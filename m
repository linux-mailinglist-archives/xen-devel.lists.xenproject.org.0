Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4F610AE5A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 11:59:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZv0x-0008Ac-IO; Wed, 27 Nov 2019 10:57:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J2FP=ZT=amazon.com=prvs=227ebe4de=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZv0v-0008AX-Je
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 10:57:41 +0000
X-Inumbo-ID: baa6d6b2-1104-11ea-a3af-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id baa6d6b2-1104-11ea-a3af-12813bfff9fa;
 Wed, 27 Nov 2019 10:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574852261; x=1606388261;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CXNMzyTzVg78Vs3Od561sNrPCQpVYJyhznS+qt0wEek=;
 b=fSkVL6noBM1WQK7nS35jXM0OT5Np0rFtUhDN6HMsopl+c0hzekNTSiWo
 bpwiChJ9hWbkAN/QSLuU+jPfw7yLy9IkAPWjY83jbbYFO7kf/wuKsqJsK
 aM5f5G+91goLjc0GjZgjcjwdbBxUbT5kMWg+zdns90Rpk65MnLU4/mF4m U=;
IronPort-SDR: 0l/iTaJftLoLL6emLJdV5Ugsu5oP8JmeLEKgBqFAL3Sk7HKWvfKaZgdpc0ar79AXCpWaHKwNrR
 lzUxy21hwQsQ==
X-IronPort-AV: E=Sophos;i="5.69,249,1571702400"; d="scan'208";a="11561826"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 27 Nov 2019 10:57:29 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id F0E9DA1EB2; Wed, 27 Nov 2019 10:57:26 +0000 (UTC)
Received: from EX13D37EUB004.ant.amazon.com (10.43.166.187) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 10:57:25 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUB004.ant.amazon.com (10.43.166.187) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 10:57:25 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 27 Nov 2019 10:57:25 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>, "Grall, Julien" <jgrall@amazon.com>
Thread-Topic: [PATCH] xen/x86: vpmu: Unmap per-vCPU PMU page when the domain
 is destroyed
Thread-Index: AQHVpH1ftFFPr4jWeUChNo7fRMGTK6eexXcAgAATfDA=
Date: Wed, 27 Nov 2019 10:57:25 +0000
Message-ID: <7593041e441a4136ade7ee17d4d35971@EX13D32EUC003.ant.amazon.com>
References: <20191126171715.10881-1-pdurrant@amazon.com>
 <afa87ca4-ecda-82d7-7c99-4dcf807ddd6d@suse.com>
In-Reply-To: <afa87ca4-ecda-82d7-7c99-4dcf807ddd6d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] xen/x86: vpmu: Unmap per-vCPU PMU page when
 the domain is destroyed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI3IE5vdmVtYmVyIDIwMTkgMDk6NDQNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBHcmFsbCwgSnVsaWVuIDxqZ3JhbGxAYW1h
em9uLmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3IENv
b3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPjsgV2VpDQo+IExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0geGVuL3g4NjogdnBtdTogVW5tYXAgcGVyLXZDUFUgUE1VIHBhZ2Ugd2hlbiB0
aGUNCj4gZG9tYWluIGlzIGRlc3Ryb3llZA0KPiANCj4gT24gMjYuMTEuMjAxOSAxODoxNywgUGF1
bCBEdXJyYW50IHdyb3RlOg0KPiA+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5j
b20+DQo+ID4NCj4gPiBBIGd1ZXN0IHdpbGwgc2V0dXAgYSBzaGFyZWQgcGFnZSB3aXRoIHRoZSBo
eXBlcnZpc29yIGZvciBlYWNoIHZDUFUgdmlhDQo+ID4gWEVOUE1VX2luaXQuIFRoZSBwYWdlIHdp
bGwgdGhlbiBnZXQgbWFwcGVkIGluIHRoZSBoeXBlcnZpc29yIGFuZCBvbmx5DQo+ID4gcmVsZWFz
ZWQgd2hlbiBYRU1QTVVfZmluaXNoIGlzIGNhbGxlZC4NCj4gPg0KPiA+IFRoaXMgbWVhbnMgdGhh
dCBpZiB0aGUgZ3Vlc3QgaXMgbm90IHNodXRkb3duIGdyYWNlZnVsbHkgKHN1Y2ggYXMgdmlhIHhs
DQo+ID4gZGVzdHJveSksIHRoZSBwYWdlIHdpbGwgc3RheSBtYXBwZWQgaW4gdGhlIGh5cGVydmlz
b3IuDQo+IA0KPiBJc24ndCB0aGlzIHN0aWxsIHRvbyB3ZWFrIGEgZGVzY3JpcHRpb24/IEl0J3Mg
bm90IHRoZSB0b29sIHN0YWNrDQo+IGludm9raW5nIFhFTlBNVV9maW5pc2gsIGJ1dCB0aGUgZ3Vl
c3QgaXRzZWxmIGFmYWljcy4gSS5lLiBhDQo+IG1pc2JlaGF2aW5nIGd1ZXN0IGNvdWxkIHByZXZl
bnQgcHJvcGVyIGNsZWFudXAgZXZlbiB3aXRoIGdyYWNlZnVsDQo+IHNodXRkb3duLg0KPiANCg0K
T2ssIGhvdyBhYm91dCAnaWYgdGhlIGd1ZXN0IGZhaWxzIHRvIGludm9rZSBYRU5QTVVfZmluaXNo
LCBlLmcuIGlmIGl0IGlzIGRlc3Ryb3llZCwgcmF0aGVyIHRoYW4gY2xlYW5seSBzaHV0IGRvd24n
Pw0KDQo+ID4gQEAgLTIyMjQsNiArMjIyMSw5IEBAIGludCBkb21haW5fcmVsaW5xdWlzaF9yZXNv
dXJjZXMoc3RydWN0IGRvbWFpbiAqZCkNCj4gPiAgICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSAp
DQo+ID4gICAgICAgICAgaHZtX2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyhkKTsNCj4gPg0K
PiA+ICsgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQ0KPiA+ICsgICAgICAgIHZwbXVfZGVzdHJv
eSh2KTsNCj4gPiArDQo+ID4gICAgICByZXR1cm4gMDsNCj4gPiAgfQ0KPiANCj4gSSB0aGluayBz
aW1wbGUgdGhpbmdzIHdoaWNoIG1heSBhbGxvdyBzaHJpbmtpbmcgdGhlIHBhZ2UgbGlzdHMNCj4g
c2hvdWxkIGJlIGRvbmUgZWFybHkgaW4gdGhlIGZ1bmN0aW9uLiBBcyB2cG11X2Rlc3Ryb3koKSBs
b29rcw0KPiB0byBiZSBpZGVtcG90ZW50LCBob3cgYWJvdXQgbGV2ZXJhZ2luZyB0aGUgdmVyeSBm
aXJzdA0KPiBmb3JfZWFjaF92Y3B1KCkgbG9vcCBpbiB0aGUgZnVuY3Rpb24gKHRoZXJlIGFyZSB0
b28gbWFueSBvZiB0aGVtDQo+IHRoZXJlIGFueXdheSwgYXQgbGVhc3QgZm9yIG15IHRhc3RlKT8N
Cj4gDQoNCk9rLiBJIGRpZCB3b25kZXIgd2hlcmUgaW4gdGhlIHNlcXVlbmNlIHdhcyBiZXN0Li4u
IExlYXZpbmcgdG8gdGhlIGVuZCBvYnZpb3VzbHkgcHV0cyBpdCBjbG9zZXIgdG8gd2hlcmUgaXQg
d2FzIHByZXZpb3VzbHkgY2FsbGVkLCBidXQgSSBjYW4ndCBzZWUgYW55IGhhcm0gaW4gbW92aW5n
IGl0IGVhcmxpZXIuDQoNCiAgUGF1bA0KDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
