Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE735272598
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 15:32:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKLvj-0002fd-I0; Mon, 21 Sep 2020 13:32:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9OUB=C6=amazon.com=prvs=526e47c8c=hongyxia@srs-us1.protection.inumbo.net>)
 id 1kKLpC-0001i8-CA
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 13:25:46 +0000
X-Inumbo-ID: c371d579-9657-4431-ad35-5ccab2b054bd
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c371d579-9657-4431-ad35-5ccab2b054bd;
 Mon, 21 Sep 2020 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600694745; x=1632230745;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ibnRWHxcKnMz/J0UGFVJLLTUh2wwJpiL1TgSOysXFGk=;
 b=Wjn48R+J0Nf7GYA+E/U+ve0GeBXic9fqu7idoeArDmsSYd2i1/0BHK1Q
 M6Jr8yb4aPGRzX8FbRGBUpRijmBsCjtyGhZf8NAzBMHW3S1MT6VH9e43r
 ChJDIM1B5HQUeNBrW/V6zCIFqDGam6dqmrp0uSnspIzFJI8JQT7DBVlUH 0=;
X-IronPort-AV: E=Sophos;i="5.77,286,1596499200"; d="scan'208";a="55293747"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 21 Sep 2020 13:25:44 +0000
Received: from EX13D32EUB003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id C3B95A05A4; Mon, 21 Sep 2020 13:25:42 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 21 Sep 2020 13:25:41 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1497.006;
 Mon, 21 Sep 2020 13:25:41 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, "Durrant, Paul"
 <pdurrant@amazon.co.uk>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
 <george.dunlap@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Memory ordering question in the shutdown deferral code
Thread-Topic: Memory ordering question in the shutdown deferral code
Thread-Index: AQHWkBqzkSyNu2c0m0ChDqDA+3Jvmw==
Date: Mon, 21 Sep 2020 13:25:41 +0000
Message-ID: <53242598141735bd3b5b5ad2615a519435386bfd.camel@amazon.com>
References: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
 <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
 <92a6373003e142e9943a4057024a2616@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <92a6373003e142e9943a4057024a2616@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.78]
Content-Type: text/plain; charset="utf-8"
Content-ID: <577D9D05AA33D042BE1D76D871DBAB3E@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-Mailman-Approved-At: Mon, 21 Sep 2020 13:32:30 +0000
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

