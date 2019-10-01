Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66386C367B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 15:58:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFIbh-0006On-8v; Tue, 01 Oct 2019 13:54:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q5vT=X2=amazon.com=prvs=17096c9fa=hongyax@srs-us1.protection.inumbo.net>)
 id 1iFIbg-0006Oi-Cw
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 13:54:24 +0000
X-Inumbo-ID: f9872a5a-e452-11e9-bf31-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id f9872a5a-e452-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569938063; x=1601474063;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rBiA2BGSpeZOlvc+B47i3H6p0leJNj/wKTA7KZ6j+x0=;
 b=MaNAgN3EkzhZ3oRv9quiJw7LBcfPIGsiMhUubF/lRre93IFdnV4o0p3t
 xsnHSo6p9ypzEGZmZWbyem2UF4hFtZcN9GJW72cdO23MV9iL+AF+L7zU9
 pIMQ1oBO+tdk81Vr0JCyjw0hXDJU8yxtH6tF9My34U7/O/+LG3zG6Ac4R Y=;
X-IronPort-AV: E=Sophos;i="5.64,571,1559520000"; d="scan'208";a="425025477"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 01 Oct 2019 13:54:22 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id A4547A2385; Tue,  1 Oct 2019 13:54:21 +0000 (UTC)
Received: from EX13D01UEA001.ant.amazon.com (10.43.61.161) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 13:54:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D01UEA001.ant.amazon.com (10.43.61.161) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 13:54:20 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 1 Oct 2019 13:54:20 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
References: <cover.1569833766.git.hongyax@amazon.com>
 <f8b0b15146c357270fb0978f3ec50eea4695dc1c.1569833766.git.hongyax@amazon.com>
Message-ID: <480a0733-07c4-b98a-a2c9-465cf9fbef63@amazon.com>
Date: Tue, 1 Oct 2019 14:54:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f8b0b15146c357270fb0978f3ec50eea4695dc1c.1569833766.git.hongyax@amazon.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 39/55] x86: switch root_pgt to mfn_t and
 use new APIs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDkvMjAxOSAxMTozMywgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gRnJvbTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBUaGlzIHRoZW4gcmVxdWlyZXMgbW92aW5nIGRlY2xh
