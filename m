Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F95AB685
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 12:57:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Bsv-0005A1-Sz; Fri, 06 Sep 2019 10:54:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gwiz=XB=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i6Bsu-00059w-8g
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 10:54:32 +0000
X-Inumbo-ID: b454980e-d094-11e9-a337-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b454980e-d094-11e9-a337-bc764e2007e4;
 Fri, 06 Sep 2019 10:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567767272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mtqOEO3k6+JJsvitGN9fUCJSIB7vLz33E2BrdVRCXtc=;
 b=BIHqTOrQ0f+ph4Zo4tME9I4UOtMfa6wJzaJIDGKzyiXww4wahLTz4JBR
 GEbx6APJrUNgi5FN24KqJtvJfmRxwmzSuN+FGxpKCX58qIoOoxSo13l7L
 XA3dkNVVPdOimaY2yM+A8q/iFYRubyQi8OUTGcLu5AbRVS69me/klk4N5 4=;
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
IronPort-SDR: j2SJpUxfrFFH18G0aGq3erwWGzMuhrsLwBktxQkjJkvNyN4yjjNTO+E2I7hihblYI4ZSoyDClf
 ceZT+1wMX+G0Rjxlup0Y+Dzvx9uRvuhlnpFG1QQiRvWueskmuvFTjXCpoybNSLscYs/d/9Xcgd
 140rba6DOE+9Hmu/XMCnrA7mwgzFUAv+e0UdYRDCNzXKqoiAKSR6LqE6S+Z9Ynr9N1AEl01MiH
 eaj3Wz4ALcnF0oDs/B8snCSsf+V49kuA5cn2Aa33vWMdTylt8ctjJk7YH9k8Zh+LXf5QHUfwZk
 sx0=
X-SBRS: 2.7
X-MesageID: 5279733
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5279733"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v8 2/6] domain: introduce XEN_DOMCTL_CDF_iommu flag
Thread-Index: AQHVYZ29/ty2sHXS4UupARoJKuaUUKcdW3QAgAEjC7A=
Date: Fri, 6 Sep 2019 10:54:26 +0000
Message-ID: <c46e1699aa1b4c22b66213879994eccb@AMSPEX02CL03.citrite.net>
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-3-paul.durrant@citrix.com>
 <85d926fe-d26d-1c1c-8caa-b949718196dd@arm.com>
In-Reply-To: <85d926fe-d26d-1c1c-8caa-b949718196dd@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 2/6] domain: introduce
 XEN_DOMCTL_CDF_iommu flag
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
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+ID4gZGlmZiAtLWdpdCBhL3Rv
b2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbCBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3Ry
bC5tbA0KPiA+IGluZGV4IDM1OTU4Yjk0ZDUuLmJkZjNmMmUzOTUgMTAwNjQ0DQo+ID4gLS0tIGEv
dG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sDQo+ID4gKysrIGIvdG9vbHMvb2NhbWwvbGli
cy94Yy94ZW5jdHJsLm1sDQo+ID4gQEAgLTU2LDcgKzU2LDEzIEBAIHR5cGUgYXJjaF9kb21haW5j
b25maWcgPQ0KPiA+ICAgCXwgQVJNIG9mIHhlbl9hcm1fYXJjaF9kb21haW5jb25maWcNCj4gPiAg
IAl8IFg4NiBvZiB4ZW5feDg2X2FyY2hfZG9tYWluY29uZmlnDQo+ID4NCj4gPiAtdHlwZSBkb21h
aW5fY3JlYXRlX2ZsYWcgPSBDREZfSFZNIHwgQ0RGX0hBUA0KPiA+ICt0eXBlIGRvbWFpbl9jcmVh
dGVfZmxhZyA9DQo+ID4gKwl8IENERl9IVk0NCj4gPiArCXwgQ0RGX0hBUA0KPiA+ICsJfCBDREZf
UzNfSU5URUdSSVRZDQo+ID4gKwl8IENERl9PT1NfT0ZGDQo+ID4gKwl8IENERl9YU19ET01BSU4N
Cj4gPiArCXwgQ0RGX0lPTU1VDQo+IA0KPiBUaGlzIHBhdGNoIGlzIG9ubHkgYWRkaW5nIHRoZSBs
YXN0IGZsYWcsIGJ1dCB5b3UgYXJlIGFkZGluZyBtb3JlIGhlcmUuIEkNCj4gdW5kZXJzdGFuZCB0
aGF0IHlvdSBhcmUganVzdCByZS1zeW5jaW5nIHRoZSB0eXBlIHdpdGggWGVuLiBJSE1PLCB0aGlz
DQo+IHNob3VsZCBiZWxvbmcgaW4gYSBzZXBhcmF0ZSBwYXRjaCBhcyB3ZSBtYXkgd2FudCB0byBi
YWNrcG9ydCBpdC4NCj4gDQo+IElmIGJhY2twb3J0aW5nIGlzIG5vdCBuZWNlc3NhcnksIHRoZW4g
dGhlIGNoYW5nZSBzaG91bGQgYXQgbGVhc3QgYmUNCj4gbWVudGlvbmVkIGluIHRoZSBjb21taXQg
bWVzc2FnZSBhcyB0aGlzIHNlZW1zIGEgYml0IG9mZi10b3BpYy4NCj4gDQoNClRoZSBhcHBhcmVu
dGx5IGV4dHJhbmVvdXMgZmxhZyBhZGRpdGlvbnMgYXJlIGJlY2F1c2Ugb2YgdGhlIHdheSB0aGF0
IHRoZSBjb2RlIGF0DQoNCmh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7
YT1ibG9iO2Y9dG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmM7aGI9SEVBRCNsMTQ5
DQoNCndvcmtzLiBUTDtEUiB0aGUgaW5kZXggb2YgdGhlIGl0ZW0gaW4gdGhlIGxpc3QgbmVlZHMg
dG8gbWF0Y2ggdGhlIGJpdCBwb3NpdGlvbiBpbiB0aGUgZmxhZ3MgZmllbGQuDQoNClNpbmNlIHlv
dSBxdWVyaWVkIGl0IEkgZ3Vlc3MgaXQnZCBiZXR0ZXIgaGF2ZSBhIGNvbW1lbnQgaW4gdGhlIGNv
ZGUuDQoNCiAgUGF1bA0KDQo+IENoZWVycywNCj4gDQo+IFsxXSBodHRwczovL2xpc3RzLnhlbi5v
cmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wOC9tc2cwMTk3NC5odG1sDQo+IA0KPiAt
LQ0KPiBKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
