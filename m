Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7D623A0B3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 10:14:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2Vbu-0002wE-Ur; Mon, 03 Aug 2020 08:14:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hjNm=BN=amazon.co.uk=prvs=47772d4cd=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k2Vbs-0002w9-RH
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 08:14:17 +0000
X-Inumbo-ID: 527c212e-d561-11ea-907c-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 527c212e-d561-11ea-907c-bc764e2007e4;
 Mon, 03 Aug 2020 08:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1596442457; x=1627978457;
 h=from:to:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=Rj3T9psIG4tq+0rH6xOV3Fol7V8ankyfiZvQrhdJ1wc=;
 b=tH6Yets2MV3AR8lemjO9L02TgODVsftfIdXCO+1BylYEi+U0JudG3KKi
 JFHLedldVUis7eJRLevNjjEsaHoz/3ZMqEmP6L1OJKzp8dfHGi6Z14jb+
 gXtq5uwrh+s/F8WK/6NHrHfBDNhhS/YcMQtqgJx44AjDXw2sMp9LMecDN Y=;
IronPort-SDR: Z6v44PorqimR+rHyqlmiktqyAKBKak0guLvXpQyvv5CfxNZMJY0L7JVjn72Cj5FDrprnyJZsYk
 +0+6IrMCCpHw==
X-IronPort-AV: E=Sophos;i="5.75,429,1589241600"; d="scan'208";a="45583303"
Subject: RE: [PATCH 3/4] public/io/netif: specify MTU override node
Thread-Topic: [PATCH 3/4] public/io/netif: specify MTU override node
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 03 Aug 2020 08:14:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 62392A0439; Mon,  3 Aug 2020 08:14:15 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 3 Aug 2020 08:14:14 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 3 Aug 2020 08:14:14 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 3 Aug 2020 08:14:13 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Paul Durrant
 <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHWaVQ8mFueWE86Tk2qq4H/3yFmCqkmCQzg
Date: Mon, 3 Aug 2020 08:14:13 +0000
Message-ID: <e34bfae1b8ea4039b7a5e50fd9052d3a@EX13D32EUC003.ant.amazon.com>
References: <20200730194858.28523-1-paul@xen.org>
 <20200730194858.28523-4-paul@xen.org>
 <9ef89ad4-c48e-ee42-cdcf-8118b2621c16@suse.com>
In-Reply-To: <9ef89ad4-c48e-ee42-cdcf-8118b2621c16@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.145]
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIEF1Z3VzdCAyMDIwIDA2OjA5DQo+IFRvOiBQYXVsIER1
cnJhbnQgPHBhdWxAeGVuLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBD
YzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBTdWJqZWN0OiBSRTog
W0VYVEVSTkFMXSBbUEFUQ0ggMy80XSBwdWJsaWMvaW8vbmV0aWY6IHNwZWNpZnkgTVRVIG92ZXJy
aWRlIG5vZGUNCj4gDQo+IE9uIDMwLjA3LjIwIDIxOjQ4LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiA+DQo+ID4gVGhl
cmUgaXMgY3VycmVudGx5IG5vIGRvY3VtZW50YXRpb24gdG8gc3RhdGUgd2hhdCBNVFUgYSBmcm9u
dGVuZCBzaG91bGQNCj4gPiBhZGVydGlzZSB0byBpdHMgbmV0d29yayBzdGFjay4gSXQgaGFzIGhv
d2V2ZXIgbG9uZyBiZWVuIGFzc3VtZWQgdGhhdCB0aGUNCj4gPiBkZWZhdWx0IHZhbHVlIG9mIDE1
MDAgaXMgY29ycmVjdC4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggc3BlY2lmaWVzIGEgbWVjaGFuaXNt
IHRvIGFsbG93IHRoZSB0b29scyB0byBzZXQgdGhlIE1UVSB2aWEgYQ0KPiA+IHhlbnN0b3JlIG5v
ZGUgaW4gdGhlIGZyb250ZW5kIGFyZWEgYW5kIHN0YXRlcyB0aGF0IHRoZSBhYnNlbmNlIG9mIHRo
YXQgbm9kZQ0KPiA+IG1lYW5zIHRoZSBmcm9udGVuZCBzaG91bGQgYXNzdW1lIGFuIE1UVSBvZiAx
NTAwIG9jdGV0cy4NCj4gPg0KPiA+IE5PVEU6IFRoZSBXaW5kb3dzIFBWIGZyb250ZW5kIGhhcyB1
c2VkIGFuIE1UVSBzYW1wbGVkIGZyb20gdGhlIHhlbnN0b3JlDQo+ID4gICAgICAgIG5vZGUgc3Bl
Y2lmaWVkIGluIHRoaXMgcGF0Y2guDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJh
bnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IA0KPiBDYW4geW91IHBsZWFzZSB1cGRhdGUgZG9j
cy9taXNjL3hlbnN0b3JlLXBhdGhzLnBhbmRvYyBhY2NvcmRpbmdseT8NCg0KU3VyZS4gR2l2ZW4g
dGhlIHBhdGggaXMgZm9yIHVzZSBieSB0b29scyB0aGVuIGl0IHNob3VsZCBpbmRlZWQgYmUgZG9j
dW1lbnRlZCB0aGVyZSBhcyB3ZWxsLg0KDQo+IFdpdGggdGhhdCB5b3UgY2FuIGhhdmUgbXk6DQo+
IA0KPiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCg0K
VGhhbmtzLA0KDQogIFBhdWwNCg0KPiANCj4gSnVlcmdlbg0K

