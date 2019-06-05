Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6504735AD7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:04:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTfm-0000qJ-HV; Wed, 05 Jun 2019 11:01:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYTfl-0000qE-0c
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 11:01:37 +0000
X-Inumbo-ID: 489eebfe-8781-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 489eebfe-8781-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 11:01:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 05:01:34 -0600
Message-Id: <5CF7A1090200007800235782@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 05:01:29 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-14-julien.grall@arm.com>
In-Reply-To: <20190603160350.29806-14-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA2LjE5IGF0IDE4OjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94
ODZfNjQvdHJhcHMuYwo+IEBAIC0xODQsNyArMTg0LDggQEAgdm9pZCB2Y3B1X3Nob3dfcmVnaXN0
ZXJzKGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+ICAKPiAgdm9pZCBzaG93X3BhZ2Vfd2Fsayh1bnNp
Z25lZCBsb25nIGFkZHIpCj4gIHsKPiAtICAgIHVuc2lnbmVkIGxvbmcgcGZuLCBtZm4gPSByZWFk
X2NyMygpID4+IFBBR0VfU0hJRlQ7Cj4gKyAgICB1bnNpZ25lZCBsb25nIHBmbjsKPiArICAgIG1m
bl90IG1mbiA9IG1hZGRyX3RvX21mbihyZWFkX2NyMygpKTsKClF1b3RpbmcgbXkgdjEgY29tbWVu
dDoKCiJJIHJlYWxpemUgeW91IHNpbXBseSB0YWtlIHdoYXQgaGFzIGJlZW4gdGhlcmUgYW5kIHRy
YW5zZm9ybSBpdCwgYnV0CiBtYWRkcl90b19tZm4oKSAob3RoZXIgdGhhbiBzaGlmdGluZyBieSBQ
QUdFX1NISUZUKSBpcyBub3QgdHJ1bHkKIGFwcGxpY2FibGUgaGVyZTogV2hhdCB0aGUgQ1IzIHJl
Z2lzdGVyIGhvbGRzIGlzIG5vdCBhIHBoeXNpY2FsIGFkZHJlc3MsCiBib3RoIHRoZSBsb3cgdHdl
bHZlIGJpdHMgYXMgd2VsbCBhcyB0aGUgaGlnaCB0d2VsdmUgb25lcyBoYXZlIGRpZmZlcmVudAog
bWVhbmluZy4gVGhlIHNoaWZ0IGlzIGNvcnJlY3QgY3VycmVudGx5IGJlY2F1c2UgdGhlIGhpZ2gg
b25lcyBhcmUKIChyaWdodCBub3cpIHplcm8gb24gcmVhZHMuIFBsZWFzZSBjb25zaWRlciBBTkQt
aW5nIHdpdGgKIFg4Nl9DUjNfQUREUl9NQVNLIChvciBrZWVwaW5nIHRoZSBzaGlmdCkuIgoKRk9B
RCBieSAicGxlYXNlIGNvbnNpZGVyIiBJIGRvbid0IG1lYW4gImxlYXZlIGl0IGFzIGlzIHdpbGwg
YmUgZmluZSBhcwp3ZWxsIiwgYnV0IHRvIGRvIG9uZSBvZiB0aGUgdHdvIHBvc3NpYmxlIGNoYW5n
ZXMsIHdpdGggYSBwcmVmZXJlbmNlCnRvd2FyZHMgdGhlIEFORC1pbmcsIGFzIHRoYXQncyB0aGUg
dWx0aW1hdGVseSBjb3JyZWN0IGFwcHJvYWNoLgoKPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuYwo+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gQEAgLTE0MTYsNyArMTQxNiw3
IEBAIHN0YXRpYyB2b2lkIGZyZWVfaGVhcF9wYWdlcygKPiAgCj4gICAgICAgICAgLyogVGhpcyBw
YWdlIGlzIG5vdCBhIGd1ZXN0IGZyYW1lIGFueSBtb3JlLiAqLwo+ICAgICAgICAgIHBhZ2Vfc2V0
X293bmVyKCZwZ1tpXSwgTlVMTCk7IC8qIHNldF9ncGZuX2Zyb21fbWZuIHNub29wcyBwZyBvd25l
ciAqLwo+IC0gICAgICAgIHNldF9ncGZuX2Zyb21fbWZuKG1mbl94KG1mbikgKyBpLCBJTlZBTElE
X00yUF9FTlRSWSk7Cj4gKyAgICAgICAgc2V0X3Bmbl9mcm9tX21mbihtZm5fYWRkKG1mbiwgKyBp
KSwgSU5WQUxJRF9NMlBfRU5UUlkpOwoKUXVvdGluZyBteSB2MSBjb21tZW50IGFnYWluOiAiU3Ry
YXkgbGVmdG92ZXIgKyA/IgoKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPiArKysg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPiBAQCAtNDkyLDIyICs0OTIsMjYgQEAgZXh0ZXJu
IHN0cnVjdCBkb21haW4gKmRvbV94ZW4sICpkb21faW8sICpkb21fY293OwkvKiBmb3Igdm1jb3Jl
aW5mbyAqLwo+ICAgKi8KPiAgZXh0ZXJuIGJvb2wgbWFjaGluZV90b19waHlzX21hcHBpbmdfdmFs
aWQ7Cj4gIAo+IC1zdGF0aWMgaW5saW5lIHZvaWQgc2V0X2dwZm5fZnJvbV9tZm4odW5zaWduZWQg
bG9uZyBtZm4sIHVuc2lnbmVkIGxvbmcgcGZuKQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3Bm
bl9mcm9tX21mbihtZm5fdCBtZm4sIHVuc2lnbmVkIGxvbmcgcGZuKQo+ICB7Cj4gLSAgICBzdHJ1
Y3QgZG9tYWluICpkID0gcGFnZV9nZXRfb3duZXIobWZuX3RvX3BhZ2UoX21mbihtZm4pKSk7Cj4g
KyAgICBjb25zdCB1bnNpZ25lZCBsb25nIG1mbl8gPSBtZm5feChtZm4pOwo+ICsgICAgc3RydWN0
IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVyKG1mbl90b19wYWdlKG1mbikpOwoKY29uc3Q/IChP
ciBpcyB0aGlzIGEgcGxhY2Ugd2hlcmUgSSd2ZSBzaW1pbGFybHkgYXNrZWQgb24gYW4gZWFybGll
cgpwYXRjaCBhbHJlYWR5PykKCkJ0dywgdGhlIGNoZWFwZXIgKGluIHRlcm1zIG9mIGNvZGUgY2h1
cm4pIGNoYW5nZSBoZXJlIHdvdWxkIHNlZW0gdG8KYmUgdG8gbmFtZSB0aGUgZnVuY3Rpb24gcGFy
YW1ldGVyIG1mbl8sIGFuZCB0aGUgbG9jYWwgdmFyaWFibGUgbWZuLgpUaGF0J2xsIGFsc28gcmVk
dWNlIHRoZSBudW1iZXIgb2YgdXNlcyBvZiB0aGUgdW5mb3J0dW5hdGUgdHJhaWxpbmctCnVuZGVy
c2NvcmUtbmFtZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
