Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80C196338
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 16:55:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i05V1-0004C1-8a; Tue, 20 Aug 2019 14:52:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xv/m=WQ=amazon.de=prvs=128763efb=wipawel@srs-us1.protection.inumbo.net>)
 id 1i05V0-0004Bs-3Y
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 14:52:38 +0000
X-Inumbo-ID: 269856b4-c35a-11e9-a19a-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 269856b4-c35a-11e9-a19a-bc764e2007e4;
 Tue, 20 Aug 2019 14:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566312757; x=1597848757;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=r+pTe98I1EO2xStgZV0N4CPcqy58F1jczoXTOAhK1vQ=;
 b=R5/UbJUjokIDZa0/oPYzjHj2nJI+GsKWPuI0zk+o/+3eBeW44xJApUy+
 fMdfnxKxmUSA0dSZL4qKtqLYSCeICsCC5CDzGYawyF9u2tl9QVNL6jJUx
 3hl91xM46z6+A3OgTvRa79+jz7YJOvW4acaF9Urq5jg3o9y82+GaHeVrf M=;
X-IronPort-AV: E=Sophos;i="5.64,408,1559520000"; d="scan'208";a="416310771"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 20 Aug 2019 14:52:36 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 31676A2894; Tue, 20 Aug 2019 14:52:32 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 14:52:32 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 14:52:31 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 20 Aug 2019 14:52:31 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [livepatch: independ. modules v2 2/3] livepatch: Allow to
 override inter-modules buildid dependency
Thread-Index: AQHVV1tB7jJmQrvzvEmH1GVKxLQqlqcECawAgAAJaACAAAVIAIAABraA
Date: Tue, 20 Aug 2019 14:52:31 +0000
Message-ID: <2BE73DB1-9C24-4728-AC08-4A3C5E4187F6@amazon.com>
References: <20190416125832.32881-2-wipawel@amazon.de>
 <20190820132854.110843-1-wipawel@amazon.de>
 <7401194e-6070-968f-6254-cfdeaf7514a1@arm.com>
 <CB3FCDBE-6DD1-4F17-B106-AE26E478AB74@amazon.com>
 <c6b76dbd-bf18-aa66-0e55-84b9adedb45a@arm.com>
