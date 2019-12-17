Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5BF12331F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 18:02:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihGCp-0004mB-0M; Tue, 17 Dec 2019 17:00:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fMX9=2H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihGCn-0004m6-Pk
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 17:00:17 +0000
X-Inumbo-ID: b2ddaaf6-20ee-11ea-8f21-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2ddaaf6-20ee-11ea-8f21-12813bfff9fa;
 Tue, 17 Dec 2019 17:00:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CEF8BAB9B;
 Tue, 17 Dec 2019 17:00:15 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <20191217151144.9781-2-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0bc8c84-dbb5-0030-061a-a665a7901b80@suse.com>
Date: Tue, 17 Dec 2019 18:00:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191217151144.9781-2-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTIuMjAxOSAxNjoxMiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQEAg
LTQ3MTEsNiArNDcxMiwyMCBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgKPiAgICAgICAgICB9
Cj4gICAgICAgICAgYnJlYWs7Cj4gIAo+ICsgICAgY2FzZSBIVk1PUF9hbHRwMm1fc2V0X3N1cHBy
ZXNzX3ZlX211bHRpOgo+ICsgICAgICAgIGlmICggYS51LnN1cHByZXNzX3ZlX211bHRpLnBhZDEg
fHwKPiArICAgICAgICAgICAgIGEudS5zdXBwcmVzc192ZV9tdWx0aS5maXJzdF9lcnJvcl9jb2Rl
IHx8Cj4gKyAgICAgICAgICAgICBhLnUuc3VwcHJlc3NfdmVfbXVsdGkuZmlyc3RfZXJyb3IgfHwK
PiArICAgICAgICAgICAgIGEudS5zdXBwcmVzc192ZV9tdWx0aS5maXJzdF9nZm4gPiBhLnUuc3Vw
cHJlc3NfdmVfbXVsdGkubGFzdF9nZm4gKQo+ICsgICAgICAgICAgICByYyA9IC1FSU5WQUw7CgpB
biBlcnJvciBoYXZpbmcgb2NjdXJyZWQgZG9lc24ndCBwcmV2ZW50IHNjaGVkdWxpbmcgb2YgYQpj
b250aW51YXRpb24uIFdoZW4geW91IGNvbWUgYmFjayBoZXJlLCB5b3UnbGwgdGhlbiByZXR1cm4K
LUVJTlZBTCBpbnN0ZWFkIG9mIGNvbnRpbnVpbmcgdGhlIHByaW9yIG9wZXJhdGlvbi4KCj4gLS0t
IGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4g
QEAgLTMwNjQsNiArMzA2NCw3MCBAQCBvdXQ6Cj4gICAgICByZXR1cm4gcmM7Cj4gIH0KPiAgCj4g
Ky8qCj4gKyAqIFNldC9jbGVhciB0aGUgI1ZFIHN1cHByZXNzIGJpdCBmb3IgbXVsdGlwbGUgcGFn
ZXMuICBPbmx5IGF2YWlsYWJsZSBvbiBWTVguCj4gKyAqLwo+ICtpbnQgcDJtX3NldF9zdXBwcmVz
c192ZV9tdWx0aShzdHJ1Y3QgZG9tYWluICpkLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVfbXVsdGkgKnN2ZSkKPiArewo+
ICsgICAgc3RydWN0IHAybV9kb21haW4gKmhvc3RfcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+
ICsgICAgc3RydWN0IHAybV9kb21haW4gKmFwMm0gPSBOVUxMOwo+ICsgICAgc3RydWN0IHAybV9k
b21haW4gKnAybSA9IGhvc3RfcDJtOwo+ICsgICAgdWludDY0X3Qgc3RhcnQgPSBzdmUtPmZpcnN0
X2dmbjsKPiArICAgIGludCByYyA9IDA7Cj4gKyAgICB1aW50NjRfdCBtYXhfcGh5c19hZGRyID0g
KDFVTCA8PCBkLT5hcmNoLmNwdWlkLT5leHRkLm1heHBoeXNhZGRyKSAtIDE7Cj4gKwo+ICsgICAg
aWYgKCBzdmUtPnZpZXcgPiAwICkKPiArICAgIHsKPiArICAgICAgICBpZiAoIHN2ZS0+dmlldyA+
PSBNQVhfQUxUUDJNIHx8Cj4gKyAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FycmF5
X2luZGV4X25vc3BlYyhzdmUtPnZpZXcsIE1BWF9FUFRQKV0gPT0KPiArICAgICAgICAgICAgIG1m
bl94KElOVkFMSURfTUZOKSApCj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiAr
ICAgICAgICBwMm0gPSBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3Bl
YyhzdmUtPnZpZXcsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTUFYX0FMVFAyTSldOwo+ICsgICAgfQo+ICsKPiArICAgIHAybV9s
b2NrKGhvc3RfcDJtKTsKPiArCj4gKyAgICBpZiAoIGFwMm0gKQo+ICsgICAgICAgIHAybV9sb2Nr
KGFwMm0pOwo+ICsKPiArICAgIHdoaWxlICggc3ZlLT5sYXN0X2dmbiA+PSBzdGFydCAmJiBzdGFy
dCA8IG1heF9waHlzX2FkZHIgKQoKV2h5IGRvbid0IHlvdSBjbGlwIC0+bGFzdF9nZm4gYWhlYWQg
b2YgdGhlIGxvb3AsIHNhdmluZyBvbmUKY29tcGFyaXNvbiBwZXIgaXRlcmF0aW9uPwoKPiArICAg
IHsKPiArICAgICAgICBwMm1fYWNjZXNzX3QgYTsKPiArICAgICAgICBwMm1fdHlwZV90IHQ7Cj4g
KyAgICAgICAgbWZuX3QgbWZuOwo+ICsgICAgICAgIGludCBlcnIgPSAwOwo+ICsKPiArICAgICAg
ICBpZiAoIGFsdHAybV9nZXRfZWZmZWN0aXZlX2VudHJ5KHAybSwgX2dmbihzdGFydCksICZtZm4s
ICZ0LCAmYSwgQVAyTUdFVF9xdWVyeSkgKQo+ICsgICAgICAgICAgICBhID0gcDJtLT5kZWZhdWx0
X2FjY2VzczsKPiArCj4gKyAgICAgICAgaWYgKCAoZXJyID0gcDJtLT5zZXRfZW50cnkocDJtLCBf
Z2ZuKHN0YXJ0KSwgbWZuLCBQQUdFX09SREVSXzRLLCB0LCBhLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN2ZS0+c3VwcHJlc3NfdmUpKSAmJiAhc3ZlLT5maXJzdF9lcnJv
ciApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBzdmUtPmZpcnN0X2Vycm9yID0gc3RhcnQ7
IC8qIFNhdmUgdGhlIGdmbiBvZiB0aGUgZmlyc3QgZXJyb3IgKi8KPiArICAgICAgICAgICAgc3Zl
LT5maXJzdF9lcnJvcl9jb2RlID0gZXJyOyAvKiBTYXZlIHRoZSBmaXJzdCBlcnJvciBjb2RlICov
Cj4gKyAgICAgICAgfQoKV2hhdCBpZiB0aGUgZmlyc3QgZXJyb3Igb2NjdXJzIG9uIEdGTiAwPyBJ
IGd1ZXNzIHlvdSB3YW50IHRvIGNoZWNrCi0+Zmlyc3RfZXJyb3JfY29kZSBhZ2FpbnN0IHplcm8g
aW4gdGhlIGNvbmRpdGlvbi4KCj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3Au
aAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmgKPiBAQCAtNDYsNiArNDYs
MTYgQEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlIHsKPiAgICAgIHVpbnQ2NF90
IGdmbjsKPiAgfTsKPiAgCj4gK3N0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9tdWx0
aSB7Cj4gKyAgICB1aW50MTZfdCB2aWV3Owo+ICsgICAgdWludDhfdCBzdXBwcmVzc192ZTsgLyog
Qm9vbGVhbiB0eXBlLiAqLwo+ICsgICAgdWludDhfdCBwYWQxOwo+ICsgICAgdWludDMyX3QgZmly
c3RfZXJyb3JfY29kZTsgLyogTXVzdCBiZSBzZXQgdG8gMCAuICovCgppbnQzMl90IHBlcmhhcHMs
IHNpbmNlIGVycm9yIGNvZGVzIGFyZSBuZWdhdGl2ZT8KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
