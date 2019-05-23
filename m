Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9075227994
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 11:45:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTkE9-0000Q9-4a; Thu, 23 May 2019 09:41:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTkE7-0000Q4-CL
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 09:41:31 +0000
X-Inumbo-ID: eed0ab66-7d3e-11e9-b105-93515ff934bf
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eed0ab66-7d3e-11e9-b105-93515ff934bf;
 Thu, 23 May 2019 09:41:26 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 03:41:25 -0600
Message-Id: <5CE66AC302000078002319E6@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 03:41:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190522164530.33147-1-roger.pau@citrix.com>
In-Reply-To: <20190522164530.33147-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2] x86: fix alternative_callN usage of
 ALTERNATIVE asm macro
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIyLjA1LjE5IGF0IDE4OjQ1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IGFsdGVybmF0aXZlX2NhbGxOIHVzaW5nIGlubGluZSBhc3NlbWJseSB0byBnZW5lcmF0ZSB0aGUg
YWx0ZXJuYXRpdmUKPiBwYXRjaCBzaXRlcyBzaG91bGQgYmUgdXNpbmcgdGhlIEFMVEVSTkFUSVZF
IEMgcHJlcHJvY2Vzc29yIG1hY3JvCj4gcmF0aGVyIHRoYW4gdGhlIEFMVEVSTkFUSVZFIGFzc2Vt
Ymx5IG1hY3JvLAoKV2h5PyBTZWUgSU5ESVJFQ1Rfe0NBTEwsSk1QfS4gTXkgZ29hbCwgYXMgc2Fp
ZCBvbiBpcmMsIHdvdWxkIGJlCnRvIGV2ZW50dWFsbHkgZWxpbWluYXRlIHRoZSByZWR1bmRhbnQg
QyBtYWNyb3MsIGluIGZhdm9yIG9mIGp1c3QgdXNpbmcKdGhlIGFzc2VtYmxlciBvbmVzLgoKPiB0
aGUgbW9yZSB0aGF0IHVzaW5nIHRoZQo+IGFzc2VtYmx5IG1hY3JvIGluIGFuIGlubGluZSBhc3Nl
bWJseSBpbnN0YW5jZSBjYXVzZXMgdGhlIGZvbGxvd2luZwo+IGVycm9yIG9uIGxsdm0gYmFzZWQg
dG9vbGNoYWluczoKPiAKPiA8aW5zdGFudGlhdGlvbj46MToxOiBlcnJvcjogaW52YWxpZCBzeW1i
b2wgcmVkZWZpbml0aW9uCj4gLkwwX29yaWdfczogY2FsbCAqZ2VuYXBpYys2NCglcmlwKTsgLkww
X29yaWdfZTogLkwwX2RpZmYgPSAoLkwwX3JlcGxfZTEgLSAKPiAuTDBfcmVwbF9zMSkgLSAoLi4u
CgpUaGUgdW5kZXJzdGFuZGluZyBJIGdldCBpcyB0aGF0IGNsYW5nIGRvZXNuJ3QgcHJvcGVybHkg
c3VwcG9ydCB0aGUKXEAgY29uc3RydWN0LCBleHBhbmRpbmcgaXQgdG8gemVybyBldmVyeSB0aW1l
LiBUaGF0J3MgYSBjbGFuZyBidWcKaW1vLCBhbmQgaGVuY2UgdGhlIHdvcmRpbmcgaGVyZSBzaG91
bGQgcmVmbGVjdCB0aGlzLCByYXRoZXIgdGhhbgpzdWdnZXN0aW5nIHRoZSBjb2RlIGlzIGJyb2tl
bi4gKEkgc2VlbSB0byB2YWd1ZWx5IHJlY2FsbCBhbiBpc3N1ZQp3aXRoIGNsYW5nIGluc3RhbnRp
YXRpbmcgYSBuZXcgYXNzZW1ibHkgZW52aXJvbm1lbnQgZXZlcnkgdGltZQppdCBlbmNvdW50ZXJz
IGFuIGFzbSgpLikgV2l0aG91dCBjbGFuZyBmaXhlZCwgYW5kIHdpdGggdXMgd2FudGluZwp0byBi
ZSBhYmxlIHRvIGNvbnRpbnVlIHRvIGJ1aWxkIHdpdGggY2xhbmcsIHRoaXMgdGhlbiB2b2lkcyB0
aGUgZW50aXJlCnB1cnBvc2Ugb2YgZjg1MDYxOTY5MiAoIng4Ni9hbHRlcm5hdGl2ZXM6IGFsbG93
IHVzaW5nIGFzc2VtYmxlcgptYWNyb3MgaW4gZmF2b3Igb2YgQyBvbmVzIiksIHdoaWNoIGlyYyB3
YXMgb3JpZ2luYWxseSBwYXJ0IG9mIHRoZQpzZXJpZXMsIGJ1dCB3ZW50IGluIG11Y2ggYWhlYWQg
b2YgaXQuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYWx0ZXJuYXRpdmUuaAo+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvYWx0ZXJuYXRpdmUuaAo+IEBAIC0yMDIsOSArMjAyLDggQEAg
ZXh0ZXJuIHZvaWQgYWx0ZXJuYXRpdmVfYnJhbmNoZXModm9pZCk7Cj4gICAgICByZXR0eXBlIHJl
dF87ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
ICAgICByZWdpc3RlciB1bnNpZ25lZCBsb25nIHIxMF8gYXNtKCJyMTAiKTsgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gICAgICByZWdpc3RlciB1bnNpZ25lZCBsb25nIHIxMV8gYXNtKCJyMTEi
KTsgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICBhc20gdm9sYXRpbGUgKF9fc3RyaW5n
aWZ5KEFMVEVSTkFUSVZFICJjYWxsIColY1thZGRyXSglJXJpcCkiLCBcCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjYWxsIC4iLCAgICAgICAgICAgICAgICBc
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFg4Nl9GRUFUVVJF
X0FMV0FZUykgICAgICBcCj4gKyAgICBhc20gdm9sYXRpbGUgKEFMVEVSTkFUSVZFKCJjYWxsICol
Y1thZGRyXSglJXJpcCkiLCAiY2FsbCAuIiwgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFg4Nl9GRUFUVVJFX0FMV0FZUykgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAg
ICAgICAgICAgIDogQUxUX0NBTEwgIyMgbiAjIyBfT1VULCAiPWEiIChyZXRfKSwgICAgICAgICAg
ICBcCj4gICAgICAgICAgICAgICAgICAgICAgIj1yIiAocjEwXyksICI9ciIgKHIxMV8pIEFTTV9D
QUxMX0NPTlNUUkFJTlQgICBcCj4gICAgICAgICAgICAgICAgICAgIDogW2FkZHJdICJpIiAoJihm
dW5jKSksICJnIiAoZnVuYykgICAgICAgICAgICAgICBcCgpPa2F5LCBsdWNraWx5IHRoZSBjb2Rl
IGNoYW5nZSBpdHNlbGYgaXMgc2ltcGxlIGVub3VnaCwgc28gaXQgcmVhbGx5Cndhc24ndCB0aGF0
IEkgaGFkIHRvIHVzZSB0aGUgdmFyaWFudCB1c2VkIHRvIG1ha2UgdGhpbmdzIHdvcmsgYXQKYWxs
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
