Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D811051AC
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 12:49:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXkvh-0002zu-D5; Thu, 21 Nov 2019 11:47:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bc0+=ZN=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iXkvf-0002zp-Ua
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 11:47:19 +0000
X-Inumbo-ID: aa576cea-0c54-11ea-b678-bc764e2007e4
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa576cea-0c54-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 11:47:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 03:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="238147362"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2019 03:47:13 -0800
Date: Thu, 21 Nov 2019 19:51:14 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191121115114.GB2673@gao-cwp>
References: <1574291155-26032-1-git-send-email-chao.gao@intel.com>
 <1574291155-26032-2-git-send-email-chao.gao@intel.com>
 <43845525-6a6d-3378-01a1-6e7902d3864a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43845525-6a6d-3378-01a1-6e7902d3864a@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v1 2/2] microcode: reject late ucode loading
 if any core is parked
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTE6MjE6MTNBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAyMS4xMS4yMDE5IDAwOjA1LCBDaGFvIEdhbyB3cm90ZToKPj4gSWYgYSBjb3JlIHdp
dGggYWxsIG9mIGl0cyB0aHJlYWQgYmVpbmcgcGFya2VkLCBsYXRlIHVjb2RlIGxvYWRpbmcKPj4g
d2hpY2ggY3VycmVudGx5IG9ubHkgbG9hZHMgdWNvZGUgb24gb25saW5lIHRocmVhZHMgd291bGQg
bGVhZCB0bwo+PiBkaWZmZXJpbmcgdWNvZGUgcmV2aXNpb25zIGluIHRoZSBzeXN0ZW0uIEluIGdl
bmVyYWwsIGtlZXBpbmcgdWNvZGUKPj4gcmV2aXNpb24gY29uc2lzdGVudCB3b3VsZCBiZSBsZXNz
IGVycm9yLXByb25lLiBUbyB0aGlzIGVuZCwgaWYgdGhlcmUKPj4gaXMgYSBwYXJrZWQgdGhyZWFk
IGRvZXNuJ3QgaGF2ZSBhbiBvbmxpbmUgc2libGluZyB0aHJlYWQsIGxhdGUgdWNvZGUKPj4gbG9h
ZGluZyBpcyByZWplY3RlZC4KPgo+SSdtIGNvbmZ1c2VkLiBJIHRob3VnaHQgd2UgaGFkIGFncmVl
ZCB0aGF0IHRoZSBsb25nIHRlcm0gc29sdXRpb24KPndvdWxkIGJlIHRvIGJyaWVmbHkgYnJpbmcg
b25saW5lIGEgdGhyZWFkIG9mIGNvcmVzIHdpdGggYWxsIHRoZWlyCj50aHJlYWRzIHBhcmtlZC4K
CkkgZG9uJ3QgcmVtZWJlciB0aGF0IHdlIHJlYWNoZWQgc3VjaCBhbiBhZ2dyZW1lbnQuIEJ1dCBp
ZiBpdCBoYXBwZW5lZCwKSSBhbSByZWFsbHkgc29ycnkgZm9yIGZvcmdldGluZyBpdC4KCkFjdHVh
bGx5LCBJIHRoaW5rIERvbTAgaGFzIHRoZSBpbmZvcm1hdGlvbiAoY3B1IHRvcG9sb2d5IGFuZCBl
YWNoIGNwdSdzCm9mZmxpbmUvb25saW5lIHN0YXR1cykgdG8gZGVjaWRlIGlmIHRoZXJlIGlzIGEg
cGFya2VkIGNvcmUgb3Igbm90LgpJTU8sIHJlamVjdGluZyBsYXRlIGxvYWRpbmcgaW4gdGhpcyBj
YXNlIGlzIGp1c3QgYSBkZWZlbnNlIGNoZWNrLiBEb20wCmlzIGFibGUgdG8gY29ycmVjdCB0aGUg
c2l0dWF0aW9uIGJ5IGJyaW5naW5nIHVwIHNvbWUgY3B1cy4KCj5XaGF0IHlvdSBkbyBoZXJlIHdh
cyBtZWFudCB0byBiZSBhIHRlbXBvcmFyeSBzdGVwCj5vbmx5IGZvciA0LjEzLCBmb3Igd2hpY2gg
aXQgaXMgdG9vIGxhdGUgbm93ICh1bmxlc3MgSsO8cmdlbgo+aW5kaWNhdGVzIG90aGVyd2lzZSku
Cj4KPj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9taWNyb2NvZGUuYwo+PiBAQCAtNTg0LDYgKzU4NCw1MSBAQCBzdGF0aWMgaW50IGRvX21pY3Jv
Y29kZV91cGRhdGUodm9pZCAqcGF0Y2gpCj4+ICAgICAgcmV0dXJuIHJldDsKPj4gIH0KPj4gIAo+
PiArc3RhdGljIHVuc2lnbmVkIGludCB1bmlxdWVfY29yZV9pZCh1bnNpZ25lZCBpbnQgY3B1LCB1
bnNpZ25lZCBpbnQgc29ja2V0X3NoaWZ0KQo+PiArewo+PiArICAgIHVuc2lnbmVkIGludCBjb3Jl
X2lkID0gY3B1X3RvX2N1KGNwdSk7Cj4+ICsKPj4gKyAgICBpZiAoIGNvcmVfaWQgPT0gSU5WQUxJ
RF9DVUlEICkKPj4gKyAgICAgICAgY29yZV9pZCA9IGNwdV90b19jb3JlKGNwdSk7Cj4+ICsKPj4g
KyAgICByZXR1cm4gKGNwdV90b19zb2NrZXQoY3B1KSA8PCBzb2NrZXRfc2hpZnQpICsgY29yZV9p
ZDsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBoYXNfcGFya2VkX2NvcmUodm9pZCkKPj4gK3sK
Pj4gKyAgICBpbnQgcmV0Owo+PiArICAgIHVuc2lnbmVkIGludCBjcHUsIG1heF9iaXRzLCBjb3Jl
X3dpZHRoOwo+PiArICAgIHVuc2lnbmVkIGludCBtYXhfc29ja2V0cyA9IDEsIG1heF9jb3JlcyA9
IDE7Cj4+ICsgICAgdW5zaWduZWQgbG9uZyAqYml0bWFwOwo+PiArCj4+ICsgICAgaWYgKCAhcGFy
a19vZmZsaW5lX2NwdXMgKQo+PiArICAgICAgICByZXR1cm4gMDsKPj4gKwo+PiArICAgIGZvcl9l
YWNoX3BhcmtlZF9jcHUoY3B1KQo+PiArICAgIHsKPj4gKyAgICAgICAgLyogTm90ZSB0aGF0IGNw
dV90b19zb2NrZXQoKSBnZXQgYW4gSUQgc3RhcnRpbmcgZnJvbSAwLiAqLwo+PiArICAgICAgICBt
YXhfc29ja2V0cyA9IG1heChtYXhfc29ja2V0cywgY3B1X3RvX3NvY2tldChjcHUpICsgMSk7Cj4+
ICsgICAgICAgIG1heF9jb3JlcyA9IG1heChtYXhfY29yZXMsIGNwdV9kYXRhW2NwdV0ueDg2X21h
eF9jb3Jlcyk7Cj4+ICsgICAgfQo+PiArCj4+ICsgICAgY29yZV93aWR0aCA9IGZscyhtYXhfY29y
ZXMpOwo+PiArICAgIG1heF9iaXRzID0gbWF4X3NvY2tldHMgPDwgY29yZV93aWR0aDsKPgo+SXNu
J3QgdGhpcyBvZmYgYnkgb25lPyBJZiBtYXhfY29yZXMgaXMgMSwgeW91IGRvbid0IG5lZWQgdG8g
c2hpZnQKPm1heF9zb2NrZXRzIChvciB0aGUgY3B1X3RvX3NvY2tldCgpIHZhbHVlIGluIHVuaXF1
ZV9jb3JlX2lkKCkpIGF0Cj5hbGwsIGZvciBleGFtcGxlLgo+Cj5XaXRoIHRoaXMgaW4gbWluZCwg
aW5zdGVhZCBvZiB0aGUgcGFya19vZmZsaW5lX2NwdXMgY2hlY2sgYXQgdGhlCj50b3Agb2YgdGhl
IGZ1bmN0aW9uLCB3b3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRvIGNoZWNrIGhlcmUgd2hldGhlcgo+
bWF4X3NvY2tldHMgYW5kIG1heF9jb3JlcyBhcmUgYm90aCBzdGlsbCAxLCBpbiB3aGljaCBjYXNl
IGF0Cj5sZWFzdCBvbmUgdGhyZWFkIG9mIHRoZSBvbmx5IGNvcmUgb2YgdGhlIG9ubHkgc29ja2V0
IGluIHRoZSBzeXN0ZW0KPmlzIG9idmlvdXNseSBzdGlsbCBvbmxpbmUgKHRoZSBvbmUgd2UncmUg
cnVubmluZyBvbik/CgpBZ3JlZS4gV2lsbCBmb2xsb3cgeW91ciBzdWdnZXN0aW9uLgoKVGhhbmtz
CkNoYW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
