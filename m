Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5744D983E6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 21:02:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0VpF-0001so-JU; Wed, 21 Aug 2019 18:59:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0VpD-0001sh-Rm
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 18:59:16 +0000
X-Inumbo-ID: c56230a8-c445-11e9-adc9-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c56230a8-c445-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 18:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566413955; x=1597949955;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=eHVE/B1xjpXeLrDGR8emtKYyBbU1bl25dwayjw3gmis=;
 b=Y53GnbgoaTqZqejCDrZ/I9bF+ETix9jAe7GdVM3wxHEFyG0641qsU3dS
 g5AsRVwDyN/6RYr7wU2WLR97ff72FQtEJsGuVllKTuQ2tNrG9CN3s16pf
 UTuscYv/m06eYtG+CyOoX7tHgh/oqdGSEo6gFHdyaZmx5jr5ZpafTgeTX 0=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="780556358"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 21 Aug 2019 18:59:14 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 37713C0CA3; Wed, 21 Aug 2019 18:59:13 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 18:59:13 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 18:59:12 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 21 Aug 2019 18:59:12 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Thread-Topic: [livepatch-hooks-2 PATCH 4/4] livepatch: Add per-function
 applied/reverted state tracking marker
Thread-Index: AQHVUnvCoVyGwbQJe0ipwL19/8bc1KcF8xkAgAAM+IA=
Date: Wed, 21 Aug 2019 18:59:12 +0000
Message-ID: <0655A662-83C4-4959-A789-AD641CE2ADD6@amazon.com>
References: <20190814083911.89280-1-wipawel@amazon.de>
 <dcfce3be-570d-2148-bc3b-a3279013ea17@oracle.com>
In-Reply-To: <dcfce3be-570d-2148-bc3b-a3279013ea17@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
Content-ID: <59010F358DCCC24DAF4C6E40D5E04921@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch-hooks-2 PATCH 4/4] livepatch: Add
 per-function applied/reverted state tracking marker
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>,
 "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDIxLiBBdWcgMjAxOSwgYXQgMjA6MTIsIEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiA4LzE0LzE5IDQ6MzkgQU0sIFBh
d2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOg0KPj4gI2lmZGVmIF9fWEVOX18NCj4+ICt0eXBlZGVm
IGVudW0gbGl2ZXBhdGNoX2Z1bmNfc3RhdGUgew0KPj4gKyAgICBMSVZFUEFUQ0hfRlVOQ19OT1Rf
QVBQTElFRCA9IDAsDQo+PiArICAgIExJVkVQQVRDSF9GVU5DX0FQUExJRUQgPSAxDQo+PiArfSBs
aXZlcGF0Y2hfZnVuY19zdGF0ZV90Ow0KPj4gKw0KPj4gIHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyB7
DQo+PiAgICAgIGNvbnN0IGNoYXIgKm5hbWU7ICAgICAgIC8qIE5hbWUgb2YgZnVuY3Rpb24gdG8g
YmUgcGF0Y2hlZC4gKi8NCj4+ICAgICAgdm9pZCAqbmV3X2FkZHI7DQo+PiBAQCAtODM0LDYgKzgz
OSwxMCBAQCBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgew0KPj4gICAgICB1aW50MzJfdCBvbGRfc2l6
ZTsNCj4+ICAgICAgdWludDhfdCB2ZXJzaW9uOyAgICAgICAgLyogTVVTVCBiZSBMSVZFUEFUQ0hf
UEFZTE9BRF9WRVJTSU9OLiAqLw0KPj4gICAgICB1aW50OF90IG9wYXF1ZVszMV07DQo+PiArI2lm
IGRlZmluZWQgQ09ORklHX1g4Ng0KPj4gKyAgICB1aW50OF90IGFwcGxpZWQ7DQo+PiArICAgIHVp
bnQ4X3QgX3BhZFs3XTsNCj4+ICsjZW5kaWYNCj4+ICB9Ow0KPiANCj4gVGhyZWUgcmVxdWVzdHM6
DQo+ICAtIFdoeSBkb2VzIGl0IGhhdmUgdG8gYmUgWDg2IHNwZWNpZmljPw0KDQpNb3N0bHkgYmVj
YXVzZSBJIGFtIHVuYWJsZSB0byB0ZXN0IHRoYXQgb24gQVJNIChFTk9ERVbigKYpLg0KDQo+ICAt
IENhbiB5b3UgYWxzbyBpbmNsdWRlIHRoZSBjaGFuZ2UgaW4gdGhlIGRvY3VtZW50YXRpb24gd2hl
cmUgdGhlIHNwZWMgDQo+IHJlc2lkZXM/DQoNClllcywgd2lsbCBkby4NCg0KPiAgLSBZb3UgYXJl
IGJ1bXBpbmcgdGhlIHZlcnNpb24gdG8gMiwgYnV0IG5vdCBtYWtpbmcgaXQgYmFja3dhcmRzIA0K
PiBjb21wYXRpYmxlLiBJZiBzbyAseW91IGFsc28gbmVlZCB0byB1cGRhdGUgdGhlIGRvY3VtZW50
YXRpb24gdG8gbWVudGlvbiANCj4gdGhpcy4NCg0KDQpPaywgSSB3aWxsIHVwZGF0ZSB0aGF0IGFz
IHdlbGwuDQoNCkJlc3QgUmVnYXJkcywNClBhd2VsIFdpZWN6b3JraWV3aWN6DQoNCgoKCkFtYXpv
biBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJl
cmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJp
Y2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0
OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
