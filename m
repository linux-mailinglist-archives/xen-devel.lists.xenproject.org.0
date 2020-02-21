Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FC916810C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:02:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59mM-0005O4-FZ; Fri, 21 Feb 2020 14:59:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j59mL-0005No-1Q
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:59:45 +0000
X-Inumbo-ID: cb54a6d4-54ba-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb54a6d4-54ba-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 14:59:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9A91EADB3;
 Fri, 21 Feb 2020 14:59:43 +0000 (UTC)
To: "Xia, Hongyan" <hongyxia@amazon.com>
References: <4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com>
 <20200221115017.tuo2i5db5mhd5yyt@debian>
 <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
 <c373d061-4a1d-502b-98a3-d40ffa11ba47@suse.com>
 <bf3284ac2e2a5a95d9a32b742108c553c6d09a02.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <166ce48a-69bd-8758-8742-332a46065040@suse.com>
Date: Fri, 21 Feb 2020 15:59:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bf3284ac2e2a5a95d9a32b742108c553c6d09a02.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxNTo1MiwgWGlhLCBIb25neWFuIHdyb3RlOgo+IE9uIEZyaSwgMjAyMC0w
Mi0yMSBhdCAxNDozMSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjAyLjIwMjAg
MTM6NTIsIFhpYSwgSG9uZ3lhbiB3cm90ZToKPj4+IE9uIEZyaSwgMjAyMC0wMi0yMSBhdCAxMTo1
MCArMDAwMCwgV2VpIExpdSB3cm90ZToKPj4+PiBPbiBUaHUsIEZlYiAwNiwgMjAyMCBhdCAwNjo1
ODoyM1BNICswMDAwLCBIb25neWFuIFhpYSB3cm90ZToKPj4+Pj4gKyAgICBpZiAoIGhhc2htZm4g
IT0gbWZuICYmICF2Y2FjaGUtPnJlZmNudFtpZHhdICkKPj4+Pj4gKyAgICAgICAgX19jbGVhcl9i
aXQoaWR4LCB2Y2FjaGUtPmludXNlKTsKPj4+Pgo+Pj4+IEFsc28sIHBsZWFzZSBmbHVzaCB0aGUg
bGluZWFyIGFkZHJlc3MgaGVyZSBhbmQgdGhlIG90aGVyCj4+Pj4gX19jbGVhcl9iaXQKPj4+PiBs
b2NhdGlvbi4KPj4+Cj4+PiBJIGZsdXNoIHdoZW4gYSBuZXcgZW50cnkgaXMgdGFraW5nIGEgc2xv
dC4gWWVhaCwgaXQncyBwcm9iYWJseQo+Pj4gYmV0dGVyCj4+PiB0byBmbHVzaCBlYXJsaWVyIHdo
ZW5ldmVyIGEgc2xvdCBpcyBubyBsb25nZXIgaW4gdXNlLgo+Pgo+PiBRdWVzdGlvbiBpcyB3aGV0
aGVyIHN1Y2ggaW5kaXZpZHVhbCBmbHVzaGVzIGFyZW4ndCBhY3R1YWxseQo+PiBtb3JlIG92ZXJo
ZWFkIHRoYW4gYSBzaW5nbGUgZmx1c2ggY292ZXJpbmcgYWxsIHByZXZpb3VzbHkKPj4gdG9ybiBk
b3duIGVudHJpZXMsIGRvbmUgYXQgc3VpdGFibGUgcG9pbnRzIChzZWUgdGhlIHByZXNlbnQKPj4g
aW1wbGVtZW50YXRpb24pLgo+IAo+IFRoZXJlIGlzIGNlcnRhaW5seSByb29tIGZvciBpbXByb3Zl
bWVudC4gSSBhbSBjb25zaWRlcmluZyBmbHVzaGluZwo+IGVudHJpZXMgaW4gYmF0Y2hlcyB0byBy
ZWR1Y2UgdGhlIG92ZXJoZWFkLCBlLmcuLCBpbiBhIHNpbWlsYXIgd2F5IHRvCj4gdGhlIGN1cnJl
bnQgaW1wbGVtZW50YXRpb24gYXMgeW91IHNhaWQuCj4gCj4gSSB3YW50IHRvIGRlZmVyIHRoYXQg
dG8gYSBzZXBhcmF0ZSBwYXRjaCBiZWNhdXNlIHRoaXMgaXMgYWxyZWFkeSBhIGh1Z2UKPiBwYXRj
aC4gRnJvbSB0aGUgYmVuY2htYXJrcyBJIGhhdmUgZG9uZSBzbyBmYXIsIGl0IGRvZXMgbm90IGxv
b2sgbGlrZQo+IHRoaXMgaGFzIGFueSBub3RpY2VhYmxlIG92ZXJoZWFkIGFuZCBpdCBhbHJlYWR5
IGFsbGV2aWF0ZXMgdGhlIGxvY2sKPiBjb250ZW50aW9uLCBwbHVzIHRoaXMgaXMgY3VycmVudGx5
IHVzZWQgb25seSBpbiBhIGRlYnVnIGJ1aWxkLCBzbyBJCj4gd291bGQgbGlrZSB0byBkZWZlciB0
aGUgb3B0aW1pc2F0aW9uIGEgYml0LgoKVGhpcyBpcyBjZXJ0YWlubHkgYW4gYWNjZXB0YWJsZSBh
cHByb2FjaC4gIk9ubHkgdXNlZCBpbiBkZWJ1ZyBidWlsZHMiCmlzbid0IGFuIG92ZXJseSBoZWxw
ZnVsIGp1c3RpZmljYXRpb24gdGhvdWdoLCBhcyAoYSkgeW91IGFpbSB0byB1c2UKdGhpcyBpbiBy
ZWxlYXNlIGJ1aWxkcyBhbmQgKGIpIG9uIHN5c3RlbXMgd2l0aCBlbm91Z2ggUkFNIGl0IGFscmVh
ZHkKaXMgdXNlZCBpbiByZWxlYXNlIGJ1aWxkcy4gUGx1cyAoYykgaXQgaXMgZmFpcmx5IHNpbXBs
ZSB0byBtYWtlCnJlbGVhc2UgYnVpbGRzIGFsc28gdXNlIGl0IGluIGFsbCBjYXNlcywgYnkgZHJv
cHBpbmcgdGhlIHNob3J0Y3V0LgoKQWxvbmcgdGhlIGxpbmVzIG9mIHdoYXQgSSBzYWlkIGluIHRo
ZSBvdGhlciByZXBseSB0byBXZWkganVzdCBhIGZldwptaW51dGVzIGFnbyAtIGRldmlhdGlvbiBm
cm9tIHRoZSBwcmVzZW50IGltcGxlbWVudGF0aW9uIGFzc3VtcHRpb25zCm9yIGd1YXJhbnRlZXMg
bmVlZHMgYXQgbGVhc3QgY2FsbGluZyBvdXQgKGFuZCB5b3UgbWF5IGhhdmUgZG9uZSBzbywKSSBz
aW1wbHkgZGlkbid0IGdldCB0byBsb29rIGF0IHRoZSBwYXRjaCBpdHNlbGYgeWV0KS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
