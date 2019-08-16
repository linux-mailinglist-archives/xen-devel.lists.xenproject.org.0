Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A19B90142
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:20:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybAf-0000z3-CE; Fri, 16 Aug 2019 12:17:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4MO=WM=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hybAe-0000yw-2P
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 12:17:28 +0000
X-Inumbo-ID: cf375fa6-c01f-11e9-b90c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf375fa6-c01f-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 12:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565957846;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2ZahQLGApqkoUbc70jL1NybZSU+cigPVaWAKI6R90ZU=;
 b=gphj3L8i/194kc4vM9eWA+SUPxQtPR/mKG5NJu18G89l9idP8XY6ppT3
 8yC5UtA7BV7Icjer8uq6TJlnNONUoEs+BPV/JNdlsfSQNm6C/gu2amcYp
 o4yc6f0+pGp1EOT/OWC8uVhicKtjrKJA+ERqvY3Jh0dipAAuiAsXa9fbt A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gV6ElFG1Yq8HUD9RE4fQIhzAcAx0K9MyTWHYwjLRJx47L9OCGp6+SJ3de/SujjJbaXIF7SGHtl
 Uz9lknGwsbGUlkFGa6Q6C0xlWJIRPt6ei2uRGg9C+ZQbQ4tyQTb36m1g+iJESFQyNE0h7fqrs2
 KjriHRoEzJX3AcrC3sS6cvDHtunT4/VtxmtROAN5Pxojxbp5IuYd1ivsYJsT3SSWolNV6uAgNy
 zH595zvTrOU7KpSDaVTJU0q1EXsFF3eG858smgoBoH8iVz3IL8q4yrR5Pkx/nhaLuyzDqJ5r45
 72U=
X-SBRS: 2.7
X-MesageID: 4549513
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,393,1559534400"; 
   d="scan'208";a="4549513"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] Allow get_maintainer.pl / add_maintainers.pl scripts
 to be called outside of xen.git
Thread-Index: AQHVU44dY7Y8dcp5cU29lyjYLE0r26b9almAgAA24wA=
Date: Fri, 16 Aug 2019 12:17:22 +0000
Message-ID: <E16EC776-8DAC-439A-9FF9-E5DF1F18206B@citrix.com>
References: <20190815172256.34363-1-lars.kurth@citrix.com>
 <348ae310-a048-0e96-dc12-981f96450a5f@arm.com>
