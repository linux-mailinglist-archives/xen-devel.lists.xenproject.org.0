Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA2611E468
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:15:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifkkA-0004xP-Ez; Fri, 13 Dec 2019 13:12:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8pyZ=2D=amazon.com=prvs=24328bf02=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ifkk8-0004xG-QO
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:12:28 +0000
X-Inumbo-ID: 36255f3c-1daa-11ea-8ef9-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36255f3c-1daa-11ea-8ef9-12813bfff9fa;
 Fri, 13 Dec 2019 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576242748; x=1607778748;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=20AfjQGP8BDFOLEMP8eBSKwbIdaoG3P4dSOddbIQ68Y=;
 b=v5m3QlGhkySaI8qyOXRpSKeOOa5ozm8Or3FJ2vd0g6hBAXVmVt5CvJgc
 yRIbXXEgC76ep/qJQTm01hXIKt08pLM0q1XMSDH0l+mBU5SO76j7V+hLS
 W5Mren2EJyQqnknZl9WTUqcE58OGSiZvTxAWmuVaIVaZEn0LXAaE5EPud I=;
IronPort-SDR: R6vgNxckyJ/AzJ5GxdOJrtfZ/eU9a3R1xuyvjcydygYJJwpLrAgQ9+79yGbWNPROWis7qUAEo6
 Hw0JmsgpXVSw==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; 
   d="scan'208";a="4936863"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 13 Dec 2019 13:12:17 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4A633A1C70; Fri, 13 Dec 2019 13:12:16 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 13:12:15 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 13:12:14 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 13 Dec 2019 13:12:14 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
