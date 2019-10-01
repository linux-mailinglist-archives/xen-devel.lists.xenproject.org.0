Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A86D0C3069
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:40:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEaY-0006o5-Cb; Tue, 01 Oct 2019 09:36:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFEaW-0006o0-U1
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:36:57 +0000
X-Inumbo-ID: 009b55b0-e42f-11e9-96f7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 009b55b0-e42f-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569922613;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ToX8mOG/rLQc8AbElbFILsaClSzafjfnOiVzui95QuE=;
 b=UWY4SHfa09xHquZpFirhdW1m2oA8DT7Y09+u883koOo32PYMpJQHkeMh
 RxR4zSXP2DAK/FZw2OnPZksjoQmNuMftvcqbUB3hdByDCjX3A3LM3mJSM
 ckV9jSRL3sdSXGYUjWB9nwX2XdVvGtoHHA+T/WUniSp01QCAVMdG1bOpi 0=;
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
IronPort-SDR: Jtmj2U79XpL0vwJYiULzojDCW3tfPGSXjOdjX7tTAP4G+bcbCbwK0JopBWrn/S5h8sywucdX7m
 yI8cvbrtWc5m4LlbHYxe5UxsS5Es5tA7ey8OUQxZnyfes/2Z28PT30ZUzwZQ2HxHmgXMuma/JY
 zJoIRCqceDyj7mFyVhPJaxH5bX88ar4d+Y9luaFAKS7ZZ955r7SWnGLVsdT0/7E5xh/Zxvsx5g
 x4LT7tyQErSHAUqGhxlQVkOmywcEEeZbm8LBbZPOLsJYKTDW8EWX11vuH0qS2S0Hix9q4WkgMX
 a2s=
X-SBRS: 2.7
X-MesageID: 6538326
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6538326"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
Thread-Index: AQHVeDIwRG0o+S2xK02nqNXtlOqU5KdFV3YAgAAisFD//+aCgIAAJMzQ
Date: Tue, 1 Oct 2019 09:36:49 +0000
Message-ID: <dd43ad524f7c457eae6dbf74ec3a6547@AMSPEX02CL03.citrite.net>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
 <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
 <b944e15f-5adc-4597-9bb0-a010445a6af5@suse.com>
