Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF0818E2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 14:10:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hublQ-00063x-3v; Mon, 05 Aug 2019 12:06:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5ABr=WB=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hublN-00063s-Mf
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 12:06:53 +0000
X-Inumbo-ID: 80f65daa-b779-11e9-8242-9fad8cb01009
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80f65daa-b779-11e9-8242-9fad8cb01009;
 Mon, 05 Aug 2019 12:06:50 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 05:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="175572480"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga007.fm.intel.com with ESMTP; 05 Aug 2019 05:05:13 -0700
Date: Mon, 5 Aug 2019 20:09:22 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190805120922.GB1685@gao-cwp>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-13-git-send-email-chao.gao@intel.com>
 <2c758b76-8f01-f8d0-1fc9-95b164e111b3@suse.com>
 <20190805073643.GD19492@gao-cwp>
 <0b22ca3b-48de-8805-bd18-89d728d19317@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b22ca3b-48de-8805-bd18-89d728d19317@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDk6Mzg6MDBBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAwNS4wOC4yMDE5IDA5OjM2LCBDaGFvIEdhbyB3cm90ZToKPj4gT24gRnJpLCBBdWcg
MDIsIDIwMTkgYXQgMDM6NDA6NTVQTSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAw
MS4wOC4yMDE5IDEyOjIyLCBDaGFvIEdhbyB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYv
bWljcm9jb2RlLmMKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKPj4+PiBAQCAt
MTg5LDEyICsxODksMjAgQEAgc3RhdGljIERFRklORV9TUElOTE9DSyhtaWNyb2NvZGVfbXV0ZXgp
Owo+Pj4+ICAgIAo+Pj4+ICAgIERFRklORV9QRVJfQ1BVKHN0cnVjdCBjcHVfc2lnbmF0dXJlLCBj
cHVfc2lnKTsKPj4+PiAgICAKPj4+PiAtc3RydWN0IG1pY3JvY29kZV9pbmZvIHsKPj4+PiAtICAg
IHVuc2lnbmVkIGludCBjcHU7Cj4+Pj4gLSAgICB1aW50MzJfdCBidWZmZXJfc2l6ZTsKPj4+PiAt
ICAgIGludCBlcnJvcjsKPj4+PiAtICAgIGNoYXIgYnVmZmVyWzFdOwo+Pj4+IC19Owo+Pj4+ICsv
Kgo+Pj4+ICsgKiBSZXR1cm4gYSBwYXRjaCB0aGF0IGNvdmVycyBjdXJyZW50IENQVS4gSWYgdGhl
cmUgYXJlIG11bHRpcGxlIHBhdGNoZXMsCj4+Pj4gKyAqIHJldHVybiB0aGUgb25lIHdpdGggdGhl
IGhpZ2hlc3QgcmV2aXNpb24gbnVtYmVyLiBSZXR1cm4gZXJyb3IgSWYgbm8KPj4+PiArICogcGF0
Y2ggaXMgZm91bmQgYW5kIGFuIGVycm9yIG9jY3VycyBkdXJpbmcgdGhlIHBhcnNpbmcgcHJvY2Vz
cy4gT3RoZXJ3aXNlCj4+Pj4gKyAqIHJldHVybiBOVUxMLgo+Pj4+ICsgKi8KPj4+PiArc3RhdGlj
IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm1pY3JvY29kZV9wYXJzZV9ibG9iKGNvbnN0IGNoYXIg
KmJ1ZiwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVpbnQzMl90IGxlbikKPj4+Cj4+PiBCdHcgLSB5b3UnZCBoYXZlIGxlc3MgaXNzdWVz
IHdpdGggbGluZSBsZW5ndGggaWYgeW91IG9taXR0ZWQgdGhlCj4+PiAibWljcm9jb2RlXyIgcHJl
Zml4IGZyb20gc3RhdGljIGZ1bmN0aW9ucy4KPj4+Cj4+Pj4gQEAgLTI1MCw0OSArMjUxLDg4IEBA
IGJvb2wgbWljcm9jb2RlX3VwZGF0ZV9jYWNoZShzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRj
aCkKPj4+PiAgICAgICAgcmV0dXJuIHRydWU7Cj4+Pj4gICAgfQo+Pj4+ICAgIAo+Pj4+IC1zdGF0
aWMgaW50IG1pY3JvY29kZV91cGRhdGVfY3B1KGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IHNpemUp
Cj4+Pj4gKy8qCj4+Pj4gKyAqIExvYWQgYSBtaWNyb2NvZGUgdXBkYXRlIHRvIGN1cnJlbnQgQ1BV
Lgo+Pj4+ICsgKgo+Pj4+ICsgKiBJZiBubyBwYXRjaCBpcyBwcm92aWRlZCwgdGhlIGNhY2hlZCBw
YXRjaCB3aWxsIGJlIGxvYWRlZC4gTWljcm9jb2RlIHVwZGF0ZQo+Pj4+ICsgKiBkdXJpbmcgQVBz
IGJyaW5ndXAgYW5kIENQVSByZXN1bWluZyBmYWxscyBpbnRvIHRoaXMgY2FzZS4KPj4+PiArICov
Cj4+Pj4gK3N0YXRpYyBpbnQgbWljcm9jb2RlX3VwZGF0ZV9jcHUoY29uc3Qgc3RydWN0IG1pY3Jv
Y29kZV9wYXRjaCAqcGF0Y2gpCj4+Pj4gICAgewo+Pj4+IC0gICAgaW50IGVycjsKPj4+PiAtICAg
IHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4+Pj4gLSAgICBzdHJ1Y3Qg
Y3B1X3NpZ25hdHVyZSAqc2lnID0gJnBlcl9jcHUoY3B1X3NpZywgY3B1KTsKPj4+PiArICAgIGlu
dCBlcnIgPSBtaWNyb2NvZGVfb3BzLT5jb2xsZWN0X2NwdV9pbmZvKCZ0aGlzX2NwdShjcHVfc2ln
KSk7Cj4+Pj4gKwo+Pj4+ICsgICAgaWYgKCB1bmxpa2VseShlcnIpICkKPj4+PiArICAgICAgICBy
ZXR1cm4gZXJyOwo+Pj4+ICAgIAo+Pj4+ICAgICAgICBzcGluX2xvY2soJm1pY3JvY29kZV9tdXRl
eCk7Cj4+Pj4gICAgCj4+Pj4gLSAgICBlcnIgPSBtaWNyb2NvZGVfb3BzLT5jb2xsZWN0X2NwdV9p
bmZvKHNpZyk7Cj4+Pj4gLSAgICBpZiAoIGxpa2VseSghZXJyKSApCj4+Pj4gLSAgICAgICAgZXJy
ID0gbWljcm9jb2RlX29wcy0+Y3B1X3JlcXVlc3RfbWljcm9jb2RlKGJ1Ziwgc2l6ZSk7Cj4+Pj4g
KyAgICBpZiAoIHBhdGNoICkKPj4+PiArICAgIHsKPj4+PiArICAgICAgICAvKgo+Pj4+ICsgICAg
ICAgICAqIElmIGEgcGF0Y2ggaXMgc3BlY2lmaWVkLCBpdCBzaG91bGQgaGFzIG5ld2VyIHJldmlz
aW9uIHRoYW4KPj4+PiArICAgICAgICAgKiB0aGF0IG9mIHRoZSBwYXRjaCBjYWNoZWQuCj4+Pj4g
KyAgICAgICAgICovCj4+Pj4gKyAgICAgICAgaWYgKCBtaWNyb2NvZGVfY2FjaGUgJiYKPj4+PiAr
ICAgICAgICAgICAgIG1pY3JvY29kZV9vcHMtPmNvbXBhcmVfcGF0Y2gocGF0Y2gsIG1pY3JvY29k
ZV9jYWNoZSkgIT0gTkVXX1VDT0RFICkKPj4+Cj4+PiBXaGlsZSBJIHNlZSB0aGF0IHlvdSd2ZSB0
YWtlbiBjYXJlIG9mIHRoZSBvbmUgY2FzZSBpbiBJbnRlbCBzcGVjaWZpYwo+Pj4gY29kZSwgdGhp
cyBpcyBhZ2FpbiBhIGNhc2Ugd2hlcmUgSSBkb24ndCB0aGluayB5b3UgY2FuIHZhbGlkbHkgY2Fs
bAo+Pj4gdGhpcyBob29rIGluIHRoZSBJbnRlbCBjYXNlLiBBbGJlaXQgbWF5YmUgaXQgaXMgb2th
eSwgcHJvdmlkZWQgdGhhdAo+Pj4gdGhlIGNhbGxlciBoYXMgYWxyZWFkeSB2ZXJpZmllZCBpdCBh
Z2FpbnN0IHRoZSBDUFUgc2lnbmF0dXJlLiBUaGVuCj4+PiBhZ2FpbiBJIHdvbmRlciB3aHkgdGhp
cyBjaGVjayBnZXRzIGRvbmUgaGVyZSByYXRoZXIgdGhhbiBpbiB0aGUKPj4+IGNhbGxlciAobmV4
dCB0byB0aGF0IG90aGVyIGNoZWNrKSBhbnl3YXkuIEFmYWljcyB0aGlzIHdheSB5b3UnZAo+Pj4g
YWxzbyBhdm9pZCByZS1jaGVja2luZyBvbiBldmVyeSBDUFUgYSBDUFUtaW5kZXBlbmRlbnQgcHJv
cGVydHkuCj4+IAo+PiBBcyBzYWlkIGluIGFuIGVhcmxpZXIgcmVwbHkgdG8gcGF0Y2ggNiwgLT5j
b21wYXJlX3BhdGNoIGNhbgo+PiBiZSBzaW1wbGlmaWVkIGEgbG90LiBEbyB5b3UgdGhpbmsgaXQg
aXMgZmluZSB0byBjYWxsIGl0IGhlcmUKPj4gd2l0aCB0aGF0IGNoYW5nZT8KPgo+QXMgc2FpZCB0
aGVyZSAtIHllcywgdGhpcyBsb29rcyB0byBiZSBhbiBvcHRpb24uCj4KPj4gQWJvdXQgYXZvaWRp
bmcgcmUtY2hlY2tpbmcsIHdlIHNob3VsZCBjaGVjayBpdCB3aXRoICJtaWNyb2NvZGVfbXV0ZXgi
Cj4+IGhlbGQgb3RoZXJ3aXNlIHdlIGNhbm5vdCBlbnN1cmUgbm9ib2R5IGlzIHVwZGF0aW5nIHRo
ZSBjYWNoZS4gSWYgd2Ugd2FudAo+PiB0byBhdm9pZCByZS1jaGVja2luZywgdGhlbiB0aGlzIGxv
Y2sgaXMgaGVsZCBmb3IgYSBsb25nIHRpbWUgZnJvbSBsb2FkaW5nCj4+IG9uIHRoZSBmaXJzdCBj
b3JlIHRvIHRoZSBsYXN0IGNvcmUuIEFuZCBhbHNvIGZvciBlYXJseSBsb2FkaW5nIGFuZCBsYXRl
Cj4+IGxvYWRpbmcsIHdlIHBhc3MgJ05VTEwnIHRvIHRoaXMgZnVuY3Rpb24gb24gZm9sbG93aW5n
IENQVXMgYWZ0ZXIgdGhlCj4+IGZpcnN0IHN1Y2Nlc3NmdWwgbG9hZGluZy4gSSBhbSBhZnJhaWQg
dGhhdCB0aGVyZSBpcyBubyByZWR1bmRhbnQgY2hlY2tpbmcuCj4KPlRoZXJlIHNob3VsZCBub3Qg
YmUgYW55IHVwZGF0aW5nIG9mIHRoZSBjYWNoZSB3aGlsZSBvbmUgKHN5c3RlbS13aWRlKQo+dWNv
ZGUgbG9hZCBvcGVyYXRpb24gaXMgaW4gcHJvZ3Jlc3MsIG9yIGVsc2UgeW91IHJpc2sgbGVhdmlu
ZyB0aGUKPnN5c3RlbSBpbiBhICJtaXhlZCB1Y29kZSB2ZXJzaW9ucyIgc3RhdGUgaW4gdGhlIGVu
ZC4gQXMgc2FpZCwgYWxzbwoKWWVzLiBJIGFncmVlLgoKPmZyb20gYSBsb2dpY2FsIGZsb3ctb2Yt
ZXZlbnRzIHBlcnNwZWN0aXZlIGl0IHNlZW1zIHRvIG1lIHRoYXQgaXQgc2hvdWxkCj5iZSB0aGUg
Y2FsbGVyIHRvIHZhbGlkYXRlIGFwcGxpY2FiaWxpdHkgb2YgdGhlIHBhdGNoIGJlZm9yZSBjYWxs
aW5nCj5oZXJlLgoKTWF5YmUgd2UgY2FuIGp1c3QgcmVtb3ZlIHRoaXMgY2hlY2suIFRoZSBjaGVj
ayBpcyB0byBhdm9pZCBsb2FkaW5nIGFuCm9sZGVyIHVwZGF0ZSB0aGFuIHRoZSBjYWNoZWQgb25l
IChhbiBlcnJvciBpcyByZXR1cm5lZCBpZiBpdCBpcyB0aGUKY2FzZSkuIEJ1dCBhY3R1YWxseSwg
LT5hcHBseV9taWNyb2NvZGUoKSB3aWxsIGVuc3VyZSB0aGUgcHJvdmlkZWQKdXBkYXRlJ3MgcmV2
aXNpb24gaXMgbmV3ZXIgdGhhbiBjdXJyZW50IHVwZGF0ZSByZXZpc2lvbiBieSBjYWxsaW5nCm1h
dGNoX2NwdSgpLiBTbyBwcm9iYWJseSB0aGlzIGNoZWNrIGlzIHJlZHVuZGFudC4KClRoYW5rcwpD
aGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
