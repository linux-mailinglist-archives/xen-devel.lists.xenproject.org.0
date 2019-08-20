Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98EF95962
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 10:25:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzzOc-0001ux-B7; Tue, 20 Aug 2019 08:21:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WUBi=WQ=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1hzzOa-0001un-4p
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 08:21:36 +0000
X-Inumbo-ID: 8495cb35-c323-11e9-8bf4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8495cb35-c323-11e9-8bf4-12813bfff9fa;
 Tue, 20 Aug 2019 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566289293;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Mp3YIO/tt+oBwho7bCMkyhfNMPrtnKeyi2IaJIMDM58=;
 b=Jz56PkCVzKaL2uMjlWNlM3VcLfHn/FmZ6yoy6hi4cSFEaxNDj+jQbbuP
 Ka0pCn3N0Oh7gsrSvLHoWYyOfmYFHYXIxvFoBViT7cAofs0TkKo2d3blj
 8zL3Pc1cr7ID9tPCedl8Wf6IqLZlN+PKb5oL4VmMx4Q6dTGhNe0zZpQYh Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nvGiC/RxAdsIO3ddDrWKIzVgpZ0IY2RIhZMXoIbmgy/S05oZtq/I1NXp7fmd0QgJMD2w4yo3ib
 B4eiKL/vgSr0ErDL6nF63Gd3D3sEC3+Ejp/E37IMw7s91HXOAraqgzUJE2stb2wOK5OdWzNSQz
 YiWS618EbX7Fjq+604HFK9ydijBhB7XLTm8CmN4UlVCm7QjIOe93oUCrUugD5nwAfyL7U+0Nom
 gpsffXgOO0Q777KggaEpbQkKaA1P+Js3rbe4FZFp5awoXzxnHNY30iyZCoE7Aji0Pins8XN0oL
 sUQ=
X-SBRS: 2.7
X-MesageID: 4671941
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4671941"
From: Christian Lindig <christian.lindig@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Thread-Topic: [PATCH] tools/oxenstored: port XS_INTRODUCE evtchn rebind
 function from cxenstored
