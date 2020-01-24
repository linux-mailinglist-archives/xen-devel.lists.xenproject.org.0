Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2672147FB7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 12:05:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuwjK-00085p-V7; Fri, 24 Jan 2020 11:02:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9iSm=3N=amazon.co.uk=prvs=28596b9bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iuwjJ-000855-DL
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 11:02:25 +0000
X-Inumbo-ID: fba96c8a-3e98-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fba96c8a-3e98-11ea-9fd7-bc764e2007e4;
 Fri, 24 Jan 2020 11:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579863737; x=1611399737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y29uP2GzVAcS1v5ipdPpauozGZhbdr5xnKUn+L5BQJg=;
 b=BagaT1gWmix0NC+sFksV1sPQM2Z+NL1yILHE2iQg6eSB2vF6TmtkItX1
 es2dciGwBH9Lj9Ka5qDczAGPLwW+enkge7J9Ru51TMP2mQ4SY5JDKEgvP
 jCcuj6ZPpnxUx1f5XAhQz6VflEsGXE30rzrYBJYiF3POjknr9jnTQUBpo A=;
IronPort-SDR: uHQHaugWk0EEcdjhYE9ga7N1r7EY7fkJERD1SHGYbMyiE1h/+OwFLFTspypa9FibeytaLe9SEu
 K+S1k6Ldo8iA==
X-IronPort-AV: E=Sophos;i="5.70,357,1574121600"; d="scan'208";a="14527159"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 24 Jan 2020 11:02:15 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id BFCA4A25B5; Fri, 24 Jan 2020 11:02:13 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 24 Jan 2020 11:02:13 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 24 Jan 2020 11:02:12 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 24 Jan 2020 11:02:12 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 3/3] x86 / vmx: use a 'normal' domheap page for
 APIC_DEFAULT_PHYS_BASE
Thread-Index: AQHV0fXetmGz8ndNHkq9FYXzH0041Kf4U6EAgAFTZLA=
Date: Fri, 24 Jan 2020 11:02:12 +0000
Message-ID: <2b4141f83bce4eada2a9934e149548f3@EX13D32EUC003.ant.amazon.com>
References: <20200123140305.21050-1-pdurrant@amazon.com>
 <20200123140305.21050-4-pdurrant@amazon.com>
 <dbdeec02-3a69-7262-fed6-2b280faf2b8e@citrix.com>
In-Reply-To: <dbdeec02-3a69-7262-fed6-2b280faf2b8e@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.33]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86 / vmx: use a 'normal' domheap
 page for APIC_DEFAULT_PHYS_BASE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIFttYWls
