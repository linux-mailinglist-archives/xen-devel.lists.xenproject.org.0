Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A411111847A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:10:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecQT-0005ne-Tw; Tue, 10 Dec 2019 10:07:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CauO=2A=amazon.com=prvs=2404a8118=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iecQR-0005mw-PA
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:07:27 +0000
X-Inumbo-ID: dde8c22d-1b34-11ea-8913-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dde8c22d-1b34-11ea-8913-12813bfff9fa;
 Tue, 10 Dec 2019 10:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575972447; x=1607508447;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=boVY/XkbyyXkJdVGVryxAppfHWTovvsn2r5HH3soN50=;
 b=lJ57I4r8lYXwA3yIjZobk2WkdSzKgXTReghahjhyVwQq49JJtxGlxrPe
 DUTGuUyMd/1KKNUhbT2+FMMuQTtfRQSwmi8rvLyiod0uF+IrJipOSST0k
 5M7CQYpoIkpalBVIve98/iO5BBpjRCCUkW3ho2PGl/vL10GTG4NeOXo6v g=;
IronPort-SDR: tC4zQ8LtmNrQ4/46Ftd/mh1hvImHh1sJtXnm53G311zPqZXGZzKm4eOxIvrqUQ3huzwtT+n2F3
 fqbv+pdAde0w==
X-IronPort-AV: E=Sophos;i="5.69,299,1571702400"; 
   d="scan'208";a="7817122"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 10 Dec 2019 10:07:26 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3935CA1E69; Tue, 10 Dec 2019 10:07:24 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 10:07:23 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 10:07:23 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Tue, 10 Dec 2019 10:07:23 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 1/2] x86/mm: factor out the code for shattering an l3 PTE
Thread-Index: AQHVrF21b0nGZoxzuEyyzE+1Myq9k6eu/UmAgALRZQCAAVvQAA==
Date: Tue, 10 Dec 2019 10:07:22 +0000
Message-ID: <b798bb26915d8beba9f45566667ff7f666b4261b.camel@amazon.com>
References: <cover.1575646580.git.hongyxia@amazon.com>
 <86a6fb68f76ab287f5c2d99d1e7954e8b2d1ab05.1575646580.git.hongyxia@amazon.com>
 <43b7603e-bd14-d6eb-8d79-9afcd8627efd@citrix.com>
 <fa150bf7d436472befaaea2a076f3b8b917d07b7.camel@amazon.com>
 <aaa3dcb9-8022-c169-ec9e-bb5d3cbdde01@suse.com>
In-Reply-To: <aaa3dcb9-8022-c169-ec9e-bb5d3cbdde01@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.13]
Content-ID: <A2FC496B13A0D442B8DDC419AA2798C8@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Grall, 
 Julien" <jgrall@amazon.com>, "wl@xen.org" <wl@xen.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDE5LTEyLTA5IGF0IDE0OjIyICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMDcuMTIuMjAxOSAxOToyMCwgWGlhLCBIb25neWFuIHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAx
