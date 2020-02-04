Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471CD151D09
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:18:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyzvL-0007jN-KI; Tue, 04 Feb 2020 15:15:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jY6G=3Y=amazon.com=prvs=29681cb87=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iyzvJ-0007j7-J8
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:15:33 +0000
X-Inumbo-ID: 2fc5ca38-4761-11ea-8f83-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fc5ca38-4761-11ea-8f83-12813bfff9fa;
 Tue, 04 Feb 2020 15:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580829333; x=1612365333;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dXcQKq0eQLEfYNqGVI5rUCKwUbUeVbvh4q5Ct+SXnG8=;
 b=bPFE1G5yHQ/HT6bqjUDcg/xgjGtqjmwRt/6Ii4+3XX1MUO/BF5z2IgEF
 l6UFHwvMwDgZvzJHu5NrWS6u9lvfkbVAs2n3b05iDV0dWKfAH7c50RTxA
 Ihd4L/bvIc3eUedloF1d5n7NjzTHAjAKN1DWwKzpLIjdO21myYmxi6nl8 U=;
IronPort-SDR: d8d7j4fXYuFqkKhjH9fmo774oF7HDE2zKvVy4XtMyvcmo5nFaYUrdyA6n5WMWsVx3QvK8dgHw0
 7lYfMQ5EFfXQ==
X-IronPort-AV: E=Sophos;i="5.70,402,1574121600"; d="scan'208";a="16167234"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 04 Feb 2020 15:15:32 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id E3E8EA217A; Tue,  4 Feb 2020 15:15:30 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 4 Feb 2020 15:15:30 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 4 Feb 2020 15:15:29 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Tue, 4 Feb 2020 15:15:29 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
Thread-Index: AQHV2sFWMdawPhAp9U+F7nPCwgL3BKgLFhmAgAAQQoA=
Date: Tue, 4 Feb 2020 15:15:29 +0000
Message-ID: <a2e2065084f1ff3c8ff0b6ee95d2f42bcaeea0b9.camel@amazon.com>
References: <45c03833059b0ce3f52c02693a2eb649356adf3e.1580755007.git.hongyxia@amazon.com>
 <874e3640-35ea-bd54-7961-8d94f09bad8a@citrix.com>
