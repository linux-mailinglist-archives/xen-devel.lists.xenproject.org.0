Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF630B60
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 11:24:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWdjw-0002EE-8l; Fri, 31 May 2019 09:22:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWdjv-0002E9-0A
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:22:19 +0000
X-Inumbo-ID: 93ed130e-8385-11e9-939f-93046275f2ca
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93ed130e-8385-11e9-939f-93046275f2ca;
 Fri, 31 May 2019 09:22:15 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 03:22:14 -0600
Message-Id: <5CF0F2440200007800233D84@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 03:22:12 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
In-Reply-To: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 2/2] x86/traps: widen condition for logging
 top-of-stack
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVzcGl0ZSAtZm5vLW9taXQtZnJhbWUtcG9pbnRlciB0aGUgY29tcGlsZXIgbWF5IG9taXQgdGhl
IGZyYW1lIHBvaW50ZXIsCm9mdGVuIGZvciByZWxhdGl2ZWx5IHNpbXBsZSBsZWFmIGZ1bmN0aW9u
cy4gKFRvIGdpdmUgYSBzcGVjaWZpYyBleGFtcGxlLAp0aGUgY2FzZSBJJ3ZlIHJ1biBpbnRvIHRo
aXMgd2l0aCBpcyBfcGNpX2hpZGVfZGV2aWNlKCkgYW5kIGdjYyA4LgpJbnRlcmVzdGluZ2x5IHRo
ZSBldmVuIG1vcmUgc2ltcGxlIG5laWdoYm9yaW5nIGlvbW11X2hhc19mZWF0dXJlKCkgZG9lcwpn
ZXQgYSBmcmFtZSBwb2ludGVyIHNldCB1cCwgYXJvdW5kIGp1c3QgYSBzaW5nbGUgaW5zdHJ1Y3Rp
b24uIEJ1dCB0aGlzCm1heSBiZSBhIHJlc3VsdCBvZiB0aGUgc2l6ZS1vZi1hc20oKSBlZmZlY3Rz
IGRpc2N1c3NlZCBlbHNld2hlcmUuKQoKTG9nIHRoZSB0b3Atb2Ytc3RhY2sgdmFsdWUgaWYgaXQg
bG9va3MgdmFsaWQgX29yXyBpZiBSSVAgbG9va3MgaW52YWxpZC4KCkFsc28gYW5ub3RhdGUgbm9u
LWZyYW1lLXBvaW50ZXItYmFzZWQgc3RhY2sgdHJhY2UgZW50cmllcyB3aXRoIGEKcXVlc3Rpb24g
bWFyaywgdG8gc2lnbmFsIGNsZWFybHkgdGhhdCBhbnkgb25lIG9mIHRoZW0gbWF5IG5vdCBhY3R1
YWxseQpiZSBwYXJ0IG9mIHRoZSBjYWxsIHN0YWNrLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L3RyYXBzLmMKKysrIGIv
eGVuL2FyY2gveDg2L3RyYXBzLmMKQEAgLTQzMSw3ICs0MzEsNyBAQCBzdGF0aWMgdm9pZCBfc2hv
d190cmFjZSh1bnNpZ25lZCBsb25nIHNwCiAgICAgewogICAgICAgICBhZGRyID0gKnN0YWNrKys7
CiAgICAgICAgIGlmICggaXNfYWN0aXZlX2tlcm5lbF90ZXh0KGFkZHIpICkKLSAgICAgICAgICAg
IHByaW50aygiICAgWzwlcD5dICVwU1xuIiwgX3AoYWRkciksIF9wKGFkZHIpKTsKKyAgICAgICAg
ICAgIHByaW50aygiICAgWzwlcD5dID8gJXBTXG4iLCBfcChhZGRyKSwgX3AoYWRkcikpOwogICAg
IH0KIH0KIApAQCAtNTAyLDIxICs1MDIsMjUgQEAgc3RhdGljIHZvaWQgc2hvd190cmFjZShjb25z
dCBzdHJ1Y3QgY3B1XwogICAgIGlmICggaXNfYWN0aXZlX2tlcm5lbF90ZXh0KHJlZ3MtPnJpcCkg
fHwKICAgICAgICAgICFpc19hY3RpdmVfa2VybmVsX3RleHQodG9zKSApCiAgICAgICAgIHByaW50
aygiICAgWzwlcD5dICVwU1xuIiwgX3AocmVncy0+cmlwKSwgX3AocmVncy0+cmlwKSk7CisKKyAg
ICBpZiAoICFzcCApCisgICAgICAgIHJldHVybjsKKwogICAgIC8qCi0gICAgICogRWxzZSBSSVAg
bG9va3MgYmFkIGJ1dCB0aGUgdG9wIG9mIHRoZSBzdGFjayBsb29rcyBnb29kLiAgUGVyaGFwcyB3
ZQotICAgICAqIGZvbGxvd2VkIGEgd2lsZCBmdW5jdGlvbiBwb2ludGVyPyBMZXRzIGFzc3VtZSB0
aGUgdG9wIG9mIHRoZSBzdGFjayBpcyBhCisgICAgICogSWYgUklQIGxvb2tzIGJhZCBvciB0aGUg
dG9wIG9mIHRoZSBzdGFjayBsb29rcyBnb29kLCBsb2cgdGhlIHRvcCBvZgorICAgICAqIHN0YWNr
IGFzIHdlbGwuICBQZXJoYXBzIHdlIGZvbGxvd2VkIGEgd2lsZCBmdW5jdGlvbiBwb2ludGVyLCBv
ciB3ZSdyZQorICAgICAqIGluIGEgZnVuY3Rpb24gd2l0aG91dCBmcmFtZSBwb2ludGVyLCBvciBp
biBhIGZ1bmN0aW9uIHByb2xvZ3VlIGJlZm9yZQorICAgICAqIHRoZSBmcmFtZSBwb2ludGVyIGdl
dHMgc2V0IHVwPyBMZXRzIGFzc3VtZSB0aGUgdG9wIG9mIHRoZSBzdGFjayBpcyBhCiAgICAgICog
cmV0dXJuIGFkZHJlc3M7IHByaW50IGl0IGFuZCBza2lwIHBhc3Qgc28gX3Nob3dfdHJhY2UoKSBk
b2Vzbid0IHByaW50CiAgICAgICogaXQgYWdhaW4uCiAgICAgICovCi0gICAgZWxzZSBpZiAoIHNw
ICkKKyAgICBpZiAoICFpc19hY3RpdmVfa2VybmVsX3RleHQocmVncy0+cmlwKSB8fAorICAgICAg
ICAgaXNfYWN0aXZlX2tlcm5lbF90ZXh0KHRvcykgKQogICAgIHsKLSAgICAgICAgcHJpbnRrKCIg
ICBbPCVwPl0gJXBTXG4iLCBfcCh0b3MpLCBfcCh0b3MpKTsKKyAgICAgICAgcHJpbnRrKCIgICBb
PCVwPl0gPyAlcFNcbiIsIF9wKHRvcyksIF9wKHRvcykpOwogICAgICAgICBzcCsrOwogICAgIH0K
IAotICAgIGlmICggIXNwICkKLSAgICAgICAgcmV0dXJuOwotCiAgICAgX3Nob3dfdHJhY2UoKHVu
c2lnbmVkIGxvbmcpc3AsIHJlZ3MtPnJicCk7CiAKICAgICBwcmludGsoIlxuIik7CgoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
