Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982ABC1CBC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 10:19:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEqqR-0002DQ-RV; Mon, 30 Sep 2019 08:15:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uEAI=XZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iEqqQ-0002DK-MC
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 08:15:46 +0000
X-Inumbo-ID: 804a27b2-e35a-11e9-96cb-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 804a27b2-e35a-11e9-96cb-12813bfff9fa;
 Mon, 30 Sep 2019 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569831345;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RNNwwIsv0pdbt+u+CHavYUMh3mKIXStAjXCAAVWzOJY=;
 b=Jd87SX23KTzsT7+g6PZxmBjo16+oyq8cCi2EYPAnCdJxTuXzpD8gBGuI
 vsBLhs3MfQtrf+oTZIKoAM5mJ59YkWU+rZQ0yMtaFFqXXxEDCBW1kDDYO
 qDJEvVa9SfAqafeL/hmlkYE1D2jz0JMZRuiif7rl2azzRrmvYImpeQkHW c=;
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
IronPort-SDR: /buBcKpDPaAnXWwf1xMGNCXT6RU7QlSFNwmGsfRviRHlNeHYdaVs22pkYFT+z65aRIOzCUPOmU
 0mQjS8zE6PW4G7oaGBhwBLm/1+7EO41PqDChRwZQblit6x3h/AdCcDYjHfRBqgSXI0Fh42xhtC
 97aO7QjnrTZDh9L6kTzDcGFeCxeb3pJ3ttDvW/jZ5ZnzDgBz6fWmHi/gE58hbYdRhni8WO9Ry4
 xGd+3f9AMDRvl311LhrGmsy/uTyvUrimpdtyZZOq7V5GgTp4feu7pJDUoU/gOyES6w5J5vhH+4
 OQk=
X-SBRS: 2.7
X-MesageID: 6524874
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6524874"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, =?utf-8?B?J0rDvHJnZW4gR3Jvw58n?=
 <jgross@suse.com>, osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: Re: [Xen-devel] [xen-unstable test] 141990: regressions - FAIL
Thread-Index: AQHVd0cpVJyIDfIZSUSz/TKxkhVs4adDmO+AgAATlQCAACx04IAABosA
Date: Mon, 30 Sep 2019 08:15:41 +0000
Message-ID: <3cbd0dba5a5d4b3e921b4fe247ca32a7@AMSPEX02CL03.citrite.net>
References: <osstest-141990-mainreport@xen.org>
 <fd1ea329-5fae-0ac2-d8b6-53845ac99775@suse.com>
 <ea74b1b6-438a-b78e-be42-187aa432cfe2@suse.com>
 <3b225ecdc2d44cd89a996b2478d72788@AMSPEX02CL03.citrite.net>
