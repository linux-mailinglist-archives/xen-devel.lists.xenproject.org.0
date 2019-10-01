Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE1EC31E2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:59:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFqU-0006vZ-M0; Tue, 01 Oct 2019 10:57:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFFqT-0006vU-M4
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:57:29 +0000
X-Inumbo-ID: 425a7ebc-e43a-11e9-96f7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 425a7ebc-e43a-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569927448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=skHPFdknwcHgmcV95H7cyh5RLQmQGzppxIdhzn/Mr1s=;
 b=UYlYlNKcSWqh3WarWKEDytWG1PVJRnnf6PS/GVMpRVLrHSiNZaljdNjJ
 ibzL8JZN315g6+4eNPeaNzymIvfWlvjd5/7UGPrjxIq0OQAHLKKBgAOuC
 7Pp+yMML5GNHqGdST4pq1BtIlRwnqMguWj+IGIjlJCsLYt910AP6DItBj 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PGN6oaUctdKumM/mPmywwp3H90TZbfaRYHV2G09aEWUwFjE63GgDfGWPw94gYvCFdyOXTI6Dr6
 4Es3MoOHR+trOY73SNv2Ebi1bLdfPZl+PkIPLec+MSoAUM0FOnl525GBjdkwssvjfmFBmtBPlF
 uPkysdUBP7Q3tFcbYij7GJ6b0HL0A0ehOKhgP76OwEIPRlU8ShKXyKes2DbmzedZEso0CYcHBz
 sAS2ZYGMBfgg8tJkFwMXuND+RiWAI75ihVLPN8G1dKZOgGPmnnroizhYekv2jYUAgaaWZFL0BF
 BzY=
X-SBRS: 2.7
X-MesageID: 6540915
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6540915"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
Thread-Index: AQHVeDIwRG0o+S2xK02nqNXtlOqU5KdFV3YAgAAisFD//+aCgIAAJMzQ///q0QCAACM5wP//4i+AAAROh5D//+IGAP//3jSA
Date: Tue, 1 Oct 2019 10:57:25 +0000
Message-ID: <153610a687a343ea9b50e2152fe3e47b@AMSPEX02CL03.citrite.net>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
 <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
 <b944e15f-5adc-4597-9bb0-a010445a6af5@suse.com>
 <dd43ad524f7c457eae6dbf74ec3a6547@AMSPEX02CL03.citrite.net>
 <352b04a5-52b4-4ab1-fa3c-41f93f566c47@suse.com>
 <728628bd673a405fbf9a37efeef01a2a@AMSPEX02CL03.citrite.net>
 <0e45cdd1-7f52-0e31-e732-9351d498f13a@citrix.com>
 <c2dff4f9265543629288d6cd64a6ddce@AMSPEX02CL03.citrite.net>
 <f0153ab0-84b7-65e6-ad1d-4de06052034a@suse.com>
