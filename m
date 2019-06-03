Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF5B32CE2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 11:31:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjFL-0001Xw-0C; Mon, 03 Jun 2019 09:27:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXjFJ-0001Xr-ON
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 09:27:13 +0000
X-Inumbo-ID: c191ce36-85e1-11e9-b597-332e37bb89bf
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c191ce36-85e1-11e9-b597-332e37bb89bf;
 Mon, 03 Jun 2019 09:27:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 03:27:06 -0600
Message-Id: <5CF4E7E702000078002347A9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 03:27:03 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Baodong Chen" <chenbaodong@mxnavi.com>
References: <1559525627-2701-1-git-send-email-chenbaodong@mxnavi.com>
In-Reply-To: <1559525627-2701-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RESEND] xen: notifier: refine
 'notifier_head', use 'list_head' directly
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA2LjE5IGF0IDAzOjMzLCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6
Cj4gJ25vdGlmaWVyX2Jsb2NrJyBjYW4gYmUgcmVwbGFjZWQgd2l0aCAnbGlzdF9oZWFkJyB3aGVu
IHVzZWQgZm9yCj4gJ25vdGlmaWVyX2hlYWQnLCB0aGlzIG1ha2UgdGhlIGEgbGl0dGxlIG1vcmUg
Y2xlYXIuCgpJIGd1ZXNzIHlvdSBtZWFuICIuLi4gbWFrZXMgdGhlIGNvZGUgYSBsaXR0bGUgLi4u
Ij8KCj4gQEAgLTcxLDE2ICs3MSwxNiBAQCBpbnQgbm90aWZpZXJfY2FsbF9jaGFpbigKPiAgewo+
ICAgICAgaW50IHJldCA9IE5PVElGWV9ET05FOwo+ICAgICAgc3RydWN0IGxpc3RfaGVhZCAqY3Vy
c29yOwo+IC0gICAgc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYjsKPiArICAgIHN0cnVjdCBub3Rp
Zmllcl9ibG9jayAqbmIgPSBOVUxMOwo+ICAgICAgYm9vbF90IHJldmVyc2UgPSAhISh2YWwgJiBO
T1RJRllfUkVWRVJTRSk7Cj4gIAo+IC0gICAgY3Vyc29yID0gJihwY3Vyc29yICYmICpwY3Vyc29y
ID8gKnBjdXJzb3IgOiAmbmgtPmhlYWQpLT5jaGFpbjsKPiArICAgIGN1cnNvciA9IChwY3Vyc29y
ICYmICpwY3Vyc29yID8gJigqcGN1cnNvciktPmNoYWluIDogJm5oLT5oZWFkKTsKClRoZSBvdXRl
cm1vc3QgcGFyZW50aGVzZXMgYXJlIG5vdyBub3QgcmVhbGx5IG5lZWRlZCBhbnltb3JlLgoKPiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vbm90aWZpZXIuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9u
b3RpZmllci5oCj4gQEAgLTI5LDEzICsyOSwxMiBAQCBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgewo+
ICB9Owo+ICAKPiAgc3RydWN0IG5vdGlmaWVyX2hlYWQgewo+IC0gICAgc3RydWN0IG5vdGlmaWVy
X2Jsb2NrIGhlYWQ7Cj4gKyAgICBzdHJ1Y3QgbGlzdF9oZWFkIGhlYWQ7Cj4gIH07Cj4gIAo+IC0j
ZGVmaW5lIE5PVElGSUVSX0lOSVQobmFtZSkgeyAuaGVhZC5jaGFpbiA9IExJU1RfSEVBRF9JTklU
KG5hbWUuaGVhZC5jaGFpbikgfQoKTm90ZSB0aGUgYmxhbmtzIGltbWVkaWF0ZWx5IGluc2lkZSB0
aGUgZmlndXJlIGJyYWNlcyAtIC4uLgoKPiArI2RlZmluZSBOT1RJRklFUl9IRUFEKG5hbWUpICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICBz
dHJ1Y3Qgbm90aWZpZXJfaGVhZCBuYW1lID0gey5oZWFkID0gTElTVF9IRUFEX0lOSVQobmFtZS5o
ZWFkKX0KCi4uLiBwbGVhc2UgZG9uJ3QgYnJlYWsgc3VjaCBzdHlsZSBhc3BlY3RzLCB1bmxlc3Mg
eW91IGtub3cKaXQgaXMgc29tZXRoaW5nIHRoYXQgbmVlZHMgZml4aW5nIChmb3IgYmVpbmcgaW4g
dmlvbGF0aW9uIG9mIG91cgpzdHlsZSBndWlkZWxpbmVzKS4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