In-Reply-To: <874e3640-35ea-bd54-7961-8d94f09bad8a@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.18]
Content-ID: <F7A473A88E649743BAF9B9620D023CFD@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Grall, Julien" <jgrall@amazon.com>, "wl@xen.org" <wl@xen.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDIwLTAyLTA0IGF0IDE0OjE3ICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAwMy8wMi8yMDIwIDE4OjM2LCBIb25neWFuIFhpYSB3cm90ZToNCj4gPiBSZXdyaXRlIHRo
ZSBtYXBjYWNoZSB0byBiZSBwdXJlbHkgcGVyLXZDUFUgaW5zdGVhZCBvZiBwYXJ0bHkgcGVyLQ0K
PiA+IHZDUFUNCj4gPiBhbmQgcGFydGx5IHBlci1kb21haW4uDQo+ID4gDQo+ID4gVGhpcyBwYXRj
aCBpcyBuZWVkZWQgdG8gYWRkcmVzcyBwZXJmb3JtYW5jZSBpc3N1ZXMgd2hlbiB3ZSBzdGFydA0K
PiA+IHJlbHlpbmcNCj4gPiBvbiB0aGUgbWFwY2FjaGUsIGUuZy4sIHdoZW4gd2UgZG8gbm90IGhh
dmUgYSBkaXJlY3QgbWFwLiBDdXJyZW50bHksDQo+ID4gdGhlDQo+ID4gcGVyLWRvbWFpbiBsb2Nr
IG9uIHRoZSBtYXBjYWNoZSBpcyBhIGJvdHRsZW5lY2sgZm9yIG11bHRpY29yZSwNCj4gPiBjYXVz
aW5nDQo+ID4gcGVyZm9ybWFuY2UgZGVncmFkYXRpb24gYW5kIGV2ZW4gZnVuY3Rpb25hbCByZWdy
ZXNzaW9ucy4NCj4gDQo+IERvIHlvdSBtZWFuIHRoYXQgdGhpcyBwYXRjaCBjYXVzZXMgYSByZWdy
ZXNzaW9uLCBvciB0aGF0IHJlbW92aW5nIHRoZQ0KPiBkaXJlY3RtYXAgY2F1c2VzIGEgcmVncmVz
c2lvbj8NCj4gDQo+IFRoZSByZXN0IG9mIHRoZSBjb21taXQgbWVzc2FnZSBpcyB2ZXJ5IGNvbmZ1
c2luZyB0byBmb2xsb3cuDQoNCk9uY2UgdGhlIGRpcmVjdCBtYXAgaXMgZ29uZSwgdXNpbmcgdGhl
IGV4aXN0aW5nIG1hcGNhY2hlIGltcGxlbWVudGF0aW9uDQppbiBtYXBfZG9tYWluX3BhZ2UgY2F1
c2VzIHRoZXNlIHByb2JsZW1zLiBFdmVuIGlmIHRoZSBkaXJlY3QgbWFwIGlzDQpzdGlsbCB0aGVy
ZSwgY3VycmVudGx5IHNvbWUgZ3Vlc3RzIG9uIGRlYnVnIGJ1aWxkIHJlbHkgb24gdGhlIG1hcGNh
Y2hlLA0Kd2hpY2ggd2lsbCBzZWUgc2ltaWxhciBwcm9ibGVtcyB3aGVuIHRoZSB2Q1BVIGNvdW50
IGlzIGhpZ2guDQoNCkkgY2FuIHJld29yZCB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gbWFrZSBpdCBj
bGVhcmVyLg0KDQo+ID4gIFRoaXMgcGF0Y2gNCj4gPiBtYWtlcyB0aGUgbWFwcGluZyBzdHJ1Y3R1
cmUgcGVyLXZDUFUgYW5kIGNvbXBsZXRlbHkgbG9ja2xlc3MuDQo+ID4gDQo+ID4gRnVuY3Rpb25h
bCByZWdyZXNzaW9uOg0KPiA+IA0KPiA+IFdoZW4gYSBkb21haW4gaXMgcnVuIG9uIG1vcmUgdGhh
biA2NCBjb3JlcywgRnJlZUJTRCAxMCBwYW5pY2tzDQo+ID4gZnJlcXVlbnRseQ0KPiA+IGR1ZSB0
byBvY2Nhc2lvbmFsIHNpbXVsdGFuZW91cyBzZXRfc2luZ2xlc2hvdF90aW1lciBoeXBlcmNhbGxz
IGZyb20NCj4gPiB0b28NCj4gPiBtYW55IGNvcmVzLiBTb21lIGNvcmVzIHdpbGwgYmUgYmxvY2tl
ZCB3YWl0aW5nIG9uIG1hcF9kb21haW5fcGFnZSwNCj4gPiBldmVudHVhbGx5IGZhaWxpbmcgdG8g
c2V0IGEgdGltZXIgaW4gdGhlIGZ1dHVyZS4gRnJlZUJTRCBjYW5ub3QNCj4gPiBoYW5kbGUNCj4g
PiB0aGlzIGFuZCBwYW5pY2tzLiBUaGlzIHdhcyBmaXhlZCBpbiBsYXRlciBGcmVlQlNEIHJlbGVh
c2VzIGJ5DQo+ID4gaGFuZGxpbmcNCj4gPiAtRVRJTUUsIGJ1dCBzdGlsbCB0aGUgZGVncmFkYXRp
b24gaW4gdGltZXIgcGVyZm9ybWFuY2UgaXMgYSBiaWcNCj4gPiBpc3N1ZS4NCj4gPiANCj4gPiBQ
ZXJmb3JtYW5jZSByZWdyZXNzaW9uOg0KPiA+IA0KPiA+IE1hbnkgYmVuY2htYXJrcyBzZWUgYSBw
ZXJmb3JtYW5jZSBkcm9wIHdoZW4gaGF2aW5nIGEgbGFyZ2UgY29yZQ0KPiA+IGNvdW50Lg0KPiA+
IEkgaGF2ZSBkb25lIGEgR2Vla2JlbmNoIG9uIGEgMzItdkNQVSBndWVzdC4NCj4gPiANCj4gPiBw
ZXJmIGRyb3AgICAgIG9sZCAgICAgICAgbmV3DQo+ID4gc2luZ2xlICAgICAgIDAuMDQlICAgICAg
MC4xOCUNCj4gPiBtdWx0aSAgICAgICAgMi40MyUgICAgICAwLjA4JQ0KPiA+IA0KPiA+IFJlbW92
aW5nIHRoZSBwZXItZG9tYWluIGxvY2sgaW4gdGhlIG1hcGNhY2hlIGJyaW5ncyB0aGUgbXVsdGkt
Y29yZQ0KPiA+IHBlcmZvcm1hbmNlIGFsbW9zdCBpZGVudGljYWwgdG8gdXNpbmcgdGhlIGRpcmVj
dCBtYXAgZm9yIG1hcHBpbmdzLg0KPiA+IA0KPiA+IFRoZXJlIHNob3VsZCBiZSByb29tIGZvciBm
dXRoZXIgb3B0aW1pc2F0aW9ucywgYnV0IHRoaXMgYWxyZWFkeQ0KPiA+IGltcHJvdmVzIG92ZXIg
dGhlIG9sZCBtYXBjYWNoZSBieSBhIGxvdC4NCj4gPiANCj4gPiBOb3RlIHRoYXQgZW50cmllcyBp
biB0aGUgbWFwaGFzaCB3aWxsIG9jY3VweSBpbnVzZSBzbG90cy4gV2l0aCAxNg0KPiA+IHNsb3Rz
DQo+ID4gcGVyIHZDUFUgYW5kIGEgbWFwaGFzaCBjYXBhY2l0eSBvZiA4LCB3ZSBvbmx5IGhhdmUg
YW5vdGhlciA4DQo+ID4gYXZhaWxhYmxlLA0KPiA+IHdoaWNoIGlzIG5vdCBlbm91Z2ggZm9yIG5l
c3RlZCBwYWdlIHRhYmxlIHdhbGtzLiBXZSBuZWVkIHRvDQo+ID4gaW5jcmVhc2UgdGhlDQo+ID4g
bnVtYmVyIG9mIHNsb3RzIGluIGNvbmZpZy5oLg0KPiANCj4gSSdtIGFmcmFpZCB0aGF0IEkgZG9u
J3QgZm9sbG93IHdoYXQgeW91J3JlIHRyeWluZyB0byBzYXkgaGVyZS4gIFRoZQ0KPiBudW1iZXIg
b2Ygc2xvdHMgc2hvdWxkIGVpdGhlciBiZSBmaW5lLCBvciB3ZSd2ZSBnb3QgYSBwcmUtZXhpdGlu
Zw0KPiBidWcuDQoNClRoZSBtYXBjYWNoZSBkZXNpZ24gaXMgbm93IGRpZmZlcmVudC4gVGhlIHNs
b3RzIG5vdyBoYXZlIHRvIGluY2x1ZGUNCnNwYWNlcyBmb3IgdGhlIG1hcGhhc2gsIHdoaWNoIHdh
cyBub3QgdGhlIGNhc2UgYmVmb3JlLg0KDQpIb25neWFuDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
