Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B619C34729
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 14:44:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY8ky-0002D4-Kn; Tue, 04 Jun 2019 12:41:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY8kx-0002Cy-JM
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 12:41:35 +0000
X-Inumbo-ID: 14ef0c1c-86c6-11e9-a19e-2f46c13972db
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14ef0c1c-86c6-11e9-a19e-2f46c13972db;
 Tue, 04 Jun 2019 12:41:33 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 06:41:31 -0600
Message-Id: <5CF666F90200007800235113@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 06:41:29 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CF664580200007800235089@prv1-mh.provo.novell.com>
In-Reply-To: <5CF664580200007800235089@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 1/4] x86/PV: tighten page table ownership
 check in emul-priv-op.c:read_cr()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmF0aGVyIHRoYW4gY2hlY2tpbmcgdGhhdCBhIHBhZ2UgdGFibGUgaXMgX25vdF8gIm93bmVkIiBi
eSB0aGUgZmFrZSBDT1cKZG9tYWluLCBjaGVjayB0aGF0IGl0J3Mgb3duZWQgYnkgdGhlIGRvbWFp
biBhY3R1YWxseSB3YW50aW5nIHRvIGluc3RhbGwKaXQuCgpTd2l0Y2ggYXdheSBmcm9tIEJVR19P
TigpIGF0IHRoZSBzYW1lIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Ci0tLQp2MjogU3BsaXQgb3V0IGZyb20gbGFyZ2VyIHBhdGNoIHRvIG1ha2Ug
ZnVydGhlciBhZGp1c3RtZW50cy4KLS0tClRoaW5raW5nIGFib3V0IGl0IEkgd29uZGVyIHdoeSB3
ZSBoYXZlIHN1Y2ggYSBjaGVjayBoZXJlIGFuZCBuby13aGVyZQplbHNlLiBBbiBhbHRlcm5hdGl2
ZSB3b3VsZCBzZWVtIHRvIGJlIHRvIHNpbXBseSBkcm9wIHRoZSBCVUdfT04oKS4KCi0tLSBhL3hl
bi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYworKysgYi94ZW4vYXJjaC94ODYvcHYvZW11bC1w
cml2LW9wLmMKQEAgLTcwNiw3ICs3MDYsNyBAQCBzdGF0aWMgaW50IHJlYWRfY3IodW5zaWduZWQg
aW50IHJlZywgdW5zCiAKICAgICBjYXNlIDM6IC8qIFJlYWQgQ1IzICovCiAgICAgewotICAgICAg
ICBjb25zdCBzdHJ1Y3QgZG9tYWluICpjdXJyZCA9IGN1cnItPmRvbWFpbjsKKyAgICAgICAgc3Ry
dWN0IGRvbWFpbiAqY3VycmQgPSBjdXJyLT5kb21haW47CiAgICAgICAgIG1mbl90IG1mbjsKIAog
ICAgICAgICBpZiAoICFpc19wdl8zMmJpdF9kb21haW4oY3VycmQpICkKQEAgLTcyMyw4ICs3MjMs
MTQgQEAgc3RhdGljIGludCByZWFkX2NyKHVuc2lnbmVkIGludCByZWcsIHVucwogICAgICAgICAg
ICAgdW5tYXBfZG9tYWluX3BhZ2UocGw0ZSk7CiAgICAgICAgICAgICAqdmFsID0gY29tcGF0X3Bm
bl90b19jcjMobWZuX3RvX2dtZm4oY3VycmQsIG1mbl94KG1mbikpKTsKICAgICAgICAgfQotICAg
ICAgICAvKiBQVHMgc2hvdWxkIG5vdCBiZSBzaGFyZWQgKi8KLSAgICAgICAgQlVHX09OKHBhZ2Vf
Z2V0X293bmVyKG1mbl90b19wYWdlKG1mbikpID09IGRvbV9jb3cpOworCisgICAgICAgIC8qIFBU
cyBzaG91bGQgYmUgb3duZWQgYnkgdGhlaXIgZG9tYWlucyAqLworICAgICAgICBpZiAoIHBhZ2Vf
Z2V0X293bmVyKG1mbl90b19wYWdlKG1mbikpICE9IGN1cnJkICkKKyAgICAgICAgeworICAgICAg
ICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CisgICAgICAgICAgICBkb21haW5fY3Jhc2goY3Vy
cmQpOworICAgICAgICB9CisKICAgICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKICAgICB9CiAg
ICAgfQoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
