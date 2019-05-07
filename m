Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A5916389
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 14:14:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNywf-0006rE-Un; Tue, 07 May 2019 12:11:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNywe-0006qh-JH
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 12:11:40 +0000
X-Inumbo-ID: 44ac172d-70c1-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 44ac172d-70c1-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 12:11:39 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 06:11:38 -0600
Message-Id: <5CD175F5020000780022C7EF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 06:11:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Eslam Elnikety" <elnikety@amazon.com>
References: <20190507113405.71851-1-elnikety@amazon.com>
In-Reply-To: <20190507113405.71851-1-elnikety@amazon.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2] mm: option to _always_ scrub freed
 domheap pages
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
 xen-devel <xen-devel@lists.xenproject.org>, Amit Shah <aams@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDEzOjM0LCA8ZWxuaWtldHlAYW1hem9uLmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuYwo+IEBAIC0yMTQsNiArMjE0LDEwIEBAIGN1c3RvbV9wYXJhbSgiYm9vdHNjcnViIiwgcGFy
c2VfYm9vdHNjcnViX3BhcmFtKTsKPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0ZGF0YSBv
cHRfYm9vdHNjcnViX2NodW5rID0gTUIoMTI4KTsKPiAgc2l6ZV9wYXJhbSgiYm9vdHNjcnViX2No
dW5rIiwgb3B0X2Jvb3RzY3J1Yl9jaHVuayk7Cj4gIAo+ICsgLyogc2NydWItZG9taGVhcCAtPiBE
b21oZWFwIHBhZ2VzIGFyZSBzY3J1YmJlZCB3aGVuIGZyZWVkICovCj4gK3N0YXRpYyBib29sIF9f
cmVhZF9tb3N0bHkgb3B0X3NjcnViX2RvbWhlYXA7Cj4gK2Jvb2xlYW5fcGFyYW0oInNjcnViLWRv
bWhlYXAiLCBvcHRfc2NydWJfZG9taGVhcCk7CgpVcG9uIDJuZCB0aG91Z2h0IHRoaXMsIGJ0dywg
d291bGQgc2VlbSB0byBiZSBhbiBleGNlbGxlbnQgY2FuZGlkYXRlCmZvciBiZWNvbWluZyBhIHJ1
bnRpbWUgcGFyYW1ldGVyLgoKPiBAQCAtMjM3OCw5ICsyMzgyLDEwIEBAIHZvaWQgZnJlZV9kb21o
ZWFwX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8gKnBnLCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gICAg
ICAgICAgICAgIC8qCj4gICAgICAgICAgICAgICAqIE5vcm1hbGx5IHdlIGV4cGVjdCBhIGRvbWFp
biB0byBjbGVhciBwYWdlcyBiZWZvcmUgZnJlZWluZyB0aGVtLAo+ICAgICAgICAgICAgICAgKiBp
ZiBpdCBjYXJlcyBhYm91dCB0aGUgc2VjcmVjeSBvZiB0aGVpciBjb250ZW50cy4gSG93ZXZlciwg
YWZ0ZXIKPiAtICAgICAgICAgICAgICogYSBkb21haW4gaGFzIGRpZWQgd2UgYXNzdW1lIHJlc3Bv
bnNpYmlsaXR5IGZvciBlcmFzdXJlLgo+ICsgICAgICAgICAgICAgKiBhIGRvbWFpbiBoYXMgZGll
ZCB3ZSBhc3N1bWUgcmVzcG9uc2liaWxpdHkgZm9yIGVyYXN1cmUuIFdlIGRvCj4gKyAgICAgICAg
ICAgICAqIHNjcnViIHJlZ2FyZGxlc3MgaWYgb3B0aW9uIHNjcnViX2RvbWhlYXAgaXMgc2V0Lgo+
ICAgICAgICAgICAgICAgKi8KPiAtICAgICAgICAgICAgc2NydWIgPSBkLT5pc19keWluZyB8fCBz
Y3J1Yl9kZWJ1ZzsKPiArICAgICAgICAgICAgc2NydWIgPSBkLT5pc19keWluZyB8fCBzY3J1Yl9k
ZWJ1ZyB8fCBvcHRfc2NydWJfZG9taGVhcDsKCkRpZCB5b3UgY29uc2lkZXIgc2V0dGluZyBvcHRf
c2NydWJfZG9taGVhcCB3aGVuIHNjcnViX2RlYnVnIGlzCnNldD8gVGhpcyB3b3VsZCBzaG9ydGVu
IHRoZSAocnVudGltZSkgY2FsY3VsYXRpb24gaGVyZSBieSBhIHRpbnkgYml0LAphdCB0aGUgcHJp
Y2Ugb2YgZG9pbmcgb25lIG1vcmUgdGhpbmcgb25jZSB3aGlsZSBib290aW5nLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
