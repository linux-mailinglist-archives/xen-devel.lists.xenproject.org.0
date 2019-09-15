Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94404B2FC5
	for <lists+xen-devel@lfdr.de>; Sun, 15 Sep 2019 13:55:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9T3b-0004ET-Hs; Sun, 15 Sep 2019 11:51:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wfLu=XK=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i9T3Z-0004EO-Pk
 for xen-devel@lists.xenproject.org; Sun, 15 Sep 2019 11:51:05 +0000
X-Inumbo-ID: 182bcd2c-d7af-11e9-b299-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 182bcd2c-d7af-11e9-b299-bc764e2007e4;
 Sun, 15 Sep 2019 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568548264;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zhFe5iMkqvGW/d/2c/plDfFgJRXzG6AG//Ul/Ok/irE=;
 b=c647uIgPVrrrqcxZAWL6RTDrAQ3ZefnP3VqbusZTuVrh1WusIoKrAlP8
 NA18NYmzA7y7YtO9TPD3ihkjdInHnCMYJjm+X7lPhBRN8Kpl4fumuMYYd
 ZuLSVM5cHpxp0JRWVHrd5DxhFEm5d4d5pEGT31/gUaW5G8k8qY1i5saNd Y=;
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
IronPort-SDR: Vyg1KmTIZyZtc1WP5kw/aqisdrIYSiwpswa0dYiwQ2xJAVtP/4uC0D3ed6VfG5oO8KKSBoRULS
 oXway/9MdeHDYbN/PwJIL8ZoW91Qe7HTgXNIz3TmZDWlCow65TxPgzhjXjOSi1M5UpPCh6Jziy
 d58YKEfEpdHb2c2aStsptBtDRZ1WBAUayut1TNKkYwDTyJ4Phx8Rwp3munCJz+YScsAzPraw7Z
 304UTSI3DEdVKPytdWssQE9l9mjpwj3ztFYtoH9NcPozvUYMDRiU3fk1yBy3wi+EJLV+8je0Tz
 mGU=
X-SBRS: 2.7
X-MesageID: 5783564
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,508,1559534400"; 
   d="scan'208";a="5783564"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/viridian: Reword HV_X64_MSR_CRASH_CTL print message
Thread-Index: AQHVakzfjc+5AN/Pck2FIcRisbbuAqcsonAQ
Date: Sun, 15 Sep 2019 11:51:00 +0000
Message-ID: <02785fd186584f12bf364a6949ff8a4d@AMSPEX02CL03.citrite.net>
References: <20190913160404.495-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190913160404.495-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/viridian: Reword HV_X64_MSR_CRASH_CTL
 print message
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAxMyBTZXB0ZW1iZXIgMjAxOSAxNzowNA0K
PiBUbzogWGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+DQo+IENjOiBB
bmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47DQo+IFJvZ2VyIFBhdSBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRy
aXguY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIHg4Ni92aXJpZGlhbjogUmV3b3JkIEhWX1g2NF9N
U1JfQ1JBU0hfQ1RMIHByaW50IG1lc3NhZ2UNCj4gDQo+IE1lc3NhZ2Ugc3VjaCBhczoNCj4gDQo+
ICAgKFhFTikgZDN2MCBWSVJJRElBTiBDUkFTSDogNTEgMSBmZmZmOTcwMGUxNDZiMDAwIDEwMDAg
MjA0DQo+IA0KPiBoYXZlIGNvbmZ1c2VkIG1hbnkgcGVvcGxlIGludG8gdGhpbmtpbmcgdGhlIHRo
ZSBwcm9ibGVtIGlzIGEgYnVnIGluIHRoZQ0KPiB2aXJpZGlhbiBjb2RlLiAgVGhlIHByZWZpeCB3
YXMgaW50ZW5kZWQgdG8gc2lnbmlmeSB0aGUgdXNlIG9mIHRoZSB2aXJpZGlhbg0KPiBjcmFzaC1y
ZXBvcnRpbmcgaW50ZXJmYWNlLg0KPiANCj4gUmVwbGFjZSB0aGUgVklSSURJQU4gcHJlZml4IHdp
dGggJ3JlcG9ydGVkJyB0byByZWR1Y2UgdGhlIGNvbmZ1c2lvbiB0bw0KPiBub24teGVuLWRldmVs
b3BlcnMgdHJ5aW5nIHRvIGludGVycHJldCB0aGUgbWVzc2FnZS4NCg0KVGhpcyBpcyBhIG1lc3Nh
Z2UgdGhhdCBpcyBwZWN1bGlhciB0byBXaW5kb3dzIFZNcywgc28gaG93IGFib3V0ICJXaW5kb3dz
IFZNIENSQVNIIj8NCg0KIFBhdWwNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENDOiBKYW4gQmV1bGljaCA8
SkJldWxpY2hAc3VzZS5jb20+DQo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBDQzogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IENDOiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KPiANCj4gVGhpcyB3YW50cyBiYWNrcG9ydGluZyB0
byBldmVyeSBzdGFibGUgdHJlZSB3aGljaCBoYXMgdmlyaWRpYW4gY3Jhc2ggaW50ZXJmYWNlDQo+
IHN1cHBvcnQuDQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5j
IHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5j
IGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5jDQo+IGluZGV4IDRiMDZiNzhh
MjcuLmY5OGM4ZTc3NTMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4v
dmlyaWRpYW4uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMN
Cj4gQEAgLTM1Nyw3ICszNTcsNyBAQCBpbnQgZ3Vlc3Rfd3Jtc3JfdmlyaWRpYW4oc3RydWN0IHZj
cHUgKnYsIHVpbnQzMl90IGlkeCwgdWludDY0X3QgdmFsKQ0KPiAgICAgICAgICBkLT5zaHV0ZG93
bl9jb2RlID0gU0hVVERPV05fY3Jhc2g7DQo+ICAgICAgICAgIHNwaW5fdW5sb2NrKCZkLT5zaHV0
ZG93bl9sb2NrKTsNCj4gDQo+IC0gICAgICAgIGdwcmludGsoWEVOTE9HX1dBUk5JTkcsICJWSVJJ
RElBTiBDUkFTSDogJWx4ICVseCAlbHggJWx4ICVseFxuIiwNCj4gKyAgICAgICAgZ3ByaW50ayhY
RU5MT0dfV0FSTklORywgInJlcG9ydGVkIENSQVNIOiAlbHggJWx4ICVseCAlbHggJWx4XG4iLA0K
PiAgICAgICAgICAgICAgICAgIHZ2LT5jcmFzaF9wYXJhbVswXSwgdnYtPmNyYXNoX3BhcmFtWzFd
LCB2di0+Y3Jhc2hfcGFyYW1bMl0sDQo+ICAgICAgICAgICAgICAgICAgdnYtPmNyYXNoX3BhcmFt
WzNdLCB2di0+Y3Jhc2hfcGFyYW1bNF0pOw0KPiAgICAgICAgICBicmVhazsNCj4gLS0NCj4gMi4x
MS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
