Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB80817E42D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 17:00:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBKlJ-0008KM-AB; Mon, 09 Mar 2020 15:56:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBKlH-0008KD-MO
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 15:56:11 +0000
X-Inumbo-ID: 7ef68764-621e-11ea-8f6d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ef68764-621e-11ea-8f6d-bc764e2007e4;
 Mon, 09 Mar 2020 15:56:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32837AC6E;
 Mon,  9 Mar 2020 15:56:10 +0000 (UTC)
To: paul@xen.org
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-7-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54fbff7c-118f-bfa7-3d2c-c1d6a2305a1f@suse.com>
Date: Mon, 9 Mar 2020 16:56:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309102304.1251-7-paul@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 6/6] domain: use PGC_extra domheap page
 for shared_info
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxMToyMywgcGF1bEB4ZW4ub3JnIHdyb3RlOgo+IEZyb206IFBhdWwgRHVy
cmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiBDdXJyZW50bHkgc2hhcmVkX2luZm8gaXMg
YSBzaGFyZWQgeGVuaGVhcCBwYWdlIGJ1dCBzaGFyZWQgeGVuaGVhcCBwYWdlcwo+IGNvbXBsaWNh
dGUgZnV0dXJlIHBsYW5zIGZvciBsaXZlLXVwZGF0ZSBvZiBYZW4gc28gaXQgaXMgZGVzaXJhYmxl
IHRvLAo+IHdoZXJlIHBvc3NpYmxlLCBub3QgdXNlIHRoZW0gWzFdLiBUaGlzIHBhdGNoIHRoZXJl
Zm9yZSBjb252ZXJ0cyBzaGFyZWRfaW5mbwo+IGludG8gYSBQR0NfZXh0cmEgZG9taGVhcCBwYWdl
LiBUaGlzIGRvZXMgZW50YWlsIGZyZWVpbmcgc2hhcmVkX2luZm8gZHVyaW5nCj4gZG9tYWluX3Jl
bGlucXVpc2hfcmVzb3VyY2VzKCkgcmF0aGVyIHRoYW4gZG9tYWluX2Rlc3Ryb3koKSBzbyBjYXJl
IGlzCj4gbmVlZGVkIHRvIGF2b2lkIGRlLXJlZmVyZW5jaW5nIGEgTlVMTCBzaGFyZWRfaW5mbyBw
b2ludGVyIGhlbmNlIHNvbWUKPiBleHRyYSBjaGVja3Mgb2YgJ2lzX2R5aW5nJyBhcmUgbmVlZGVk
Lgo+IAo+IEFsc28sIGJlY2F1c2Ugc2hhcmVkX2luZm8gd2lsbCBubyBsb25nZXIgYmUgYSB4ZW5o
ZWFwIHBhZ2UgdGhpcyBwYXRjaCBhZGRzCj4gYW4gZXh0cmEgZHVtcCBmdW5jdGlvbiB0byBtYWtl
IHN1cmUgdGhlIHNoYXJlZF9pbmZvIE1GTiBpcyBpbmNsdWRlZCBpbiB0aGUKPiBvdXRwdXQgb2Yg
ZHVtcF9wYWdlZnJhbWVfaW5mbygpLgoKSSd2ZSB2b2ljZWQgbXkgb2JqZWN0aW9uIHRvIHN1Y2gg
YSBtb2RlbCwgYW5kIGhlbmNlIGl0J2xsIHRha2UKYW5vdGhlciBSRVNUIG1haW50YWluZXIgdG8g
YXBwcm92ZSBvZiB0aGlzIGRlc3BpdGUgbXkgYXJndW1lbnRzCmFnYWluc3QgaXQuIChBbmQgb2Yg
Y291cnNlLCBqdXN0IHRvIHJlLXJlY29yZCB0aGlzIGhlcmUsIHRoZQpBUElDIGFjY2VzcyBwYWdl
LCBjb252ZXJ0ZWQgYnkgZWEzZGFhYmZmNWYyLCB3aWxsIHdhbnQgdG8gZ2V0IGEKZHVtcGluZyBm
dW5jdGlvbiBhZGRlZCB0aGVuLCB0b28uKQoKSSB3b25kZXIgd2hldGhlciBhIGRvbWFpbidzICJl
eHRyYSIgcGFnZXMgY291bGRuJ3QgYmUgcHV0IGluIGEKc2VwYXJhdGUsIHNpbmdseS1saW5rZWQg
bGlzdCwgdXNpbmcgdGhlIHVuaW9uIHRoZSBuZXh0X3NoYWRvdwpmaWVsZCBpcyBpbiBhcyB0aGUg
bGlua2luZyBmaWVsZC4gTm9uZSBvZiB0aGUgb3RoZXIgdW5pb24KbWVtYmVycyBsb29rIHRvIGJl
IGFwcGxpY2FibGUgdG8gImV4dHJhIiBwYWdlcy4KCj4gK3ZvaWQgZHVtcF9zaGFyZWRfaW5mbyhz
dHJ1Y3QgZG9tYWluICpkKQo+ICt7Cj4gKyAgICBkb21haW5fbG9jayhkKTsKPiArCj4gKyAgICBp
ZiAoIGQtPnNoYXJlZF9pbmZvLnZpcnQgKQo+ICsgICAgICAgIHByaW50aygiU2hhcmVkIEluZm86
ICUiUFJJX21mbiJcbiIsIG1mbl94KGQtPnNoYXJlZF9pbmZvLm1mbikpOwoKY291bnRfaW5mbyBh
bmQgdHlwZV9pbmZvIHNob3VsZCBiZSBsb2dnZWQgaW1vLCBqdXN0IGxpa2UKZHVtcF9wYWdlZnJh
bWVfaW5mbygpIGRvZXMuIE9uIHRoZSB3aG9sZSBJIHRoaW5rIHRoZSBhY3R1YWwKZHVtcGluZyBt
aWdodCBiZXR0ZXIgYmUgdW5pZm9ybSwgYW5kIHRoZXNlIGZ1bmN0aW9ucyB3b3VsZAp0aGVuIG9u
bHkgZXhpc3QgdG8gImtub3ciIHdoaWNoIHBhZ2UocykgdG8gZHVtcC4KCj4gLS0tIGEveGVuL2Nv
bW1vbi90aW1lLmMKPiArKysgYi94ZW4vY29tbW9uL3RpbWUuYwo+IEBAIC05OSw2ICs5OSwxOCBA
QCB2b2lkIHVwZGF0ZV9kb21haW5fd2FsbGNsb2NrX3RpbWUoc3RydWN0IGRvbWFpbiAqZCkKPiAg
ICAgIHVpbnQzMl90ICp3Y192ZXJzaW9uOwo+ICAgICAgdWludDY0X3Qgc2VjOwo+ICAKPiArICAg
IGlmICggZCAhPSBjdXJyZW50LT5kb21haW4gKQo+ICsgICAgewo+ICsgICAgICAgIC8qCj4gKyAg
ICAgICAgICogV2UgbmVlZCB0byBjaGVjayBpc19keWluZyBoZXJlIGFzLCBpZiBpdCBpcyBzZXQs
IHRoZQo+ICsgICAgICAgICAqIHNoYXJlZF9pbmZvIG1heSBoYXZlIGJlZW4gZnJlZWQuIFRvIGRv
IHRoaXMgc2FmZWx5IHdlIG5lZWQKPiArICAgICAgICAgKiBob2xkIHRoZSBkb21haW4gbG9jay4K
PiArICAgICAgICAgKi8KPiArICAgICAgICBkb21haW5fbG9jayhkKTsKPiArICAgICAgICBpZiAo
IGQtPmlzX2R5aW5nICkKPiArICAgICAgICAgICAgZ290byB1bmxvY2s7Cj4gKyAgICB9CgpUaGlz
IHNob3VsZG4ndCBoYXBwZW4gdmVyeSBvZnRlbiwgYnV0IGl0J3MgcHJldHR5IGhlYXZ5IGEgbG9j
ay4KSXQncyBhIGZ1bmRhbWVudGFsIGFzcGVjdCBvZiB4ZW5oZWFwIHBhZ2VzIHRoYXQgdGhlaXIg
ZGlzcG9zYWwKY2FuIGIgZSBkZWxheSB1bnRpbCBhbG1vc3QgdGhlIGxhc3QgbW9tZW50IG9mIGd1
ZXN0IGNsZWFudXAuIEkKY29udGludWUgdG8gdGhpbmsgaXQncyBub3QgcmVhbGx5IGEgZ29vZCBp
ZGVhbCB0byBoYXZlIHNwZWNpYWwKcHVycG9zZSBhbGxvY2F0aW9uIChhbmQgbWFwcGluZykgYWNj
b21wYW5pZWQgYnkgdGhlc2UgcGFnZXMKZ2V0dGluZyB0YWtlbiBjYXJlIG9mIGJ5IHRoZSBnZW5l
cmljIHJlbGlucXVpc2gtcmVzb3VyY2VzIGxvZ2ljCmhlcmUgKGZyb20gYSBtb3JlIGdlbmVyYWwg
cG92IHN1Y2ggaXMgb2YgY291cnNlIG9mdGVuIG5pY2UgdG8KaGF2ZSkuIEluc3RlYWQgb2YgZnJl
ZWluZyB0aGVzZSBwYWdlcyB0aGVyZSwgY291bGRuJ3QgdGhleSBqdXN0CmJlIHRha2VuIG9mZiBk
LT5wYWdlX2xpc3QsIHdpdGggdGhlIHVubWFwcGluZyBhbmQgZnJlZWluZyBsZWZ0CmFzIGl0IHdh
cz8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
