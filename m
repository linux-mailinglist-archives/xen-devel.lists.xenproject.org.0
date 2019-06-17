Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B444347BEB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 10:15:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcmle-0003TR-8w; Mon, 17 Jun 2019 08:13:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcmld-0003TE-6X
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 08:13:29 +0000
X-Inumbo-ID: c8c1a1c9-90d7-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c8c1a1c9-90d7-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 08:13:27 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 02:13:27 -0600
Message-Id: <5D074BA30200007800238B6C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 02:13:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
 <5D074AE60200007800238B5E@prv1-mh.provo.novell.com>
In-Reply-To: <5D074AE60200007800238B5E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 2/2] x86/traps: widen condition for logging
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
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IFJlLWJhc2Ugb3ZlciBjaGFuZ2VzIHRvIGVh
cmxpZXIgcGF0Y2guCgotLS0gYS94ZW4vYXJjaC94ODYvdHJhcHMuYworKysgYi94ZW4vYXJjaC94
ODYvdHJhcHMuYwpAQCAtNDMxLDcgKzQzMSw3IEBAIHN0YXRpYyB2b2lkIF9zaG93X3RyYWNlKHVu
c2lnbmVkIGxvbmcgc3AKICAgICB7CiAgICAgICAgIGFkZHIgPSAqc3RhY2srKzsKICAgICAgICAg
aWYgKCBpc19hY3RpdmVfa2VybmVsX3RleHQoYWRkcikgKQotICAgICAgICAgICAgcHJpbnRrKCIg
ICBbPCVwPl0gJXBTXG4iLCBfcChhZGRyKSwgX3AoYWRkcikpOworICAgICAgICAgICAgcHJpbnRr
KCIgICBbPCVwPl0gPyAlcFNcbiIsIF9wKGFkZHIpLCBfcChhZGRyKSk7CiAgICAgfQogfQogCkBA
IC01MDQsMjAgKzUwNCwyNSBAQCBzdGF0aWMgdm9pZCBzaG93X3RyYWNlKGNvbnN0IHN0cnVjdCBj
cHVfCiAgICAgaWYgKCBpc19hY3RpdmVfa2VybmVsX3RleHQocmVncy0+cmlwKSB8fAogICAgICAg
ICAgIWlzX2FjdGl2ZV9rZXJuZWxfdGV4dCh0b3MpICkKICAgICAgICAgcHJpbnRrKCIgICBbPCVw
Pl0gJXBTXG4iLCBfcChyZWdzLT5yaXApLCBfcChyZWdzLT5yaXApKTsKLSAgICBlbHNlIGlmICgg
ZmF1bHQgKQorCisgICAgaWYgKCBmYXVsdCApCiAgICAgewogICAgICAgICBwcmludGsoIiAgIFtG
YXVsdCBvbiBhY2Nlc3NdXG4iKTsKICAgICAgICAgcmV0dXJuOwogICAgIH0KKwogICAgIC8qCi0g
ICAgICogRWxzZSBSSVAgbG9va3MgYmFkIGJ1dCB0aGUgdG9wIG9mIHRoZSBzdGFjayBsb29rcyBn
b29kLiAgUGVyaGFwcyB3ZQotICAgICAqIGZvbGxvd2VkIGEgd2lsZCBmdW5jdGlvbiBwb2ludGVy
PyBMZXRzIGFzc3VtZSB0aGUgdG9wIG9mIHRoZSBzdGFjayBpcyBhCisgICAgICogSWYgUklQIGxv
b2tzIGJhZCBvciB0aGUgdG9wIG9mIHRoZSBzdGFjayBsb29rcyBnb29kLCBsb2cgdGhlIHRvcCBv
ZgorICAgICAqIHN0YWNrIGFzIHdlbGwuICBQZXJoYXBzIHdlIGZvbGxvd2VkIGEgd2lsZCBmdW5j
dGlvbiBwb2ludGVyLCBvciB3ZSdyZQorICAgICAqIGluIGEgZnVuY3Rpb24gd2l0aG91dCBmcmFt
ZSBwb2ludGVyLCBvciBpbiBhIGZ1bmN0aW9uIHByb2xvZ3VlIGJlZm9yZQorICAgICAqIHRoZSBm
cmFtZSBwb2ludGVyIGdldHMgc2V0IHVwPyBMZXQncyBhc3N1bWUgdGhlIHRvcCBvZiB0aGUgc3Rh
Y2sgaXMgYQogICAgICAqIHJldHVybiBhZGRyZXNzOyBwcmludCBpdCBhbmQgc2tpcCBwYXN0IHNv
IF9zaG93X3RyYWNlKCkgZG9lc24ndCBwcmludAogICAgICAqIGl0IGFnYWluLgogICAgICAqLwot
ICAgIGVsc2UKKyAgICBpZiAoICFpc19hY3RpdmVfa2VybmVsX3RleHQocmVncy0+cmlwKSB8fAor
ICAgICAgICAgaXNfYWN0aXZlX2tlcm5lbF90ZXh0KHRvcykgKQogICAgIHsKLSAgICAgICAgcHJp
bnRrKCIgICBbPCVwPl0gJXBTXG4iLCBfcCh0b3MpLCBfcCh0b3MpKTsKKyAgICAgICAgcHJpbnRr
KCIgICBbPCVwPl0gPyAlcFNcbiIsIF9wKHRvcyksIF9wKHRvcykpOwogICAgICAgICBzcCsrOwog
ICAgIH0KIAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