In-Reply-To: <3b225ecdc2d44cd89a996b2478d72788@AMSPEX02CL03.citrite.net>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUGF1bCBEdXJyYW50
DQo+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDA4OjUxDQo+IFRvOiAnSsO8cmdlbiBHcm/Dnycg
PGpncm9zc0BzdXNlLmNvbT47IG9zc3Rlc3Qgc2VydmljZSBvd25lciA8b3NzdGVzdC1hZG1pbkB4
ZW5wcm9qZWN0Lm9yZz47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtYZW4tZGV2ZWxdIFt4ZW4tdW5zdGFibGUgdGVzdF0gMTQxOTkwOiByZWdyZXNz
aW9ucyAtIEZBSUwNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9t
OiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+DQo+ID4gU2VudDogMzAgU2VwdGVtYmVy
IDIwMTkgMDg6MTINCj4gPiBUbzogb3NzdGVzdCBzZXJ2aWNlIG93bmVyIDxvc3N0ZXN0LWFkbWlu
QHhlbnByb2plY3Qub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBQYXVsDQo+
IER1cnJhbnQNCj4gPiA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+DQo+ID4gU3ViamVjdDogUmU6
IFJlOiBbWGVuLWRldmVsXSBbeGVuLXVuc3RhYmxlIHRlc3RdIDE0MTk5MDogcmVncmVzc2lvbnMg
LSBGQUlMDQo+ID4NCj4gPiBPbiAzMC4wOS4xOSAwODowMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToN
Cj4gPiA+IE9uIDMwLjA5LjE5IDA2OjIzLCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6DQo+
ID4gPj4gZmxpZ2h0IDE0MTk5MCB4ZW4tdW5zdGFibGUgcmVhbCBbcmVhbF0NCj4gPiA+PiBodHRw
Oi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQxOTkwLw0KPiA+
ID4+DQo+ID4gPj4gUmVncmVzc2lvbnMgOi0oDQo+ID4gPj4NCj4gPiA+PiBUZXN0cyB3aGljaCBk
aWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywNCj4gPiA+PiBpbmNsdWRpbmcgdGVzdHMg
d2hpY2ggY291bGQgbm90IGJlIHJ1bjoNCj4gPiA+PiDCoCB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFl
bXV0LWRlYmlhbmh2bS1hbWQ2NMKgIDcgeGVuLWJvb3TCoMKgwqAgZmFpbCBSRUdSLg0KPiA+ID4+
IHZzLiAxNDE4MjINCj4gPiA+PiDCoCB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnTCoMKgwqDCoCAx
MiBndWVzdC1zdGFydMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZhaWwgUkVHUi4NCj4gPiA+
PiB2cy4gMTQxODIyDQo+ID4gPj4gwqAgdGVzdC1hbWQ2NC1pMzg2LWxpYnZpcnQteHNtwqAgMTIg
Z3Vlc3Qtc3RhcnTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYWlsIFJFR1IuDQo+ID4gPj4g
dnMuIDE0MTgyMg0KPiA+ID4+IMKgIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1wYWlyIDIyIGd1
ZXN0LW1pZ3JhdGUvc3JjX2hvc3QvZHN0X2hvc3QNCj4gPiA+PiBmYWlsIFJFR1IuIHZzLiAxNDE4
MjINCj4gPiA+PiDCoCB0ZXN0LWFtZDY0LWkzODYtbGlidmlydMKgwqDCoMKgwqAgMTIgZ3Vlc3Qt
c3RhcnTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYWlsIFJFR1IuDQo+ID4gPj4gdnMuIDE0
MTgyMg0KPiA+ID4+IMKgIHRlc3QtYW1kNjQtYW1kNjQtbWlncnVwZ3JhZGUgMjIgZ3Vlc3QtbWln
cmF0ZS9zcmNfaG9zdC9kc3RfaG9zdCBmYWlsDQo+ID4gPj4gUkVHUi4gdnMuIDE0MTgyMg0KPiA+
ID4+IMKgIHRlc3QtYW1kNjQtaTM4Ni1saWJ2aXJ0LXBhaXIgMjIgZ3Vlc3QtbWlncmF0ZS9zcmNf
aG9zdC9kc3RfaG9zdCBmYWlsDQo+ID4gPj4gUkVHUi4gdnMuIDE0MTgyMg0KPiA+ID4+IMKgIHRl
c3QtYW1kNjQtaTM4Ni1taWdydXBncmFkZSAyMiBndWVzdC1taWdyYXRlL3NyY19ob3N0L2RzdF9o
b3N0IGZhaWwNCj4gPiA+PiBSRUdSLiB2cy4gMTQxODIyDQo+ID4gPj4gwqAgdGVzdC1hcm02NC1h
cm02NC1leGFtaW5lwqDCoMKgIDExIGV4YW1pbmUtc2VyaWFsL2Jvb3Rsb2FkZXIgZmFpbCBSRUdS
Lg0KPiA+ID4+IHZzLiAxNDE4MjINCj4gPiA+PiDCoCB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0
LXN0dWJkb20tZGViaWFuaHZtLWFtZDY0LXhzbSAxMA0KPiA+ID4+IGRlYmlhbi1odm0taW5zdGFs
bCBmYWlsIFJFR1IuIHZzLiAxNDE4MjINCj4gPiA+PiDCoCB0ZXN0LWFybTY0LWFybTY0LWxpYnZp
cnQteHNtIDEyIGd1ZXN0LXN0YXJ0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFpbCBSRUdS
Lg0KPiA+ID4+IHZzLiAxNDE4MjINCj4gPiA+PiDCoCB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQt
dmhkIDEwIGRlYmlhbi1kaS1pbnN0YWxswqDCoMKgwqDCoMKgwqAgZmFpbCBSRUdSLg0KPiA+ID4+
IHZzLiAxNDE4MjINCj4gPiA+PiDCoCB0ZXN0LWFybWhmLWFybWhmLWxpYnZpcnTCoMKgwqDCoCAx
MiBndWVzdC1zdGFydMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZhaWwgUkVHUi4NCj4gPiA+
PiB2cy4gMTQxODIyDQo+ID4gPj4gwqAgdGVzdC1hcm1oZi1hcm1oZi1saWJ2aXJ0LXJhdyAxMCBk
ZWJpYW4tZGktaW5zdGFsbMKgwqDCoMKgwqDCoMKgIGZhaWwgUkVHUi4NCj4gPiA+PiB2cy4gMTQx
ODIyDQo+ID4gPg0KPiA+ID4gU2V2ZXJhbCBvZiB0aGUgZmFpbHVyZXMgc2VlbSB0byBiZSByZWxh
dGVkIHRvIGNvbW1pdCBiYWJkZTQ3YTNmZWRhNmRkNA0KPiA+ID4gKCJpbnRyb2R1Y2UgYSAncGFz
c3Rocm91Z2gnIGNvbmZpZ3VyYXRpb24gb3B0aW9uIHRvIHhsLmNmZyIpLg0KPiA+ID4NCj4gPiA+
IEkgdGhpbmsgdGhlIGFzc2VydCgpIGluIGxpeGxfY3JlYXRlLmMgKGxpbmUgNTg5KSBzaG91bGQg
anVzdCBiZSBkcm9wcGVkPw0KPiA+ID4NCj4gPiA+ICDCoMKgwqDCoMKgwqDCoCBhc3NlcnQoaW5m
by0+cGFzc3Rocm91Z2ggIT0gTElCWExfUEFTU1RIUk9VR0hfRU5BQkxFRCk7DQo+ID4gPiAgwqDC
oMKgwqDCoMKgwqAgTE9HKERFVEFJTCwgInBhc3N0aHJvdWdoOiAlcyIsDQo+ID4gPiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBsaWJ4bF9wYXNzdGhyb3VnaF90b19zdHJpbmcoaW5mby0+cGFzc3Ro
cm91Z2gpKTsNCj4gPiA+DQo+ID4gPiAgwqDCoMKgwqDCoMKgwqAgaWYgKGluZm8tPnBhc3N0aHJv
dWdoICE9IExJQlhMX1BBU1NUSFJPVUdIX0RJU0FCTEVEKQ0KPiA+ID4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY3JlYXRlLmZsYWdzIHw9IFhFTl9ET01DVExfQ0RGX2lvbW11Ow0KPiA+ID4NCj4g
PiA+ICDCoMKgwqDCoMKgwqDCoCBpZiAoaW5mby0+cGFzc3Rocm91Z2ggPT0gTElCWExfUEFTU1RI
Uk9VR0hfU1lOQ19QVCkNCj4gPiA+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNyZWF0ZS5pb21t
dV9vcHRzIHw9IFhFTl9ET01DVExfSU9NTVVfbm9fc2hhcmVwdDsNCj4gPiA+DQo+ID4gPiBPciB0
aGUgaWYgKCkgc3RhdGVtZW50cyBhZnRlciB0aGF0IGFyZSBqdXN0IHBsYWluIHdyb25nPw0KPiA+
DQo+ID4gSSBtaXNyZWFkIHRoZSBjb2RlLg0KPiA+DQo+ID4gQnV0IG5ldmVydGhlbGVzcyB0aGVy
ZSBpcyBzb21ldGhpbmcgd3JvbmcuLi4NCj4gPg0KPiANCj4gT2ssIEknbGwgdGFrZSBhIGxvb2sg
bm93Lg0KPiANCg0KSSBjYW4ndCBmaW5kIGFueXRoaW5nIGNvbmNsdXNpdmUgaW4gdGhlIGxvZ3Ms
IGJ1dCBpdCBsb29rcyBsaWtlIGl0J3MgbWFpbmx5IEFNRCBoL3cgdGhhdCdzIHRoZSBwcm9ibGVt
IGFuZCBvbiBhdCBsZWFzdCBvbmUgb2YgdGhlIHRlc3QgZmFpbHVyZXMgSSBzZWUgbG90cyBvZiB0
aGlzIGtpbmQgb2YgdGhpbmcgaW4gdGhlIHNlcmlhbCBsb2c6DQoNClNlcCAyOSAxNzozMzo1NS4z
MTY0MjIgWyAgMTY5LjgyODU2M10gQU1ELVZpOiBFdmVudCBsb2dnZWQgW1sgIDE2OS44MzE3OThd
IElPX1BBR0VfRkFVTFQgZGV2aWNlPTAwOjEzLjEgZG9tYWluPTB4MDAwNiBhZGRyZXNzPTB4MDAw
MDAwMDAwMDAwMDA4MCBmbGFncz0weDAwMjBdDQpTZXAgMjkgMTc6MzM6NTUuMzc2NTk1IFsgIDE2
OS44NDA0ODFdIEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtbICAxNjkuODQzNzE2XSBJT19QQUdFX0ZB
VUxUIGRldmljZT0wMDoxMy4xIGRvbWFpbj0weDAwMDYgYWRkcmVzcz0weDAwMDAwMDAwMDAwMDAw
ODAgZmxhZ3M9MHgwMDIwXQ0KU2VwIDI5IDE3OjMzOjU1LjM4ODQ2OSBbICAxNjkuODUyMzk4XSBB
TUQtVmk6IEV2ZW50IGxvZ2dlZCBbWyAgMTY5Ljg1NTYyN10gSU9fUEFHRV9GQVVMVCBkZXZpY2U9
MDA6MTMuMSBkb21haW49MHgwMDA2IGFkZHJlc3M9MHgwMDAwMDAwMDAwMDAwMDgwIGZsYWdzPTB4
MDAyMF0NClNlcCAyOSAxNzozMzo1NS40MDA0ODYgWyAgMTY5Ljg2NDMxMV0gQU1ELVZpOiBFdmVu
dCBsb2dnZWQgW1sgIDE2OS44Njc1NDBdIElPX1BBR0VfRkFVTFQgZGV2aWNlPTAwOjEzLjEgZG9t
YWluPTB4MDAwNiBhZGRyZXNzPTB4MDAwMDAwMDAwMDAwMDA4MCBmbGFncz0weDAwMjBdDQpTZXAg
MjkgMTc6MzM6NTUuNDEyNTU5IFsgIDE2OS44NzYyMjRdIEFNRC1WaTogRXZlbnQgbG9nZ2VkIFtb
ICAxNjkuODc5NDU4XSBJT19QQUdFX0ZBVUxUIGRldmljZT0wMDoxMy4xIGRvbWFpbj0weDAwMDYg
YWRkcmVzcz0weDAwMDAwMDAwMDAwMDAwODAgZmxhZ3M9MHgwMDIwXQ0KDQpJJ2xsIHRyeSB0byBm
aW5kIGFuIEFNRCByaWcgYW5kIHNlZSBpZiBJIGNhbiByZXBybyBhIGZhaWx1cmUuDQoNCiAgUGF1
bA0KDQo+ICAgUGF1bA0KPiANCj4gPg0KPiA+IEp1ZXJnZW4NCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0K
PiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
