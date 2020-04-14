Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BBD1A7741
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:23:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOHmP-0008A8-Nz; Tue, 14 Apr 2020 09:22:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kDu3=56=amazon.com=prvs=3660aa63e=havanur@srs-us1.protection.inumbo.net>)
 id 1jOHmN-0008A3-EF
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:22:51 +0000
X-Inumbo-ID: 82dd12e2-7e31-11ea-83d8-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82dd12e2-7e31-11ea-83d8-bc764e2007e4;
 Tue, 14 Apr 2020 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1586856171; x=1618392171;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version:subject;
 bh=H1GOZ8xZE3NUKAUCMdpLkqZslpbo9j2EfSqjeLu3rz0=;
 b=FwJBTNVcqKp+tO25aXvl423wLGmVrMlkCRzzmAaiwZV4ITAGyIt835B0
 aEeaSgfvjXh9mpSUXNceZX2d0jM+bbEPKjRjeewXICvxVUhajpRGxaQQk
 r/q9ARNP4PSCYZ5M73kRdIr+TMuIHVAXj4F8H/tPE2mtSyamSKQ5Ra3c6 I=;
IronPort-SDR: gcIXGVMqVOalY0RTCHBMQkng+3JB3GGPfaXGE1oDKKRuCiXzn2Me85Z3sBU5Qd2kDw7hT2dXpX
 MI52EWfoGNDA==
