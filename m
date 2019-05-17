Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7974121743
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:51:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRaPY-0005hN-VP; Fri, 17 May 2019 10:48:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaPW-0005h1-WB
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:48:23 +0000
X-Inumbo-ID: 49ed0f52-7891-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 49ed0f52-7891-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 10:48:22 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:48:21 -0600
Message-Id: <5CDE917502000078002300A8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:48:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v3 07/15] x86/IRQ: target online CPUs when
 binding guest IRQ
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

Zml4dXBfaXJxcygpIHNraXBzIGludGVycnVwdHMgd2l0aG91dCBhY3Rpb24uIEhlbmNlIHN1Y2gg
aW50ZXJydXB0cyBjYW4KcmV0YWluIGFmZmluaXR5IHRvIGp1c3Qgb2ZmbGluZSBDUFVzLiBXaXRo
ICJub2lycWJhbGFuY2UiIGluIGVmZmVjdCwKcGlycV9ndWVzdF9iaW5kKCkgc28gZmFyIHdvdWxk
IGhhdmUgbGVmdCB0aGVtIGFsb25lLCByZXN1bHRpbmcgaW4gYSBub24tCndvcmtpbmcgaW50ZXJy
dXB0LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0K
djM6IE5ldy4KLS0tCkkndmUgbm90IG9ic2VydmVkIHRoaXMgcHJvYmxlbSBpbiBwcmFjdGljZSAt
IHRoZSBjaGFuZ2UgaXMganVzdCB0aGUKcmVzdWx0IG9mIGNvZGUgaW5zcGVjdGlvbiBhZnRlciBo
YXZpbmcgbm90aWNlZCBhY3Rpb24tbGVzcyBJUlFzIGluICdpJwpkZWJ1ZyBrZXkgb3V0cHV0IHBv
aW50aW5nIGF0IGFsbCBwYXJrZWQvb2ZmbGluZSBDUFVzLgoKLS0tIGEveGVuL2FyY2gveDg2L2ly
cS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwpAQCAtMTY4Myw5ICsxNjgzLDI3IEBAIGludCBw
aXJxX2d1ZXN0X2JpbmQoc3RydWN0IHZjcHUgKnYsIHN0cnUKIAogICAgICAgICBkZXNjLT5zdGF0
dXMgfD0gSVJRX0dVRVNUOwogCi0gICAgICAgIC8qIEF0dGVtcHQgdG8gYmluZCB0aGUgaW50ZXJy
dXB0IHRhcmdldCB0byB0aGUgY29ycmVjdCBDUFUuICovCi0gICAgICAgIGlmICggIW9wdF9ub2ly
cWJhbGFuY2UgJiYgKGRlc2MtPmhhbmRsZXItPnNldF9hZmZpbml0eSAhPSBOVUxMKSApCi0gICAg
ICAgICAgICBkZXNjLT5oYW5kbGVyLT5zZXRfYWZmaW5pdHkoZGVzYywgY3B1bWFza19vZih2LT5w
cm9jZXNzb3IpKTsKKyAgICAgICAgLyoKKyAgICAgICAgICogQXR0ZW1wdCB0byBiaW5kIHRoZSBp
bnRlcnJ1cHQgdGFyZ2V0IHRvIHRoZSBjb3JyZWN0IChvciBhdCBsZWFzdAorICAgICAgICAgKiBz
b21lIG9ubGluZSkgQ1BVLgorICAgICAgICAgKi8KKyAgICAgICAgaWYgKCBkZXNjLT5oYW5kbGVy
LT5zZXRfYWZmaW5pdHkgKQorICAgICAgICB7CisgICAgICAgICAgICBjb25zdCBjcHVtYXNrX3Qg
KmFmZmluaXR5ID0gTlVMTDsKKworICAgICAgICAgICAgaWYgKCAhb3B0X25vaXJxYmFsYW5jZSAp
CisgICAgICAgICAgICAgICAgYWZmaW5pdHkgPSBjcHVtYXNrX29mKHYtPnByb2Nlc3Nvcik7Cisg
ICAgICAgICAgICBlbHNlIGlmICggIWNwdW1hc2tfaW50ZXJzZWN0cyhkZXNjLT5hZmZpbml0eSwg
JmNwdV9vbmxpbmVfbWFwKSApCisgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgY3B1bWFz
a19zZXRhbGwoZGVzYy0+YWZmaW5pdHkpOworICAgICAgICAgICAgICAgIGFmZmluaXR5ID0gJmNw
dW1hc2tfYWxsOworICAgICAgICAgICAgfQorICAgICAgICAgICAgZWxzZSBpZiAoICFjcHVtYXNr
X2ludGVyc2VjdHMoZGVzYy0+YXJjaC5jcHVfbWFzaywKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZjcHVfb25saW5lX21hcCkgKQorICAgICAgICAgICAgICAgIGFm
ZmluaXR5ID0gZGVzYy0+YWZmaW5pdHk7CisgICAgICAgICAgICBpZiAoIGFmZmluaXR5ICkKKyAg
ICAgICAgICAgICAgICBkZXNjLT5oYW5kbGVyLT5zZXRfYWZmaW5pdHkoZGVzYywgYWZmaW5pdHkp
OworICAgICAgICB9CiAKICAgICAgICAgZGVzYy0+c3RhdHVzICY9IH5JUlFfRElTQUJMRUQ7CiAg
ICAgICAgIGRlc2MtPmhhbmRsZXItPnN0YXJ0dXAoZGVzYyk7CgoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
