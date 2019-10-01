Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF6C31B0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:43:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFaU-0005Xe-Ft; Tue, 01 Oct 2019 10:40:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFFaS-0005XW-Rg
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:40:56 +0000
X-Inumbo-ID: f1c3e383-e437-11e9-96f7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id f1c3e383-e437-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 10:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569926455;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gEVF6tOmNYSrFSxvO9wUlmIzLlhtptaqIU7DjUUKD7M=;
 b=cjO0GvHnd0HZTVagy78GVgdfnmheN28RrhwolulLEz1uU5qygtBWEZ0u
 f7Bql8QAEIWPx7kNEkfG6qjYfPdDgAj7s9s2TZHhpxbAXm6QyVwMKAq03
 uPtbwV1UQbUI3wpZF8Z4/q4TdWIAHDQsDSXs3vf6EZMogQNYj1+wc3J6+ o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aBOh7+AA5NuUChDVRU/DtNGulDOK11EJhkFPam1Zd/4opMokQQwb3RhlwrAgXUqmiP8xf/Tc24
 98ZqUPTUayTt9vAHipxWrEjX6H6uMdU6BoY1PNDx7p4dxU/Dhv2hiaIZpuox79dZJbZC8hxOw3
 Mjt0HK1UHHTF21u5PI3OmyxXYcOVYZXLyzwLDiaVpZMTZF0I5D57QUoqujpQGWKookg+CifbEW
 9gm6qcOOQd4Ze65T1u09/tlzUJSV78le7zYqX4MsIz9mavy4aAkmvgVfEL0oI3mNvvqLUbwnxd
 D3o=
X-SBRS: 2.7
X-MesageID: 6653264
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6653264"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
Thread-Index: AQHVeDIwRG0o+S2xK02nqNXtlOqU5KdFV3YAgAAisFD//+aCgIAAJMzQ///q0QCAACM5wP//4i+AAAROh5A=
Date: Tue, 1 Oct 2019 10:40:51 +0000
Message-ID: <c2dff4f9265543629288d6cd64a6ddce@AMSPEX02CL03.citrite.net>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
 <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
 <b944e15f-5adc-4597-9bb0-a010445a6af5@suse.com>
 <dd43ad524f7c457eae6dbf74ec3a6547@AMSPEX02CL03.citrite.net>
 <352b04a5-52b4-4ab1-fa3c-41f93f566c47@suse.com>
 <728628bd673a405fbf9a37efeef01a2a@AMSPEX02CL03.citrite.net>
 <0e45cdd1-7f52-0e31-e732-9351d498f13a@citrix.com>