In-Reply-To: <f0153ab0-84b7-65e6-ad1d-4de06052034a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAxIE9jdG9iZXIgMjAxOSAxMTo1MA0KPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdl
b3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBSb2dlciBQYXUNCj4gTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+OyBXZWkgTGl1DQo+IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0g
W1BBVENILWZvci00LjEzXSB4ODYvbW06IGRvbid0IG5lZWRsZXNzbHkgdmV0byBtaWdyYXRpb24N
Cj4gDQo+IE9uIDAxLjEwLjIwMTkgMTI6NDAsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4gRnJv
bTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KPiA+PiBTZW50OiAw
MSBPY3RvYmVyIDIwMTkgMTE6MzQNCj4gPj4NCj4gPj4gT25lIHRoaW5nIHdlIGNvdWxkIGltYWdp
bmUgaXMgdGhhdCB3aGVuIHNwZWNpZmljIGRldmljZXMgaGF2ZSBhbiBhY3RpdmUNCj4gPj4gZW11
bGF0b3IgKG9yIHdoYXRldmVyKSBwcm9wYWdhdGluZyB0aGUgZGlydHkgaW5mb3JtYXRpb24sIGZv
ciB0aGF0IGNvZGUNCj4gPj4gdG8gdGVsbCBYZW4sICJJIGFtIGltcGxlbWVudGluZyBkaXJ0eSB0
cmFja2luZyBmb3IgdGhpcyBkZXZpY2UiLiAgVGhlbg0KPiA+PiB3aGVuIHRoZSB0b29sc3RhY2sg
ZW5hYmxlcyBsb2dkaXJ0eSwgdGhlIGNoZWNrIGNhbiBiZSwgIkFyZSB0aGVyZSBhbnkNCj4gPj4g
ZGV2aWNlcyAqdGhhdCBkb24ndCBoYXZlIGV4dGVybmFsIGRpcnR5IHRyYWNraW5nIGVuYWJsZWQq
IGFzc2lnbmVkIHRvDQo+ID4+IHRoZSBndWVzdD8iDQo+ID4NCj4gPiBBbmQgd2hhdCBhYm91dCBl
eGlzdGluZyBlbXVsYXRvcnMgc2V0dGluZyBwYWdlcyBkaXJ0eSBhdCB0aGUgbW9tZW50PyBJDQo+
ID4gZG9uJ3Qgc2VlIHdoeSBYZW4ncyBpbnRlcm5hbCBkaXJ0eSBwYWdlIGxvZ2dpbmcgaXMgY29u
c2lkZXJlZCBkZWZpbml0aXZlDQo+ID4gYmVjYXVzZSBBRkFJQ1QgdGhhdCBpcyByZWFsbHkgbm90
IHRoZSBjYXNlIGV2ZW4gbm93Lg0KPiANCj4gSSBkb24ndCB0aGluayBleHRlcm5hbCBlbXVsYXRv
cnMgYWxyZWFkeSBzZXR0aW5nIHBhZ2VzIGRpcnR5IG1hdHRlciBoZXJlLg0KPiBBbGwgdGhleSB3
YW50L25lZWQgdG8gZG8gaXMgYWR2ZXJ0aXNlIHdoaWNoIGRldmljZShzKSB0aGV5IHRha2UgY2Fy
ZSBvZi4NCj4gVGhlc2UgZW11bGF0b3JzIGFjdHVhbGx5IF9oZWxwXyBYZW4gbWFpbnRhaW4gYSBj
b3JyZWN0IHBpY3R1cmUuIFdoYXQgeW91cg0KPiBwYXRjaCBpbW8gZG9lcyB0aG91Z2ggaXMgKGZ1
cnRoZXIpIHdlYWtlbiB0aGUgY3VycmVudCBtb2RlbC4NCj4gDQoNCldlbGwgdGhhdCdzIHdoZXJl
IHdlIGRpc2FncmVlLiBJIGRvbid0IHRoaW5rIHRoZSBoeXBlcnZpc29yIGN1cnJlbnRseSBpcyB0
aGUgYXV0aG9yaXRhdGl2ZSBzb3VyY2Ugb2YgaW5mb3JtYXRpb24gb24gdGhlIHN0YXRlIG9mIHRo
ZSBkb21haW4uIElNTyB0aGF0IGlzIHdoYXQgdGhlIHRvb2xzdGFjayBpcyBmb3IgYW5kIFhlbiBz
aG91bGQgbm90IGJlIHJlZnVzaW5nIHRvIHByb3ZpZGUgaXRzIGlucHV0IHRvIHRoZSBkaXJ0eSBw
YWdlIHRyYWNraW5nIGluZm9ybWF0aW9uIHNpbXBseSBiZWNhdXNlIGl0IG1heSBub3QgaGF2ZSB0
aGUgY29tcGxldGUgcGljdHVyZS4NCg0KICBQYXVsDQoNCj4gSmFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
