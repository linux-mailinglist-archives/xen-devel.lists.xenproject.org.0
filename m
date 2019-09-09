Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F65AADB96
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:58:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7L5L-0004Sl-2z; Mon, 09 Sep 2019 14:56:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7L5J-0004Sg-Ec
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:56:05 +0000
X-Inumbo-ID: f1ff74a6-d311-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1ff74a6-d311-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 14:56:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 81877AC35;
 Mon,  9 Sep 2019 14:56:02 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190909143134.15379-1-jgross@suse.com>
 <20190909143134.15379-2-jgross@suse.com>
 <afda8925-136b-e241-10a5-97b031b90de9@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c43c3434-81b8-c6f0-f9e8-ea8f22c71dfb@suse.com>
Date: Mon, 9 Sep 2019 16:56:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <afda8925-136b-e241-10a5-97b031b90de9@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v4 1/5] xen/spinlocks: in debug builds store
 cpu holding the lock
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

T24gMDkuMDkuMTkgMTY6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA5LjIwMTkgMTY6
MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9j
ay5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oCj4+IEBAIC01LDE1ICs1LDI0
IEBACj4+ICAgI2luY2x1ZGUgPGFzbS9zcGlubG9jay5oPgo+PiAgICNpbmNsdWRlIDxhc20vdHlw
ZXMuaD4KPj4gICAKPj4gKyNkZWZpbmUgU1BJTkxPQ0tfQ1BVX0JJVFMgIDEyCj4+ICsKPj4gICAj
aWZuZGVmIE5ERUJVRwo+PiAtc3RydWN0IGxvY2tfZGVidWcgewo+PiAtICAgIHMxNiBpcnFfc2Fm
ZTsgLyogKzE6IElSUS1zYWZlOyAwOiBub3QgSVJRLXNhZmU7IC0xOiBkb24ndCBrbm93IHlldCAq
Lwo+PiArdW5pb24gbG9ja19kZWJ1ZyB7Cj4+ICsgICAgdWludDE2X3QgdmFsOwo+PiArI2RlZmlu
ZSBMT0NLX0RFQlVHX0lOSVRWQUwgMHhmZmZmCj4+ICsgICAgc3RydWN0IHsKPj4gKyAgICAgICAg
dWludDE2X3QgY3B1OlNQSU5MT0NLX0NQVV9CSVRTOwo+PiArICAgICAgICB1aW50MTZfdCA6KDE0
IC0gU1BJTkxPQ0tfQ1BVX0JJVFMpOwo+IAo+IEknbSBzb3JyeSB0aGF0IEkgcmVhbGl6ZSB0aGlz
IG9ubHkgbm93IHRoYXQgSSBzZWUgdGhpcyBhbmQgLi4uCj4gCj4+ICsgICAgICAgIGJvb2wgaXJx
X3NhZmU6MTsKPj4gKyAgICAgICAgYm9vbCB1bnNlZW46MTsKPj4gKyAgICB9Owo+PiAgIH07Cj4+
IC0jZGVmaW5lIF9MT0NLX0RFQlVHIHsgLTEgfQo+PiArI2RlZmluZSBfTE9DS19ERUJVRyB7IExP
Q0tfREVCVUdfSU5JVFZBTCB9Cj4+ICAgdm9pZCBzcGluX2RlYnVnX2VuYWJsZSh2b2lkKTsKPj4g
ICB2b2lkIHNwaW5fZGVidWdfZGlzYWJsZSh2b2lkKTsKPj4gICAjZWxzZQo+PiAtc3RydWN0IGxv
Y2tfZGVidWcgeyB9Owo+PiArdW5pb24gbG9ja19kZWJ1ZyB7IH07Cj4+ICAgI2RlZmluZSBfTE9D
S19ERUJVRyB7IH0KPj4gICAjZGVmaW5lIHNwaW5fZGVidWdfZW5hYmxlKCkgKCh2b2lkKTApCj4+
ICAgI2RlZmluZSBzcGluX2RlYnVnX2Rpc2FibGUoKSAoKHZvaWQpMCkKPj4gQEAgLTEzOCwxMSAr
MTQ3LDEyIEBAIHR5cGVkZWYgdW5pb24gewo+PiAgIAo+PiAgIHR5cGVkZWYgc3RydWN0IHNwaW5s
b2NrIHsKPj4gICAgICAgc3BpbmxvY2tfdGlja2V0c190IHRpY2tldHM7Cj4+IC0gICAgdTE2IHJl
Y3Vyc2VfY3B1OjEyOwo+PiAtI2RlZmluZSBTUElOTE9DS19OT19DUFUgMHhmZmZ1Cj4+IC0gICAg
dTE2IHJlY3Vyc2VfY250OjQ7Cj4+IC0jZGVmaW5lIFNQSU5MT0NLX01BWF9SRUNVUlNFIDB4ZnUK
Pj4gLSAgICBzdHJ1Y3QgbG9ja19kZWJ1ZyBkZWJ1ZzsKPj4gKyAgICB1MTYgcmVjdXJzZV9jcHU6
U1BJTkxPQ0tfQ1BVX0JJVFM7Cj4+ICsjZGVmaW5lIFNQSU5MT0NLX05PX0NQVSAgICAgICAgKCgx
dSA8PCBTUElOTE9DS19DUFVfQklUUykgLSAxKQo+PiArI2RlZmluZSBTUElOTE9DS19SRUNVUlNF
X0JJVFMgICgxNiAtIFNQSU5MT0NLX0NQVV9CSVRTKQo+PiArICAgIHUxNiByZWN1cnNlX2NudDpT
UElOTE9DS19SRUNVUlNFX0JJVFM7Cj4+ICsjZGVmaW5lIFNQSU5MT0NLX01BWF9SRUNVUlNFICAg
KCgxdSA8PCBTUElOTE9DS19SRUNVUlNFX0JJVFMpIC0gMSkKPiAKPiAuLi4gdGhpczogVGhlc2Ug
c3VidHJhY3Rpb25zIGFyZSBwcm9uZSB0byB5aWVsZCBkZS1nZW5lcmF0ZQo+IGJpdGZpZWxkcyB3
aGVuIHRoZSBkaWZmZXJlbmNlIGVuZHMgdXAgemVybyAobGVhZGluZyB0bwo+IHByZXN1bWFibHkg
dmVyeSBzdHJhbmdlIGJyZWFrYWdlLCBhbGJlaXQgb25lIHdvdWxkIGhvcGUgdGhhdAo+IGl0IGFs
c28gd291bGQgYmUgdmVyeSBvYnZpb3VzIHRoYXQgX3NvbWV0aGluZ18gaXMgYnJva2VuKS4gSQo+
IHRoaW5rIHdlIG5lZWQgQlVJTERfQlVHX09OKClzIGNoZWNraW5nIHRoYXQgbmVpdGhlcgo+IGRp
ZmZlcmVuY2UgYWN0dWFsbHkgaXMgemVyby4KCk9rYXksIHdpbGwgYWRkIHRoZW0uCgoKSnVlcmdl
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
