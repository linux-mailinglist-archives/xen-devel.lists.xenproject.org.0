Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CC552888
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 11:47:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfi0a-0003GW-Ib; Tue, 25 Jun 2019 09:45:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfi0Z-0003GR-Eb
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 09:44:59 +0000
X-Inumbo-ID: e4daef05-972d-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e4daef05-972d-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 09:44:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 03:44:57 -0600
Message-Id: <5D11ED15020000780023ADFE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 03:44:53 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190624180128.5328-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190624180128.5328-1-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] page-alloc: Clamp get_free_buddy() to
 online nodes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA2LjE5IGF0IDIwOjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBwYXRjaCBoaWRlcyB0aGUgaXNzdWUgaWRlbnRpZmllZCBpbiB0aGUgIlVCU0FO
IHJlcG9ydCBpbiBmaW5kX25leHRfYml0KCkiCj4gc28gcHJvYmFibHkgZG9lc24ndCB3YW50IGFw
cGx5aW5nIHVudGlsIHRoYXQgaXMgcmVzb2x2ZWQuCgpJdCBkb2VzIHNvIG9uIHN5c3RlbXMgd2l0
aCBsZXNzIHRoYW4gNjQgbm9kZXMsIGFmYWljdC4KCj4gQSBsb3dlciBvdmVyaGVhZCBvcHRpb24g
d291bGQgYmUgdG8gZG86Cj4gCj4gbm9kZXNfYW5kKG5vZGVtYXNrLCBub2RlX29ubGluZV9tYXAs
IGQgPyBkLT5ub2RlX2FmZmluaXR5IDogbm9kZV9vbmxpbmVfbWFwKTsKPiAKPiBob3dldmVyIHRo
aXMgZG9lc24ndCB3b3JrIGJlY2F1c2UgdGhlIG5vZGVzZXRfdCBBUEkgaGFzIGEgaGlkZGVuICYo
cGFyYW0pCj4gdGhyb3VnaG91dCB0aGUgQVBJLiAgSSd2ZSBnb3QgaGFsZiBhIG1pbmQgdG8gdW5k
byB0aGlzIG5vbnNlbnNlIGFuZCBoYXZlCj4gbm9kZW1hc2tfdCB3b3JrIGluIGV4YWN0bHkgdGhl
IHNhbWUgd2F5IGFzIGNwdW1hc2tfdC4KClJpZ2h0LCB3ZSBzaG91bGQgZG8gc3VjaCBhIHRyYW5z
Zm9ybWF0aW9uIGV2ZW50dWFsbHkuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9ub2RlbWFzay5o
Cj4gKysrIGIveGVuL2luY2x1ZGUveGVuL25vZGVtYXNrLmgKPiBAQCAtMTg5LDYgKzE4OSwxMiBA
QCBzdGF0aWMgaW5saW5lIGludCBfX25vZGVzX3dlaWdodChjb25zdCBub2RlbWFza190ICpzcmNw
LCBpbnQgbmJpdHMpCj4gIAlyZXR1cm4gYml0bWFwX3dlaWdodChzcmNwLT5iaXRzLCBuYml0cyk7
Cj4gIH0KPiAgCj4gKyNkZWZpbmUgbm9kZXNfY29weShkc3QsIHNyYykgX19ub2Rlc19jb3B5KCYo
ZHN0KSwgJihzcmMpKQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19ub2Rlc19jb3B5KG5vZGVtYXNr
X3QgKmRzdCwgbm9kZW1hc2tfdCAqc3JjKQo+ICt7Cj4gKwlyZXR1cm4gYml0bWFwX2NvcHkoZHN0
LT5iaXRzLCBzcmMtPmJpdHMsIE1BWF9OVU1OT0RFUyk7Cj4gK30KClJhdGhlciB0aGFuIGludHJv
ZHVjaW5nIHRoaXMsIEkgdGhpbmsgc3RydWN0dXJlIGFzc2lnbm1lbnQgaXMgbWVhbnQKdG8gYmUg
dXNlZCAoYXMgd2FzIHRoZSBjYXNlIHByaW9yIHRvIHlvdXIgY2hhbmdlKS4gQnV0IGlmIHlvdSBy
ZWFsbHkKZmVlbCBsaWtlIGludHJvZHVjaW5nIHRoaXMsIHRoZW4gcGxlYXNlIGNvbnN0aWZ5ICJz
cmMiLiBXaXRoIGVpdGhlcgphZGp1c3RtZW50IG1hZGUsClJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
