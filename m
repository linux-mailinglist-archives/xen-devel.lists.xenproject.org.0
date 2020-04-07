Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731FC1A1368
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 20:17:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLsm1-0004ho-1S; Tue, 07 Apr 2020 18:16:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LBKk=5X=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jLslz-0004hj-Dv
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 18:16:31 +0000
X-Inumbo-ID: e6bee7da-78fb-11ea-812c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6bee7da-78fb-11ea-812c-12813bfff9fa;
 Tue, 07 Apr 2020 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586283389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=STImqcdMefvLzQcK1dkcfoTo/4dDxme+5qJq/zzX+Ic=;
 b=ZdSWgahPbE7iKm+rg4AOhSLUWWNlYuZNddJQV6BKJMxFXzQUdG2tzWj9
 xesxDEF2NYHjSJR0NFTubFRp61zgCPlIrJr8T58b6Mev2bnNPB8eO/3H9
 GWOJFzDd1Dudm5BQf+lP9UVnkBe75dU5Bf/y8MqKnWFUmh/BDAXfhY6vI I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 51v1yYWQi3g6kaG83D3u07tzf811P4WzSvHCCHji9BCQ2dsVmT0O2/wz/KU04MPtMNCw8gmc3t
 AGdMBCZ/O6bWSR4PMKp5HOHxvnx/CBUopp0gCrhapNWEfXLKNjO946fZDP+Y9T8X9QV9rlH7Vw
 YvAAxk3TTwmw0UZam5CIoeINSa8Hy+l+peYN7e/nwoWTW5D/mktGeaEPiCvLkxFpaV+r1ZIN2X
 oL6Bs0wA2Xb076AiqaqYfTs63yVADYPhJqMcggivvPZ5Z7OmtS75no1XwoWEk9xchU3PuYyoGZ
 mSY=
X-SBRS: 2.7
X-MesageID: 15987249
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,356,1580792400"; d="scan'208";a="15987249"
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Topic: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Index: AQHWCRLu2U2EJ1WUk0i1KTanKYKpWqhmDBwAgAGf9wCAAAzcgIAEjVGAgAANpgCAAWgwAIAACYAAgAAYCYA=
Date: Tue, 7 Apr 2020 18:16:25 +0000
Message-ID: <4FBF62BA-5844-4506-8C01-FE1A6F4A7ED2@citrix.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2LdC-nSMUEjLhGp_4PAkcRkp4wJKXiAy0ftt34T8LAVg@mail.gmail.com>
 <D048CA76-8C9F-4F44-B05C-D834A6D0D37D@citrix.com>
 <9de763c9-19f2-2163-d5db-95176dbce3cc@xen.org>
 <082584BF-3837-48A7-A0C2-9582BA3379C0@citrix.com>
 <a29cb044-7e78-a47b-f842-327373e0ec9f@xen.org>
