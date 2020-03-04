Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F44178D8F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 10:37:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9QPx-00019F-6I; Wed, 04 Mar 2020 09:34:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B1xp=4V=amazon.co.uk=prvs=325108782=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9QPv-00019A-EP
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 09:34:15 +0000
X-Inumbo-ID: 4f2cd8c0-5dfb-11ea-a36b-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f2cd8c0-5dfb-11ea-a36b-12813bfff9fa;
 Wed, 04 Mar 2020 09:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583314453; x=1614850453;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bhnDIFx9ZnYvN3kRzC1AyjxyuhP/jJVrKZDMsJxEnOw=;
 b=iqC2LETpQQOKx2QE89O3Ef+oN71QXozW/vEwngENR3/70slalKlpymTc
 btiSHEqizvziJGPYq0ajtL1OKLO7Oe1AtN2XH4OnB1NKws87/2wNPpQXb
 sbj3tFo0NQ9mSS+vx51hLXEWi4KcZdKlMiCSA8AMrUpvXPti0TQ+bjYAm U=;
IronPort-SDR: oCIv21f6url1vB/Nti8jwjJaIUjw3Miu57cr9LQF0MQkc6aQjQr0qUxkJbaGv21fvpMqYJ3CTa
 TInVcZww3BfQ==
X-IronPort-AV: E=Sophos;i="5.70,513,1574121600"; d="scan'208";a="20906578"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 04 Mar 2020 09:34:00 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 0A0B1A1E86; Wed,  4 Mar 2020 09:33:59 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 4 Mar 2020 09:33:59 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Mar 2020 09:33:58 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 4 Mar 2020 09:33:58 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] x86/cpuid: Untangle Invariant TSC handling
Thread-Index: AQHV8Yl+eNigfdZYdkK8Os7qxPFcX6g4Klyw
Date: Wed, 4 Mar 2020 09:33:58 +0000
Message-ID: <6d1760847aaf400fb4b88481f5bd2582@EX13D32EUC003.ant.amazon.com>
References: <20200303182447.15469-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200303182447.15469-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.41]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/cpuid: Untangle Invariant TSC handling
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgQW5kcmV3IENvb3Bl
cg0KPiBTZW50OiAwMyBNYXJjaCAyMDIwIDE4OjI1DQo+IFRvOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPEpCZXVs
aWNoQHN1c2UuY29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25u
w6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFU
Q0hdIHg4Ni9jcHVpZDogVW50YW5nbGUgSW52YXJpYW50IFRTQyBoYW5kbGluZw0KPiANCj4gSVRT
QyBiZWluZyB2aXNpYmxlIHRvIHRoZSBndWVzdCBpcyBjdXJyZW50bHkgaW1wbGljaXQgd2l0aCB0
aGUgdG9vbHN0YWNrDQo+IHVuY29uZGl0aW9uYWxseSBhc2tpbmcgZm9yIGl0LCBhbmQgWGVuIGNs
aXBwaW5nIGl0IGJhc2VkIG9uIHRoZSB2VFNDIGFuZC9vcg0KPiBYRU5fRE9NQ1RMX2Rpc2FibGVf
bWlncmF0ZSBzZXR0aW5ncy4NCj4gDQo+IFRoaXMgaXMgcHJvYmxlbWF0aWMgZm9yIHNldmVyYWwg
cmVhc29ucy4NCj4gDQo+IEZpcnN0LCB0aGUgaW1wbGljaXQgdlRTQyBiZWhhdmlvdXIgbWFuaWZl
c3RzIGFzIGEgcmVhbCBidWcgb24gbWlncmF0aW9uIHRvIGENCj4gaG9zdCB3aXRoIGEgZGlmZmVy
ZW50IGZyZXF1ZW5jeSwgd2l0aCBJVFNDIGJ1dCB3aXRob3V0IFRTQyBzY2FsaW5nDQo+IGNhcGFi
aWxpdGllcywgd2hlcmVieSB0aGUgSVRTQyBmZWF0dXJlIGJlY29tZXMgYWR2ZXJ0aXNlZCB0byB0
aGUgZ3Vlc3QuICBJVFNDDQo+IHdpbGwgZGlzYXBwZWFyIGFnYWluIGlmIHRoZSBndWVzdCBtaWdy
YXRlcyB0byBzZXJ2ZXIgd2l0aCB0aGUgc2FtZSBmcmVxdWVuY3kNCj4gYXMgdGhlIG9yaWdpbmFs
LCBvciB0byBvbmUgd2l0aCBUU0Mgc2NhbGluZyBzdXBwb3J0Lg0KPiANCj4gU2Vjb25kbHksIGRp
c2FsbG93aW5nIElUU0MgdW5sZXNzIHRoZSBndWVzdCBkb2Vzbid0IG1pZ3JhdGUgaXMgY29uY2Vw
dHVhbGx5DQo+IHdyb25nLiAgSXQgaXMgY29tbW9uIHRvIGhhdmUgbWlncmF0aW9uIHBvb2xzIG9m
IGlkZW50aWNhbCBoYXJkd2FyZSwgYXQgd2hpY2gNCj4gcG9pbnQgdGhlIFRTQyBmcmVxdWVuY3kg
aXMgdGhlIHNhbWUsIGFuZCBtb3JlIG1vZGVybiBoYXJkd2FyZSBoYXMgVFNDIHNjYWxpbmcNCj4g
c3VwcG9ydCBhbnl3YXkuICBJbiBib3RoIGNhc2VzLCBpdCBpcyBzYWZlIHRvIGFkdmVydGlzZSBJ
VFNDIGFuZCBtaWdyYXRlIHRoZQ0KPiBndWVzdC4NCj4gDQo+IFJlbW92ZSBhbGwgaW1wbGljaXQg
bG9naWMgbG9naWMgaW4gWGVuLCBhbmQgbWFrZSBJVFNDIHBhcnQgb2YgdGhlIG1heCBDUFVJRA0K
DQpPbmUgdG9vIG1hbnkgJ2xvZ2ljJ3MgdGhlcmUuDQoNCj4gcG9saWNpZXMgZm9yIGd1ZXN0cy4g
IFBsdW1iIGFuIGl0c2MgcGFyYW1ldGVyIGludG8geGNfY3B1aWRfYXBwbHlfcG9saWN5KCkgYW5k
DQo+IGhhdmUgbGlieGxfX2NwdWlkX2xlZ2FjeSgpIGZpbGwgaW4gdGhlIHR3byBjYXNlcyB3aGVy
ZSBpdCBjYW4gcmVhc29uYWJseQ0KPiBleHBlY3QgSVRTQyB0byBiZSBzYWZlIGZvciB0aGUgZ3Vl
c3QgdG8gc2VlLg0KPiANCj4gVGhpcyBpcyBhIGJlaGF2aW91ciBjaGFuZ2UgZm9yIFRTQ19NT0RF
X05BVElWRSwgd2hlcmUgdGhlIElUU0Mgd2lsbCBub3cNCj4gcmVsaWFibHkgbm90IGFwcGVhciwg
YW5kIGZvciB0aGUgY2FzZSB3aGVyZSB0aGUgdXNlciBleHBsaWNpdGx5IHJlcXVlc3RzIElUU0Ms
DQo+IGluIHdoaWNoIGNhc2UgaXQgd2lsbCBhcHBlYXIgZXZlbiBpZiB0aGUgZ3Vlc3QgaXNuJ3Qg
bWFya2VkIGFzIG5vbWlncmF0ZS4NCj4gDQoNCkRvZXMgdGhpcyBtZWFuIGEgZ3Vlc3QgdGhhdCB3
b3VsZCBoYXZlIHNlZW4gSVRTQyBvbiA0LjEzIG1heSBub3cgbm8gbG9uZ2VyIHNlZSBpdCBpbiA0
LjE0IG9yIGlzIHRoZSBUU0NfTU9ERV9OQVRJVkUgY2FzZSBqdXN0IHRoZSBvbmUgd2hlcmUgdGhl
IGZlYXR1cmUgbWF5IGVycm9uZW91c2x5IGFwcGVhciBhZnRlciBtaWdyYXRpb24/DQoNCiAgUGF1
bA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
