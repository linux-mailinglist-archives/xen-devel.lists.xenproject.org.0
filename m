Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9A419F10
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:24:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP6Or-00027k-4g; Fri, 10 May 2019 14:21:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP6Op-00027c-ML
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:21:23 +0000
X-Inumbo-ID: e2115200-732e-11e9-85ce-4f8d15d7805b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2115200-732e-11e9-85ce-4f8d15d7805b;
 Fri, 10 May 2019 14:21:21 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 08:21:20 -0600
Message-Id: <5CD588E1020000780022D9FF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 08:21:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-12-julien.grall@arm.com>
 <5CD571FE020000780022D826@prv1-mh.provo.novell.com>
 <22eaed55-f714-0c97-385d-72cf796f5936@arm.com>
 <5CD57E04020000780022D8F0@prv1-mh.provo.novell.com>
 <fac9e2db-c746-5f53-bebc-0615fe60e8a4@arm.com>
 <5CD58127020000780022D963@prv1-mh.provo.novell.com>
 <210fee0a-bbd0-ccef-82d5-d81ed55ef587@arm.com>
In-Reply-To: <210fee0a-bbd0-ccef-82d5-d81ed55ef587@arm.com>
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

Pj4+IE9uIDEwLjA1LjE5IGF0IDE2OjA1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEwLzA1LzIwMTkgMTQ6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMC4wNS4x
OSBhdCAxNTo0MSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDEwLzA1LzIw
MTkgMTQ6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IEkgZGlkbid0IG1lYW4gaXQgdG8gcmVt
YWluIE5VTEwuIENvbW1vbiBjb2RlIGRvZXNuJ3QgZGVyZWZlcmVuY2UgaXQKPj4+PiAoYW5kIGlz
bid0IHN1cHBvc2VkIHRvKSwgc28gSSdkIGNvbnNpZGVyIGluaXRpYWxpemluZyBpdCB0byBzb21l
IGtub3duCj4+Pj4gZmF1bHRpbmcgbm9uLU5VTEwgYWRkcmVzcywgaWYgdGhlcmUgaXMgc3VjaCBv
biBBcm0uCj4+Pgo+Pj4gUGF0Y2hlcyBhcmUgd2VsY29tZWQgOykuCj4+IAo+PiBTbyBpcyB0aGVy
ZSBzdWNoIGFuIGFkZHJlc3Mgb24gQXJtPwo+IAo+IDAgLSAyTUIgaXMgdW5tYXBwZWQgc28gZmFy
LiBJIGRvbid0IGtub3cgd2hldGhlciB0aGlzIHdpbGwgc3RpbGwgYmUgdGhlIGNhc2UgKGF0IAo+
IGxlYXN0IGZvciB0aGUgcmFuZ2UgNEtCIC0gMk1CKSB3aXRoIHRoZSByZXdvcmsgSSBhbSBhdHRl
bXB0aW5nLgoKSG1tLCBJIHdhcyBob3BpbmcgZm9yIGFuIGFyY2hpdGVjdHVyYWxseSBmYXVsdGlu
ZyBhZGRyZXNzLCBsaWtlCnRoZSBub24tY2Fub25pY2FsIG9uZXMgd2UgaGF2ZSBvbiB4ODYtNjQu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
