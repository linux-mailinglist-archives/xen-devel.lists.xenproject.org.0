Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C7E59EBB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 17:22:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgsdU-0005VC-20; Fri, 28 Jun 2019 15:18:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kaB/=U3=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1hgsdS-0005V7-42
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 15:17:58 +0000
X-Inumbo-ID: e6099796-99b7-11e9-987b-a7706a42458b
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6099796-99b7-11e9-987b-a7706a42458b;
 Fri, 28 Jun 2019 15:17:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6AD17ACB4;
 Fri, 28 Jun 2019 15:17:52 +0000 (UTC)
Date: Fri, 28 Jun 2019 17:17:49 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190628151749.GA2880@dhcp22.suse.cz>
References: <20190620160821.4210-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620160821.4210-1-jgross@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] mm: fix regression with deferred struct
 page init
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
Cc: xen-devel@lists.xenproject.org,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1IDIwLTA2LTE5IDE4OjA4OjIxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IENvbW1pdCAw
ZTU2YWNhZTRiNGRkNGE5ICgibW06IGluaXRpYWxpemUgTUFYX09SREVSX05SX1BBR0VTIGF0IGEg
dGltZQo+IGluc3RlYWQgb2YgZG9pbmcgbGFyZ2VyIHNlY3Rpb25zIikgaXMgY2F1c2luZyBhIHJl
Z3Jlc3Npb24gb24gc29tZQo+IHN5c3RlbXMgd2hlbiB0aGUga2VybmVsIGlzIGJvb3RlZCBhcyBY
ZW4gZG9tMC4KPiAKPiBUaGUgc3lzdGVtIHdpbGwganVzdCBoYW5nIGluIGVhcmx5IGJvb3QuCj4g
Cj4gUmVhc29uIGlzIGFuIGVuZGxlc3MgbG9vcCBpbiBnZXRfcGFnZV9mcm9tX2ZyZWVsaXN0KCkg
aW4gY2FzZSB0aGUgZmlyc3QKPiB6b25lIGxvb2tlZCBhdCBoYXMgbm8gZnJlZSBtZW1vcnkuIGRl
ZmVycmVkX2dyb3dfem9uZSgpIGlzIGFsd2F5cwoKQ291bGQgeW91IGV4cGxhaW4gaG93IHdlIGVu
ZGVkIHVwIHdpdGggdGhlIHpvbmUgaGF2aW5nIG5vIG1lbW9yeT8gSXMKeGVuICJzdGVhbGluZyIg
bWVtYmxvY2sgbWVtb3J5IHdpdGhvdXQgYWRkaW5nIGl0IHRvIG1lbW9yeS5yZXNlcnZlZD8KSW4g
b3RoZXIgd29yZHMsIGhvdyBkbyB3ZSBlbmQgdXAgd2l0aCBhbiBlbXB0eSB6b25lIHRoYXQgaGFz
IG5vbiB6ZXJvCmVuZF9wZm4/Cgo+IHJldHVybmluZyB0cnVlIGR1ZSB0byB0aGUgZm9sbG93aW5n
IGNvZGUgc25pcHBsZXQ6Cj4gCj4gICAvKiBJZiB0aGUgem9uZSBpcyBlbXB0eSBzb21lYm9keSBl
bHNlIG1heSBoYXZlIGNsZWFyZWQgb3V0IHRoZSB6b25lICovCj4gICBpZiAoIWRlZmVycmVkX2lu
aXRfbWVtX3Bmbl9yYW5nZV9pbl96b25lKCZpLCB6b25lLCAmc3BmbiwgJmVwZm4sCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpcnN0X2RlZmVycmVkX3Bmbikp
IHsKPiAgICAgICAgICAgcGdkYXQtPmZpcnN0X2RlZmVycmVkX3BmbiA9IFVMT05HX01BWDsKPiAg
ICAgICAgICAgcGdkYXRfcmVzaXplX3VubG9jayhwZ2RhdCwgJmZsYWdzKTsKPiAgICAgICAgICAg
cmV0dXJuIHRydWU7Cj4gICB9Cj4gCj4gVGhpcyBpbiB0dXJuIHJlc3VsdHMgaW4gdGhlIGxvb3Ag
YXMgZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCgpIGlzCj4gYXNzdW1pbmcgZm9yd2FyZCBwcm9ncmVz
cyBjYW4gYmUgbWFkZSBieSBkb2luZyBzb21lIG1vcmUgc3RydWN0IHBhZ2UKPiBpbml0aWFsaXph
dGlvbi4KClRoZSBwYXRjaCBsb29rcyBjb3JyZWN0LiBUaGUgY29kZSBpcyBzdWJ0bGUgYnV0IHRo
ZSBjb21tZW50IGhlbHBzLgoKPiBDYzogQWxleGFuZGVyIER1eWNrIDxhbGV4YW5kZXIuaC5kdXlj
a0BsaW51eC5pbnRlbC5jb20+Cj4gRml4ZXM6IDBlNTZhY2FlNGI0ZGQ0YTkgKCJtbTogaW5pdGlh
bGl6ZSBNQVhfT1JERVJfTlJfUEFHRVMgYXQgYSB0aW1lIGluc3RlYWQgb2YgZG9pbmcgbGFyZ2Vy
IHNlY3Rpb25zIikKPiBTdWdnZXN0ZWQtYnk6IEFsZXhhbmRlciBEdXljayA8YWxleGFuZGVyLmgu
ZHV5Y2tAbGludXguaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KCkFja2VkLWJ5OiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4K
PiAtLS0KPiAgbW0vcGFnZV9hbGxvYy5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9wYWdlX2FsbG9j
LmMgYi9tbS9wYWdlX2FsbG9jLmMKPiBpbmRleCBkNjZiYzhhYmUwYWYuLjhlM2JjOTQ5ZWJjYyAx
MDA2NDQKPiAtLS0gYS9tbS9wYWdlX2FsbG9jLmMKPiArKysgYi9tbS9wYWdlX2FsbG9jLmMKPiBA
QCAtMTgyNiw3ICsxODI2LDggQEAgZGVmZXJyZWRfZ3Jvd196b25lKHN0cnVjdCB6b25lICp6b25l
LCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gIAkJCQkJCSBmaXJzdF9kZWZlcnJlZF9wZm4pKSB7Cj4g
IAkJcGdkYXQtPmZpcnN0X2RlZmVycmVkX3BmbiA9IFVMT05HX01BWDsKPiAgCQlwZ2RhdF9yZXNp
emVfdW5sb2NrKHBnZGF0LCAmZmxhZ3MpOwo+IC0JCXJldHVybiB0cnVlOwo+ICsJCS8qIFJldHJ5
IG9ubHkgb25jZS4gKi8KPiArCQlyZXR1cm4gZmlyc3RfZGVmZXJyZWRfcGZuICE9IFVMT05HX01B
WDsKPiAgCX0KPiAgCj4gIAkvKgo+IC0tIAo+IDIuMTYuNAoKLS0gCk1pY2hhbCBIb2NrbwpTVVNF
IExhYnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