X-IronPort-AV: E=Sophos;i="5.72,382,1580774400"; d="scan'208";a="38328242"
Subject: Re: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Thread-Topic: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Apr 2020 09:22:48 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2FCEDA225A; Tue, 14 Apr 2020 09:22:48 +0000 (UTC)
Received: from EX13D36EUC002.ant.amazon.com (10.43.164.99) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 14 Apr 2020 09:22:48 +0000
Received: from EX13D36EUC004.ant.amazon.com (10.43.164.126) by
 EX13D36EUC002.ant.amazon.com (10.43.164.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 14 Apr 2020 09:22:46 +0000
Received: from EX13D36EUC004.ant.amazon.com ([10.43.164.126]) by
 EX13D36EUC004.ant.amazon.com ([10.43.164.126]) with mapi id 15.00.1497.006;
 Tue, 14 Apr 2020 09:22:46 +0000
From: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Index: AQHWEdtGZKnSIpkNZ0SB6/WfFUNDKah4PMkAgAAVt4CAAAPkAIAAAmkA
Date: Tue, 14 Apr 2020 09:22:46 +0000
Message-ID: <a102ec836a00714678fb3aa46787f597c9044f29.camel@amazon.com>
References: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
 <c7882dcb-9708-414c-98fb-0a0283db0f34@suse.com>
 <612892f2fed5cb02cbec289589e437d9badb8cc1.camel@amazon.com>
 <6e3732e8-01d0-e9de-e89a-cd1b5833e5a1@suse.com>
In-Reply-To: <6e3732e8-01d0-e9de-e89a-cd1b5833e5a1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.83]
Content-Type: text/plain; charset="utf-8"
Content-ID: <67A9608AD4CF9542A76183ADE319FC0A@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
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
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDIwLTA0LTE0IGF0IDExOjE0ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbw0KPiBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXINCj4gYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZS4NCj4gDQo+IA0KPiANCj4gT24gMTQuMDQuMjAyMCAxMTowMCwgU2hhbXN1bmRhcmEgSGF2YW51
ciwgSGFyc2hhIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyMC0wNC0xNCBhdCAwOTo0MiArMDIwMCwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gPiBPbiAxMy4wNC4yMDIwIDIzOjMzLCBIYXJzaGEgU2hh
bXN1bmRhcmEgSGF2YW51ciB3cm90ZToNCj4gPiA+ID4gQEAgLTI4OSw5ICsyOTMsMjIgQEAgdm9p
ZCBwY2lfc2V0dXAodm9pZCkNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICBkZXZmbj4+Mywg
ZGV2Zm4mNywgJ0EnK3Bpbi0xLCBpc2FfaXJxKTsNCj4gPiA+ID4gICAgICAgICAgfQ0KPiA+ID4g
PiANCj4gPiA+ID4gLSAgICAgICAgLyogRW5hYmxlIGJ1cyBtYXN0ZXJpbmcuICovDQo+ID4gPiA+
ICsgICAgICAgIC8qDQo+ID4gPiA+ICsgICAgICAgICAqIERpc2FibGUgYnVzIG1hc3RlcmluZywg
bWVtb3J5IGFuZCBJL08gc3BhY2UsIHdoaWNoDQo+ID4gPiA+IGlzDQo+ID4gPiA+IHR5cGljYWwg
ZGV2aWNlDQo+ID4gPiA+ICsgICAgICAgICAqIHJlc2V0IHN0YXRlLiBJdCBpcyByZWNvbW1lbmRl
ZCB0aGF0IEJBUiBwcm9ncmFtbWluZw0KPiA+ID4gPiBiZQ0KPiA+ID4gPiBkb25lIHdoaWxzdA0K
PiA+ID4gPiArICAgICAgICAgKiBkZWNvZGUgYml0cyBhcmUgY2xlYXJlZCB0byBhdm9pZCBpbmNv
cnJlY3QgbWFwcGluZ3MNCj4gPiA+ID4gYmVpbmcgY3JlYXRlZCwNCj4gPiA+ID4gKyAgICAgICAg
ICogd2hlbiA2NC1iaXQgbWVtb3J5IEJBUiBpcyBwcm9ncmFtbWVkIGZpcnN0IGJ5DQo+ID4gPiA+
IHdyaXRpbmcNCj4gPiA+ID4gdGhlIGxvd2VyIGhhbGYNCj4gPiA+ID4gKyAgICAgICAgICogYW5k
IHRoZW4gdGhlIHVwcGVyIGhhbGYsIHdoaWNoIGZpcnN0IG1hcHMgdG8gYW4NCj4gPiA+ID4gYWRk
cmVzcw0KPiA+ID4gPiB1bmRlciA0Rw0KPiA+ID4gPiArICAgICAgICAgKiByZXBsYWNpbmcgYW55
IFJBTSBtYXBwZWQgaW4gdGhhdCBhZGRyZXNzLCB3aGljaCBpcw0KPiA+ID4gPiBub3QNCj4gPiA+
ID4gcmVzdG9yZWQNCj4gPiA+ID4gKyAgICAgICAgICogYmFjayBhZnRlciB0aGUgdXBwZXIgaGFs
ZiBpcyB3cml0dGVuIGFuZCBQQ0kgbWVtb3J5DQo+ID4gPiA+IGlzDQo+ID4gPiA+IGNvcnJlY3Rs
eQ0KPiA+ID4gPiArICAgICAgICAgKiBtYXBwZWQgdG8gaXRzIGludGVuZGVkIGhpZ2ggbWVtIGFk
ZHJlc3MuDQo+ID4gPiA+ICsgICAgICAgICAqDQo+ID4gPiA+ICsgICAgICAgICAqIENhcHR1cmUg
dGhlIHN0YXRlIG9mIGJ1cyBtYXN0ZXIgdG8gcmVzdG9yZSBpdCBiYWNrDQo+ID4gPiA+IG9uY2UN
Cj4gPiA+ID4gQkFSDQo+ID4gPiA+ICsgICAgICAgICAqIHByb2dyYW1taW5nIGlzIGNvbXBsZXRl
ZC4NCj4gPiA+ID4gKyAgICAgICAgICovDQo+ID4gPiA+ICAgICAgICAgIGNtZCA9IHBjaV9yZWFk
dyhkZXZmbiwgUENJX0NPTU1BTkQpOw0KPiA+ID4gPiAtICAgICAgICBjbWQgfD0gUENJX0NPTU1B
TkRfTUFTVEVSOw0KPiA+ID4gPiArICAgICAgICBwY2lfZGV2Zm5fZGVjb2RlX3R5cGVbZGV2Zm5d
ID0gY21kICYNCj4gPiA+ID4gfihQQ0lfQ09NTUFORF9NRU1PUlkNCj4gPiA+ID4gPiBQQ0lfQ09N
TUFORF9JTyk7DQo+ID4gPiA+IA0KPiA+ID4gPiArICAgICAgICBjbWQgJj0gfihQQ0lfQ09NTUFO
RF9NQVNURVIgfCBQQ0lfQ09NTUFORF9NRU1PUlkgfA0KPiA+ID4gPiBQQ0lfQ09NTUFORF9JTyk7
DQo+ID4gPiANCj4gPiA+IFRoZSBkaXNhYmxpbmcgb2YgTUFTVEVSIHdhcyBwdXQgdW5kZXIgcXVl
c3Rpb24gaW4gdjEgYWxyZWFkeS4NCj4gPiANCj4gPiBEaXNhYmxpbmcgb2YgTUFTVEVSIGlzIGRv
bmUgd2hpbHN0IHByb2dyYW1taW5nIEJBUnMgYW5kIGl0IGlzDQo+ID4gcmVzdG9yZWQNCj4gPiBi
YWNrIHRvIGl0cyBwcmV2aW91cyB2YWx1ZSBpbiB0aGUgbG9vcCBhdCB0aGUgZW5kIG9mIHBjaV9z
ZXR1cA0KPiA+IGZ1bmN0aW9uLg0KPiANCj4gWWV0IGRpZG4ndCBBbmRyZXcgaW5kaWNhdGUgaGUg
a25vd3Mgb2YgZGV2aWNlcyB3aGljaCBnZXQgdXBzZXQgaWYNCj4gTUFTVEVSIF9ldmVyXyBnZXRz
IGNsZWFyZWQ/DQoNClByZXZpb3VzIGNvbW1pdCBlbmFibGVkIE1BU1RFUiBmb3IgYWxsIGZ1bmN0
aW9ucy4gSSBhbSBiaXQgY29uZnVzZWQNCmhlcmUgb24gdGhlIGNvbnNlbnN1cyBvbiBlbmFibGlu
Zy9kaXNhYmxpbmcvcmV0YWluaW5nIEJNRS4NClNob3VsZCB3ZSBldmVuIGNhcmUgYWJvdXQgTUFT
VEVSPw0KDQo+IA0KPiA+ID4gPiBAQCAtNTI2LDEwICs1NDIsMTMgQEAgdm9pZCBwY2lfc2V0dXAo
dm9pZCkNCj4gPiA+ID4gICAgICAgICAgICogaGFzIElPIGVuYWJsZWQsIGV2ZW4gaWYgdGhlcmUg
aXMgbm8gSS9PIEJBUiBvbiB0aGF0DQo+ID4gPiA+ICAgICAgICAgICAqIHBhcnRpY3VsYXIgZGV2
aWNlLg0KPiA+ID4gPiAgICAgICAgICAgKi8NCj4gPiA+ID4gLSAgICAgICAgY21kID0gcGNpX3Jl
YWR3KHZnYV9kZXZmbiwgUENJX0NPTU1BTkQpOw0KPiA+ID4gPiAtICAgICAgICBjbWQgfD0gUENJ
X0NPTU1BTkRfSU87DQo+ID4gPiA+IC0gICAgICAgIHBjaV93cml0ZXcodmdhX2RldmZuLCBQQ0lf
Q09NTUFORCwgY21kKTsNCj4gPiA+ID4gKyAgICAgICAgcGNpX2RldmZuX2RlY29kZV90eXBlW3Zn
YV9kZXZmbl0gfD0gUENJX0NPTU1BTkRfSU87DQo+ID4gPiA+ICAgICAgfQ0KPiA+ID4gPiArDQo+
ID4gPiA+ICsgICAgLyogRW5hYmxlIG1lbW9yeSBhbmQgSS9PIHNwYWNlLiBSZXN0b3JlIHNhdmVk
IEJVUyBNQVNURVINCj4gPiA+ID4gc3RhdGUNCj4gPiA+ID4gKi8NCj4gPiA+ID4gKyAgICBmb3Ig
KCBkZXZmbiA9IDA7IGRldmZuIDwgMjU2OyBkZXZmbisrICkNCj4gPiA+ID4gKyAgICAgICAgaWYg
KCBwY2lfZGV2Zm5fZGVjb2RlX3R5cGVbZGV2Zm5dICkNCj4gPiA+ID4gKyAgICAgICAgICAgIHBj
aV93cml0ZXcoZGV2Zm4sIFBDSV9DT01NQU5ELA0KPiA+ID4gPiBwY2lfZGV2Zm5fZGVjb2RlX3R5
cGVbZGV2Zm5dKTsNCj4gPiA+IA0KPiA+ID4gWW91IGVmZmVjdGl2ZWx5IGNsZWFyIHRoZSB1cHBl
ciA4IGJpdHMgaGVyZSwgcmF0aGVyIHRoYW4NCj4gPiA+IHJldGFpbmluZw0KPiA+ID4gdGhlbS4N
Cj4gPiA+IA0KPiA+IA0KPiA+IEluIGZhY3QgY21kIGlzIGEgMzIgYml0IHZhbHVlIGFuZCBJIGFt
IHJldGFpbmluZyBvbmx5IGxvd2VyIDggYml0cw0KPiA+IG9mDQo+ID4gaXQuIFRoaXMgd2lsbCBi
ZSBjb3JyZWN0ZWQgaW4gdjMuDQo+IA0KPiBQQ0lfQ09NTUFORCBpcyBhIDE2LWJpdCBmaWVsZC4g
VGhlIGFkamFjZW50IDE2IGJpdHMgaW4gdGhlIHNhbWUgMzINCj4gYml0DQo+IHdvcmQgYXJlIFBD
SV9TVEFUVVMuDQo+IA0KPiBKYW4NCg==

