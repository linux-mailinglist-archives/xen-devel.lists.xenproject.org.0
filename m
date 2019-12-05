Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D72113D38
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 09:42:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icmbb-0003Uu-QA; Thu, 05 Dec 2019 08:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SJM4=Z3=amazon.com=prvs=235339fe4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1icmbZ-0003UN-Pu
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 08:35:21 +0000
X-Inumbo-ID: 2cac18d6-173a-11ea-a0d2-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cac18d6-173a-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575534922; x=1607070922;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aXbInvxG2I2Zu2R1GMba5bU5LS77kESc95g6OvHWJwg=;
 b=eCQOnmqgpbY1AB1MBSdRScF/4ageyRNbRtduvrrTtPuCwgTTfnUz6j8W
 nUMmTags4nNGUOs5QR70v7e4bTR77AQ7VkWYZgGfv+qK+1GF6obxk/56a
 eAXQNU6mgEiS9PU4LbBn2XWHlKtxhtGRc+4yvuzU3LOLkWnOyXpnKukFM o=;
IronPort-SDR: K3BIDEPnD3dWp9vf7Jtm9pwZQ1mC7m+gCzHaw88vggjPy63LYEUc3DQx4lKKw1DitKd48f+9m1
 VyKSs0cqUAgQ==
X-IronPort-AV: E=Sophos;i="5.69,280,1571702400"; 
   d="scan'208";a="7174430"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 05 Dec 2019 08:35:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id A5B57A22E5; Thu,  5 Dec 2019 08:35:19 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 08:35:18 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 08:35:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 5 Dec 2019 08:35:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Sander Eikelenboom <linux@eikelenboom.it>, Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] xen-unstable (4.14 to be): Assertion
 '!preempt_count()' failed at preempt.c:36
Thread-Index: AQHVqsetYjTVUOqoUEOZb8MH5602+6eqO22AgAA7mgCAAL+bIA==
Date: Thu, 5 Dec 2019 08:35:18 +0000
Message-ID: <62b58da082e449eb960bada0ea34e3f9@EX13D32EUC003.ant.amazon.com>
References: <ce5bd41b-90ed-fcf3-9e2d-a536ff1fcf90@eikelenboom.it>
 <59ac3962-a947-337b-b758-7ecfb69561ca@suse.com>
 <08b761ad-c84b-3dad-2dd1-f9b69b0fe2a7@eikelenboom.it>
