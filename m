Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40A231B74
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 10:44:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0hgi-0000sz-Ll; Wed, 29 Jul 2020 08:43:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mo4V=BI=amazon.co.uk=prvs=472d6771e=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k0hgh-0000su-1Z
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 08:43:47 +0000
X-Inumbo-ID: 9d410c76-d177-11ea-8c31-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d410c76-d177-11ea-8c31-bc764e2007e4;
 Wed, 29 Jul 2020 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1596012227; x=1627548227;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=OfSsSp6Dy4pjFLphQPxj8p6BUGXjTaeaZSSWXQ7GJQs=;
 b=tbLsoMDojL9awG4g2i+T8q65IRQgrZU7DwYk9jTXfi4kh4oKwrg16eEW
 EKkOsSkOj2uwAXhmrXePm6Q8pudbL7R9daqgYYja9wlq5RBODzzGEdY9X
 oMVSVzlWO4gm4snM8ZiFoxNTpdTEHNNWdg2sGAuCyg7rBufqQFaADQy/M E=;
IronPort-SDR: KEmM/0zXdwPY2MTgIlimUlUsJfrE6jB0gBLUwdH7gyE5vxDPXFVUXZ1IqUTImg7oa+jLmyve+K
 vT2MXAECWIMg==
X-IronPort-AV: E=Sophos;i="5.75,409,1589241600"; d="scan'208";a="63893741"
Subject: RE: [PATCH 5/6] iommu: remove the share_p2m operation
Thread-Topic: [PATCH 5/6] iommu: remove the share_p2m operation
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 29 Jul 2020 08:43:44 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1682EA1758; Wed, 29 Jul 2020 08:43:43 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 29 Jul 2020 08:43:42 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 29 Jul 2020 08:43:41 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 29 Jul 2020 08:43:41 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQJEvXWV1fglpFS8p501Sb8VALJosQJLmpxbAdhpFh2oIGsK0A==
Date: Wed, 29 Jul 2020 08:43:41 +0000
Message-ID: <f739576139d143f48dfd30516a3380e5@EX13D32EUC003.ant.amazon.com>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-6-paul@xen.org>
 <0e3d1914-2bf0-0b14-721e-7694f3657523@citrix.com>