In-Reply-To: <348ae310-a048-0e96-dc12-981f96450a5f@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <3674A2CE6076E645AB6FE3C830086FEE@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] Allow get_maintainer.pl /
 add_maintainers.pl scripts to be called outside of xen.git
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE2LzA4LzIwMTksIDExOjAxLCAiSnVsaWVuIEdyYWxsIiA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOg0KDQogICAgSGkgTGFycywNCiAgICANCiAgICBUaGFuayB5b3UgZm9y
IHRoZSBwYXRjaC4NCiAgICANCiAgICBPbiAxNS8wOC8yMDE5IDE4OjIyLCBMYXJzIEt1cnRoIHdy
b3RlOg0KICAgID4gVXNlLWNhc2U6IEFsbG93IHVzaW5nIGJvdGggc2NyaXB0cyBvbiB4ZW4gcmVw
b3NpdG9yaWVzIHN1Y2ggYXMNCiAgICA+IG1pbmktb3MuZ2l0LCBvc3N0ZXN0LmdpdCwNCiAgICA+
IA0KICAgID4gVG9vbCBjaGFuZ2VzOg0KICAgID4gKiBhZGRfbWFpbnRhaW5lcnMucGw6ICRnZXRf
bWFpbnRhaW5lciBpbmhlcml0cyBwYXRoIGZyb20gJDANCiAgICA+ICogZ2V0X21haW50YWluZXIu
cGw6IHdhcm4gKGluc3RlYWQgZm8gZGllKSB3aGVuIGNhbGxlZA0KICAgID4gICAgZnJvbSBhIGRp
ZmZlcmVudCB0cmVlDQogICAgPiANCiAgICA+IEFzc3VtcHRpb25zOiB0aGUgcmVwb3NpdG9yeSBj
b250YWlucyBhIE1BSU5UQUlORVJTIGZpbGUgdGhhdA0KICAgID4gZm9sbG93cyB0aGUgc2FtZSBj
b252ZW50aW9ucyBhcyB0aGUgZmlsZSBpbiB4ZW4uZ2l0DQogICAgPiANCiAgICA+IEEgc3VnZ2Vz
dGVkIHRlbXBsYXRlDQogICAgPiANCiAgICA+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQogICAgPiBUaGlzIGZpbGUgZm9sbG93cyB0aGUg
c2FtZSBjb252ZW50aW9ucyBhcyBvdXRsaW5lZCBpbg0KICAgID4geGVuLmdpdDpNQUlOVEFJTkVS
Uy4gUGxlYXNlIHJlZmVyIHRvIHRoZSBmaWxlIGluIHhlbi5naXQNCiAgICA+IGZvciBtb3JlIGlu
Zm9ybWF0aW9uLg0KICAgID4gDQogICAgPiBUSEUgUkVTVA0KICAgID4gTToJTUFJTlRBSU5FUjEg
PG1haW50YWluZXIxQGVtYWlsLmNvbT4NCiAgICA+IE06ICAgICAgTUFJTlRBSU5FUjIgPG1haW50
YWluZXIyQGVtYWlsLmNvbT4NCiAgICA+IEw6CXhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zw0KICAgID4gUzoJU3VwcG9ydGVkDQogICAgPiBGOgkqLw0KICAgID4gPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCiAgICA+IA0KICAgID4g
U2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KICAgID4g
LS0tDQogICAgPiAgIHNjcmlwdHMvYWRkX21haW50YWluZXJzLnBsIHwgIDQgKystLQ0KICAgID4g
ICBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsICB8IDEzICsrKysrKysrKysrLS0NCiAgICA+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KICAgID4g
DQogICAgPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9hZGRfbWFpbnRhaW5lcnMucGwgYi9zY3JpcHRz
L2FkZF9tYWludGFpbmVycy5wbA0KICAgID4gaW5kZXggMDllOWY2NjA5Zi4uNWE2ZDBmNjMxYiAx
MDA3NTUNCiAgICA+IC0tLSBhL3NjcmlwdHMvYWRkX21haW50YWluZXJzLnBsDQogICAgPiArKysg
Yi9zY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbA0KICAgID4gQEAgLTI2LDkgKzI2LDkgQEAgc3Vi
IGluc2VydCAoJCQkJCk7DQogICAgPiAgIHN1YiBoYXN0YWcgKCQkKTsNCiAgICA+ICAgDQogICAg
PiAgICMgVG9vbCBWYXJpYWJsZXMNCiAgICA+IC1teSAkZ2V0X21haW50YWluZXIgICAgICA9ICIu
L3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwiOw0KICAgID4gLQ0KICAgID4gICBteSAkdG9vbCA9
ICQwOw0KICAgID4gK215ICRnZXRfbWFpbnRhaW5lciA9ICR0b29sOw0KICAgID4gKyRnZXRfbWFp
bnRhaW5lciA9fiBzL2FkZF9tYWludGFpbmVycy9nZXRfbWFpbnRhaW5lci87DQogICAgPiAgIG15
ICR1c2FnZSA9IDw8RU9UOw0KICAgID4gICBPUFRJT05TOg0KICAgID4gICAtLS0tLS0tLQ0KICAg
ID4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwgYi9zY3JpcHRzL2dldF9t
YWludGFpbmVyLnBsDQogICAgPiBpbmRleCAxNzRkZmI3ZTQwLi5mMWU5YzkwNGVlIDEwMDc1NQ0K
ICAgID4gLS0tIGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbA0KICAgID4gKysrIGIvc2NyaXB0
cy9nZXRfbWFpbnRhaW5lci5wbA0KICAgID4gQEAgLTI2Niw4ICsyNjYsMTcgQEAgaWYgKCRlbWFp
bCAmJg0KICAgID4gICB9DQogICAgPiAgIA0KICAgID4gICBpZiAoIXRvcF9vZl90cmVlKCR4ZW5f
cGF0aCkpIHsNCiAgICA+IC0gICAgZGllICIkUDogVGhlIGN1cnJlbnQgZGlyZWN0b3J5IGRvZXMg
bm90IGFwcGVhciB0byBiZSAiDQogICAgPiAtCS4gImEgWGVuIHNvdXJjZSB0cmVlLlxuIjsNCiAg
ICA+ICsgICAgIyBEbyBub3QgZXhpdCwgYnV0IHByaW50IGFuIGVycm9yIG1lc3NhZ2UgdG8gU1RE
RVJSIHRvIGFsbG93IGNhbGxpbmcNCiAgICA+ICsgICAgIyB0aGUgdG9vbCBmcm9tIHhlbi1yZWxh
dGVkIHJlcG9zIHN1Y2ggYXMgbWluaS1vcy5naXQsDQogICAgPiArICAgICMgbGl2ZSBwYXRjaC1i
dWlsZC10b29scy5naXQsIGV0Yw0KICAgID4gKyAgICBwcmludCBTVERFUlIgIiRQOlxuIi4NCiAg
ICA+ICsgICAgICAgICAgIj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09XG4iLg0KICAgID4gKyAgICAgICAgICAiV0FSTklORzogVGhlIGN1cnJlbnQg
ZGlyZWN0b3J5IGRvZXMgbm90IGFwcGVhciB0byBiZSBcbiIuDQogICAgPiArCSAgInRoZSB4ZW4u
Z2l0IHNvdXJjZSB0cmVlLlxuXG4iLg0KICAgID4gKyAgICAgICAgICAiVGhlIHRvb2wgd29ya3Mg
b3V0c2lkZSBvZiB0aGUgeGVuLmdpdCB0cmVlLCBpZiB0aGVcbiIuDQogICAgPiArICAgICAgICAg
ICJNQUlOVEFJTkVSUyBmaWxlIGZvbGxvd3MgdGhlIHNhbWUgZm9ybWF0IGFzIHRoYXQgb2ZcbiIu
DQogICAgPiArICAgICAgICAgICJ4ZW4uZ2l0LiBVc2UgYXQgeW91ciBvd24gcGVyaWwuXG4iLg0K
ICAgID4gKyAgICAgICAgICAiPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT1cbiI7DQogICAgDQogICAgIEZyb20gbXkgdW5kZXJzdGFuZGluZywgYW55
IHVzZSBvbiBtaW5pLW9zLmdpdCAmIGNvIHdpbGwgYmUgbGVnaXRpbWF0ZS4gSG93ZXZlciwgDQog
ICAgd2Ugc3RpbGwgcHJpbnQgdGhlIFdBUk5JTkcgaW4gdGhvc2UgY2FzZXMuDQogICAgDQogICAg
VXN1YWxseSBXQVJOSU5HIG1lYW5zIHNvbWV0aGluZyBuZWVkcyBhdHRlbnRpb24uIEFzIG1vc3Qg
b2YgdGhlIHVzZXJzIHdpbGwgDQogICAgbGlrZWx5IGNvcHkvcGFzdGUgZnJvbSB0aGUgd2lraSwg
d2UgYXJlIGdvaW5nIHRvIGhhdmUgcmVwb3J0IGFza2luZyB3aHkgdGhlIA0KICAgIFdBUk5JTkcg
aXMgdGhlcmUuDQogICAgDQogICAgSSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIHRyeSB0
byBkb3duZ3JhZGUgdGhlIG1lc3NhZ2UgYSBiaXQgd2hlbiBwb3NzaWJsZS4gDQogICAgRm9yIGlu
c3RhbmNlLCB3ZSBjb3VsZCBjaGVjayBpZiB0aGUgc2VjdGlvbiAiVEhFIFJFU1QiIGlzIHByZXNl
bnQgaW4gdGhlIGZpbGUgDQogICAgTUFJTlRBSU5FUlMuIElmIG5vdCwgdGhpcyBpcyBsaWtlbHkg
bm90IGEgZmlsZSB3ZSBhcmUgYWJsZSB0byBzdXBwb3J0Lg0KICAgIA0KSSB0aG91Z2h0IGFib3V0
IHRoaXMgYW5kIGl0IGlzIG5vdCBhcyBlYXN5IGFzIGl0IHNlZW1zLCBiZWNhdXNlIHRoZSBzY3Jp
cHQgb25seSBwYXJzZXMNCk06IC4uLiAmYyBsaW5lcw0KDQpNYXliZSB0aGUgYmVzdCB3YXkgdG8g
YWRkcmVzcyB0aGlzIHdvdWxkIGJlIHRvIGluY2x1ZGUgc29tZSBpZGVudGlmaWVyIGludG8gdGhl
DQpNQUlOVEFJTkVSUyBmaWxlIChhZnRlciB0aGUgaGVhZGVyIHdpdGggYWxsIHRoZSBkZWZpbml0
aW9ucykuIA0KDQpGT1JNQVQ6IHhlbi1wcm9qZWN0LW1haW50YWluZXJzIDx2ZXJzaW9uPiAgDQoo
bm90ZSB0aGF0IHRoaXMgaXMgbm90IGN1cnJlbnRseSBwaWNrZWQgdXAgYnkgdGhlIHRvb2wpDQoN
Ck9yDQoNClY6IHhlbi1wcm9qZWN0LW1haW50YWluZXJzIDx2ZXJzaW9uPiAgDQoobm90ZSB0aGF0
IHRoaXMgd291bGQgYmUgcGlja2VkIHVwIGJ5IHRoZSB0b29sKQ0KDQpUaGVuIGFueSBjb21wbGlh
bnQgdmVyc2lvbiBpcyBlYXNpbHkgaWRlbnRpZmlhYmxlIGFuZCB0aGUgd2FybmluZyBjYW4gYmUg
c3VwcmVzc2VkLg0KDQpUaGF0IHdvdWxkIG1ha2UgbWFpbnRhaW5lcnMgbG9vayBsaWtlIA0KDQo9
PT09PT09PT09PT0NCi4uLi4NClY6ICB4ZW4tcHJvamVjdC1tYWludGFpbmVycyAxLjYNCg0KQUNQ
SQ0KTToJSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiAgDQouLi4NCj09PT09PT09PT09
PQ0KDQpUaGlzIHNlZW1zIHRvIGJlIG1vcmUgb2YgYSBjYW4gb2Ygd29ybXMgdGhhbiBJIHRob3Vn
aHQuDQoNCkNoZWVycw0KTGFycw0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
