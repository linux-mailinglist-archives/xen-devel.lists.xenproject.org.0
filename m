Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68C3C3157
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:27:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFKc-0003WA-7T; Tue, 01 Oct 2019 10:24:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFFKa-0003W5-Sh
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:24:32 +0000
X-Inumbo-ID: a19f3ff2-e435-11e9-96f7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id a19f3ff2-e435-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 10:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569925461;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sfTnuvI+oyDB3ASbB7OrcueW9qgAU4pkokeXkkHeAY0=;
 b=Ns5SdZWB4yXtxIL9QnbrRSuJxByelomOpa0cB2XoCVo5z1RwJrgx8ybJ
 QuvddoBe5mlOqnpHMerCfDJZU4Q6mUZ3FZ3GOAW2gMrFPBmTRrkHLfsuT
 EpsVYJniG5fqW+Al6+hEpcDnNqnG06PlBfEpPdh0DH4iYqgUrmXyQM/6w Q=;
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
IronPort-SDR: rJz7LAkZX0WXIKVYMIPBUWFp/bO+m2ajLKIkhDrCi3jQrt9R8zJLhsqlSWELP8ebipqFq+tihS
 hv8jNACccrknO33G4QUXGTVlNXHuRIeezOn20XJZ9XfFZhOur1lHhZm1wVptUfFfvN+OOEvg3/
 /SE7vIBAMgTG31uTZhWlELqqt2kv7fQfzOrlszk502rI841YxaXGIJbXqUXSoJynaKypPQQmZC
 HHLn0OjeWsxVKaAwbrz1wkzcZvHZtn2ig81wgYIAOgGRwI8RUhiBDt7yX0xtlNj91hE7oLyTSO
 i0s=
X-SBRS: 2.7
X-MesageID: 6652752
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6652752"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
Thread-Index: AQHVeDIwRG0o+S2xK02nqNXtlOqU5KdFV3YAgAAisFD//+aCgIAAJMzQ///q0QCAACM5wA==
Date: Tue, 1 Oct 2019 10:24:16 +0000
Message-ID: <728628bd673a405fbf9a37efeef01a2a@AMSPEX02CL03.citrite.net>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
 <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
 <b944e15f-5adc-4597-9bb0-a010445a6af5@suse.com>
 <dd43ad524f7c457eae6dbf74ec3a6547@AMSPEX02CL03.citrite.net>
 <352b04a5-52b4-4ab1-fa3c-41f93f566c47@suse.com>
