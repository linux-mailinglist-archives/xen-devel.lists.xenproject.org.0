Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B0AB62F1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 14:17:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAYr5-0003kz-4C; Wed, 18 Sep 2019 12:14:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ym9G=XN=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iAYr3-0003km-GT
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 12:14:41 +0000
X-Inumbo-ID: e3b3f5f4-da0d-11e9-9630-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3b3f5f4-da0d-11e9-9630-12813bfff9fa;
 Wed, 18 Sep 2019 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568808880;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=p/5TAXDDgzJMfPuqjileocqPIjebcIWVYmQuSHoZbUs=;
 b=N8f5qUqGRsD6v41RLYDCVkbY7t0IuG7LifX1dHeK8lQSxPArR5mVAaxL
 xc+Y0CYoakGon5aKaRL+qfUSGHALhmRw+x789h0P0Vr7qLXBvstTRzKY7
 RQt15UPAEFzG5O8dBiG/MI8UslCYRyDNodqr/H8n5p84+JtWJugGbVFbM M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Az5w1HGDJ97jCkcPCfdz20FLiAh7IPSQwqeUuaKB7BPqp8qJPL8oQXzhadJSB8JpGMoTf49yJw
 /2660o81lgASNadqnsEEmYFdhPIfM7z45bvL/tQMVuLKca0Gcqt/FSYdOkmha0fxHId9jpgpdH
 rhlu3selhshe75q7Eb4a3fjNosWke90CrZUj+KVfVYpPwhhEm32bZ8xo3VFC4Dpn/8IHP7RN5/
 ZiSNOQn9wKs3STyBezJ5/utG3nrX9W8sem+L7PRv7WQjn7Va+2Au0KsVt8j3h+tp9c2Y1Qg7nc
 MlA=
X-SBRS: 2.7
X-MesageID: 6032356
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="6032356"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>
Thread-Topic: [PATCH] create-diff-object: more precisely identify .rodata
 sections
Thread-Index: AQHVbfOz/MMBt+ID2EWJUuzwV092UacxMOkAgAAAuYD//+ijAIAAA2sAgAAJeQCAACFwgA==
Date: Wed, 18 Sep 2019 12:14:35 +0000
Message-ID: <A8538C15-ACB4-4163-8345-2C1D9596690E@citrix.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
 <23938.2492.424579.175738@mariner.uk.xensource.com>
 <4b6e25f7-5bcf-e2bb-0ac8-0eaba9686e4e@arm.com>
