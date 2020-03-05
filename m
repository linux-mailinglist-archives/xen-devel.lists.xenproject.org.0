Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8905317A1D3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 10:03:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9mMj-0003uV-Qm; Thu, 05 Mar 2020 09:00:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P6JL=4W=amazon.co.uk=prvs=326373da0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9mMi-0003uQ-Jm
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 09:00:24 +0000
X-Inumbo-ID: bff672f4-5ebf-11ea-8eb5-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bff672f4-5ebf-11ea-8eb5-bc764e2007e4;
 Thu, 05 Mar 2020 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583398824; x=1614934824;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=gA2AONsVY7yG9ZzP2MilaBz2KdVevIaXrq0ba1D5pig=;
 b=SZ+B/Od7lSsjoRagKFXYIgr0yyP+ZMciNxHz6P+t3upAY4RI1w1nsQkO
 SBZeX2V1GQ9XCsAiA1F9vIDstu9wT2G5QwPl+24LLKxnPpqTJFX442XO8
 rvJSANsnS0+H6kLnN/jLJwg/MZZCUU20GCFBunAp0sBM21b+4+a3n4Mr/ I=;
IronPort-SDR: s1aZ36P8XpUWQoGaRSg7Z+y2m/y0tZsF4dRucVCDsX8VAAdc3TH9X0jHOT9HMWiNNgQpO7lK1J
 IsKeb7XUMNIA==
X-IronPort-AV: E=Sophos;i="5.70,517,1574121600"; d="scan'208";a="21129067"
Thread-Topic: [Xen-devel] [PATCH] x86/cpuid: Untangle Invariant TSC handling
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 05 Mar 2020 09:00:12 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id B1E3DA21B9; Thu,  5 Mar 2020 09:00:09 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 5 Mar 2020 09:00:09 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Mar 2020 09:00:08 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 5 Mar 2020 09:00:07 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHV8Yl+eNigfdZYdkK8Os7qxPFcX6g4KlywgACH9gCAAQM/YA==
Date: Thu, 5 Mar 2020 09:00:07 +0000
Message-ID: <f6df20383b0a448f8ac3339a0a30ec87@EX13D32EUC003.ant.amazon.com>
References: <20200303182447.15469-1-andrew.cooper3@citrix.com>
 <6d1760847aaf400fb4b88481f5bd2582@EX13D32EUC003.ant.amazon.com>
 <c387de19-b521-1ff8-64c7-9d46f315b0e8@citrix.com>
