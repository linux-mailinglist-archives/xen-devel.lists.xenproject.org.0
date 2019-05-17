Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599DC216CD
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:14:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRZqJ-0002K7-9G; Fri, 17 May 2019 10:11:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRZqI-0002K1-9s
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:11:58 +0000
X-Inumbo-ID: 3272e080-788c-11e9-bbf7-fbb388e53d22
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3272e080-788c-11e9-bbf7-fbb388e53d22;
 Fri, 17 May 2019 10:11:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:11:54 -0600
Message-Id: <5CDE88EA0200007800230031@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:11:54 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC1F1@prv1-mh.provo.novell.com>
 <5B61C21202000078001F8805@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC6BD@prv1-mh.provo.novell.com>
 <5B61C212020000780020B6D8@prv1-mh.provo.novell.com>
 <5B61C21202000000000FF27E@prv1-mh.provo.novell.com>
 <5B61C2120200007800224310@prv1-mh.provo.novell.com>
 <5B61C2120200000000101EDC@prv1-mh.provo.novell.com>
 <5B61C212020000780022FF0D@prv1-mh.provo.novell.com>
 <5CDE88900200007800230027@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE88900200007800230027@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 1/3] x86/idle: re-arrange dead-idle handling
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgdG8gYmUgYWJsZSB0byB3YWtlIHBhcmtlZCBDUFVzIGZyb20gZGVmYXVsdF9kZWFk
X2lkbGUoKSAoZm9yCnRoZW0gdG8gdGhlbiBlbnRlciBhIGRpZmZlcmVudCBkZWFkLWlkbGUgcm91
dGluZSksIHRoZSBmdW5jdGlvbiBzaG91bGQKbm90IGl0c2VsZiBsb29wLiBNb3ZlIHRoZSBsb29w
IGludG8gcGxheV9kZWFkKCksIGFuZCB1c2UgcGxheV9kZWFkKCkgYXMKd2VsbCBvbiB0aGUgQVAg
Ym9vdCBlcnJvciBwYXRoLgoKRnVydGhlcm1vcmUsIG5vdCB0aGUgbGVhc3QgY29uc2lkZXJpbmcg
dGhlIGNvbW1lbnQgaW4gcGxheV9kZWFkKCksCm1ha2Ugc3VyZSBOTUkgcmFpc2VkIChmb3Igbm93
IHRoaXMgd291bGQgYmUgYSBidWcgZWxzZXdoZXJlLCBidXQgdGhhdCdzCmFib3V0IHRvIGNoYW5n
ZSkgYWdhaW5zdCBhIHBhcmtlZCBvciBmdWxseSBvZmZsaW5lIENQVSB3b24ndCBpbnZva2UgdGhl
CmFjdHVhbCwgZnVsbC1ibG93biBOTUkgaGFuZGxlci4KCk5vdGUgaG93ZXZlciB0aGF0IHRoaXMg
ZG9lc24ndCBtYWtlICNNQyBhbnkgc2FmZXIgZm9yIGZ1bGx5IG9mZmxpbmUKQ1BVcy4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYyOiBBZGQgc3Bl
Y19jdHJsX2V4aXRfaWRsZSgpIHRvIGRlZmF1bHRfZGVhZF9pZGxlKCkuIEFkZCAjTUMgcmVsYXRl
ZAogICAgcmVtYXJrIHRvIGRlc2NyaXB0aW9uLgotLS0KTm90ZTogSSBoYWQgdG8gZHJvcCB0aGUg
ZGlzY3Vzc2VkIGFjcGlfZGVhZF9pZGxlKCkgYWRqdXN0bWVudCBhZ2FpbiwgYXMKICAgICAgaXQg
YnJlYWtzIGJvb3Rpbmcgd2l0aCAic210PTAiIGFuZCAibWF4Y3B1cz0iIG9uIGF0IGxlYXN0IG9u
ZSBvZgogICAgICBteSBzeXN0ZW1zLiBJJ3ZlIG5vdCB5ZXQgbWFuYWdlZCB0byB1bmRlcnN0YW5k
IHdoeSB0aGF0IHdvdWxkIGJlLgoKLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9kb21haW4uYwpAQCAtMTAwLDE0ICsxMDAsMjAgQEAgdm9pZCBkZWZhdWx0X2Rl
YWRfaWRsZSh2b2lkKQogICAgICAqLwogICAgIHNwZWNfY3RybF9lbnRlcl9pZGxlKGdldF9jcHVf
aW5mbygpKTsKICAgICB3YmludmQoKTsKLSAgICBmb3IgKCA7IDsgKQotICAgICAgICBoYWx0KCk7
CisgICAgaGFsdCgpOworICAgIHNwZWNfY3RybF9leGl0X2lkbGUoZ2V0X2NwdV9pbmZvKCkpOwog
fQogCi1zdGF0aWMgdm9pZCBwbGF5X2RlYWQodm9pZCkKK3ZvaWQgcGxheV9kZWFkKHZvaWQpCiB7
CisgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKKwogICAgIGxvY2Fs
X2lycV9kaXNhYmxlKCk7CiAKKyAgICAvKiBDaGFuZ2UgdGhlIE5NSSBoYW5kbGVyIHRvIGEgbm9w
IChzZWUgY29tbWVudCBiZWxvdykuICovCisgICAgX3NldF9nYXRlX2xvd2VyKCZpZHRfdGFibGVz
W2NwdV1bVFJBUF9ubWldLCBTWVNfREVTQ19pcnFfZ2F0ZSwgMCwKKyAgICAgICAgICAgICAgICAg
ICAgJnRyYXBfbm9wKTsKKwogICAgIC8qCiAgICAgICogTk9URTogQWZ0ZXIgY3B1X2V4aXRfY2xl
YXIsIHBlci1jcHUgdmFyaWFibGVzIG1heSBubyBsb25nZXIgYWNjZXNzaWJsZSwKICAgICAgKiBh
cyB0aGV5IG1heSBiZSBmcmVlZCBhdCBhbnkgdGltZSBpZiBvZmZsaW5lIENQVXMgZG9uJ3QgZ2V0
IHBhcmtlZC4gSW4KQEAgLTExOCw5ICsxMjQsMTAgQEAgc3RhdGljIHZvaWQgcGxheV9kZWFkKHZv
aWQpCiAgICAgICogQ29uc2lkZXIgdmVyeSBjYXJlZnVsbHkgd2hlbiBhZGRpbmcgY29kZSB0byAq
ZGVhZF9pZGxlLiBNb3N0IGh5cGVydmlzb3IKICAgICAgKiBzdWJzeXN0ZW1zIGFyZSB1bnNhZmUg
dG8gY2FsbC4KICAgICAgKi8KLSAgICBjcHVfZXhpdF9jbGVhcihzbXBfcHJvY2Vzc29yX2lkKCkp
OworICAgIGNwdV9leGl0X2NsZWFyKGNwdSk7CiAKLSAgICAoKmRlYWRfaWRsZSkoKTsKKyAgICBm
b3IgKCA7IDsgKQorICAgICAgICBkZWFkX2lkbGUoKTsKIH0KIAogc3RhdGljIHZvaWQgaWRsZV9s
b29wKHZvaWQpCi0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2
L3NtcGJvb3QuYwpAQCAtMzMsNiArMzMsNyBAQAogI2luY2x1ZGUgPHhlbi9zZXJpYWwuaD4KICNp
bmNsdWRlIDx4ZW4vbnVtYS5oPgogI2luY2x1ZGUgPHhlbi9jcHUuaD4KKyNpbmNsdWRlIDxhc20v
Y3B1aWRsZS5oPgogI2luY2x1ZGUgPGFzbS9jdXJyZW50Lmg+CiAjaW5jbHVkZSA8YXNtL21jMTQ2
ODE4cnRjLmg+CiAjaW5jbHVkZSA8YXNtL2Rlc2MuaD4KQEAgLTIwOSw4ICsyMTAsNyBAQCBzdGF0
aWMgdm9pZCBzbXBfY2FsbGluKHZvaWQpCiAgICAgaGFsdDoKICAgICAgICAgY2xlYXJfbG9jYWxf
QVBJQygpOwogICAgICAgICBzcGluX2RlYnVnX2VuYWJsZSgpOwotICAgICAgICBjcHVfZXhpdF9j
bGVhcihjcHUpOwotICAgICAgICAoKmRlYWRfaWRsZSkoKTsKKyAgICAgICAgcGxheV9kZWFkKCk7
CiAgICAgfQogCiAgICAgLyogQWxsb3cgdGhlIG1hc3RlciB0byBjb250aW51ZS4gKi8KLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVpZGxlLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9j
cHVpZGxlLmgKQEAgLTIwLDYgKzIwLDcgQEAgaW50IG13YWl0X2lkbGVfaW5pdChzdHJ1Y3Qgbm90
aWZpZXJfYmxvYwogaW50IGNwdWlkbGVfaW5pdF9jcHUodW5zaWduZWQgaW50IGNwdSk7CiB2b2lk
IGRlZmF1bHRfZGVhZF9pZGxlKHZvaWQpOwogdm9pZCBhY3BpX2RlYWRfaWRsZSh2b2lkKTsKK3Zv
aWQgcGxheV9kZWFkKHZvaWQpOwogdm9pZCB0cmFjZV9leGl0X3JlYXNvbih1MzIgKmlycV90cmFj
ZWQpOwogdm9pZCB1cGRhdGVfaWRsZV9zdGF0cyhzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfcG93ZXIg
KiwKICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGFjcGlfcHJvY2Vzc29yX2N4ICosIHVp
bnQ2NF90LCB1aW50NjRfdCk7CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
