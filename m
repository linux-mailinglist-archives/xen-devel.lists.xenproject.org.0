Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC40F1AA9BE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:22:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOivm-0001qx-KF; Wed, 15 Apr 2020 14:22:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lpyF=57=amazon.com=prvs=367615363=havanur@srs-us1.protection.inumbo.net>)
 id 1jOivk-0001qs-WA
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:22:21 +0000
X-Inumbo-ID: 83be899b-7f24-11ea-8a5c-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 83be899b-7f24-11ea-8a5c-12813bfff9fa;
 Wed, 15 Apr 2020 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1586960540; x=1618496540;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version:subject;
 bh=eeYZuoza8P0iNDel/xcZiCwNUBiCPwD7KD2PGWECSfc=;
 b=bppxzyjZ4/D9thRc1aJg0M/+LN6/+zPRrNUod2hyO/Ps3cQvIc3zqCFH
 kem6YrEy/E43L2H5ulOw+cmD1d9swZep6tHtciSlJioTssUkHE5c7S2qs
 uhbjKg2u5cyiprfSfXAKQ5Sqc1odfimxJXZOgJ1ygl6S3b0r3DtR2HSGX 8=;
IronPort-SDR: 9pF5KKiMLoheQ0kg/OBKUgGZFWqqtC9x/50i7rlxWk79zpvyzsKgI/PxZo3AukisaaD3byvWih
 N0hhzVKxkj+w==
X-IronPort-AV: E=Sophos;i="5.72,387,1580774400"; d="scan'208";a="28869729"
Subject: Re: [XEN PATCH v5] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Thread-Topic: [XEN PATCH v5] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 15 Apr 2020 14:22:18 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2C50AA2312; Wed, 15 Apr 2020 14:22:17 +0000 (UTC)
Received: from EX13D36EUC004.ant.amazon.com (10.43.164.126) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 15 Apr 2020 14:22:16 +0000
Received: from EX13D36EUC004.ant.amazon.com (10.43.164.126) by
 EX13D36EUC004.ant.amazon.com (10.43.164.126) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 15 Apr 2020 14:22:15 +0000
Received: from EX13D36EUC004.ant.amazon.com ([10.43.164.126]) by
 EX13D36EUC004.ant.amazon.com ([10.43.164.126]) with mapi id 15.00.1497.006;
 Wed, 15 Apr 2020 14:22:15 +0000
From: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Index: AQHWEyE/rXUMoux450mf7FVULomDj6h6OgUAgAACPoA=
Date: Wed, 15 Apr 2020 14:22:15 +0000
Message-ID: <7e5e3d73c8b9541aea94d884754d0fa00f86a299.camel@amazon.com>
References: <9cfd038719fee7fcb01b8967ffcb23802bb75a0b.1586953651.git.havanur@amazon.com>
 <cf008c26-3c06-9b1a-d022-3d0c16867c28@suse.com>
In-Reply-To: <cf008c26-3c06-9b1a-d022-3d0c16867c28@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.25]
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED6E235FAD28BE49B648E46BC966BCC5@amazon.com>
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

