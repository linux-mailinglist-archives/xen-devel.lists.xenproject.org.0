Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFFB11836A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 10:19:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iebdX-0000qU-Vn; Tue, 10 Dec 2019 09:16:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ERUJ=2A=amazon.com=prvs=2402c4381=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iebdW-0000qP-9J
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 09:16:54 +0000
X-Inumbo-ID: ce51dfda-1b2d-11ea-a914-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce51dfda-1b2d-11ea-a914-bc764e2007e4;
 Tue, 10 Dec 2019 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575969414; x=1607505414;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BTDNpe/c1SQYKiA5jBPDXA/ic0EE+yuDCJHM0gAgVAg=;
 b=oL56ttZFWV6CG5b9XxZ6a93ZlrIBOf5Y41saiQh6mlj7aCkC1QiJoRVC
 ucAf+8Dyg3ZzZ/GX8UiCbE0aQxPjUwDf9uUbCfyh3tnTFi3vq/bSDNP0w
 EsAWxHGmNVyqKsnT85KfllSFlbr+c1Ogi8AjrtLlnVVwXVW2r0IJfO4MQ Q=;
IronPort-SDR: LZVT66FpM6W7fvrkv4xKF1d6sbLce5W5eYLDVtZMAVOWPFgZ6xHYd02JTxTYvpHnhJTMmu1h9Q
 LJIyyQCcd+Kw==
X-IronPort-AV: E=Sophos;i="5.69,299,1571702400"; 
   d="scan'208";a="6948071"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 10 Dec 2019 09:16:53 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3832F240C50; Tue, 10 Dec 2019 09:16:51 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 09:16:50 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 09:16:49 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 10 Dec 2019 09:16:49 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [PATCH v2] x86 / iommu: set up a scratch page in the quarantine
 domain
Thread-Index: AQHVpUXA1ULHbXj+nkCH3fM7MDEQOaegcCkAgAAEYACAB7skgIAK2UEAgAANwYCAAAHeAIAADJ2AgAACsgCAAAIWEA==
Date: Tue, 10 Dec 2019 09:16:49 +0000
Message-ID: <3ec8e7be074d4846bef0104e5dacb653@EX13D32EUC003.ant.amazon.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
 <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
 <dbd61cfe-797a-3d8e-1fae-1412c7204842@suse.com>
 <4cf200a6-cccb-0bca-f2cb-b9f80956ae33@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D636C7C@SHSMSX104.ccr.corp.intel.com>
 <b6bae4cd-129c-6815-1331-00bca8acb4ae@suse.com>
 <920f4319-ed07-687c-a569-ab20faeda2a8@suse.com>
 <72311af3-e47a-c868-fa47-89a74b043a4c@suse.com>
 <5ac457ca-46cf-5de3-8bfa-92a754f298fd@suse.com>
In-Reply-To: <5ac457ca-46cf-5de3-8bfa-92a754f298fd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86 / iommu: set up a scratch page in
 the quarantine domain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Tian,
 Kevin" <kevin.tian@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDEwIERlY2VtYmVyIDIwMTkgMDk6MDcNCj4gVG86IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IFRpYW4sIEtldmluIDxrZXZpbi50aWFu
