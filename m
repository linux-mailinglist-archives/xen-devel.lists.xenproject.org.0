Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD469B3C08
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 16:01:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9rUr-0004Cn-As; Mon, 16 Sep 2019 13:56:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aiU4=XL=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i9rUp-0004Ci-O9
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 13:56:51 +0000
X-Inumbo-ID: d4bc2fb0-d889-11e9-b76c-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4bc2fb0-d889-11e9-b76c-bc764e2007e4;
 Mon, 16 Sep 2019 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568642211;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zlsc2gicu3Wcr7Q1GPfnKjHK2ObO+er1Wk7dl7fBVNE=;
 b=LBSbriNtzMjdh/yK60VsBrCa4zn+tiDSVgOZT5Iu2uFt6ZhJZu/V3fQd
 PG5AtLCyie4F21ghYMboU8Zdt+9GZ//u6AkeIwlLByfFIzrlRhTaScG6X
 KRpbMFdXBL24ljDCOWMdG21snHyudvTypFpgwgDXJANwi2y3luNOd3LZH s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /4exTa1P/eaX/zdI91XPludW7PUj73V2a0Epwy+UIAzTrJQQonxxTzPlVv3fOXBogcr6gKuEqg
 S28IXfpVr7KPiLpWxYmTjNIcFRYKDUvPj/mn1P8YmAsIfMyQpxOo3IjB0G0RVn/z6j6H3UL+Vu
 UxMIHCFxiwzHF+UeKIM2R8TFP7JC9JOOSXRmGvAJfAOrY9MAmrvJvHlJkRNPvOnHQazEcq2QkM
 /JxaamRYYhzuqkNJlzvxC2iLVDzSIBZzOKxfdgZ8eOAI268FUdSKgAxPrdckxNmtGckhMl1aeG
 V30=
X-SBRS: 2.7
X-MesageID: 5671637
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,512,1559534400"; 
   d="scan'208";a="5671637"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Wei Liu' <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Thread-Topic: [PATCH] x86/viridian: Reword HV_X64_MSR_CRASH_CTL print message
Thread-Index: AQHVakzfjc+5AN/Pck2FIcRisbbuAqcsonAQgAGBTICAACG5sP//5V2AgAAEaICAACkewA==
Date: Mon, 16 Sep 2019 13:56:46 +0000
Message-ID: <1dc90060013844dab69b6a1347a80d6c@AMSPEX02CL03.citrite.net>
References: <20190913160404.495-1-andrew.cooper3@citrix.com>
 <02785fd186584f12bf364a6949ff8a4d@AMSPEX02CL03.citrite.net>
 <302a0acc-618f-5793-5840-36d80881d07f@citrix.com>
 <3a73e41c33f24bbbbae1f6deb5a9e05e@AMSPEX02CL03.citrite.net>
 <387b2c9f-78e2-8c50-b702-b65d3ccb5787@citrix.com>
 <CAK9nU=oMcuiJzMO+GvGnGzHKF=DYCvXpQr5y1x2pwdayf9kxsg@mail.gmail.com>