dG86Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tXQ0KPiBTZW50OiAyMyBKYW51YXJ5IDIwMjAgMTQ6
NDYNCj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBM
aXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dlci5wYXVAY2l0cml4LmNv
bT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT47IElhbg0KPiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz47IEtvbnJhZA0KPiBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1biBO
YWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IEtldmluDQo+IFRpYW4gPGtldmluLnRp
YW5AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDMvM10geDg2IC8gdm14OiB1
c2UgYSAnbm9ybWFsJyBkb21oZWFwIHBhZ2UgZm9yDQo+IEFQSUNfREVGQVVMVF9QSFlTX0JBU0UN
Cj4gDQo+IE9uIDEvMjMvMjAgMjowMyBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IHZteF9h
bGxvY192bGFwaWNfbWFwcGluZygpIGN1cnJlbnRseSBjb250YWlucyBzb21lIHZlcnkgb2RkIGxv
b2tpbmcNCj4gPiBjb2RlIHRoYXQgYWxsb2NhdGVzIGEgTUVNRl9ub19vd25lciBkb21oZWFwIHBh
Z2UgYW5kIHRoZW4gc2hhcmVzIHdpdGgNCj4gPiB0aGUgZ3Vlc3QgYXMgaWYgaXQgd2VyZSBhIHhl
bmhlYXAgcGFnZS4gVGhpcyB0aGVuIHJlcXVpcmVzDQo+ID4gdm14X2ZyZWVfdmxhcGljX21hcHBp
bmcoKSB0byBjYWxsIGEgc3BlY2lhbCBmdW5jdGlvbiBpbiB0aGUgbW0gY29kZToNCj4gZnJlZV9z
aGFyZWRfZG9taGVhcF9wYWdlKCkuDQo+ID4NCj4gPiBCeSB1c2luZyBhICdub3JtYWwnIGRvbWhl
YXAgcGFnZSAoaS5lLiBieSBub3QgcGFzc2luZyBNRU1GX25vX293bmVyIHRvDQo+ID4gYWxsb2Nf
ZG9taGVhcF9wYWdlKCkpLCB0aGUgb2RkIGxvb2tpbmcgY29kZSBpbg0KPiA+IHZteF9hbGxvY192
bGFwaWNfbWFwcGluZygpIGNhbiBzaW1wbHkgdXNlIGdldF9wYWdlX2FuZF90eXBlKCkgdG8gc2V0
DQo+ID4gdXAgYSB3cml0YWJsZSBtYXBwaW5nIGJlZm9yZSBpbnNlcnRpb24gaW4gdGhlIFAyTSBh
bmQNCj4gPiB2bXhfZnJlZV92bGFwaWNfbWFwcGluZygpIGNhbiBzaW1wbHkgcmVsZWFzZSB0aGUg
cGFnZSB1c2luZw0KPiA+IHB1dF9wYWdlX2FsbG9jX3JlZigpIGZvbGxvd2VkIGJ5IHB1dF9wYWdl
X2FuZF90eXBlKCkuIFRoaXMgdGhlbiBhbGxvd3MNCj4gZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdl
KCkgdG8gYmUgcHVyZ2VkLg0KPiA+DQo+ID4gVGhlcmUgaXMsIGhvd2V2ZXIsIHNvbWUgZmFsbC1v
dXQgZnJvbSB0aGlzIHNpbXBsaWZpY2F0aW9uOg0KPiA+DQo+ID4gLSBhbGxvY19kb21oZWFwX3Bh
Z2UoKSB3aWxsIG5vdyBjYWxsIGFzc2lnbl9wYWdlcygpIGFuZCBydW4gaW50byB0aGUNCj4gZmFj
dA0KPiA+ICAgdGhhdCAnbWF4X3BhZ2VzJyBpcyBub3Qgc2V0IHVudGlsIHNvbWUgdGltZSBhZnRl
ciBkb21haW5fY3JlYXRlKCkuIFRvDQo+ID4gICBhdm9pZCBhbiBhbGxvY2F0aW9uIGZhaWx1cmUs
IGRvbWFpbl9jcmVhdGUoKSBpcyBtb2RpZmllZCB0byBzZXQNCj4gPiAgIG1heF9wYWdlcyB0byBh
biBpbml0aWFsIHZhbHVlLCBzdWZmaWNpZW50IHRvIGNvdmVyIGFueSBkb21oZWFwDQo+ID4gICBh
bGxvY2F0aW9ucyByZXF1aXJlZCB0byBjb21wbGV0ZSBkb21haW4gY3JlYXRpb24uIFRoZSB2YWx1
ZSB3aWxsIGJlDQo+ID4gICBzZXQgdG8gdGhlICdyZWFsJyBtYXhfcGFnZXMgd2hlbiB0aGUgdG9v
bC1zdGFjayBsYXRlciBwZXJmb3JtcyB0aGUNCj4gPiAgIFhFTl9ET01DVExfbWF4X21lbSBvcGVy
YXRpb24sIHRodXMgYWxsb3dpbmcgdGhlIHJlc3Qgb2YgdGhlIGRvbWFpbidzDQo+ID4gICBtZW1v
cnkgdG8gYmUgYWxsb2NhdGVkLg0KPiA+DQo+ID4gLSBCZWNhdXNlIHRoZSBkb21oZWFwIHBhZ2Ug
aXMgbm8gbG9uZ2VyIGEgcHNldWRvLXhlbmhlYXAgcGFnZSwgdGhlDQo+ID4gICByZWZlcmVuY2Ug
Y291bnRpbmcgd2lsbCBwcmV2ZW50IHRoZSBkb21haW4gZnJvbSBiZWluZyBkZXN0cm95ZWQuIFRo
dXMNCj4gPiAgIHRoZSBjYWxsIHRvIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKCkgaXMgbW92ZWQg
ZnJvbSB0aGUNCj4gPiAgIGRvbWFpbl9kZXN0cm95KCkgbWV0aG9kIGludG8gdGhlIGRvbWFpbl9y
ZWxpbnF1aXNoX3Jlc291cmNlcygpIG1ldGhvZC4NCj4gPiAgIFdoaWxzdCBpbiB0aGUgYXJlYSwg
bWFrZSB0aGUgZG9tYWluX2Rlc3Ryb3koKSBtZXRob2QgYW4gb3B0aW9uYWwNCj4gPiAgIGFsdGVy
bmF0aXZlX3ZjYWxsKCkgKHNpbmNlIGl0IHdpbGwgbm8gbG9uZ2VyIHBlZm9ybSBhbnkgZnVuY3Rp
b24gaW4NCj4gVk1YDQo+ID4gICBhbmQgaXMgc3R1YmJlZCBpbiBTVk0gYW55d2F5KS4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4g
DQo+IFRoaXMgaXMgYW4gZXhjZWxsZW50IGNoYW5nZSwgdGhhbmsgeW91Og0KPiANCj4gUmV2aWV3
ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4NCj4gDQo+IE15
IG9ubHkgY29tbWVudCBpcyB0aGF0IHRoaXMgd291bGQgaGF2ZSBiZWVuIGEgYml0IGVhc2llciB0
byByZXZpZXcgYnJva2VuDQo+IGRvd24gaW50byBwcm9iYWJseSB0aHJlZSBwYXRjaGVzOiAxKSBt
YWtpbmcgZG9tYWluX2Rlc3Ryb3kgb3B0aW9uYWwsIDIpDQo+IG1vdmluZyB2bXggdGVhcmRvd24g
dG8gYSByZWxpbnF1aXNoX3Jlc291cmNlcyBjYWxsIDMpIHVzaW5nICJub3JtYWwiDQo+IHBhZ2Vz
Ii4gIEJ1dCBJIGRvbid0IHRoaW5rIGl0J3Mgd29ydGggYSByZS1zZW5kIGp1c3QgZm9yIHRoYXQu
DQoNClNpbmNlIEkgYXBwZWFyIHRvIG5lZWQgdG8gZG8gYSB2NCB0byByZS13b3JrIHRoZSBhbGxv
Y2F0aW9uIChhc3N1bWluZyBJIGNhbiBzdGVhbCBhbm90aGVyIFBHQyBiaXQpIEknbGwgc3BsaXQg
dGhpbmdzIGFzIHlvdSBzdWdnZXN0Lg0KDQogIFBhdWwNCg0KPiANCj4gIC1HZW9yZ2UNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
