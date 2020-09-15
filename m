Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AD026A753
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 16:40:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIC83-000752-07; Tue, 15 Sep 2020 14:40:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAW0=CY=amazon.co.uk=prvs=52058768a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kIC81-00074x-JF
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 14:40:17 +0000
X-Inumbo-ID: 51ecb473-7b9c-4d0b-8702-d80597383a01
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51ecb473-7b9c-4d0b-8702-d80597383a01;
 Tue, 15 Sep 2020 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1600180816; x=1631716816;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=Hy+kE/eM5u5K5wUongpXbrJrr7PtmwYDgtffKcloeXM=;
 b=K9XskenVL1yGU+6fTwi5uGaw3nkjz/IJz1SL5xVGZ0mu0ltRAwAyp+Dd
 MdgsgYs+J9SfGtUi7lNacofzUXbfxF4ijHXhXNDyAphSnAZpRix/UQINO
 hYzTQkbbyOAlbUijlLDherq8JNaGjUPt1XiS3ElChJNmCEIhPLh5G5vJ0 A=;
X-IronPort-AV: E=Sophos;i="5.76,430,1592870400"; d="scan'208";a="76328813"
Subject: RE: [PATCH v2 1/2] libxl: provide a mechanism to define a device 'safe
 remove' function...
Thread-Topic: [PATCH v2 1/2] libxl: provide a mechanism to define a device
 'safe remove' function...
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 15 Sep 2020 14:40:11 +0000
Received: from EX13D32EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 92078A1C38; Tue, 15 Sep 2020 14:40:10 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 15 Sep 2020 14:40:09 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Tue, 15 Sep 2020 14:40:09 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Paul Durrant
 <paul@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Thread-Index: AQHWi2qImV5OOrwqqkGp2+x3HZycYalpwxcAgAABI4A=
Date: Tue, 15 Sep 2020 14:40:09 +0000
Message-ID: <0e7f999a7611436fbdc99e0329a98c0c@EX13D32EUC003.ant.amazon.com>
References: <20200915141007.25965-1-paul@xen.org>
 <20200915141007.25965-2-paul@xen.org> <20200915143156.GN753@Air-de-Roger>