In-Reply-To: <CAK9nU=oMcuiJzMO+GvGnGzHKF=DYCvXpQr5y1x2pwdayf9kxsg@mail.gmail.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pg0KPiBTZW50OiAxNiBTZXB0ZW1iZXIgMjAxOSAxNDoyOQ0KPiBUbzogQW5kcmV3IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4NCj4gQ2M6IFBhdWwgRHVycmFudCA8UGF1bC5EdXJy
YW50QGNpdHJpeC5jb20+OyBYZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zz47IEphbiBCZXVsaWNoDQo+IDxKQmV1bGljaEBzdXNlLmNvbT47IFdlaSBMaXUgPHdsQHhlbi5v
cmc+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSB4ODYvdmlyaWRpYW46IFJld29yZCBIVl9YNjRfTVNSX0NSQVNIX0NUTCBwcmlu
dCBtZXNzYWdlDQo+IA0KPiBPbiBNb24sIDE2IFNlcCAyMDE5IGF0IDE0OjEzLCBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gWy4uLl0NCj4gPiA+Pj4+
IFJlcGxhY2UgdGhlIFZJUklESUFOIHByZWZpeCB3aXRoICdyZXBvcnRlZCcgdG8gcmVkdWNlIHRo
ZSBjb25mdXNpb24gdG8NCj4gPiA+Pj4+IG5vbi14ZW4tZGV2ZWxvcGVycyB0cnlpbmcgdG8gaW50
ZXJwcmV0IHRoZSBtZXNzYWdlLg0KPiA+ID4+PiBUaGlzIGlzIGEgbWVzc2FnZSB0aGF0IGlzIHBl
Y3VsaWFyIHRvIFdpbmRvd3MgVk1zLCBzbyBob3cgYWJvdXQgIldpbmRvd3MgVk0gQ1JBU0giPw0K
PiA+ID4+IEkgcHJlc3VtZSB5b3UgbWVhbiBwYXJ0aWN1bGFyLCBidXQgbm8gLSBpdCBpc24ndCB3
aW5kb3dzIHdoaWNoIGlzIHRoZQ0KPiA+ID4+IGV4Y2x1c2l2ZSB1c2VyIG9mIHRoaXMgaW50ZXJm
YWNlLiAgTGludXggaGFzIGEgZHJpdmVyIHRvIHVzZSBpdCB3aGVuDQo+ID4gPj4gcnVubmluZyB1
bmRlciBIeXBlclYuDQo+ID4gPiBIbW0sIHRoYXQncyBhIGJpdCBvZGQuIEkgdGhvdWdodCB0aGUg
Y3Jhc2ggY29kZXMgYXJlIFdpbmRvd3Mgc3BlY2lmaWMuIFBlcmhhcHMgdGhleSBjYW4gYmUNCj4g
ZGlzdGluZ3Vpc2hlZCBpbiBzb21lIHdheS4NCj4gPg0KPiA+IExpbnV4IHNldHMgaXRzIG93biBn
dWVzdCBPUyBpZGVudGlmaWVyLCB3aGljaCBpcyBzb21lIGZ1bmN0aW9uIG9mDQo+ID4gSFZfTElO
VVhfVkVORE9SX0lELg0KPiA+DQo+ID4gPiAgQWxsIHRoZSBzYW1lLCB0aGUgbG9nIGxpbmUgbmVl
ZHMgdG8gbGVhZCBwZW9wbGUgdG8gc29tZSB3YXkgb2YgZGVjb2RpbmcgdGhlIG1hZ2ljIG51bWJl
cnMgSQ0KPiB0aGluay4gSG93IGFib3V0Og0KPiA+ID4NCj4gPiA+ICJWSVJJRElBTiBSRVBPUlRF
RCBDUkFTSCINCj4gPiA+DQo+ID4gPiA/DQo+ID4NCj4gPiBUaGF0IGlzIHN0aWxsIGp1c3QgYXMg
Y29uZnVzaW5nIHRvIHJlYWQuDQo+ID4NCj4gPiBUaGVyZSBpcyBubyB3YXkgdG8gZGVjb2RlIHRo
ZSBudW1iZXJzIHdpdGhvdXQga25vd2luZyB3aGF0IE9TIGlzDQo+ID4gcnVubmluZywgYW5kIHNp
bXBseSBzYXlpbmcgIlZpcmlkaWFuIiBkb2Vzbid0IGhlbHAgd2l0aCB0aGF0Lg0KPiA+DQo+IA0K
PiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGNhbGwgZHVtcF9ndWVzdF9vc19pZCBoZXJlIGFzIHdl
bGw/IFNlZWluZyB0aGF0DQo+IGl0IGlzIG9ubHkgcHJpbnRlZCB3aGVuIGl0IHdhcyBmaXJzdCBz
ZXQuDQoNClllcywgdGhhdCdzIG5vdCBhIGJhZCBpZGVhLg0KDQogIFBhdWwNCg0KPiANCj4gV2Vp
Lg0KPiANCj4gPiB+QW5kcmV3DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