In-Reply-To: <b944e15f-5adc-4597-9bb0-a010445a6af5@suse.com>
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAxIE9jdG9iZXIgMjAxOSAxMDoxOQ0KPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IEFuZHJldyBDb29wZXIgPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNp
dHJpeC5jb20+OyBSb2dlciBQYXUNCj4gTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+OyBXZWkgTGl1DQo+IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0g
W1BBVENILWZvci00LjEzXSB4ODYvbW06IGRvbid0IG5lZWRsZXNzbHkgdmV0byBtaWdyYXRpb24N
Cj4gDQo+IE9uIDAxLjEwLjIwMTkgMTA6NTIsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiA+PiBTZW50OiAwMSBPY3RvYmVyIDIwMTkgMDk6NDYNCj4gPj4gVG86IFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+DQo+ID4+IENjOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJp
eC5jb20+OyBSb2dlciBQYXUgTW9ubmUNCj4gPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPjsNCj4gV2VpDQo+ID4+IExpdSA8d2xAeGVuLm9yZz4NCj4gPj4gU3ViamVj
dDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSC1mb3ItNC4xM10geDg2L21tOiBkb24ndCBuZWVkbGVz
c2x5IHZldG8gbWlncmF0aW9uDQo+ID4+DQo+ID4+IE9uIDAxLjEwLjIwMTkgMTA6MjgsIFBhdWwg
RHVycmFudCB3cm90ZToNCj4gPj4+IE5vdyB0aGF0IHhsLmNmZyBoYXMgYW4gb3B0aW9uIHRvIGV4
cGxpY2l0bHkgZW5hYmxlIElPTU1VIG1hcHBpbmdzIGZvciBhDQo+ID4+PiBkb21haW4sIG1pZ3Jh
dGlvbiBtYXkgYmUgbmVlZGxlc3NseSB2ZXRvZWQgZHVlIHRvIHRoZSBjaGVjayBvZg0KPiA+Pj4g
aXNfaW9tbXVfZW5hYmxlZCgpIGluIHBhZ2luZ19sb2dfZGlydHlfZW5hYmxlKCkuDQo+ID4+PiBU
aGVyZSBpcyBhY3R1YWxseSBubyBuZWVkIHRvIHByZXZlbnQgbG9nZGlydHkgZnJvbSBiZWluZyBl
bmFibGVkIHVubGVzcw0KPiA+Pj4gZGV2aWNlcyBhcmUgYXNzaWduZWQgdG8gYSBkb21haW4gYW5k
IHRoYXQgZG9tYWluIGlzIHNoYXJpbmcgSEFQIG1hcHBpbmdzDQo+ID4+PiB3aXRoIHRoZSBJT01N
VSAoaW4gd2hpY2ggY2FzZSBkaXNhYmxpbmcgd3JpdGUgcGVybWlzc2lvbnMgaW4gdGhlIFAyTSBt
YXkNCj4gPj4+IGNhdXNlIERNQSBmYXVsdHMpLg0KPiA+Pg0KPiA+PiBCdXQgdGhhdCdzIHRha2lu
ZyBpbnRvIGFjY291bnQgb25seSBoYWxmIG9mIHRoZSByZWFzb24gb2YgdGhlDQo+ID4+IGV4Y2x1
c2lvbi4gVGhlIG90aGVyIGhhbGYgaXMgdGhhdCBhc3NpZ25lZCBkZXZpY2VzIG1heSBjYXVzZSBw
YWdlcw0KPiA+PiB0byBiZSBkaXJ0aWVkIGJlaGluZCB0aGUgYmFjayBvZiB0aGUgbG9nLWRpcnR5
IGxvZ2ljLg0KPiA+DQo+ID4gQnV0IHRoYXQncyBubyByZWFzb24gdG8gdmV0byBsb2dkaXJ0eS4g
U29tZSBkZXZpY2VzIGhhdmUgZHJpdmVycyAoaW4gZG9tMCkNCj4gPiB3aGljaCBjYW4gZXh0cmFj
dCBETUEgZGlydHlpbmcgaW5mb3JtYXRpb24gYW5kIHNldCBkaXJ0eSB0cmFja2luZw0KPiA+IGlu
Zm9ybWF0aW9uIGFwcHJvcHJpYXRlbHkuDQo+IA0KPiBJdCBzdGlsbCBuZWVkcyBhIHBvc2l0aXZl
IGlkZW50aWZpY2F0aW9uIHRoZW46IFN1Y2ggZHJpdmVycyBzaG91bGQgdGVsbA0KPiBYZW4gZm9y
IHdoaWNoIHNwZWNpZmljIGRldmljZXMgc3VjaCBpbmZvcm1hdGlvbiBpcyBnb2luZyB0byBiZSBw
cm92aWRlZC4NCg0KV2h5IGRvZXMgdGhlIGh5cGVydmlzb3IgbmVlZCBoYXZlIHRoZSByaWdodCBv
ZiB2ZXRvIHRob3VnaD8gU3VyZWx5IGl0IGlzIHRoZSB0b29sc3RhY2sgdGhhdCBzaG91bGQgZGVj
aWRlIHdoZXRoZXIgYSBWTSBpcyBtaWdyYXRhYmxlIGluIHRoZSBwcmVzZW5jZSBvZiBhc3NpZ25l
ZCBoL3cuIFhlbiBuZWVkIG9ubHkgYmUgY29uY2VybmVkIHdpdGggdGhlIGludGVncml0eSBvZiB0
aGUgaG9zdCwgd2hpY2ggaXMgd2h5IHRoZSBjaGVjayBmb3IgRVRQIHNoYXJpbmcgcmVtYWlucy4N
Cg0KPiBJIGFsc28gd29uZGVyIHdoYXQgaW50ZXJmYWNlIEkgd291bGQgaGF2ZSBmb3Jnb3QgYWJv
dXQgdGhhdCB3b3VsZCBhbGxvdw0KPiBzdWNoIGEgZHJpdmVyIHRvIHByb3BhZ2F0ZSBkaXJ0eWlu
ZyBpbmZvcm1hdGlvbiBpbiB0aGUgZmlyc3QgcGxhY2U6DQo+IFhFTl9ETU9QX21vZGlmaWVkX21l
bW9yeSBpcyBmb3IgZW11bGF0b3JzIG9ubHkgYWl1aSwgYW5kIGRvZXMgbm90IHByb3ZpZGUNCj4g
YSBtZWFucyBmb3IgWGVuIHRvIGFjdGl2ZWx5IHF1ZXJ5IGRpcnRpZWQgc3RhdGUgKG9yIHJlcXVl
c3QgdXBkYXRpbmcNCj4gdGhlcmVvZikgb2YgcGFnZXMgb3duZWQgYnkgYSBkb21haW4gKGFzIHdv
dWxkIGJlIG5lZWRlZCBhdCBsZWFzdCBvbiB0aGUNCj4gWEVOX0RPTUNUTF9TSEFET1dfTE9HRElS
VFlfRklOQUwgaW52b2NhdGlvbikuDQoNClhFTl9ETU9QX21vZGlmaWVkX21lbW9yeSBpcyBpbmRl
ZWQgdGhlIGludGVyZmFjZS4gQWZ0ZXIgZWFjaCByb3VuZCBvZiBsaXZlIG1lbW9yeSBjb3B5LCB0
aGUgdG9vbHN0YWNrIGNhbiB1c2UgYW4gJ2VtdWxhdG9yJyBwcm9jZXNzIHJ1bm5pbmcgaW4gZG9t
MCB0byBxdWVyeSB0aGUgYXNzaWduZWQgZGV2aWNlIGZvciBwYWdlcyBkaXJ0aWVkIGJ5IERNQSBh
bmQgdGhlbiBhZGQgdGhvc2UgaW50byB0aGUgc2V0IG9mIHBhZ2VzIHRvIGJlIGNvcGllZCBpbiB0
aGUgbmV4dCByb3VuZC4gU2ltaWxhcmx5LCBwcmlvciB0byBmaW5hbCBtZW1vcnkgY29weSwgdGhl
IGRldmljZXMgaXMgcXVpZXNjZWQgKGkuZS4gYnVzIG1hc3RlciBpdCB0dXJuZWQgb2ZmKSBhbmQg
dGhlbiB0aGUgZmluYWwgc2V0IG9mIGRpcnRpZWQgcGFnZXMgaXMgZGV0ZXJtaW5lZC4NCg0KIFBh
dWwNCg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