cmF0aW9uIG9mIHJvb3QgcGFnZSB0YWJsZSBtZm4gaW50byBtbS5oCj4gYW5kIG1vZGlmeSBzZXR1
cF9jcHVfcm9vdF9wZ3QgdG8gaGF2ZSBhIHNpbmdsZSBleGl0IHBhdGguCj4gCj4gV2UgYWxzbyBu
ZWVkIHRvIGZvcmNlIG1hcF9kb21haW5fcGFnZSB0byB1c2UgZGlyZWN0IG1hcCB3aGVuIHN3aXRj
aGluZwo+IHBlci1kb21haW4gbWFwcGluZ3MuIFRoaXMgaXMgY29udHJhcnkgdG8gb3VyIGVuZCBn
b2FsIG9mIHJlbW92aW5nCj4gZGlyZWN0IG1hcCwgYnV0IHRoaXMgd2lsbCBiZSByZW1vdmVkIG9u
Y2Ugd2UgbWFrZSBtYXBfZG9tYWluX3BhZ2UKPiBjb250ZXh0LXN3aXRjaCBzYWZlIGluIGFub3Ro
ZXIgKGxhcmdlKSBwYXRjaCBzZXJpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAg
ICAgfCAxNSArKysrKysrKysrLS0tCj4gICB4ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2UuYyAgICAg
IHwgIDIgKy0KPiAgIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAgICAgICAgfCAgMiArLQo+ICAg
eGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jICAgICAgICB8ICAyICstCj4gICB4ZW4vYXJjaC94ODYv
c21wYm9vdC5jICAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
Cj4gICB4ZW4vaW5jbHVkZS9hc20teDg2L21tLmggICAgICAgIHwgIDIgKysKPiAgIHhlbi9pbmNs
dWRlL2FzbS14ODYvcHJvY2Vzc29yLmggfCAgMiArLQo+ICAgNyBmaWxlcyBjaGFuZ2VkLCA0NSBp
bnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2RvbWFpbi5jIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4gaW5kZXggZGJkZjZiMWJjMi4u
ZTliZjQ3ZWZjZSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiArKysgYi94
ZW4vYXJjaC94ODYvZG9tYWluLmMKPiBAQCAtNjksNiArNjksNyBAQAo+ICAgI2luY2x1ZGUgPGFz
bS9wdi9kb21haW4uaD4KPiAgICNpbmNsdWRlIDxhc20vcHYvbW0uaD4KPiAgICNpbmNsdWRlIDxh
c20vc3BlY19jdHJsLmg+Cj4gKyNpbmNsdWRlIDxhc20vc2V0dXAuaD4KPiAgIAo+ICAgREVGSU5F
X1BFUl9DUFUoc3RydWN0IHZjcHUgKiwgY3Vycl92Y3B1KTsKPiAgIAo+IEBAIC0xNTgwLDEyICsx
NTgxLDIwIEBAIHZvaWQgcGFyYXZpcnRfY3R4dF9zd2l0Y2hfZnJvbShzdHJ1Y3QgdmNwdSAqdikK
PiAgIAo+ICAgdm9pZCBwYXJhdmlydF9jdHh0X3N3aXRjaF90byhzdHJ1Y3QgdmNwdSAqdikKPiAg
IHsKPiAtICAgIHJvb3RfcGdlbnRyeV90ICpyb290X3BndCA9IHRoaXNfY3B1KHJvb3RfcGd0KTsK
PiArICAgIG1mbl90IHJwdF9tZm4gPSB0aGlzX2NwdShyb290X3BndF9tZm4pOwo+ICAgCj4gLSAg
ICBpZiAoIHJvb3RfcGd0ICkKPiAtICAgICAgICByb290X3BndFtyb290X3RhYmxlX29mZnNldChQ
RVJET01BSU5fVklSVF9TVEFSVCldID0KPiArICAgIGlmICggIW1mbl9lcShycHRfbWZuLCBJTlZB
TElEX01GTikgKQo+ICsgICAgewo+ICsgICAgICAgIHJvb3RfcGdlbnRyeV90ICpycHQ7Cj4gKwo+
ICsgICAgICAgIG1hcGNhY2hlX292ZXJyaWRlX2N1cnJlbnQoSU5WQUxJRF9WQ1BVKTsKPiArICAg
ICAgICBycHQgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcocnB0X21mbik7Cj4gKyAgICAgICAgcnB0
W3Jvb3RfdGFibGVfb2Zmc2V0KFBFUkRPTUFJTl9WSVJUX1NUQVJUKV0gPQo+ICAgICAgICAgICAg
ICAgbDRlX2Zyb21fcGFnZSh2LT5kb21haW4tPmFyY2gucGVyZG9tYWluX2wzX3BnLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUl9SVyk7Cj4gKyAgICAgICAg
VU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcocnB0KTsKPiArICAgICAgICBtYXBjYWNoZV9vdmVycmlk
ZV9jdXJyZW50KE5VTEwpOwo+ICsgICAgfQo+ICAgCj4gICAgICAgaWYgKCB1bmxpa2VseSh2LT5h
cmNoLmRyNyAmIERSN19BQ1RJVkVfTUFTSykgKQo+ICAgICAgICAgICBhY3RpdmF0ZV9kZWJ1Z3Jl
Z3Modik7CgpJIGFtIGhhdmluZyBzZWNvbmQgdGhvdWdodHMgb24gd2hldGhlciBJIHNob3VsZCBp
bmNsdWRlIHRoaXMgcGF0Y2ggZm9yIG5vdy4gCk9idmlvdXNseSB0aGUgcGVyLWRvbWFpbiBtYXBj
YWNoZSBpbiBpdHMgY3VycmVudCBmb3JtIGNhbm5vdCBiZSB1c2VkIGhlcmUgCmR1cmluZyB0aGUg
Y29udGV4dCBzd2l0Y2guIEhvd2V2ZXIsIEkgYWxzbyBkb24ndCB3YW50IHRvIHVzZSBQTUFQIGJl
Y2F1c2UgaXQgaXMgCmp1c3QgYSBib290c3RyYXBwaW5nIG1lY2hhbmlzbSBhbmQgbWF5IHJlc3Vs
dCBpbiBoZWF2eSBsb2NrIGNvbnRlbnRpb24gaGVyZS4KCkkgYW0gaW5jbGluZWQgdG8gZHJvcCBp
dCBmb3Igbm93IGFuZCBpbmNsdWRlIHRoaXMgYWZ0ZXIgd2UgaGF2ZSBhIApjb250ZXh0LXN3aXRj
aCBzYWZlIG1hcHBpbmcgbWVjaGFuaXNtLCBhcyB0aGUgY29tbWl0IG1lc3NhZ2Ugc3VnZ2VzdHMu
CgpIb25neWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
