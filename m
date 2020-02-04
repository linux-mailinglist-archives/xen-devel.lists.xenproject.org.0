Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40609151DCC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 17:05:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0ey-0005j6-LL; Tue, 04 Feb 2020 16:02:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jY6G=3Y=amazon.com=prvs=29681cb87=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iz0ew-0005j0-Ol
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 16:02:42 +0000
X-Inumbo-ID: c63fc5e4-4767-11ea-ad98-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c63fc5e4-4767-11ea-ad98-bc764e2007e4;
 Tue, 04 Feb 2020 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580832162; x=1612368162;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=p+PVRvW3gUAw7aEPjaaiQ9v6uIFnh5snnzGbhJRiSxM=;
 b=m/zPA5fMTQJe8ThjtnSD9CGzsvkoaT4OLFJaM6fNqE1iKLFzCSHHIMfM
 nC45YBGr0AJlTTS8dU1O3qR0TXWxmQcLNBzxMuPFMVRXgGZCiokKTlL2h
 GLch2LVtSKOTHRbxph1bLP4U2vGvkUSFS2yRPqpPqd6FApL+26zhfWKhH c=;
IronPort-SDR: 5LziEAaTU5rPvHmiWu3yDEgxN/jZFnMaFMudqlW6X8i1cc/b4wwvTRHr+pFl3s/EJd9W/apShq
 58q9iNyEFHFg==
X-IronPort-AV: E=Sophos;i="5.70,402,1574121600"; d="scan'208";a="16174624"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 04 Feb 2020 16:02:42 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 427EAA2A6E; Tue,  4 Feb 2020 16:02:39 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 4 Feb 2020 16:02:39 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 4 Feb 2020 16:02:38 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Tue, 4 Feb 2020 16:02:38 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "wl@xen.org" <wl@xen.org>
Thread-Topic: [PATCH] x86/domain_page: implement pure per-vCPU mapping
 infrastructure
Thread-Index: AQHV21PsYByQ0ZyJ+UmPk89DPZdobagLMmMA
Date: Tue, 4 Feb 2020 16:02:38 +0000
Message-ID: <9ca0658178bc07b19c8c0fcd0aed822fa8be7c1c.camel@amazon.com>
References: <45c03833059b0ce3f52c02693a2eb649356adf3e.1580755007.git.hongyxia@amazon.com>
 <20200204120808.fknxju7u43jpmvcc@debian>
