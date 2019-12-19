Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D0512626D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 13:41:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihv45-0004do-Cm; Thu, 19 Dec 2019 12:38:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiZr=2J=amazon.com=prvs=249f004f8=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihv44-0004dj-85
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 12:38:00 +0000
X-Inumbo-ID: 63e9454e-225c-11ea-919a-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63e9454e-225c-11ea-919a-12813bfff9fa;
 Thu, 19 Dec 2019 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576759080; x=1608295080;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G4gPSh7gDic4Mk5FrzNWC8/1SG3UNm7G7sIf4SPYzE8=;
 b=LTgkC2tnpHjyNMj8W+CqAPw3hzLecZ7h1ITHWfK5ecFR+Sg18Vs4/TGp
 i3fQNEKrgYlm+OMk9tOC1C77bVUa7UCNSsRFYxm30lDehawTA7vbcFZCf
 1Hr/UBKcNzFHjrnKcJNcpCandVggq1tNCH8OPDIwt0w/jwqJR9yUADw6w 4=;
IronPort-SDR: KrOdywtGz9qkvOPS2jVutcW742G7gJJciujx0Gm9U9YTS5DAWk1h5J0cDu//VTMdjk02w33WyS
 Xe7paYZPshdA==
X-IronPort-AV: E=Sophos;i="5.69,331,1571702400"; 
   d="scan'208";a="8331321"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 19 Dec 2019 12:37:59 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id BB4D1A1C7B; Thu, 19 Dec 2019 12:37:57 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 12:37:57 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 12:37:56 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 19 Dec 2019 12:37:56 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/save: reserve HVM save record numbers that have
 been consumed...
Thread-Index: AQHVtmSJnEe7ujCptU+cy1ctVJs22afBX3kAgAAD9+A=
Date: Thu, 19 Dec 2019 12:37:56 +0000
Message-ID: <38c8b0ddf76b497893a5bd52150423c7@EX13D32EUC003.ant.amazon.com>
References: <20191219120455.13357-1-pdurrant@amazon.com>
 <7afa5fe6-e293-a017-ce97-9aac00cc3691@citrix.com>
In-Reply-To: <7afa5fe6-e293-a017-ce97-9aac00cc3691@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.49]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86/save: reserve HVM save record
 numbers that have been consumed...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAxOSBEZWNlbWJlciAyMDE5IDEyOjE2DQo+
IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHg4Ni9zYXZlOiByZXNlcnZlIEhWTSBz
YXZlIHJlY29yZCBudW1iZXJzIHRoYXQNCj4gaGF2ZSBiZWVuIGNvbnN1bWVkLi4uDQo+IA0KPiBP
biAxOS8xMi8yMDE5IDEyOjA0LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gLi4uZm9yIHBhdGNo
ZXMgbm90ICh5ZXQpIHVwc3RyZWFtLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBpcyBzaW1wbHkgYWRk
aW5nIGEgY29tbWVudCB0byByZXNlcnZlIHNhdmUgcmVjb3JkIG51bWJlcg0KPiBzcGFjZQ0KPiA+
IHRvIGF2b2lkIHRoZSByaXNrIG9mIGNsYXNoZXMgYmV0d2VlbiBleGlzdGVudCBkb3duc3RyZWFt
IGNoYW5nZXMgbWFkZSBieQ0KPiA+IEFtYXpvbiBhbmQgZnV0dXJlIHVwc3RyZWFtIGNoYW5nZXMg
d2hpY2ggbWF5IGJlIGluY29tcGF0aWJsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8
d2xAeGVuLm9yZz4NCj4gPiAtLS0NCj4gPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KPiA+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
PiA+IENjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+DQo+
ID4gdjI6DQo+ID4gIC0gUmVkdWNlIHBhdGNoIHRvIGp1c3QgYSBjb21tZW50DQo+ID4gLS0tDQo+
ID4gIHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9odm0vc2F2ZS5oIHwgMiArKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2h2bS9zYXZlLmgNCj4gYi94ZW4vaW5jbHVkZS9wdWJs
aWMvYXJjaC14ODYvaHZtL3NhdmUuaA0KPiA+IGluZGV4IGIyYWQzZmNkNzQuLmIzZDQ0NWFjZjcg
MTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2h2bS9zYXZlLmgN
Cj4gPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvaHZtL3NhdmUuaA0KPiA+IEBA
IC02MzksNiArNjM5LDggQEAgc3RydWN0IGh2bV9tc3Igew0KPiA+DQo+ID4gICNkZWZpbmUgQ1BV
X01TUl9DT0RFICAyMA0KPiA+DQo+ID4gKy8qIFJhbmdlIDIyIC0gNDAgcmVzZXJ2ZWQgZm9yIEFt
YXpvbiAqLw0KPiANCj4gV2hhdCBhYm91dCAyMSBhbmQgMjI/wqAgQW5kIHdoZXJlIGRvZXMgdGhl
IGFjdHVhbCBudW1iZXIgc3RvcCwgYmVjYXVzZQ0KPiBiYXNlZCBvbiB2MSwgaXRzIG5vdCA0MC4N
Cj4gDQoNClRoZSByYW5nZSBpcyBpbmNsdXNpdmUgKG1heWJlIHRoYXQncyBub3Qgb2J2aW91cz8p
LiBGb3Igc29tZSByZWFzb24gMjEgd2FzIHNraXBwZWQgYnV0IHdoeSBkbyB5b3Ugc2F5IHRoZSB0
b3AgaXMgbm90IDQwPyBUaGF0IHdhcyB3aGF0IEkgc2V0IEhWTV9TQVZFX0NPREVfTUFYIHRvIGlu
IHYxLg0KDQogIFBhdWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
