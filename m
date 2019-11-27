Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5408610B27F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:35:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzJ6-0000aH-MX; Wed, 27 Nov 2019 15:32:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J2FP=ZT=amazon.com=prvs=227ebe4de=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZzJ4-0000a4-Ff
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:32:42 +0000
X-Inumbo-ID: 268bdc44-112b-11ea-83b8-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 268bdc44-112b-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 15:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574868763; x=1606404763;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VLEXgFMjYbVt1Krwggjjvwz0OyxHcnWovkBPHikUkkc=;
 b=kbyVekpJY9vvAuztCltbpPt9wrIW1vX74tnSwQ7c+MFnKv57jERuMoAd
 dSwO4/ZCJx1o8WeNy6rP/NxU5aqE59gL72FVAtD7/UR5M5hJp9ABGCWLU
 lRj4gUH1Nx6/AGBSymWHNHgD7rINyDmmdA0PI++PivOX3mkkEvbMM0CMP E=;
IronPort-SDR: +GiTPnrHQcv/zkWIHzJJGTLqtCR4GaeU7TVUrucsqf3tFUqilptjfl/rKWdpUuvWKxAGwPcf+6
 YVkNhTTGwYgg==
X-IronPort-AV: E=Sophos;i="5.69,249,1571702400"; 
   d="scan'208";a="1827541"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 27 Nov 2019 15:32:31 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 85F0DA22D5; Wed, 27 Nov 2019 15:32:28 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 15:32:27 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 15:32:27 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 27 Nov 2019 15:32:26 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH] x86 / iommu: set up a scratch page in the
 quarantine domain
Thread-Index: AQHVn5tNaK/V9YZGKk+zattii3WhUKebk5SAgAOXSpCAAAPhAIAAAahQ
Date: Wed, 27 Nov 2019 15:32:26 +0000
Message-ID: <ecb8709ff99c494588996e20d665731b@EX13D32EUC003.ant.amazon.com>
References: <20191120120859.1846-1-pdurrant@amazon.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D60E9FD@SHSMSX104.ccr.corp.intel.com>
 <01af44ec07cf464cba555114555ed75f@EX13D32EUC003.ant.amazon.com>
 <c65ea5d0-5017-2cce-6e54-5ff4e3d40401@suse.com>
In-Reply-To: <c65ea5d0-5017-2cce-6e54-5ff4e3d40401@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86 / iommu: set up a scratch page in the
 quarantine domain
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
 Kevin Tian <kevin.tian@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI3IE5vdmVtYmVyIDIwMTkgMTU6MjYNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kNCj4g
PHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDog
UmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0geDg2IC8gaW9tbXU6IHNldCB1cCBhIHNjcmF0Y2ggcGFn
ZSBpbiB0aGUNCj4gcXVhcmFudGluZSBkb21haW4NCj4gDQo+IE9uIDI3LjExLjIwMTkgMTY6MTgs
ICBEdXJyYW50LCBQYXVsICB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4gRnJvbTogVGlhbiwgS2V2aW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPiA+PiBTZW50
OiAyNSBOb3ZlbWJlciAyMDE5IDA4OjIyDQo+ID4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFu
dEBhbWF6b24uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IENjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+ID4+IDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBN
b25uw6kNCj4gPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+PiBTdWJqZWN0OiBSRTogW1BB
VENIXSB4ODYgLyBpb21tdTogc2V0IHVwIGEgc2NyYXRjaCBwYWdlIGluIHRoZQ0KPiBxdWFyYW50
aW5lDQo+ID4+IGRvbWFpbg0KPiA+Pg0KPiA+Pj4gRnJvbTogUGF1bCBEdXJyYW50IFttYWlsdG86
cGR1cnJhbnRAYW1hem9uLmNvbV0NCj4gPj4+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMjAs
IDIwMTkgODowOSBQTQ0KPiA+Pj4NCj4gPj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBp
b21tdV9vcCB0byBmYWNpbGl0YXRlIGEgcGVyLQ0KPiBpbXBsZW1lbnRhdGlvbg0KPiA+Pj4gcXVh
cmFudGluZSBzZXQgdXAsIGFuZCB0aGVuIGZ1cnRoZXIgY29kZSBmb3IgeDg2IGltcGxlbWVudGF0
aW9ucw0KPiA+Pj4gKGFtZCBhbmQgdnRkKSB0byBzZXQgdXAgYSByZWFkL3dyb3RlIHNjcmF0Y2gg
cGFnZSB0byBzZXJ2ZSBhcyB0aGUNCj4gPj4gc291cmNlLw0KPiA+Pj4gdGFyZ2V0IGZvciBhbGwg
RE1BIHdoaWxzdCBhIGRldmljZSBpcyBhc3NpZ25lZCB0byBkb21faW8uDQo+ID4+Pg0KPiA+Pj4g
VGhlIHJlYXNvbiBmb3IgZG9pbmcgdGhpcyBpcyB0aGF0IHNvbWUgaGFyZHdhcmUgbWF5IGNvbnRp
bnVlIHRvIHJlLXRyeQ0KPiA+Pj4gRE1BLCBkZXNwaXRlIEZMUiwgaW4gdGhlIGV2ZW50IG9mIGFu
IGVycm9yLiBIYXZpbmcgYSBzY3JhdGNoIHBhZ2UNCj4gbWFwcGVkDQo+ID4+PiB3aWxsIGFsbG93
IHBlbmRpbmcgRE1BIHRvIGRyYWluIGFuZCB0aHVzIHF1aWVzY2Ugc3VjaCBidWdneSBoYXJkd2Fy
ZS4NCj4gPj4NCj4gPj4gdGhlbiB0aGVyZSBpcyBubyBkaWFnbm9zdGljcyBhdCBhbGwgc2luY2Ug
YWxsIGZhdWx0cyBhcmUgcXVpZXNjZW50DQo+IG5vdy4uLg0KPiA+PiB3aHkgZG8gd2Ugd2FudCB0
byBzdXBwb3J0IHN1Y2ggYnVnZ3kgaGFyZHdhcmU/IElzIGl0IGJldHRlciB0byBtYWtlDQo+ID4+
IGl0IGFuIGRlZmF1bHQtb2ZmIG9wdGlvbiBzaW5jZSBidWdneSBpcyBzdXBwb3NlZCB0byBuaWNo
ZSBjYXNlPw0KPiA+DQo+ID4gSSBndWVzcyBpdCBjb3VsZCBiZSBhIGNvbW1hbmQgbGluZSBvcHRp
b24uLi4gcGVyaGFwcyBtYWtpbmcgdGhlIG5ldw0KPiA+ICdpb21tdT1xdWFyYW50aW5lJyBib29s
ZWFuIGludG8gc29tZXRoaW5nIG1vcmUgY29tcGxleCwgYnV0IEknbSBub3QNCj4gPiBzdXJlIGl0
J3MgcmVhbGx5IHdvcnRoIGl0LiBQZXJoYXBzIGEgY29tcGlsZSB0aW1lIG9wdGlvbiB3b3VsZCBi
ZQ0KPiA+IGJldHRlcj8NCj4gDQo+IFlldCBhbm90aGVyIG9wdGlvbjogSG93IGFib3V0IGluc3Rh
bGxpbmcgdGhlIHNjcmF0Y2ggcGFnZSBtYXBwaW5ncw0KPiBvbmx5IGFmdGVyIGEgKGhhbmRmdWwg
b2YpIElPTU1VIGZhdWx0cz8gQnV0IG9mIGNvdXJzZSB0aGVyZSB3YXMgdGhlDQo+IHJlbGF0ZWQg
ZWFybGllciBxdWVzdGlvbiBvZiB3aGV0aGVyIGluZGVlZCBvdXIgdHVybmluZyBvZmYgb2YgYnVz
DQo+IG1hc3RlcmluZyBkb2Vzbid0IGFscmVhZHkgaGVscCBzaWxlbmNpbmcgdGhlIGZhdWx0cy4N
Cg0KTm8uIFVuZm9ydHVuYXRlbHkgdGhlIGgvdyBoYXMgemVybyB0b2xlcmFuY2UgZm9yIHNvbWUg
ZmF1bHRzLg0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
