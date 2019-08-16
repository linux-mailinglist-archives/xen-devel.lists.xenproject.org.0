Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69748906D5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 19:27:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyfyH-0006N4-VK; Fri, 16 Aug 2019 17:25:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=whDy=WM=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hyfyG-0006My-Q3
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 17:25:00 +0000
X-Inumbo-ID: c582edce-c04a-11e9-8bb8-12813bfff9fa
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c582edce-c04a-11e9-8bb8-12813bfff9fa;
 Fri, 16 Aug 2019 17:24:59 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 F320330747C4; Fri, 16 Aug 2019 20:24:57 +0300 (EEST)
Received: from [192.168.228.119] (unknown [86.121.168.220])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 32811303EF03;
 Fri, 16 Aug 2019 20:24:57 +0300 (EEST)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-9-paul.durrant@citrix.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <bcdcd7ee-25b1-8151-45e4-30cea31d1883@bitdefender.com>
Date: Fri, 16 Aug 2019 20:24:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816172001.3905-9-paul.durrant@citrix.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v6 08/10] remove late (on-demand)
 construction of IOMMU page tables
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNi8xOSA4OjE5IFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gTm93IHRoYXQgdGhlcmUg
aXMgYSBwZXItZG9tYWluIElPTU1VIGVuYWJsZSBmbGFnLCB3aGljaCBzaG91bGQgYmUgZW5hYmxl
ZCBpZgo+IGFueSBkZXZpY2UgaXMgZ29pbmcgdG8gYmUgcGFzc2VkIHRocm91Z2gsIHN0b3AgZGVm
ZXJyaW5nIHBhZ2UgdGFibGUKPiBjb25zdHJ1Y3Rpb24gdW50aWwgdGhlIGFzc2lnbm1lbnQgaXMg
ZG9uZS4gQWxzbyBkb24ndCB0ZWFyIGRvd24gdGhlIHRhYmxlcwo+IGFnYWluIHdoZW4gdGhlIGxh
c3QgZGV2aWNlIGlzIGRlLWFzc2lnbmVkOyBkZWZlciB0aGF0IHRhc2sgdW50aWwgZG9tYWluCj4g
ZGVzdHJ1Y3Rpb24uCj4gCj4gVGhpcyBhbGxvd3MgdGhlIGhhc19pb21tdV9wdCgpIGhlbHBlciBh
bmQgaW9tbXVfc3RhdHVzIGVudW1lcmF0aW9uIHRvIGJlCj4gcmVtb3ZlZC4gQ2FsbHMgdG8gaGFz
X2lvbW11X3B0KCkgYXJlIHNpbXBseSByZXBsYWNlZCBieSBjYWxscyB0bwo+IGlzX2lvbW11X2Vu
YWJsZWQoKS4gUmVtYWluaW5nIG9wZW4tY29kZSB0ZXN0cyBvZiBpb21tdV9oYXBfcHRfc2hhcmUg
Y2FuIGFsc28KPiBiZSByZXBsYWNlZCBieSBjYWxscyB0byBpb21tdV91c2VfaGFwX3B0KCkuCj4g
VGhlIGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90YWJsZSgpIGFuZCBpb21tdV9jb25zdHJ1Y3Qo
KSBmdW5jdGlvbnMgYmVjb21lCj4gcmVkdW5kYW50LCBhcyBkb2VzIHRoZSAnc3RyaWN0IG1vZGUn
IGRvbTAgcGFnZV9saXN0IG1hcHBpbmcgY29kZSBpbgo+IGlvbW11X2h3ZG9tX2luaXQoKSwgYW5k
IGlvbW11X3RlYXJkb3duKCkgY2FuIGJlIG1hZGUgc3RhdGljIGlzIGl0cyBvbmx5Cj4gcmVtYWlu
aW5nIGNhbGxlciwgaW9tbXVfZG9tYWluX2Rlc3Ryb3koKSwgaXMgd2l0aGluIHRoZSBzYW1lIHNv
dXJjZQo+IG1vZHVsZS4KPiAKPiBBbGwgaW4gYWxsLCBhYm91dCAyMjAgbGluZXMgb2YgY29kZSBh
cmUgcmVtb3ZlZC4KPiAKPiBOT1RFOiBUaGlzIHBhdGNoIHdpbGwgY2F1c2UgYSBzbWFsbCBhbW91
bnQgb2YgZXh0cmEgcmVzb3VyY2UgdG8gYmUgdXNlZAo+ICAgICAgIHRvIGFjY29tbW9kYXRlIElP
TU1VIHBhZ2UgdGFibGVzIHRoYXQgbWF5IG5ldmVyIGJlIHVzZWQsIHNpbmNlIHRoZQo+ICAgICAg
IHBlci1kb21haW4gSU9NTVUgZmxhZyBlbmFibGUgZmxhZyBpcyBjdXJyZW50bHkgc2V0IHRvIHRo
ZSB2YWx1ZQo+ICAgICAgIG9mIHRoZSBnbG9iYWwgaW9tbXVfZW5hYmxlIGZsYWcuIEEgc3Vic2Vx
dWVudCBwYXRjaCB3aWxsIGFkZCBhbgo+ICAgICAgIG9wdGlvbiB0byB0aGUgdG9vbHN0YWNrIHRv
IGFsbG93IGl0IHRvIGJlIHR1cm5lZCBvZmYgaWYgdGhlcmUgaXMKPiAgICAgICBubyBpbnRlbnRp
b24gdG8gYXNzaWduIHBhc3N0aHJvdWdoIGhhcmR3YXJlIHRvIHRoZSBkb21haW4uCgpUaGlzIGhh
cyBzbGlwcGVkIHVuZGVyIG15IHJhZGFyLCBzb3JyeS4KCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2Nh
cnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
