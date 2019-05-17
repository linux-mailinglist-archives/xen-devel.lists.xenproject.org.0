Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4121753
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 12:54:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRaSw-0006sI-QW; Fri, 17 May 2019 10:51:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaSv-0006s4-0E
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:51:53 +0000
X-Inumbo-ID: c6beb55f-7891-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c6beb55f-7891-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 10:51:51 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:51:50 -0600
Message-Id: <5CDE924602000078002300B7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:51:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v3 12/15] x86/IRQ: add explicit tracing-enabled
 check to trace_irq_mask()
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

VGhlIHNldHVwIGZvciBjYWxsaW5nIHRyYWNlX3ZhcigpICh3aGljaCBpdHNlbGYgY2hlY2tzIHRi
X2luaXRfZG9uZSkgaXMKbm9uLW5lZ2xpZ2libGUsIGFuZCBoZW5jZSBhIHNlcGFyYXRlIG91dGVy
LW1vc3QgY2hlY2sgaXMgd2FycmFudGVkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgotLS0KdjM6IE5ldy4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwor
KysgYi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTEyMSw4ICsxMjEsOCBAQCBzdGF0aWMgdm9pZCBy
ZWxlYXNlX29sZF92ZWMoc3RydWN0IGlycV9kCiAgICAgfQogfQogCi1zdGF0aWMgdm9pZCB0cmFj
ZV9pcnFfbWFzayh1aW50MzJfdCBldmVudCwgaW50IGlycSwgaW50IHZlY3RvciwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqbWFzaykKK3N0YXRpYyB2b2lkIF90
cmFjZV9pcnFfbWFzayh1aW50MzJfdCBldmVudCwgaW50IGlycSwgaW50IHZlY3RvciwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjcHVtYXNrX3QgKm1hc2spCiB7CiAgICAgc3Ry
dWN0IHsKICAgICAgICAgdW5zaWduZWQgaW50IGlycToxNiwgdmVjOjE2OwpAQCAtMTM3LDYgKzEz
NywxMyBAQCBzdGF0aWMgdm9pZCB0cmFjZV9pcnFfbWFzayh1aW50MzJfdCBldmVuCiAgICAgdHJh
Y2VfdmFyKGV2ZW50LCAxLCBzaXplb2YoZCksICZkKTsKIH0KIAorc3RhdGljIGlubGluZSB2b2lk
IHRyYWNlX2lycV9tYXNrKHVpbnQzMl90IGV2ZW50LCBpbnQgaXJxLCBpbnQgdmVjdG9yLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqbWFzaykKK3sK
KyAgICBpZiAoIHVubGlrZWx5KHRiX2luaXRfZG9uZSkgKQorICAgICAgICBfdHJhY2VfaXJxX21h
c2soZXZlbnQsIGlycSwgdmVjdG9yLCBtYXNrKTsKK30KKwogc3RhdGljIGludCBfX2luaXQgX2Jp
bmRfaXJxX3ZlY3RvcihzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MsIGludCB2ZWN0b3IsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqY3B1X21hc2spCiB7
CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
