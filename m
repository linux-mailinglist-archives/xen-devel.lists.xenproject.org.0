Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA7179F5
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 15:10:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMIA-0006Pq-Ly; Wed, 08 May 2019 13:07:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOMI9-0006Pl-5A
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:07:25 +0000
X-Inumbo-ID: 3850499c-7192-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3850499c-7192-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 13:07:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 07:07:23 -0600
Message-Id: <5CD2D489020000780022CD34@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 07:07:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
In-Reply-To: <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 03/12] x86/IRQ: avoid UB (or worse) in
 trace_irq_mask()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHluYW1pY2FsbHkgYWxsb2NhdGVkIENQVSBtYXNrIG9iamVjdHMgbWF5IGJlIHNtYWxsZXIgdGhh
biBjcHVtYXNrX3QsIHNvCmNvcHlpbmcgaGFzIHRvIGJlIHJlc3RyaWN0ZWQgdG8gdGhlIGFjdHVh
bCBhbGxvY2F0aW9uIHNpemUuIFRoaXMgaXMKcGFydGljdWxhcnkgaW1wb3J0YW50IHNpbmNlIHRo
ZSBmdW5jdGlvbiBkb2Vzbid0IGJhaWwgZWFybHkgd2hlbiB0cmFjaW5nCmlzIG5vdCBhY3RpdmUs
IHNvIGV2ZW4gcHJvZHVjdGlvbiBidWlsZHMgd291bGQgYmUgYWZmZWN0ZWQgYnkgcG90ZW50aWFs
Cm1pc2JlaGF2aW9yIGhlcmUuCgpUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbwotIHVzZSBp
bml0aWFsaXplcnMgaW5zdGVhZCBvZiBhc3NpZ25tZW50ICsgbWVtc2V0KCksCi0gY29uc3RpZnkg
dGhlIGNwdW1hc2tfdCBpbnB1dCBwb2ludGVyLAotIHUzMiAtPiB1aW50MzJfdC4KClNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYyOiBOZXcuCi0tLQpU
QkQ6IEkgd29uZGVyIHdoZXRoZXIgdGhlIGZ1bmN0aW9uIHNob3VsZG4ndCBnYWluIGFuIGVhcmx5
IHRiX2luaXRfZG9uZQogICAgIGNoZWNrLCBsaWtlIG1hbnkgb3RoZXIgdHJhY2VfKigpIGhhdmUu
CgpHZW9yZ2UsIGRlc3BpdGUgeW91ciBnZW5lcmFsIHJlcXVlc3QgdG8gYmUgY29waWVkIG9uIGVu
dGlyZSBzZXJpZXMKcmF0aGVyIHRoYW4gaW5kaXZpZHVhbCBwYXRjaGVzLCBJIHRob3VnaHQgaXQg
d291bGQgYmUgYmV0dGVyIHRvIGNvcHkKeW91IG9uIGp1c3QgdGhpcyBvbmUgKGZvciBpdHMgdHJh
Y2luZyBhc3BlY3QpLCBhcyB0aGUgcGF0Y2ggaGVyZSBpcwppbmRlcGVuZGVudCBvZiB0aGUgcmVz
dCBvZiB0aGUgc2VyaWVzLCBidXQgYXQgbGVhc3Qgb25lIGxhdGVyIHBhdGNoCmRlcGVuZHMgb24g
dGhlIHBhcmFtZXRlciBjb25zdGlmaWNhdGlvbiBkb25lIGhlcmUuCgotLS0gYS94ZW4vYXJjaC94
ODYvaXJxLmMKKysrIGIveGVuL2FyY2gveDg2L2lycS5jCkBAIC0xMDQsMTYgKzEwNCwxOSBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgdmFsaWRfaXJxX3ZlY3Rvcih1bnNpCiAgICAgcmV0dXJuIHZlY3Rv
ciA+PSBGSVJTVF9EWU5BTUlDX1ZFQ1RPUiAmJiB2ZWN0b3IgPD0gTEFTVF9ISVBSSU9SSVRZX1ZF
Q1RPUjsKIH0KIAotc3RhdGljIHZvaWQgdHJhY2VfaXJxX21hc2sodTMyIGV2ZW50LCBpbnQgaXJx
LCBpbnQgdmVjdG9yLCBjcHVtYXNrX3QgKm1hc2spCitzdGF0aWMgdm9pZCB0cmFjZV9pcnFfbWFz
ayh1aW50MzJfdCBldmVudCwgaW50IGlycSwgaW50IHZlY3RvciwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqbWFzaykKIHsKICAgICBzdHJ1Y3QgewogICAgICAg
ICB1bnNpZ25lZCBpbnQgaXJxOjE2LCB2ZWM6MTY7CiAgICAgICAgIHVuc2lnbmVkIGludCBtYXNr
WzZdOwotICAgIH0gZDsKLSAgICBkLmlycSA9IGlycTsKLSAgICBkLnZlYyA9IHZlY3RvcjsKLSAg
ICBtZW1zZXQoZC5tYXNrLCAwLCBzaXplb2YoZC5tYXNrKSk7Ci0gICAgbWVtY3B5KGQubWFzaywg
bWFzaywgbWluKHNpemVvZihkLm1hc2spLCBzaXplb2YoY3B1bWFza190KSkpOworICAgIH0gZCA9
IHsKKyAgICAgICAuaXJxID0gaXJxLAorICAgICAgIC52ZWMgPSB2ZWN0b3IsCisgICAgfTsKKwor
ICAgIG1lbWNweShkLm1hc2ssIG1hc2ssCisgICAgICAgICAgIG1pbihzaXplb2YoZC5tYXNrKSwg
QklUU19UT19MT05HUyhucl9jcHVfaWRzKSAqIHNpemVvZihsb25nKSkpOwogICAgIHRyYWNlX3Zh
cihldmVudCwgMSwgc2l6ZW9mKGQpLCAmZCk7CiB9CiAKCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
