Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445A7B0AE7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 11:06:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8L09-00054v-Sn; Thu, 12 Sep 2019 09:02:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8L08-00054q-T6
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 09:02:52 +0000
X-Inumbo-ID: 1847c8ee-d53c-11e9-83e6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1847c8ee-d53c-11e9-83e6-12813bfff9fa;
 Thu, 12 Sep 2019 09:02:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D87B0B684;
 Thu, 12 Sep 2019 09:02:48 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1dce979e-e8a4-d556-b079-9d0e8ed1f5b9@suse.com>
Date: Thu, 12 Sep 2019 11:02:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911200504.5693-7-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 6/8] tools/libxc: Rework
 xc_cpuid_apply_policy() to use {get, set}_cpu_policy()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAyMjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgcHVycG9zZSBv
ZiB0aGlzIGNoYW5nZSBpcyB0byBzdG9wIHVzaW5nIHhjX2NwdWlkX2RvX2RvbWN0bCgpLCBhbmQg
dG8gc3RvcAo+IGJhc2luZyBkZWNpc2lvbnMgb24gYSBsb2NhbCBDUFVJRCBpbnN0cnVjdGlvbi4g
IFRoaXMgaXMgbm90IGEgY29ycmVjdCBvcgo+IGFwcHJvcHJpYXRlIHdheSB0byBjb25zdHJ1Y3Qg
cG9saWN5IGluZm9ybWF0aW9uIGZvciBvdGhlciBkb21haW5zLgo+IAo+IFRoZSBvdmVyd2hlbG1p
bmcgbWFqb3JpdHkgb2YgdGhpcyBsb2dpYyBpcyByZWR1bmRhbnQgd2l0aCB0aGUgcG9saWN5IGxv
Z2ljIGluCj4gWGVuLCBidXQgaGFzIGEgaGFiaXQgb2YgYmVjb21pbmcgc3RhbGUgKGUuZy4gYy9z
IDk3ZTRlYmRjZDc2IHJlc3VsdGluZyBpbgo+IEFWWDUxMl9CRjE2IG5vdCBldmVyIGFjdHVhbGx5
IGJlaW5nIG9mZmVyZWQgdG8gZ3Vlc3RzKS4KCldlbGwsIG5vdCBvZmZlcmluZyBpdCB0byBndWVz
dHMgd2FzIGludGVudGlvbmFsIGF0IHRoYXQgcG9pbnQsCmJ1dCBJIGd1ZXNzIHlvdSB2YWxpZGx5
IGltcGx5IHRoYXQgYnkgYWRkaW5nIHRoZSBBIG1hcmtlciB0byB0aGUKcHVibGljIGhlYWRlciBp
dCBfc3RpbGxfIHdvdWxkbid0IGhhdmUgZ290IGV4cG9zZWQ/Cgo+IC0tLQo+ICB0b29scy9saWJ4
Yy94Y19jcHVpZF94ODYuYyAgICAgIHwgNzk4ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgeGVuL2luY2x1ZGUveGVuL2xpYi94ODYvY3B1aWQuaCB8ICAxMSArLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDE5NyBpbnNlcnRpb25zKCspLCA2MTIgZGVsZXRpb25zKC0pCgpO
aWNlLgoKPiBAQCAtMTA1NywzICs0NDksMTkxIEBAIGludCB4Y19jcHVpZF9zZXQoCj4gIAo+ICAg
ICAgcmV0dXJuIHJjOwo+ICB9Cj4gKwo+ICtpbnQgeGNfY3B1aWRfYXBwbHlfcG9saWN5KHhjX2lu
dGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21pZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCB1aW50MzJfdCAqZmVhdHVyZXNldCwgdW5zaWduZWQgaW50IG5yX2ZlYXR1cmVzKQo+
ICt7Cj4gKyAgICBpbnQgcmM7Cj4gKyAgICB4Y19kb21pbmZvX3QgZGk7Cj4gKyAgICB1bnNpZ25l
ZCBpbnQgaSwgbnJfbGVhdmVzLCBucl9tc3JzOwo+ICsgICAgeGVuX2NwdWlkX2xlYWZfdCAqbGVh
dmVzID0gTlVMTDsKPiArICAgIHN0cnVjdCBjcHVpZF9wb2xpY3kgKnAgPSBOVUxMOwo+ICsgICAg
dWludDMyX3QgZXJyX2xlYWYgPSAtMSwgZXJyX3N1YmxlYWYgPSAtMSwgZXJyX21zciA9IC0xOwo+
ICsKPiArICAgIGlmICggeGNfZG9tYWluX2dldGluZm8oeGNoLCBkb21pZCwgMSwgJmRpKSAhPSAx
IHx8Cj4gKyAgICAgICAgIGRpLmRvbWlkICE9IGRvbWlkICkKPiArICAgIHsKPiArICAgICAgICBF
UlJPUigiRmFpbGVkIHRvIG9idGFpbiBkJWQgaW5mbyIsIGRvbWlkKTsKPiArICAgICAgICByYyA9
IC1FU1JDSDsKPiArICAgICAgICBnb3RvIG91dDsKPiArICAgIH0KPiArCj4gKyAgICByYyA9IHhj
X2dldF9jcHVfcG9saWN5X3NpemUoeGNoLCAmbnJfbGVhdmVzLCAmbnJfbXNycyk7Cj4gKyAgICBp
ZiAoIHJjICkKPiArICAgIHsKPiArICAgICAgICBQRVJST1IoIkZhaWxlZCB0byBvYnRhaW4gcG9s
aWN5IGluZm8gc2l6ZSIpOwo+ICsgICAgICAgIHJjID0gLWVycm5vOwo+ICsgICAgICAgIGdvdG8g
b3V0Owo+ICsgICAgfQo+ICsKPiArICAgIHJjID0gLUVOT01FTTsKPiArICAgIGlmICggKGxlYXZl
cyA9IGNhbGxvYyhucl9sZWF2ZXMsIHNpemVvZigqbGVhdmVzKSkpID09IE5VTEwgfHwKPiArICAg
ICAgICAgKHAgPSBjYWxsb2MoMSwgc2l6ZW9mKCpwKSkpID09IE5VTEwgKQo+ICsgICAgICAgIGdv
dG8gb3V0Owo+ICsKPiArICAgIG5yX21zcnMgPSAwOwo+ICsgICAgcmMgPSB4Y19nZXRfZG9tYWlu
X2NwdV9wb2xpY3koeGNoLCBkb21pZCwgJm5yX2xlYXZlcywgbGVhdmVzLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJm5yX21zcnMsIE5VTEwpOwo+ICsgICAgaWYgKCByYyAp
Cj4gKyAgICB7Cj4gKyAgICAgICAgUEVSUk9SKCJGYWlsZWQgdG8gb2J0YWluIGQlZCdzIHBvbGlj
eSIsIGRvbWlkKTsKPiArICAgICAgICByYyA9IC1lcnJubzsKPiArICAgICAgICBnb3RvIG91dDsK
PiArICAgIH0KPiArCj4gKyAgICByYyA9IHg4Nl9jcHVpZF9jb3B5X2Zyb21fYnVmZmVyKHAsIGxl
YXZlcywgbnJfbGVhdmVzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
ZXJyX2xlYWYsICZlcnJfc3VibGVhZik7Cj4gKyAgICBpZiAoIHJjICkKPiArICAgIHsKPiArICAg
ICAgICBFUlJPUigiRmFpbGVkIHRvIGRlc2VyaWFsaXNlIENQVUlEIChlcnIgbGVhZiAlI3gsIHN1
YmxlYWYgJSN4KSAoJWQgPSAlcykiLAo+ICsgICAgICAgICAgICAgIGVycl9sZWFmLCBlcnJfc3Vi
bGVhZiwgLXJjLCBzdHJlcnJvcigtcmMpKTsKPiArICAgICAgICBnb3RvIG91dDsKPiArICAgIH0K
PiArCj4gKyAgICBpZiAoIGZlYXR1cmVzZXQgKQo+ICsgICAgewo+ICsgICAgICAgIHVpbnQzMl90
IGRpc2FibGVkX2ZlYXR1cmVzW0ZFQVRVUkVTRVRfTlJfRU5UUklFU10sCj4gKyAgICAgICAgICAg
IGZlYXRbRkVBVFVSRVNFVF9OUl9FTlRSSUVTXSA9IHt9Owo+ICsgICAgICAgIHN0YXRpYyBjb25z
dCB1aW50MzJfdCBkZWVwX2ZlYXR1cmVzW10gPSBJTklUX0RFRVBfRkVBVFVSRVM7Cj4gKyAgICAg
ICAgdW5zaWduZWQgaW50IGksIGI7Cj4gKwo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogVGhl
IHVzZXIgc3VwcGxpZWQgZmVhdHVyZXNldCBtYXkgYmUgc2hvcnRlciBvciBsb25nZXIgdGhhbgo+
ICsgICAgICAgICAqIEZFQVRVUkVTRVRfTlJfRU5UUklFUy4gIFNob3J0ZXIgaXMgZmluZSwgYW5k
IHdlIHdpbGwgemVyby1leHRlbmQuCj4gKyAgICAgICAgICogTG9uZ2VyIGlzIGZpbmUsIHNvIGxv
bmcgYXMgaXQgb25seSBwYWRkZWQgd2l0aCB6ZXJvcy4KPiArICAgICAgICAgKi8KPiArICAgICAg
ICB1bnNpZ25lZCBpbnQgdXNlcl9sZW4gPSBtaW4oRkVBVFVSRVNFVF9OUl9FTlRSSUVTICsgMHUs
IG5yX2ZlYXR1cmVzKTsKPiArCj4gKyAgICAgICAgLyogQ2hlY2sgZm9yIHRydW5jYXRlZCBzZXQg
Yml0cy4gKi8KPiArICAgICAgICByYyA9IC1FT1BOT1RTVVBQOwo+ICsgICAgICAgIGZvciAoIGkg
PSB1c2VyX2xlbjsgaSA8IG5yX2ZlYXR1cmVzOyArK2kgKQo+ICsgICAgICAgICAgICBpZiAoIGZl
YXR1cmVzZXRbaV0gIT0gMCApCj4gKyAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiArCj4gKyAg
ICAgICAgbWVtY3B5KGZlYXQsIGZlYXR1cmVzZXQsIHNpemVvZigqZmVhdHVyZXNldCkgKiB1c2Vy
X2xlbik7Cj4gKwo+ICsgICAgICAgIC8qIERpc2FibGUgZGVlcCBkZXBlbmRlbmNpZXMgb2YgZGlz
YWJsZWQgZmVhdHVyZXMuICovCj4gKyAgICAgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KGRpc2FibGVkX2ZlYXR1cmVzKTsgKytpICkKPiArICAgICAgICAgICAgZGlzYWJsZWRfZmVhdHVy
ZXNbaV0gPSB+ZmVhdFtpXSAmIGRlZXBfZmVhdHVyZXNbaV07Cj4gKwo+ICsgICAgICAgIGZvciAo
IGIgPSAwOyBiIDwgc2l6ZW9mKGRpc2FibGVkX2ZlYXR1cmVzKSAqIENIQVJfQklUOyArK2IgKQo+
ICsgICAgICAgIHsKPiArICAgICAgICAgICAgY29uc3QgdWludDMyX3QgKmRmczsKPiArCj4gKyAg
ICAgICAgICAgIGlmICggIXRlc3RfYml0KGIsIGRpc2FibGVkX2ZlYXR1cmVzKSB8fAo+ICsgICAg
ICAgICAgICAgICAgICEoZGZzID0geDg2X2NwdWlkX2xvb2t1cF9kZWVwX2RlcHMoYikpICkKPiAr
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgZm9yICggaSA9IDA7
IGkgPCBBUlJBWV9TSVpFKGRpc2FibGVkX2ZlYXR1cmVzKTsgKytpICkKPiArICAgICAgICAgICAg
ewo+ICsgICAgICAgICAgICAgICAgZmVhdFtpXSAmPSB+ZGZzW2ldOwo+ICsgICAgICAgICAgICAg
ICAgZGlzYWJsZWRfZmVhdHVyZXNbaV0gJj0gfmRmc1tpXTsKPiArICAgICAgICAgICAgfQo+ICsg
ICAgICAgIH0KPiArCj4gKyAgICAgICAgY3B1aWRfZmVhdHVyZXNldF90b19wb2xpY3koZmVhdCwg
cCk7Cj4gKyAgICB9Cj4gKwo+ICsgICAgaWYgKCAhZGkuaHZtICkKPiArICAgIHsKPiArICAgICAg
ICB1aW50MzJfdCBob3N0X2ZlYXR1cmVzZXRbRkVBVFVSRVNFVF9OUl9FTlRSSUVTXTsKPiArICAg
ICAgICB1aW50MzJfdCBsZW4gPSBBUlJBWV9TSVpFKGhvc3RfZmVhdHVyZXNldCk7Cj4gKwo+ICsg
ICAgICAgIHJjID0geGNfZ2V0X2NwdV9mZWF0dXJlc2V0KHhjaCwgWEVOX1NZU0NUTF9jcHVfZmVh
dHVyZXNldF9ob3N0LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZsZW4s
IGhvc3RfZmVhdHVyZXNldCk7Cj4gKyAgICAgICAgaWYgKCByYyApCj4gKyAgICAgICAgewo+ICsg
ICAgICAgICAgICAvKiBUb2xlcmF0ZSAiYnVmZmVyIHRvbyBzbWFsbCIsIGFzIHdlJ3ZlIGdvdCB0
aGUgYml0cyB3ZSBuZWVkLiAqLwo+ICsgICAgICAgICAgICBpZiAoIGVycm5vID09IEVOT0JVRlMg
KQo+ICsgICAgICAgICAgICAgICAgcmMgPSAwOwoKU28gdGhpcyBpcyB3aGVyZSBJIHRoaW5rIHJl
dHVybmluZyBhbiBlcnJvciAoaW5zdGVhZCBvZiBhIHBvc2l0aXZlCm51bWJlcikgZnJvbSB0aGUg
aHlwZXJjYWxsIGlzIGxhdGVudGx5IHByb2JsZW1hdGljOiBUaGVyZSdzIG5vdApyZWFsbHkgYW55
IGd1YXJhbnRlZSBmb3IgRU5PQlVGUyB0byBub3QgcmVzdWx0IGZyb20gb3RoZXIgdGhhbiB0aGUK
YWN0dWFsIGh5cGVyY2FsbC4gSSBndWVzcyB3ZSBoYXZlIHN1Y2ggZGVwZW5kZW5jaWVzIGVsc2V3
aGVyZSwgc28KaGF2aW5nIG9uZSBtb3JlIGhlcmUgaXNuJ3QgYSBiaWcgZGVhbCwgYnV0IGFzIGEg
cHJlY2F1dGlvbiBhZ2FpbnN0CnVzaW5nIHVuaW5pdGlhbGl6ZWQgZGF0YSwgd291bGRuJ3QgaXQg
YmUgcHJ1ZGVudCBmb3IKaG9zdF9mZWF0dXJlc2V0W10gdG8gZ2V0IHplcm8taW5pdGlhbGl6ZWQg
dXAgZnJvbnQ/Cgo+ICsgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgIHsKPiArICAgICAg
ICAgICAgICAgIFBFUlJPUigiRmFpbGVkIHRvIG9idGFpbiBob3N0IGZlYXR1cmVzZXQiKTsKPiAr
ICAgICAgICAgICAgICAgIHJjID0gLWVycm5vOwo+ICsgICAgICAgICAgICAgICAgZ290byBvdXQ7
Cj4gKyAgICAgICAgICAgIH0KPiArICAgICAgICB9Cj4gKwo+ICsgICAgICAgIC8qCj4gKyAgICAg
ICAgICogT24gaGFyZHdhcmUgd2l0aG91dCBDUFVJRCBGYXVsdGluZywgUFYgZ3Vlc3RzIHNlZSBy
ZWFsIHRvcG9sb2d5Lgo+ICsgICAgICAgICAqIEFzIGEgY29uc2VxdWVuY2UsIHRoZXkgYWxzbyBu
ZWVkIHRvIHNlZSB0aGUgaG9zdCBodHQvY21wIGZpZWxkcy4KPiArICAgICAgICAgKi8KPiArICAg
ICAgICBwLT5iYXNpYy5odHQgICAgICAgPSB0ZXN0X2JpdChYODZfRkVBVFVSRV9IVFQsIGhvc3Rf
ZmVhdHVyZXNldCk7Cj4gKyAgICAgICAgcC0+ZXh0ZC5jbXBfbGVnYWN5ID0gdGVzdF9iaXQoWDg2
X0ZFQVRVUkVfQ01QX0xFR0FDWSwgaG9zdF9mZWF0dXJlc2V0KTsKPiArICAgIH0KPiArICAgIGVs
c2UKPiArICAgIHsKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIFRvcG9sb2d5IGZvciBIVk0g
Z3Vlc3RzIGlzIGVudGlyZWx5IGNvbnRyb2xsZWQgYnkgWGVuLiAgRm9yIG5vdywgd2UKPiArICAg
ICAgICAgKiBoYXJkY29kZSBBUElDX0lEID0gdmNwdV9pZCAqIDIgdG8gZ2l2ZSB0aGUgaWxsdXNp
b24gb2Ygbm8gU01ULgo+ICsgICAgICAgICAqLwo+ICsgICAgICAgIHAtPmJhc2ljLmh0dCA9IHRy
dWU7Cj4gKyAgICAgICAgcC0+ZXh0ZC5jbXBfbGVnYWN5ID0gZmFsc2U7Cj4gKwo+ICsgICAgICAg
IHAtPmJhc2ljLmxwcHAgKj0gMjsKPiArCj4gKyAgICAgICAgc3dpdGNoICggcC0+eDg2X3ZlbmRv
ciApCj4gKyAgICAgICAgewo+ICsgICAgICAgIGNhc2UgWDg2X1ZFTkRPUl9JTlRFTDoKPiArICAg
ICAgICAgICAgZm9yICggaSA9IDA7IChwLT5jYWNoZS5zdWJsZWFmW2ldLnR5cGUgJiYKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICBpIDwgQVJSQVlfU0laRShwLT5jYWNoZS5yYXcpKTsgKytp
ICkKPiArICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAgcC0+Y2FjaGUuc3VibGVhZltp
XS5jb3Jlc19wZXJfcGFja2FnZSA9Cj4gKyAgICAgICAgICAgICAgICAgICAgKHAtPmNhY2hlLnN1
YmxlYWZbaV0uY29yZXNfcGVyX3BhY2thZ2UgPDwgMSkgfCAxOwo+ICsgICAgICAgICAgICAgICAg
cC0+Y2FjaGUuc3VibGVhZltpXS50aHJlYWRzX3Blcl9jYWNoZSA9IDA7Cj4gKyAgICAgICAgICAg
IH0KPiArICAgICAgICAgICAgYnJlYWs7CgpUaGUgb3JpZ2luYWwgY29kZSBtYXNrZWQgRURYIGJ5
IDB4M2ZmLiBJIGRvbid0IHNlZSBob3cgdGhpcyBpcyByZWZsZWN0ZWQKaGVyZSwgYW5kIHRoZSBk
ZXNjcmlwdGlvbiBhbHNvIGRvZXNuJ3QgaW5kaWNhdGUgdGhlIGNoYW5nZSBpcyBvbiBwdXJwb3Nl
LgoKPiArICAgICAgICBjYXNlIFg4Nl9WRU5ET1JfQU1EOgo+ICsgICAgICAgIGNhc2UgWDg2X1ZF
TkRPUl9IWUdPTjoKPiArICAgICAgICAgICAgcC0+ZXh0ZC5uYyA9IChwLT5leHRkLm5jIDw8IDEp
IHwgMTsKClRoaXMgYWN0dWFsbHkgZml4ZXMgYSBsYXRlbnQgInNwaWxsIGludG8gYml0IDgiIGlz
c3VlIG9mIHRoZSBvcmlnaW5hbApjb2RlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
