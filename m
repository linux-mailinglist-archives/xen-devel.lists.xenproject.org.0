Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769CA35791
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 09:21:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYQBQ-0001Wj-MH; Wed, 05 Jun 2019 07:18:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYQBP-0001We-Hh
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 07:18:03 +0000
X-Inumbo-ID: 0dd40e95-8762-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0dd40e95-8762-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 07:18:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 01:18:01 -0600
Message-Id: <5CF76CA802000078002355A3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 01:18:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-10-julien.grall@arm.com>
 <5CF69A800200007800235346@prv1-mh.provo.novell.com>
 <70c2a03b-12f2-f845-9afc-df45f3293c79@arm.com>
In-Reply-To: <70c2a03b-12f2-f845-9afc-df45f3293c79@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 09/14] xen/x86: mm: Re-implement
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDE4OjIzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDYvNC8xOSA1OjIxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDMuMDYuMTkg
YXQgMTg6MDMsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L21tLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+Pj4g
QEAgLTQ0Miw2ICs0NDIsOCBAQCBpbnQgY2hlY2tfZGVzY3JpcHRvcihjb25zdCBzdHJ1Y3QgZG9t
YWluICpkLCBzZWdfZGVzY190ICpkZXNjKTsKPj4+ICAgCj4+PiAgIGV4dGVybiBwYWRkcl90IG1l
bV9ob3RwbHVnOwo+Pj4gICAKPj4+ICtleHRlcm4gc3RydWN0IGRvbWFpbiAqZG9tX3hlbiwgKmRv
bV9pbywgKmRvbV9jb3c7CS8qIGZvciB2bWNvcmVpbmZvICovCj4+IAo+PiBBaCwgbm93IEkgc2Vl
IHdoYXQgQW5kcmV3IHdhcyB0YWxraW5nIGFib3V0LiBJbiBteSBwYXRjaCwgSSdsbCBtb3ZlCj4+
IHRoZSBkZWNsYXJhdGlvbnMgYWhlYWQgb2YgdGhlIGFzbS9tbS5oIGluY2x1c2lvbiBwb2ludCB0
aGVuLgo+IAo+IERvIHlvdSBwbGFuIHRvIG1lcmdlIHlvdXIgcGF0Y2ggZmlyc3Q/IEp1c3QgdG8g
a25vdyBpZiBJIG5lZWQgdG8gcmViYXNlLgoKV2VsbCwgdGhhdCBsYXJnZWx5IGRlcGVuZHMgb24g
aGF2aW5nIHRoZSBuZWNlc3NhcnkgYWNrcwooaS5lLiBpbiBwYXJ0aWN1bGFyIHlvdXJzIGZvciB0
aGUgQXJtIGNoYW5nZXMpIGluIHBsYWNlLiBJZiBJCmhhZCBhbiBBcm0gYWNrLCB0aGUgcGF0Y2gg
Y291bGQgZ28gaW4gcmlnaHQgYXdheSAod2l0aCB0aGUKYWRqdXN0bWVudHMgbWFkZSBhcyByZXF1
ZXN0ZWQgYnkgQW5kcmV3KSBhZmFpY3QuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
