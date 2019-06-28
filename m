Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCAE5A591
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 22:04:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgx40-0003Fm-2T; Fri, 28 Jun 2019 20:01:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L6H4=U3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hgx3y-0003FF-7N
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 20:01:38 +0000
X-Inumbo-ID: 87f673cc-99df-11e9-9c93-0bd24563e416
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87f673cc-99df-11e9-9c93-0bd24563e416;
 Fri, 28 Jun 2019 20:01:35 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ujgnNLqoq2co5GQVG+E2EY8orpWGIxjM+xLZPX/HrILul332rK5vx+65FCb265ote+fio7kgkg
 7tvONltHSLwIQ5qx52NzVzv0w8nOxA/wGaJrBleUEa3Lhv0OOfkiPsHoZaLpCEgsGkoAaHqgFn
 nyM348nVADoO6AuSNjIl9GWsT/+67kI4YbY7CWKfzq/DPEmg7NEJabiMzv477u1koWLE53c6LR
 aww8gh/aSHMNx9n2fNci1aFlp41R8DItRP/28kOOXvVIV84Y3RQSTUQ/g+ajD+WtvZsWQ28vb+
 3Ts=
X-SBRS: 2.7
X-MesageID: 2402594
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,428,1557201600"; 
   d="scan'208";a="2402594"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nicolas Belouin <nicolas.belouin@gandi.net>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] golang/xenlight: Add libxl_utils support
Thread-Index: AQHVLYvHEU6KjG4cT0aCzUsgCJvyEKaxMkeAgAApqYA=
Date: Fri, 28 Jun 2019 20:01:31 +0000
Message-ID: <F808B1B6-DEC4-4687-BE45-7B20360603DB@citrix.com>
References: <20190628082508.32509-1-nicolas.belouin@gandi.net>
 <810e4e95-a22a-217b-9c8f-03475b40da0f@citrix.com>
In-Reply-To: <810e4e95-a22a-217b-9c8f-03475b40da0f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <339A73AB7809134AB312E7B5A2BAE419@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] golang/xenlight: Add libxl_utils support
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDI4LCAyMDE5LCBhdCA1OjMyIFBNLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gNi8yOC8xOSA5OjI1IEFNLCBOaWNv
bGFzIEJlbG91aW4gd3JvdGU6DQo+PiBUaGUgR28gYmluZGluZ3MgZm9yIGxpYnhsIG1pc3MgZnVu
Y3Rpb25zIGZyb20gbGlieGxfdXRpbHMsIGxldCdzIHN0YXJ0DQo+PiB3aXRoIHRoZSBzaW1wbGUg
bGlieGxfZG9taWRfdG9fbmFtZSBhbmQgaXRzIGNvdW50ZXJwYXJ0DQo+PiBsaWJ4bF9uYW1lX3Rv
X2RvbWlkLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGFzIEJlbG91aW4gPG5pY29sYXMu
YmVsb3VpbkBnYW5kaS5uZXQ+DQo+IA0KPiBKdXN0IGZvciBmdXR1cmUgcmVmZXJlbmNlLCBiZWxv
dyB5b3VyIFNvQiwgaXQncyBnb29kIHByYWN0aWNlIHRvIHB1dCBhDQo+IGAtLS1gIGxpbmUgKGJl
bG93IHdoaWNoIGV2ZXJ5dGhpbmcgd2lsbCBiZSBpZ25vcmVkKSwgYW5kIGEgbGlzdCBvZiB0aGUN
Cj4gY2hhbmdlcyB5b3UgbWFkZS4gIEUuZyw6DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGFz
IEJlbG91aW4gPG5pY29sYXMuYmVsb3VpbkBnYW5kaS5uZXQ+DQo+IC0tLQ0KPiB2MjoNCj4gLSBE
b24ndCBsZWFrIEMgc3RyaW5nIHJldHVybmVkIGJ5IGxpYnhsX2RvbWlkX3RvX25hbWUNCj4gDQo+
IE9uZSBtb3JlIHRoaW5nLi4uDQo+IA0KPj4gKy8vY2hhciogbGlieGxfZG9taWRfdG9fbmFtZShs
aWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQpOw0KPj4gK2Z1bmMgKEN0eCAqQ29udGV4dCkg
RG9taWRUb05hbWUoaWQgRG9taWQpIChuYW1lIHN0cmluZykgew0KPj4gKwljRG9tTmFtZSA6PSBD
LmxpYnhsX2RvbWlkX3RvX25hbWUoQ3R4LmN0eCwgQy51aW50MzJfdChpZCkpDQo+PiArCWRlZmVy
IEMuZnJlZSh1bnNhZmUuUG9pbnRlcihjRG9tTmFtZSkpDQo+PiArDQo+PiArCW5hbWUgPSBDLkdv
U3RyaW5nKGNEb21OYW1lKQ0KPiANCj4gbGlieGxfZG9taWRfdG9fbmFtZSgpIHJldHVybnMgTlVM
TCBpZiBkb21pZCBkb2Vzbid0IGV4aXN0LiAgV2lsbCB0aGlzDQo+IGNvZGUgRFRSVCAocmV0dXJu
aW5nICduaWwnIGluIHRoYXQgY2FzZSk/ICBPciB3aWxsIGl0IGNyYXNoIC8gZG8NCj4gc29tZXRo
aW5nIGVsc2U/DQo+IA0KPiBJIGNvdWxkbid0IGFjdHVhbGx5IGZpbmQgdGhlIGFuc3dlciBpbiBh
IHF1aWNrIHNlYXJjaCBmb3IgdGhlDQo+IGRvY3VtZW50YXRpb24uICBBbnkgY2hhbmNlIHlvdSBj
b3VsZCBidWlsZCBhIHRlc3QgcHJvZ3JhbSB0byBzZWUgd2hhdA0KPiBoYXBwZW5zPw0KPiANCj4g
QWx0ZXJuYXRlbHksIHdlIGNvdWxkIHBsYXkgaXQgc2FmZSBhbmQgYWx3YXlzIGNoZWNrIGNEb21O
YW1lIGZvciBgbmlsYA0KPiBiZWZvcmUgcGFzc2luZyBpdCB0byBDLkdvU3RyaW5nKCkuDQoNCkkg
anVzdCBhc2tlZCwgYW5kIGl0IHR1cm5zIG91dCBpZiBDLkdvU3RyaW5nKCkgaXMgcGFzc2VkIGEg
bmlsIHBvaW50ZXIsIGl0IHJldHVybnMgdGhlIGVtcHR5IHN0cmluZyAo4oCc4oCdKSwgd2hpY2gg
aXMgd2hhdCB3ZSB3YW50LiAgSXTigJlzIG5vdCBkb2N1bWVudGVkIHlldCwgYnV0IHRoZXJl4oCZ
cyBhIHRpY2tldCB0byBkb2N1bWVudCBpdCBzb29uLg0KDQpodHRwczovL2dpdGh1Yi5jb20vZ29s
YW5nL2dvL2lzc3Vlcy8zMjczNA0KDQpTbyB0aGlzIGlzIHJlYWR5IHRvIGdvIGluOg0KDQpSZXZp
ZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
