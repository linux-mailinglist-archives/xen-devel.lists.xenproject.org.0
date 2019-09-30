Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A72C1C64
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 09:55:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEqU4-0008BD-1d; Mon, 30 Sep 2019 07:52:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uEAI=XZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iEqU2-0008B1-5r
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 07:52:38 +0000
X-Inumbo-ID: 44d4451c-e357-11e9-96cb-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 44d4451c-e357-11e9-96cb-12813bfff9fa;
 Mon, 30 Sep 2019 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569829957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ouMpbGAFvhMPVjQAUtcHN1YpnIhTC70IFOQxnqhrMYc=;
 b=QHSWwA8cTUzFI19gJb36O2uvYm2yjv1cONixR1YCA13BUvMud8JTJN+m
 BnonLccsVMV8XsYTV8wASSZw5DxHnLYOS0/1TPAtRqbzl3Zc5qdZ977Ze
 xycqRpSQJLyopKRJN2g8tLcdL1Fv4N5906xUgiMETNPedXwZmBLS5Wph2 c=;
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
IronPort-SDR: Z7yPX4GxyQCqTQQe+czFq5xvqYxxQPPp+rk27m2eQdOJJr+FWLNfN+bwFH57UI61gcjl373Xed
 ROf+XD2XZP+rG4TagfmOgTSARjjtxB1m2vUpqgFVGuPq432jpjwBFVCC5X6dz+b0jLSefNCa2E
 8uWSDjMDeMdhvMyGfTLOk7I70vR81w86JlEzCcELQ+GY+p45YaZ1IjugdTttgxGeyQZjh99AcK
 quHtEOVjlhBAs7dWVCnhRkDCHFyPZ2tp5ZSiGG175DSZy7um16m2/uIb2JsRMOH6W+057Sn2Y+
 89U=
X-SBRS: 2.7
X-MesageID: 6587607
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6587607"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/iommu: fix hwdom iommu requirements check
Thread-Index: AQHVddaDI81RUxxIpkuhC4x1efFAeqdD3AMg
Date: Mon, 30 Sep 2019 07:52:33 +0000
Message-ID: <95aa17310e8b46619a0a701e416d6c47@AMSPEX02CL03.citrite.net>
References: <20190928082659.45482-1-roger.pau@citrix.com>
In-Reply-To: <20190928082659.45482-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/iommu: fix hwdom iommu requirements
 check
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
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAyOCBTZXB0ZW1iZXIgMjAxOSAwOToyNw0KPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsg
UGF1bCBEdXJyYW50DQo+IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSB4ODYvaW9tbXU6IGZpeCBod2Rv
bSBpb21tdSByZXF1aXJlbWVudHMgY2hlY2sNCj4gDQo+IEJvdGggYSBzaGFkb3cgYW5kIGEgSEFQ
IGh3ZG9tIHJlcXVpcmUgYW4gaW9tbXUgYW5kIG11c3QgYmUgcnVuIGluDQo+IHN0cmljdCBtb2Rl
LiBDaGFuZ2UgdGhlIEhBUCBjaGVjayBpbnRvIGEgaHZtIGRvbWFpbiBjaGVjay4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpZ
ZXMsIEkgY29tcGxldGVseSBmb3Jnb3QgdGhhdCBpdCBpcyBsZWdpdGltYXRlIGZvciBhIFBWSCBk
b20wIHRvIG9wZXJhdGUgaW4gc2hhZG93IG1vZGUuDQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJh
bnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KDQo+IC0tLQ0KPiAgeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvaW9tbXUuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+IGluZGV4IDhi
NTUwZjkwOWIuLjllZjVmMzc2YzUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPiBA
QCAtMTU0LDcgKzE1NCw3IEBAIGN1c3RvbV9wYXJhbSgiZG9tMC1pb21tdSIsIHBhcnNlX2RvbTBf
aW9tbXVfcGFyYW0pOw0KPiANCj4gIHN0YXRpYyB2b2lkIF9faHdkb21faW5pdCBjaGVja19od2Rv
bV9yZXFzKHN0cnVjdCBkb21haW4gKmQpDQo+ICB7DQo+IC0gICAgaWYgKCBpb21tdV9od2RvbV9u
b25lIHx8ICFoYXBfZW5hYmxlZChkKSApDQo+ICsgICAgaWYgKCBpb21tdV9od2RvbV9ub25lIHx8
ICFpc19odm1fZG9tYWluKGQpICkNCj4gICAgICAgICAgcmV0dXJuOw0KPiANCj4gICAgICBpb21t
dV9od2RvbV9wYXNzdGhyb3VnaCA9IGZhbHNlOw0KPiAtLQ0KPiAyLjIzLjANCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
