Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D88E8136B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huXU3-0001IT-1G; Mon, 05 Aug 2019 07:32:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5ABr=WB=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1huXU1-0001IO-Ox
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 07:32:41 +0000
X-Inumbo-ID: 33e6386d-b753-11e9-8980-bc764e045a96
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 33e6386d-b753-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 07:32:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 00:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="176234887"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga003.jf.intel.com with ESMTP; 05 Aug 2019 00:32:35 -0700
Date: Mon, 5 Aug 2019 15:36:43 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190805073643.GD19492@gao-cwp>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-13-git-send-email-chao.gao@intel.com>
 <2c758b76-8f01-f8d0-1fc9-95b164e111b3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c758b76-8f01-f8d0-1fc9-95b164e111b3@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v8 12/16] microcode: split out
 apply_microcode() from cpu_request_microcode()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDM6NDA6NTVQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAwMS4wOC4yMDE5IDEyOjIyLCBDaGFvIEdhbyB3cm90ZToKPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21pY3JvY29kZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwo+PiBA
QCAtMTg5LDEyICsxODksMjAgQEAgc3RhdGljIERFRklORV9TUElOTE9DSyhtaWNyb2NvZGVfbXV0
ZXgpOwo+PiAgIAo+PiAgIERFRklORV9QRVJfQ1BVKHN0cnVjdCBjcHVfc2lnbmF0dXJlLCBjcHVf
c2lnKTsKPj4gICAKPj4gLXN0cnVjdCBtaWNyb2NvZGVfaW5mbyB7Cj4+IC0gICAgdW5zaWduZWQg
aW50IGNwdTsKPj4gLSAgICB1aW50MzJfdCBidWZmZXJfc2l6ZTsKPj4gLSAgICBpbnQgZXJyb3I7
Cj4+IC0gICAgY2hhciBidWZmZXJbMV07Cj4+IC19Owo+PiArLyoKPj4gKyAqIFJldHVybiBhIHBh
dGNoIHRoYXQgY292ZXJzIGN1cnJlbnQgQ1BVLiBJZiB0aGVyZSBhcmUgbXVsdGlwbGUgcGF0Y2hl
cywKPj4gKyAqIHJldHVybiB0aGUgb25lIHdpdGggdGhlIGhpZ2hlc3QgcmV2aXNpb24gbnVtYmVy
LiBSZXR1cm4gZXJyb3IgSWYgbm8KPj4gKyAqIHBhdGNoIGlzIGZvdW5kIGFuZCBhbiBlcnJvciBv
Y2N1cnMgZHVyaW5nIHRoZSBwYXJzaW5nIHByb2Nlc3MuIE90aGVyd2lzZQo+PiArICogcmV0dXJu
IE5VTEwuCj4+ICsgKi8KPj4gK3N0YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICptaWNyb2Nv
ZGVfcGFyc2VfYmxvYihjb25zdCBjaGFyICpidWYsCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgbGVuKQo+Cj5CdHcgLSB5b3Un
ZCBoYXZlIGxlc3MgaXNzdWVzIHdpdGggbGluZSBsZW5ndGggaWYgeW91IG9taXR0ZWQgdGhlCj4i
bWljcm9jb2RlXyIgcHJlZml4IGZyb20gc3RhdGljIGZ1bmN0aW9ucy4KPgo+PiBAQCAtMjUwLDQ5
ICsyNTEsODggQEAgYm9vbCBtaWNyb2NvZGVfdXBkYXRlX2NhY2hlKHN0cnVjdCBtaWNyb2NvZGVf
cGF0Y2ggKnBhdGNoKQo+PiAgICAgICByZXR1cm4gdHJ1ZTsKPj4gICB9Cj4+ICAgCj4+IC1zdGF0
aWMgaW50IG1pY3JvY29kZV91cGRhdGVfY3B1KGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IHNpemUp
Cj4+ICsvKgo+PiArICogTG9hZCBhIG1pY3JvY29kZSB1cGRhdGUgdG8gY3VycmVudCBDUFUuCj4+
ICsgKgo+PiArICogSWYgbm8gcGF0Y2ggaXMgcHJvdmlkZWQsIHRoZSBjYWNoZWQgcGF0Y2ggd2ls
bCBiZSBsb2FkZWQuIE1pY3JvY29kZSB1cGRhdGUKPj4gKyAqIGR1cmluZyBBUHMgYnJpbmd1cCBh
bmQgQ1BVIHJlc3VtaW5nIGZhbGxzIGludG8gdGhpcyBjYXNlLgo+PiArICovCj4+ICtzdGF0aWMg
aW50IG1pY3JvY29kZV91cGRhdGVfY3B1KGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBh
dGNoKQo+PiAgIHsKPj4gLSAgICBpbnQgZXJyOwo+PiAtICAgIHVuc2lnbmVkIGludCBjcHUgPSBz
bXBfcHJvY2Vzc29yX2lkKCk7Cj4+IC0gICAgc3RydWN0IGNwdV9zaWduYXR1cmUgKnNpZyA9ICZw
ZXJfY3B1KGNwdV9zaWcsIGNwdSk7Cj4+ICsgICAgaW50IGVyciA9IG1pY3JvY29kZV9vcHMtPmNv
bGxlY3RfY3B1X2luZm8oJnRoaXNfY3B1KGNwdV9zaWcpKTsKPj4gKwo+PiArICAgIGlmICggdW5s
aWtlbHkoZXJyKSApCj4+ICsgICAgICAgIHJldHVybiBlcnI7Cj4+ICAgCj4+ICAgICAgIHNwaW5f
bG9jaygmbWljcm9jb2RlX211dGV4KTsKPj4gICAKPj4gLSAgICBlcnIgPSBtaWNyb2NvZGVfb3Bz
LT5jb2xsZWN0X2NwdV9pbmZvKHNpZyk7Cj4+IC0gICAgaWYgKCBsaWtlbHkoIWVycikgKQo+PiAt
ICAgICAgICBlcnIgPSBtaWNyb2NvZGVfb3BzLT5jcHVfcmVxdWVzdF9taWNyb2NvZGUoYnVmLCBz
aXplKTsKPj4gKyAgICBpZiAoIHBhdGNoICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIC8qCj4+ICsg
ICAgICAgICAqIElmIGEgcGF0Y2ggaXMgc3BlY2lmaWVkLCBpdCBzaG91bGQgaGFzIG5ld2VyIHJl
dmlzaW9uIHRoYW4KPj4gKyAgICAgICAgICogdGhhdCBvZiB0aGUgcGF0Y2ggY2FjaGVkLgo+PiAr
ICAgICAgICAgKi8KPj4gKyAgICAgICAgaWYgKCBtaWNyb2NvZGVfY2FjaGUgJiYKPj4gKyAgICAg
ICAgICAgICBtaWNyb2NvZGVfb3BzLT5jb21wYXJlX3BhdGNoKHBhdGNoLCBtaWNyb2NvZGVfY2Fj
aGUpICE9IE5FV19VQ09ERSApCj4KPldoaWxlIEkgc2VlIHRoYXQgeW91J3ZlIHRha2VuIGNhcmUg
b2YgdGhlIG9uZSBjYXNlIGluIEludGVsIHNwZWNpZmljCj5jb2RlLCB0aGlzIGlzIGFnYWluIGEg
Y2FzZSB3aGVyZSBJIGRvbid0IHRoaW5rIHlvdSBjYW4gdmFsaWRseSBjYWxsCj50aGlzIGhvb2sg
aW4gdGhlIEludGVsIGNhc2UuIEFsYmVpdCBtYXliZSBpdCBpcyBva2F5LCBwcm92aWRlZCB0aGF0
Cj50aGUgY2FsbGVyIGhhcyBhbHJlYWR5IHZlcmlmaWVkIGl0IGFnYWluc3QgdGhlIENQVSBzaWdu
YXR1cmUuIFRoZW4KPmFnYWluIEkgd29uZGVyIHdoeSB0aGlzIGNoZWNrIGdldHMgZG9uZSBoZXJl
IHJhdGhlciB0aGFuIGluIHRoZQo+Y2FsbGVyIChuZXh0IHRvIHRoYXQgb3RoZXIgY2hlY2spIGFu
eXdheS4gQWZhaWNzIHRoaXMgd2F5IHlvdSdkCj5hbHNvIGF2b2lkIHJlLWNoZWNraW5nIG9uIGV2
ZXJ5IENQVSBhIENQVS1pbmRlcGVuZGVudCBwcm9wZXJ0eS4KCkFzIHNhaWQgaW4gYW4gZWFybGll
ciByZXBseSB0byBwYXRjaCA2LCAtPmNvbXBhcmVfcGF0Y2ggY2FuCmJlIHNpbXBsaWZpZWQgYSBs
b3QuIERvIHlvdSB0aGluayBpdCBpcyBmaW5lIHRvIGNhbGwgaXQgaGVyZQp3aXRoIHRoYXQgY2hh
bmdlPwoKQWJvdXQgYXZvaWRpbmcgcmUtY2hlY2tpbmcsIHdlIHNob3VsZCBjaGVjayBpdCB3aXRo
ICJtaWNyb2NvZGVfbXV0ZXgiCmhlbGQgb3RoZXJ3aXNlIHdlIGNhbm5vdCBlbnN1cmUgbm9ib2R5
IGlzIHVwZGF0aW5nIHRoZSBjYWNoZS4gSWYgd2Ugd2FudAp0byBhdm9pZCByZS1jaGVja2luZywg
dGhlbiB0aGlzIGxvY2sgaXMgaGVsZCBmb3IgYSBsb25nIHRpbWUgZnJvbSBsb2FkaW5nCm9uIHRo
ZSBmaXJzdCBjb3JlIHRvIHRoZSBsYXN0IGNvcmUuIEFuZCBhbHNvIGZvciBlYXJseSBsb2FkaW5n
IGFuZCBsYXRlCmxvYWRpbmcsIHdlIHBhc3MgJ05VTEwnIHRvIHRoaXMgZnVuY3Rpb24gb24gZm9s
bG93aW5nIENQVXMgYWZ0ZXIgdGhlCmZpcnN0IHN1Y2Nlc3NmdWwgbG9hZGluZy4gSSBhbSBhZnJh
aWQgdGhhdCB0aGVyZSBpcyBubyByZWR1bmRhbnQgY2hlY2tpbmcuCgpUaGFua3MKQ2hhbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
