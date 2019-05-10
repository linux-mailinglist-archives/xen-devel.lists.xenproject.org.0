Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383E519E7A
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 15:51:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5t0-0006UI-5i; Fri, 10 May 2019 13:48:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP5sz-0006U6-3M
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:48:29 +0000
X-Inumbo-ID: 49efbeb2-732a-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 49efbeb2-732a-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 13:48:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 07:48:27 -0600
Message-Id: <5CD58127020000780022D963@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 07:48:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-12-julien.grall@arm.com>
 <5CD571FE020000780022D826@prv1-mh.provo.novell.com>
 <22eaed55-f714-0c97-385d-72cf796f5936@arm.com>
 <5CD57E04020000780022D8F0@prv1-mh.provo.novell.com>
 <fac9e2db-c746-5f53-bebc-0615fe60e8a4@arm.com>
In-Reply-To: <fac9e2db-c746-5f53-bebc-0615fe60e8a4@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 11/14] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA1LjE5IGF0IDE1OjQxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEwLzA1LzIwMTkgMTQ6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMC4wNS4x
OSBhdCAxNToyNywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDEwLzA1LzIw
MTkgMTM6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0
LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+PiArc3RhdGljIGlubGluZSB2b2lk
IHNldF9ncGZuX2Zyb21fbWZuKHVuc2lnbmVkIGxvbmcgbWZuLCB1bnNpZ25lZCBsb25nIHBmbikK
Pj4+Pj4gK3sKPj4+Pj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gcGFnZV9nZXRfb3duZXIobWZu
X3RvX3BhZ2UoX21mbihtZm4pKSk7Cj4+Pj4+ICsgICAgdW5zaWduZWQgbG9uZyBlbnRyeSA9IChk
ICYmIChkID09IGRvbV9jb3cpKSA/IFNIQVJFRF9NMlBfRU5UUlkgOiBwZm47Cj4+Pj4KPj4+PiBU
aGUgJiYgaGVyZSBsb29rcywgZWhtLCBmdW5ueSwgYnV0IEkgZ3Vlc3MgaXQncyBuZWVkZWQgZm9y
IGVhcmx5IGJvb3Q/Cj4+Pgo+Pj4gSSBoYXZlIG5vIGlkZWEsIHRoaXMgaXMgeDg2IG5vdCBBcm0u
Li4KPj4+Cj4+Pj4gQnV0IHRoYXQncyBwZXJoYXBzIGEgc2VwYXJhdGUgdGhpbmcgdG8gY2xlYW4g
dXAuIEhvd2V2ZXIsIGxvb2tpbmcgYXQKPj4+PiB0aGlzIC0gd2h5IGlzIEFybSBzZXR0aW5nIHVw
IGRvbV9jb3cgaW4gdGhlIGZpcnN0IHBsYWNlPwo+Pj4KPj4+IENvbW1vbiBjb2RlIGlzIHVzaW5n
IGRvbV9jb3csIHNvIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCBpdCB0byBiZSBOVUxMIG9uIEFybSB0
bwo+Pj4gYXZvaWQgd2VpcmQgaXNzdWVzLgo+PiAKPj4gSSBkaWRuJ3QgbWVhbiBpdCB0byByZW1h
aW4gTlVMTC4gQ29tbW9uIGNvZGUgZG9lc24ndCBkZXJlZmVyZW5jZSBpdAo+PiAoYW5kIGlzbid0
IHN1cHBvc2VkIHRvKSwgc28gSSdkIGNvbnNpZGVyIGluaXRpYWxpemluZyBpdCB0byBzb21lIGtu
b3duCj4+IGZhdWx0aW5nIG5vbi1OVUxMIGFkZHJlc3MsIGlmIHRoZXJlIGlzIHN1Y2ggb24gQXJt
Lgo+IAo+IFBhdGNoZXMgYXJlIHdlbGNvbWVkIDspLgoKU28gaXMgdGhlcmUgc3VjaCBhbiBhZGRy
ZXNzIG9uIEFybT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