In-Reply-To: <4b6e25f7-5bcf-e2bb-0ac8-0eaba9686e4e@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <3D76B1841576404A8BBD8D566A58834F@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE4LzA5LzIwMTksIDEyOjE1LCAiSnVsaWVuIEdyYWxsIiA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOg0KDQogICAgSGkgSWFuLA0KICAgIA0KICAgIE9uIDE4LzA5LzIwMTkg
MTE6NDEsIElhbiBKYWNrc29uIHdyb3RlOg0KICAgID4gSnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJl
OiBbUEFUQ0hdIGNyZWF0ZS1kaWZmLW9iamVjdDogbW9yZSBwcmVjaXNlbHkgaWRlbnRpZnkgLnJv
ZGF0YSBzZWN0aW9ucyIpOg0KICAgID4+IE9uIDE4LzA5LzIwMTkgMTA6NTIsIFdpZWN6b3JraWV3
aWN6LCBQYXdlbCB3cm90ZToNCiAgICA+Pj4gJCBzY3JpcHRzLy4vYWRkX21haW50YWluZXJzLnBs
IC1kIH4vZ2l0L2xpdmVwYXRjaC1idWlsZC10b29scw0KICAgID4+DQogICAgPj4gJy1kJyBvbmx5
IHRlbGxzIHlvdSB3aGVyZSB0aGUgcGF0Y2hlcyBmaWxlcyBhcmUuIFRoZSBzY3JpcHQgd2lsbCBs
b29rIHVwIGZvciB0aGUNCiAgICA+PiBNQUlOVEFJTkVSUyBmaWxlIGluIHRoZSBjdXJyZW50IGRp
cmVjdG9yeS4NCiAgICA+IA0KICAgID4gSG1tbS4gIEkgd29uZGVyIGlmIHdlIGNvdWxkIGRldGVj
dCB0aGlzIHNpdHVhdGlvbiBzb21laG93LiAgVGhpcyB3aWxsDQogICAgPiBiZSBhIGNvbW1vbiB1
c2VyIGVycm9yIEkgdGhpbmsuDQogICAgSSB0aGluayBpdCB3b3VsZCBiZSBwb3NzaWJsZSBmb3Ig
cGF0Y2ggbW9kaWZ5aW5nIGZpbGUuIFdlIGNvdWxkIGNoZWNrIHdoZXRoZXIgDQogICAgdGhlIGZp
bGUgbW9kaWZpZWQgZXhpc3QgaW4gdGhlIHJlcG8uIFRob3VnaCwgSSBhbSBub3Qgc3VyZSBob3cg
ZGlmZmljdWx0IGl0IA0KICAgIHdvdWxkIGJlIHRvIGltcGxlbWVudC4NCiAgICANClRoYXQgbWln
aHQgYmUgZG9hYmxlLCBidXQgd29uJ3QgYmUgZWFzeSBhcyBJIHdpbGwgZXNzZW50aWFsbHkgbmVl
ZCB0byBwYXJzZSB0aGUgcGF0Y2ggICAgDQpBbmQgaXQgd29uJ3QgYmUgcmVsaWFibGUuIA0KDQpU
aGUgb25seSB3b3JrYWJsZSB3YXkgb2YgZG9pbmcgdGhpcyBtYXkgYmUgdG8gaGF2ZSBhIHN0cm9u
ZyBjb252ZW50aW9uDQp0aGF0IHJlcXVpcmVzIHRvIHVzZSB0aGUgW1JFUE9OQU1FIFBBVENIXSB2
aWEgLS1zdWJqZWN0LXByZWZpeCB3aGVuIGdlbmVyYXRpbmcgdGhlIA0KcGF0Y2ggYW5kIGZvciBh
ZGRfbWFpbnRhaW5lcnMucGwgdG8gdmVyaWZ5IHRoaXMgc29tZWhvdyBiYXNlZCBvbiB0aGUgY3Vy
cmVudA0KZGlyZWN0b3J5IGFuZCB0aGUgcGF0Y2hlcy4NCg0KV2UgYWxyZWFkeSBoYXZlIHN0cm9u
ZyBjb252ZW50aW9ucyBpbiBzb21lIGNhc2VzLCBlLmcuIGZvciBPU1NURVNUIHdlIGFsd2F5cyB1
c2UNCltPU1NURVNUIFBBVENIXS4gVGhpcyB3b3VsZCBwb3RlbnRpYWxseSBiZSBoZWxwZnVsIGZv
ciB0aGUgQ0kgbG9vcCBwbGFucyBhc28uIA0KDQpBc3N1bWluZyB0aGVyZSBpcyBhIGdpdCBjb25m
aWcgc2V0dGluZyBmb3IgLS1zdWJqZWN0LXByZWZpeCB0aGVuIHRoaXMgY291bGQgYmUgbWFkZSAN
CnRvIHdvcmsuIEkgY291bGQgYWRkIGEgc2VjdGlvbiB1bmRlciBbMV0gdG8gZG9jdW1lbnQgdGhl
IGNvbnZlbnRpb24gd2l0aCB0aGUNCmFwcHJvcHJpYXRlIGdpdCBjb21tYW5kLiBXZSBjb3VsZCBp
bmNsdWRlIGEgc2NyaXB0IChlLmcuIHhlbi5naXQ6c2NyaXBzL2dpdC1zZXR1cCkgDQp3aGljaCBk
b2VzIHRoaXMgYmFzZWQgb24gdGhlIHJlcG8gbmFtZSBhdXRvbWF0aWNhbGx5Lg0KDQpBbnkgdmll
d3M/DQoNCkxhcnMNCg0KWzFdIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1p
dHRpbmdfWGVuX1Byb2plY3RfUGF0Y2hlcyNTZW5kaW5nX3RoZV9wYXRjaGVzX3RvX3RoZV9saXN0
IA0KIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
