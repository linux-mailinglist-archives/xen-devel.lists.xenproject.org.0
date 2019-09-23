Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55EFBB18A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 11:40:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCKnb-0003N8-MA; Mon, 23 Sep 2019 09:38:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cYas=XS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iCKna-0003N3-Ao
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 09:38:26 +0000
X-Inumbo-ID: e35689f6-dde5-11e9-95f7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e35689f6-dde5-11e9-95f7-12813bfff9fa;
 Mon, 23 Sep 2019 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569231504;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ierprGRCESYRIdj5DW8nQBUyO1ByU8+f1CrJhVQvUV0=;
 b=PxSqmWQbEO/LUidJRPirfTemOjJXkdaHt4ZN2PWS3kmg/Rnw4YdfBxfD
 vTOO9L+5VWQiLl8euD69wrQt/DVr7aET8nj2P0OWyvf4PMRLSUjrZrCnA
 mWQvczp1S5Ym1OjmfMjyjeToConWWuDmndTdl3nBIY1naiQSe2ulfhzhU E=;
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
IronPort-SDR: F/v7CLDOXO16lQSTwXw1we4Z59glBPGzDhfUVg4T6cjedMZ5OMJPhhswQXH2dE0jvpCcL8aS8v
 kLMuHBJrl0M2b9GcpI8zz+HREEOQa+Cd9yJvQSFt9xcw/UflT7/7KiMRhCcbMJ6q+EC0mKCIIK
 RfIu0cNgPbcmOMe7fu43BkezqJ2KrQB56vfpClRjvtM+pmkoPemy6tACNfUzD5SEfITVA7d1qS
 +0qmSpFsahyKPypHYpr4GmrVJUCVm25I377YyGkL0pnd3qpWiTB3SvcBsMtzZaMpNZKwL+nNSQ
 NKs=
X-SBRS: 2.7
X-MesageID: 6247405
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,539,1559534400"; 
   d="scan'208";a="6247405"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'John Snow' <jsnow@redhat.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Thread-Topic: [Qemu-block] [PATCH] xen-block: treat XenbusStateUnknown the
 same as XenbusStateClosed
Thread-Index: AQHVbhg6evd30eCO0U6hN9t69Suydac08g8AgAQWodA=
Date: Mon, 23 Sep 2019 09:38:20 +0000
Message-ID: <46f838982f7d448b86391bc48e9d8179@AMSPEX02CL03.citrite.net>
References: <20190918115702.38959-1-paul.durrant@citrix.com>
 <d02b4f9a-4277-6aaf-324d-2c7958878690@redhat.com>
In-Reply-To: <d02b4f9a-4277-6aaf-324d-2c7958878690@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [Qemu-block] [PATCH] xen-block: treat
 XenbusStateUnknown the same as XenbusStateClosed
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Mark Syms <Mark.Syms@citrix.com>,
 Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2huIFNub3cgPGpzbm93QHJl