In-Reply-To: <c387de19-b521-1ff8-64c7-9d46f315b0e8@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.216]
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAwNCBNYXJjaCAyMDIwIDE3OjMxDQo+IFRv
OiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBYZW4tZGV2ZWwgPHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT47DQo+IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29t
PjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJF
OiBbRVhURVJOQUxdW1hlbi1kZXZlbF0gW1BBVENIXSB4ODYvY3B1aWQ6IFVudGFuZ2xlIEludmFy
aWFudCBUU0MgaGFuZGxpbmcNCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBm
cm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBr
bm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IE9uIDA0LzAzLzIwMjAgMDk6
MzMsIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVj
dC5vcmc+IE9uIEJlaGFsZiBPZiBBbmRyZXcgQ29vcGVyDQo+ID4+IFNlbnQ6IDAzIE1hcmNoIDIw
MjAgMTg6MjUNCj4gPj4gVG86IFhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnPg0KPiA+PiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz47IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBKYW4gQmV1bGljaA0KPiA8SkJldWxpY2hAc3VzZS5jb20+
Ow0KPiA+PiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IElhbiBK
YWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA+PiA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSF0g
eDg2L2NwdWlkOiBVbnRhbmdsZSBJbnZhcmlhbnQgVFNDIGhhbmRsaW5nDQo+ID4+DQo+ID4+IElU
U0MgYmVpbmcgdmlzaWJsZSB0byB0aGUgZ3Vlc3QgaXMgY3VycmVudGx5IGltcGxpY2l0IHdpdGgg
dGhlIHRvb2xzdGFjaw0KPiA+PiB1bmNvbmRpdGlvbmFsbHkgYXNraW5nIGZvciBpdCwgYW5kIFhl
biBjbGlwcGluZyBpdCBiYXNlZCBvbiB0aGUgdlRTQyBhbmQvb3INCj4gPj4gWEVOX0RPTUNUTF9k
aXNhYmxlX21pZ3JhdGUgc2V0dGluZ3MuDQo+ID4+DQo+ID4+IFRoaXMgaXMgcHJvYmxlbWF0aWMg
Zm9yIHNldmVyYWwgcmVhc29ucy4NCj4gPj4NCj4gPj4gRmlyc3QsIHRoZSBpbXBsaWNpdCB2VFND
IGJlaGF2aW91ciBtYW5pZmVzdHMgYXMgYSByZWFsIGJ1ZyBvbiBtaWdyYXRpb24gdG8gYQ0KPiA+
PiBob3N0IHdpdGggYSBkaWZmZXJlbnQgZnJlcXVlbmN5LCB3aXRoIElUU0MgYnV0IHdpdGhvdXQg
VFNDIHNjYWxpbmcNCj4gPj4gY2FwYWJpbGl0aWVzLCB3aGVyZWJ5IHRoZSBJVFNDIGZlYXR1cmUg
YmVjb21lcyBhZHZlcnRpc2VkIHRvIHRoZSBndWVzdC4gIElUU0MNCj4gPj4gd2lsbCBkaXNhcHBl
YXIgYWdhaW4gaWYgdGhlIGd1ZXN0IG1pZ3JhdGVzIHRvIHNlcnZlciB3aXRoIHRoZSBzYW1lIGZy
ZXF1ZW5jeQ0KPiA+PiBhcyB0aGUgb3JpZ2luYWwsIG9yIHRvIG9uZSB3aXRoIFRTQyBzY2FsaW5n
IHN1cHBvcnQuDQo+ID4+DQo+ID4+IFNlY29uZGx5LCBkaXNhbGxvd2luZyBJVFNDIHVubGVzcyB0
aGUgZ3Vlc3QgZG9lc24ndCBtaWdyYXRlIGlzIGNvbmNlcHR1YWxseQ0KPiA+PiB3cm9uZy4gIEl0
IGlzIGNvbW1vbiB0byBoYXZlIG1pZ3JhdGlvbiBwb29scyBvZiBpZGVudGljYWwgaGFyZHdhcmUs
IGF0IHdoaWNoDQo+ID4+IHBvaW50IHRoZSBUU0MgZnJlcXVlbmN5IGlzIHRoZSBzYW1lLCBhbmQg
bW9yZSBtb2Rlcm4gaGFyZHdhcmUgaGFzIFRTQyBzY2FsaW5nDQo+ID4+IHN1cHBvcnQgYW55d2F5
LiAgSW4gYm90aCBjYXNlcywgaXQgaXMgc2FmZSB0byBhZHZlcnRpc2UgSVRTQyBhbmQgbWlncmF0
ZSB0aGUNCj4gPj4gZ3Vlc3QuDQo+ID4+DQo+ID4+IFJlbW92ZSBhbGwgaW1wbGljaXQgbG9naWMg
bG9naWMgaW4gWGVuLCBhbmQgbWFrZSBJVFNDIHBhcnQgb2YgdGhlIG1heCBDUFVJRA0KPiA+IE9u
ZSB0b28gbWFueSAnbG9naWMncyB0aGVyZS4NCj4gDQo+IE9vcHMuDQo+IA0KPiA+DQo+ID4+IHBv
bGljaWVzIGZvciBndWVzdHMuICBQbHVtYiBhbiBpdHNjIHBhcmFtZXRlciBpbnRvIHhjX2NwdWlk
X2FwcGx5X3BvbGljeSgpIGFuZA0KPiA+PiBoYXZlIGxpYnhsX19jcHVpZF9sZWdhY3koKSBmaWxs
IGluIHRoZSB0d28gY2FzZXMgd2hlcmUgaXQgY2FuIHJlYXNvbmFibHkNCj4gPj4gZXhwZWN0IElU
U0MgdG8gYmUgc2FmZSBmb3IgdGhlIGd1ZXN0IHRvIHNlZS4NCj4gPj4NCj4gPj4gVGhpcyBpcyBh
IGJlaGF2aW91ciBjaGFuZ2UgZm9yIFRTQ19NT0RFX05BVElWRSwgd2hlcmUgdGhlIElUU0Mgd2ls
bCBub3cNCj4gPj4gcmVsaWFibHkgbm90IGFwcGVhciwgYW5kIGZvciB0aGUgY2FzZSB3aGVyZSB0
aGUgdXNlciBleHBsaWNpdGx5IHJlcXVlc3RzIElUU0MsDQo+ID4+IGluIHdoaWNoIGNhc2UgaXQg
d2lsbCBhcHBlYXIgZXZlbiBpZiB0aGUgZ3Vlc3QgaXNuJ3QgbWFya2VkIGFzIG5vbWlncmF0ZS4N
Cj4gPj4NCj4gPiBEb2VzIHRoaXMgbWVhbiBhIGd1ZXN0IHRoYXQgd291bGQgaGF2ZSBzZWVuIElU
U0Mgb24gNC4xMyBtYXkgbm93IG5vIGxvbmdlciBzZWUgaXQgaW4gNC4xNCBvciBpcyB0aGUNCj4g
VFNDX01PREVfTkFUSVZFIGNhc2UganVzdCB0aGUgb25lIHdoZXJlIHRoZSBmZWF0dXJlIG1heSBl
cnJvbmVvdXNseSBhcHBlYXIgYWZ0ZXIgbWlncmF0aW9uPw0KPiANCj4gSW4gZ2VuZXJhbCwgZ3Vl
c3RzIGRvbid0IGdldCB0byBzZWUgSVRTQyBhdCBhbGwsIGV2ZW4gYmVmb3JlIHRoaXMNCj4gY2hh
bmdlLiAgVGhpcyBpcyBzb21ldGhpbmcgd2hpY2ggbmVlZHMgd29ya2luZyBvbiwgYnV0IGl0IGlz
IG9ubHkgYQ0KPiB0cmFjdGFibGUgcHJvYmxlbSBpbiBhIG11bHRpLWhvc3QgdG9vbHN0YWNrLg0K
PiANCj4gQWZ0ZXIgdGhpcyBjaGFuZ2UsIHRoZSBUU0NfTU9ERV9OQVRJVkUgY2FzZSB3aWxsIG5v
dyBub3Qgc2VlIGENCj4gbWV0YXN0YWJsZSBJVFNDIGZlYXR1cmUgZGVwZW5kaW5nIG9uIHRoZSBw
cm9wZXJ0aWVzIG9mIHRoZSBob3N0IGl0DQo+IGhhcHBlbnMgdG8gYmUgb24uICBJdCB3aWxsIGRl
ZmF1bHQgdG8gY29uc2lzdGVudGx5IDAsIHVubGVzcyBvdmVycmlkZGVuDQo+IGJ5IHRoZSB0b29s
c3RhY2suDQoNCk9rLCBhcyBsb25nIGd1ZXN0cyBydW5uaW5nIG9uIGFuIG9sZGVyIFhlbiB3b24n
dCBzZWUgYSBzdGFibGUgSVRTQyBkaXNhcHBlYXIgd2hlbiBtb3ZlZCB0byBhIG5ld2VyIFhlbiB0
aGVuIHRoZXJlIHNob3VsZCBiZSBubyBwcm9ibGVtIGhlcmUuDQoNCiAgUGF1bA0KDQo+IA0KPiB+
QW5kcmV3DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
