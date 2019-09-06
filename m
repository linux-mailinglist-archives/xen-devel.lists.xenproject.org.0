Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF2CAB3AB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 10:04:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i69BO-0006qi-O3; Fri, 06 Sep 2019 08:01:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gwiz=XB=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i69BM-0006qc-SF
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 08:01:24 +0000
X-Inumbo-ID: 84ce5c40-d07c-11e9-b76c-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84ce5c40-d07c-11e9-b76c-bc764e2007e4;
 Fri, 06 Sep 2019 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567756884;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9EvyVQ6CXAfov0CprmuPkczjhr6kQPE0iqSO6FYtPM4=;
 b=XRs/yfs5Oz1iXd7DZl0/GspgIZzTYWq22qSkhkqcZPEjDrrhmGPsO5TJ
 pgHqHlVPQ1fKwEZEW88P2HDzsaZpot3hO2rVBpeLFCijexO1QAy1BrySH
 xD8icbNURF4x8xGDGBJJH3P19Hd+VQ+lTBdEzSJTsOUeAUW2PtZuutYbH o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 25CbaKoiH/PvSuOaKX0XJwrfj931ZcgSjINaEuLdMe3GEkXMCPD+LljgnikFOpFHiLDywZ60HE
 1Hcj60Anv2X6lO+boQwWBxeLUoSBeU4Tw/T+YkGy3IVSqR3xcWJel3ZXoob5M0uwRgVCu0M0zE
 Q3Mc87SWMD5l3knUdzEGECASOvHWbHmm7RBmP/Qmx7z+sxBaVS4Uhg6PJJLDVu7wLIzcmc8Gk3
 afNpTmGZKvP8bKY1Udt5SHiM45KXHXYd6MmNdHAwGkYrV0UWFzDqydSU3jFpLU0FcXTotRk5oZ
 7Sg=
X-SBRS: 2.7
X-MesageID: 5226860
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5226860"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v8 6/6] introduce a 'passthrough' configuration option to
 xl.cfg...
Thread-Index: AQHVYZ3BVliWykp8OkmOOtrtC3gyGKcdY/wAgADrCGA=
Date: Fri, 6 Sep 2019 08:01:18 +0000
Message-ID: <22bc88076a3e45d1bad319e2254f5c87@AMSPEX02CL03.citrite.net>
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-7-paul.durrant@citrix.com>
 <e4c93c53-389e-c31d-cba5-19eb1c06ed24@arm.com>
In-Reply-To: <e4c93c53-389e-c31d-cba5-19eb1c06ed24@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 6/6] introduce a 'passthrough'
 configuration option to xl.cfg...
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
 George Dunlap <George.Dunlap@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPg0KPiBTZW50OiAwNSBTZXB0ZW1iZXIgMjAxOSAyMDo1OQ0KPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgSWFu
IEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsN
Cj4gQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5s
YXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEtvbnJhZCBSemVzenV0ZWsNCj4gV2lsayA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IFRpbSAoWGVuLm9yZykNCj4gPHRpbUB4ZW4ub3JnPjsgQW50aG9ueSBQZXJh
cmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBDaHJpc3RpYW4gTGluZGlnDQo+IDxjaHJp
c3RpYW4ubGluZGlnQGNpdHJpeC5jb20+OyBEYXZpZCBTY290dCA8ZGF2ZUByZWNvaWwub3JnPjsg
Vm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
OCA2LzZdIGludHJvZHVjZSBhICdwYXNzdGhyb3VnaCcgY29uZmlndXJhdGlvbiBvcHRpb24gdG8g
eGwuY2ZnLi4uDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDkvMi8xOSAzOjUwIFBNLCBQYXVsIER1cnJh
bnQgd3JvdGU6DQo+ID4gQEAgLTI2Myw5ICsyNjMsMTcgQEAgc3RydWN0IGRvbWFpbl9pb21tdSB7
DQo+ID4gICAgICAgREVDTEFSRV9CSVRNQVAoZmVhdHVyZXMsIElPTU1VX0ZFQVRfY291bnQpOw0K
PiA+DQo+ID4gICAgICAgLyoNCj4gPiAtICAgICAqIERvZXMgdGhlIGd1ZXN0IHJlcWlyZSBtYXBw
aW5ncyB0byBiZSBzeW5jaG9uaXplZCwgdG8gbWFpbnRhaW4NCj4gPiAtICAgICAqIHRoZSBkZWZh
dWx0IGRmbiA9PSBwZm4gbWFwLiAoU2VlIGNvbW1lbnQgb24gZGZuIGF0IHRoZSB0b3Agb2YNCj4g
PiAtICAgICAqIGluY2x1ZGUveGVuL21tLmgpLg0KPiA+ICsgICAgICogRG9lcyB0aGUgZ3Vlc3Qg
c2hhcmUgSEFQIG1hcHBpbmcgd2l0aCB0aGUgSU9NTVU/IFRoaXMgaXMgYWx3YXlzDQo+ID4gKyAg
ICAgKiB0cnVlIGZvciBBUk0gc3lzdGVtcyBhbmQgbWF5IGJlIHRydWUgZm9yIHg4NiBzeXN0ZW1z
IHdoZXJlIHRoZQ0KPiA+ICsgICAgICogdGhlIGhhcmR3YXJlIGlzIGNhcGFibGUuDQo+ID4gKyAg
ICAgKi8NCj4gDQo+IEkgYW0gd29ycmllZCB0aGF0IHN1Y2ggY29tbWVudCBtYXkgcm90IG92ZXIg
dGhlIHRpbWUuIEZvciBpbnN0YW5jZSwgaWYNCj4gd2UgZWl0aGVyIGFkZCBhIG5ldyBhcmNoaXRl
Y3R1cmUgb3IgZGVjaWRlIHRvIHN0b3Agc2hhcmluZyBQVCBvbiBBcm0uDQo+IA0KPiBJIHZhZ3Vl
bHkgcmVjYWxsIHNvbWUgcG90ZW50aWFsIGlzc3VlcyB3aXRoIHRoZSBNU0kgZG9vcmJlbGxzIHRo
YXQgd291bGQNCj4gcmVxdWlyZSB1cyB0byB1bnNoYXJlIHRoZSBQVCB3aGVuIHRoZXkgd2lsbCBi
ZSBzdXBwb3J0ZWQgaW4gZ3Vlc3QuDQo+IA0KPiBJIHdvdWxkIHN1Z2dlc3QgdG8gZWl0aGVyIHJl
ZmVycyB0byB0aGUgaW1wbGVtZW50YXRpb24gb2YNCj4gaW9tbXVfdXNlX2hhcF9wdCgpIG9yIGRy
b3AgY29tcGxldGVseSB0aGUgc2Vjb25kIHNlbnRlbmNlLg0KDQpPaywgSSdsbCBqdXN0IGRyb3Ag
dGhlIHNlbnRlbmNlLg0KDQogIFBhdWwNCg0KPiANCj4gPiArICAgIGJvb2wgaGFwX3B0X3NoYXJl
Ow0KPiA+ICsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBEb2VzIHRoZSBndWVzdCByZXF1aXJl
IG1hcHBpbmdzIHRvIGJlIHN5bmNocm9uaXplZCwgdG8gbWFpbnRhaW4NCj4gPiArICAgICAqIHRo
ZSBkZWZhdWx0IGRmbiA9PSBwZm4gbWFwPyAoU2VlIGNvbW1lbnQgb24gZGZuIGF0IHRoZSB0b3Ag
b2YNCj4gPiArICAgICAqIGluY2x1ZGUveGVuL21tLmgpLiBOb3RlIHRoYXQgaGFwX3B0X3NoYXJl
ID09IGZhbHNlIGRvZXMgbm90DQo+ID4gKyAgICAgKiBuZWNlc3NhcmlseSBpbXBseSB0aGlzIGlz
IHRydWUuDQo+ID4gICAgICAgICovDQo+ID4gICAgICAgYm9vbCBuZWVkX3N5bmM7DQo+ID4gICB9
Ow0KPiA+IEBAIC0yNzUsOCArMjgzLDcgQEAgc3RydWN0IGRvbWFpbl9pb21tdSB7DQo+ID4gICAj
ZGVmaW5lIGlvbW11X2NsZWFyX2ZlYXR1cmUoZCwgZikgY2xlYXJfYml0KGYsIGRvbV9pb21tdShk
KS0+ZmVhdHVyZXMpDQo+ID4NCj4gPiAgIC8qIEFyZSB3ZSB1c2luZyB0aGUgZG9tYWluIFAyTSB0
YWJsZSBhcyBpdHMgSU9NTVUgcGFnZXRhYmxlPyAqLw0KPiA+IC0jZGVmaW5lIGlvbW11X3VzZV9o
YXBfcHQoZCkgXA0KPiA+IC0gICAgKGhhcF9lbmFibGVkKGQpICYmIGlzX2lvbW11X2VuYWJsZWQo
ZCkgJiYgaW9tbXVfaGFwX3B0X3NoYXJlKQ0KPiA+ICsjZGVmaW5lIGlvbW11X3VzZV9oYXBfcHQo
ZCkgICAgICAgKGRvbV9pb21tdShkKS0+aGFwX3B0X3NoYXJlKQ0KPiA+DQo+ID4gICAvKiBEb2Vz
IHRoZSBJT01NVSBwYWdldGFibGUgbmVlZCB0byBiZSBrZXB0IHN5bmNocm9uaXplZCB3aXRoIHRo
ZSBQMk0gKi8NCj4gPiAgICNpZmRlZiBDT05GSUdfSEFTX1BBU1NUSFJPVUdIDQo+ID4NCj4gDQo+
IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