In-Reply-To: <20200204120808.fknxju7u43jpmvcc@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
Content-ID: <2303F52680A46D439EF5D2958C006970@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDIwLTAyLTA0IGF0IDEyOjA4ICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBUaGFu
a3MsIEkgd2VsY29tZSBlZmZvcnQgdG8gbWFrZSBYZW4gbW9yZSBzY2FsYWJsZS4gOi0pIA0KPiAN
Cj4gT24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDY6MzY6NTNQTSArMDAwMCwgSG9uZ3lhbiBYaWEg
d3JvdGU6DQo+ID4gUmV3cml0ZSB0aGUgbWFwY2FjaGUgdG8gYmUgcHVyZWx5IHBlci12Q1BVIGlu
c3RlYWQgb2YgcGFydGx5IHBlci0NCj4gPiB2Q1BVDQo+ID4gYW5kIHBhcnRseSBwZXItZG9tYWlu
Lg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2ggaXMgbmVlZGVkIHRvIGFkZHJlc3MgcGVyZm9ybWFuY2Ug
aXNzdWVzIHdoZW4gd2Ugc3RhcnQNCj4gPiByZWx5aW5nDQo+ID4gb24gdGhlIG1hcGNhY2hlLCBl
LmcuLCB3aGVuIHdlIGRvIG5vdCBoYXZlIGEgZGlyZWN0IG1hcC4gQ3VycmVudGx5LA0KPiA+IHRo
ZQ0KPiA+IHBlci1kb21haW4gbG9jayBvbiB0aGUgbWFwY2FjaGUgaXMgYSBib3R0bGVuZWNrIGZv
ciBtdWx0aWNvcmUsDQo+ID4gY2F1c2luZw0KPiA+IHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uIGFu
ZCBldmVuIGZ1bmN0aW9uYWwgcmVncmVzc2lvbnMuIFRoaXMgcGF0Y2gNCj4gPiBtYWtlcyB0aGUg
bWFwcGluZyBzdHJ1Y3R1cmUgcGVyLXZDUFUgYW5kIGNvbXBsZXRlbHkgbG9ja2xlc3MuDQo+ID4g
DQo+IA0KPiBXaGVuIEkgc2VlICJyZWdyZXNzaW9uIiwgSSB0aGluayBvZiBzb21ldGhpbmcgdGhh
dCB3YXMgd29ya2luZyBiZWZvcmUNCj4gYnV0IG5vdCBhbnltb3JlLiBJIGRvbid0IHRoaW5rIHRo
YXQncyB0aGUgY2FzZSBmb3IgdGhlIGZvbGxvd2luZyB0d28NCj4gdGhpbmdzLiANCj4gDQo+IEkg
d291bGQganVzdCBjbGFzc2lmeSB0aGVtIGFzIGJ1ZyBhbmQvb3IgaW1wcm92ZW1lbnQuDQoNCldl
IHByb2JhYmx5IGhhdmUgZGlmZmVyZW50IGRlZmluaXRpb25zIGZvciAicmVncmVzc2lvbiIuLi4g
YnV0IEkgY2FuDQpyZXdvcmQuDQoNCj4gPiBGdW5jdGlvbmFsIHJlZ3Jlc3Npb246DQo+ID4gDQo+
ID4gV2hlbiBhIGRvbWFpbiBpcyBydW4gb24gbW9yZSB0aGFuIDY0IGNvcmVzLCBGcmVlQlNEIDEw
IHBhbmlja3MNCj4gPiBmcmVxdWVudGx5DQo+ID4gZHVlIHRvIG9jY2FzaW9uYWwgc2ltdWx0YW5l
b3VzIHNldF9zaW5nbGVzaG90X3RpbWVyIGh5cGVyY2FsbHMgZnJvbQ0KPiA+IHRvbw0KPiA+IG1h
bnkgY29yZXMuIFNvbWUgY29yZXMgd2lsbCBiZSBibG9ja2VkIHdhaXRpbmcgb24gbWFwX2RvbWFp
bl9wYWdlLA0KPiA+IGV2ZW50dWFsbHkgZmFpbGluZyB0byBzZXQgYSB0aW1lciBpbiB0aGUgZnV0
dXJlLiBGcmVlQlNEIGNhbm5vdA0KPiA+IGhhbmRsZQ0KPiA+IHRoaXMgYW5kIHBhbmlja3MuIFRo
aXMgd2FzIGZpeGVkIGluIGxhdGVyIEZyZWVCU0QgcmVsZWFzZXMgYnkNCj4gPiBoYW5kbGluZw0K
PiA+IC1FVElNRSwgYnV0IHN0aWxsIHRoZSBkZWdyYWRhdGlvbiBpbiB0aW1lciBwZXJmb3JtYW5j
ZSBpcyBhIGJpZw0KPiA+IGlzc3VlLg0KPiA+IA0KPiA+IFBlcmZvcm1hbmNlIHJlZ3Jlc3Npb246
DQo+ID4gDQo+ID4gTWFueSBiZW5jaG1hcmtzIHNlZSBhIHBlcmZvcm1hbmNlIGRyb3Agd2hlbiBo
YXZpbmcgYSBsYXJnZSBjb3JlDQo+ID4gY291bnQuDQo+ID4gSSBoYXZlIGRvbmUgYSBHZWVrYmVu
Y2ggb24gYSAzMi12Q1BVIGd1ZXN0Lg0KPiA+IA0KPiA+IHBlcmYgZHJvcCAgICAgb2xkICAgICAg
ICBuZXcNCj4gPiBzaW5nbGUgICAgICAgMC4wNCUgICAgICAwLjE4JQ0KPiA+IG11bHRpICAgICAg
ICAyLjQzJSAgICAgIDAuMDglDQo+ID4gDQo+ID4gUmVtb3ZpbmcgdGhlIHBlci1kb21haW4gbG9j
ayBpbiB0aGUgbWFwY2FjaGUgYnJpbmdzIHRoZSBtdWx0aS1jb3JlDQo+ID4gcGVyZm9ybWFuY2Ug
YWxtb3N0IGlkZW50aWNhbCB0byB1c2luZyB0aGUgZGlyZWN0IG1hcCBmb3IgbWFwcGluZ3MuDQo+
ID4gDQo+ID4gVGhlcmUgc2hvdWxkIGJlIHJvb20gZm9yIGZ1dGhlciBvcHRpbWlzYXRpb25zLCBi
dXQgdGhpcyBhbHJlYWR5DQo+ID4gaW1wcm92ZXMgb3ZlciB0aGUgb2xkIG1hcGNhY2hlIGJ5IGEg
bG90Lg0KPiA+IA0KPiA+IE5vdGUgdGhhdCBlbnRyaWVzIGluIHRoZSBtYXBoYXNoIHdpbGwgb2Nj
dXB5IGludXNlIHNsb3RzLiBXaXRoIDE2DQo+ID4gc2xvdHMNCj4gPiBwZXIgdkNQVSBhbmQgYSBt
YXBoYXNoIGNhcGFjaXR5IG9mIDgsIHdlIG9ubHkgaGF2ZSBhbm90aGVyIDgNCj4gPiBhdmFpbGFi
bGUsDQo+ID4gd2hpY2ggaXMgbm90IGVub3VnaCBmb3IgbmVzdGVkIHBhZ2UgdGFibGUgd2Fsa3Mu
IFdlIG5lZWQgdG8NCj4gPiBpbmNyZWFzZSB0aGUNCj4gPiBudW1iZXIgb2Ygc2xvdHMgaW4gY29u
ZmlnLmguDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlhQGFt
YXpvbi5jb20+DQo+IA0KPiANCj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwgYWxsIHZjcHVzIHN0aWxs
IHNoYXJlIHRoZSBzYW1lIHBlci1kb21haW4NCj4gbWFwY2FjaGUNCj4gcmVnaW9uLiBUaGUgZGlm
ZmVyZW5jZSBpcyBub3cgdGhlIHJlZ2lvbiBpcyBkaXZpZGVkIGludG8gc3VicmVnaW9uDQo+IGZv
cg0KPiBlYWNoIHZjcHUgdG8gdXNlLg0KDQpZb3UgYXJlIHJpZ2h0LiBXZSBoYXZlIGEgcGVyLWRv
bWFpbiBWQSByYW5nZSBhbmQgd2UgaGF2ZQ0KY3JlYXRlX3BlcmRvbWFpbl9tYXBwaW5ncyB3aGlj
aCBjYW4gYmUgcmV1c2VkIG5pY2VseS4gVGhlIHBhdGNoIGRpdmlkZXMNCnRoZSByZWdpb25zIGlu
dG8gdkNQVXMuDQoNCj4gDQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAg
ICAgfCAgIDUgKy0NCj4gPiAgeGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMgICB8IDIyOSArKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IC0tLS0tLQ0KPiA+ICB4ZW4vaW5jbHVkZS9h
c20teDg2L2NvbmZpZy5oIHwgICAyICstDQo+ID4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWlu
LmggfCAgMzAgKy0tLS0NCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspLCAx
ODYgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21h
aW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYw0KPiA+IGluZGV4IGY1M2FlNWZmODYuLmEyNzhh
YTQ2NzggMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jDQo+ID4gKysrIGIv
eGVuL2FyY2gveDg2L2RvbWFpbi5jDQo+ID4gQEAgLTQ0NSw2ICs0NDUsOSBAQCB2b2lkIGFyY2hf
dmNwdV9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KQ0KPiA+ICAgICAgeGZyZWUodi0+YXJjaC5tc3Jz
KTsNCj4gPiAgICAgIHYtPmFyY2gubXNycyA9IE5VTEw7DQo+ID4gIA0KPiA+ICsgICAgeGZyZWUo
di0+YXJjaC5wdi5tYXBjYWNoZSk7DQo+ID4gKyAgICB2LT5hcmNoLnB2Lm1hcGNhY2hlID0gTlVM
TDsNCj4gPiArDQo+IA0KPiBLZWVwIGluIG1pbmQgdGhhdCBhY2Nlc3NpbmcgdGhlIHVuaW9uIHtw
diwgaHZtfSBiZWZvcmUga25vd2luZyB0aGUNCj4gZXhhY3QgdmFyaWFudCBpcyBkYW5nZXJvdXMu
DQo+IA0KPiBCZWNhdXNlIG1hcGNhY2hlIGlzIGluaXRpYWxpc2VkIGZvciBQViBvbmx5LCBzbyBp
dCBzaG91bGQgYmUgZnJlZWQNCj4gZm9yDQo+IFBWIG9ubHkuIEkgdGhpbmsgeW91IG5lZWQgdG8g
cHV0IGl0IHRvIHB2X3ZjcHVfZGVzdHJveS4NCj4gDQo+IElmIHlvdSBkb24ndCB3YW50IHRvIGRv
IHRoYXQgYmVjYXVzZSBvZiBhc3ltbWV0cnkgd2l0aA0KPiBtYXBjYWNoZV92Y3B1X2luaXQsIHlv
dSBtYXkgd2FudCB0byBpbnZlbnQgbWFwY2FjaGVfdmNwdV9kZXN0cm95IGZvcg0KPiB5b3VyIHB1
cnBvc2UuDQoNCkFoIHJpZ2h0IHRoaXMgaXMgYSBwcm9ibGVtLiBJIHdhcyB3b3JraW5nIG9uIGEg
dHJlZSB3aGVyZSBldmVyeW9uZSBoYXMNCmEgbWFwY2FjaGUsIHdoaWNoIGlzIG5vdCB0cnVlIGZv
ciBjdXJyZW50IHVwc3RyZWFtIHdoZW4gSSBjaGVycnktDQpwaWNrZWQuIFdpbGwgZml4Lg0KDQpI
b25neWFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
