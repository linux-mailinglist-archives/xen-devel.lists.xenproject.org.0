Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5896EB21A1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 16:10:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8mEO-0001BU-Gz; Fri, 13 Sep 2019 14:07:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mE8E=XI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8mEM-0001BP-P0
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 14:07:22 +0000
X-Inumbo-ID: cd159d98-d62f-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd159d98-d62f-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 14:07:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BB048B665;
 Fri, 13 Sep 2019 14:07:19 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-31-jgross@suse.com>
 <a637c5a4-d1f6-bf43-6eb2-c9702a79ca48@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <36e873f4-b6d1-bb8e-ec98-50e123636358@suse.com>
Date: Fri, 13 Sep 2019 16:07:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a637c5a4-d1f6-bf43-6eb2-c9702a79ca48@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 30/48] xen/sched: introduce
 unit_runnable_state()
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
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMTkgMTI6MzAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTI2Niw3ICsyNjYsNyBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgc2NoZWRfdW5pdF9ydW5zdGF0ZV9jaGFuZ2Uoc3RydWN0IHNjaGVkX3Vu
aXQgKnVuaXQsCj4+ICAgICAgIHN0cnVjdCB2Y3B1ICp2ID0gdW5pdC0+dmNwdV9saXN0Owo+PiAg
IAo+PiAgICAgICBpZiAoIHJ1bm5pbmcgKQo+PiAtICAgICAgICB2Y3B1X3J1bnN0YXRlX2NoYW5n
ZSh2LCBSVU5TVEFURV9ydW5uaW5nLCBuZXdfZW50cnlfdGltZSk7Cj4+ICsgICAgICAgIHZjcHVf
cnVuc3RhdGVfY2hhbmdlKHYsIHYtPm5ld19zdGF0ZSwgbmV3X2VudHJ5X3RpbWUpOwo+IAo+IFN0
cmljdGx5IHNwZWFraW5nIHRoaXMgaXMgd3Jvbmcgd2hlbiB0aGVyZSdzIG5vIGFjdHVhbCBzdGF0
ZQo+IGNoYW5nZSwgYXMgdGhlIHN0YXRlIGVudHJ5IHRpbWUgdGhlbiBzaG91bGRuJ3QgY2hhbmdl
LiBRdWl0ZQo+IHBvc3NpYmx5IHRoaXMgd291bGQgYmUgbWVyZWx5IGEgY29zbWV0aWMgaXNzdWUg
dGhvdWdoLgoKVGhpcyB3aWxsIGJlIGNoYW5nZWQgaW4gdmNwdV9ydW5zdGF0ZV9jaGFuZ2UoKSB3
aXRoIHBhdGNoIDMxIHdoZW4gdGhpcwpzaXR1YXRpb24gaXMgYWN0dWFsbHkgcG9zc2libGUuIFdp
dGggb25seSBvbmUgdmNwdSBpbiBhIHVuaXQgdGhlIHN0YXRlCndpbGwgYWx3YXlzIGNoYW5nZSBo
ZXJlLCB3aGlsZSBhZnRlciB0aGUgbmV4dCBwYXRjaAp2Y3B1X3J1bnN0YXRlX2NoYW5nZSgpIHdp
bGwgcmV0dXJuIGVhcmx5IGluIGNhc2UgdGhlIHN0YXRlIGlzbid0CmNoYW5naW5nLgoKPiAKPj4g
LS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmgKPj4gQEAgLTc1LDYgKzc1LDIwIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB1bml0
X3J1bm5hYmxlKGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQo+PiAgICAgICByZXR1cm4g
dmNwdV9ydW5uYWJsZSh1bml0LT52Y3B1X2xpc3QpOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCB1bml0X3J1bm5hYmxlX3N0YXRlKGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICp1
bml0KQo+PiArewo+PiArICAgIHN0cnVjdCB2Y3B1ICp2Owo+PiArICAgIGJvb2wgcnVubmFibGU7
Cj4+ICsKPj4gKyAgICB2ID0gdW5pdC0+dmNwdV9saXN0Owo+PiArICAgIHJ1bm5hYmxlID0gdmNw
dV9ydW5uYWJsZSh2KTsKPj4gKwo+PiArICAgIHYtPm5ld19zdGF0ZSA9IHJ1bm5hYmxlID8gUlVO
U1RBVEVfcnVubmluZwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogKHYtPnBhdXNl
X2ZsYWdzICYgVlBGX2Jsb2NrZWQpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA/
IFJVTlNUQVRFX2Jsb2NrZWQgOiBSVU5TVEFURV9vZmZsaW5lOwo+PiArICAgIHJldHVybiBydW5u
YWJsZTsKPj4gK30KPiAKPiBFc3BlY2lhbGx5IGZvciB1bmRlcnN0YW5kaW5nIHRoZSAoY29ycmVj
dG5lc3Mgb2YgdGhlKSBjcmVkaXQxCj4gY2hhbmdlcyBpdCB3b3VsZCBiZSByYXRoZXIgaGVscGZ1
bCBpZiBvbmNlIGFnYWluIHRoaXMgZnVuY3Rpb24KPiBhY3R1YWxseSBpdGVyYXRlZCBvdmVyIGFs
bCB2Q1BVLXMgcmlnaHQgYXdheSAoZXZlbiBpZiB0aGVyZSdzCj4gb25seSBvbmUgcGVyIHVuaXQg
cmlnaHQgbm93KSwgdG8gc2VlIGhvdyB0aGVpciB2YXJ5aW5nIHN0YXRlcwo+IGdldCBjb21iaW5l
ZC4KCk9rYXksIHdpbGwgbW92ZSBpdC4KCj4gCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4+IEBAIC0xNzQsNiArMTc0LDcg
QEAgc3RydWN0IHZjcHUKPj4gICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEUodmNwdV9ydW5zdGF0
ZV9pbmZvX2NvbXBhdF90KSBjb21wYXQ7Cj4+ICAgICAgIH0gcnVuc3RhdGVfZ3Vlc3Q7IC8qIGd1
ZXN0IGFkZHJlc3MgKi8KPj4gICAjZW5kaWYKPj4gKyAgICBpbnQgICAgICAgICAgICAgIG5ld19z
dGF0ZTsKPiAKPiBJIHJlYWxpemUgaXRzIGNvdW50ZXJwYXJ0ICh3cm9uZ2x5KSBpcyBwbGFpbiBp
bnQgaW4gdGhlIHB1YmxpYwo+IGludGVyZmFjZSAtIEkgdGhpbmsgaXQgc2hvdWxkIGJlIHVuc2ln
bmVkIGludCBoZXJlIGFuZCB1aW50MzJfdAo+IHRoZXJlLiBJJ20gcG9uZGVyaW5nIHdoZXRoZXIg
dG8gZG8gYSBzd2lwZSBhY3Jvc3MgYWxsIHB1YmxpYwo+IGhlYWRlcnMgdG8gcmVwbGFjZSBhbGwg
dXNlcyBvZiBwbGFpbiBpbnQgKGFuZCBhbGlrZSkgd2l0aAo+IGZpeGVkIHdpZHRoIHR5cGVzLgoK
VGhlIGxpc3QgZm9yIGNsZWFudXBzIGlzIGJlY29taW5nIGxvbmdlci4uLgoKU28gYXJlIHlvdSBm
aW5lIHdpdGggbWUgbm90IGNoYW5naW5nIGFueXRoaW5nIGluIHRoaXMgcmVnYXJkIHJpZ2h0IG5v
dz8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
