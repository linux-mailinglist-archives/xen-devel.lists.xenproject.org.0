Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740671459EB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 17:30:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuIqh-0002Se-4W; Wed, 22 Jan 2020 16:27:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8xH2=3L=amazon.co.uk=prvs=28361e846=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iuIqg-0002SZ-8m
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 16:27:22 +0000
X-Inumbo-ID: 103df4e2-3d34-11ea-bca8-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 103df4e2-3d34-11ea-bca8-12813bfff9fa;
 Wed, 22 Jan 2020 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579710442; x=1611246442;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VVybjnaV3I8Dr661kZyL6L/7nd7H0yf0rRGThwTHBXM=;
 b=fOEiHMMStM3NqofF/y+MGVi8+z5ZiL2NWPV9A+bX8CWOnj0dNUYB+QRP
 IK6sMRHFdDlw7YjL02JZj7KBqhhENQYyYPzK4Rwh31eCHrlV0lS3aUfu9
 Gkpnccd2U2OosACKspKVkCbwsfo3p21csOunih/1iyvaE/GL1U9E4g44r g=;
IronPort-SDR: geRuPboGkzat80KWrF3EUdhAd/nlbO8tp/uRG5Y2n5Id8z6rfl0FChxg6u5m/Kr21pg54baTN1
 cd4LoiFUeZKg==
X-IronPort-AV: E=Sophos;i="5.70,350,1574121600"; d="scan'208";a="11994777"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 22 Jan 2020 16:27:11 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9A282A189D; Wed, 22 Jan 2020 16:27:09 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 22 Jan 2020 16:27:09 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 16:27:08 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 22 Jan 2020 16:27:08 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH 3/3] x86 / vmx: use a 'normal' domheap page for
 APIC_DEFAULT_PHYS_BASE
Thread-Index: AQHV0FJcY7J90OgIvEqx31hCfypvqqf23iGAgAABDsA=
Date: Wed, 22 Jan 2020 16:27:07 +0000
Message-ID: <3d3a65e998c14c1f9fe52dcf4dee1f76@EX13D32EUC003.ant.amazon.com>
References: <20200121120009.1767-1-pdurrant@amazon.com>
 <20200121120009.1767-4-pdurrant@amazon.com>
 <8cbb41bd-760e-1428-157b-4bdc64d1aa76@suse.com>
