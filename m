Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C500D14A677
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:45:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5bf-00043G-B3; Mon, 27 Jan 2020 14:43:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iw5be-000436-3L
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:43:14 +0000
X-Inumbo-ID: 50b918de-4113-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50b918de-4113-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 14:43:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B88C7AE87;
 Mon, 27 Jan 2020 14:42:59 +0000 (UTC)
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <5f64321c4cceccd057e3b3e7fadea696793a7966.1578397252.git.hongyxia@amazon.com>
 <baa1a699-179f-b0ae-d857-699f7f63b214@suse.com>
 <dd3836c12457a92af545651b09acf910c2071bcf.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d38a17c-9b6b-a423-1326-33e24c583393@suse.com>
Date: Mon, 27 Jan 2020 15:43:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <dd3836c12457a92af545651b09acf910c2071bcf.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/7] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Grall,
 Julien" <jgrall@amazon.com>, "Xia, Hongyan" <hongyxia@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAyMCAxNTozMywgWGlhLCBIb25neWFuIHdyb3RlOgo+IE9uIFRodSwgMjAyMC0w
MS0xNiBhdCAxMzowNCArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC4uLgo+Pgo+Pj4gK3Zv
aWQgZnJlZV94ZW5fcGFnZXRhYmxlKHZvaWQgKnYpCj4+PiArewo+Pj4gKyAgICBtZm5fdCBtZm4g
PSB2ID8gdmlydF90b19tZm4odikgOiBJTlZBTElEX01GTjsKPj4+ICsKPj4+ICsgICAgaWYgKCBz
eXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3QgKQo+Pj4gKyAgICAgICAgZnJlZV94
ZW5fcGFnZXRhYmxlX25ldyhtZm4pOwo+Pgo+PiBUaGUgY29uZGl0aW9uIGlzIChwYXJ0bHkpIHJl
ZHVuZGFudCB3aXRoIHdoYXQKPj4gZnJlZV94ZW5fcGFnZXRhYmxlX25ldygpIGRvZXMuIFRoZXJl
Zm9yZSBJJ2QgbGlrZSB0byBhc2sgdGhhdAo+PiBlaXRoZXIgdGhlIGlmKCkgYmUgZHJvcHBlZCBo
ZXJlLCBvciBiZSBjb21wbGV0ZWQgYnkgYWxzbwo+PiBjaGVja2luZyB2IHRvIGJlIG5vbi1OVUxM
LCBhdCB3aGljaCBwb2ludCB0aGlzIHdvdWxkIGxpa2VseQo+PiBiZWNvbWUganVzdAo+Pgo+PiB2
b2lkIGZyZWVfeGVuX3BhZ2V0YWJsZSh2b2lkICp2KQo+PiB7Cj4+ICAgICBpZiAoIHYgJiYgc3lz
dGVtX3N0YXRlICE9IFNZU19TVEFURV9lYXJseV9ib290ICkKPj4gICAgICAgICBmcmVlX3hlbl9w
YWdldGFibGVfbmV3KHZpcnRfdG9fbWZuKHYpKTsKPj4gfQo+IAo+IFlvdSBhcmUgcmlnaHQuIFdp
bGwgY2hhbmdlIGluIHRoZSBuZXh0IHJldmlzaW9uLgo+IAo+Pj4gKy8qIHYgY2FuIHBvaW50IHRv
IGFuIGVudHJ5IHdpdGhpbiBhIHRhYmxlIG9yIGJlIE5VTEwgKi8KPj4+ICt2b2lkIHVubWFwX3hl
bl9wYWdldGFibGUoY29uc3Qgdm9pZCAqdikKPj4KPj4gV2h5ICJlbnRyeSIgaW4gdGhlIGNvbW1l
bnQ/Cj4gCj4gSSB0aGluayB0aGUgY29tbWVudCBvcmlnaW5hbGx5IG1lYW50IHBvaW50aW5nIHRv
IHRoZSBlbnRyeSBpbiBpdHMKPiBwYXJlbnQgdGFibGUsIHdoaWNoIHRoZW4gbWVhbnQgcG9pbnRp
bmcgdG8gdGhpcyB0YWJsZS4gSXQncyBhIGJpdAo+IGNvbmZ1c2luZy4gV2lsbCByZXdvcmQuCj4g
Cj4gUmVmbGVjdGluZyBiYWNrIHRvIHlvdXIgY29tbWVudCBpbiB2MyBhYm91dCB3aGV0aGVyIHRo
ZSBuZXcgWGVuIHBhZ2UKPiB0YWJsZSBtYXBwaW5nIEFQSXMgKG1hcC91bm1hcF94ZW5fcGFnZXRh
YmxlKSBhcmUgcmVhbGx5IG5lY2Vzc2FyeSwgSQo+IGFncmVlIGluIHRoZSBlbmQgdGhleSB3aWxs
IGp1c3QgZG8gdGhlIHNhbWUgdGhpbmcgYXMKPiBtYXAvdW5tYXBfZG9tYWluX3BhZ2UsIGFsdGhv
dWdoIG9uZSB0aGluZyBpcyB0aGF0IHRoZSBsYXR0ZXIgc3VnZ2VzdHMKPiBpdCBpcyB0cnlpbmcg
dG8gbWFwIGEgYGRvbWFpbicgcGFnZSwgd2hvc2UgZGVmaW5pdGlvbiBwcm9iYWJseSBkb2VzIG5v
dAo+IGluY2x1ZGUgWGVuIHBhZ2UgdGFibGVzLCBzbyB0aGUgbmFtZSBjb3VsZCBiZSBhIGJpdCBj
b25mdXNpbmcgKHdlbGwsIHdlCj4gY291bGQgYXJndWUgdGhhdCBYZW4gcGFnZSB0YWJsZXMgYXJl
IGp1c3QgaWRsZSBgZG9tYWluJyBwYWdlcyBzbyB0aGUKPiBuYW1lIHN0aWxsIGhvbGRzKS4gSWYg
d2UgYXJlIGhhcHB5IHdpdGggdXNpbmcgbWFwX2RvbWFpbl9wYWdlIG9uIFhlbgo+IFBURSB0YWJs
ZXMgdGhlbiBJIGFtIG9rYXkgd2l0aCBkcm9wcGluZyB0aGUgbmV3IG1hcHBpbmcgQVBJcyBhbmQg
b25seQo+IGluY2x1ZGUgdGhlIG5ldyBhbGxvYyBBUElzLgoKQW55b25lIG9uIHRoZSBUbzogbGlz
dCAtIG9waW5pb25zPwoKVGhhbmtzLCBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
