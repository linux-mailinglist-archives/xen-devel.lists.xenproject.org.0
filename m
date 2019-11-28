Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1E10C6BD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 11:32:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaH2e-0008G6-LL; Thu, 28 Nov 2019 10:28:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtxL=ZU=amazon.com=prvs=228fc64b1=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iaH2d-0008G0-9Z
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 10:28:55 +0000
X-Inumbo-ID: e0b46a5c-11c9-11ea-a3cf-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0b46a5c-11c9-11ea-a3cf-12813bfff9fa;
 Thu, 28 Nov 2019 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574936935; x=1606472935;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1S3ewwlN4Mf/H/wnOBqwDyzYDkbaS1taeqXGTYFjf+g=;
 b=LovLKIJNpMfMz5SNPk26g1wmWR3xS7nwlKZJpulUrSgWEYCmOsBiVDuD
 of6zE7/hlKPfqbx4jUv1ctrwquUTn6OwcFHQH1sbO98CpHnv2esLmuA6V
 RBfRWnQ6Xo5s05RfpP4BjyVtOdQlzSi1R33LtZ1hR/DSy2PcuZpTDHsHX 4=;
IronPort-SDR: 3FjL3cFlW+De2lP4sPTg2WOO+BT5vwWiMg+DTbacZ8WDoAivAGBnXGczRa7EZ0XBnoJNuC1ndW
 AKBKV4gA75Nw==
X-IronPort-AV: E=Sophos;i="5.69,253,1571702400"; d="scan'208";a="10393059"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 28 Nov 2019 10:28:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9B037A07A5; Thu, 28 Nov 2019 10:28:42 +0000 (UTC)
Received: from EX13D37EUA002.ant.amazon.com (10.43.165.200) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 28 Nov 2019 10:28:42 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUA002.ant.amazon.com (10.43.165.200) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 28 Nov 2019 10:28:41 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 28 Nov 2019 10:28:40 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>
Thread-Topic: [PATCH v3] xen/x86: vpmu: Unmap per-vCPU PMU page when the
 domain is destroyed
Thread-Index: AQHVpc+a1vQ9PhJpBkmpX8fhBCKt/KegYBWAgAABClA=
Date: Thu, 28 Nov 2019 10:28:40 +0000
Message-ID: <fe423423f0754b94bd3260ace3e398af@EX13D32EUC003.ant.amazon.com>
References: <20191128093828.8462-1-pdurrant@amazon.com>
 <33cd176f-074f-9c3a-1ba6-7a1b40f604ed@suse.com>
In-Reply-To: <33cd176f-074f-9c3a-1ba6-7a1b40f604ed@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Grall, 
 Julien" <jgrall@amazon.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI4IE5vdmVtYmVyIDIwMTkgMTA6MjMNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBCb3JpcyBPc3Ryb3Zza3kNCj4gPGJvcmlz