T24gTW9uLCAyMDIwLTA5LTIxIGF0IDEyOjU1ICswMDAwLCBEdXJyYW50LCBQYXVsIHdyb3RlOg0K
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4NCj4gPiBTZW50OiAyMSBTZXB0ZW1iZXIgMjAyMCAxMjo0MQ0KPiA+IFRv
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPA0K
PiA+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiA+IGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b207IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4NCj4gPiA7IER1cnJh
bnQsIFBhdWwNCj4gPiA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiA+IENjOiBYaWEsIEhvbmd5
YW4gPGhvbmd5eGlhQGFtYXpvbi5jb20+OyANCj4gPiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gPiBTdWJqZWN0OiBSRTogW0VYVEVSTkFMXSBNZW1vcnkgb3JkZXJpbmcgcXVlc3Rp
b24gaW4gdGhlIHNodXRkb3duDQo+ID4gZGVmZXJyYWwgY29kZQ0KPiA+IA0KPiA+IENBVVRJT046
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4g
RG8NCj4gPiBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiA+IGF0dGFjaG1lbnRzIHVubGVzcyB5
b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudA0KPiA+IGlzIHNh
ZmUuDQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gKCsgWGVuLWRldmVsKQ0KPiA+IA0KPiA+IFNvcnJ5
IEkgZm9yZ290IHRvIENDIHhlbi1kZXZlbC4NCj4gPiANCj4gPiBPbiAyMS8wOS8yMDIwIDEyOjM4
LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4gPiBIaSBhbGwsDQo+ID4gPiANCj4gPiA+IEkgaGF2
ZSBzdGFydGVkIHRvIGxvb2sgYXQgdGhlIGRlZmVycmFsIGNvZGUgKHNlZQ0KPiA+ID4gdmNwdV9z
dGFydF9zaHV0ZG93bl9kZWZlcnJhbCgpKSBiZWNhdXNlIHdlIG5lZWQgaXQgZm9yIExpdmVVcGRh
dGUNCj4gPiA+IGFuZA0KPiA+ID4gQXJtIHdpbGwgc29vbiB1c2UgaXQuDQo+ID4gPiANCj4gPiA+
IFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGlzIHVzaW5nIGFuIHNtcF9tYigpIHRvIGVuc3Vy
ZQ0KPiA+ID4gb3JkZXJpbmcNCj4gPiA+IGJldHdlZW4gYSB3cml0ZSB0aGVuIGEgcmVhZC4gVGhl
IGNvZGUgbG9va3Mgcm91Z2hseSAoSSBoYXZlDQo+ID4gPiBzbGlnaHRseQ0KPiA+ID4gYWRhcHRl
ZCBpdCB0byBtYWtlIG15IHF1ZXN0aW9uIG1vcmUgb2J2aW91cyk6DQo+ID4gPiANCj4gPiA+IGRv
bWFpbl9zaHV0ZG93bigpDQo+ID4gPiAgICAgIGQtPmlzX3NodXR0aW5nX2Rvd24gPSAxOw0KPiA+
ID4gICAgICBzbXBfbWIoKTsNCj4gPiA+ICAgICAgaWYgKCAhdmNwdTAtPmRlZmVyX3NodXRkb3du
ICkNCj4gPiA+ICAgICAgew0KPiA+ID4gICAgICAgIHZjcHVfcGF1c2Vfbm9zeW5jKHYpOw0KPiA+
ID4gICAgICAgIHYtPnBhdXNlZF9mb3Jfc2h1dGRvd24gPSAxOw0KPiA+ID4gICAgICB9DQo+ID4g
PiANCj4gPiA+IHZjcHVfc3RhcnRfc2h1dGRvd25fZGVmZXJyYWwoKQ0KPiA+ID4gICAgICB2Y3B1
MC0+ZGVmZXJfc2h1dGRvd24gPSAxOw0KPiA+ID4gICAgICBzbXBfbWIoKTsNCj4gPiA+ICAgICAg
aWYgKCB1bmxpa2VseShkLT5pc19zaHV0dGluZ19kb3duKSApDQo+ID4gPiAgICAgICAgdmNwdV9j
aGVja19zaHV0ZG93bih2KTsNCj4gPiA+IA0KPiA+ID4gICAgICByZXR1cm4gdmNwdTAtPmRlZmVy
X3NodXRkb3duOw0KPiA+ID4gDQo+ID4gPiBzbXBfbWIoKSBzaG91bGQgb25seSBndWFyYW50ZWUg
b3JkZXJpbmcgKHRoaXMgbWF5IGJlIHN0cm9uZ2VyIG9uDQo+ID4gPiBzb21lDQo+ID4gPiBhcmNo
KSwgc28gSSB0aGluayB0aGVyZSBpcyBhIHJhY2UgYmV0d2VlbiB0aGUgdHdvIGZ1bmN0aW9ucy4N
Cj4gPiA+IA0KPiA+ID4gSXQgd291bGQgYmUgcG9zc2libGUgdG8gcGF1c2UgdGhlIHZDUFUgaW4g
ZG9tYWluX3NodXRkb3duKCkNCj4gPiA+IGJlY2F1c2UNCj4gPiA+IHZjcHUwLT5kZWZlcl9zaHV0
ZG93biB3YXNuJ3QgeWV0IHNlZW4uDQo+ID4gPiANCj4gPiA+IEVxdWFsbHksIHZjcHVfc3RhcnRf
c2h1dGRvd25fZGVmZXJyYWwoKSBtYXkgbm90IHNlZSBkLQ0KPiA+ID4gPmlzX3NodXR0aW5nX2Rv
d24NCj4gPiA+IGFuZCB0aGVyZWZvcmUgWGVuIG1heSBjb250aW51ZSB0byBzZW5kIHRoZSBJL08u
IFlldCB0aGUgdkNQVSB3aWxsDQo+ID4gPiBiZQ0KPiA+ID4gcGF1c2VkIHNvIHRoZSBJL08gd2ls
bCBuZXZlciBjb21wbGV0ZS4NCj4gPiA+IA0KPiANCj4gVGhlIGJhcnJpZXIgZW5mb3JjZXMgZ2xv
YmFsIG9yZGVyLCByaWdodD8gU28sIGlmIGRvbWFpbl9zaHV0ZG93bigpDQo+IHBhdXNlcyB0aGUg
dmNwdSB0aGVuIGlzX3NodXR0aW5nX2Rvd24gbXVzdCBuZWNlc3NhcmlseSBiZSB2aXNpYmxlIGFs
bA0KPiBjcHVzLiBUaHVzIHZjcHVfc3RhcnRfc2h1dGRvd24gcmVmZXJyYWwgd2lsbCBleGVjdXRl
DQo+IHZjcHVfY2hlY2tfc2h1dGRvd24oKSwgc28gSSdtIGhhdmluZyBhIGhhcmQgdGltZSBzZWVp
bmcgdGhlIHJhY2UuDQoNCkkgdGhpbmsgdGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgc21wX21iKCkg
Y2FuIGVuZm9yY2UgaW1tZWRpYXRlDQp2aXNpYmlsaXR5LiBJdCBhdCBsZWFzdCBlbmZvcmNlcyBv
cmRlcmluZywgc28gd2hlbiBvdGhlciBDUFVzDQpldmVudHVhbGx5IHNlZSB0aGUgbWVtb3J5IGFj
Y2Vzc2VzIHRoZXkgd2lsbCBiZSBpbiB0aGUgcmlnaHQgb3JkZXIuIE9uDQp0aGUgeDg2IHNpZGUg
SSB0aGluayBhbiBtZmVuY2UgZW5mb3JjZXMgdGhhdCB3aGVuIHRoZSBsYXRlciBsb2FkIGlzDQpl
eGVjdXRlZCwgdGhlIHByZXZpb3VzIHN0b3JlIGlzIGdsb2JhbGx5IHZpc2libGUuIEJ1dCwgaWYg
aXQgaXMgb25seQ0KYWJvdXQgdGhlIG9yZGVyaW5nIHNlZW4gYnkgb3RoZXIgY29yZXMsIGl0IGNv
dWxkIGJlIHBvc3NpYmxlIHRoYXQgdGhlDQp3cml0ZSBpcyBzZWVuIG11Y2ggbGF0ZXIuDQoNCkhv
bmd5YW4NCg==