Thread-Index: AQHVVr5MK6au/yYrc0WquZUXd0SG76cDkYSA
Date: Tue, 20 Aug 2019 08:21:29 +0000
Message-ID: <7DFC36D5-7354-4D82-87A6-364FEDEAFAFC@citrix.com>
References: <1566240335-6614-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1566240335-6614-1-git-send-email-igor.druzhinin@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <23165C45454F084DAC34CAF9FC217A87@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] tools/oxenstored: port XS_INTRODUCE evtchn
 rebind function from cxenstored
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, "wl@xen.org" <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiArCQkJaWYgKERvbWFpbi5nZXRfbWZuIGVkb20pID0gbWZuICYmIChDb25uZWN0aW9ucy5maW5k
X2RvbWFpbiBjb25zIGRvbWlkKSAhPSBjb24gdGhlbiBiZWdpbg0KDQpUaGlzIHNob3VsZCB1c2Ug
PD4gaW5zdGVhZCBvZiAhPSBiZWNhdXNlICE9IGlzIHBvaW50ZXIgaW5lcXVhbGl0eSBpbiBPQ2Ft
bC4gVGhlIHBhcmVudGhlc2VzIGFyZSBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5IGJlY2F1c2UgZnVu
Y3Rpb24gYXBwbGljYXRpb24gaGFzIHByZWNlZGVuY2UuIFNvOg0KDQoJaWYgRG9tYWluLmdldF9t
Zm4gZWRvbSA9IG1mbiAmJiBDb25uZWN0aW9ucy5maW5kX2RvbWFpbiBjb25zIGRvbWlkIDw+IGNv
biB0aGVuIGJlZ2luDQoNCuKAlCBDaHJpc3RpYW4NCg0KPiBPbiAxOSBBdWcgMjAxOSwgYXQgMTk6
NDUsIElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPiB3cm90ZToNCj4g
DQo+IEMgdmVyc2lvbiBvZiB4ZW5zdG9yZWQgaGFkIHRoaXMgYWJpbGl0eSBzaW5jZSA2MWFhZWQw
ZDUgKCJBbGxvdw0KPiBYU19JTlRST0RVQ0UgdG8gYmUgdXNlZCBmb3IgcmViaW5kaW5nIHRoZSB4
ZW5zdG9yZSBldnRjaG4uIikgZnJvbSAyMDA3Lg0KPiBDb3B5IGl0IGFzIGlzIHRvIE9jYW1sIHZl
cnNpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGlu
aW5AY2l0cml4LmNvbT4NCj4gLS0tDQo+IHRvb2xzL29jYW1sL3hlbnN0b3JlZC9kb21haW4ubWwg
IHwgNiArKysrKy0NCj4gdG9vbHMvb2NhbWwveGVuc3RvcmVkL3Byb2Nlc3MubWwgfCA4ICsrKysr
KystDQo+IDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC94ZW5zdG9yZWQvZG9tYWluLm1sIGIvdG9v
bHMvb2NhbWwveGVuc3RvcmVkL2RvbWFpbi5tbA0KPiBpbmRleCBiMGEwMWIwLi5hZWIxODVmIDEw
MDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC94ZW5zdG9yZWQvZG9tYWluLm1sDQo+ICsrKyBiL3Rv
b2xzL29jYW1sL3hlbnN0b3JlZC9kb21haW4ubWwNCj4gQEAgLTIzLDkgKzIzLDkgQEAgdHlwZSB0
ID0NCj4gew0KPiAJaWQ6IFhlbmN0cmwuZG9taWQ7DQo+IAltZm46IG5hdGl2ZWludDsNCj4gLQly
ZW1vdGVfcG9ydDogaW50Ow0KPiAJaW50ZXJmYWNlOiBYZW5tbWFwLm1tYXBfaW50ZXJmYWNlOw0K
PiAJZXZlbnRjaG46IEV2ZW50LnQ7DQo+ICsJbXV0YWJsZSByZW1vdGVfcG9ydDogaW50Ow0KPiAJ
bXV0YWJsZSBwb3J0OiBYZW5ldmVudGNobi50IG9wdGlvbjsNCj4gCW11dGFibGUgYmFkX2NsaWVu
dDogYm9vbDsNCj4gCW11dGFibGUgaW9fY3JlZGl0OiBpbnQ7ICgqIHRoZSByb3VuZHMgb2Ygcmlu
ZyBwcm9jZXNzIGxlZnQgdG8gZG8sIGRlZmF1bHQgaXMgMCwNCj4gQEAgLTcxLDYgKzcxLDEwIEBA
IGxldCBub3RpZnkgZG9tID0gbWF0Y2ggZG9tLnBvcnQgd2l0aA0KPiAJRXZlbnQubm90aWZ5IGRv
bS5ldmVudGNobiBwb3J0DQo+IA0KPiBsZXQgYmluZF9pbnRlcmRvbWFpbiBkb20gPQ0KPiArCWJl
Z2luIG1hdGNoIGRvbS5wb3J0IHdpdGgNCj4gKwl8IE5vbmUgLT4gKCkNCj4gKwl8IFNvbWUgcG9y
dCAtPiBFdmVudC51bmJpbmQgZG9tLmV2ZW50Y2huIHBvcnQNCj4gKwllbmQ7DQo+IAlkb20ucG9y
dCA8LSBTb21lIChFdmVudC5iaW5kX2ludGVyZG9tYWluIGRvbS5ldmVudGNobiBkb20uaWQgZG9t
LnJlbW90ZV9wb3J0KTsNCj4gCWRlYnVnICJib3VuZCBkb21haW4gJWQgcmVtb3RlIHBvcnQgJWQg
dG8gbG9jYWwgcG9ydCAlcyIgZG9tLmlkIGRvbS5yZW1vdGVfcG9ydCAoc3RyaW5nX29mX3BvcnQg
ZG9tLnBvcnQpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3Byb2Nl
c3MubWwgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5tbA0KPiBpbmRleCA4YTdlNTM4
Li5mZjVjOTQ4IDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5t
bA0KPiArKysgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5tbA0KPiBAQCAtNDA4LDcg
KzQwOCwxMyBAQCBsZXQgZG9faW50cm9kdWNlIGNvbiBfdCBkb21haW5zIGNvbnMgZGF0YSA9DQo+
IAkJaW4NCj4gCWxldCBkb20gPQ0KPiAJCWlmIERvbWFpbnMuZXhpc3QgZG9tYWlucyBkb21pZCB0
aGVuDQo+IC0JCQlEb21haW5zLmZpbmQgZG9tYWlucyBkb21pZA0KPiArCQkJbGV0IGVkb20gPSBE
b21haW5zLmZpbmQgZG9tYWlucyBkb21pZCBpbg0KPiArCQkJaWYgKERvbWFpbi5nZXRfbWZuIGVk
b20pID0gbWZuICYmIChDb25uZWN0aW9ucy5maW5kX2RvbWFpbiBjb25zIGRvbWlkKSAhPSBjb24g
dGhlbiBiZWdpbg0KPiArCQkJCSgqIFVzZSBYU19JTlRST0RVQ0UgZm9yIHJlY3JlYXRpbmcgdGhl
IHhlbmJ1cyBldmVudC1jaGFubmVsLiAqKQ0KPiArCQkJCWVkb20ucmVtb3RlX3BvcnQgPC0gcG9y
dDsNCj4gKwkJCQlEb21haW4uYmluZF9pbnRlcmRvbWFpbiBlZG9tOw0KPiArCQkJZW5kOw0KPiAr
CQkJZWRvbQ0KPiAJCWVsc2UgdHJ5DQo+IAkJCWxldCBuZG9tID0gRG9tYWlucy5jcmVhdGUgZG9t
YWlucyBkb21pZCBtZm4gcG9ydCBpbg0KPiAJCQlDb25uZWN0aW9ucy5hZGRfZG9tYWluIGNvbnMg
bmRvbTsNCj4gLS0gDQo+IDIuNy40DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
