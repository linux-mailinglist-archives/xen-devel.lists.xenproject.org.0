Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F102114BD4
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 16:31:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNebf-0000l6-HF; Mon, 06 May 2019 14:28:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Gz0=TG=citrix.com=prvs=022e014eb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hNebe-0000l1-0C
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 14:28:38 +0000
X-Inumbo-ID: 3b5214cd-700b-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3b5214cd-700b-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 14:28:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,438,1549929600"; d="scan'208";a="89671503"
Date: Mon, 6 May 2019 16:28:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190506142824.jalqoeyz5ynucd2z@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC71ADE020000780022A1B7@prv1-mh.provo.novell.com>
 <20190503091905.2levs75dxln4rhiw@Air-de-Roger>
 <5CCC4BDD020000780022BA05@prv1-mh.provo.novell.com>
 <5CCFDF2F020000780022C08C@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CCFDF2F020000780022C08C@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDE6MTU6NTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAzLjA1LjE5IGF0IDE2OjEwLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+ID4+Pj4gT24gMDMuMDUuMTkgYXQgMTE6MTksIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPj4gT24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDk6NDA6MTRBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4+IC0tLSB1bnN0YWJsZS5vcmlnL3hlbi9hcmNoL3g4Ni9pcnEuYwkK
PiA+Pj4gKysrIHVuc3RhYmxlL3hlbi9hcmNoL3g4Ni9pcnEuYwo+ID4+PiBAQCAtMjQyLDYgKzI0
MiwyMCBAQCB2b2lkIGRlc3Ryb3lfaXJxKHVuc2lnbmVkIGludCBpcnEpCj4gPj4+ICAgICAgeGZy
ZWUoYWN0aW9uKTsKPiA+Pj4gIH0KPiA+Pj4gIAo+ID4+PiArc3RhdGljIHZvaWQgcmVsZWFzZV9v
bGRfdmVjKHN0cnVjdCBpcnFfZGVzYyAqZGVzYykKPiA+Pj4gK3sKPiA+Pj4gKyAgICB1bnNpZ25l
ZCBpbnQgdmVjdG9yID0gZGVzYy0+YXJjaC5vbGRfdmVjdG9yOwo+ID4+PiArCj4gPj4+ICsgICAg
ZGVzYy0+YXJjaC5vbGRfdmVjdG9yID0gSVJRX1ZFQ1RPUl9VTkFTU0lHTkVEOwo+ID4+PiArICAg
IGNwdW1hc2tfY2xlYXIoZGVzYy0+YXJjaC5vbGRfY3B1X21hc2spOwo+ID4+PiArCj4gPj4+ICsg
ICAgaWYgKCBkZXNjLT5hcmNoLnVzZWRfdmVjdG9ycyApCj4gPj4gCj4gPj4gV291bGRuJ3QgaXQg
YmUgYmV0dGVyIHRvIGNsZWFuIHRoZSBiaXRtYXAgd2hlbiB2ZWN0b3IgIT0KPiA+PiBJUlFfVkVD
VE9SX1VOQVNTSUdORUQ/Cj4gPiAKPiA+IE5vIGNvZGUgcGF0aCBkb2VzIC8gc2hvdWxkIGNhbGwg
aW50byBoZXJlIHdpdGhvdXQgdGhlIG5lZWQgdG8KPiA+IGFjdHVhbGx5IHJlbGVhc2UgdGhlIHBy
ZXZpb3VzIHZlY3Rvci4KPiA+IAo+ID4+IEkgaGF2ZW4ndCBjaGVja2VkIGFsbCB0aGUgY2FsbGVy
cywgYnV0IEkgZG9uJ3QgdGhpbmsgaXQncyB2YWxpZCB0bwo+ID4+IGNhbGwgcmVsZWFzZV9vbGRf
dmVjIHdpdGggZGVzYy0+YXJjaC5vbGRfdmVjdG9yID09Cj4gPj4gSVJRX1ZFQ1RPUl9VTkFTU0lH
TkVELCBpbiB3aGljaCBjYXNlIEkgd291bGQgYWRkIGFuIEFTU0VSVC4KPiA+IAo+ID4gV2VsbCwg
eWVzLCBJIHByb2JhYmx5IGNvdWxkLiBIb3dldmVyLCBhcyBtdWNoIGFzIEknbSBpbgo+ID4gZmF2
b3Igb2YgQVNTRVJUKClzLCBJIGRvbid0IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIEFTU0VSVCgp
Cj4gPiBiYXNpY2FsbHkgZXZlcnkgYml0IG9mIGV4cGVjdGVkIHN0YXRlLiBJbiB0aGUgZW5kIHRo
ZXJlIHdvdWxkCj4gPiBvdGhlcndpc2UgYmUgbW9yZSBBU1NFUlQoKXMgdGhhbiBhY3R1YWwgY29k
ZS4KPiAKPiBBY3R1YWxseSwgdXBvbiBzZWNvbmQgdGhvdWdodCAtIGxldCBtZSBhZGQgdGhpcywg
YnV0IHRoZW4gaW4gYW4KPiBldmVuIG1vcmUgc3RyaWN0IGZvcm06IENlcnRhaW4gdmVyeSBsb3cg
YW5kIHZlcnkgaGlnaCBudW1iZXJlZAo+IHZlY3RvcnMgYXJlIGlsbGVnYWwgaGVyZSBhcyB3ZWxs
LCBhbmQgd2UgbWF5IHRoZW4gYmUgYWJsZSB0byB1c2UKPiB0aGUgc2FtZSB2YWxpZGF0aW9uIGhl
bHBlciBlbHNld2hlcmUgKGluIHBhcnRpY3VsYXIgYWxzbyBmb3IgdGhlCj4gY2hlY2sgdGhhdCB5
b3UndmUgZm91bmQgdG8gYmUgd3JvbmcgaW4gX2NsZWFyX2lycV92ZWN0b3IoKSkuCgpUaGFua3Ms
IHRoYXQgTEdUTS4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
