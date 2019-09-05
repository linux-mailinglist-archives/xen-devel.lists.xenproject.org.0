Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF22AA313
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:25:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qmX-0007Oy-NR; Thu, 05 Sep 2019 12:22:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5qmW-0007Oq-Bz
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:22:32 +0000
X-Inumbo-ID: d4a217e8-cfd7-11e9-abc8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4a217e8-cfd7-11e9-abc8-12813bfff9fa;
 Thu, 05 Sep 2019 12:22:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 184D2AFB0;
 Thu,  5 Sep 2019 12:22:30 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-2-jgross@suse.com>
 <45cd123c-f6b5-a687-469c-9cec9164adc4@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8a3b704f-e16c-de09-9b09-97014a6168a8@suse.com>
Date: Thu, 5 Sep 2019 14:22:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <45cd123c-f6b5-a687-469c-9cec9164adc4@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v5 1/4] xen: fix debugtrace clearing
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMTkgMTQ6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA1LjA5LjIwMTkgMTM6
MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFmdGVyIGR1bXBpbmcgdGhlIGRlYnVndHJhY2Ug
YnVmZmVyIGl0IGlzIGNsZWFyZWQuIFRoaXMgcmVzdWx0cyBpbiBzb21lCj4+IGVudHJpZXMgbm90
IGJlaW5nIHByaW50ZWQgaW4gY2FzZSB0aGUgYnVmZmVyIGlzIGR1bXBlZCBhZ2FpbiBiZWZvcmUK
Pj4gaGF2aW5nIHdyYXBwZWQuCj4+Cj4+IFdoaWxlIGF0IGl0IHJlbW92ZSB0aGUgdHJhaWxpbmcg
emVybyBieXRlIGluIHRoZSBidWZmZXIgYXMgaXQgaXMgbm8KPj4gbG9uZ2VyIG5lZWRlZC4gQ29t
bWl0IGI1ZTZlMWVlOGRhNTlmIGludHJvZHVjZWQgcGFzc2luZyB0aGUgbnVtYmVyIG9mCj4+IGNo
YXJzIHRvIGJlIHByaW50ZWQgaW4gdGhlIHJlbGF0ZWQgaW50ZXJmYWNlcywgc28gdGhlIHRyYWls
aW5nIDAgYnl0ZQo+PiBpcyBubyBsb25nZXIgcmVxdWlyZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBUZWNobmljYWxseSB0aGlzIGlz
IGZpbmUsIHNvIGl0IGNhbiBoYXZlIG15Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiBIb3dldmVyLCAuLi4KPiAKPj4gQEAgLTExNzMsNiArMTE3NSw3IEBA
IHN0YXRpYyBjaGFyICAgICAgICAqZGVidWd0cmFjZV9idWY7IC8qIERlYnVnLXRyYWNlIGJ1ZmZl
ciAqLwo+PiAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV9wcmQ7IC8qIFByb2R1Y2Vy
IGluZGV4ICAgICAqLwo+PiAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV9raWxvYnl0
ZXMgPSAxMjgsIGRlYnVndHJhY2VfYnl0ZXM7Cj4+ICAgc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1
Z3RyYWNlX3VzZWQ7Cj4+ICtzdGF0aWMgY2hhciBkZWJ1Z3RyYWNlX2xhc3RfZW50cnlfYnVmW0RF
QlVHX1RSQUNFX0VOVFJZX1NJWkVdOwo+IAo+IC4uLiB0aGlzIGlzIHdoYXQgSSB3YXMgYWZyYWlk
IHdvdWxkIGhhcHBlbiwgYnV0IEkgYWRtaXQgSSBkaWRuJ3QKPiByZXBseSBpbiBhIHdheSBwcmV2
aW91c2x5IGluZGljYXRpbmcgdGhhdCBJIGRpc2xpa2Ugc3VjaCBhCj4gc29sdXRpb24uIFRoaXMg
aXMgYWxzbyB3aHksIHdoZW4gbm90aWNpbmcgdGhlIGlzc3VlLCBJIGRpZG4ndCBwdXQKPiB0b2dl
dGhlciBhIHBhdGNoIG15c2VsZiByaWdodCBhd2F5LiBJbiBwYXJ0aWN1bGFyIEknbSBvZiB0aGUK
PiBvcGluaW9uIHRoYXQgdGhlIHRocmVlIGxhc3RfKiB2YWx1ZXMgd291bGQgYmV0dGVyIGFsbCBz
dGF5Cj4gdG9nZXRoZXIsIGFuZCB0aGVuIHdvdWxkIGJldHRlciBzdGF5IGluc2lkZSB0aGUgb25s
eSBmdW5jdGlvbgo+IHVzaW5nIHRoZW0uCj4gCj4+IEBAIC0xMjc5LDExICsxMjgwLDExIEBAIHZv
aWQgZGVidWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pCj4+ICAgICAgIH0KPj4g
ICAgICAgZWxzZQo+PiAgICAgICB7Cj4+IC0gICAgICAgIGlmICggc3RyY21wKGJ1ZiwgbGFzdF9i
dWYpICkKPj4gKyAgICAgICAgaWYgKCBzdHJjbXAoYnVmLCBkZWJ1Z3RyYWNlX2xhc3RfZW50cnlf
YnVmKSApCj4gCj4gV291bGRuJ3QgbW92aW5nIGNvdW50IHRvIGZpbGUgc2NvcGUgYW5kIGxhdGNo
aW5nIGl0cyB2YWx1ZSBpbnRvCj4gYSBuZXcgZHVtcF9jb3VudCB3aGVuIGR1bXBpbmcgd29yazoK
PiAKPiAgICAgICAgICBpZiAoIGNvdW50ID09IGR1bXBfY291bnQgfHwgc3RyY21wKGJ1ZiwgbGFz
dF9idWYpICkKPiAKPiB3b3JrPwoKSSdkIHJhdGhlciBoYXZlIGEgYm9vbCB3aGljaCB3aWxsIGJl
IHJlc2V0IGluIGFib3ZlIGNvbmRpdGlvbi4gVGhpcyB3aWxsCmF2b2lkIHByb2JsZW1zIHdoZW4g
Y291bnQgaXMgd3JhcHBpbmcuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