In-Reply-To: <8cbb41bd-760e-1428-157b-4bdc64d1aa76@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.87]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 3/3] x86 / vmx: use a 'normal' domheap page
 for APIC_DEFAULT_PHYS_BASE
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIyIEphbnVhcnkgMjAyMCAxNjoxNw0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Ow0KPiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1v
bm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVu
bGFwQGV1LmNpdHJpeC5jb20+OyBJYW4NCj4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBLb25yYWQNCj4gUnplc3p1dGVr
IFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy8zXSB4ODYgLyB2
bXg6IHVzZSBhICdub3JtYWwnIGRvbWhlYXAgcGFnZSBmb3INCj4gQVBJQ19ERUZBVUxUX1BIWVNf
QkFTRQ0KPiANCj4gT24gMjEuMDEuMjAyMCAxMzowMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+
IHZteF9hbGxvY192bGFwaWNfbWFwcGluZygpIGN1cnJlbnRseSBjb250YWlucyBzb21lIHZlcnkg
b2RkIGxvb2tpbmcgY29kZQ0KPiA+IHRoYXQgYWxsb2NhdGVzIGEgTUVNRl9ub19vd25lciBkb21o
ZWFwIHBhZ2UgYW5kIHRoZW4gc2hhcmVzIHdpdGggdGhlDQo+IGd1ZXN0DQo+ID4gYXMgaWYgaXQg
d2VyZSBhIHhlbmhlYXAgcGFnZS4gVGhpcyB0aGVuIHJlcXVpcmVzDQo+IHZteF9mcmVlX3ZsYXBp
Y19tYXBwaW5nKCkNCj4gPiB0byBjYWxsIGEgc3BlY2lhbCBmdW5jdGlvbiBpbiB0aGUgbW0gY29k
ZTogZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKCkuDQo+ID4NCj4gPiBCeSB1c2luZyBhICdub3Jt
YWwnIGRvbWhlYXAgcGFnZSAoaS5lLiBieSBub3QgcGFzc2luZyBNRU1GX25vX293bmVyIHRvDQo+
ID4gYWxsb2NfZG9taGVhcF9wYWdlKCkpLCB0aGUgb2RkIGxvb2tpbmcgY29kZSBpbg0KPiB2bXhf
YWxsb2NfdmxhcGljX21hcHBpbmcoKQ0KPiA+IGNhbiBzaW1wbHkgdXNlIGdldF9wYWdlX2FuZF90
eXBlKCkgdG8gc2V0IHVwIGEgd3JpdGFibGUgbWFwcGluZyBiZWZvcmUNCj4gPiBpbnNlcnRpb24g
aW4gdGhlIFAyTSBhbmQgdm14X2ZyZWVfdmxhcGljX21hcHBpbmcoKSBjYW4gc2ltcGx5IHJlbGVh
c2UNCj4gdGhlDQo+ID4gcGFnZSB1c2luZyBwdXRfcGFnZV9hbGxvY19yZWYoKSBmb2xsb3dlZCBi
eSBwdXRfcGFnZV9hbmRfdHlwZSgpLiBUaGlzDQo+ID4gdGhlbiBhbGxvd3MgZnJlZV9zaGFyZWRf
ZG9taGVhcF9wYWdlKCkgdG8gYmUgcHVyZ2VkLg0KPiA+DQo+ID4gVGhlcmUgaXMsIGhvd2V2ZXIs
IHNvbWUgZmFsbC1vdXQgZnJvbSB0aGlzIHNpbXBsaWZpY2F0aW9uOg0KPiA+DQo+ID4gLSBhbGxv
Y19kb21oZWFwX3BhZ2UoKSB3aWxsIG5vdyBjYWxsIGFzc2lnbl9wYWdlcygpIGFuZCBydW4gaW50
byB0aGUNCj4gZmFjdA0KPiA+ICAgdGhhdCAnbWF4X3BhZ2VzJyBpcyBub3Qgc2V0IHVudGlsIHNv
bWUgdGltZSBhZnRlciBkb21haW5fY3JlYXRlKCkuIFRvDQo+ID4gICBhdm9pZCBhbiBhbGxvY2F0
aW9uIGZhaWx1cmUsIGFzc2lnbl9wYWdlcygpIGlzIG1vZGlmaWVkIHRvIGlnbm9yZSB0aGUNCj4g
PiAgIG1heF9wYWdlcyBsaW1pdCBpZiAnY3JlYXRpb25fZmluaXNoZWQnIGlzIGZhbHNlLiBUaGF0
IHZhbHVlIGlzIG5vdCBzZXQNCj4gPiAgIHRvIHRydWUgdW50aWwgZG9tYWluX3VucGF1c2VfYnlf
c3lzdGVtY29udHJvbGxlcigpIGlzIGNhbGxlZCwgYW5kIHRodXMNCj4gPiAgIHRoZSBndWVzdCBj
YW5ub3QgcnVuIChhbmQgaGVuY2UgY2F1c2UgbWVtb3J5IGFsbG9jYXRpb24pIHVudGlsDQo+ID4g
ICBjcmVhdGlvbl9maW5pc2hlZCBpcyBzZXQgdG8gdHJ1ZS4NCj4gDQo+IEJ1dCB0aGlzIGNoZWNr
IGlzIGFsc28gdG8gZ3VhcmQgYWdhaW5zdCB0aGUgdG9vbCBzdGFjayAob3IgcG9zc2libHkNCj4g
dGhlIGNvbnRyb2xsaW5nIHN0dWJkb20pIHRvIGNhdXNlIGV4Y2VzcyBhbGxvY2F0aW9uLiBJIGRv
bid0IHRoaW5rDQo+IHRoZSBjaGVja2luZyBzaG91bGQgYmUgdW5kZXJtaW5lZCBsaWtlIHRoaXMg
KGFuZCBzZWUgYWxzbyBiZWxvdykuDQo+DQoNCk9rLg0KIA0KPiBTaW5jZSBjZXJ0YWlubHkgeW91
J3ZlIGxvb2tlZCBpbnRvIHRoaXMgd2hpbGUgY3JlYXRpbmcgdGhlIHBhdGNoLA0KPiBjb3VsZCB5
b3UgcmVtaW5kIG1lIHdoeSBpdCBpcyB0aGF0IHRoaXMgcGFnZSBuZWVkcyB0byBiZSBvd25lZCAo
YXMNCj4gaW4gaXRzIG93bmVyIGZpZWxkIHNldCBhY2NvcmRpbmdseSkgYnkgdGhlIGd1ZXN0PyBJ
dCdzIGEgaGVscGVyDQo+IHBhZ2Ugb25seSwgYWZ0ZXIgYWxsLg0KPiANCg0KTm90IHN1cmUgd2h5
IGl0IHdhcyBkb25lIHRoYXQgd2F5LiBJdCdzIGluc2VydGVkIGludG8gdGhlIGd1ZXN0IFAyTSBz
byBoYXZpbmcgaXQgb3duZWQgYnkgdGhlIGd1ZXN0IHNlZW1zIGxpa2UgdGhlIHJpZ2h0IHRoaW5n
IHRvIGRvLiBBIG1hbGljaW91cyBndWVzdCBjb3VsZCBkZWNyZWFzZS1yZXNlcnZhdGlvbiBpdCBh
bmQgSSBndWVzcyBpdCBhdm9pZHMgc3BlY2lhbC1jYXNpbmcgdGhlcmUuDQoNCj4gPiBAQCAtMzAz
NCwxMiArMzAzNCwyMiBAQCBzdGF0aWMgaW50IHZteF9hbGxvY192bGFwaWNfbWFwcGluZyhzdHJ1
Y3QNCj4gZG9tYWluICpkKQ0KPiA+ICAgICAgaWYgKCAhY3B1X2hhc192bXhfdmlydHVhbGl6ZV9h
cGljX2FjY2Vzc2VzICkNCj4gPiAgICAgICAgICByZXR1cm4gMDsNCj4gPg0KPiA+IC0gICAgcGcg
PSBhbGxvY19kb21oZWFwX3BhZ2UoZCwgTUVNRl9ub19vd25lcik7DQo+ID4gKyAgICBwZyA9IGFs
bG9jX2RvbWhlYXBfcGFnZShkLCAwKTsNCj4gDQo+IERpZCB5b3UgY29uc2lkZXIgcGFzc2luZyBN
RU1GX25vX3JlZmNvdW50IGhlcmUsIHRvIGF2b2lkIHRoZQ0KPiBmaWRkbGluZyB3aXRoIGFzc2ln
bl9wYWdlcygpPyBUaGF0J2xsIGluIHBhcnRpY3VsYXIgYWxzbw0KPiBhdm9pZCAuLi4NCj4gDQoN
CllvdSByZW1lbWJlciB3aGF0IGhhcHBlbmVkIGxhc3QgdGltZSB3ZSBkaWQgdGhhdCAod2l0aCB0
aGUgaW9yZXEgc2VydmVyIHBhZ2UpLCByaWdodD8gVGhhdCdzIHdoeSBhc3NpZ25fcGFnZXMoKSB2
ZXRvZXMgbm9uLXJlZmNvdW50ZWQgcGFnZXMuDQoNCj4gPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2Vf
YWxsb2MuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4gQEAgLTIyNjks
NyArMjI2OSw4IEBAIGludCBhc3NpZ25fcGFnZXMoDQo+ID4NCj4gPiAgICAgIGlmICggIShtZW1m
bGFncyAmIE1FTUZfbm9fcmVmY291bnQpICkNCj4gPiAgICAgIHsNCj4gPiAtICAgICAgICBpZiAo
IHVubGlrZWx5KChkLT50b3RfcGFnZXMgKyAoMSA8PCBvcmRlcikpID4gZC0+bWF4X3BhZ2VzKSAp
DQo+ID4gKyAgICAgICAgaWYgKCB1bmxpa2VseSgoZC0+dG90X3BhZ2VzICsgKDEgPDwgb3JkZXIp
KSA+IGQtPm1heF9wYWdlcykgJiYNCj4gPiArICAgICAgICAgICAgIGQtPmNyZWF0aW9uX2Zpbmlz
aGVkICkNCj4gPiAgICAgICAgICB7DQo+ID4gICAgICAgICAgICAgIGdwcmludGsoWEVOTE9HX0lO
Rk8sICJPdmVyLWFsbG9jYXRpb24gZm9yIGRvbWFpbiAldTogIg0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICIldSA+ICV1XG4iLCBkLT5kb21haW5faWQsDQo+IA0KPiAuLi4gaW52b2tpbmcgZG9t
YWluX2FkanVzdF90b3RfcGFnZXMoKSByaWdodCBiZWxvdyBoZXJlLCB3aGljaA0KPiBpcyB3cm9u
ZyBmb3IgaGVscGVyIHBhZ2VzIGxpa2UgdGhpcyBvbmUgKGFzIGl0IHJlZHVjZXMgdGhlDQo+IGFt
b3VudCB0aGUgZG9tYWluIGlzIGFjdHVhbGx5IHBlcm1pdHRlZCB0byBhbGxvY2F0ZSkuDQo+IA0K
DQpUcnVlLCBidXQgdGhlcmUgaXMgJ3Nsb3AnIHRvIGRlYWwgd2l0aCB0aGluZ3MgbGlrZSB0aGUg
aW9yZXEgcGFnZXMgYW5kIEkgdGhpbmsgdGhpcyBwYWdlIGlzIGxvZ2ljYWxseSBzaW1pbGFyLg0K
DQogIFBhdWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