QGludGVsLmNvbT47IER1cnJhbnQsIFBhdWwNCj4gPHBkdXJyYW50QGFtYXpvbi5jb20+OyBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZzsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSB4ODYg
LyBpb21tdTogc2V0IHVwIGEgc2NyYXRjaCBwYWdlIGluIHRoZQ0KPiBxdWFyYW50aW5lIGRvbWFp
bg0KPiANCj4gT24gMTAuMTIuMTkgMDk6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDEw
LjEyLjIwMTkgMDk6MTIsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+ID4+IE9uIDEwLjEyLjE5IDA5
OjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+IE9uIDEwLjEyLjIwMTkgMDg6MTYsIFRpYW4s
IEtldmluIHdyb3RlOg0KPiA+Pj4+IFdoaWxlIHRoZSBxdWFyYW50aW5lIGlkZWEgc291bmRzIGdv
b2Qgb3ZlcmFsbCwgSSdtIHN0aWxsIG5vdA0KPiBjb252aW5jZWQNCj4gPj4+PiB0byBoYXZlIGl0
IHRoZSBvbmx5IHdheSBpbiBwbGFjZSBqdXN0IGZvciBoYW5kbGluZyBzb21lIGtub3duLWJ1Z2d5
DQo+ID4+Pj4gZGV2aWNlLiBJdCBraWxscyB0aGUgcG9zc2liaWxpdHkgb2YgaWRlbnRpZnlpbmcg
YSBuZXcgYnVnZ3kgZGV2aWNlDQo+IGFuZCB0aGVuDQo+ID4+Pj4gZGVjaWRpbmcgbm90IHRvIHVz
ZSBpdCBpbiB0aGUgZmlyc3Qgc3BhY2UuLi4gSSB0aG91Z2h0IGFib3V0IHdoZXRoZXINCj4gaXQN
Cj4gPj4+PiB3aWxsIGdldCBiZXR0ZXIgd2hlbiBmdXR1cmUgSU9NTVUgaW1wbGVtZW50cyBBL0Qg
Yml0IC0gYnkgY2hlY2tpbmcNCj4gPj4+PiBhY2Nlc3MgYml0IGJlaW5nIHNldCB0aGVuIHdlJ2xs
IGtub3cgc29tZSBidWdneSBkZXZpY2UgZXhpc3RzLCBidXQsDQo+ID4+Pj4gdGhlIHNjcmF0Y2gg
cGFnZSBpcyBzaGFyZWQgYnkgYWxsIGRldmljZXMgdGhlbiB3ZSBjYW5ub3QgcmVseSBvbiB0aGlz
DQo+ID4+Pj4gZmVhdHVyZSB0byBmaW5kIG91dCB0aGUgYWN0dWFsIGJ1Z2d5IG9uZS4NCj4gPj4+
DQo+ID4+PiBUaGlua2luZyBhYm91dCBpdCAtIHllcywgSSB0aGluayBJIGFncmVlLiBUaGlzIChh
cyB3aXRoIHNvIG1hbnkNCj4gPj4+IHdvcmthcm91bmRzKSB3b3VsZCBiZXR0ZXIgYmUgYW4gb2Zm
LWJ5LWRlZmF1bHQgb25lLiBUaGUgbWFpbiBpc3N1ZQ0KPiA+Pj4gSSB1bmRlcnN0YW5kIHRoaXMg
d291bGQgaGF2ZSBpcyB0aGF0IGJ1Z2d5IHN5c3RlbXMgdGhlbiBtaWdodCBoYW5nDQo+ID4+PiB3
aXRob3V0IGV2ZW4gaGF2aW5nIG1hbmFnZWQgdG8gZ2V0IGEgbG9nIG1lc3NhZ2Ugb3V0IC0gUGF1
bD8NCj4gPj4+DQo+ID4+PiBKw7xyZ2VuIC0gd291bGQgeW91IGJlIGFtZW5hYmxlIHRvIGFuIGFs
bW9zdCBsYXN0IG1pbnV0ZSByZWZpbmVtZW50DQo+ID4+PiBoZXJlICh3b3VsZCB0aGVuIGFsc28g
bmVlZCB0byBzdGlsbCBiZSBiYWNrcG9ydGVkIHRvIDQuMTIuMiwgb3INCj4gPj4+IHRoZSBvcmln
aW5hbCBiYWNrcG9ydCByZXZlcnRlZCwgdG8gYXZvaWQgZ2l2aW5nIHRoZSBpbXByZXNzaW9uIG9m
DQo+ID4+PiBhIHJlZ3Jlc3Npb24pPw0KPiA+Pg0KPiA+PiBTbyB3aGF0IGlzIHlvdXIgc3VnZ2Vz
dGlvbiBoZXJlPyBUbyBoYXZlIGEgYm9vdCBvcHRpb24gKGRlZmF1bHRpbmcgdG8NCj4gPj4gb2Zm
KSBmb3IgZW5hYmxpbmcgdGhlIHNjcmF0Y2ggcGFnZT8NCj4gPg0KPiA+IFllcyAoYW5kIGRlc3Bp
dGUgaGF2aW5nIHNlZW4gUGF1bCdzIHJlcGx5KS4NCj4gDQo+IEknZCByZWxlYXNlIGFjayBzdWNo
IGEgcGF0Y2ggaW4gY2FzZSB5b3UgY29tZSB0byBhbiBhZ3JlZW1lbnQgcmVnYXJkaW5nDQo+IHRo
ZSBkZWZhdWx0IHNvb24uDQo+IA0KDQpPay4gVGhlIGRlZmF1bHQgaXMgbm90IHRoYXQgY3J1Y2lh
bC4gUGVyaGFwcyBpdCdzIGp1c3QgbWUgd2hvIHRoaW5rcyBkZWZhdWx0cyBzaG91bGQgYmUgY2hv
c2VuIG9uIHRoZSBiYXNpcyBvZiBiZWluZyBtb3N0IGxpa2VseSB0byByZXN1bHQgaW4gYSB3b3Jr
aW5nIHN5c3RlbS4NCg0KICBQYXVsDQoNCj4gDQo+IEp1ZXJnZW4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
