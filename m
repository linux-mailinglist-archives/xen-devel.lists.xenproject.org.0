Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA9A36E61
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 10:20:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYnaR-0000jH-Du; Thu, 06 Jun 2019 08:17:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYnaQ-0000jC-De
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 08:17:26 +0000
X-Inumbo-ID: 82419082-8833-11e9-8128-27a42c1811ed
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82419082-8833-11e9-8128-27a42c1811ed;
 Thu, 06 Jun 2019 08:17:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 02:17:21 -0600
Message-Id: <5CF8CC0F0200007800235C8C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 02:17:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFBB020000780022CCC6@prv1-mh.provo.novell.com>
 <562b4893-82eb-2ae6-3945-f80fdcc8c7a8@citrix.com>
In-Reply-To: <562b4893-82eb-2ae6-3945-f80fdcc8c7a8@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/4] x86/IRQ: bail early from
 irq_guest_eoi_timer_fn() when nothing is in flight
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA2LjE5IGF0IDE5OjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDgvMDUvMjAxOSAxMzo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC0xMTMw
LDggKzExMzAsMTAgQEAgc3RhdGljIHZvaWQgaXJxX2d1ZXN0X2VvaV90aW1lcl9mbih2b2lkCj4+
ICAgICAgICAgIH0KPj4gICAgICB9Cj4+ICAKPj4gLSAgICBpZiAoIGFjdGlvbi0+aW5fZmxpZ2h0
ICE9IDAgKQo+PiAtICAgICAgICBnb3RvIG91dDsKPj4gKyAgICBpZiAoIGFjdGlvbi0+aW5fZmxp
Z2h0ICkKPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcKPj4gKyAgICAgICAgICAg
ICAgICJJUlElZDogJWQgaGFuZGxlcnMgc3RpbGwgaW4gZmxpZ2h0IGF0IGZvcmNlZCBFT0lcbiIs
Cj4+ICsgICAgICAgICAgICAgICBkZXNjLT5pcnEsIGFjdGlvbi0+aW5fZmxpZ2h0KTsKPiAKPiBB
RkFDSVQsIHRoaXMgY29uZGl0aW9uIGNhbiBiZSB0cmlnZ2VyZWQgYnkgYSBidWdneS9tYWxpY2lv
dXMgZ3Vlc3QsIGJ5Cj4gaXQgc2ltcGx5IGlnbm9yaW5nIG9yIG1hc2tpbmcgdGhlIGxpbmUgaW50
ZXJydXB0IGF0IHRoZSB2SU8tQVBJQy4KCkkgZG9uJ3QgdGhpbmsgaXQgY2FuLCBuby4gT3IgZWxz
ZSB0aGUgQVNTRVJUX1VOUkVBQ0hBQkxFKCkgYmVsb3cKaGVyZSB3b3VsZCBiZSBpbnZhbGlkIHRv
IGFkZC4KCj4gVGhlIG1lc3NhZ2Ugd291bGQgYmUgZmFyIG1vcmUgdXNlZnVsIGlmIGl0IGlkZW50
aWZpZWQgdGhlIGRvbWFpbiBpbgo+IHF1ZXN0aW9uLCB3aGljaCBsb29rcyBsaWtlIGl0IGNhbiBi
ZSBvYnRhaW5lZCBmcm9tIHRoZSBtaWRkbGUgb2YgdGhlIGxvb3AuCgpUaGF0IHZlcnkgbG9vcCBo
YXMganVzdCB0YWtlbiBjYXJlIG9mIGRlY3JlbWVudGluZyAtPmluX2ZsaWdodCBmb3IKYWxsIHN1
Y2ggZ3Vlc3RzLgoKQWxzbyBub3RlIHRoYXQgdGhlcmUgY291bGQgYmUgbW9yZSB0aGFuIG9uZSBv
ZmZlbmRpbmcgZG9tYWluLCBmb3IKc2hhcmVkIElSUXMuIFBsdXMgdGhlIGxvb3AgeW91J3JlIHJl
ZmVycmluZyB0byBjYW4gc3BlY2lmaWNhbGx5IF9ub3RfCmJlIHVzZWQgZm9yIGlkZW50aWZ5aW5n
IHRoZSBkb21haW4ocyksIGJlY2F1c2UgZm9yIHRoZSBvbmVzCnByb2Nlc3NlZCB0aGVyZSB3ZSBf
ZGlkXyBkZWNyZW1lbnQgLT5pbl9mbGlnaHQuIElmIHRoaXMgbWVzc2FnZQpnZXRzIGxvZ2dlZCwg
d2Ugc2ltcGx5IGhhdmUgbm8gaWRlYSB3aHkgLT5pbl9mbGlnaHQgaXMgX3N0aWxsXyBub24tCnpl
cm8uIFRoaXMgY291bGQgYmUgYSBCVUdfT04oKSwgYnV0IGl0IHNlZW1zIG1vcmUgaW4gbGluZSB3
aXRoIG91cgpnZW5lcmFsIGlkZWEgb2YgaG93IHdlIHdvdWxkIGxpa2UgdG8gZGVhbCB3aXRoIHN1
Y2ggY2FzZXMgdG8gdHJ5CmFuZCBrZWVwIHRoZSBzeXN0ZW0gcnVubmluZyBoZXJlIGluIHJlbGVh
c2UgYnVpbGRzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