In-Reply-To: <352b04a5-52b4-4ab1-fa3c-41f93f566c47@suse.com>
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAxIE9jdG9iZXIgMjAxOSAxMToxNQ0KPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IEFuZHJldyBDb29wZXIgPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNp
dHJpeC5jb20+OyBSb2dlciBQYXUNCj4gTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+OyBXZWkgTGl1DQo+IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0g
W1BBVENILWZvci00LjEzXSB4ODYvbW06IGRvbid0IG5lZWRsZXNzbHkgdmV0byBtaWdyYXRpb24N
Cj4gDQo+IE9uIDAxLjEwLjIwMTkgMTE6MzYsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiA+PiBTZW50OiAwMSBPY3RvYmVyIDIwMTkgMTA6MTkNCj4gPj4gVG86IFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+DQo+ID4+IENjOiBBbmRyZXcgQ29v
cGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1
bmxhcEBjaXRyaXguY29tPjsgUm9nZXIgUGF1DQo+ID4+IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPjsgV2VpDQo+IExpdQ0KPiA+PiA8d2xAeGVuLm9yZz4NCj4gPj4gU3ViamVj
dDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSC1mb3ItNC4xM10geDg2L21tOiBkb24ndCBuZWVkbGVz
c2x5IHZldG8gbWlncmF0aW9uDQo+ID4+DQo+ID4+IE9uIDAxLjEwLjIwMTkgMTA6NTIsIFBhdWwg
RHVycmFudCB3cm90ZToNCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+
IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiAwMSBP
Y3RvYmVyIDIwMTkgMDk6NDYNCj4gPj4+PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRA
Y2l0cml4LmNvbT4NCj4gPj4+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBB
bmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5l
DQo+ID4+Pj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1
bmxhcEBjaXRyaXguY29tPjsgSnVlcmdlbiBHcm9zcw0KPiA8amdyb3NzQHN1c2UuY29tPjsNCj4g
Pj4gV2VpDQo+ID4+Pj4gTGl1IDx3bEB4ZW4ub3JnPg0KPiA+Pj4+IFN1YmplY3Q6IFJlOiBbWGVu
LWRldmVsXSBbUEFUQ0gtZm9yLTQuMTNdIHg4Ni9tbTogZG9uJ3QgbmVlZGxlc3NseSB2ZXRvIG1p
Z3JhdGlvbg0KPiA+Pj4+DQo+ID4+Pj4gT24gMDEuMTAuMjAxOSAxMDoyOCwgUGF1bCBEdXJyYW50
IHdyb3RlOg0KPiA+Pj4+PiBOb3cgdGhhdCB4bC5jZmcgaGFzIGFuIG9wdGlvbiB0byBleHBsaWNp
dGx5IGVuYWJsZSBJT01NVSBtYXBwaW5ncyBmb3IgYQ0KPiA+Pj4+PiBkb21haW4sIG1pZ3JhdGlv
biBtYXkgYmUgbmVlZGxlc3NseSB2ZXRvZWQgZHVlIHRvIHRoZSBjaGVjayBvZg0KPiA+Pj4+PiBp
c19pb21tdV9lbmFibGVkKCkgaW4gcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoKS4NCj4gPj4+Pj4g
VGhlcmUgaXMgYWN0dWFsbHkgbm8gbmVlZCB0byBwcmV2ZW50IGxvZ2RpcnR5IGZyb20gYmVpbmcg
ZW5hYmxlZCB1bmxlc3MNCj4gPj4+Pj4gZGV2aWNlcyBhcmUgYXNzaWduZWQgdG8gYSBkb21haW4g
YW5kIHRoYXQgZG9tYWluIGlzIHNoYXJpbmcgSEFQIG1hcHBpbmdzDQo+ID4+Pj4+IHdpdGggdGhl
IElPTU1VIChpbiB3aGljaCBjYXNlIGRpc2FibGluZyB3cml0ZSBwZXJtaXNzaW9ucyBpbiB0aGUg
UDJNIG1heQ0KPiA+Pj4+PiBjYXVzZSBETUEgZmF1bHRzKS4NCj4gPj4+Pg0KPiA+Pj4+IEJ1dCB0
aGF0J3MgdGFraW5nIGludG8gYWNjb3VudCBvbmx5IGhhbGYgb2YgdGhlIHJlYXNvbiBvZiB0aGUN
Cj4gPj4+PiBleGNsdXNpb24uIFRoZSBvdGhlciBoYWxmIGlzIHRoYXQgYXNzaWduZWQgZGV2aWNl
cyBtYXkgY2F1c2UgcGFnZXMNCj4gPj4+PiB0byBiZSBkaXJ0aWVkIGJlaGluZCB0aGUgYmFjayBv
ZiB0aGUgbG9nLWRpcnR5IGxvZ2ljLg0KPiA+Pj4NCj4gPj4+IEJ1dCB0aGF0J3Mgbm8gcmVhc29u
IHRvIHZldG8gbG9nZGlydHkuIFNvbWUgZGV2aWNlcyBoYXZlIGRyaXZlcnMgKGluIGRvbTApDQo+
ID4+PiB3aGljaCBjYW4gZXh0cmFjdCBETUEgZGlydHlpbmcgaW5mb3JtYXRpb24gYW5kIHNldCBk
aXJ0eSB0cmFja2luZw0KPiA+Pj4gaW5mb3JtYXRpb24gYXBwcm9wcmlhdGVseS4NCj4gPj4NCj4g
Pj4gSXQgc3RpbGwgbmVlZHMgYSBwb3NpdGl2ZSBpZGVudGlmaWNhdGlvbiB0aGVuOiBTdWNoIGRy
aXZlcnMgc2hvdWxkIHRlbGwNCj4gPj4gWGVuIGZvciB3aGljaCBzcGVjaWZpYyBkZXZpY2VzIHN1
Y2ggaW5mb3JtYXRpb24gaXMgZ29pbmcgdG8gYmUgcHJvdmlkZWQuDQo+ID4NCj4gPiBXaHkgZG9l
cyB0aGUgaHlwZXJ2aXNvciBuZWVkIGhhdmUgdGhlIHJpZ2h0IG9mIHZldG8gdGhvdWdoPyBTdXJl
bHkgaXQgaXMNCj4gPiB0aGUgdG9vbHN0YWNrIHRoYXQgc2hvdWxkIGRlY2lkZSB3aGV0aGVyIGEg
Vk0gaXMgbWlncmF0YWJsZSBpbiB0aGUNCj4gPiBwcmVzZW5jZSBvZiBhc3NpZ25lZCBoL3cuIFhl
biBuZWVkIG9ubHkgYmUgY29uY2VybmVkIHdpdGggdGhlIGludGVncml0eQ0KPiA+IG9mIHRoZSBo
b3N0LCB3aGljaCBpcyB3aHkgdGhlIGNoZWNrIGZvciBFVFAgc2hhcmluZyByZW1haW5zLg0KPiAN
Cj4gV2hpbGUgdGhlIHRvb2wgc3RhY2sgaXMgdG8gZGVjaWRlLCB0aGUgaHlwZXJ2aXNvciBpcyBl
eHBlY3RlZCB0byBndWFyYW50ZWUNCj4gY29ycmVjdCBkYXRhIGNvbWluZyBiYWNrIGZyb20gWEVO
X0RPTUNUTF9TSEFET1dfT1Bfe1BFRUssQ0xFQU59Lg0KDQpGb3Igc29tZSBkZWZpbml0aW9uIG9m
ICdjb3JyZWN0JywgeWVzLCBhbmQgSSBkb24ndCB0aGluayB0aGF0IHRoaXMgY2hhbmdlIHZpb2xh
dGVzIGFueSBkZWZpbml0aW9uIEkgY2FuIGZpbmQgaW4gdGhlIGRvbWN0bCBoZWFkZXIuDQoNCk5v
dGU6IHRoZXJlIGFyZSBhbHJlYWR5IGVtdWxhdG9ycyB0aGF0IHdpbGwgYmUgcGxheWluZyB3aXRo
IHRoZSBkaXJ0eSBtYXAgb24gYW4gYXJiaXRyYXJ5IGFuZCB1bnN5bmNocm9uaXplZCBiYXNpcyBi
ZWNhdXNlIHRoZXkgYXJlIGVtdWxhdGluZyBidXMgbWFzdGVyaW5nIGgvdy4NCg0KICBQYXVsDQoN
Cj4gDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