OS0xMi0wNiBhdCAxNzo1MCArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gPiA+IE9uIDA2
LzEyLzIwMTkgMTU6NTMsIEhvbmd5YW4gWGlhIHdyb3RlOg0KPiA+ID4gPiArLyogU2hhdHRlciBh
biBsMyBlbnRyeSBhbmQgcG9wdWxhdGUgbDIuIElmIHZpcnQgaXMgcGFzc2VkIGluLA0KPiA+ID4g
PiBhbHNvDQo+ID4gPiA+IGRvIGZsdXNoLiAqLw0KPiA+ID4gPiArc3RhdGljIHZvaWQgc2hhdHRl
cl9sM2UobDNfcGdlbnRyeV90ICpwbDNlLCBsMl9wZ2VudHJ5X3QgKmwydCwNCj4gPiA+ID4gKyAg
ICAgICAgdW5zaWduZWQgbG9uZyB2aXJ0LCBib29sIGxvY2tpbmcpDQo+ID4gPiA+ICt7DQo+ID4g
PiA+ICsgICAgdW5zaWduZWQgaW50IGk7DQo+ID4gPiA+ICsgICAgbDNfcGdlbnRyeV90IG9sM2Ug
PSAqcGwzZTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgIGZvciAoIGkgPSAwOyBpIDwgTDJfUEFH
RVRBQkxFX0VOVFJJRVM7IGkrKyApDQo+ID4gPiA+ICsgICAgICAgIGwyZV93cml0ZShsMnQgKyBp
LA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgbDJlX2Zyb21fcGZuKGwzZV9nZXRfcGZuKG9s
M2UpICsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoaSA8PCBQQUdF
VEFCTEVfT1JERVIpLA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGwz
ZV9nZXRfZmxhZ3Mob2wzZSkpKTsNCj4gPiA+IA0KPiA+ID4gVGhlIFBURSBtYWNyb3MgYXJlIGVz
cGVjaWFsbHkgcG9vciBmb3IgZ2VuZXJhdGVkIGFzbSwgYW5kIGluDQo+ID4gPiBjYXNlcw0KPiA+
ID4gbGlrZQ0KPiA+ID4gdGhpcywgSSdkIGxpa2UgdG8gaW1wcm92ZSB0aGluZ3MuDQo+ID4gPiAN
Cj4gPiA+IEluIHBhcnRpY3VsYXIsIEkgYmVsaWV2ZSB0aGUgZm9sbG93aW5nIGNvZGUgaGFzIGlk
ZW50aWNhbA0KPiA+ID4gYmVoYXZpb3VyOg0KPiA+ID4gDQo+ID4gPiBsMl9wZ2VudHJ5X3Qgbmwy
ZSA9IGwyZV9mcm9tX2ludHB0ZShsM2VfZ2V0X2ludHB0ZShvbDNlKSk7DQo+ID4gPiANCj4gPiA+
IGZvciAoIGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKywgbmwyZS5sMiArPQ0K
PiA+ID4gUEFHRVRBQkxFX09SREVSICkNCj4gPiA+ICAgICBsMmVfd3JpdGUobDJ0ICsgaSwgbmwy
ZSk7DQo+ID4gPiANCj4gPiA+IChhbHRob3VnaCBzb21lb25lIHBsZWFzZSBkb3VibGUgY2hlY2sg
bXkgbG9naWMpIGFuZCByYXRoZXIgYmV0dGVyDQo+ID4gPiBhc20NCj4gPiA+IGdlbmVyYXRpb24u
ICAoSSBhbHNvIGV4cGVjdCB0aGVyZSB0byBiZSBzb21lIGRpc2N1c3Npb24gb24NCj4gPiA+IHdo
ZXRoZXINCj4gPiA+IHVzaW5nDQo+ID4gPiBuMmxlLmwyIGRpcmVjdGx5IGlzIHNvbWV0aGluZyB3
ZSdkIHdhbnQgdG8gc3RhcnQgZG9pbmcuKQ0KPiA+ID4gDQo+ID4gDQo+ID4gSSBiZWxpZXZlIGl0
IHNob3VsZCBiZSBubDJlLmwyICs9IDE8PChQQUdFVEFCTEVfT1JERVIrUEFHRV9TSElGVCkgPw0K
PiANCj4gSW5kZWVkLg0KPiANCj4gPiBBbHRob3VnaCB0aGUgY29kZSByYXJlbHkgdG91Y2hlcyB0
aGUgZmllbGQgKC5sMikgZGlyZWN0bHksIHNvIG1heWJlDQo+ID4gdXNlDQo+ID4gdGhlIG1hY3Jv
cyAoZ2V0X2ludHB0ZSAtPiBhZGQgLT4gZnJvbV9pbnRwdGUpIGZvciBjb25zaXN0ZW5jeT8gVGhl
eQ0KPiA+IHNob3VsZCBwcm9kdWNlIHRoZSBzYW1lIGNvZGUgaWYgdGhlIGNvbXBpbGVyIGlzIG5v
dCB0b28gc3R1cGlkLg0KPiANCj4gSSB0aGluayB0aGUgdG8vZnJvbSBpbnRwdGUgdHJhbnNmb3Jt
YXRpb25zIHNob3VsZCBiZSB1c2VkIHNwYXJpbmdseQ0KPiB0b28gKGFzIGJlaW5nIGRhbmdlcm91
cykuIEhvdyBhYm91dCB3ZSBtYWtlIFBURXMgcHJvcGVyIHVuaW9ucywgd2l0aA0KPiBhIGZ1bGwt
ZmllbGQgaW50cHRlX3QgYXMgd2UgaGF2ZSBpdCBub3cgY29tYmluZWQgd2l0aCBhIHNldCBvZiBi
aXQNCj4gZmllbGRzPyBUaGlzIHdvdWxkIGF0IGxlYXN0IGVsaW1pbmF0ZSB0aGUgbmVlZCBmb3Ig
dXNpbmcgUEFHRV9TSElGVA0KPiBpbiBjb25zdHJ1Y3RzIGxpa2UgdGhlIGFib3ZlLg0KDQpJIGNh
biBzZWUgdGhpcyBtYWtlcyB0aGUgY29kZSBsb29rIG11Y2ggbmljZXIuIE9uZSBjb25jZXJuIEkg
aGF2ZSBpcw0KdGhhdCBBbmRyZXcncyBzdWdnZXN0aW9uIHdhcyB0byBpbXByb3ZlIHRoZSBnZW5l
cmF0ZWQgYXNzZW1ibHkgY29kZSwNCmFuZCB1c2luZyBwYWNrZWQgYml0IGZpZWxkcyBtYXkgZ2Vu
ZXJhdGUgZXZlbiBtb3JlIG1hc2tpbmcgYW5kIGJpdA0Kc2hpZnRpbmcsIHdoaWNoIGluIHRoZSBl
bmQgbWlnaHQgZ2l2ZSB1cyBtb3JlIGFzc2VtYmx5IGNvZGUgdGhhbiBiZWZvcmUNCnRoZSByZWZh
Y3RvcmluZy4NCg0KSG9uZ3lhbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