In-Reply-To: <08b761ad-c84b-3dad-2dd1-f9b69b0fe2a7@eikelenboom.it>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.177]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] xen-unstable (4.14 to be): Assertion
 '!preempt_count()' failed at preempt.c:36
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gU2FuZGVyIEVp
a2VsZW5ib29tDQo+IFNlbnQ6IDA0IERlY2VtYmVyIDIwMTkgMjE6MDQNCj4gVG86IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgSWdvciBEcnV6aGluaW4NCj4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+OyBQYXVs
IER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIHhlbi11
bnN0YWJsZSAoNC4xNCB0byBiZSk6IEFzc2VydGlvbg0KPiAnIXByZWVtcHRfY291bnQoKScgZmFp
bGVkIGF0IHByZWVtcHQuYzozNg0KPiANCj4gT24gMDQvMTIvMjAxOSAxODozMCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+ID4gT24gMDQuMTIuMjAxOSAxODoyMSwgU2FuZGVyIEVpa2VsZW5ib29tIHdy
b3RlOg0KPiA+PiBPbiBjdXJyZW50IHhlbi11bnN0YWJsZSAoNC4xNCB0byBiZSkgYW5kIEFNRCBj
cHU6DQo+ID4+DQo+ID4+IEFmdGVyIHJlYm9vdGluZyB0aGUgaG9zdCwgd2hpbGUgdGhlIGd1ZXN0
cyBhcmUgc3RhcnRpbmcsIEkgaGl0IHRoZQ0KPiBhc3NlcnRpb24gYmVsb3cuDQo+ID4+IHhlbi1z
dGFnaW5nLTQuMTMgc2VlbXMgZmluZSBvbiB0aGUgc2FtZSBtYWNoaW5lLg0KPiA+DQo+ID4gTm90
aGluZyBiZXR3ZWVuIDQuMTMgUkM0IGFuZCB0aGUgdGlwIG9mIHN0YWdpbmcgc3RhbmRzIG91dCwN
Cj4gPiBzbyBJIHdvbmRlciBpZiB5b3UgY291bGQgYmlzZWN0IG92ZXIgdGhpcyByYW5nZT8gT3Ig
cGVyaGFwcw0KPiA+IHNvbWVvbmUgZWxzZSBzZWVzIHNvbWV0aGluZyBJIGRvbid0IHNlZSAocmln
aHQgbm93KS4NCj4gPg0KPiA+IEphbg0KPiANCj4gQmlzZWN0aW9uIGNhbWUgdXAgd2l0aDoNCj4g
DQo+IGNvbW1pdCBjZDdkZWRhZDgyMDk3NTNlMGZjOGE5N2U2MWQwNGI3NDkxMmI1M2RjDQo+IEF1
dGhvcjogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gRGF0ZTogICBG
cmkgTm92IDE1IDE4OjU5OjMwIDIwMTkgKzAwMDANCj4gDQo+ICAgICBwYXNzdGhyb3VnaDogc2lt
cGxpZnkgbG9ja2luZyBhbmQgbG9nZ2luZw0KPiANCj4gICAgIERyb3BwaW5nIHRoZSBwY2lkZXZz
IGxvY2sgYmV0d2VlbiBjYWxsaW5nIGRldmljZV9hc3NpZ25lZCgpIGFuZA0KPiAgICAgYXNzaWdu
X2RldmljZSgpIG1lYW5zIHRoYXQgdGhlIGxhdHRlciBoYXMgdG8gZG8gdGhlIHNhbWUgY2hlY2sg
YXMgdGhlDQo+ICAgICBmb3JtZXIgZm9yIG5vIG9idmlvdXMgZ2Fpbi4gQWxzbywgc2luY2UgbG9u
ZyBydW5uaW5nIG9wZXJhdGlvbnMgdW5kZXINCj4gICAgIHBjaWRldnMgbG9jayBhbHJlYWR5IGRy
b3AgdGhlIGxvY2sgYW5kIHJldHVybiAtRVJFU1RBUlQgcGVyaW9kaWNhbGx5DQo+IHRoZXJlDQo+
ICAgICBpcyBsaXR0bGUgcG9pbnQgaW4gaW1tZWRpYXRlbHkgZmFpbGluZyBhbiBhc3NpZ25tZW50
IG9wZXJhdGlvbiB3aXRoDQo+ICAgICAtRVJFU1RBUlQganVzdCBiZWNhdXNlIHRoZSBwY2lkZXZz
IGxvY2sgY291bGQgbm90IGJlIGFjcXVpcmVkIChmb3IgdGhlDQo+ICAgICBzZWNvbmQgdGltZSwg
aGF2aW5nIGFscmVhZHkgYmxvY2tlZCBvbiBhY3F1aXJpbmcgdGhlIGxvY2sgaW4NCj4gICAgIGRl
dmljZV9hc3NpZ25lZCgpKS4NCj4gDQo+ICAgICBUaGlzIHBhdGNoIGluc3RlYWQgYWNxdWlyZXMg
dGhlIGxvY2sgb25jZSBmb3IgYXNzaWdubWVudCAob3IgdGVzdA0KPiBhc3NpZ24pDQo+ICAgICBv
cGVyYXRpb25zIGRpcmVjdGx5IGluIGlvbW11X2RvX3BjaV9kb21jdGwoKSBhbmQgdGh1cyBjYW4g
cmVtb3ZlIHRoZQ0KPiAgICAgZHVwbGljYXRlIGRvbWFpbiBvd25lcnNoaXAgY2hlY2sgaW4gYXNz
aWduX2RldmljZSgpLiBXaGlsc3QgaW4gdGhlDQo+ICAgICBuZWlnaGJvdXJob29kLCB0aGUgcGF0
Y2ggYWxzbyByZW1vdmVzIHNvbWUgZGVidWcgbG9nZ2luZyBmcm9tDQo+ICAgICBhc3NpZ25fZGV2
aWNlKCkgYW5kIGRlYXNzaWduX2RldmljZSgpIGFuZCByZXBsYWNlcyBpdCB3aXRoIHByb3Blcg0K
PiBlcnJvcg0KPiAgICAgbG9nZ2luZywgd2hpY2ggYWxsb3dzIGVycm9yIGxvZ2dpbmcgaW4gaW9t
bXVfZG9fcGNpX2RvbWN0bCgpIHRvIGJlDQo+ICAgICByZW1vdmVkLg0KPiANCj4gICAgIFNpZ25l
ZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQo+ICAgICBT
aWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4N
Cj4gICAgIEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KDQpH
b2luZyB0aHJvdWdoIHRoZSBjb2RlLCBJIG5vdGljZSBhIG1pc3NpbmcgcGNpZGV2c191bmxvY2so
KSBpbiB0aGUgY2FzZSBvZiBhIGRldmljZSBhbHJlYWR5IGFzc2lnbmVkLiBJIGZpeGVkIGl0IHdp
dGggYSBiaXQgb2YgcmUtc3RydWN0dXJpbmcuIENvdWxkIHlvdSB0cnkgdGhlIGZvbGxvd2luZyBw
YXRjaD8NCg0KLS0tODwtLS0NCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9w
Y2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQppbmRleCBjZWQwYzI4ZTRmLi5j
NzIwNzk5OGE1IDEwMDY0NA0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCisr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQpAQCAtMTY5NiwxNiArMTY5NiwxMiBA
QCBpbnQgaW9tbXVfZG9fcGNpX2RvbWN0bCgNCg0KICAgICAgICAgcGNpZGV2c19sb2NrKCk7DQog
ICAgICAgICByZXQgPSBkZXZpY2VfYXNzaWduZWQoc2VnLCBidXMsIGRldmZuKTsNCi0gICAgICAg
IGlmICggZG9tY3RsLT5jbWQgPT0gWEVOX0RPTUNUTF90ZXN0X2Fzc2lnbl9kZXZpY2UgKQ0KKyAg
ICAgICAgaWYgKCByZXQgJiYgZG9tY3RsLT5jbWQgPT0gWEVOX0RPTUNUTF90ZXN0X2Fzc2lnbl9k
ZXZpY2UgKQ0KICAgICAgICAgew0KLSAgICAgICAgICAgIGlmICggcmV0ICkNCi0gICAgICAgICAg
ICB7DQotICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfR19JTkZPDQotICAgICAgICAgICAg
ICAgICAgICAgICAiJTA0eDolMDJ4OiUwMnguJXUgYWxyZWFkeSBhc3NpZ25lZCwgb3Igbm9uLWV4
aXN0ZW50XG4iLA0KLSAgICAgICAgICAgICAgICAgICAgICAgc2VnLCBidXMsIFBDSV9TTE9UKGRl
dmZuKSwgUENJX0ZVTkMoZGV2Zm4pKTsNCi0gICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsN
Ci0gICAgICAgICAgICB9DQotICAgICAgICAgICAgYnJlYWs7DQorICAgICAgICAgICAgcHJpbnRr
KFhFTkxPR19HX0lORk8NCisgICAgICAgICAgICAgICAgICAgIiUwNHg6JTAyeDolMDJ4LiV1IGFs
cmVhZHkgYXNzaWduZWQsIG9yIG5vbi1leGlzdGVudFxuIiwNCisgICAgICAgICAgICAgICAgICAg
c2VnLCBidXMsIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4pKTsNCisgICAgICAgICAg
ICByZXQgPSAtRUlOVkFMOw0KICAgICAgICAgfQ0KLS0tODwtLS0NCg0KVGhhbmtzLA0KDQogIFBh
dWwNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
