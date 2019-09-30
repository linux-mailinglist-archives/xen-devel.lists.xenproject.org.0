Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56719C1C5E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 09:53:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEqSb-00084c-GS; Mon, 30 Sep 2019 07:51:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uEAI=XZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iEqSa-00084X-8i
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 07:51:08 +0000
X-Inumbo-ID: 0d7facd2-e357-11e9-96cb-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 0d7facd2-e357-11e9-96cb-12813bfff9fa;
 Mon, 30 Sep 2019 07:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569829864;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3TNd2npwEEhRDFXcs/dcYee7lubQ6S4FjkJDFe/G0Lw=;
 b=L9hzxO+ydKeVuMNLsVfSco0Uw3HB7zNU0bu1VAGEUPxJGinRNN2hrG62
 j0lnKEY28hbFjcoWhU7gFjKMSVMjC0ggYvKmm4rH6QE6/P6zW9fiBWfwt
 6DqM2V2gB8mieeAHqiJkYUn4oC4DpbG3zClGtLDcpMm7IsXMDOuFoCYMF g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DIAiVnIYcI7DogpWqK+9p3iNI5ZuGWw14Yr77LBbGcB5pbSKHrFJmnDXz2c417/ygP6prXaOCg
 oPFUsrU260Z3KOdNExsjdugisKoths1XvywzgD5QdATiCyDM3kPCcvsAUGdMm52qGsW/vo5LNm
 EHTve0uBmyEZYT82Zv80skRMRgBJBSvh8w2IMeUQd6HZGi8cg3opHes8qMwRdmEmhsGPuOQl1M
 xqcFRmgoT8X+GFGPyJ83RLfuS482oD/Go+2HVjzFAC8roMge2kkEWbhGddUCgyUQtb3DIMWOSx
 dKE=
X-SBRS: 2.7
X-MesageID: 6523441
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6523441"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: =?utf-8?B?J0rDvHJnZW4gR3Jvw58n?= <jgross@suse.com>, osstest service owner
 <osstest-admin@xenproject.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: Re: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
Thread-Index: AQHVd0cpVJyIDfIZSUSz/TKxkhVs4adDmO+AgAATlQCAACx04A==
Date: Mon, 30 Sep 2019 07:51:00 +0000
Message-ID: <3b225ecdc2d44cd89a996b2478d72788@AMSPEX02CL03.citrite.net>
References: <osstest-141990-mainreport@xen.org>
 <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
 <ea74b1b6-438a-b78e-be42-187aa432cfe2@suse.com>
