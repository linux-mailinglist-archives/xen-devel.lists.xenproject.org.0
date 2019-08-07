Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420D88467F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 09:58:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvGni-0005m6-11; Wed, 07 Aug 2019 07:56:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A3RO=WD=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hvGng-0005m1-4R
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 07:56:00 +0000
X-Inumbo-ID: c7a52e64-b8e8-11e9-90e8-97b83cc24440
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7a52e64-b8e8-11e9-90e8-97b83cc24440;
 Wed, 07 Aug 2019 07:55:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 00:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,356,1559545200"; d="scan'208";a="179404619"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga006.jf.intel.com with ESMTP; 07 Aug 2019 00:55:50 -0700
Date: Wed, 7 Aug 2019 15:59:58 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190807075957.GA23889@gao-cwp>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-17-git-send-email-chao.gao@intel.com>
 <8f6d506f-ee05-ab43-ef5f-8301f3845d4d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f6d506f-ee05-ab43-ef5f-8301f3845d4d@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v8 16/16] microcode: block #NMI handling
 when loading an ucode
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
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMTI6MTE6MDFQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAwMS4wOC4yMDE5IDEyOjIyLCBDaGFvIEdhbyB3cm90ZToKPj4gQEAgLTQzOSwxMiAr
NDQwLDM3IEBAIHN0YXRpYyBpbnQgZG9fbWljcm9jb2RlX3VwZGF0ZSh2b2lkICpwYXRjaCkKPj4g
ICAgICAgcmV0dXJuIHJldDsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgaW50IG1pY3JvY29kZV9u
bWlfY2FsbGJhY2soY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGludCBjcHUpCj4+
ICt7Cj4+ICsgICAgYm9vbCBwcmludCA9IGZhbHNlOwo+PiArCj4+ICsgICAgLyogVGhlIGZpcnN0
IHRocmVhZCBvZiBhIGNvcmUgaXMgdG8gbG9hZCBhbiB1cGRhdGUuIERvbid0IGJsb2NrIGl0LiAq
Lwo+PiArICAgIGlmICggY3B1ID09IGNwdW1hc2tfZmlyc3QocGVyX2NwdShjcHVfc2libGluZ19t
YXNrLCBjcHUpKSApCj4+ICsgICAgICAgIHJldHVybiAwOwo+PiArCj4+ICsgICAgaWYgKCBsb2Fk
aW5nX3N0YXRlID09IExPQURJTkdfRU5URVJFRCApCj4+ICsgICAgewo+PiArICAgICAgICBjcHVt
YXNrX3NldF9jcHUoY3B1LCAmY3B1X2NhbGxpbl9tYXApOwo+PiArICAgICAgICBwcmludGsoWEVO
TE9HX0RFQlVHICJDUFUldSBlbnRlcnMgJXNcbiIsIHNtcF9wcm9jZXNzb3JfaWQoKSwgX19mdW5j
X18pOwo+Cj5IZXJlICBhbmQgLi4uCj4KPj4gKyAgICAgICAgcHJpbnQgPSB0cnVlOwo+PiArICAg
IH0KPj4gKwo+PiArICAgIHdoaWxlICggbG9hZGluZ19zdGF0ZSA9PSBMT0FESU5HX0VOVEVSRUQg
KQo+PiArICAgICAgICByZXBfbm9wKCk7Cj4+ICsKPj4gKyAgICBpZiAoIHByaW50ICkKPj4gKyAg
ICAgICAgcHJpbnRrKFhFTkxPR19ERUJVRyAiQ1BVJXUgZXhpdHMgJXNcbiIsIHNtcF9wcm9jZXNz
b3JfaWQoKSwgX19mdW5jX18pOwo+Cj4uLi4gaGVyZSAtIHdoeSBzbXBfcHJvY2Vzc29yX2lkKCkg
d2hlbiB5b3UgY2FuIHVzZSAiY3B1Ij8gQW5kIHdoYXQKPnVzZSBpcyBfX2Z1bmNfXyBoZXJlPwo+
Cj5UaGUgcmVwX25vcCgpIGFib3ZlIGFsc28gcHJlc3VtYWJseSB3YW50cyB0byBiZSBjcHVfcmVs
YXgoKSBhZ2Fpbi4KPgo+QnV0IG9uIHRoZSB3aG9sZSBJIHdhcyByZWFsbHkgaG9waW5nIGZvciBt
b3JlIGFnZ3Jlc3NpdmUgZGlzYWJsaW5nCj5vZiBOTUkgaGFuZGxpbmcsIG1vcmUgbGlrZSAoYnV0
IG9mIGNvdXJzZSBub3QgcXVpdGUgYXMgaGVhdnkgYXMpCj50aGUgY3Jhc2ggcGF0aCB3aXJpbmcg
dGhlIElEVCBlbnRyeSB0byB0cmFwX25vcCgpLgoKSGkgSmFuLAoKSSBhZ3JlZSB3aXRoIHlvdSB0
aGF0IGl0IHNob3VsZCBiZSBtb3JlIGFnZ3Jlc3NpdmUuIFRoaXMgcGF0Y2ggaXMKcHJvYmxlbWF0
aWMgY29uc2lkZXJpbmcgdGhlcmUgaXMgYSBsb3Qgb2YgY29kZSBiZWZvcmUgcmVhY2hpbmcgdGhp
cwpjYWxsYmFjayAoZXNwZWNpYWxseSwgU1BFQ19DVFJMX0VOVFJZX0ZST01fSU5UUl9JU1Qgd2hp
Y2ggbWF5IHdyaXRlCk1TUl9TUEVDX0NUUkwpLgoKSW4gbXkgbWluZCwgd2UgaGF2ZSB0d28gb3B0
aW9ucyB0byBzb2x2ZSB0aGUgaXNzdWU6CjEuIFdpcmUgdGhlIElEVCBlbnRyeSB0byB0cmFwX25v
cCgpIGxpa2UgdGhlIGNyYXNoIHBhdGguCgoyLiBFbmhhbmNlIHRoaXMgcGF0Y2g6IEEgdGhyZWFk
IHdoaWNoIGlzIG5vdCBnb2luZyB0byBsb2FkIGFuIHVwZGF0ZQppcyBmb3JjZWQgdG8gc2VuZCBh
biAjTk1JIHRvIGl0c2VsZiB0byBlbnRlciB0aGUgY2FsbGJhY2ssIGRvCmJ1c3ktbG9vcCB1bnRp
bCBjb21wbGV0aW9uIG9mIGxvYWRpbmcgdWNvZGUgb24gYWxsIGNvcmVzLgpXaXRoIHRoaXMgbWV0
aG9kLCBubyAjTk1JIGRlbGl2ZXJ5LCBvciBNU1Igd3JpdGUgd291bGQgaGFwcGVuIG9uIHRoaXMK
dGhyZWFkcyBkdXJpbmcgbWljcm9jb2RlIHVwZGF0ZS4KClRoYW5rcwpDaGFvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
