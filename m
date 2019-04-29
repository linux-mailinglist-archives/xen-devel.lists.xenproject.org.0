Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966DE77F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 18:17:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8ve-0004Q0-3Y; Mon, 29 Apr 2019 16:14:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL8vd-0004Pv-2I
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:14:53 +0000
X-Inumbo-ID: eb03a4e4-6a99-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eb03a4e4-6a99-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 16:14:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 10:14:51 -0600
Message-Id: <5CC722F8020000780022A22C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 10:14:48 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
 <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
 <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
 <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
In-Reply-To: <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI5LjA0LjE5IGF0IDE4OjA1LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOTo1MiBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBJIGhhdmVuJ3QgcmUtZ3Jva2tlZCB0aGUgY29kZSBo
ZXJlLCBidXQgYXNzdW1pbmcgSSB3YXMgY29ycmVjdCAyIHdlZWtzCj4+IGFnbywgaWYgeW91IGhh
dmUgdGhlIEJVR19PTigpIHRoZXJlLCB5b3UgY2FuIGdldCByaWQgb2YgdGhlIGV4dHJhCj4+IHJl
ZmVyZW5jZXMuCj4gCj4gU3VyZSwgYnV0IGFnYWluLCB0aGUgb3ZlcmhlYWQgb2YgaGF2aW5nIHRo
ZW0gaW4tcGxhY2UgaXMgbmVnbGlnaWJsZSBzbwo+IG1pZ2h0IGFzIHdlbGwganVzdCBrZWVwIGl0
LgoKVGhlIG92ZXJoZWFkIGlzIG9ubHkgb25lIGFzcGVjdCBoZXJlLiBQZW9wbGUgbG9va2luZyBh
dCB0aGUgY29kZQptYXkgYWxzbyBiZSBtaXNsZWFkIGludG8gdHJ5aW5nIHRvIGZpZ3VyZSBvdXQg
d2h5IHRoZSBoZWNrIHRoaXMKZXh0cmEgcmVmZXJlbmNlIGdldHMgb2J0YWluZWQuIFBsdXMgc3Vi
LW9wdGltYWwgY29kZSB0ZW5kcyB0byBnZXQKY2xvbmVkIC4uLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