In-Reply-To: <20200915143156.GN753@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDogMTUgU2VwdGVtYmVyIDIwMjAgMTU6MzINCj4g
VG86IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBJYW4g
SmFja3Nvbg0KPiA8aXdqQHhlbnByb2plY3Qub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBSRTog
W0VYVEVSTkFMXSBbUEFUQ0ggdjIgMS8yXSBsaWJ4bDogcHJvdmlkZSBhIG1lY2hhbmlzbSB0byBk
ZWZpbmUgYSBkZXZpY2UgJ3NhZmUgcmVtb3ZlJw0KPiBmdW5jdGlvbi4uLg0KPiANCj4gQ0FVVElP
TjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9u
LiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNh
biBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+
IA0KPiANCj4gT24gVHVlLCBTZXAgMTUsIDIwMjAgYXQgMDM6MTA6MDZQTSArMDEwMCwgUGF1bCBE
dXJyYW50IHdyb3RlOg0KPiA+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNv
bT4NCj4gPg0KPiA+IC4uLiBhbmQgdXNlIGl0IHRvIGRlZmluZSBsaWJ4bF9kZXZpY2VfZGlza19z
YWZlX3JlbW92ZSgpLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBidWlsZHMgb24gdGhlIGV4aXN0ZW50
IG1hY3JvIG1hZ2ljIGJ5IHVzaW5nIGEgbmV3IHZhbHVlIG9mIHRoZQ0KPiA+ICdmb3JjZScgZmll
bGQgaW4gaW4gbGlieGxfX2FvX2RldmljZS4NCj4gPiBJdCBpcyBjdXJyZW50bHkgZGVmaW5lZCBh
cyBhbiBpbnQgYnV0IGlzIHVzZWQgaW4gYSBib29sZWFuIG1hbm5lciB3aGVyZQ0KPiA+IDEgbWVh
bnMgdGhlIG9wZXJhdGlvbiBpcyBmb3JjZWQgYW5kIDAgbWVhbnMgaXQgaXMgbm90IChidXQgaXMg
YWN0dWFsbHkgZm9yY2VkDQo+ID4gYWZ0ZXIgYSAxMHMgdGltZS1vdXQpLiBJbiBhZGRpbmcgYSB0
aGlyZCB2YWx1ZSwgdGhpcyBwYXRjaCByZS1kZWZpbmVzICdmb3JjZScNCj4gPiBhcyBhIHN0cnVj
dCB0eXBlIChsaWJ4bF9fZm9yY2UpIHdpdGggYSBzaW5nbGUgJ2ZsYWcnIGZpZWxkIHRha2luZyBh
bg0KPiA+IGVudW1lcmF0ZWQgdmFsdWU6DQo+ID4NCj4gPiBMSUJYTF9fRk9SQ0VfQVVUTyAtIGNv
cnJlc3BvbmRpbmcgdG8gdGhlIG9sZCAwIHZhbHVlDQo+ID4gTElCWExfX0ZPUkNFX09OICAgLSBj
b3JyZXNwb25kaW5nIHRvIHRoZSBvbGQgMSB2YWx1ZQ0KPiA+IExJQlhMX19GT1JDRV9PRkYgIC0g
dGhlIG5ldyB2YWx1ZQ0KPiA+DQo+ID4gVGhlIExJQlhMX0RFRklORV9ERVZJQ0VfUkVNT1ZFKCkg
bWFjcm8gaXMgdGhlbiBtb2RpZmllZCB0byBkZWZpbmUgdGhlDQo+ID4gbGlieGxfZGV2aWNlXzx0
eXBlPl9yZW1vdmUoKSBhbmQgbGlieGxfZGV2aWNlXzx0eXBlPl9kZXN0cm95KCkgZnVuY3Rpb25z
LA0KPiA+IHNldHRpbmcgTElCWExfX0ZPUkNFX0FVVE8gYW5kIExJQlhMX19GT1JDRV9PTiAocmVz
cGVjdGl2ZWx5KSBpbiB0aGUNCj4gPiBsaWJ4bF9fYW9fZGV2aWNlIHBhc3NlZCB0byBsaWJ4bF9f
aW5pdGlhdGVfZGV2aWNlX2dlbmVyaWNfcmVtb3ZlKCkgYW5kIGENCj4gPiBuZXcgbWFjcm8sIExJ
QlhMX0RFRklORV9ERVZJQ0VfU0FGRV9SRU1PVkUoKSwgaXMgZGVmaW5lZCB0aGF0IHNldHMNCj4g
PiBMSUJYTF9fRk9SQ0VfT0ZGIGluc3RlYWQuIFRoaXMgbWFjcm8gaXMgdXNlZCB0byBkZWZpbmUg
dGhlIG5ldw0KPiA+IGxpYnhsX2RldmljZV9kaXNrX3NhZmVfcmVtb3ZlKCkgZnVuY3Rpb24uDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
DQo+IA0KPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+DQo+IA0KDQpUaGFua3MuDQoNCj4gSnVzdCBvbmUgbml0Lg0KPiANCj4gPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVy
bmFsLmgNCj4gPiBpbmRleCBlMTZhZTk2MzBiLi4xZmNmODVjM2UyIDEwMDY0NA0KPiA+IC0tLSBh
L3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgNCj4gPiArKysgYi90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5oDQo+ID4gQEAgLTI3MzAsMTIgKzI3MzAsMjAgQEAgX2hpZGRlbiB2b2lkIGxp
YnhsX19wcmVwYXJlX2FvX2RldmljZShsaWJ4bF9fYW8gKmFvLCBsaWJ4bF9fYW9fZGV2aWNlDQo+
ICphb2Rldik7DQo+ID4gIC8qIGdlbmVyaWMgY2FsbGJhY2sgZm9yIGRldmljZXMgdGhhdCBvbmx5
IG5lZWQgdG8gc2V0IGFvX2NvbXBsZXRlICovDQo+ID4gIF9oaWRkZW4gdm9pZCBkZXZpY2VfYWRk
cm1fYW9jb21wbGV0ZShsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19hb19kZXZpY2UgKmFvZGV2KTsN
Cj4gPg0KPiA+ICt0eXBlZGVmIHN0cnVjdCB7DQo+ID4gKyAgICBlbnVtIHsNCj4gPiArICAgICAg
ICBMSUJYTF9fRk9SQ0VfQVVUTywgLyogUmUtZXhlY3V0ZSB3aXRoIEZPUkNFX09OIGlmIG9wIHRp
bWVzIG91dCAqLw0KPiA+ICsgICAgICAgIExJQlhMX19GT1JDRV9PTiwNCj4gPiArICAgICAgICBM
SUJYTF9fRk9SQ0VfT0ZGLA0KPiA+ICsgICAgfSBmbGFnOw0KPiA+ICt9IGxpYnhsX19mb3JjZTsN
Cj4gDQo+IENvdWxkbid0IHlvdSBqdXN0IHVzZSB0aGUgdHlwZWRlZiBhZ2FpbnN0IHRoZSB1bmlv
biBkaXJlY3RseSBpbnN0ZWFkDQo+IG9mIHdyYXBwaW5nIGl0IGFyb3VuZCBhIHN0cnVjdD8NCg0K
WW91IG1lYW4gcy91bmlvbi9lbnVtPw0KDQpJIGNvdWxkIGhhdmUgZG9uZSB0aGF0LCBidXQgaXQg
aGVscGVkIGZpbmQgYWxsIHRoZSBwbGFjZXMgd2hlcmUgYW9kZXYtPmZvcmNlIGlzIHVzZWQgYW5k
IEkgbGlrZWQgdGhlIGFic3RyYWN0aW9uLiBJIGRvbid0IG1pbmQgY2hhbmdpbmcgaWYgdGhlcmUg
YXJlIHN0cm9uZyBvcGluaW9ucyBhZ2FpbnN0IGl0Lg0KDQogIFBhdWwNCg0KPiANCj4gVGhhbmtz
LCBSb2dlci4NCg==

