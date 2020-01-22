Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB411145929
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 16:59:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuINJ-0007g1-DY; Wed, 22 Jan 2020 15:57:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8xH2=3L=amazon.co.uk=prvs=28361e846=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iuINH-0007fw-1F
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 15:56:59 +0000
X-Inumbo-ID: d1bcf244-3d2f-11ea-bc97-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1bcf244-3d2f-11ea-bc97-12813bfff9fa;
 Wed, 22 Jan 2020 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579708618; x=1611244618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=652ZmjrPJlwIHX032SZrYOn6k1820BCBM8tTAjkEzrI=;
 b=OsYzY+OLlJljziPDAGzyD48IzVoeWVVeXvlRvRwDcfx/bWX7Hlki+jnK
 wjKlZQqKnPBJRSTwskxjuhwL4RjqP/Zaf6dOs2EryQ567rKNjwPsDfEh5
 vL5r0wMacJNuDyyjhnJwKwlQry8zK/opyQFEL0IOx7ML2Zvc2ioL2Qr8r s=;
IronPort-SDR: NFp3FGcOhxUDNAB4CbofeRP2MC9FM7FCPdtaDwxHzcDGxAIxKuc2uzptQu+KhSNvnczwEs95nn
 ppKSk8Im/bow==
X-IronPort-AV: E=Sophos;i="5.70,350,1574121600"; d="scan'208";a="20389847"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 22 Jan 2020 15:56:46 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2E135C07CF; Wed, 22 Jan 2020 15:56:43 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 22 Jan 2020 15:56:43 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 15:56:42 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 22 Jan 2020 15:56:42 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH 2/3] x86 / hvm: add domain_relinquish_resources() method
Thread-Index: AQHV0FJZRyIY+pOZxUu7LP3gD4xgXaf21tOAgAABMbA=
Date: Wed, 22 Jan 2020 15:56:42 +0000
Message-ID: <9ad0b7eec02945dba00017f3bfe85730@EX13D32EUC003.ant.amazon.com>
References: <20200121120009.1767-1-pdurrant@amazon.com>
 <20200121120009.1767-3-pdurrant@amazon.com>
 <018a1293-ad4f-44e3-ab73-90491077e434@suse.com>
In-Reply-To: <018a1293-ad4f-44e3-ab73-90491077e434@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.87]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/3] x86 / hvm: add
 domain_relinquish_resources() method
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIyIEphbnVhcnkgMjAyMCAxNTo1MQ0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsgSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsgS2V2aW4g
VGlhbg0KPiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8z
XSB4ODYgLyBodm06IGFkZCBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKQ0KPiBtZXRob2QN
Cj4gDQo+IE9uIDIxLjAxLjIwMjAgMTM6MDAsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBUaGVy
ZSBhcmUgdHdvIGZ1bmN0aW9ucyBpbiBodm0uYyB0byBkZWFsIHdpdGggdGVhci1kb3duIGFuZCBh
IGRvbWFpbjoNCj4gPiBodm1fZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgYW5kIGh2bV9k
b21haW5fZGVzdHJveSgpLiBIb3dldmVyLA0KPiBvbmx5DQo+ID4gdGhlIGxhdHRlciBoYXMgYW4g
YXNzb2NpYXRlZCBtZXRob2QgaW4gJ2h2bV9mdW5jcycuIFRoaXMgcGF0Y2ggYWRkcw0KPiA+IGEg
bWV0aG9kIGZvciB0aGUgZm9ybWVyIGFuZCBzdHViIGRlZmluaXRpb25zIGZvciBTVk0gYW5kIFZN
WC4NCj4gDQo+IFdoeSB0aGUgc3R1YnM/IFNpbXBseSAuLi4NCj4gDQo+ID4gLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS9odm0uYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4gPiBA
QCAtNzE1LDYgKzcxNSw4IEBAIGludCBodm1fZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFp
biAqZCkNCj4gPg0KPiA+ICB2b2lkIGh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoc3Ry
dWN0IGRvbWFpbiAqZCkNCj4gPiAgew0KPiA+ICsgICAgaHZtX2Z1bmNzLmRvbWFpbl9yZWxpbnF1
aXNoX3Jlc291cmNlcyhkKTsNCj4gDQo+IC4uLiBzdGljayBhIE5VTEwgY2hlY2sgYXJvdW5kIHRo
aXMgb25lLiBJIGFsc28gd29uZGVyIHdoZXRoZXIsIGl0DQo+IGJlaW5nIGVudGlyZWx5IG5ldywg
dGhpcyB3b3VsZG4ndCBiZXR0ZXIgdXNlIGFsdGVybmF0aXZlIGNhbGwNCj4gcGF0Y2hpbmcgcmln
aHQgZnJvbSB0aGUgYmVnaW5uaW5nLiBJdCdzIG5vdCB0aGUgaG90dGVzdCBwYXRoLCBidXQNCj4g
YXZvaWRpbmcgaW5kaXJlY3QgY2FsbHMgc2VlbXMgcXVpdGUgZGVzaXJhYmxlLCBlc3BlY2lhbGx5
IHdoZW4NCj4gZG9pbmcgc28gaXMgcmVsYXRpdmVseSBjaGVhcC4NCj4gDQoNCkknZCBsaWtlIGl0
IHRvIGFsaWduIHdpdGggdGhlIHJlc3Qgb2YgdGhlIGh2bV9mdW5jcyBzbyBJJ2xsIGFkZCB0aGUg
TlVMTCBjaGVjaywgYnV0IGFsdGVybmF0aXZlcyBwYXRjaCBmb3IgYWxsIGh2bV9mdW5jcyBzZWVt
cyBsaWtlIGEgZ29vZCB0aGluZyBJIHRoZSBsb25nZXIgdGVybS4NCg0KICBQYXVsDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
