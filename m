Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBFCFE120
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:24:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdRM-0004Pd-No; Fri, 15 Nov 2019 15:23:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVdRM-0004PX-2E
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:23:16 +0000
X-Inumbo-ID: d75d33fc-07bb-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d75d33fc-07bb-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 15:23:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BF74CB4E9;
 Fri, 15 Nov 2019 15:23:13 +0000 (UTC)
To: Hongyan Xia <hongyax@amazon.com>, Wei Liu <wl@xen.org>
References: <cover.1570034362.git.hongyax@amazon.com>
 <177843fa29560291b8af90db5daffe4852ea96b7.1570034362.git.hongyax@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <98238224-df4e-5ff0-95d1-1f9f93ca0ab6@suse.com>
Date: Fri, 15 Nov 2019 16:23:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <177843fa29560291b8af90db5daffe4852ea96b7.1570034362.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/9] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxOToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gQEAgLTQ4NDcsMjIgKzQ4
NDgsNTAgQEAgaW50IG1tY2ZnX2ludGVyY2VwdF93cml0ZSgKPiAgfQo+ICAKPiAgdm9pZCAqYWxs
b2NfeGVuX3BhZ2V0YWJsZSh2b2lkKQo+ICt7Cj4gKyAgICBtZm5fdCBtZm47Cj4gKwo+ICsgICAg
bWZuID0gYWxsb2NfeGVuX3BhZ2V0YWJsZV9uZXcoKTsKPiArICAgIEFTU0VSVCghbWZuX2VxKG1m
biwgSU5WQUxJRF9NRk4pKTsKPiArCj4gKyAgICByZXR1cm4gbWFwX3hlbl9wYWdldGFibGVfbmV3
KG1mbik7Cj4gK30KPiArCj4gK3ZvaWQgZnJlZV94ZW5fcGFnZXRhYmxlKHZvaWQgKnYpCj4gK3sK
PiArICAgIGlmICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9lYXJseV9ib290ICkKPiArICAg
ICAgICBmcmVlX3hlbl9wYWdldGFibGVfbmV3KHZpcnRfdG9fbWZuKHYpKTsKPiArfQo+ICsKPiAr
bWZuX3QgYWxsb2NfeGVuX3BhZ2V0YWJsZV9uZXcodm9pZCkKPiAgewo+ICAgICAgaWYgKCBzeXN0
ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3QgKQo+ICAgICAgewo+ICAgICAgICAgIHZv
aWQgKnB0ciA9IGFsbG9jX3hlbmhlYXBfcGFnZSgpOwo+ICAKPiAgICAgICAgICBCVUdfT04oIWhh
cmR3YXJlX2RvbWFpbiAmJiAhcHRyKTsKPiAtICAgICAgICByZXR1cm4gcHRyOwo+ICsgICAgICAg
IHJldHVybiB2aXJ0X3RvX21mbihwdHIpOwo+ICAgICAgfQo+ICAKPiAtICAgIHJldHVybiBtZm5f
dG9fdmlydChtZm5feChhbGxvY19ib290X3BhZ2VzKDEsIDEpKSk7Cj4gKyAgICByZXR1cm4gYWxs
b2NfYm9vdF9wYWdlcygxLCAxKTsKPiAgfQo+ICAKPiAtdm9pZCBmcmVlX3hlbl9wYWdldGFibGUo
dm9pZCAqdikKPiArdm9pZCAqbWFwX3hlbl9wYWdldGFibGVfbmV3KG1mbl90IG1mbikKClRoZXJl
J3Mgbm8gbmVlZCBmb3IgdGhlIG1hcC91bm1hcCBmdW5jdGlvbnMgdG8gaGF2ZSBhIF9uZXcKc3Vm
Zml4LCBpcyB0aGVyZT8KCj4gIHsKPiAtICAgIGlmICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFU
RV9lYXJseV9ib290ICkKPiAtICAgICAgICBmcmVlX3hlbmhlYXBfcGFnZSh2KTsKPiArICAgIHJl
dHVybiBtZm5fdG9fdmlydChtZm5feChtZm4pKTsKPiArfQo+ICsKPiArLyogdiBjYW4gcG9pbnQg
dG8gYW4gZW50cnkgd2l0aGluIGEgdGFibGUgb3IgYmUgTlVMTCAqLwo+ICt2b2lkIHVubWFwX3hl
bl9wYWdldGFibGVfbmV3KHZvaWQgKnYpCgpDYW4gdGhpcyBwbGVhc2UgdGFrZSBjb25zdCB2b2lk
ICosIHN1Y2ggdGhhdCBjYWxsZXJzIG5lZWRpbmcKbWFwcGluZ3MganVzdCBmb3IgcmVhZCBwdXJw
b3NlcyBjYW4gaGF2ZSB0aGVpciBwb2ludGVyIGNvbnN0LQpxdWFsaWZpZWQgYXMgd2VsbD8KCj4g
K3sKPiArICAgIC8qIFhYWCBzdGlsbCB1c2luZyB4ZW5oZWFwIHBhZ2UsIG5vIG5lZWQgdG8gZG8g
YW55dGhpbmcuICAqLwoKSSB3b25kZXIgaWYgaXQgd291bGRuJ3QgYmUgYSBnb29kIGlkZWEgdG8g
YXQgbGVhc3QgaGF2ZSBzb21lCmxlYWsgZGV0ZWN0aW9uIGhlcmUgdGVtcG9yYXJpbHksIHN1Y2gg
dGhhdCB3ZSBoYXZlIGEgY2hhbmNlIG9mCm5vdGljaW5nIHBhdGhzIG5vdCBwcm9wZXJseSBkb2lu
ZyB0aGUgbmVjZXNzYXJ5IHVubWFwcGluZy4KClRoZSBhZ2FpbiBhIHF1ZXN0aW9uIGlzIHdoeSB5
b3UgaW50cm9kdWNlIHN1Y2ggYSBtYXAvdW5tYXAgcGFpcgppbiB0aGUgZmlyc3QgcGxhY2UuIFRo
aXMgaXMgZ29pbmcgdG8gYmUgYSB0aGluIHdyYXBwZXIgYXJvdW5kCnssdW59bWFwX2RvbWFpbl9w
YWdlKCkgaW4gdGhlIGVuZCBhbnl3YXksIGFuZCBoZW5jZSBjYWxsZXJzCmNvdWxkIGFzIHdlbGwg
YmUgc3dpdGNoZWQgdG8gY2FsbGluZyB0aG9zZSBmdW5jdGlvbiBkaXJlY3RseSwKYXMgdGhleSdy
ZSBuby1vcHMgb24gWGVuIGhlYXAgcGFnZXMuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
bW0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+IEBAIC02MzMsNiArNjMzLDE3
IEBAIGludCBhcmNoX2FjcXVpcmVfcmVzb3VyY2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQg
aW50IHR5cGUsCj4gIC8qIEFsbG9jYXRvciBmdW5jdGlvbnMgZm9yIFhlbiBwYWdldGFibGVzLiAq
Lwo+ICB2b2lkICphbGxvY194ZW5fcGFnZXRhYmxlKHZvaWQpOwo+ICB2b2lkIGZyZWVfeGVuX3Bh
Z2V0YWJsZSh2b2lkICp2KTsKPiArbWZuX3QgYWxsb2NfeGVuX3BhZ2V0YWJsZV9uZXcodm9pZCk7
Cj4gK3ZvaWQgKm1hcF94ZW5fcGFnZXRhYmxlX25ldyhtZm5fdCBtZm4pOwo+ICt2b2lkIHVubWFw
X3hlbl9wYWdldGFibGVfbmV3KHZvaWQgKnYpOwo+ICt2b2lkIGZyZWVfeGVuX3BhZ2V0YWJsZV9u
ZXcobWZuX3QgbWZuKTsKPiArCj4gKyNkZWZpbmUgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcocHRy
KSAgICBcCj4gKyAgICBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAg
ICAgICAgdW5tYXBfeGVuX3BhZ2V0YWJsZV9uZXcoKHB0cikpOyBcCgpTdHJheSBkb3VibGUgcGFy
ZW50aGVzZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
