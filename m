Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFAB17A655
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 14:27:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9qTW-000418-M5; Thu, 05 Mar 2020 13:23:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pMQk=4W=amazon.com=prvs=326c579fd=hongyxia@srs-us1.protection.inumbo.net>)
 id 1j9qTV-000413-CY
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 13:23:41 +0000
X-Inumbo-ID: 87497152-5ee4-11ea-a5b4-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87497152-5ee4-11ea-a5b4-12813bfff9fa;
 Thu, 05 Mar 2020 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1583414621; x=1614950621;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cU95ycMND9GeRn+YjjReHnFuN74S3MZ+E/jHz3PNMRw=;
 b=CMitLDF7VANcKxezFjwhDC2x5NIriRW06Zn2tbUC0NzAxpsKfOL3KHMn
 57eGYZpbMTdVFZcY7XfROIsypJb501k2jhXieJTYWckn5gVm2saV1vvH8
 hmzvY71QcS2GZS/yilsajX0szMj6aGKlAU0wfNZ30EkuCpH+X1gllcZyh U=;
IronPort-SDR: iRA1/I89KKm/f+hl7Mz4vwjRx7cPyZwH6voGRTKg9CpnQlJgAb8ReC/awBP1QcU7lRz4VCtumH
 Dd5fRRg0DhQw==
X-IronPort-AV: E=Sophos;i="5.70,518,1574121600"; d="scan'208";a="21163305"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 05 Mar 2020 13:23:29 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0DF3AA2D7D; Thu,  5 Mar 2020 13:23:24 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 5 Mar 2020 13:23:24 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Mar 2020 13:23:23 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1497.006;
 Thu, 5 Mar 2020 13:23:23 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "pdurrant@amzn.com" <pdurrant@amzn.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v3 1/6] domain: introduce
 alloc/free_shared_info() helpers...
Thread-Index: AQHV8uxNAQsPed399E6+S/AMqb+Rvag5/KMA
Date: Thu, 5 Mar 2020 13:23:23 +0000
Message-ID: <02cbae7ef896e59eecbe89cbf898142a49c8e191.camel@amazon.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-2-pdurrant@amzn.com>
In-Reply-To: <20200305124504.3564-2-pdurrant@amzn.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.82]
Content-ID: <EE7ED44DE4D52F4B8245DE1098028A3F@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 1/6] domain: introduce
 alloc/free_shared_info() helpers...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDIwLTAzLTA1IGF0IDEyOjQ0ICswMDAwLCBwZHVycmFudEBhbXpuLmNvbSB3cm90
ZToNCj4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiANCj4gLi4u
IGFuZCBzYXZlIHRoZSBNRk4uDQo+IA0KPiBUaGlzIHBhdGNoIG1vZGlmaWVzIHRoZSAnc2hhcmVk
X2luZm8nIGZpZWxkIG9mIHN0cnVjdCBkb21haW4gdG8gYmUNCj4gYSBzdHJ1Y3R1cmUgY29tcHJp
c2luZyBhbiBNRk4gYW5kIGEgdmlydHVhbCBhZGRyZXNzLiBBbGxvY2F0aW9ucyBhcmUNCj4gc3Rp
bGwgZG9uZSBmcm9tIHhlbmhlYXAsIHNvIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc3RpbGwgZXF1YXRl
cyB0bw0KPiB2aXJ0X3RvX21mbigpIGNhbGxlZCBvbiB0aGUgTUZOIGJ1dCBzdWJzZXF1ZW50IHBh
dGNoIHdpbGwgY2hhbmdlDQo+IHRoaXMuDQo+IEhlbmNlIHRoZSBuZWVkIHRvIHNhdmUgdGhlIE1G
Ti4NCj4gDQo+IE5PVEU6IFdoaXN0IGRlZmluaW5nIHRoZSBuZXcgaGVscGVycywgdmlydF90b19t
Zm4oKSBpbg0KPiBjb21tb24vZG9tYWluLmMNCj4gICAgICAgaXMgbWFkZSB0eXBlIHNhZmUuDQo+
ICAgICAgIFRoZSBkZWZpbml0aW9uIG9mIG5taV9yZWFzb24oKSBpbiBhc20teDg2L3NoYXJlZC5o
IGlzIGFsc28gcmUtDQo+ICAgICAgIGZsb3dlZCB0byBhdm9pZCBvdmVybHkgbG9uZyBsaW5lcy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4N
Cj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IC4uLg0KPiAg
DQo+ICtpbnQgYWxsb2Nfc2hhcmVkX2luZm8oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50
IG1lbWZsYWdzKQ0KPiArew0KPiArICAgIGlmICggKGQtPnNoYXJlZF9pbmZvLnZpcnQgPSBhbGxv
Y194ZW5oZWFwX3BhZ2VzKDAsIG1lbWZsYWdzKSkgPT0NCj4gTlVMTCApDQo+ICsgICAgICAgIHJl
dHVybiAtRU5PTUVNOw0KPiArDQo+ICsgICAgZC0+c2hhcmVkX2luZm8ubWZuID0gdmlydF90b19t
Zm4oZC0+c2hhcmVkX2luZm8udmlydCk7DQo+ICsNCj4gKyAgICBjbGVhcl9wYWdlKGQtPnNoYXJl
ZF9pbmZvLnZpcnQpOw0KPiArICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QobWZuX3RvX3Bh
Z2UoZC0+c2hhcmVkX2luZm8ubWZuKSwgZCwNCj4gU0hBUkVfcncpOw0KPiArDQo+ICsgICAgcmV0
dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgZnJlZV9zaGFyZWRfaW5mbyhzdHJ1Y3QgZG9tYWlu
ICpkKQ0KPiArew0KPiArICAgIGlmICggIWQtPnNoYXJlZF9pbmZvLnZpcnQgKQ0KPiArICAgICAg
ICByZXR1cm47DQo+ICsNCj4gKyAgICBmcmVlX3hlbmhlYXBfcGFnZShkLT5zaGFyZWRfaW5mby52
aXJ0KTsNCj4gKyAgICBkLT5zaGFyZWRfaW5mby52aXJ0ID0gTlVMTDsNCj4gK30NCj4gKw0KDQpJ
IHdhcyBnb2luZyB0byBzYXkgdGhhdCBmcmVlX3hlbmhlYXBfcGFnZSgpIGNhbiBkZWFsIHdpdGgg
TlVMTCBzbyB3ZSBkbw0Kbm90IGhhdmUgdG8gcmV0dXJuIG9uIE5VTEwuIEJ1dCB0aGVuIEkgZm91
bmQgdGhhdCB0aGUgZmluYWwgcGF0Y2ggbmVlZHMNCnRvIHVubWFwIGl0IHdoaWNoIGNhbm5vdCBk
ZWFsIHdpdGggTlVMTCBhbnl3YXksIHNvIEkgbm8gbG9uZ2VyIGhhdmUgYQ0Kc3Ryb25nIG9waW5p
b24gdG8gZG8gY2xlYW4tdXBzIGhlcmUuDQoNCk90aGVyIHRoYW4gdGhhdCwNClJldmlld2VkLWJ5
OiBIb25neWFuIFhpYSA8aG9uZ3l4aWFAYW1hem9uLm9yZz4NCg0KSG9uZ3lhbg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
