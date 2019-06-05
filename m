Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41FF35F51
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 16:32:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYWvj-0007QZ-LZ; Wed, 05 Jun 2019 14:30:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYWvh-0007QU-TA
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 14:30:17 +0000
X-Inumbo-ID: 6ed14dac-879e-11e9-896b-9722921a8c00
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ed14dac-879e-11e9-896b-9722921a8c00;
 Wed, 05 Jun 2019 14:30:15 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 08:30:13 -0600
Message-Id: <5CF7D1F30200007800235943@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 08:30:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] memory: don't depend on
 guest_handle_subrange_okay() implementation details
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Z3Vlc3RfaGFuZGxlX3N1YnJhbmdlX29rYXkoKSB0YWtlcyBpbmNsdXNpdmUgZmlyc3QgYW5kIGxh
c3QgcGFyYW1ldGVycywKaS5lLiBjaGVja3MgdGhhdCBbZmlyc3QsIGxhc3RdIGlzIHZhbGlkLiBN
YW55IGNhbGxlcnMsIGhvd2V2ZXIsIGFjdHVhbGx5Cm5lZWQgdG8gc2VlIHdoZXRoZXIgW2ZpcnN0
LCBsaW1pdCkgaXMgdmFsaWQgKGkuZS4sIGxpbWl0IGlzIG5vbi0KaW5jbHVzaXZlKSwgYW5kIHRv
IGRvIHRoaXMgdGhleSBzdWJ0cmFjdCAxIGZyb20gdGhlIHNpemUuIFRoaXMgaXMKbm9ybWFsbHkg
Y29ycmVjdCwgZXhjZXB0IGluIGNhc2VzIHdoZXJlIGZpcnN0ID09IGxpbWl0LCBpbiB3aGljaCBj
YXNlCmd1ZXN0X2hhbmRsZV9zdWJyYW5nZV9va2F5KCkgd2lsbCBiZSBwYXNzZWQgYSBzZWNvbmQg
cGFyYW1ldGVyIGxlc3MgdGhhbgppdHMgZmlyc3QuCgpBcyBpdCBoYXBwZW5zLCBkdWUgdG8gdGhl
IHdheSB0aGUgbWF0aCBpcyBpbXBsZW1lbnRlZCBpbiB4ODYncwpndWVzdF9oYW5kbGVfc3VicmFu
Z2Vfb2theSgpLCB0aGUgcmV0dXJuIHZhbHVlIHR1cm5zIG91dCB0byBiZSBjb3JyZWN0OwpidXQg
d2Ugc2hvdWxkbuKAmXQgcmVseSBvbiB0aGlzIGJlaGF2aW9yLgoKTWFrZSBzdXJlIGFsbCBjYWxs
ZXJzIGhhbmRsZSBmaXJzdCA9PSBsaW1pdCBleHBsaWNpdGx5IGJlZm9yZSBjYWxsaW5nCmd1ZXN0
X2hhbmRsZV9zdWJyYW5nZV9va2F5KCkuCgpOb3RlIHRoYXQgdGhlIG90aGVyIHVzZXMgKGluY3Jl
YXNlLXJlc2VydmF0aW9uLCBwb3B1bGF0ZS1waHlzbWFwLCBhbmQKZGVjcmVhc2UtcmVzZXJ2YXRp
b24pIGFyZSBhbHJlYWR5IGZpbmUgZHVlIHRvIGEgc3VpdGFibGUgY2hlY2sgaW4KZG9fbWVtb3J5
X29wKCkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgot
LS0gYS94ZW4vY29tbW9uL21lbW9yeS5jCisrKyBiL3hlbi9jb21tb24vbWVtb3J5LmMKQEAgLTU0
MSw2ICs1NDEsOSBAQCBzdGF0aWMgbG9uZyBtZW1vcnlfZXhjaGFuZ2UoWEVOX0dVRVNUX0hBCiAg
ICAgICAgIGdvdG8gZmFpbF9lYXJseTsKICAgICB9CiAKKyAgICBpZiAoIGV4Y2gubnJfZXhjaGFu
Z2VkID09IGV4Y2guaW4ubnJfZXh0ZW50cyApCisgICAgICAgIHJldHVybiAwOworCiAgICAgaWYg
KCAhZ3Vlc3RfaGFuZGxlX3N1YnJhbmdlX29rYXkoZXhjaC5pbi5leHRlbnRfc3RhcnQsIGV4Y2gu
bnJfZXhjaGFuZ2VkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4Y2gu
aW4ubnJfZXh0ZW50cyAtIDEpICkKICAgICB7CkBAIC04NjYsOSArODY5LDEyIEBAIHN0YXRpYyBp
bnQgeGVubWVtX2FkZF90b19waHlzbWFwX2JhdGNoKHMKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fYWRkX3RvX3BoeXNtYXBfYmF0Y2ggKnhhdHBiLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGV4dGVu
dCkKIHsKLSAgICBpZiAoIHhhdHBiLT5zaXplIDwgZXh0ZW50ICkKKyAgICBpZiAoIHVubGlrZWx5
KHhhdHBiLT5zaXplIDwgZXh0ZW50KSApCiAgICAgICAgIHJldHVybiAtRUlMU0VROwogCisgICAg
aWYgKCB1bmxpa2VseSh4YXRwYi0+c2l6ZSA9PSBleHRlbnQpICkKKyAgICAgICAgcmV0dXJuIGV4
dGVudCA/IC1FSUxTRVEgOiAwOworCiAgICAgaWYgKCAhZ3Vlc3RfaGFuZGxlX3N1YnJhbmdlX29r
YXkoeGF0cGItPmlkeHMsIGV4dGVudCwgeGF0cGItPnNpemUgLSAxKSB8fAogICAgICAgICAgIWd1
ZXN0X2hhbmRsZV9zdWJyYW5nZV9va2F5KHhhdHBiLT5ncGZucywgZXh0ZW50LCB4YXRwYi0+c2l6
ZSAtIDEpIHx8CiAgICAgICAgICAhZ3Vlc3RfaGFuZGxlX3N1YnJhbmdlX29rYXkoeGF0cGItPmVy
cnMsIGV4dGVudCwgeGF0cGItPnNpemUgLSAxKSApCgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