Thread-Index: AQHVsbS1kJ3BthO0hEaHKwCfCIG6jqe4CFzw
Date: Fri, 13 Dec 2019 13:12:14 +0000
Message-ID: <d48d495dc3ab4ba1869221be36fac343@EX13D32EUC003.ant.amazon.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
In-Reply-To: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMTMgRGVjZW1iZXIgMjAxOSAxMjo1Mw0KPiBUbzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47DQo+IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVuQHhlbi5vcmc+
OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFdpbGsNCj4gPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Ow0KPiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxw
YXVsQHhlbi5vcmc+Ow0KPiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBbWGVu
LWRldmVsXSBbUEFUQ0ggdjJdIElPTU1VOiBtYWtlIERNQSBjb250YWlubWVudCBvZiBxdWFyYW50
aW5lZA0KPiBkZXZpY2VzIG9wdGlvbmFsDQo+IA0KPiBDb250YWluaW5nIHN0aWxsIGluIGZsaWdo
dCBETUEgd2FzIGludHJvZHVjZWQgdG8gd29yayBhcm91bmQgY2VydGFpbg0KPiBkZXZpY2VzIC8g
c3lzdGVtcyBoYW5naW5nIGhhcmQgdXBvbiBoaXR0aW5nIGFuIElPTU1VIGZhdWx0LiBQYXNzaW5n
DQo+IHRocm91Z2ggKHN1Y2gpIGRldmljZXMgKG9uIHN1Y2ggc3lzdGVtcykgaXMgaW5oZXJlbnRs
eSBpbnNlY3VyZSAoYXMNCj4gZ3Vlc3RzIGNvdWxkIGVhc2lseSBhcnJhbmdlIGZvciBJT01NVSBm
YXVsdHMgdG8gb2NjdXIpLiBEZWZhdWx0aW5nIHRvDQo+IGEgbW9kZSB3aGVyZSBhZG1pbnMgbWF5
IG5vdCBldmVuIGJlY29tZSBhd2FyZSBvZiBpc3N1ZXMgd2l0aCBkZXZpY2VzIGNhbg0KPiBiZSBj
b25zaWRlcmVkIHVuZGVzaXJhYmxlLiBUaGVyZWZvcmUgY29udmVydCB0aGlzIG1vZGUgb2Ygb3Bl
cmF0aW9uIHRvDQo+IGFuIG9wdGlvbmFsIG9uZSwgbm90IG9uZSBlbmFibGVkIGJ5IGRlZmF1bHQu
DQo+IA0KPiBUaGlzIGludm9sdmVzIHJlc3VycmVjdGluZyBjb2RlIGNvbW1pdCBlYTM4ODY3ODMx
ZGEgKCJ4ODYgLyBpb21tdTogc2V0DQo+IHVwIGEgc2NyYXRjaCBwYWdlIGluIHRoZSBxdWFyYW50
aW5lIGRvbWFpbiIpIGRpZCByZW1vdmUsIGluIGEgc2xpZ2h0bHkNCj4gZXh0ZW5kZWQgYW5kIGFi
c3RyYWN0ZWQgZmFzaGlvbi4gSGVyZSwgaW5zdGVhZCBvZiByZWludHJvZHVjaW5nIGEgcHJldHR5
DQo+IHBvaW50bGVzcyB1c2Ugb2YgImdvdG8iIGluIGRvbWFpbl9jb250ZXh0X3VubWFwKCksIGFu
ZCBpbnN0ZWFkIG9mIG1ha2luZw0KPiB0aGUgZnVuY3Rpb24gKGF0IGxlYXN0IHRlbXBvcmFyaWx5
KSBpbmNvbnNpc3RlbnQsIHRha2UgdGhlIG9wcG9ydHVuaXR5DQo+IGFuZCByZXBsYWNlIHRoZSBv
dGhlciBzaW1pbGFybHkgcG9pbnRsZXNzICJnb3RvIiBhcyB3ZWxsLg0KPiANCj4gSW4gb3JkZXIg
dG8ga2V5IHRoZSByZS1pbnN0YXRlZCBieXBhc3NlcyBvZmYgb2YgdGhlcmUgKG5vdCkgYmVpbmcg
YSByb290DQo+IHBhZ2UgdGFibGUgdGhpcyBmdXJ0aGVyIHJlcXVpcmVzIG1vdmluZyB0aGUgYWxs
b2NhdGVfZG9tYWluX3Jlc291cmNlcygpDQo+IGludm9jYXRpb24gZnJvbSByZWFzc2lnbl9kZXZp
Y2UoKSB0byBhbWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgpIChvcg0KPiBlbHNlIHJlYXNz
aWduX2RldmljZSgpIHdvdWxkIGFsbG9jYXRlIGEgcm9vdCBwYWdlIHRhYmxlIGFueXdheSk7IHRo
aXMgaXMNCj4gYmVuaWduIHRvIHRoZSBzZWNvbmQgY2FsbGVyIG9mIHRoZSBsYXR0ZXIgZnVuY3Rp
b24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IC0tLQ0KPiBBcyBmYXIgYXMgNC4xMyBpcyBjb25jZXJuZWQsIEkgZ3Vlc3MgaWYgd2UgY2Fu
J3QgY29tZSB0byBhbiBhZ3JlZW1lbnQNCj4gaGVyZSwgdGhlIG9ubHkgb3RoZXIgb3B0aW9uIGlz
IHRvIHJldmVydCBlYTM4ODY3ODMxZGEgZnJvbSB0aGUgYnJhbmNoLA0KPiBmb3IgaGF2aW5nIGJl
ZW4gY29tbWl0dGVkIHByZW1hdHVyZWx5IChJJ20gbm90IHNvIG11Y2ggd29ycmllZCBhYm91dCB0
aGUNCj4gbWFzdGVyIGJyYW5jaCwgd2hlcmUgd2UgaGF2ZSBhbXBsZSB0aW1lIHVudGlsIDQuMTQp
LiBXaGF0IEkgc3VyZWx5IHdhbnQNCj4gdG8gc2VlIHVzIGF2b2lkIGlzIGEgYmFjayBhbmQgZm9y
dGggaW4gYmVoYXZpb3Igb2YgcmVsZWFzZWQgdmVyc2lvbnMuDQo+IChOb3RlIHRoYXQgNC4xMi4y
IGlzIHNpbWlsYXJseSBibG9ja2VkIG9uIGEgZGVjaXNpb24gZWl0aGVyIHdheSBoZXJlLikNCj4g
DQo+IEknbSBoYXBweSB0byB0YWtlIGJldHRlciBzdWdnZXN0aW9ucyB0byByZXBsYWNlICJmdWxs
Ii4NCg0KSG93IGFib3V0IHNpbXBseSAic2luayIsIHNpbmNlIHRoYXQncyB3aGF0IGl0IGRvZXM/
DQoNCltzbmlwXQ0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4gQEAgLTMwLDEzICszMCwxNyBA
QCBib29sX3QgX19pbml0ZGF0YSBpb21tdV9lbmFibGUgPSAxOw0KPiAgYm9vbF90IF9fcmVhZF9t
b3N0bHkgaW9tbXVfZW5hYmxlZDsNCj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGZvcmNlX2lvbW11
Ow0KPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfdmVyYm9zZTsNCj4gLWJvb2wgX19yZWFk
X21vc3RseSBpb21tdV9xdWFyYW50aW5lID0gdHJ1ZTsNCj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5
IGlvbW11X2lnZnggPSAxOw0KPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfc25vb3AgPSAx
Ow0KPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfcWludmFsID0gMTsNCj4gIGJvb2xfdCBf
X3JlYWRfbW9zdGx5IGlvbW11X2ludHJlbWFwID0gMTsNCj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5
IGlvbW11X2NyYXNoX2Rpc2FibGU7DQo+IA0KPiArI2RlZmluZSBJT01NVV9xdWFyYW50aW5lX25v
bmUgIDANCj4gKyNkZWZpbmUgSU9NTVVfcXVhcmFudGluZV9iYXNpYyAxDQo+ICsjZGVmaW5lIElP
TU1VX3F1YXJhbnRpbmVfZnVsbCAgMg0KPiArdWludDhfdCBfX3JlYWRfbW9zdGx5IGlvbW11X3F1
YXJhbnRpbmUgPSBJT01NVV9xdWFyYW50aW5lX2Jhc2ljOw0KDQpJZiB3ZSBoYXZlICdJT01NVV9x
dWFyYW50aW5lX3NpbmsnIGluc3RlYWQgb2YgJ0lPTU1VX3F1YXJhbnRpbmVfZnVsbCcsIHRoZW4g
aG93IGFib3V0ICdJT01NVV9xdWFyYW50aW5lX3dyaXRlX2ZhdWx0JyBpbnN0ZWFkIG9mICdJT01N
VV9xdWFyYW50aW5lX2Jhc2ljJz8NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
