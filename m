Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409CCA9B84
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:16:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5lxE-00009r-Ql; Thu, 05 Sep 2019 07:13:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5lxD-00009m-I8
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:13:15 +0000
X-Inumbo-ID: a04e5388-cfac-11e9-abc0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a04e5388-cfac-11e9-abc0-12813bfff9fa;
 Thu, 05 Sep 2019 07:13:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4976EAF1D;
 Thu,  5 Sep 2019 07:13:13 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-8-jgross@suse.com>
 <7ce66a65-8f1b-1587-590c-17d82ac2e800@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ecad6cb4-c5e1-a280-f86f-3cc7255a0dd3@suse.com>
Date: Thu, 5 Sep 2019 09:13:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7ce66a65-8f1b-1587-590c-17d82ac2e800@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 07/48] xen/sched: move per cpu scheduler
 private data into struct sched_resource
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTU6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRoaXMgcHJlcGFyZXMgc3VwcG9ydCBvZiBsYXJn
ZXIgc2NoZWR1bGluZyBncmFudWxhcml0aWVzLCBlLmcuIGNvcmUKPj4gc2NoZWR1bGluZy4KPj4K
Pj4gV2hpbGUgYXQgaXQgbW92ZSBzY2hlZF9oYXNfdXJnZW50X3ZjcHUoKSBmcm9tIGluY2x1ZGUv
YXNtLXg4Ni9jcHVpZGxlLmgKPj4gaW50byBzY2hlZHVsZS5jIHJlbW92aW5nIHRoZSBuZWVkIGZv
ciBpbmNsdWRpbmcgc2NoZWQtaWYuaCBpbgo+PiBjcHVpZGxlLmggYW5kIG11bHRpcGxlIG90aGVy
IEMgc291cmNlcy4KPiAKPiBMb29raW5nIGFnYWluLCB0aGUgI2luY2x1ZGUtcyBpbiAuYyBmaWxl
cyBzaG91bGQgaGF2ZSBiZWVuIHVubmVjZXNzYXJ5Cj4gYWx0b2dldGhlciAoYW5kIGRyb3BwaW5n
IG9mIHRoZW0gY291bGQsIGlmIGl0IHdhcyBhIHNlcGFyYXRlIHBhdGNoLCBnbwo+IGluIHJpZ2h0
IGF3YXkpLCBiZWNhdXNlIG9mIC4uLgoKUGF0Y2ggc2VudC4KCj4gCj4+IC0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvY3B1aWRsZS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvY3B1aWRs
ZS5oCj4+IEBAIC00LDcgKzQsNiBAQAo+PiAgICNpbmNsdWRlIDx4ZW4vY3B1aWRsZS5oPgo+PiAg
ICNpbmNsdWRlIDx4ZW4vbm90aWZpZXIuaD4KPj4gICAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+Cj4+
IC0jaW5jbHVkZSA8eGVuL3NjaGVkLWlmLmg+Cj4gCj4gLi4uIHRoaXMuCj4gCj4+IEBAIC0yNywx
NCArMjYsNCBAQCB2b2lkIHVwZGF0ZV9pZGxlX3N0YXRzKHN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9w
b3dlciAqLAo+PiAgIHZvaWQgdXBkYXRlX2xhc3RfY3hfc3RhdChzdHJ1Y3QgYWNwaV9wcm9jZXNz
b3JfcG93ZXIgKiwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGFjcGlfcHJv
Y2Vzc29yX2N4ICosIHVpbnQ2NF90KTsKPj4gICAKPj4gLS8qCj4+IC0gKiB2Y3B1IGlzIHVyZ2Vu
dCBpZiB2Y3B1IGlzIHBvbGxpbmcgZXZlbnQgY2hhbm5lbAo+PiAtICoKPj4gLSAqIGlmIHVyZ2Vu
dCB2Y3B1IGV4aXN0cywgQ1BVIHNob3VsZCBub3QgZW50ZXIgZGVlcCBDIHN0YXRlCj4+IC0gKi8K
Pj4gLXN0YXRpYyBpbmxpbmUgaW50IHNjaGVkX2hhc191cmdlbnRfdmNwdSh2b2lkKQo+PiAtewo+
PiAtICAgIHJldHVybiBhdG9taWNfcmVhZCgmdGhpc19jcHUoc2NoZWR1bGVfZGF0YSkudXJnZW50
X2NvdW50KTsKPj4gLX0KPiAKPiBBbmQgdGhlbiwgZGVzcGl0ZSBteSBwcmV2aW91cyBhY2ssIEkn
bSBzbGlnaHRseSB1bmhhcHB5IGFib3V0IHRoaXMKPiB2ZXJ5IHNob3J0IGZ1bmN0aW9uIGJlY29t
aW5nIGFuIG91dC1vZi1saW5lIG9uZSwgd2hlbiB0aGUgb25seQo+IHVzZXJzIG9mIGl0IHdvdWxk
IHByZWZlcmFibHkgaGF2ZSBhcyBsb3cgbGF0ZW5jeSBhcyBwb3NzaWJsZS4gSQo+IGRvbid0IHN1
cHBvc2UgdGhlcmUncyBhIHdheSB0byBrZWVwIGl0IGlubGluZSBidXQgc3RpbGwgZHJvcCB0aGUK
PiB1bndhbnRlZCAjaW5jbHVkZSBhYm92ZT8KClRoZSBvbmx5IGFsdGVybmF0aXZlcyBJIGNvdWxk
IHRoaW5rIG9mIGFyZToKCi0gUGFzc2luZyB0aGUgInVyZ2VudCIgaW5kaWNhdG9yIHZpYSBwYXJh
bWV0ZXIgdG8gaWRsZSAoeW91IGRpZG4ndAogICBsaWtlIHRoYXQpCgotIE1ha2UgdXJnZW50X2Nv
dW50IGEgcGxhaW4gcGVyY3B1IHZhcmlhYmxlCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