In-Reply-To: <ea74b1b6-438a-b78e-be42-187aa432cfe2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDA4OjEyDQo+IFRvOiBvc3N0
ZXN0IHNlcnZpY2Ugb3duZXIgPG9zc3Rlc3QtYWRtaW5AeGVucHJvamVjdC5vcmc+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFBhdWwgRHVycmFudA0KPiA8UGF1bC5EdXJyYW50QGNp
dHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBSZTogW1hlbi1kZXZlbF0gW3hlbi11bnN0YWJsZSB0
ZXN0XSAxNDE5OTA6IHJlZ3Jlc3Npb25zIC0gRkFJTA0KPiANCj4gT24gMzAuMDkuMTkgMDg6MDEs
IErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+ID4gT24gMzAuMDkuMTkgMDY6MjMsIG9zc3Rlc3Qgc2Vy
dmljZSBvd25lciB3cm90ZToNCj4gPj4gZmxpZ2h0IDE0MTk5MCB4ZW4tdW5zdGFibGUgcmVhbCBb
cmVhbF0NCj4gPj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9s
b2dzLzE0MTk5MC8NCj4gPj4NCj4gPj4gUmVncmVzc2lvbnMgOi0oDQo+ID4+DQo+ID4+IFRlc3Rz
IHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLA0KPiA+PiBpbmNsdWRpbmcg
dGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoNCj4gPj4gwqAgdGVzdC1hbWQ2NC1hbWQ2NC14
bC1xZW11dC1kZWJpYW5odm0tYW1kNjTCoCA3IHhlbi1ib290wqDCoMKgIGZhaWwgUkVHUi4NCj4g
Pj4gdnMuIDE0MTgyMg0KPiA+PiDCoCB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnTCoMKgwqDCoCAx
MiBndWVzdC1zdGFydMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZhaWwgUkVHUi4NCj4gPj4g
dnMuIDE0MTgyMg0KPiA+PiDCoCB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC14c23CoCAxMiBndWVz
dC1zdGFydMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZhaWwgUkVHUi4NCj4gPj4gdnMuIDE0
MTgyMg0KPiA+PiDCoCB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtcGFpciAyMiBndWVzdC1taWdy
YXRlL3NyY19ob3N0L2RzdF9ob3N0DQo+ID4+IGZhaWwgUkVHUi4gdnMuIDE0MTgyMg0KPiA+PiDC
oCB0ZXN0LWFtZDY0LWkzODYtbGlidmlydMKgwqDCoMKgwqAgMTIgZ3Vlc3Qtc3RhcnTCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBmYWlsIFJFR1IuDQo+ID4+IHZzLiAxNDE4MjINCj4gPj4gwqAg
dGVzdC1hbWQ2NC1hbWQ2NC1taWdydXBncmFkZSAyMiBndWVzdC1taWdyYXRlL3NyY19ob3N0L2Rz
dF9ob3N0IGZhaWwNCj4gPj4gUkVHUi4gdnMuIDE0MTgyMg0KPiA+PiDCoCB0ZXN0LWFtZDY0LWkz
ODYtbGlidmlydC1wYWlyIDIyIGd1ZXN0LW1pZ3JhdGUvc3JjX2hvc3QvZHN0X2hvc3QgZmFpbA0K
PiA+PiBSRUdSLiB2cy4gMTQxODIyDQo+ID4+IMKgIHRlc3QtYW1kNjQtaTM4Ni1taWdydXBncmFk
ZSAyMiBndWVzdC1taWdyYXRlL3NyY19ob3N0L2RzdF9ob3N0IGZhaWwNCj4gPj4gUkVHUi4gdnMu
IDE0MTgyMg0KPiA+PiDCoCB0ZXN0LWFybTY0LWFybTY0LWV4YW1pbmXCoMKgwqAgMTEgZXhhbWlu
ZS1zZXJpYWwvYm9vdGxvYWRlciBmYWlsIFJFR1IuDQo+ID4+IHZzLiAxNDE4MjINCj4gPj4gwqAg
dGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1zdHViZG9tLWRlYmlhbmh2bS1hbWQ2NC14c20gMTAN
Cj4gPj4gZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMuIDE0MTgyMg0KPiA+PiDCoCB0
ZXN0LWFybTY0LWFybTY0LWxpYnZpcnQteHNtIDEyIGd1ZXN0LXN0YXJ0wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZmFpbCBSRUdSLg0KPiA+PiB2cy4gMTQxODIyDQo+ID4+IMKgIHRlc3QtYW1k
NjQtYW1kNjQtbGlidmlydC12aGQgMTAgZGViaWFuLWRpLWluc3RhbGzCoMKgwqDCoMKgwqDCoCBm
YWlsIFJFR1IuDQo+ID4+IHZzLiAxNDE4MjINCj4gPj4gwqAgdGVzdC1hcm1oZi1hcm1oZi1saWJ2
aXJ0wqDCoMKgwqAgMTIgZ3Vlc3Qtc3RhcnTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYWls
IFJFR1IuDQo+ID4+IHZzLiAxNDE4MjINCj4gPj4gwqAgdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0
LXJhdyAxMCBkZWJpYW4tZGktaW5zdGFsbMKgwqDCoMKgwqDCoMKgIGZhaWwgUkVHUi4NCj4gPj4g
dnMuIDE0MTgyMg0KPiA+DQo+ID4gU2V2ZXJhbCBvZiB0aGUgZmFpbHVyZXMgc2VlbSB0byBiZSBy
ZWxhdGVkIHRvIGNvbW1pdCBiYWJkZTQ3YTNmZWRhNmRkNA0KPiA+ICgiaW50cm9kdWNlIGEgJ3Bh
c3N0aHJvdWdoJyBjb25maWd1cmF0aW9uIG9wdGlvbiB0byB4bC5jZmciKS4NCj4gPg0KPiA+IEkg
dGhpbmsgdGhlIGFzc2VydCgpIGluIGxpeGxfY3JlYXRlLmMgKGxpbmUgNTg5KSBzaG91bGQganVz
dCBiZSBkcm9wcGVkPw0KPiA+DQo+ID4gIMKgwqDCoMKgwqDCoMKgIGFzc2VydChpbmZvLT5wYXNz
dGhyb3VnaCAhPSBMSUJYTF9QQVNTVEhST1VHSF9FTkFCTEVEKTsNCj4gPiAgwqDCoMKgwqDCoMKg
wqAgTE9HKERFVEFJTCwgInBhc3N0aHJvdWdoOiAlcyIsDQo+ID4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbGlieGxfcGFzc3Rocm91Z2hfdG9fc3RyaW5nKGluZm8tPnBhc3N0aHJvdWdoKSk7DQo+
ID4NCj4gPiAgwqDCoMKgwqDCoMKgwqAgaWYgKGluZm8tPnBhc3N0aHJvdWdoICE9IExJQlhMX1BB
U1NUSFJPVUdIX0RJU0FCTEVEKQ0KPiA+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNyZWF0ZS5m
bGFncyB8PSBYRU5fRE9NQ1RMX0NERl9pb21tdTsNCj4gPg0KPiA+ICDCoMKgwqDCoMKgwqDCoCBp
ZiAoaW5mby0+cGFzc3Rocm91Z2ggPT0gTElCWExfUEFTU1RIUk9VR0hfU1lOQ19QVCkNCj4gPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjcmVhdGUuaW9tbXVfb3B0cyB8PSBYRU5fRE9NQ1RMX0lP
TU1VX25vX3NoYXJlcHQ7DQo+ID4NCj4gPiBPciB0aGUgaWYgKCkgc3RhdGVtZW50cyBhZnRlciB0
aGF0IGFyZSBqdXN0IHBsYWluIHdyb25nPw0KPiANCj4gSSBtaXNyZWFkIHRoZSBjb2RlLg0KPiAN
Cj4gQnV0IG5ldmVydGhlbGVzcyB0aGVyZSBpcyBzb21ldGhpbmcgd3JvbmcuLi4NCj4gDQoNCk9r
LCBJJ2xsIHRha2UgYSBsb29rIG5vdy4NCg0KICBQYXVsDQoNCj4gDQo+IEp1ZXJnZW4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
