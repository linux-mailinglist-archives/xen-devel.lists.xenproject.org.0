Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B40214ECC
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 17:05:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNf6l-0004CM-VA; Mon, 06 May 2019 15:00:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNf6k-0004CH-DJ
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:00:46 +0000
X-Inumbo-ID: b978e09f-700f-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b978e09f-700f-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 15:00:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 09:00:44 -0600
Message-Id: <5CD04C14020000780022C3AD@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 09:00:36 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC71ADE020000780022A1B7@prv1-mh.provo.novell.com>
 <20190503091905.2levs75dxln4rhiw@Air-de-Roger>
 <5CCC4BDD020000780022BA05@prv1-mh.provo.novell.com>
 <5CCFDF2F020000780022C08C@prv1-mh.provo.novell.com>
 <20190506142824.jalqoeyz5ynucd2z@Air-de-Roger>
In-Reply-To: <20190506142824.jalqoeyz5ynucd2z@Air-de-Roger>
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

Pj4+IE9uIDA2LjA1LjE5IGF0IDE2OjI4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgTWF5IDA2LCAyMDE5IGF0IDAxOjE1OjU5QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDMuMDUuMTkgYXQgMTY6MTAsIDxKQmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6Cj4+ID4+Pj4gT24gMDMuMDUuMTkgYXQgMTE6MTksIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4+IE9uIE1vbiwgQXByIDI5LCAyMDE5IGF0IDA5OjQwOjE0QU0gLTA2MDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+PiA+Pj4gLS0tIHVuc3RhYmxlLm9yaWcveGVuL2FyY2gveDg2L2ly
cS5jCQo+PiA+Pj4gKysrIHVuc3RhYmxlL3hlbi9hcmNoL3g4Ni9pcnEuYwo+PiA+Pj4gQEAgLTI0
Miw2ICsyNDIsMjAgQEAgdm9pZCBkZXN0cm95X2lycSh1bnNpZ25lZCBpbnQgaXJxKQo+PiA+Pj4g
ICAgICB4ZnJlZShhY3Rpb24pOwo+PiA+Pj4gIH0KPj4gPj4+ICAKPj4gPj4+ICtzdGF0aWMgdm9p
ZCByZWxlYXNlX29sZF92ZWMoc3RydWN0IGlycV9kZXNjICpkZXNjKQo+PiA+Pj4gK3sKPj4gPj4+
ICsgICAgdW5zaWduZWQgaW50IHZlY3RvciA9IGRlc2MtPmFyY2gub2xkX3ZlY3RvcjsKPj4gPj4+
ICsKPj4gPj4+ICsgICAgZGVzYy0+YXJjaC5vbGRfdmVjdG9yID0gSVJRX1ZFQ1RPUl9VTkFTU0lH
TkVEOwo+PiA+Pj4gKyAgICBjcHVtYXNrX2NsZWFyKGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrKTsK
Pj4gPj4+ICsKPj4gPj4+ICsgICAgaWYgKCBkZXNjLT5hcmNoLnVzZWRfdmVjdG9ycyApCj4+ID4+
IAo+PiA+PiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gY2xlYW4gdGhlIGJpdG1hcCB3aGVuIHZl
Y3RvciAhPQo+PiA+PiBJUlFfVkVDVE9SX1VOQVNTSUdORUQ/Cj4+ID4gCj4+ID4gTm8gY29kZSBw
YXRoIGRvZXMgLyBzaG91bGQgY2FsbCBpbnRvIGhlcmUgd2l0aG91dCB0aGUgbmVlZCB0bwo+PiA+
IGFjdHVhbGx5IHJlbGVhc2UgdGhlIHByZXZpb3VzIHZlY3Rvci4KPj4gPiAKPj4gPj4gSSBoYXZl
bid0IGNoZWNrZWQgYWxsIHRoZSBjYWxsZXJzLCBidXQgSSBkb24ndCB0aGluayBpdCdzIHZhbGlk
IHRvCj4+ID4+IGNhbGwgcmVsZWFzZV9vbGRfdmVjIHdpdGggZGVzYy0+YXJjaC5vbGRfdmVjdG9y
ID09Cj4+ID4+IElSUV9WRUNUT1JfVU5BU1NJR05FRCwgaW4gd2hpY2ggY2FzZSBJIHdvdWxkIGFk
ZCBhbiBBU1NFUlQuCj4+ID4gCj4+ID4gV2VsbCwgeWVzLCBJIHByb2JhYmx5IGNvdWxkLiBIb3dl
dmVyLCBhcyBtdWNoIGFzIEknbSBpbgo+PiA+IGZhdm9yIG9mIEFTU0VSVCgpcywgSSBkb24ndCB0
aGluayBpdCBtYWtlcyBzZW5zZSB0byBBU1NFUlQoKQo+PiA+IGJhc2ljYWxseSBldmVyeSBiaXQg
b2YgZXhwZWN0ZWQgc3RhdGUuIEluIHRoZSBlbmQgdGhlcmUgd291bGQKPj4gPiBvdGhlcndpc2Ug
YmUgbW9yZSBBU1NFUlQoKXMgdGhhbiBhY3R1YWwgY29kZS4KPj4gCj4+IEFjdHVhbGx5LCB1cG9u
IHNlY29uZCB0aG91Z2h0IC0gbGV0IG1lIGFkZCB0aGlzLCBidXQgdGhlbiBpbiBhbgo+PiBldmVu
IG1vcmUgc3RyaWN0IGZvcm06IENlcnRhaW4gdmVyeSBsb3cgYW5kIHZlcnkgaGlnaCBudW1iZXJl
ZAo+PiB2ZWN0b3JzIGFyZSBpbGxlZ2FsIGhlcmUgYXMgd2VsbCwgYW5kIHdlIG1heSB0aGVuIGJl
IGFibGUgdG8gdXNlCj4+IHRoZSBzYW1lIHZhbGlkYXRpb24gaGVscGVyIGVsc2V3aGVyZSAoaW4g
cGFydGljdWxhciBhbHNvIGZvciB0aGUKPj4gY2hlY2sgdGhhdCB5b3UndmUgZm91bmQgdG8gYmUg
d3JvbmcgaW4gX2NsZWFyX2lycV92ZWN0b3IoKSkuCj4gCj4gVGhhbmtzLCB0aGF0IExHVE0uCgpB
bmQgRlRSIC0gaXQgX2RvZXNfIHRyaWdnZXIuIEknbSBzdGlsbCBzdHJ1Z2dsaW5nIHRvIGV4cGxh
aW4gd2h5LgpUaGUgb25seSBwbGFjZSB3aGVyZSAtPmFyY2gubW92ZV9pbl9wcm9ncmVzcyBnZXRz
IHNldCBpcwppbiBfYXNzaWduX2lycV92ZWN0b3IoKSwgYW5kIHRoZSBjaGVjayBJJ3ZlIHB1dCB0
aGVyZSBmb3IKZGVidWdnaW5nIHB1cnBvc2VzIGRvZXNuJ3QgdHJpZ2dlciwgaS5lLiB0aGUgdmVj
dG9ycyBwdXQgdGhlcmUKaW50byAtPmFyY2gub2xkX3ZlY3RvciBhcmUgdmFsaWQuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