In-Reply-To: <a29cb044-7e78-a47b-f842-327373e0ec9f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <10DFC6CA537A29429BCC536E450D014E@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "maz@kernel.org" <maz@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDcsIDIwMjAsIGF0IDU6NTAgUE0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwNy8wNC8yMDIwIDE3OjE2LCBHZW9yZ2Ug
RHVubGFwIHdyb3RlOg0KPj4+IE9uIEFwciA2LCAyMDIwLCBhdCA3OjQ3IFBNLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBPbiAwNi8wNC8yMDIwIDE4OjU4
LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4+Pj4gT24gQXByIDMsIDIwMjAsIGF0IDk6MjcgUE0s
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsLm9zc0BnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4g
DQo+Pj4+PiBPbiBGcmksIDMgQXByIDIwMjAgYXQgMjA6NDEsIFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gT24gVGh1LCAy
IEFwciAyMDIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4+IEFzIHdlIGRpc2N1c3NlZCBv
biBUdWVzZGF5LCB0aGUgY29zdCBmb3Igb3RoZXIgdkNQVXMgaXMgb25seSBnb2luZyB0byBiZSBh
DQo+Pj4+Pj4+IHRyYXAgdG8gdGhlIGh5cGVydmlzb3IgYW5kIHRoZW4gYmFjayBhZ2Fpbi4gVGhl
IGNvc3QgaXMgbGlrZWx5IHNtYWxsZXIgdGhhbg0KPj4+Pj4+PiByZWNlaXZpbmcgYW5kIGZvcndh
cmRpbmcgYW4gaW50ZXJydXB0Lg0KPj4+Pj4+PiANCj4+Pj4+Pj4gWW91IGFjdHVhbGx5IGFncmVl
ZCBvbiB0aGlzIGFuYWx5c2lzLiBTbyBjYW4geW91IGVubGlnaHRlbiBtZSBhcyB0byB3aHkNCj4+
Pj4+Pj4gcmVjZWl2aW5nIGFuIGludGVycnVwdCBpcyBhIG5vdCBwcm9ibGVtIGZvciBsYXRlbmN5
IGJ1dCB0aGlzIGlzPw0KPj4+Pj4+IA0KPj4+Pj4+IE15IGFuc3dlciB3YXMgdGhhdCB0aGUgZGlm
ZmVyZW5jZSBpcyB0aGF0IGFuIG9wZXJhdGluZyBzeXN0ZW0gY2FuDQo+Pj4+Pj4gZGlzYWJsZSBp
bnRlcnJ1cHRzLCBidXQgaXQgY2Fubm90IGRpc2FibGUgcmVjZWl2aW5nIHRoaXMgc3BlY2lhbCBJ
UEkuDQo+Pj4+PiANCj4+Pj4+IEFuIE9TIGNhbiAqb25seSogZGlzYWJsZSBpdHMgb3duIGludGVy
cnVwdHMsIHlldCBpbnRlcnJ1cHRzIHdpbGwgc3RpbGwNCj4+Pj4+IGJlIHJlY2VpdmVkIGJ5IFhl
biBldmVuIGlmIHRoZSBpbnRlcnJ1cHRzIGFyZSBtYXNrZWQgYXQgdGhlIHByb2Nlc3Nvcg0KPj4+
Pj4gKGUuZyBsb2NhbF9pcnFfZGlzYWJsZSgpKS4NCj4+Pj4+IA0KPj4+Pj4gWW91IHdvdWxkIG5l
ZWQgdG8gZGlzYWJsZSBpbnRlcnJ1cHRzIG9uZSBieSBvbmUgYXMgdGhlIEdJQyBsZXZlbCAodXNl
DQo+Pj4+PiBJQ0VOQUJMRVIpIGluIG9yZGVyIHRvIG5vdCByZWNlaXZlIGFueSBpbnRlcnJ1cHRz
LiBZZXQsIFhlbiBtYXkgc3RpbGwNCj4+Pj4+IHJlY2VpdmUgaW50ZXJydXB0cyBmb3Igb3BlcmF0
aW9uYWwgcHVycG9zZXMgKGUuZyBzZXJpYWwsIGNvbnNvbGUsDQo+Pj4+PiBtYWludGFpbmFuY2Ug
SVJRLi4uKS4gU28gdHJhcCB3aWxsIGhhcHBlbi4NCj4+Pj4gSSB0aGluayBTdGVmYW5v4oCZcyBh
c3NlcnRpb24gaXMgdGhhdCB0aGUgdXNlcnMgaGUgaGFzIGluIG1pbmQgd2lsbCBiZSBjb25maWd1
cmluZyB0aGUgc3lzdGVtIHN1Y2ggdGhhdCBSVCB3b3JrbG9hZHMgZ2V0IGEgbWluaW11bSBudW1i
ZXIgb2YgaHlwZXJ2aXNvci1yZWxhdGVkIGludGVycnVwdHMgcG9zc2libGUuICBPbiBhIDQtY29y
ZSBzeXN0ZW0sIHlvdSBjb3VsZCAgaGF2ZSBub24tUlQgd29ya2xvYWRzIHJ1bm5pbmcgb24gY29y
ZXMgMC0xLCBhbmQgUlQgd29ya2xvYWRzIHJ1bm5pbmcgd2l0aCB0aGUgTlVMTCBzY2hlZHVsZXIg
b24gY29yZXMgMi0zLiAgSW4gc3VjaCBhIHN5c3RlbSwgeW914oCZZCBvYnZpb3VzbHkgYXJyYW5n
ZSB0aGF0IHNlcmlhbCBhbmQgbWFpbnRlbmFuY2UgSVJRcyBhcmUgZGVsaXZlcmVkIHRvIGNvcmVz
IDAtMS4NCj4+PiBXZWxsIG1haW50ZW5hbmNlIElSUXMgYXJlIHBlciBwQ1BVIHNvIHlvdSBjYW4n
dCByb3V0ZSB0byBhbm90aGVyIG9uZS4uLg0KPj4+IA0KPj4+IEJ1dCwgSSB0aGluayB5b3UgbWlz
c2VkIG15IHBvaW50IHRoYXQgbG9jYWxfaXJxX2Rpc2FibGUoKSBmcm9tIHRoZSBndWVzdCB3aWxs
IG5vdCBwcmV2ZW50IHRoZSBoeXBlcnZpc29yIHRvIHJlY2VpdmUgaW50ZXJydXB0cyAqZXZlbiog
dGhlIG9uZSByb3V0ZWQgdG8gdGhlIHZDUFUgaXRzZWxmLiBUaGV5IHdpbGwganVzdCBub3QgYmUg
ZGVsaXZlcmVkIHRvIHRoZSBndWVzdCBjb250ZXh0IHVudGlsIGxvY2FsX2lycV9lbmFibGUoKSBp
cyBjYWxsZWQuDQo+PiBNeSB1bmRlcnN0YW5kaW5nLCBmcm9tIFN0ZWZhbm8gd2FzIHRoYXQgd2hh
dCBoaXMgY3VzdG9tZXJzIGFyZSBjb25jZXJuZWQgYWJvdXQgaXMgdGhlIHRpbWUgYmV0d2VlbiB0
aGUgdGltZSBhIHBoeXNpY2FsIElSUSBpcyBkZWxpdmVyZWQgdG8gdGhlIGd1ZXN0IGFuZCB0aGUg
dGltZSB0aGUgZ3Vlc3QgT1MgY2FuIHJlc3BvbmQgYXBwcm9wcmlhdGVseS4gIFRoZSBrZXkgdGhp
bmcgaGVyZSBpc27igJl0IG5lY2Vzc2FyaWx5IHNwZWVkLCBidXQgcHJlZGljdGFiaWxpdHkg4oCU
IHN5c3RlbSBkZXNpZ25lcnMgbmVlZCB0byBrbm93IHRoYXQsIHdpdGggYSBoaWdoIHByb2JhYmls
aXR5LCB0aGVpciBpbnRlcnJ1cHQgcm91dGluZXMgd2lsbCBjb21wbGV0ZSB3aXRoaW4gWCBhbW91
bnQgb2YgY3ljbGVzLg0KPj4gRnVydGhlciBpbnRlcnJ1cHRzIGRlbGl2ZXJlZCB0byBhIGd1ZXN0
IGFyZSBub3QgYSBwcm9ibGVtIGluIHRoaXMgc2NlbmFyaW8sIGlmIHRoZSBndWVzdCBjYW4gZGlz
YWJsZSB0aGVtIHVudGlsIHRoZSBjcml0aWNhbCBJUlEgaGFzIGJlZW4gaGFuZGxlZC4NCj4gDQo+
IFlvdSBrZWVwIHNheWluZyBhIGd1ZXN0IGNhbiBkaXNhYmxlIGludGVycnVwdHMsIGJ1dCBpdCBj
YW4ndCBkbyBpdCB2aWEgbG9jYWxfaXJxX2Rpc2FibGUoKS4gU28gd2hhdCBtZXRob2QgYXJlIHlv
dSB0aGlua2luZz8gRGlzYWJsaW5nIGF0IHRoZSBHSUMgbGV2ZWw/IFRoYXQgaXMgaW52b2x2aW5n
IHRyYXBzIGFuZCBtb3N0IGxpa2VseSBub3QgZ29pbmcgdG8gaGVscCB3aXRoIHByZWRpY3RhYmls
aXR5Li4uDQoNClNvIHlvdeKAmWxsIGhhdmUgdG8gZm9yZ2l2ZSBtZSBmb3IgbWFraW5nIGVkdWNh
dGVkIGd1ZXNzZXMgaGVyZSwgYXMgSeKAmW0gdHJ5aW5nIHRvIGNvbGxlY3QgYWxsIHRoZSBpbmZv
cm1hdGlvbi4gIE9uIHg4NiwgaWYgeW91IHVzZSBkZXZpY2UgcGFzcy10aHJvdWdoIG9uIGEgc3lz
dGVtIHdpdGggYSB2aXJ0dWFsaXplZCBBUElDIGFuZCBwb3N0ZWQgaW50ZXJydXB0cywgdGhlbiB3
aGVuIHdoZW4gdGhlIGRldmljZSBnZW5lcmF0ZXMgaW50ZXJydXB0cywgdGhvc2UgYXJlIGRlbGl2
ZXJlZCBkaXJlY3RseSB0byB0aGUgZ3Vlc3Qgd2l0aG91dCBpbnZvbHZlbWVudCBvZiBYZW47IGFu
ZCB3aGVuIHRoZSBndWVzdCBkaXNhYmxlcyBpbnRlcnJ1cHRzIGluIHRoZSB2QVBJQywgdGhvc2Ug
aW50ZXJydXB0cyB3aWxsIGJlIGRpc2FibGVkLCBhbmQgYmUgZGVsaXZlcmVkIHdoZW4gdGhlIGd1
ZXN0IHJlLWVuYWJsZXMgaW50ZXJydXB0cy4gIEdpdmVuIHdoYXQgU3RlZmFubyBzYWlkIGFib3V0
IGRpc2FibGluZyBpbnRlcnJ1cHRzLCBJIGFzc3VtZWQgdGhhdCBBUk0gaGFkIHRoZSBzYW1lIHNv
cnQgb2YgZnVuY3Rpb25hbGl0eS4gIElzIHRoYXQgbm90IHRoZSBjYXNlPw0KDQo+PiBYZW4tcmVs
YXRlZCBJUElzLCBob3dldmVyLCBjb3VsZCBwb3RlbnRpYWxseSBjYXVzZSBhIHByb2JsZW0gaWYg
bm90IG1pdGlnYXRlZC4gQ29uc2lkZXIgYSBndWVzdCB3aGVyZSB2Y3B1IDEgbG9vcHMgb3ZlciB0
aGUgcmVnaXN0ZXIsIHdoaWxlIHZjcHUgMiBpcyBoYW5kbGluZyBhIGxhdGVuY3ktY3JpdGljYWwg
SVJRLiAgQSBuYWl2ZSBpbXBsZW1lbnRhdGlvbiBtaWdodCBzZW5kIGFuIElQSSBldmVyeSB0aW1l
IHZjcHUgMSBkb2VzIGEgcmVhZCwgc3BhbW1pbmcgdmNwdSAyIHdpdGggZG96ZW5zIG9mIElQSXMu
ICBUaGVuIGFuIElSUSByb3V0aW5lIHdoaWNoIHJlbGlhYmx5IGZpbmlzaGVzIHdlbGwgd2l0aGlu
IHRoZSByZXF1aXJlZCB0aW1lIG5vcm1hbGx5IHN1ZGRlbmx5IG92ZXJydW5zIGFuZCBjYXVzZXMg
YW4gaXNzdWUuDQo+IA0KPiBJIG5ldmVyIHN1Z2dlc3RlZCB0aGUgbmFpdmUgaW1wbGVtZW50YXRp
b24gd291bGQgYmUgcGVyZmVjdC4gVGhhdCdzIHdoeSBJIHNhaWQgaXQgY2FuIGJlIG9wdGltaXpl
ZC4uLg0KDQpJdCBkaWRu4oCZdCBzZWVtIHRvIG1lIHRoYXQgeW91IHVuZGVyc3Rvb2Qgd2hhdCBT
dGVmYW5v4oCZcyBjb25jZXJucyB3ZXJlOyBzbyBJIHdhcyB0cnlpbmcgdG8gZXhwbGFpbiB0aGUg
c2l0dWF0aW9uIGhlIGlzIHRyeWluZyB0byBhdm9pZCAoYXMgd2VsbCBhcyBtYWtpbmcgc3VyZSB0
aGF0IEkgaGFkIGEgY2xlYXIgdW5kZXJzdGFuZGluZyBteXNlbGYpLiAgVGhlIHJlYXNvbiBJIHNh
aWQg4oCcYSBuYWl2ZSBpbXBsZW1lbnRhdGlvbuKAnSB3YXMgdG8gbWFrZSBjbGVhciB0aGF0IEkg
a25ldyB0aGF04oCZcyBub3Qgd2hhdCB5b3Ugd2VyZSBzdWdnZXN0aW5nLiA6LSkNCg0KPj4gSSBk
b27igJl0IGtub3cgd2hhdCBtYWludGVuYW5jZSBJUlFzIGFyZSwgYnV0IGlmIHRoZXkgb25seSBo
YXBwZW4gaW50ZXJtaXR0ZW50bHksIGl04oCZcyBwb3NzaWJsZSB0aGF0IHlvdeKAmWQgbmV2ZXIg
Z2V0IG1vcmUgdGhhbiBhIHNpbmdsZSBvbmUgaW4gYSBsYXRlbmN5LWNyaXRpY2FsIElSUSByb3V0
aW5lOyBhbmQgYXMgc3VjaCwgdGhlIHZhcmlhdGliaWxpdHkgaW4gZXhlY3V0aW9uIHRpbWUgKGpp
dHRlcikgd291bGRu4oCZdCBiZSBhbiBpc3N1ZSBpbiBwcmFjdGljZS4gIEJ1dCBldmVyeSB0aW1l
IHlvdSBhZGQgYSBuZXcgdW5ibG9ja2FibGUgSVBJLCB5b3UgaW5jcmVhc2UgdGhpcyBqaXR0ZXI7
IHBhcnRpY3VsYXJseSBpZiB0aGlzIHVuYmxvY2thYmxlIElQSSBtaWdodCBiZSByZXBlYXRlZCBh
biBhcmJpdHJhcnkgbnVtYmVyIG9mIHRpbWVzLg0KPj4gKFN0ZWZhbm8sIGxldCBtZSBrbm93IGlm
IEnigJl2ZSBtaXN1bmRlcnN0b29kIHNvbWV0aGluZy4pDQo+PiBTbyBzdGVwcGluZyBiYWNrIGEg
bW9tZW50LCBoZXJl4oCZcyBhbGwgdGhlIHBvc3NpYmxlIGlkZWFzIHRoYXQgSSB0aGluayBoYXZl
IGJlZW4gZGlzY3Vzc2VkIChvciBhcmUgdGhlcmUgaW1wbGljaXRseSkgc28gZmFyLg0KPj4gMS4g
W0RlZmF1bHRdIERvIG5vdGhpbmc7IGd1ZXN0cyB1c2luZyB0aGlzIHJlZ2lzdGVyIGNvbnRpbnVl
IGNyYXNoaW5nDQo+PiAyLiBNYWtlIHRoZSBJP0FDVElWRVIgcmVnaXN0ZXJzIFJaV0kuDQo+PiAz
LiBNYWtlIEk/QUNUSVZFUiByZXR1cm4gdGhlIG1vc3QgcmVjZW50IGtub3duIHZhbHVlOyBpLmUu
IEtWTeKAmXMgY3VycmVudCBiZWhhdmlvciAoYXMgZmFyIGFzIHdlIHVuZGVyc3RhbmQgaXQpDQo+
PiA0LiBVc2UgYSBzaW1wbGUgSVBJIHdpdGggZG9fbm9vcCB0byB1cGRhdGUgST9BQ1RJVkVSDQo+
PiA0YS4gIFVzZSBhbiBJUEksIGJ1dCBjb21lIHVwIHdpdGggY2xldmVyIHRyaWNrcyB0byBhdm9p
ZCBpbnRlcnJ1cHRpbmcgZ3Vlc3RzIGhhbmRsaW5nIElSUXMuDQo+PiA1LiBUcmFwIHRvIFhlbiBv
biBndWVzdCBFT0ksIHNvIHRoYXQgd2Uga25vdyB3aGVuIHRoZQ0KPj4gNi4gU29tZSBjbGV2ZXIg
cGFyYXZpcnR1YWxpemVkIG9wdGlvbg0KPiANCj4gNy4gVXNlIGFuIElQSSBpZiB3ZSBhcmUgY29u
ZmlkZW50IHRoZSBpbnRlcnJ1cHRzIG1heSBiZSBhY3RpdmUuDQoNCkkgZG9u4oCZdCB1bmRlcnN0
YW5kIHRoaXMgb25lLiAgSG93IGlzIGl0IGRpZmZlcmVudCB0aGFuIDQgb3IgNGE/ICBBbmQgaW4g
cGFydGljdWxhciwgaG93IGRvZXMgaXQgZXZhbHVhdGUgb24gdGhlIOKAnGhvdyBtdWNoIGFkZGl0
aW9uYWwgZGVzaWduIHdvcmsgd291bGQgaXQgdGFrZeKAnSBjcml0ZXJpYT8NCg0KIC1HZW9yZ2UN
Cg0K

