Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E62BAE4A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 09:06:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCINr-000772-9h; Mon, 23 Sep 2019 07:03:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dHOc=XS=amazon.de=prvs=1622f4ed1=wipawel@srs-us1.protection.inumbo.net>)
 id 1iCINo-00076x-WE
 for xen-devel@lists.xen.org; Mon, 23 Sep 2019 07:03:41 +0000
X-Inumbo-ID: 4491d72c-ddd0-11e9-b299-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4491d72c-ddd0-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1569222219; x=1600758219;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=6ERIKJ5JYBr13rgacIM1N/TGEi9YYANQ38bnI3sjeEk=;
 b=IbhvxRX6TUlMqmAulCU9iG9GcuoyBvzkazoHNh3i8vYFghPb6UFjPbrm
 +LFSfEDnqZXhZBHm8hR/vXoB0za/LNKKZcdqY6BGB/wM8vGSxXRPwJhQv
 l6FnY2Mbhpe+LR0ytzgDej5xrpuqtaT+Huaf/+FTM0sA/08itY0CUYfuT 4=;
X-IronPort-AV: E=Sophos;i="5.64,539,1559520000"; d="scan'208";a="835751693"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 23 Sep 2019 07:03:09 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 47ABAC5A68; Mon, 23 Sep 2019 07:03:06 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Sep 2019 07:03:05 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Sep 2019 07:03:03 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 23 Sep 2019 07:03:04 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [PATCH v3 08/12] livepatch: Add support for inline asm
 hotpatching expectations
Thread-Index: AQHVbH5qYhp7IRrJDkWXa4MBczdeTaczL2MAgAWxgoA=
Date: Mon, 23 Sep 2019 07:03:04 +0000
Message-ID: <7FE7D7C8-CB4A-4108-8026-B17EA498F344@amazon.com>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-9-wipawel@amazon.de>
 <3f3a6877-5153-68f2-549a-5643c4cc73c3@citrix.com>
