Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE1BA84B9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 15:52:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5VeX-0004TY-M1; Wed, 04 Sep 2019 13:48:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5VeV-0004TI-Vx
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:48:52 +0000
X-Inumbo-ID: b01bca1c-cf1a-11e9-abb6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b01bca1c-cf1a-11e9-abb6-12813bfff9fa;
 Wed, 04 Sep 2019 13:48:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CF078B03B;
 Wed,  4 Sep 2019 13:48:33 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-8-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7ce66a65-8f1b-1587-590c-17d82ac2e800@suse.com>
Date: Wed, 4 Sep 2019 15:48:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-8-jgross@suse.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUaGlzIHByZXBhcmVz
IHN1cHBvcnQgb2YgbGFyZ2VyIHNjaGVkdWxpbmcgZ3JhbnVsYXJpdGllcywgZS5nLiBjb3JlCj4g
c2NoZWR1bGluZy4KPiAKPiBXaGlsZSBhdCBpdCBtb3ZlIHNjaGVkX2hhc191cmdlbnRfdmNwdSgp
IGZyb20gaW5jbHVkZS9hc20teDg2L2NwdWlkbGUuaAo+IGludG8gc2NoZWR1bGUuYyByZW1vdmlu
ZyB0aGUgbmVlZCBmb3IgaW5jbHVkaW5nIHNjaGVkLWlmLmggaW4KPiBjcHVpZGxlLmggYW5kIG11
bHRpcGxlIG90aGVyIEMgc291cmNlcy4KCkxvb2tpbmcgYWdhaW4sIHRoZSAjaW5jbHVkZS1zIGlu
IC5jIGZpbGVzIHNob3VsZCBoYXZlIGJlZW4gdW5uZWNlc3NhcnkKYWx0b2dldGhlciAoYW5kIGRy
b3BwaW5nIG9mIHRoZW0gY291bGQsIGlmIGl0IHdhcyBhIHNlcGFyYXRlIHBhdGNoLCBnbwppbiBy
aWdodCBhd2F5KSwgYmVjYXVzZSBvZiAuLi4KCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9j
cHVpZGxlLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2NwdWlkbGUuaAo+IEBAIC00LDcg
KzQsNiBAQAo+ICAjaW5jbHVkZSA8eGVuL2NwdWlkbGUuaD4KPiAgI2luY2x1ZGUgPHhlbi9ub3Rp
Zmllci5oPgo+ICAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+Cj4gLSNpbmNsdWRlIDx4ZW4vc2NoZWQt
aWYuaD4KCi4uLiB0aGlzLgoKPiBAQCAtMjcsMTQgKzI2LDQgQEAgdm9pZCB1cGRhdGVfaWRsZV9z
dGF0cyhzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfcG93ZXIgKiwKPiAgdm9pZCB1cGRhdGVfbGFzdF9j
eF9zdGF0KHN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9wb3dlciAqLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGFjcGlfcHJvY2Vzc29yX2N4ICosIHVpbnQ2NF90KTsKPiAgCj4gLS8q
Cj4gLSAqIHZjcHUgaXMgdXJnZW50IGlmIHZjcHUgaXMgcG9sbGluZyBldmVudCBjaGFubmVsCj4g
LSAqCj4gLSAqIGlmIHVyZ2VudCB2Y3B1IGV4aXN0cywgQ1BVIHNob3VsZCBub3QgZW50ZXIgZGVl
cCBDIHN0YXRlCj4gLSAqLwo+IC1zdGF0aWMgaW5saW5lIGludCBzY2hlZF9oYXNfdXJnZW50X3Zj
cHUodm9pZCkKPiAtewo+IC0gICAgcmV0dXJuIGF0b21pY19yZWFkKCZ0aGlzX2NwdShzY2hlZHVs
ZV9kYXRhKS51cmdlbnRfY291bnQpOwo+IC19CgpBbmQgdGhlbiwgZGVzcGl0ZSBteSBwcmV2aW91
cyBhY2ssIEknbSBzbGlnaHRseSB1bmhhcHB5IGFib3V0IHRoaXMKdmVyeSBzaG9ydCBmdW5jdGlv
biBiZWNvbWluZyBhbiBvdXQtb2YtbGluZSBvbmUsIHdoZW4gdGhlIG9ubHkKdXNlcnMgb2YgaXQg
d291bGQgcHJlZmVyYWJseSBoYXZlIGFzIGxvdyBsYXRlbmN5IGFzIHBvc3NpYmxlLiBJCmRvbid0
IHN1cHBvc2UgdGhlcmUncyBhIHdheSB0byBrZWVwIGl0IGlubGluZSBidXQgc3RpbGwgZHJvcCB0
aGUKdW53YW50ZWQgI2luY2x1ZGUgYWJvdmU/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