In-Reply-To: <c6b76dbd-bf18-aa66-0e55-84b9adedb45a@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
Content-ID: <08C87DA5CF318B45892613B8076743B6@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch: independ. modules v2 2/3] livepatch:
 Allow to override inter-modules buildid dependency
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDIwLiBBdWcgMjAxOSwgYXQgMTY6MjgsIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPj4+IA0K4oCmc25pcC4uLg0KPj4gWWVh
aCwgc2luY2UgSSBnb3QgZmVlZGJhY2sgYW5kIHJldmlld3Mgb24gdmFyaW91cyBwYXRjaGVzIHRo
YXQgSSBoYXZlIGFscmVhZHkgc3VibWl0dGVkIHRoZSB3YXkgSSBkaWQsDQo+PiBJIHNpbXBseSBj
b250aW51ZSB3aXRoIHdoYXQgSSBoYXZlIHVudGlsIGFsbCBjb21tZW50cyBhcmUgYWRkcmVzc2Vk
IChJIGRvIG5vdCB3YW50IHRvIGxvc2UgYW55dGhpbmcpLg0KPiANCj4gV2hhdCBkbyB5b3UgbWVh
biBieSAiYWxsIGNvbW1lbnRzIGFyZSBhZGRyZXNzZWQiPyBVc3VhbGx5IHlvdSBnYXRoZXIgYSBz
ZXQgb2YgY29tbWVudHMgZm9yIGEgc2VyaWVzLCBhZGRyZXNzIHRoZW0gYW5kIHRoZW4gcmVzZW5k
IHRoZSBzZXJpZXMgd2l0aCBhbGwgb2YgdGhlbSBhZGRyZXNzZWQuDQo+IA0KDQpZZWFoLCBidXQg
cGVvcGxlIGludmVzdGVkIHRpbWUgaW4gcmV2aWV3cyBhbmQgcmVwbGllZCB0byBteSBpbmNvcnJl
Y3RseSBzZW50IHRocmVhZHMsIHNvIEkgZmluZCBpdCBydWRlIHRvIGlnbm9yZSBzdWNoIGNvbW1l
bnRzIGFuZCBzdGFydCBhIG5ldyB0aHJlYWQgaW5zdGVhZC4NCkJ1dCBpZiB0aGlzIGlzIHRoZSBy
ZWNvbW1lbmRlZCBwcmFjdGljZSwgSSB3aWxsIG9iZXkuDQoNCj4+IFRoZW4sIEkgd2lsbCByZS1z
ZW5kIHRoZSBwYXRjaGVzIGluIDIgc2VyaWVzOiBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMgYW5kIHhl
biB3aXRoIGFsbCBjaGFuZ2VzLA0KPj4gUmV2aWV3ZWQtYnkvQWNrZWQtYnkgYW5kIGNvdmVyIGxl
dHRlcnMuIFRoaXMgaXMgdGhlIHdheSByZWNvbW1lbmRlZCBieSBBbmRyZXcuDQo+IA0KPiBQbGVh
c2UgZG9uJ3Qgc2VuZCB0aGUgcGF0Y2ggb25lIGJ5IG9uZSB0byBjaGVjayBpZiBldmVyeW9uZSBp
cyBoYXBweS4gSnVzdCByZXNlbmQgYWxsIG9mIHRoZW0gaW4gb25lIGdvIG9uY2UgeW91IGdhdGhl
cmVkIGVub3VnaCBmZWVkYmFjay4NCj4gDQoNCk9rLg0KDQo+PiBVbmZvcnR1bmF0ZWx5LCBpdCB3
aWxsIGJlIGFsc28gcXVpdGUgY29uZnVzaW5nIEkgdGhpbmssIGJlY2F1c2UgdmFyaW91cyBjaGFu
Z2VzIGJlbG9uZ2luZyB0byBkaWZmZXJlbnQgdG9waWNzLA0KPj4gYXJlIGRpc3RyaWJ1dGVkIGJl
dHdlZW4gdGhvc2UgMiBkaXN0aW5jdCByZXBvcy4NCj4gDQo+IFRoYXQgYWxzbyBoYXBwZW4gd2hl
biB5b3UgaGF2ZSBtdWx0aXBsZSBwYXRjaGVzIGluIGEgc2VyaWVzLiBGZWF0dXJlIGltcGxlbWVu
dGVkIGFjY3Jvc3MgbXVsdGlwbGUgcGF0Y2ggbmVlZHMgYSBwbGFjZSB0byBkaXNjdXNzLiBUaGlz
IGNhbiB1c3VhbGx5IGJlIGRvbmUgaW4gdGhlIGNvdmVyIGxldHRlci4gRm9yIG11bHRpIHJlcG8g
c2VyaWVzLCB5b3UgY2FuIHN0ZWVyIHRoZSBkaXNjdXNzaW9uIG9uIGEgc2luZ2xlIHJlcG8gYW5k
IGp1c3QgcmVwbGljYXRlIHRoZSBjaGFuZ2VzIGluIHRoZSBvdGhlciBvbmUgb25jZSB0aGVyZSBh
cmUgYW4gYWdyZWVtZW50Lg0KDQpGaW5lLiBMZXQgbWUgdGhlbiBzZW5kIHRoZSAyIGZ1bGwgc2Vy
aWVzIGZvciBlYWNoIHJlcG8gd2l0aCBhbGwgdGhlIGNoYW5nZXMgYW5kIGNvcnJlc3BvbmRpbmcg
Y292ZXIgbGV0dGVycy4NCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFs
bA0KDQoNCkJlc3QgUmVnYXJkcywNClBhd2VsIFdpZWN6b3JraWV3aWN6DQoNCgoKCkFtYXpvbiBE
ZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxp
bgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gK
RWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3
MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