T24gV2VkLCAyMDIwLTA0LTE1IGF0IDE2OjE0ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbw0KPiBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXINCj4gYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZS4NCj4gDQo+IA0KPiANCj4gT24gMTUuMDQuMjAyMCAxNDoyNywgSGFyc2hhIFNoYW1zdW5kYXJh
IEhhdmFudXIgd3JvdGU6DQo+ID4gSXQgd2FzIG9ic2VydmVkIHRoYXQgUENJIE1NSU8gYW5kL29y
IElPIEJBUnMgd2VyZSBwcm9ncmFtbWVkIHdpdGgNCj4gPiBtZW1vcnkgYW5kIEkvTyBkZWNvZGVz
IChiaXRzIDAgYW5kIDEgb2YgUENJIENPTU1BTkQgcmVnaXN0ZXIpDQo+ID4gZW5hYmxlZCwNCj4g
PiBkdXJpbmcgUENJIHNldHVwIHBoYXNlLiBUaGlzIHJlc3VsdGVkIGluIGluY29ycmVjdCBtZW1v
cnkgbWFwcGluZw0KPiA+IGFzDQo+ID4gc29vbiBhcyB0aGUgbG93ZXIgaGFsZiBvZiB0aGUgNjQg
Yml0IGJhciBpcyBwcm9ncmFtbWVkLg0KPiA+IFRoaXMgZGlzcGxhY2VkIGFueSBSQU0gbWFwcGlu
Z3MgdW5kZXIgNEcuIEFmdGVyIHRoZQ0KPiA+IHVwcGVyIGhhbGYgaXMgcHJvZ3JhbW1lZCBQQ0kg
bWVtb3J5IG1hcHBpbmcgaXMgcmVzdG9yZWQgdG8gaXRzDQo+ID4gaW50ZW5kZWQgaGlnaCBtZW0g
bG9jYXRpb24sIGJ1dCB0aGUgUkFNIGRpc3BsYWNlZCBpcyBub3QgcmVzdG9yZWQuDQo+ID4gVGhl
IE9TIHRoZW4gY29udGludWVzIHRvIGJvb3QgYW5kIGZ1bmN0aW9uIHVudGlsIGl0IHRyaWVzIHRv
IGFjY2Vzcw0KPiA+IHRoZSBkaXNwbGFjZWQgUkFNIGF0IHdoaWNoIHBvaW50IGl0IHN1ZmZlcnMg
YSBwYWdlIGZhdWx0IGFuZA0KPiA+IGNyYXNoZXMuDQo+ID4gDQo+ID4gVGhpcyBwYXRjaCBhZGRy
ZXNzIHRoZSBpc3N1ZSBieSBkZWZlcnJpbmcgZW5hYmxlbWVudCBvZiBtZW1vcnkgYW5kDQo+ID4g
SS9PIGRlY29kZSBpbiBjb21tYW5kIHJlZ2lzdGVyIHVudGlsIGFsbCB0aGUgcmVzb3VyY2VzLCBs
aWtlDQo+ID4gaW50ZXJydXB0cw0KPiA+IEkvTyBhbmQvb3IgTU1JTyBCQVJzIGZvciBhbGwgdGhl
IFBDSSBkZXZpY2UgZnVuY3Rpb25zIGFyZQ0KPiA+IHByb2dyYW1tZWQsDQo+ID4gaW4gdGhlIGRl
c2NlbmRpbmcgb3JkZXIgb2YgbWVtb3J5IHJlcXVlc3RlZC4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBIYXJzaGEgU2hhbXN1bmRhcmEgSGF2YW51ciA8aGF2YW51ckBhbWF6b24uY29tPg0KPiAN
Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gd2l0aCBv
bmUgZnVydGhlciBhZGp1c3RtZW50Og0KPiANCj4gPiBAQCAtMTIwLDYgKzEyMSwxMyBAQCB2b2lk
IHBjaV9zZXR1cCh2b2lkKQ0KPiA+ICAgICAgICovDQo+ID4gICAgICBib29sIGFsbG93X21lbW9y
eV9yZWxvY2F0ZSA9IDE7DQo+ID4gDQo+ID4gKyAgICBCVUlMRF9CVUdfT04oKHR5cGVvZigqcGNp
X2RldmZuX2RlY29kZV90eXBlKSlQQ0lfQ09NTUFORF9JTyAhPQ0KPiA+ICsgICAgICAgICAgICBQ
Q0lfQ09NTUFORF9JTyk7DQo+ID4gKyAgICBCVUlMRF9CVUdfT04oKHR5cGVvZigqcGNpX2RldmZu
X2RlY29kZV90eXBlKSlQQ0lfQ09NTUFORF9NRU1PUg0KPiA+IFkgIT0NCj4gPiArICAgICAgICAg
ICAgUENJX0NPTU1BTkRfTUVNT1JZKTsNCj4gPiArICAgIEJVSUxEX0JVR19PTigodHlwZW9mKCpw
Y2lfZGV2Zm5fZGVjb2RlX3R5cGUpKVBDSV9DT01NQU5EX01BU1RFDQo+ID4gUiAhPQ0KPiA+ICsg
ICAgICAgICAgICBQQ0lfQ09NTUFORF9NQVNURVIpOw0KPiANCj4gSW5kZW50YXRpb24gaGVyZSBz
dGlsbCBsb29rcyB3cm9uZywgZGVzcGl0ZSBtZSBoYXZpbmcgZ2l2ZW4geW91DQo+IHRoZSBwcmVj
aXNlIGZvcm0gdG8gdXNlIGluIHJlcGx5IHRvIHY0LiBUaGlzIGNhbiBiZSB0YWtlbiBjYXJlDQo+
IG9mIHdoaWxlIGNvbW1pdHRpbmcgKGlmIG5vIG90aGVyIG5lZWQgZm9yIGEgdjYgYXJpc2VzKSwg
YnV0IGl0DQo+IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlmIHlvdSBoYWQgZG9uZSB0aGlzIGFzIGlu
ZGljYXRlZC4NCj4gDQpUaGlzIGlzIGR1ZSB0byBteSB2aW1yYyBjb25maWd1cmF0aW9uLiBJIHdp
bGwgZml4IHRoaXMgd2hpbGUgY29taXR0aW5nDQp0byBhbGlnbiBzZWNvbmQgbGluZSB0byBiZWdp
biB3aXRoIHR5cGVvZg0KDQo+IEphbg0K