In-Reply-To: <0e3d1914-2bf0-0b14-721e-7694f3657523@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAyNCBKdWx5IDIwMjAgMjA6MDENCj4gVG86
IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+OyBLZXZpbiBUaWFuDQo+IDxrZXZpbi50aWFuQGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0gW1BBVENIIDUvNl0gaW9tbXU6IHJlbW92ZSB0aGUg
c2hhcmVfcDJtIG9wZXJhdGlvbg0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVk
IGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3Blbg0KPiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5k
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gMjQvMDcvMjAyMCAx
Nzo0NiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAYW1hem9uLmNvbT4NCj4gPg0KPiA+IFNoYXJpbmcgb2YgSEFQIHRhYmxlcyBpcyBWVC1kIHNw
ZWNpZmljIHNvIHRoZSBvcGVyYXRpb24gaXMgbmV2ZXIgZGVmaW5lZCBmb3INCj4gPiBBTUQgSU9N
TVUuDQo+IA0KPiBJdCdzIG5vdCBWVC1kIHNwZWNpZmljLCBhbmQgWGVuIHJlYWxseSBkaWQgdXNl
ZCB0byBzaGFyZSBvbiBBTUQuDQo+IA0KDQpPaCwgSSBuZXZlciB0aG91Z2h0IHRoYXQgZXZlciB3
b3JrZWQuDQoNCj4gSW4gZmFjdCwgYSByZW1uYW50IG9mIHRoaXMgbG9naWMgaXMgc3RpbGwgcHJl
c2VudCBpbiB0aGUgZm9ybSBvZiB0aGUNCj4gY29tbWVudCBmb3IgcDJtX3R5cGVfdCBleHBsYWlu
aW5nIHdoeSBwMm1fcmFtX3J3IG5lZWRzIHRvIGJlIDAuDQo+IA0KPiBUaGF0IHNhaWQsIEkgYWdy
ZWUgaXQgc2hvdWxkbid0IGJlIGEgaG9vaywgYmVjYXVzZSBpdCBpcyBzdGF0aWNhbGx5DQo+IGtu
b3duIGF0IGRvbWFpbiBjcmVhdGUgdGltZSBiYXNlZCBvbiBmbGFncyBhbmQgaGFyZHdhcmUgcHJv
cGVydGllcy4NCj4gDQoNCldlbGwsIGZvciBWVC1kIHRoYXQgbWF5IHdlbGwgY2hhbmdlIGluIGZ1
dHVyZSA7LSkNCg0KPiA+ICBUaGVyZSdzIGFsc28gbm8gbmVlZCB0byBwcm8tYWN0aXZlbHkgc2V0
IHZ0ZC5wZ2RfbWFkZHIgd2hlbiB1c2luZw0KPiA+IHNoYXJlZCBFUFQgYXMgaXQgaXMgc3RyYWln
aHRmb3J3YXJkIHRvIHNpbXBseSBkZWZpbmUgYSBoZWxwZXIgZnVuY3Rpb24gdG8NCj4gPiByZXR1
cm4gdGhlIGFwcHJvcHJpYXRlIHZhbHVlIGluIHRoZSBzaGFyZWQgYW5kIG5vbi1zaGFyZWQgY2Fz
ZXMuDQo+IA0KPiBJdCBvY2N1cnMgdG8gbWUgdGhhdCB2dGQucGdkX21hZGRyIGFuZCBhbWQucm9v
dF90YWJsZSByZWFsbHkgYXJlIHRoZQ0KPiBzYW1lIHRoaW5nLCBhbmQgZnVydGhlcm1vcmUgYXJl
IGNvbW1vbiB0byBhbGwgSU9NTVUgaW1wbGVtZW50YXRpb25zIG9uDQo+IGFueSBhcmNoaXRlY3R1
cmUuICBJcyBpdCB3b3J0aCB0cnlpbmcgdG8gbWFrZSB0aGVtIGNvbW1vbiwgcmF0aGVyIHRoYW4N
Cj4gY29udGludWluZyB0byBsZXQgZWFjaCBpbXBsZW1lbnRhdGlvbiBoYW5kbGUgdGhlbSBkaWZm
ZXJlbnRseT8NCg0KSSBsb29rZWQgYXQgdGhpcy4gVGhlIHByb2JsZW0gcmVhbGx5IGxpZXMgaW4g
dGVybWlub2xvZ3kuIFRoZSAncm9vdCB0YWJsZScgaW4gdGhlIFZULWQgY29kZSByZWZlcnMgdG8g
dGhlIHNpbmdsZSByb290IHRhYmxlIHdoaWNoIElJUkMgaXMgY2FsbGVkIHRoZSBkZXZpY2UgdGFi
bGUgaW4gdGhlIEFNRCBJT01NVSBjb2RlIHNvLCB3aGlsc3QgSSBjb3VsZCBjb252ZXJ0IGJvdGgg
dG8gdXNlIGEgc2luZ2xlIGNvbW1vbiBmaWVsZCwgSSB0aGluayBpdCdzIG5vdCByZWFsbHkgdGhh
dCB2YWx1YWJsZSB0byBkbyBzbyBzaW5jZSBpdCdzIGxpa2VseSB0byBtYWtlIHRoZSBjb2RlIHNs
aWdodGx5IG1vcmUgY29uZnVzaW5nIHRvIHJlYWQgKGZvciBzb21lb25lIGV4cGVjdGluZyB0aGUg
bmFtZXMgdG8gdGFsbHkgd2l0aCB0aGUgc3BlYykuDQoNCiAgUGF1bA0KDQo+IA0KPiB+QW5kcmV3
DQo=

