Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443D8983EE
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 21:05:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Vso-0002qN-RZ; Wed, 21 Aug 2019 19:02:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Vsn-0002qC-QV
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 19:02:57 +0000
X-Inumbo-ID: 49af96f2-c446-11e9-b95f-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49af96f2-c446-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 19:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566414177; x=1597950177;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=l8ZRd+QZpA7kjC2vg2LzWkMge5p4TBKTdlN2wYO/qXw=;
 b=Gb1GeTOi+D/6gTxeiomqSpKwaqC+k/rngjlkFyw76Zr4zILzd6K+plLv
 57lEZvwNhOCOAq5g6Bj4kz4i5scTfJ09Ia72YrZmHuYKaoD3+DE489h5d
 jIPCuHLIcNXaTB83kP8d0TwrFw4+CWpVVd2PKykGa0IDqNhstE1GQFGgs c=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="780557200"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 21 Aug 2019 19:02:57 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3CB0C241712; Wed, 21 Aug 2019 19:02:53 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 19:02:53 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 19:02:52 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 21 Aug 2019 19:02:52 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Thread-Topic: [PATCH 10/14] livepatch: Add support for inline asm hotpatching
 expectations
Thread-Index: AQHVV/lLGB8pkfX9Vkeh2CxPqhkquqcF7SKAgAAI+oA=
Date: Wed, 21 Aug 2019 19:02:52 +0000
Message-ID: <6E53FDCF-ACBD-4C22-ADB7-7F710C6D8551@amazon.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-11-wipawel@amazon.de>
 <eac23543-5784-4531-78ac-27c92fd5f366@oracle.com>
In-Reply-To: <eac23543-5784-4531-78ac-27c92fd5f366@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
Content-ID: <BDB9CA5965CABD46A76851FABF75702E@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 10/14] livepatch: Add support for inline asm
 hotpatching expectations
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
 Wei Liu <wl@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDIxLiBBdWcgMjAxOSwgYXQgMjA6MzAsIEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiA4LzIxLzE5IDQ6MTkgQU0sIFBh
d2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOg0KPj4gIHR5cGVkZWYgZW51bSBsaXZlcGF0Y2hfZnVu
Y19zdGF0ZSB7DQo+PiAgICAgIExJVkVQQVRDSF9GVU5DX05PVF9BUFBMSUVEID0gMCwNCj4+ICAg
ICAgTElWRVBBVENIX0ZVTkNfQVBQTElFRCA9IDENCj4+IEBAIC04MzgsMTEgKzg1MCwxMiBAQCBz
dHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgew0KPj4gICAgICB1aW50MzJfdCBuZXdfc2l6ZTsNCj4+ICAg
ICAgdWludDMyX3Qgb2xkX3NpemU7DQo+PiAgICAgIHVpbnQ4X3QgdmVyc2lvbjsgICAgICAgIC8q
IE1VU1QgYmUgTElWRVBBVENIX1BBWUxPQURfVkVSU0lPTi4gKi8NCj4+IC0gICAgdWludDhfdCBv
cGFxdWVbMzFdOw0KPj4gKyAgICB1aW50OF90IG9wYXF1ZVtMSVZFUEFUQ0hfT1BBUVVFX1NJWkVd
Ow0KPj4gICNpZiBkZWZpbmVkIENPTkZJR19YODYNCj4+ICAgICAgdWludDhfdCBhcHBsaWVkOw0K
Pj4gICAgICB1aW50OF90IF9wYWRbN107DQo+PiAgI2VuZGlmDQo+PiArICAgIGxpdmVwYXRjaF9l
eHBlY3RhdGlvbl90IGV4cGVjdDsNCj4+ICB9Ow0KPiANCj4gQWFhaCwgbm93IEkgdW5kZXJzdGFu
ZCB3aHkgeW91IGRlY2lkZSB0byBjcmVhdGUgYSBuZXcgZmllbGQgX3BhZCBhbmQgYXBwbGllZCBm
aWVsZCENCj4gDQoNCll1cCwgdGhhdCB3YXMgcHJlbWVkaXRhdGVkISA6LSkNCg0KPiBBbnkgcGFy
dGljdWxhciByZWFzb24gd2h5IHRoZSB2ZXJzaW9uIGNhbid0IGJlIDIgc2luY2UgdGhpcyBjYW4g
YmUgcGFydCBvZiB0aGlzIGNoYW5nZXNldD8gQWxzbyB5b3Ugd291bGQgbmVlZCB0byBoYXZlIGEg
RG9jdW1lbnRhdGlvbiBjaGFuZ2UuDQoNCkl0IHN1cmVseSBjYW4gYmUgMi4gSSB3YXNu4oCZdCBz
dXJlIGJlZm9yZSBpZiB0aGUgY2hhbmdlcyBjb3VsZCBnbyB0b2dldGhlci4gV2lsbCBjaGFuZ2Ug
dG8gMiBmb3IgYm90aA0KDQpBbmQsIEkgd2lsbCBhbHNvIHVwZGF0ZSB0aGUgZG9jLiANCg0KQmVz
dCBSZWdhcmRzLA0KUGF3ZWwgV2llY3pvcmtpZXdpY3oKCgoKQW1hem9uIERldmVsb3BtZW50IENl
bnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNm
dWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBh
bSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVy
bGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
