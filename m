Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D369F10585C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 18:16:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXq1g-00077n-91; Thu, 21 Nov 2019 17:13:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXq1e-00077h-RW
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 17:13:50 +0000
X-Inumbo-ID: 47e587f8-0c82-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47e587f8-0c82-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 17:13:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87C6FB26C;
 Thu, 21 Nov 2019 17:13:47 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1574291155-26032-1-git-send-email-chao.gao@intel.com>
 <1574291155-26032-2-git-send-email-chao.gao@intel.com>
 <43845525-6a6d-3378-01a1-6e7902d3864a@suse.com>
 <20191121115114.GB2673@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <308c922b-54c5-929e-29b7-adccaefb412c@suse.com>
Date: Thu, 21 Nov 2019 18:13:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191121115114.GB2673@gao-cwp>
Content-Language: en-US
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxMjo1MSwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gVGh1LCBOb3YgMjEsIDIw
MTkgYXQgMTE6MjE6MTNBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjExLjIw
MTkgMDA6MDUsIENoYW8gR2FvIHdyb3RlOgo+Pj4gSWYgYSBjb3JlIHdpdGggYWxsIG9mIGl0cyB0
aHJlYWQgYmVpbmcgcGFya2VkLCBsYXRlIHVjb2RlIGxvYWRpbmcKPj4+IHdoaWNoIGN1cnJlbnRs
eSBvbmx5IGxvYWRzIHVjb2RlIG9uIG9ubGluZSB0aHJlYWRzIHdvdWxkIGxlYWQgdG8KPj4+IGRp
ZmZlcmluZyB1Y29kZSByZXZpc2lvbnMgaW4gdGhlIHN5c3RlbS4gSW4gZ2VuZXJhbCwga2VlcGlu
ZyB1Y29kZQo+Pj4gcmV2aXNpb24gY29uc2lzdGVudCB3b3VsZCBiZSBsZXNzIGVycm9yLXByb25l
LiBUbyB0aGlzIGVuZCwgaWYgdGhlcmUKPj4+IGlzIGEgcGFya2VkIHRocmVhZCBkb2Vzbid0IGhh
dmUgYW4gb25saW5lIHNpYmxpbmcgdGhyZWFkLCBsYXRlIHVjb2RlCj4+PiBsb2FkaW5nIGlzIHJl
amVjdGVkLgo+Pgo+PiBJJ20gY29uZnVzZWQuIEkgdGhvdWdodCB3ZSBoYWQgYWdyZWVkIHRoYXQg
dGhlIGxvbmcgdGVybSBzb2x1dGlvbgo+PiB3b3VsZCBiZSB0byBicmllZmx5IGJyaW5nIG9ubGlu
ZSBhIHRocmVhZCBvZiBjb3JlcyB3aXRoIGFsbCB0aGVpcgo+PiB0aHJlYWRzIHBhcmtlZC4KPiAK
PiBJIGRvbid0IHJlbWViZXIgdGhhdCB3ZSByZWFjaGVkIHN1Y2ggYW4gYWdncmVtZW50LiBCdXQg
aWYgaXQgaGFwcGVuZWQsCj4gSSBhbSByZWFsbHkgc29ycnkgZm9yIGZvcmdldGluZyBpdC4KPiAK
PiBBY3R1YWxseSwgSSB0aGluayBEb20wIGhhcyB0aGUgaW5mb3JtYXRpb24gKGNwdSB0b3BvbG9n
eSBhbmQgZWFjaCBjcHUncwo+IG9mZmxpbmUvb25saW5lIHN0YXR1cykgdG8gZGVjaWRlIGlmIHRo
ZXJlIGlzIGEgcGFya2VkIGNvcmUgb3Igbm90Lgo+IElNTywgcmVqZWN0aW5nIGxhdGUgbG9hZGlu
ZyBpbiB0aGlzIGNhc2UgaXMganVzdCBhIGRlZmVuc2UgY2hlY2suIERvbTAKPiBpcyBhYmxlIHRv
IGNvcnJlY3QgdGhlIHNpdHVhdGlvbiBieSBicmluZ2luZyB1cCBzb21lIGNwdXMuCgpEb20wIGNh
biBfZnVsbHlfIGJyaW5nIHVwIENQVXMsIGJ1dCBub3Qgd2l0aCB0aGUgaW50ZW50IG9mIF9qdXN0
XwpnZXR0aW5nIHRoZWlyIHVjb2RlIHVwZGF0ZWQuCgo+PiBXaGF0IHlvdSBkbyBoZXJlIHdhcyBt
ZWFudCB0byBiZSBhIHRlbXBvcmFyeSBzdGVwCj4+IG9ubHkgZm9yIDQuMTMsIGZvciB3aGljaCBp
dCBpcyB0b28gbGF0ZSBub3cgKHVubGVzcyBKw7xyZ2VuCj4+IGluZGljYXRlcyBvdGhlcndpc2Up
Lgo+Pgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4+PiArKysgYi94ZW4vYXJj
aC94ODYvbWljcm9jb2RlLmMKPj4+IEBAIC01ODQsNiArNTg0LDUxIEBAIHN0YXRpYyBpbnQgZG9f
bWljcm9jb2RlX3VwZGF0ZSh2b2lkICpwYXRjaCkKPj4+ICAgICAgcmV0dXJuIHJldDsKPj4+ICB9
Cj4+PiAgCj4+PiArc3RhdGljIHVuc2lnbmVkIGludCB1bmlxdWVfY29yZV9pZCh1bnNpZ25lZCBp
bnQgY3B1LCB1bnNpZ25lZCBpbnQgc29ja2V0X3NoaWZ0KQo+Pj4gK3sKPj4+ICsgICAgdW5zaWdu
ZWQgaW50IGNvcmVfaWQgPSBjcHVfdG9fY3UoY3B1KTsKPj4+ICsKPj4+ICsgICAgaWYgKCBjb3Jl
X2lkID09IElOVkFMSURfQ1VJRCApCj4+PiArICAgICAgICBjb3JlX2lkID0gY3B1X3RvX2NvcmUo
Y3B1KTsKPj4+ICsKPj4+ICsgICAgcmV0dXJuIChjcHVfdG9fc29ja2V0KGNwdSkgPDwgc29ja2V0
X3NoaWZ0KSArIGNvcmVfaWQ7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBpbnQgaGFzX3Bhcmtl
ZF9jb3JlKHZvaWQpCj4+PiArewo+Pj4gKyAgICBpbnQgcmV0Owo+Pj4gKyAgICB1bnNpZ25lZCBp
bnQgY3B1LCBtYXhfYml0cywgY29yZV93aWR0aDsKPj4+ICsgICAgdW5zaWduZWQgaW50IG1heF9z
b2NrZXRzID0gMSwgbWF4X2NvcmVzID0gMTsKPj4+ICsgICAgdW5zaWduZWQgbG9uZyAqYml0bWFw
Owo+Pj4gKwo+Pj4gKyAgICBpZiAoICFwYXJrX29mZmxpbmVfY3B1cyApCj4+PiArICAgICAgICBy
ZXR1cm4gMDsKPj4+ICsKPj4+ICsgICAgZm9yX2VhY2hfcGFya2VkX2NwdShjcHUpCj4+PiArICAg
IHsKPj4+ICsgICAgICAgIC8qIE5vdGUgdGhhdCBjcHVfdG9fc29ja2V0KCkgZ2V0IGFuIElEIHN0
YXJ0aW5nIGZyb20gMC4gKi8KPj4+ICsgICAgICAgIG1heF9zb2NrZXRzID0gbWF4KG1heF9zb2Nr
ZXRzLCBjcHVfdG9fc29ja2V0KGNwdSkgKyAxKTsKPj4+ICsgICAgICAgIG1heF9jb3JlcyA9IG1h
eChtYXhfY29yZXMsIGNwdV9kYXRhW2NwdV0ueDg2X21heF9jb3Jlcyk7Cj4+PiArICAgIH0KPj4+
ICsKPj4+ICsgICAgY29yZV93aWR0aCA9IGZscyhtYXhfY29yZXMpOwo+Pj4gKyAgICBtYXhfYml0
cyA9IG1heF9zb2NrZXRzIDw8IGNvcmVfd2lkdGg7Cj4+Cj4+IElzbid0IHRoaXMgb2ZmIGJ5IG9u
ZT8gSWYgbWF4X2NvcmVzIGlzIDEsIHlvdSBkb24ndCBuZWVkIHRvIHNoaWZ0Cj4+IG1heF9zb2Nr
ZXRzIChvciB0aGUgY3B1X3RvX3NvY2tldCgpIHZhbHVlIGluIHVuaXF1ZV9jb3JlX2lkKCkpIGF0
Cj4+IGFsbCwgZm9yIGV4YW1wbGUuCj4+Cj4+IFdpdGggdGhpcyBpbiBtaW5kLCBpbnN0ZWFkIG9m
IHRoZSBwYXJrX29mZmxpbmVfY3B1cyBjaGVjayBhdCB0aGUKPj4gdG9wIG9mIHRoZSBmdW5jdGlv
biwgd291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBjaGVjayBoZXJlIHdoZXRoZXIKPj4gbWF4X3Nv
Y2tldHMgYW5kIG1heF9jb3JlcyBhcmUgYm90aCBzdGlsbCAxLCBpbiB3aGljaCBjYXNlIGF0Cj4+
IGxlYXN0IG9uZSB0aHJlYWQgb2YgdGhlIG9ubHkgY29yZSBvZiB0aGUgb25seSBzb2NrZXQgaW4g
dGhlIHN5c3RlbQo+PiBpcyBvYnZpb3VzbHkgc3RpbGwgb25saW5lICh0aGUgb25lIHdlJ3JlIHJ1
bm5pbmcgb24pPwo+IAo+IEFncmVlLiBXaWxsIGZvbGxvdyB5b3VyIHN1Z2dlc3Rpb24uCgpBaXVp
IGl0J2xsIGJlIGNvcnJlY3QgYWdhaW4gb25seSBpZiB0aGUgcGFya2VkIG1hcCBnZXRzIGFsbG9j
YXRlZAp1bmNvbmRpdGlvbmFsbHkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
