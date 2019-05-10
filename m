Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65FB19D80
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 14:57:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP52s-0000NL-3p; Fri, 10 May 2019 12:54:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP52r-0000NG-4L
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 12:54:37 +0000
X-Inumbo-ID: c32420a8-7322-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c32420a8-7322-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 12:54:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 06:54:34 -0600
Message-Id: <5CD5748A020000780022D844@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 06:54:34 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-13-julien.grall@arm.com>
In-Reply-To: <20190507151458.29350-13-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 12/14] xen/x86: pv: Convert update_intpte()
 to use typesafe MFN
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

Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEBAIC0yMTc3LDggKzIxNzcsOCBAQCBzdGF0aWMgaW50IG1vZF9sMV9lbnRyeShsMV9wZ2VudHJ5
X3QgKnBsMWUsIGwxX3BnZW50cnlfdCBubDFlLAo+ICAgICAgfQo+ICAgICAgZWxzZSBpZiAoIHB2
X2wxdGZfY2hlY2tfbDFlKHB0X2RvbSwgbmwxZSkgKQo+ICAgICAgICAgIHJldHVybiAtRVJFU1RB
UlQ7Cj4gLSAgICBlbHNlIGlmICggdW5saWtlbHkoIVVQREFURV9FTlRSWShsMSwgcGwxZSwgb2wx
ZSwgbmwxZSwgZ2wxbWZuLCBwdF92Y3B1LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcHJlc2VydmVfYWQpKSApCj4gKyAgICBlbHNlIGlmICggdW5saWtlbHkoIVVQREFU
RV9FTlRSWShsMSwgcGwxZSwgb2wxZSwgbmwxZSwgZ2wxbWZuLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcHRfdmNwdSwgcHJlc2VydmVfYWQpKSApCgpTdHJheSBjaGFu
Z2U/Cgo+IEBAIC0zOTM5LDE1ICszOTQwLDE1IEBAIGxvbmcgZG9fbW11X3VwZGF0ZSgKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlmICgg
KHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2spID4KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoMSArICEhKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdU
X3Bpbm5lZCkgKwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocGFnZXRhYmxlX2dl
dF9wZm4oY3Vyci0+YXJjaC5ndWVzdF90YWJsZV91c2VyKSA9PQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbWZuKSArIGxvY2FsX2luX3VzZSkgKQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAobWZuX2VxKHBhZ2V0YWJsZV9nZXRfbWZuKGN1cnItPmFyY2guZ3Vlc3Rf
dGFibGVfdXNlciksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZu
KSkgKyBsb2NhbF9pbl91c2UpICkKClRoZXJlJ3MgYSBzdHJheSBwYWlyIG9mIHBhcmVudGhlc2Vz
IG5vdyBsZWZ0IGFyb3VuZCBhIGZ1bmN0aW9uIGNhbGwuCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9w
di9tbS5oCj4gKysrIGIveGVuL2FyY2gveDg2L3B2L21tLmgKPiBAQCAtMzcsNyArMzcsNyBAQCBz
dGF0aWMgaW5saW5lIGwxX3BnZW50cnlfdCBndWVzdF9nZXRfZWZmX2wxZSh1bnNpZ25lZCBsb25n
IGxpbmVhcikKPiAgICogUmV0dXJucyBmYWxzZSBmb3IgZmFpbHVyZSAocG9pbnRlciBub3QgdmFs
aWQpLCB0cnVlIGZvciBzdWNjZXNzLgo+ICAgKi8KPiAgc3RhdGljIGlubGluZSBib29sIHVwZGF0
ZV9pbnRwdGUoaW50cHRlX3QgKnAsIGludHB0ZV90IG9sZCwgaW50cHRlX3QgbmV3LAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG1mbiwgc3RydWN0IHZj
cHUgKnYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbiwgc3Ry
dWN0IHZjcHUgKnYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcHJl
c2VydmVfYWQpCgpXb3VsZCB5b3UgbWluZCByZS1mbG93aW5nIHRoaXMsIGFzIHRoZSBsYXN0IHBh
cmFtZXRlciBkZWNsYXJhdGlvbiBub3cKZml0cyBvbiB0aGUgZWFybGllciBsaW5lPwoKV2l0aCBh
dCBsZWFzdCB0aGUgZm9ybWVyIHR3byB0YWtlbiBjYXJlIG9mClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
