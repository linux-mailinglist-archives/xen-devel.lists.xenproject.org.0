Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AE290123
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:11:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyb2g-0008Mn-3c; Fri, 16 Aug 2019 12:09:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hd7z=WM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hyb2e-0008Mh-My
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 12:09:12 +0000
X-Inumbo-ID: a7c0e9de-c01e-11e9-8bb5-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7c0e9de-c01e-11e9-8bb5-12813bfff9fa;
 Fri, 16 Aug 2019 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565957351;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=spFLcIa9Tl45MHp/uPW5k1ue6WpGF0YBFSza8LITjRo=;
 b=XDJ8psGL8FY4spP5NVEQi0U3Wf2JV85oDWyTvouLSzQAvHUrGWR7QGuH
 kNfK1VRueqXKI7JGpF3uk9RH+76mSzubWigbd/My1Gsmngw401rEZoaEM
 E+2kQWGXGE/79Kxmm8b+6JWAnnFs4toR1c9ZXr4v5EFJFHGKmI2maZvjL E=;
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
IronPort-SDR: ZmfBG9TNhhPNDB/HtxCwQKKx5VIBW3LM5brwsbbNhpoae3lgAbd+xxUvXQpOiDGi76Bnmqm58Q
 pFm2VpJ5xeIIyiMdgfDKUmzGxxSYyiJmvCI6diruz/5G+UwGpL+AgDEAMZ/pLOcpZUEidFVNBO
 q8SiAqEW3QR1CO/jV5RIGJbC5npkNpovz44fhER/4MBrHQ/LXbuXaam1ZfkojdMxFjU02B4WEZ
 pWyYhyLLKIxub2gDLRUOZtgRr0Vqm3GdTqgIzOLsilEFHhAVB9KKJIVFzYetTWaVOC/QC7bN/G
 TT4=
X-SBRS: 2.7
X-MesageID: 4578949
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,393,1559534400"; 
   d="scan'208";a="4578949"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>, Anthony Perard
 <anthony.perard@citrix.com>, Julien Grall <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [PATCH] get_maintainers.pl: Enable running the
 script on unikraft repos
Thread-Index: AQHVVB+OkCutqGzFZEax3jYHn7xs06b9eGYAgAAGSoCAAA01gIAAIl1g
Date: Fri, 16 Aug 2019 12:09:07 +0000
Message-ID: <3044b1da5b3442aea10d46f5d232cf0d@AMSPEX02CL03.citrite.net>
References: <4b535bb616f62ad685fef0f06d3b5138b1539688.1565951950.git.lars.kurth@citrix.com>
 <200d8505-6822-3d9f-98fe-e8d7e09d00b8@arm.com>
 <20190816111747.GB25409@perard.uk.xensource.com>
 <BE4FC00F-77B6-492C-8BBA-C3105FAA44F4@citrix.com>
In-Reply-To: <BE4FC00F-77B6-492C-8BBA-C3105FAA44F4@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] get_maintainers.pl: Enable running the
 script on unikraft repos
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
Cc: Felipe
 Huici <felipe.huici@neclab.eu>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George
 Dunlap <George.Dunlap@citrix.com>, Florian Schmidt <florian.schmidt@neclab.eu>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXJzIEt1cnRoIDxsYXJzLmt1