Lm9zdHJvdnNreUBvcmFjbGUuY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnOyBHcmFsbCwgSnVsaWVuIDxqZ3JhbGxAYW1hem9uLmNvbT47DQo+IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT47IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IEtl
dmluIFRpYW4NCj4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10geGVuL3g4NjogdnBtdTogVW5tYXAgcGVyLXZDUFUg
UE1VIHBhZ2Ugd2hlbiB0aGUNCj4gZG9tYWluIGlzIGRlc3Ryb3llZA0KPiANCj4gT24gMjguMTEu
MjAxOSAxMDozOCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IEZyb206IEp1bGllbiBHcmFsbCA8
amdyYWxsQGFtYXpvbi5jb20+DQo+ID4NCj4gPiBBIGd1ZXN0IHdpbGwgc2V0dXAgYSBzaGFyZWQg
cGFnZSB3aXRoIHRoZSBoeXBlcnZpc29yIGZvciBlYWNoIHZDUFUgdmlhDQo+ID4gWEVOUE1VX2lu
aXQuIFRoZSBwYWdlIHdpbGwgdGhlbiBnZXQgbWFwcGVkIGluIHRoZSBoeXBlcnZpc29yIGFuZCBv
bmx5DQo+ID4gcmVsZWFzZWQgd2hlbiBYRU5QTVVfZmluaXNoIGlzIGNhbGxlZC4NCj4gPg0KPiA+
IFRoaXMgbWVhbnMgdGhhdCBpZiB0aGUgZ3Vlc3QgZmFpbHMgdG8gaW52b2tlIFhFTlBNVV9maW5p
c2gsIGUuZyBpZiBpdCBpcw0KPiA+IGRlc3Ryb3llZCByYXRoZXIgdGhhbiBjbGVhbmx5IHNodXQg
ZG93biwgdGhlIHBhZ2Ugd2lsbCBzdGF5IG1hcHBlZCBpbg0KPiB0aGUNCj4gPiBoeXBlcnZpc29y
LiBPbmUgb2YgdGhlIGNvbnNlcXVlbmNlcyBpcyB0aGUgZG9tYWluIGNhbiBuZXZlciBiZSBmdWxs
eQ0KPiA+IGRlc3Ryb3llZCBhcyBhIHBhZ2UgcmVmZXJlbmNlIGlzIHN0aWxsIGhlbGQuDQo+ID4N
Cj4gPiBBcyBYZW4gc2hvdWxkIG5ldmVyIHJlbHkgb24gdGhlIGd1ZXN0IHRvIGNvcnJlY3RseSBj
bGVhbi11cCBhbnkNCj4gPiBhbGxvY2F0aW9uIGluIHRoZSBoeXBlcnZpc29yLCB3ZSBzaG91bGQg
YWxzbyB1bm1hcCBzdWNoIHBhZ2VzIGR1cmluZyB0aGUNCj4gPiBkb21haW4gZGVzdHJ1Y3Rpb24g
aWYgdGhlcmUgYXJlIGFueSBsZWZ0Lg0KPiA+DQo+ID4gV2UgY2FuIHJlLXVzZSB0aGUgc2FtZSBs
b2dpYyBhcyBpbiBwdnBtdV9maW5pc2goKS4gVG8gYXZvaWQNCj4gPiBkdXBsaWNhdGlvbiwgbW92
ZSB0aGUgbG9naWMgaW4gYSBuZXcgZnVuY3Rpb24gdGhhdCBjYW4gYWxzbyBiZSBjYWxsZWQNCj4g
PiBmcm9tIHZwbXVfZGVzdHJveSgpLg0KPiA+DQo+ID4gTk9URTogLSBUaGUgY2FsbCB0byB2cG11
X2Rlc3Ryb3koKSBtdXN0IGFsc28gYmUgbW92ZWQgZnJvbQ0KPiA+ICAgICAgICAgYXJjaF92Y3B1
X2Rlc3Ryb3koKSBpbnRvIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIHN1Y2ggdGhhdA0K
PiA+ICAgICAgICAgdGhlIHJlZmVyZW5jZSBvbiB0aGUgbWFwcGVkIHBhZ2UgZG9lcyBub3QgcHJl
dmVudA0KPiBkb21haW5fZGVzdHJveSgpDQo+ID4gICAgICAgICAod2hpY2ggY2FsbHMgYXJjaF92
Y3B1X2Rlc3Ryb3koKSkgZnJvbSBiZWluZyBjYWxsZWQuDQo+ID4gICAgICAgLSBXaGlsc3QgaXQg
YXBwZWFycyB0aGF0IHZwbXVfYXJjaF9kZXN0cm95KCkgaXMgaWRlbXBvdGVudCBpdCBpcw0KPiA+
ICAgICAgICAgYnkgbm8gbWVhbnMgb2J2aW91cy4gSGVuY2UgbWFrZSBzdXJlIHRoZSBWUE1VX0NP
TlRFWFRfQUxMT0NBVEVEDQo+ID4gICAgICAgICBmbGFnIGlzIGNsZWFyZWQgYXQgdGhlIGVuZCBv
ZiB2cG11X2FyY2hfZGVzdHJveSgpLg0KPiA+ICAgICAgIC0gVGhpcyBpcyBub3QgYW4gWFNBIGJl
Y2F1c2UgdlBNVSBpcyBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkIChzZWUNCj4gPiAgICAgICAgIFhT
QS0xNjMpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1h
em9uLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jb20+DQo+ID4gLS0tDQo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPiBD
YzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gPiBDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gPiBDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50
ZWwuY29tPg0KPiA+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gPg0K
PiA+IHYyOg0KPiA+ICAtIFJlLXdvcmQgY29tbWl0IGNvbW1lbnQgc2xpZ2h0bHkNCj4gPiAgLSBS
ZS1lbmZvcmNlIGlkZW1wb3RlbmN5IG9mIHZtcHVfYXJjaF9kZXN0cm95KCkNCj4gPiAgLSBNb3Zl
IGludm9jYXRpb24gb2YgdnBtdV9kZXN0cm95KCkgZWFybGllciBpbg0KPiA+ICAgIGRvbWFpbl9y
ZWxpbnF1aXNoX3Jlc291cmNlcygpDQo+IA0KPiBXaGF0IGFib3V0IHYzPw0KDQpPaCwgc29ycnk6
DQoNCnYzOg0KIC0gQWRkIGNvbW1lbnQgcmVnYXJkaW5nIFhTQS0xNjMNCiAtIFJldmVydCBjaGFu
Z2VzIHNldHRpbmcgVlBNVV9DT05URVhUX0FMTE9DQVRFRCBpbiBjb21tb24gY29kZQ0KDQogIFBh
dWwNCg0KPiANCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L3ZwbXUuYw0KPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9jcHUvdnBtdS5jDQo+ID4gQEAgLTU3NiwxMSArNTc2LDM2IEBAIHN0YXRpYyB2
b2lkIHZwbXVfYXJjaF9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KQ0KPiA+DQo+ID4gICAgICAgICAg
IHZwbXUtPmFyY2hfdnBtdV9vcHMtPmFyY2hfdnBtdV9kZXN0cm95KHYpOw0KPiA+ICAgICAgfQ0K
PiA+ICsNCj4gPiArICAgIHZwbXVfcmVzZXQodnBtdSwgVlBNVV9DT05URVhUX0FMTE9DQVRFRCk7
DQo+ID4gIH0NCj4gDQo+IEJvcmlzLCB0byBiZSBvbiB0aGUgc2FmZSBzaWRlIC0gYXJlIHlvdSBp
biBhZ3JlZW1lbnQgd2l0aCB0aGlzDQo+IGNoYW5nZSwgbm93IHRoYXQgdGhlIHNldHRpbmcgb2Yg
dGhlIGZsYWcgaXMgYmVpbmcgbGVmdCB1bnRvdWNoZWQ/DQo+IA0KPiBKYW4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
