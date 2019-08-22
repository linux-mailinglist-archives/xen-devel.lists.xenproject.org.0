Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814FE99979
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 18:44:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0q8Z-0006aH-C0; Thu, 22 Aug 2019 16:40:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV1a=WS=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i0q8X-0006aC-L3
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 16:40:33 +0000
X-Inumbo-ID: 8e53be04-c4fb-11e9-b95f-bc764e2007e4
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e53be04-c4fb-11e9-b95f-bc764e2007e4;
 Thu, 22 Aug 2019 16:40:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 09:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="181443104"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga003.jf.intel.com with ESMTP; 22 Aug 2019 09:40:28 -0700
Date: Fri, 23 Aug 2019 00:44:34 +0800
From: Chao Gao <chao.gao@intel.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190822164432.GA30223@gao-cwp>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-12-git-send-email-chao.gao@intel.com>
 <20190822141046.wludotavoun4qg6l@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822141046.wludotavoun4qg6l@Air-de-Roger>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v9 11/15] microcode: unify loading update
 during CPU resuming and AP wakeup
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMDQ6MTA6NDZQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPk9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDA5OjI1OjI0QU0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+PiBCb3RoIGFyZSBsb2FkaW5nIHRoZSBjYWNoZWQgcGF0Y2guIFNpbmNlIEFQ
cyBjYWxsIHRoZSB1bmlmaWVkIGZ1bmN0aW9uLAo+PiBtaWNyb2NvZGVfdXBkYXRlX29uZSgpLCBk
dXJpbmcgd2FrZXVwLCB0aGUgJ3N0YXJ0X3VwZGF0ZScgcGFyYW1ldGVyCj4+IHdoaWNoIG9yaWdp
bmFsbHkgdXNlZCB0byBkaXN0aW5ndWlzaCBCU1AgYW5kIEFQcyBpcyByZWR1bmRhbnQuIFNvIHJl
bW92ZQo+PiB0aGlzIHBhcmFtZXRlci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxj
aGFvLmdhb0BpbnRlbC5jb20+Cj4+IC0tLQo+PiBOb3RlIHRoYXQgaGVyZSBpcyBhIGZ1bmN0aW9u
YWwgY2hhbmdlOiByZXN1bWluZyBhIENQVSB3b3VsZCBjYWxsCj4+IC0+ZW5kX3VwZGF0ZSgpIG5v
dyB3aGlsZSBwcmV2aW91c2x5IGl0IHdhc24ndC4gTm90IHF1aXRlIHN1cmUKPj4gd2hldGhlciBp
dCBpcyBjb3JyZWN0Lgo+Cj5JIGd1ZXNzIHRoYXQncyByZXF1aXJlZCBpZiBpdCBjYWxsZWQgc3Rh
cnRfdXBkYXRlIHByaW9yIHRvIGNhbGxpbmcKPmVuZF91cGRhdGU/Cj4KPj4gCj4+IENoYW5nZXMg
aW4gdjk6Cj4+ICAtIHJldHVybiAtRU9QTk9UU1VQUCByYXRoZXIgdGhhbiAwIGlmIG1pY3JvY29k
ZV9vcHMgaXMgTlVMTCBpbgo+PiAgICBtaWNyb2NvZGVfdXBkYXRlX29uZSgpCj4+ICAtIHJlYmFz
ZSBhbmQgZml4IGNvbmZsaWN0cy4KPj4gCj4+IENoYW5nZXMgaW4gdjg6Cj4+ICAtIHNwbGl0IG91
dCBmcm9tIHRoZSBwcmV2aW91cyBwYXRjaAo+PiAtLS0KPj4gIHhlbi9hcmNoL3g4Ni9hY3BpL3Bv
d2VyLmMgICAgICAgfCAgMiArLQo+PiAgeGVuL2FyY2gveDg2L21pY3JvY29kZS5jICAgICAgICB8
IDkwICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICB4ZW4vYXJj
aC94ODYvc21wYm9vdC5jICAgICAgICAgIHwgIDUgKy0tCj4+ICB4ZW4vaW5jbHVkZS9hc20teDg2
L3Byb2Nlc3Nvci5oIHwgIDQgKy0KPj4gIDQgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygr
KSwgNTcgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2FjcGkv
cG93ZXIuYyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKPj4gaW5kZXggNGYyMTkwMy4uMjQ3
OThkNSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYwo+PiArKysgYi94
ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jCj4+IEBAIC0yNTMsNyArMjUzLDcgQEAgc3RhdGljIGlu
dCBlbnRlcl9zdGF0ZSh1MzIgc3RhdGUpCj4+ICAKPj4gICAgICBjb25zb2xlX2VuZF9zeW5jKCk7
Cj4+ICAKPj4gLSAgICBtaWNyb2NvZGVfcmVzdW1lX2NwdSgpOwo+PiArICAgIG1pY3JvY29kZV91
cGRhdGVfb25lKCk7Cj4+ICAKPj4gICAgICBpZiAoICFyZWNoZWNrX2NwdV9mZWF0dXJlcygwKSAp
Cj4+ICAgICAgICAgIHBhbmljKCJNaXNzaW5nIHByZXZpb3VzbHkgYXZhaWxhYmxlIGZlYXR1cmUo
cylcbiIpOwo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jIGIveGVuL2Fy
Y2gveDg2L21pY3JvY29kZS5jCj4+IGluZGV4IGEyZmViYzcuLmJkZDljOWYgMTAwNjQ0Cj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9j
b2RlLmMKPj4gQEAgLTIwMywyNCArMjAzLDYgQEAgc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVfcGF0
Y2ggKnBhcnNlX2Jsb2IoY29uc3QgY2hhciAqYnVmLCB1aW50MzJfdCBsZW4pCj4+ICAgICAgcmV0
dXJuIE5VTEw7Cj4+ICB9Cj4+ICAKPj4gLWludCBtaWNyb2NvZGVfcmVzdW1lX2NwdSh2b2lkKQo+
PiAtewo+PiAtICAgIGludCBlcnI7Cj4+IC0gICAgc3RydWN0IGNwdV9zaWduYXR1cmUgKnNpZyA9
ICZ0aGlzX2NwdShjcHVfc2lnKTsKPj4gLQo+PiAtICAgIGlmICggIW1pY3JvY29kZV9vcHMgKQo+
PiAtICAgICAgICByZXR1cm4gMDsKPj4gLQo+PiAtICAgIHNwaW5fbG9jaygmbWljcm9jb2RlX211
dGV4KTsKPj4gLQo+PiAtICAgIGVyciA9IG1pY3JvY29kZV9vcHMtPmNvbGxlY3RfY3B1X2luZm8o
c2lnKTsKPj4gLSAgICBpZiAoIGxpa2VseSghZXJyKSApCj4+IC0gICAgICAgIGVyciA9IG1pY3Jv
Y29kZV9vcHMtPmFwcGx5X21pY3JvY29kZShtaWNyb2NvZGVfY2FjaGUpOwo+PiAtICAgIHNwaW5f
dW5sb2NrKCZtaWNyb2NvZGVfbXV0ZXgpOwo+PiAtCj4+IC0gICAgcmV0dXJuIGVycjsKPj4gLX0K
Pj4gLQo+PiAgdm9pZCBtaWNyb2NvZGVfZnJlZV9wYXRjaChzdHJ1Y3QgbWljcm9jb2RlX3BhdGNo
ICptaWNyb2NvZGVfcGF0Y2gpCj4+ICB7Cj4+ICAgICAgbWljcm9jb2RlX29wcy0+ZnJlZV9wYXRj
aChtaWNyb2NvZGVfcGF0Y2gtPm1jKTsKPj4gQEAgLTM4NCwxMSArMzY2LDI5IEBAIHN0YXRpYyBp
bnQgX19pbml0IG1pY3JvY29kZV9pbml0KHZvaWQpCj4+ICB9Cj4+ICBfX2luaXRjYWxsKG1pY3Jv
Y29kZV9pbml0KTsKPj4gIAo+PiAtaW50IF9faW5pdCBlYXJseV9taWNyb2NvZGVfdXBkYXRlX2Nw
dShib29sIHN0YXJ0X3VwZGF0ZSkKPj4gKy8qIExvYWQgYSBjYWNoZWQgdXBkYXRlIHRvIGN1cnJl
bnQgY3B1ICovCj4+ICtpbnQgbWljcm9jb2RlX3VwZGF0ZV9vbmUodm9pZCkKPj4gK3sKPj4gKyAg
ICBpbnQgcmM7Cj4+ICsKPj4gKyAgICBpZiAoICFtaWNyb2NvZGVfb3BzICkKPj4gKyAgICAgICAg
cmV0dXJuIC1FT1BOT1RTVVBQOwo+PiArCj4+ICsgICAgcmMgPSBtaWNyb2NvZGVfdXBkYXRlX2Nw
dShOVUxMKTsKPj4gKwo+PiArICAgIGlmICggbWljcm9jb2RlX29wcy0+ZW5kX3VwZGF0ZSApCj4+
ICsgICAgICAgIG1pY3JvY29kZV9vcHMtPmVuZF91cGRhdGUoKTsKPgo+RG9uJ3QgeW91IG5lZWQg
dG8gY2FsbCBzdGFydF91cGRhdGUgYmVmb3JlIGNhbGxpbmcKPm1pY3JvY29kZV91cGRhdGVfY3B1
PwoKTm8uIE9uIEFNRCBzaWRlLCBvc3Z3X3N0YXR1cyByZWNvcmRzIHRoZSBoYXJkd2FyZSBlcnJh
dHVtIGluIHRoZSBzeXN0ZW0uCkFzIHdlIGRvbid0IGFzc3VtZSBhbGwgQ1BVcyBoYXZlIHRoZSBz
YW1lIGVycmF0dW0sIGVhY2ggY3B1IGNhbGxzCmVuZF91cGRhdGUgdG8gdXBkYXRlIG9zdndfc3Rh
dHVzIGFmdGVyIHVjb2RlIGxvYWRpbmcuCnN0YXJ0X3VwZGF0ZSBqdXN0IHJlc2V0cyBvc3Z3X3N0
YXR1cyB0byAwLiBBbmQgaXQgaXMgY2FsbGVkIG9uY2UgcHJpb3IKdG8gdWNvZGUgbG9hZGluZyBv
biBhbnkgQ1BVIHNvIHRoYXQgb3N2d19zdGF0dXMgY2FuIGJlIHJlY29tcHV0ZWQuCgpUaGFua3MK
Q2hhbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