In-Reply-To: <3f3a6877-5153-68f2-549a-5643c4cc73c3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.196]
Content-ID: <CB1793803B497F4881D0D0C182A06BE3@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 08/12] livepatch: Add support for inline
 asm hotpatching expectations
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE5LiBTZXAgMjAxOSwgYXQgMTg6MDYsIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vy
d2FsbEBjaXRyaXguY29tPiB3cm90ZToKPiAKPiBPbiA5LzE2LzE5IDExOjU5IEFNLCBQYXdlbCBX
aWVjem9ya2lld2ljeiB3cm90ZToKPj4gVGhpcyBpcyB0aGUgaW5pdGlhbCBpbXBsZW1lbnRhdGlv
biBvZiB0aGUgZXhwZWN0YXRpb25zIGVuaGFuY2VtZW50Cj4+IHRvIGltcHJvdmUgaW5saW5lIGFz
bSBob3RwYXRjaGluZy4KPj4gRXhwZWN0YXRpb25zIGFyZSBkZXNpZ25lZCBhcyBvcHRpb25hbCBm
ZWF0dXJlLCBzaW5jZSB0aGUgbWFpbiB1c2Ugb2YKPj4gdGhlbSBpcyBwbGFubmVkIGZvciBpbmxp
bmUgYXNtIGhvdHBhdGNoaW5nLiBUaGUgZmxhZyBlbmFibGVkIGFsbG93cwo+PiB0byBjb250cm9s
IHRoZSBleHBlY3RhdGlvbiBzdGF0ZS4KPj4gRWFjaCBleHBlY3RhdGlvbiBoYXMgZGF0YSBhbmQg
bGVuIGZpZWxkcyB0aGF0IGRlc2NyaWJlIHRoZSBkYXRhCj4+IHRoYXQgaXMgZXhwZWN0ZWQgdG8g
YmUgZm91bmQgYXQgYSBnaXZlbiBwYXRjaGluZyAob2xkX2FkZHIpIGxvY2F0aW9uLgo+PiBUaGUg
bGVuIG11c3Qgbm90IGV4Y2VlZCB0aGUgZGF0YSBhcnJheSBzaXplLiBUaGUgZGF0YSBhcnJheSBz
aXplCj4+IGZvbGxvd3MgdGhlIHNpemUgb2YgdGhlIG9wYXF1ZSBhcnJheSwgc2luY2UgdGhlIG9w
YXF1ZSBhcnJheSBob2xkcwo+PiB0aGUgb3JpZ2luYWwgZGF0YSBhbmQgdGhlcmVmb3JlIG11c3Qg
bWF0Y2ggd2hhdCBpcyBzcGVjaWZpZWQgaW4gdGhlCj4+IGV4cGVjdGF0aW9uIChpZiBlbmFibGVk
KS4KPj4gVGhlIHBheWxvYWQgc3RydWN0dXJlIGlzIG1vZGlmaWVkIGFzIGVhY2ggZXhwZWN0YXRp
b24gc3RydWN0dXJlIGlzCj4+IHBhcnQgb2YgdGhlIGxpdmVwYXRjaF9mdW5jIHN0cnVjdHVyZSBh
bmQgaGVuY2UgZXh0ZW5kcyB0aGUgcGF5bG9hZC4KPj4gRWFjaCBleHBlY3RhdGlvbiBpcyBjaGVj
a2VkIHByaW9yIHRvIHRoZSBhcHBseSBhY3Rpb24gKGkuZS4gYXMgbGF0ZQo+PiBhcyBwb3NzaWJs
ZSB0byBjaGVjayBhZ2FpbnN0IHRoZSBtb3N0IGN1cnJlbnQgc3RhdGUgb2YgdGhlIGNvZGUpLgo+
PiBGb3IgdGhlIHJlcGxhY2UgYWN0aW9uIGEgbmV3IHBheWxvYWQncyBleHBlY3RhdGlvbnMgYXJl
IGNoZWNrZWQgQUZURVIKPj4gYWxsIGFwcGxpZWQgcGF5bG9hZHMgYXJlIHN1Y2Nlc3NmdWxseSBy
ZXZlcnRlZCwgYnV0IEJFRk9SRSBuZXcgcGF5bG9hZAo+PiBpcyBhcHBsaWVkLiBUaGF0IGJyZWFr
cyB0aGUgcmVwbGFjZSBhY3Rpb24ncyBhdG9taWNpdHkgYW5kIGluIGNhc2Ugb2YKPj4gYW4gZXhw
ZWN0YXRpb24gY2hlY2sgZmFpbHVyZSB3b3VsZCBsZWF2ZSBhIHN5c3RlbSB3aXRoIGFsbCBwYXls
b2Fkcwo+PiByZXZlcnRlZC4gVGhhdCBpcyBvYnZpb3VzbHkgaW5zZWN1cmUuIFVzZSBpdCB3aXRo
IGNhdXRpb24gYW5kIGFjdAo+PiB1cG9uIHJlcGxhY2UgZXJyb3JzIQo+IHNuaXAKPj4gICAqIExv
b2t1cCBzcGVjaWZpZWQgc2VjdGlvbiBhbmQgd2hlbiBleGlzdHMgYXNzaWduIGl0cyBhZGRyZXNz
IHRvIGEgc3BlY2lmaWVkIGhvb2suCj4+ICAgKiBQZXJmb3JtIHNlY3Rpb24gcG9pbnRlciBhbmQg
c2l6ZSB2YWxpZGF0aW9uOiBzaW5nbGUgaG9vayBzZWN0aW9ucyBtdXN0IGNvbnRhaW4gYQo+PiBA
QCAtMTM0NSw2ICsxNDAwLDIwIEBAIHN0YXRpYyB2b2lkIGxpdmVwYXRjaF9kb19hY3Rpb24odm9p
ZCkKPj4gICAgICAgICAgICBpZiAoIHJjID09IDAgKQo+PiAgICAgICAgICB7Cj4+ICsgICAgICAg
ICAgICAvKgo+PiArICAgICAgICAgICAgICogTWFrZSBzdXJlIGFsbCBleHBlY3RhdGlvbiByZXF1
aXJlbWVudHMgYXJlIG1ldC4KPj4gKyAgICAgICAgICAgICAqIEJld2FyZSBhbGwgdGhlIHBheWxv
YWRzIGFyZSByZXZlcnRlZCBhdCB0aGlzIHBvaW50Lgo+PiArICAgICAgICAgICAgICogSWYgZXhw
ZWN0YXRpb25zIGFyZSBub3QgbWV0IHRoZSBzeXN0ZW0gaXMgbGVmdCBpbiBhCj4+ICsgICAgICAg
ICAgICAgKiBjb21wbGV0ZWx5IFVOUEFUQ0hFRCBzdGF0ZSEKPj4gKyAgICAgICAgICAgICAqLwo+
PiArICAgICAgICAgICAgcmMgPSBsaXZlcGF0Y2hfY2hlY2tfZXhwZWN0YXRpb25zKGRhdGEpOwo+
PiArICAgICAgICAgICAgaWYgKCByYyApCj4+ICsgICAgICAgICAgICB7Cj4+ICsgICAgICAgICAg
ICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogU1lTVEVNIE1JR0hUIEJFIElO
U0VDVVJFOiAiCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICJSZXBsYWNlIGFjdGlvbiBoYXMg
YmVlbiBhYm9ydGVkIGFmdGVyIHJldmVydGluZyBBTEwgcGF5bG9hZHMhXG4iLCBkYXRhLT5uYW1l
KTsKPj4gKyAgICAgICAgICAgICAgICBicmVhazsKPj4gKyAgICAgICAgICAgIH0KPj4gKwo+PiAg
ICAgICAgICAgICAgaWYgKCBpc19ob29rX2VuYWJsZWQoZGF0YS0+aG9va3MuYXBwbHkuYWN0aW9u
KSApCj4+ICAgICAgICAgICAgICB7Cj4+ICAgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19J
TkZPIExJVkVQQVRDSCAiJXM6IENhbGxpbmcgYXBwbHkgYWN0aW9uIGhvb2sgZnVuY3Rpb25cbiIs
IGRhdGEtPm5hbWUpOwo+PiBAQCAtMTc5OCw2ICsxODY3LDExIEBAIHN0YXRpYyBpbnQgbGl2ZXBh
dGNoX2FjdGlvbihzdHJ1Y3QgeGVuX3N5c2N0bF9saXZlcGF0Y2hfYWN0aW9uICphY3Rpb24pCj4+
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAgICAgICAgICAgICAgfQo+PiAgKyAgICAg
ICAgICAgIC8qIE1ha2Ugc3VyZSBhbGwgZXhwZWN0YXRpb24gcmVxdWlyZW1lbnRzIGFyZSBtZXQu
ICovCj4+ICsgICAgICAgICAgICByYyA9IGxpdmVwYXRjaF9jaGVja19leHBlY3RhdGlvbnMoZGF0
YSk7Cj4+ICsgICAgICAgICAgICBpZiAoIHJjICkKPj4gKyAgICAgICAgICAgICAgICBicmVhazsK
Pj4gKwo+PiAgICAgICAgICAgICAgaWYgKCBpc19ob29rX2VuYWJsZWQoZGF0YS0+aG9va3MuYXBw
bHkucHJlKSApCj4+ICAgICAgICAgICAgICB7Cj4+ICAgICAgICAgICAgICAgICAgcHJpbnRrKFhF
TkxPR19JTkZPIExJVkVQQVRDSCAiJXM6IENhbGxpbmcgcHJlLWFwcGx5IGhvb2sgZnVuY3Rpb25c
biIsIGRhdGEtPm5hbWUpOwo+IAo+IEkgd29uZGVyIGlmIHRoaXMgc2hvdWxkIGJlIGRvbmUgaW4g
dGhlIGNyaXRpY2FsIHJlZ2lvbiBmb3IgY29uc2lzdGVuY3kgd2l0aCB0aGUgcmVwbGFjZSBjb2Rl
IGFuZCB0byBtaW5pbWl6ZSB0aGUgY2hhbmNlIG9mIHNvbWV0aGluZyBnb2luZyB3cm9uZyBiZXR3
ZWVuIGNhbGxpbmcgdGhlIHN5c2N0bCBhbmQgdGhlIHBhdGNoaW5nIGFjdHVhbGx5IGhhcHBlbmlu
Zy4gVGhvdWdodHM/Cj4gCgpJIHdvdWxkIG5vdCBkbyBpdC4gQXQgbGVhc3Qgbm90IGF0IHRoZSBt
b21lbnQuClRoZSBpbnRlbnRpb24gYmVoaW5kIHRoZSBleHBlY3RhdGlvbiBmZWF0dXJlIGlzIHRv
IHByZXZlbnQgYW4gYXR0ZW1wdCB0byBsb2FkIGEgbGl2ZXBhdGNoIG1vZHVsZSB3aXRoIHNvbWUg
aW5saW5lIGFzbSBwYXRjaGluZyBvbiBhIG1hY2hpbmUsCndob3NlIG1lbW9yeSBjb250ZW50IG9m
IHBhcnRpY3VsYXIgLnRleHQqIHNlY3Rpb24gZG9lcyBub3QgbWF0Y2guCgpJIHdhbnRlZCB0byBk
byBpdCBhcyBlYXJseSBhcyBwb3NzaWJsZSwgYmVmb3JlIGFueSBtdXRhdGluZyBhY3Rpb24gb2Yg
YSBwcmUgYXBwbHkgaG9vayAoYW4gZm9yIGlubGluZSBhc20gcGF0Y2hpbmcgcHJlYXBwbHkgaG9v
ayBjYW4gYmUgKGFiKXVzZWQgb2Z0ZW4pIGtpY2tzIGluLgpBbHNvLCBpdCB3b3VsZCBiZSBnb29k
IHRvIGhhdmUgdGhlIGV4cGVjdGF0aW9uIGNoZWNrIGFsd2F5cyB0aGVyZSwgZXZlbiB3aXRoIHJl
cGxhY2VkIGRlZmF1bHQgYXBwbHkvcmV2ZXJ0IGFjdGlvbiBob29rcy4KCkV4Y2VwdCBmcm9tIHRo
ZSByZXBsYWNlIGFjdGlvbiBzaXR1YXRpb24sIHRoZSBtZW1vcnkgY29udGVudCBvZiB0aGUgYWZm
ZWN0ZWQgLnRleHQqIHNlY3Rpb24gaXMgdW5saWtlbHkgdG8gY2hhbmdlLCBzbyBpdCBzaG91bGQg
YmUgZ29vZCBlbm91Z2ggZm9yIHRoZSBnZW5lcmFsIGNhc2UuCldoZW4gaXQgY29tZXMgdG8gdGhl
IHJlcGxhY2UgYWN0aW9uLCB3ZSBzaG91bGQgZGlzY3VzcyBpdCBmdXJ0aGVyIEkgdGhpbmssIGFu
ZCBtYXliZSBkZXZpc2UgYSBzb2x1dGlvbiBvbiB0b3Agb2YgdGhlIGN1cnJlbnQgb25lLgoKPiBU
aGUgcGF0Y2ggbG9va3MgZmluZSBvdGhlcndpc2UuCj4gCgpUaGFua3MhCgo+IFJvc3MKCkJlc3Qg
UmVnYXJkcywKUGF3ZWwgV2llY3pvcmtpZXdpY3oKCgoKCgoKQW1hem9uIERldmVsb3BtZW50IENl
bnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNm
dWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBh
bSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVy
bGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
