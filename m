Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCA730B46
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 11:20:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWdfk-0001Pa-L2; Fri, 31 May 2019 09:18:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWdfi-0001PQ-F8
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:17:58 +0000
X-Inumbo-ID: f9770668-8384-11e9-8973-9ba6a54c9929
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9770668-8384-11e9-8973-9ba6a54c9929;
 Fri, 31 May 2019 09:17:56 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 03:17:55 -0600
Message-Id: <5CF0F1410200007800233D67@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 03:17:53 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
In-Reply-To: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 1/2] x86/traps: guard top-of-stack reads
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

Tm90aGluZyAoYWZhaWNzKSBndWFyYW50ZWVzIHRoYXQgdGhlIG9yaWdpbmFsIGZyYW1lJ3Mgc3Rh
Y2sgcG9pbnRlcgpwb2ludHMgYXQgcmVhZGFibGUgbWVtb3J5LiBBdm9pZCBhIChsaWtlbHkgbmVz
dGVkKSBjcmFzaCBieSBhdHRhY2hpbmcKZXhjZXB0aW9uIHJlY292ZXJ5IHRvIHRoZSByZWFkICht
YWtpbmcgaXQgYSBzaW5nbGUgcmVhZCBhdCB0aGUgc2FtZQp0aW1lKS4gRG9uJ3QgZXZlbiBpbnZv
a2UgX3Nob3dfdHJhY2UoKSBpbiBjYXNlIG9mIGEgbm9uLXJlYWRhYmxlIHRvcApzbG90LgoKU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2Fy
Y2gveDg2L3RyYXBzLmMKKysrIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKQEAgLTQ4NCwxNiArNDg0
LDIzIEBAIHN0YXRpYyB2b2lkIF9zaG93X3RyYWNlKHVuc2lnbmVkIGxvbmcgc3AKIAogc3RhdGlj
IHZvaWQgc2hvd190cmFjZShjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKIHsKLSAg
ICB1bnNpZ25lZCBsb25nICpzcCA9IEVTUF9CRUZPUkVfRVhDRVBUSU9OKHJlZ3MpOworICAgIHVu
c2lnbmVkIGxvbmcgKnNwID0gRVNQX0JFRk9SRV9FWENFUFRJT04ocmVncyksIHRvcyA9IDA7CiAK
ICAgICBwcmludGsoIlhlbiBjYWxsIHRyYWNlOlxuIik7CiAKKyAgICBhc20gKCAiMTogbW92ICUy
LCUwOyAyOlxuIgorICAgICAgICAgICIucHVzaHNlY3Rpb24gLmZpeHVwLFwiYXhcIlxuIgorICAg
ICAgICAgICIzOiB4b3IgJWsxLCVrMTsgam1wIDJiXG4iCisgICAgICAgICAgIi5wb3BzZWN0aW9u
XG4iCisgICAgICAgICAgX0FTTV9FWFRBQkxFKDFiLCAzYikKKyAgICAgICAgICA6ICIrciIgKHRv
cyksICIrciIgKHNwKSA6ICJtIiAoKnNwKSApOworCiAgICAgLyoKICAgICAgKiBJZiBSSVAgbG9v
a3Mgc2Vuc2libGUsIG9yIHRoZSB0b3Agb2YgdGhlIHN0YWNrIGRvZXNuJ3QsIHByaW50IFJJUCBh
dAogICAgICAqIHRoZSB0b3Agb2YgdGhlIHN0YWNrIHRyYWNlLgogICAgICAqLwogICAgIGlmICgg
aXNfYWN0aXZlX2tlcm5lbF90ZXh0KHJlZ3MtPnJpcCkgfHwKLSAgICAgICAgICFpc19hY3RpdmVf
a2VybmVsX3RleHQoKnNwKSApCisgICAgICAgICAhaXNfYWN0aXZlX2tlcm5lbF90ZXh0KHRvcykg
KQogICAgICAgICBwcmludGsoIiAgIFs8JXA+XSAlcFNcbiIsIF9wKHJlZ3MtPnJpcCksIF9wKHJl
Z3MtPnJpcCkpOwogICAgIC8qCiAgICAgICogRWxzZSBSSVAgbG9va3MgYmFkIGJ1dCB0aGUgdG9w
IG9mIHRoZSBzdGFjayBsb29rcyBnb29kLiAgUGVyaGFwcyB3ZQpAQCAtNTAxLDEyICs1MDgsMTUg
QEAgc3RhdGljIHZvaWQgc2hvd190cmFjZShjb25zdCBzdHJ1Y3QgY3B1XwogICAgICAqIHJldHVy
biBhZGRyZXNzOyBwcmludCBpdCBhbmQgc2tpcCBwYXN0IHNvIF9zaG93X3RyYWNlKCkgZG9lc24n
dCBwcmludAogICAgICAqIGl0IGFnYWluLgogICAgICAqLwotICAgIGVsc2UKKyAgICBlbHNlIGlm
ICggc3AgKQogICAgIHsKLSAgICAgICAgcHJpbnRrKCIgICBbPCVwPl0gJXBTXG4iLCBfcCgqc3Ap
LCBfcCgqc3ApKTsKKyAgICAgICAgcHJpbnRrKCIgICBbPCVwPl0gJXBTXG4iLCBfcCh0b3MpLCBf
cCh0b3MpKTsKICAgICAgICAgc3ArKzsKICAgICB9CiAKKyAgICBpZiAoICFzcCApCisgICAgICAg
IHJldHVybjsKKwogICAgIF9zaG93X3RyYWNlKCh1bnNpZ25lZCBsb25nKXNwLCByZWdzLT5yYnAp
OwogCiAgICAgcHJpbnRrKCJcbiIpOwoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