In-Reply-To: <0e45cdd1-7f52-0e31-e732-9351d498f13a@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT4NCj4gU2VudDogMDEgT2N0b2JlciAyMDE5IDExOjM0DQo+IFRv
OiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgJ0phbiBCZXVsaWNoJyA8
amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0Bj
aXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IHhlbi0N
Cj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBb
UEFUQ0gtZm9yLTQuMTNdIHg4Ni9tbTogZG9uJ3QgbmVlZGxlc3NseSB2ZXRvIG1pZ3JhdGlvbg0K
PiANCj4gT24gMTAvMS8xOSAxMToyNCBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQo+ID4+IFNlbnQ6IDAxIE9jdG9iZXIgMjAxOSAxMToxNQ0KPiA+PiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gPj4gQ2M6IEFuZHJldyBDb29w
ZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVu
bGFwQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4gPj4gTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+OyBXZWkNCj4gTGl1DQo+ID4+IDx3bEB4ZW4ub3JnPg0KPiA+PiBTdWJqZWN0
OiBSZTogW1hlbi1kZXZlbF0gW1BBVENILWZvci00LjEzXSB4ODYvbW06IGRvbid0IG5lZWRsZXNz
bHkgdmV0byBtaWdyYXRpb24NCj4gPj4NCj4gPj4gT24gMDEuMTAuMjAxOSAxMTozNiwgUGF1bCBE
dXJyYW50IHdyb3RlOg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4g
RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pj4+IFNlbnQ6IDAxIE9j
dG9iZXIgMjAxOSAxMDoxOQ0KPiA+Pj4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBj
aXRyaXguY29tPg0KPiA+Pj4+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRy
aXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgUm9nZXIN
Cj4gUGF1DQo+ID4+Pj4gTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ow0KPiBX
ZWkNCj4gPj4gTGl1DQo+ID4+Pj4gPHdsQHhlbi5vcmc+DQo+ID4+Pj4gU3ViamVjdDogUmU6IFtY
ZW4tZGV2ZWxdIFtQQVRDSC1mb3ItNC4xM10geDg2L21tOiBkb24ndCBuZWVkbGVzc2x5IHZldG8g
bWlncmF0aW9uDQo+ID4+Pj4NCj4gPj4+PiBPbiAwMS4xMC4yMDE5IDEwOjUyLCBQYXVsIER1cnJh
bnQgd3JvdGU6DQo+ID4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+Pj4g
RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pj4+Pj4gU2VudDogMDEg
T2N0b2JlciAyMDE5IDA5OjQ2DQo+ID4+Pj4+PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJh
bnRAY2l0cml4LmNvbT4NCj4gPj4+Pj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmc7IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUg
TW9ubmUNCj4gPj4+Pj4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdl
b3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEp1ZXJnZW4gR3Jvc3MNCj4gPj4gPGpncm9zc0BzdXNl
LmNvbT47DQo+ID4+Pj4gV2VpDQo+ID4+Pj4+PiBMaXUgPHdsQHhlbi5vcmc+DQo+ID4+Pj4+PiBT
dWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENILWZvci00LjEzXSB4ODYvbW06IGRvbid0IG5l
ZWRsZXNzbHkgdmV0byBtaWdyYXRpb24NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBPbiAwMS4xMC4yMDE5
IDEwOjI4LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+Pj4+Pj4gTm93IHRoYXQgeGwuY2ZnIGhh
cyBhbiBvcHRpb24gdG8gZXhwbGljaXRseSBlbmFibGUgSU9NTVUgbWFwcGluZ3MgZm9yIGENCj4g
Pj4+Pj4+PiBkb21haW4sIG1pZ3JhdGlvbiBtYXkgYmUgbmVlZGxlc3NseSB2ZXRvZWQgZHVlIHRv
IHRoZSBjaGVjayBvZg0KPiA+Pj4+Pj4+IGlzX2lvbW11X2VuYWJsZWQoKSBpbiBwYWdpbmdfbG9n
X2RpcnR5X2VuYWJsZSgpLg0KPiA+Pj4+Pj4+IFRoZXJlIGlzIGFjdHVhbGx5IG5vIG5lZWQgdG8g
cHJldmVudCBsb2dkaXJ0eSBmcm9tIGJlaW5nIGVuYWJsZWQgdW5sZXNzDQo+ID4+Pj4+Pj4gZGV2
aWNlcyBhcmUgYXNzaWduZWQgdG8gYSBkb21haW4gYW5kIHRoYXQgZG9tYWluIGlzIHNoYXJpbmcg
SEFQIG1hcHBpbmdzDQo+ID4+Pj4+Pj4gd2l0aCB0aGUgSU9NTVUgKGluIHdoaWNoIGNhc2UgZGlz
YWJsaW5nIHdyaXRlIHBlcm1pc3Npb25zIGluIHRoZSBQMk0gbWF5DQo+ID4+Pj4+Pj4gY2F1c2Ug
RE1BIGZhdWx0cykuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gQnV0IHRoYXQncyB0YWtpbmcgaW50byBh
Y2NvdW50IG9ubHkgaGFsZiBvZiB0aGUgcmVhc29uIG9mIHRoZQ0KPiA+Pj4+Pj4gZXhjbHVzaW9u
LiBUaGUgb3RoZXIgaGFsZiBpcyB0aGF0IGFzc2lnbmVkIGRldmljZXMgbWF5IGNhdXNlIHBhZ2Vz
DQo+ID4+Pj4+PiB0byBiZSBkaXJ0aWVkIGJlaGluZCB0aGUgYmFjayBvZiB0aGUgbG9nLWRpcnR5
IGxvZ2ljLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBCdXQgdGhhdCdzIG5vIHJlYXNvbiB0byB2ZXRvIGxv
Z2RpcnR5LiBTb21lIGRldmljZXMgaGF2ZSBkcml2ZXJzIChpbiBkb20wKQ0KPiA+Pj4+PiB3aGlj
aCBjYW4gZXh0cmFjdCBETUEgZGlydHlpbmcgaW5mb3JtYXRpb24gYW5kIHNldCBkaXJ0eSB0cmFj
a2luZw0KPiA+Pj4+PiBpbmZvcm1hdGlvbiBhcHByb3ByaWF0ZWx5Lg0KPiA+Pj4+DQo+ID4+Pj4g
SXQgc3RpbGwgbmVlZHMgYSBwb3NpdGl2ZSBpZGVudGlmaWNhdGlvbiB0aGVuOiBTdWNoIGRyaXZl
cnMgc2hvdWxkIHRlbGwNCj4gPj4+PiBYZW4gZm9yIHdoaWNoIHNwZWNpZmljIGRldmljZXMgc3Vj
aCBpbmZvcm1hdGlvbiBpcyBnb2luZyB0byBiZSBwcm92aWRlZC4NCj4gPj4+DQo+ID4+PiBXaHkg
ZG9lcyB0aGUgaHlwZXJ2aXNvciBuZWVkIGhhdmUgdGhlIHJpZ2h0IG9mIHZldG8gdGhvdWdoPyBT
dXJlbHkgaXQgaXMNCj4gPj4+IHRoZSB0b29sc3RhY2sgdGhhdCBzaG91bGQgZGVjaWRlIHdoZXRo
ZXIgYSBWTSBpcyBtaWdyYXRhYmxlIGluIHRoZQ0KPiA+Pj4gcHJlc2VuY2Ugb2YgYXNzaWduZWQg
aC93LiBYZW4gbmVlZCBvbmx5IGJlIGNvbmNlcm5lZCB3aXRoIHRoZSBpbnRlZ3JpdHkNCj4gPj4+
IG9mIHRoZSBob3N0LCB3aGljaCBpcyB3aHkgdGhlIGNoZWNrIGZvciBFVFAgc2hhcmluZyByZW1h
aW5zLg0KPiA+Pg0KPiA+PiBXaGlsZSB0aGUgdG9vbCBzdGFjayBpcyB0byBkZWNpZGUsIHRoZSBo
eXBlcnZpc29yIGlzIGV4cGVjdGVkIHRvIGd1YXJhbnRlZQ0KPiA+PiBjb3JyZWN0IGRhdGEgY29t
aW5nIGJhY2sgZnJvbSBYRU5fRE9NQ1RMX1NIQURPV19PUF97UEVFSyxDTEVBTn0uDQo+ID4NCj4g
PiBGb3Igc29tZSBkZWZpbml0aW9uIG9mICdjb3JyZWN0JywgeWVzLCBhbmQgSSBkb24ndCB0aGlu
ayB0aGF0IHRoaXMgY2hhbmdlIHZpb2xhdGVzIGFueSBkZWZpbml0aW9uIEkNCj4gY2FuIGZpbmQg
aW4gdGhlIGRvbWN0bCBoZWFkZXIuDQo+ID4NCj4gPiBOb3RlOiB0aGVyZSBhcmUgYWxyZWFkeSBl
bXVsYXRvcnMgdGhhdCB3aWxsIGJlIHBsYXlpbmcgd2l0aCB0aGUgZGlydHkgbWFwIG9uIGFuIGFy
Yml0cmFyeSBhbmQNCj4gdW5zeW5jaHJvbml6ZWQgYmFzaXMgYmVjYXVzZSB0aGV5IGFyZSBlbXVs
YXRpbmcgYnVzIG1hc3RlcmluZyBoL3cuDQo+IA0KPiBCdXQgdGhlIHF1ZXN0aW9uIGlzLCBkbyB3
ZSB3YW50IHRoZSB0b29sc3RhY2sgdG8gaGF2ZSB0byBiZWNvbWUgYW4NCj4gZXhwZXJ0IGluIHdo
YXQgaGFyZHdhcmUgbWlnaHQgaGF2ZSBleHRlcm5hbCBkaXJ0eSB0cmFja2luZywgYW5kIHdoZXRo
ZXINCj4gc3VjaCB0cmFja2luZyBpcyBhY3RpdmU/ICBBdCB0aGUgbW9tZW50IHRoYXQgd291bGQg
bWVhbiBlaXRoZXIgMSkNCj4gcHV0dGluZyB0aGF0IGluZm9ybWF0aW9uIGluc2lkZSBvZiBsaWJ4
Yywgb3IgMikgZHVwbGljYXRpbmcgaXQgYWNyb3NzDQo+IHhhcGkgYW5kIGxpYnhsLCBmb3IgaW5z
dGFuY2UuDQoNCldoeSBub3Q/IFRoZSB0b29sc3RhY2sgaXMgaW4gY2hhcmdlIG9mIG1pZ3JhdGlv
biBzbyB3aHkgY2FuJ3QgaXQgZGVjaWRlIHdoZXRoZXIgaXQgaXMgJ3NhZmUnIG9yIG5vdD8NCg0K
PiANCj4gT25lIHRoaW5nIHdlIGNvdWxkIGltYWdpbmUgaXMgdGhhdCB3aGVuIHNwZWNpZmljIGRl
dmljZXMgaGF2ZSBhbiBhY3RpdmUNCj4gZW11bGF0b3IgKG9yIHdoYXRldmVyKSBwcm9wYWdhdGlu
ZyB0aGUgZGlydHkgaW5mb3JtYXRpb24sIGZvciB0aGF0IGNvZGUNCj4gdG8gdGVsbCBYZW4sICJJ
IGFtIGltcGxlbWVudGluZyBkaXJ0eSB0cmFja2luZyBmb3IgdGhpcyBkZXZpY2UiLiAgVGhlbg0K
PiB3aGVuIHRoZSB0b29sc3RhY2sgZW5hYmxlcyBsb2dkaXJ0eSwgdGhlIGNoZWNrIGNhbiBiZSwg
IkFyZSB0aGVyZSBhbnkNCj4gZGV2aWNlcyAqdGhhdCBkb24ndCBoYXZlIGV4dGVybmFsIGRpcnR5
IHRyYWNraW5nIGVuYWJsZWQqIGFzc2lnbmVkIHRvDQo+IHRoZSBndWVzdD8iDQoNCkFuZCB3aGF0
IGFib3V0IGV4aXN0aW5nIGVtdWxhdG9ycyBzZXR0aW5nIHBhZ2VzIGRpcnR5IGF0IHRoZSBtb21l
bnQ/IEkgZG9uJ3Qgc2VlIHdoeSBYZW4ncyBpbnRlcm5hbCBkaXJ0eSBwYWdlIGxvZ2dpbmcgaXMg
Y29uc2lkZXJlZCBkZWZpbml0aXZlIGJlY2F1c2UgQUZBSUNUIHRoYXQgaXMgcmVhbGx5IG5vdCB0
aGUgY2FzZSBldmVuIG5vdy4NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
