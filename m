Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EEB8B049
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:56:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQhA-0002Zv-Pj; Tue, 13 Aug 2019 06:54:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mJ6=WJ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxQh9-0002Yy-47
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:54:11 +0000
X-Inumbo-ID: 549e4c60-bcea-11e9-a27b-fbd55888083d
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 549e4c60-bcea-11e9-a27b-fbd55888083d;
 Mon, 12 Aug 2019 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565605025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ne8mspyOZO6XIPFtpPsuAjHE01pVQ5mb0ZOxQRKJtaA=;
 b=e3r7TyUWcnPqnJyAXMlU3oNAH/3j0zEQa8OMKhmr93BLb6OxnGu0IUX8
 IYe/M+oPoub8a7iLpmxHiRIGqzUV+fk0GcVeg/LloLyutP51RehzuOrYK
 +moaiJmKpnPHKuQBVVvYyU7iWYqxhqM6brx44xDVtnRv7yrUbu6YS+nQu Q=;
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
IronPort-SDR: dnZF3IyhggfIZAZxEmiVXc2h/ZIotecxHkyD10OVMGXlbsNEhUWxL0x4eLlpqgJrgjOnrmJAOI
 Cuhe3EOFgxLAGTXCZwkPbtRjv9rZBmdrNVLml1aldH3vvfwAL17U8A+t5WVqeujlwr3Z2oR/Br
 LX48qEpi+xrbHV+KEJ1N6PZkTbCacaj3xzbuWnMVK1Sd2orCB4O1U49D+2NHx3z5p33mxzmVka
 Jw8C3OGSU9S8HDve5X8LjBGFVB8Eq0lkgN6NDa/D8EvZytpZCP6F/53GrvVA6yvX8wLiMj1BU1
 NMA=
X-SBRS: 2.7
X-MesageID: 4189389
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4189389"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/iommu: remove usage of
 {set/clear}_identity_p2m_entry against PV domains
Thread-Index: AQHVSRPQKykZANUCHEyR6BsaIzKLVqb3Wzvw
Date: Mon, 12 Aug 2019 10:17:00 +0000
Message-ID: <30be41c9e8bb4c239f9f67282a53a52b@AMSPEX02CL03.citrite.net>
References: <20190802092227.43058-1-roger.pau@citrix.com>
In-Reply-To: <20190802092227.43058-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/iommu: remove usage of
 {set/clear}_identity_p2m_entry against PV domains
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Roman Shaposhnik <roman@zededa.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAwMiBBdWd1c3QgMjAxOSAxMDoyMg0KPiBUbzog
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPjsgUm9tYW4gU2hhcG9zaG5payA8cm9tYW5AemVkZWRhLmNvbT47
IEdlb3JnZSBEdW5sYXANCj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+OyBQYXVsIER1cnJhbnQNCj4gPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0hdIHg4Ni9pb21tdTogcmVtb3ZlIHVzYWdlIG9mIHtzZXQvY2xlYXJ9X2lk
ZW50aXR5X3AybV9lbnRyeSBhZ2FpbnN0IFBWIGRvbWFpbnMNCj4gDQo+IFN3aXRjaCBybXJyX2lk
ZW50aXR5X21hcHBpbmcgdG8gdXNlIGlvbW11X3t1bn1tYXAgaW4gb3JkZXIgdG8NCj4gZXN0YWJs
aXNoIFJNUlIgbWFwcGluZ3MgZm9yIFBWIGRvbWFpbnMsIGxpa2UgaXQncyBkb25lIGluDQo+IGFy
Y2hfaW9tbXVfaHdkb21faW5pdC4gVGhpcyBzb2x2ZXMgdGhlIGlzc3VlIG9mIGEgUFYgaGFyZHdh
cmUgZG9tYWluDQo+IG5vdCBnZXR0aW5nIFJNUlIgbWFwcGluZ3MgYmVjYXVzZSB7c2V0L2NsZWFy
fV9pZGVudGl0eV9wMm1fZW50cnkgd2FzDQo+IG5vdCBwcm9wZXJseSB1cGRhdGluZyB0aGUgaW9t
bXUgcGFnZSB0YWJsZXMuDQo+IA0KDQpJJ20gbm90IHN1cmUgdGhpcyBpcyB0aGUgcmlnaHQgYXBw
cm9hY2guIFRCSCBpdCdzIG5vdCBjbGVhciB0byBtZSBleGFjdGx5IHdoYXQgcm9sZSB0aGUgUDJN
IGNvZGUgc2hvdWxkIHBsYXkgZm9yIGEgUFYgZG9tYWluIChJJ20gZ3Vlc3NpbmcgaXQncyBwcm9i
YWJseSB0aGVyZSBzbyB0aGF0IHNoYWRvd2luZyBjYW4gYmUgdHVybmVkIG9uKSBidXQgaXQgd291
bGQgbWFrZSBtb3JlIHNlbnNlIHRvIG1lIGlmIGZld2VyIHBhdGhzIHdlbnQgcm91bmQgdGhlIHNp
ZGUgb2YgaXQgYW5kIHRoZSBpbnRlcm5hbHMgaGFuZGxlZCBhbGwgb2YgdGhlIFBWL0hWTSBkaWZm
ZXJlbmNlcy4NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
