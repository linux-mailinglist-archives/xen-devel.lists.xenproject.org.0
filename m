Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA8C19ED3
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:14:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP6Gi-00014G-9O; Fri, 10 May 2019 14:13:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP6Gg-00014B-Lw
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:12:58 +0000
X-Inumbo-ID: b56fac4b-732d-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b56fac4b-732d-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 14:12:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 08:12:56 -0600
Message-Id: <5CD586E3020000780022D9D1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 08:12:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] x86/mm: free_page_type() is PV-only
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgaXQgYWxyZWFkeSBoYXMgYSBDT05GSUdfUFYgd3JhcHBlZCBhcm91bmQgaXRzIGVudGly
ZSBib2R5LCBpdCBpcwpzdGlsbCB1c2VsZXNzbHkgaW52b2tpbmcgbWZuX3RvX2dtZm4oKSwgd2hp
Y2ggaXMgYWJvdXQgdG8gYmUgcmVwbGFjZWQuCkF2b2lkIG1vcnBoaW5nIHRoaXMgY29kZSBpbnRv
IGV2ZW4gbW9yZSBzdXNwaWNpb3VzIHNoYXBlIGFuZCByZW1vdmUgdGhlCmVmZmVjdGl2ZWx5IGRl
YWQgY29kZSAtIHRyYW5zbGF0ZWQgbW9kZSBoYXMgYmVlbiBtYWRlIGltcG9zc2libGUgZm9yIFBW
CnF1aXRlIHNvbWUgdGltZSBhZ28uCgpBZGp1c3QgYW5kIGV4dGVuZCB0aGUgYXNzZXJ0aW9ucyBh
dCB0aGUgc2FtZSB0aW1lOiBUaGUgb3JpZ2luYWwKQVNTRVJUKCFzaGFkb3dfbW9kZV9yZWZjb3Vu
dHMob3duZXIpKSByZWFsbHkgbWVhbnMKQVNTRVJUKCFzaGFkb3dfbW9kZV9lbmFibGVkKG93bmVy
KSB8fCAhcGFnaW5nX21vZGVfcmVmY291bnRzKG93bmVyKSksCndoaWNoIGlzbid0IHdoYXQgd2Ug
d2FudCBoZXJlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTI2
MzIsNyArMjYzMiw2IEBAIGludCBmcmVlX3BhZ2VfdHlwZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWcK
IHsKICNpZmRlZiBDT05GSUdfUFYKICAgICBzdHJ1Y3QgZG9tYWluICpvd25lciA9IHBhZ2VfZ2V0
X293bmVyKHBhZ2UpOwotICAgIHVuc2lnbmVkIGxvbmcgZ21mbjsKICAgICBpbnQgcmM7CiAKICAg
ICBpZiAoIGxpa2VseShvd25lciAhPSBOVUxMKSAmJiB1bmxpa2VseShwYWdpbmdfbW9kZV9lbmFi
bGVkKG93bmVyKSkgKQpAQCAtMjY0MCwxMSArMjYzOSwxMSBAQCBpbnQgZnJlZV9wYWdlX3R5cGUo
c3RydWN0IHBhZ2VfaW5mbyAqcGFnCiAgICAgICAgIC8qIEEgcGFnZSB0YWJsZSBpcyBkaXJ0aWVk
IHdoZW4gaXRzIHR5cGUgY291bnQgYmVjb21lcyB6ZXJvLiAqLwogICAgICAgICBwYWdpbmdfbWFy
a19kaXJ0eShvd25lciwgcGFnZV90b19tZm4ocGFnZSkpOwogCi0gICAgICAgIEFTU0VSVCghc2hh
ZG93X21vZGVfcmVmY291bnRzKG93bmVyKSk7CisgICAgICAgIEFTU0VSVChzaGFkb3dfbW9kZV9l
bmFibGVkKG93bmVyKSk7CisgICAgICAgIEFTU0VSVCghcGFnaW5nX21vZGVfcmVmY291bnRzKG93
bmVyKSk7CisgICAgICAgIEFTU0VSVCghcGFnaW5nX21vZGVfdHJhbnNsYXRlKG93bmVyKSk7CiAK
LSAgICAgICAgZ21mbiA9IG1mbl90b19nbWZuKG93bmVyLCBtZm5feChwYWdlX3RvX21mbihwYWdl
KSkpOwotICAgICAgICBpZiAoIFZBTElEX00yUChnbWZuKSApCi0gICAgICAgICAgICBzaGFkb3df
cmVtb3ZlX2FsbF9zaGFkb3dzKG93bmVyLCBfbWZuKGdtZm4pKTsKKyAgICAgICAgc2hhZG93X3Jl
bW92ZV9hbGxfc2hhZG93cyhvd25lciwgcGFnZV90b19tZm4ocGFnZSkpOwogICAgIH0KIAogICAg
IGlmICggISh0eXBlICYgUEdUX3BhcnRpYWwpICkKCgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