ZGhhdC5jb20+DQo+IFNlbnQ6IDIwIFNlcHRlbWJlciAyMDE5IDIyOjExDQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmc7DQo+IHFlbXUtYmxvY2tAbm9uZ251Lm9yZw0K
PiBDYzogS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IE1heCBSZWl0eg0KPiA8bXJlaXR6QHJlZGhhdC5jb20+
OyBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IE1hcmsgU3ltcyA8
TWFyay5TeW1zQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUWVtdS1ibG9ja10gW1BBVENI
XSB4ZW4tYmxvY2s6IHRyZWF0IFhlbmJ1c1N0YXRlVW5rbm93biB0aGUgc2FtZSBhcyBYZW5idXNT
dGF0ZUNsb3NlZA0KPiANCj4gDQo+IA0KPiBPbiA5LzE4LzE5IDc6NTcgQU0sIFBhdWwgRHVycmFu
dCB3cm90ZToNCj4gPiBXaGVuIGEgZnJvbnRlbmQgZ3JhY2VmdWxseSBkaXNjb25uZWN0cyBmcm9t
IGFuIG9mZmxpbmUgYmFja2VuZCwgaXQgd2lsbA0KPiA+IHNldCBpdHMgb3duIHN0YXRlIHRvIFhl
bmJ1c1N0YXRlQ2xvc2VkLiBUaGUgY29kZSBpbiB4ZW4tYmxvY2suYyBjb3JyZWN0bHkNCj4gPiBk
ZWFscyB3aXRoIHRoaXMgYW5kIHNldHMgdGhlIGJhY2tlbmQgaW50byBYZW5idXNTdGF0ZUNsb3Nl
ZC4gVW5mb3J0dW5hdGVseQ0KPiA+IGl0IGlzIHBvc3NpYmxlIGZvciB0b29sc3RhY2sgdG8gYWN0
dWFsbHkgZGVsZXRlIHRoZSBmcm9udGVuZCBhcmVhDQo+ID4gYmVmb3JlIHRoZSBzdGF0ZSBrZXkg
aGFzIGJlZW4gcmVhZCwgbGVhZGluZyB0byBhbiBhcHBhcmVudCBmcm9udGVuZCBzdGF0ZQ0KPiA+
IG9mIFhlbmJ1c1N0YXRlVW5rbm93bi4gVGhpcyBwcmV2ZW50cyB0aGUgYmFja2VuZCBzdGF0ZSBm
cm9tIHRyYW5zaXRpb25pbmcNCj4gPiB0byBYZW5idXNTdGF0ZUNsb3NlZCBhbmQgaGVuY2UgbGVh
dmVzIGl0IGxpbWJvLg0KPiA+DQo+IA0KPiBEb2VzIHRoZSAwIGNvbWUgZnJvbSBhIHJlYWQgaW50
byBkZS1hbGxvY2F0ZWQgbWVtb3J5Pw0KDQpObywgaXQgY29tZXMgZnJvbSB0aGUgZmFjdCB0aGF0
IHRoZSB4ZW5zdG9yZSBzdGF0ZSBrZXkgaXMgbm90IHByZXNlbnQuIENvbnZlbnRpb25hbGx5IGEg
bWlzc2luZyBzdGF0ZSBrZXkgbWVhbnMgdGhlIHN0YXRlIGlzIHJlcG9ydGVkIGFzIFhlbmJ1c1N0
YXRlVW5rbm93bi4NCg0KICBQYXVsDQoNCj4gDQo+IC0tanMNCj4gDQo+ID4gVGhpcyBwYXRjaCBz
aW1wbHkgdHJlYXRzIGEgZnJvbnRlbmQgc3RhdGUgb2YgWGVuYnVzU3RhdGVVbmtub3duIHRoZSBz
YW1lDQo+ID4gYXMgWGVuYnVzU3RhdGVDbG9zZWQsIHdoaWNoIHdpbGwgdW5ibG9jayB0aGUgYmFj
a2VuZCBpbiB0aGVzZSBjaXJjdW1zdGFuY2VzLg0KPiA+DQo+ID4gUmVwb3J0ZWQtYnk6IE1hcmsg
U3ltcyA8bWFyay5zeW1zQGNpdHJpeC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJy
YW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gPiAtLS0NCj4gPiBDYzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+IENjOiBBbnRob255IFBlcmFy
ZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4gPiBDYzogS2V2aW4gV29sZiA8a3dvbGZA
cmVkaGF0LmNvbT4NCj4gPiBDYzogTWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4NCj4gPiAt
LS0NCj4gPiAgaHcvYmxvY2sveGVuLWJsb2NrLmMgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvaHcvYmxvY2sveGVuLWJsb2Nr
LmMgYi9ody9ibG9jay94ZW4tYmxvY2suYw0KPiA+IGluZGV4IGY3NzM0M2RiNjAuLjg3OWZjMzEw
YTQgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvYmxvY2sveGVuLWJsb2NrLmMNCj4gPiArKysgYi9ody9i
bG9jay94ZW4tYmxvY2suYw0KPiA+IEBAIC0zMTMsNiArMzEzLDcgQEAgc3RhdGljIHZvaWQgeGVu
X2Jsb2NrX2Zyb250ZW5kX2NoYW5nZWQoWGVuRGV2aWNlICp4ZW5kZXYsDQo+ID4gICAgICAgICAg
YnJlYWs7DQo+ID4NCj4gPiAgICAgIGNhc2UgWGVuYnVzU3RhdGVDbG9zZWQ6DQo+ID4gKyAgICBj
YXNlIFhlbmJ1c1N0YXRlVW5rbm93bjoNCj4gPiAgICAgICAgICB4ZW5fYmxvY2tfZGlzY29ubmVj
dCh4ZW5kZXYsICZsb2NhbF9lcnIpOw0KPiA+ICAgICAgICAgIGlmIChsb2NhbF9lcnIpIHsNCj4g
PiAgICAgICAgICAgICAgZXJyb3JfcHJvcGFnYXRlKGVycnAsIGxvY2FsX2Vycik7DQo+ID4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