cnRoQGNpdHJpeC5jb20+DQo+IFNlbnQ6IDE2IEF1Z3VzdCAyMDE5IDEzOjA1DQo+IFRvOiBBbnRo
b255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
IEZlbGlwZSBIdWljaSA8ZmVsaXBlLmh1aWNpQG5lY2xhYi5ldT47IFN0ZWZhbm8gU3RhYmVsbGlu
aQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBLb25y
YWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UNCj4gRHVu
bGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29v
cGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tzb24NCj4gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+
OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IEZsb3JpYW4gU2NobWlkdCA8Zmxvcmlhbi5z
Y2htaWR0QG5lY2xhYi5ldT47DQo+IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFNp
bW9uIEt1ZW56ZXIgPHNpbW9uLmt1ZW56ZXJAbmVjbGFiLmV1PjsgUGF1bCBEdXJyYW50DQo+IDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRD
SF0gZ2V0X21haW50YWluZXJzLnBsOiBFbmFibGUgcnVubmluZyB0aGUgc2NyaXB0IG9uIHVuaWty
YWZ0IHJlcG9zDQo+IA0KPiBBZGRlZCBQYXVsIER1cnJhbnQNCj4gDQo+IO+7v09uIDE2LzA4LzIw
MTksIDEyOjE3LCAiQW50aG9ueSBQRVJBUkQiIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPiB3
cm90ZToNCj4gDQo+ICAgICBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAxMTo1NToxNkFNICswMTAw
LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ICAgICA+IEhpIExhcnMsDQo+ICAgICA+DQo+ICAgICA+
IE9uIDE2LzA4LzIwMTkgMTE6NDIsIExhcnMgS3VydGggd3JvdGU6DQo+ICAgICA+ID4gVW5pa3Jh
ZnQgcmVwb3MgZm9sbG93IHRoZSBzYW1lIHN5bnRheCBhcyB4ZW4uZ2l0IHdpdGggdGhlDQo+ICAg
ICA+ID4gZm9sbG93aW5nIGV4Y2VwdGlvbnM6DQo+ICAgICA+ID4gKiBNQUlOVEFJTkVSUyBmaWxl
cyBhcmUgY2FsbGVkIE1BSU5UQUlORVJTLm1kDQo+ICAgICA+ID4gKiBNOiAuLi4gZXRjIGJsb2Nr
cyBhcmUgcHJlY2VkZWQgYnkgd2hpdGVzcGFjZXMgZm9yIHJlbmRlcmluZyBhcw0KPiAgICAgPiA+
ICAgIG1hcmt1cCBmaWxlcw0KPiAgICAgPg0KPiAgICAgPiBUaGVyZSBpcyBhbiBvdGhlciBkaWZm
ZXJlbmNlLiBUaGUgImZhbGxiYWNrIiBjYXRlZ29yeSBpcyAiVU5JS1JBRlQgR0VORVJBTCINCj4g
ICAgID4gYW5kIG5vdCAiVEhFIFJFU1QiLg0KPiAgICAgPg0KPiAgICAgPiA+DQo+ICAgICA+ID4g
VGhpcyBjaGFuZ2Ugd2lsbA0KPiAgICAgPiA+IC0gbG9hZCBNQUlOVEFJTkVSUy5tZCBpZiBNQUlO
VEFJTkVSUyBpcyBub3QgcHJlc2VudA0KPiAgICAgPiA+IC0gZGVhbCB3aXRoIGluZGVudGVkIE06
IC4uLiBibG9ja3MNCj4gICAgID4NCj4gICAgID4gT25lIHByb2Nlc3MgcXVlc3Rpb24uIERvZXMg
aXQgbWVhbiBVbmlrcmFmdCBmb2xrcyB3aWxsIGhhdmUgdG8gY2hlY2tvdXQgWGVuDQo+ICAgICA+
IGluIG9yZGVyIHRvIHVzZSB7YWRkLCBnZXR9X21haW50YWluZXJzLnBsPyBJZiBzbywgd291bGQg
aXQgbWFrZSBzZW5zZSB0bw0KPiAgICAgPiBoYXZlIGFkZF9tYWludGFpbmVycy5wbCBhbmQgc2Ny
aXB0X21haW50YWluZXJzLnBsIGluIGEgc2VwYXJhdGUgcmVwbyB0aGF0DQo+ICAgICA+IGNhbiBi
ZSBhZGRlZCBhcyBzdWJtb2R1bGU/DQo+IA0KPiAgICAgU2hvdWxkbid0IGluc3RlYWQgdGhlIFVu
aWtyYWZ0IHJlcG8gaGF2ZSBpdCdzIG9uZSBnZXRfbWFpbnRhaW5lcnMNCj4gICAgIHNjcmlwdD8g
eGVuLmdpdCdzIHNjcmlwdCBkb2Vzbid0IG5lZWRzIHRvIGhhdmUgc3VwcG9ydCBmb3IgZXZlcnkg
c2luZ2xlDQo+ICAgICByZXBvIGF2YWlsYWJsZSBvbiBlYXJ0aCBhbmQgVW5pa3JhZnQgaXMgYSBk
aWZmZXJlbnQgcHJvamVjdCBhbnl3YXkuDQo+IA0KPiAgICAgVXN1YWxseSwgcHJvamVjdHMgd2l0
aCBhIE1BSU5UQUlORVJTIGZpbGUgaGF2ZSB0aGVyZSBvd24gZ2V0X21haW50YWluZXJzDQo+ICAg
ICBzY3JpcHQuDQo+IA0KPiBXZWxsOiBVbmlrcmFmdCBpcyBwYXJ0IG9mIHRoZSBYZW4gUHJvamVj
dC4NCj4gDQo+IFdoZW4gSSBzdGFydGVkIHRvIGNsZWFuIHVwIHRoZSBjb250cmlidXRpb24gZG9j
cyBpdCBiZWNhbWUgYXBwYXJlbnQgdGhhdA0KPiB0aGVyZSBpcyBhIGxvdCBvZiBpbmNvbnNpc3Rl
bmN5LiBJZGVhbGx5IG91ciBjb250cmlidXRpb24gZ3VpZGUgWzBdIHdvdWxkIGFwcGx5DQo+IHRv
IHByZXR0eSBtdWNoICphbGwqIHN1YiBwcm9qZWN0cyB3aGljaCB1c2UgYSBtYWlsaW5nIGxpc3Qg
YmFzZWQgd29ya2Zsb3dzDQo+IA0KPiBDb25zaXN0ZW5jeSBtYWtlcyBsaWZlIGZvciBkZXZlbG9w
ZXJzIGFuZCBhbHNvIG5ld2NvbWVycyBtdWNoIGVhc2llci4gQW5kIHRoZQ0KPiBudW1iZXIgb2Yg
bmV3IGRldnMgd2hvIHNlZW0gdG8gdHJpcCBvdmVyIGluY29uc2lzdGVuY2llcyBiZXR3ZWVuIHBy
b2plY3RzIGFyZQ0KPiBxdWl0ZSBsYXJnZSAod2UgaGFkIDMgIGNhc2VzIGluIDMgd2Vla3Mgd2hp
Y2ggSSBub3RpY2VkKS4NCj4gDQo+IElmIHdlIHN0YXJ0IGltcHJvdmluZyBvdXIgQ0kgaW5mcmFz
dHJ1Y3R1cmUgKHdoaWNoIHdlIGFyZSksIGl0IHdvdWxkIGJlIG5pY2UgaWYgb3RoZXINCj4gc3Vi
IHByb2plY3RzIGhhZCB0aGUgcG9zc2liaWxpdHkgdG8gZWFzaWx5IGhvb2sgaW50byBpdCBvciBy
ZXBsaWNhdGUgaXQuIEJ1dCB0aGF0IGRvZXMgcmVxdWlyZQ0KPiBzb21lIGNvbnNpc3RlbmN5Lg0K
PiANCj4gVGhhdCdzIHdoeSBJIHN1Ym1pdHRlZCBbMV0gYW5kIFsyXQ0KPiANCj4gU3ViLXByb2pl
Y3RzIHdpdGggbWFpbCBiYXNlZCB3b3JrZmxvd3MNCj4gMTogSHlwZXJ2aXNvcg0KPiAyOiBIeXBl
cnZpc29yIHJlbGF0ZWQgcmVwb3MgKGxpdmVwYXRjaC1idWlsZC10b29scywgbWluaS1vcywgeHRm
LCAuLi4pDQo+IDM6IFdpbmRvd3MgUFYgRHJpdmVycyAtIHdoaWNoIHdpbGwgcmVxdWlyZSBjaGFu
Z2VzIHRvIHRoZWlyIE1BSU5UQUlORVJTIGZpbGUNCj4gNDogVW5pa3JhZnQNCj4gDQo+IFN1cHBv
cnRpbmcgMSAtIDMgc2hvdWxkIGJlIHN0cmFpZ2h0Zm9yd2FyZCBiZWNhdXNlIHlvdSB3b3VsZCBh
bG1vc3QgYWx3YXlzDQo+IGhhdmUgeGVuLmdpdCBjaGVja2VkIG91dC4gNCBpcyBtb3JlIGRpZmZl
cmVudC4NCg0KSSdkIHNheSB0aGF0IGZvbGtzIGJ1aWxkaW5nIDMgYXJlIHVubGlrZWx5IHRvIGhh
dmUgeGVuLmdpdCBjaGVja2VkIG91dC4NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
