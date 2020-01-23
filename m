Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315D3146744
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 12:54:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iub1c-00045h-LY; Thu, 23 Jan 2020 11:51:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iub1b-00045Z-Ii
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 11:51:51 +0000
X-Inumbo-ID: b91793b4-3dd6-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b91793b4-3dd6-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 11:51:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5582BAB95;
 Thu, 23 Jan 2020 11:51:42 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <96522871-eea2-a9ce-c89d-aebefe6225d1@suse.com>
Message-ID: <b13bc4b7-7b37-1e32-5700-a47f3807b690@suse.com>
Date: Thu, 23 Jan 2020 12:51:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <96522871-eea2-a9ce-c89d-aebefe6225d1@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/2] x86/p2m: adjust non-PoD accounting in
 p2m_pod_decrease_reservation()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhyb3VnaG91dCB0aGUgZnVuY3Rpb24gdGhlIGVxdWF0aW9uCgoJcG9kICsgbm9ucG9kID09ICgx
VUwgPDwgb3JkZXIpCgpzaG91bGQgaG9sZC4gVGhpcyBoYXMgYmVlbiB2aW9sYXRlZCBieSB0aGUg
ZmluYWwgbG9vcCBvZiB0aGUgZnVuY3Rpb246CiogY2hhbmdpbmcgYSByYW5nZSBmcm9tIGEgdHlw
ZSBvdGhlciB0aGFuIHAybV9wb3B1bGF0ZV9vbl9kZW1hbmQgdG8KICBwMm1faW52YWxpZCBkb2Vz
bid0IGFsdGVyIHRoZSBhbW91bnQgb2Ygbm9uLVBvRCBwYWdlcyBpbiB0aGUgcmVnaW9uLAoqIGNo
YW5naW5nIGEgcmFuZ2UgZnJvbSBwMm1fcG9wdWxhdGVfb25fZGVtYW5kIHRvIHAybV9pbnZhbGlk
IGRvZXMKICBpbmNyZWFzZSB0aGUgYW1vdW50IG9mIG5vbi1Qb0QgcGFnZXMgaW4gdGhlIHJlZ2lv
biBhbG9uZyB3aXRoCiAgZGVjcmVhc2luZyB0aGUgYW1vdW50IG9mIFBvRCBwYWdlcyB0aGVyZS4K
Rm9ydHVuYXRlbHkgdGhlIHZhcmlhYmxlIGlzbid0IHVzZWQgYW55bW9yZSBhZnRlciB0aGUgbG9v
cC4gSW5zdGVhZCBvZgpjb3JyZWN0aW5nIHRoZSB1cGRhdGluZyBvZiB0aGUgIm5vbnBvZCIgdmFy
aWFibGUsIGhvd2V2ZXIsIGRyb3AgaXQKYWx0b2dldGhlciwgdG8gYXZvaWQgZ2V0dGluZyB0aGUg
YWJvdmUgZXF1YXRpb24gdG8gbm90IGhvbGQgYWdhaW4gYnkgYQpmdXR1cmUgY2hhbmdlLgoKU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2Fy
Y2gveDg2L21tL3AybS1wb2QuYworKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLXBvZC5jCkBAIC01
MDksNyArNTA5LDcgQEAgcDJtX3BvZF9kZWNyZWFzZV9yZXNlcnZhdGlvbihzdHJ1Y3QgZG9tYQog
ICAgIHVuc2lnbmVkIGxvbmcgcmV0ID0gMCwgaSwgbjsKICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAq
cDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwogICAgIGJvb2xfdCBzdGVhbF9mb3JfY2FjaGU7Ci0g
ICAgbG9uZyBwb2QsIG5vbnBvZCwgcmFtOworICAgIGxvbmcgcG9kID0gMCwgcmFtID0gMDsKIAog
ICAgIGdmbl9sb2NrKHAybSwgZ2ZuLCBvcmRlcik7CiAgICAgcG9kX2xvY2socDJtKTsKQEAgLTUy
NCw4ICs1MjQsNiBAQCBwMm1fcG9kX2RlY3JlYXNlX3Jlc2VydmF0aW9uKHN0cnVjdCBkb21hCiAg
ICAgaWYgKCB1bmxpa2VseShkLT5pc19keWluZykgKQogICAgICAgICBnb3RvIG91dF91bmxvY2s7
CiAKLSAgICBwb2QgPSBub25wb2QgPSByYW0gPSAwOwotCiAgICAgLyogRmlndXJlIG91dCBpZiB3
ZSBuZWVkIHRvIHN0ZWFsIHNvbWUgZnJlZWQgbWVtb3J5IGZvciBvdXIgY2FjaGUgKi8KICAgICBz
dGVhbF9mb3JfY2FjaGUgPSAgKCBwMm0tPnBvZC5lbnRyeV9jb3VudCA+IHAybS0+cG9kLmNvdW50
ICk7CiAKQEAgLTUzOSwxOSArNTM3LDE1IEBAIHAybV9wb2RfZGVjcmVhc2VfcmVzZXJ2YXRpb24o
c3RydWN0IGRvbWEKICAgICAgICAgbiA9IDFVTCA8PCBtaW4ob3JkZXIsIGN1cl9vcmRlcik7CiAg
ICAgICAgIGlmICggdCA9PSBwMm1fcG9wdWxhdGVfb25fZGVtYW5kICkKICAgICAgICAgICAgIHBv
ZCArPSBuOwotICAgICAgICBlbHNlCi0gICAgICAgIHsKLSAgICAgICAgICAgIG5vbnBvZCArPSBu
OwotICAgICAgICAgICAgaWYgKCBwMm1faXNfcmFtKHQpICkKLSAgICAgICAgICAgICAgICByYW0g
Kz0gbjsKLSAgICAgICAgfQorICAgICAgICBlbHNlIGlmICggcDJtX2lzX3JhbSh0KSApCisgICAg
ICAgICAgICByYW0gKz0gbjsKICAgICB9CiAKICAgICAvKiBObyBwb3B1bGF0ZS1vbi1kZW1hbmQ/
ICBEb24ndCBuZWVkIHRvIHN0ZWFsIGFueXRoaW5nPyAgVGhlbiB3ZSdyZSBkb25lISovCiAgICAg
aWYgKCAhcG9kICYmICFzdGVhbF9mb3JfY2FjaGUgKQogICAgICAgICBnb3RvIG91dF91bmxvY2s7
CiAKLSAgICBpZiAoICFub25wb2QgKQorICAgIGlmICggaSA9PSBwb2QgKQogICAgIHsKICAgICAg
ICAgLyoKICAgICAgICAgICogQWxsIFBvRDogTWFyayB0aGUgd2hvbGUgcmVnaW9uIGludmFsaWQg
YW5kIHRlbGwgY2FsbGVyCkBAIC01ODcsNyArNTgxLDcgQEAgcDJtX3BvZF9kZWNyZWFzZV9yZXNl
cnZhdGlvbihzdHJ1Y3QgZG9tYQogICAgICAgICAgcDJtX3BvZF96ZXJvX2NoZWNrX3N1cGVycGFn
ZShwMm0sIF9nZm4oZ2ZuX3goZ2ZuKSAmIH4oU1VQRVJQQUdFX1BBR0VTIC0gMSkpKSApCiAgICAg
ewogICAgICAgICBwb2QgPSAxVUwgPDwgb3JkZXI7Ci0gICAgICAgIHJhbSA9IG5vbnBvZCA9IDA7
CisgICAgICAgIHJhbSA9IDA7CiAgICAgICAgIEFTU0VSVChzdGVhbF9mb3JfY2FjaGUgPT0gKHAy
bS0+cG9kLmVudHJ5X2NvdW50ID4gcDJtLT5wb2QuY291bnQpKTsKICAgICB9CiAKQEAgLTY1NSw3
ICs2NDksNiBAQCBwMm1fcG9kX2RlY3JlYXNlX3Jlc2VydmF0aW9uKHN0cnVjdCBkb21hCiAKICAg
ICAgICAgICAgIHN0ZWFsX2Zvcl9jYWNoZSA9ICAoIHAybS0+cG9kLmVudHJ5X2NvdW50ID4gcDJt
LT5wb2QuY291bnQgKTsKIAotICAgICAgICAgICAgbm9ucG9kIC09IG47CiAgICAgICAgICAgICBy
YW0gLT0gbjsKICAgICAgICAgICAgIHJldCArPSBuOwogICAgICAgICB9CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
