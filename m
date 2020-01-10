Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48319136BD8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 12:17:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipsG8-0007kD-LC; Fri, 10 Jan 2020 11:15:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ryA=27=amazon.co.uk=prvs=27124b7d2=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ipsG6-0007k8-CI
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 11:15:18 +0000
X-Inumbo-ID: 7bac7be8-339a-11ea-b89f-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bac7be8-339a-11ea-b89f-bc764e2007e4;
 Fri, 10 Jan 2020 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1578654918; x=1610190918;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a93z8+IH6FpkM0FUkH+ZA86pvOKqJRxFwnzu3ximBV0=;
 b=UzS5NZfX8IuoEXfmCRZbn4A/Z/YXI0aHT9vvCledvKYgLWXNzHDUh3YJ
 Oht29bzJplfsUy57fHEA5iH59ruYT0zLvRmWxu3t6v5NALEQ+ndJqvAHf
 gFrEzkV5bXuHJEXcHkH0sHmMBSVhIu8oHhnmYCVP/1tGPMUo8/JpDA3K5 k=;
IronPort-SDR: cgu1V/Dyp39W99yQ8RCgd1KdoJ0u20Kt4EzImAIqsJ7A1Z0lDuV6aGwqY8NgRJFiGWfjV5hIGp
 Uel1/eHZrfbw==
X-IronPort-AV: E=Sophos;i="5.69,416,1571702400"; d="scan'208";a="11866806"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 10 Jan 2020 11:15:17 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id 485A5A25E1; Fri, 10 Jan 2020 11:15:15 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 11:15:14 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 11:15:13 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 10 Jan 2020 11:15:13 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: David Woodhouse <dwmw2@infradead.org>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [RFC PATCH 1/3] x86/setup: Don't skip 2MiB
 underneath relocated Xen image
Thread-Index: AQHVxkj/dE+VGyyACUafOFHjEmx/safjwJsw
Date: Fri, 10 Jan 2020 11:15:13 +0000
Message-ID: <b682f2100c234e9a930e4001d33bcf8e@EX13D32EUC003.ant.amazon.com>
References: <dbdedd077330af79c13ba5ed38b0aec0b7128886.camel@infradead.org>
 <20200108172500.1419665-1-dwmw2@infradead.org>
In-Reply-To: <20200108172500.1419665-1-dwmw2@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.252]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 1/3] x86/setup: Don't skip 2MiB
 underneath relocated Xen image
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "paul@xen.org" <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gRGF2aWQgV29v
ZGhvdXNlDQo+IFNlbnQ6IDA4IEphbnVhcnkgMjAyMCAxNzoyNQ0KPiBUbzogWGVuLWRldmVsIDx4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+DQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwNCj4gPGp1bGllbkB4ZW4ub3Jn
PjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFk
LndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4
LmNvbT47DQo+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBwYXVs
QHhlbi5vcmc7IElhbiBKYWNrc29uDQo+IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1DQo+IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtSRkMgUEFUQ0ggMS8zXSB4
ODYvc2V0dXA6IERvbid0IHNraXAgMk1pQiB1bmRlcm5lYXRoDQo+IHJlbG9jYXRlZCBYZW4gaW1h
Z2UNCj4gDQo+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+DQo+IA0K
PiBTZXQgJ2UnIGNvcnJlY3RseSB0byByZWZsZWN0IHRoZSBsb2NhdGlvbiB0aGF0IFhlbiBpcyBh
Y3R1YWxseSByZWxvY2F0ZWQNCj4gdG8gZnJvbSBpdHMgZGVmYXVsdCAyTWlCIGxvY2F0aW9uLiBO
b3QgMk1pQiBiZWxvdyB0aGF0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgV29vZGhvdXNl
IDxkd213QGFtYXpvbi5jby51az4NCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvc2V0dXAuYyB8IDgg
KysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94
ODYvc2V0dXAuYw0KPiBpbmRleCA1MDFmM2Y1ZTRiLi40N2UwNjVlNWZlIDEwMDY0NA0KPiAtLS0g
YS94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiBA
QCAtMTA3Nyw5ICsxMDc3LDkgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5z
aWduZWQgbG9uZw0KPiBtYmlfcCkNCj4gICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcHRlX3Vw
ZGF0ZV9saW1pdDsNCj4gDQo+ICAgICAgICAgICAgICAvKiBTZWxlY3QgcmVsb2NhdGlvbiBhZGRy
ZXNzLiAqLw0KPiAtICAgICAgICAgICAgZSA9IGVuZCAtIHJlbG9jX3NpemU7DQo+IC0gICAgICAg
ICAgICB4ZW5fcGh5c19zdGFydCA9IGU7DQo+IC0gICAgICAgICAgICBib290c3ltKHRyYW1wb2xp
bmVfeGVuX3BoeXNfc3RhcnQpID0gZTsNCj4gKyAgICAgICAgICAgIHhlbl9waHlzX3N0YXJ0ID0g
ZW5kIC0gcmVsb2Nfc2l6ZTsNCj4gKyAgICAgICAgICAgIGUgPSB4ZW5fcGh5c19zdGFydCArIFhF
Tl9JTUdfT0ZGU0VUOw0KPiArICAgICAgICAgICAgYm9vdHN5bSh0cmFtcG9saW5lX3hlbl9waHlz
X3N0YXJ0KSA9IHhlbl9waHlzX3N0YXJ0Ow0KPiANCj4gICAgICAgICAgICAgIC8qDQo+ICAgICAg
ICAgICAgICAgKiBObyBQVEVzIHBvaW50aW5nIGFib3ZlIHRoaXMgYWRkcmVzcyBhcmUgY2FuZGlk
YXRlcyBmb3INCj4gcmVsb2NhdGlvbi4NCg0KRG8geW91IG5vdCBhbHNvIG5lZWQgdG8gYWRqdXN0
IHRoZSBzZXR0aW5nIG9mIHB0ZV91cGRhdGVfbGltaXQgdGhhdCdzIGp1c3Qgb3V0IG9mIGNvbnRl
eHQgYmVsb3cgaGVyZT8NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
