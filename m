Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFF14511
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 09:19:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXr5-0000Lp-B3; Mon, 06 May 2019 07:16:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNXr3-0000Lk-JO
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 07:16:05 +0000
X-Inumbo-ID: ce8389bf-6fce-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ce8389bf-6fce-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 07:16:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 01:16:02 -0600
Message-Id: <5CCFDF2F020000780022C08C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 01:15:59 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC71ADE020000780022A1B7@prv1-mh.provo.novell.com>
 <20190503091905.2levs75dxln4rhiw@Air-de-Roger>
 <5CCC4BDD020000780022BA05@prv1-mh.provo.novell.com>
In-Reply-To: <5CCC4BDD020000780022BA05@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v1b 1/9] x86/IRQ: deal with move-in-progress
 state in fixup_irqs()
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA1LjE5IGF0IDE2OjEwLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDAzLjA1LjE5IGF0IDExOjE5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiBP
biBNb24sIEFwciAyOSwgMjAxOSBhdCAwOTo0MDoxNEFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+IC0tLSB1bnN0YWJsZS5vcmlnL3hlbi9hcmNoL3g4Ni9pcnEuYwkKPj4+ICsrKyB1bnN0
YWJsZS94ZW4vYXJjaC94ODYvaXJxLmMKPj4+IEBAIC0yNDIsNiArMjQyLDIwIEBAIHZvaWQgZGVz
dHJveV9pcnEodW5zaWduZWQgaW50IGlycSkKPj4+ICAgICAgeGZyZWUoYWN0aW9uKTsKPj4+ICB9
Cj4+PiAgCj4+PiArc3RhdGljIHZvaWQgcmVsZWFzZV9vbGRfdmVjKHN0cnVjdCBpcnFfZGVzYyAq
ZGVzYykKPj4+ICt7Cj4+PiArICAgIHVuc2lnbmVkIGludCB2ZWN0b3IgPSBkZXNjLT5hcmNoLm9s
ZF92ZWN0b3I7Cj4+PiArCj4+PiArICAgIGRlc2MtPmFyY2gub2xkX3ZlY3RvciA9IElSUV9WRUNU
T1JfVU5BU1NJR05FRDsKPj4+ICsgICAgY3B1bWFza19jbGVhcihkZXNjLT5hcmNoLm9sZF9jcHVf
bWFzayk7Cj4+PiArCj4+PiArICAgIGlmICggZGVzYy0+YXJjaC51c2VkX3ZlY3RvcnMgKQo+PiAK
Pj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGNsZWFuIHRoZSBiaXRtYXAgd2hlbiB2ZWN0b3Ig
IT0KPj4gSVJRX1ZFQ1RPUl9VTkFTU0lHTkVEPwo+IAo+IE5vIGNvZGUgcGF0aCBkb2VzIC8gc2hv
dWxkIGNhbGwgaW50byBoZXJlIHdpdGhvdXQgdGhlIG5lZWQgdG8KPiBhY3R1YWxseSByZWxlYXNl
IHRoZSBwcmV2aW91cyB2ZWN0b3IuCj4gCj4+IEkgaGF2ZW4ndCBjaGVja2VkIGFsbCB0aGUgY2Fs
bGVycywgYnV0IEkgZG9uJ3QgdGhpbmsgaXQncyB2YWxpZCB0bwo+PiBjYWxsIHJlbGVhc2Vfb2xk
X3ZlYyB3aXRoIGRlc2MtPmFyY2gub2xkX3ZlY3RvciA9PQo+PiBJUlFfVkVDVE9SX1VOQVNTSUdO
RUQsIGluIHdoaWNoIGNhc2UgSSB3b3VsZCBhZGQgYW4gQVNTRVJULgo+IAo+IFdlbGwsIHllcywg
SSBwcm9iYWJseSBjb3VsZC4gSG93ZXZlciwgYXMgbXVjaCBhcyBJJ20gaW4KPiBmYXZvciBvZiBB
U1NFUlQoKXMsIEkgZG9uJ3QgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gQVNTRVJUKCkKPiBiYXNp
Y2FsbHkgZXZlcnkgYml0IG9mIGV4cGVjdGVkIHN0YXRlLiBJbiB0aGUgZW5kIHRoZXJlIHdvdWxk
Cj4gb3RoZXJ3aXNlIGJlIG1vcmUgQVNTRVJUKClzIHRoYW4gYWN0dWFsIGNvZGUuCgpBY3R1YWxs
eSwgdXBvbiBzZWNvbmQgdGhvdWdodCAtIGxldCBtZSBhZGQgdGhpcywgYnV0IHRoZW4gaW4gYW4K
ZXZlbiBtb3JlIHN0cmljdCBmb3JtOiBDZXJ0YWluIHZlcnkgbG93IGFuZCB2ZXJ5IGhpZ2ggbnVt
YmVyZWQKdmVjdG9ycyBhcmUgaWxsZWdhbCBoZXJlIGFzIHdlbGwsIGFuZCB3ZSBtYXkgdGhlbiBi
ZSBhYmxlIHRvIHVzZQp0aGUgc2FtZSB2YWxpZGF0aW9uIGhlbHBlciBlbHNld2hlcmUgKGluIHBh
cnRpY3VsYXIgYWxzbyBmb3IgdGhlCmNoZWNrIHRoYXQgeW91J3ZlIGZvdW5kIHRvIGJlIHdyb25n
IGluIF9jbGVhcl9pcnFfdmVjdG9yKCkpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
