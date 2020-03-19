Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D9518B0AB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 10:58:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEruP-0007xQ-4Y; Thu, 19 Mar 2020 09:56:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f9wY=5E=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jEruO-0007xH-I8
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 09:56:12 +0000
X-Inumbo-ID: dcb4c090-69c7-11ea-bbdb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcb4c090-69c7-11ea-bbdb-12813bfff9fa;
 Thu, 19 Mar 2020 09:56:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3D1FEAD9A;
 Thu, 19 Mar 2020 09:56:10 +0000 (UTC)
From: Miroslav Benes <mbenes@suse.cz>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 jpoimboe@redhat.com
Date: Thu, 19 Mar 2020 10:56:04 +0100
Message-Id: <20200319095606.23627-1-mbenes@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] x86/xen: Make idle tasks reliable
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
Cc: andrew.cooper3@citrix.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, xen-devel@lists.xenproject.org,
 Miroslav Benes <mbenes@suse.cz>, jslaby@suse.cz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHVud2luZGVyIHJlcG9ydHMgaWRsZSB0YXNrcycgc3RhY2sgb24gWEVOIFBWIGFzIHVucmVs
aWFibGUgd2hpY2gKY29tcGxpY2F0ZXMgdGhpbmdzIGZvciBhdCBsZWFzdCBsaXZlIHBhdGNoaW5n
LiBUaGUgdHdvIHBhdGNoZXMgaW4gdGhlCnNlcmllcyB0cnkgdG8gYW1lbmQgdGhhdCBieSB1c2lu
ZyBzaW1pbGFyIGFwcHJvYWNoIGFzIG5vbi1YRU4geDg2IGRvZXMuCgp2MS0+djI6Ci0gY2FsbCBp
bnN0cnVjdGlvbiB1c2VkIGluc3RlYWQgb2YgcHVzaCtqbXAKLSBpbml0aWFsX3N0YWNrIHVzZWQg
ZGlyZWN0bHkKClRoZXJlIGlzIGEgdGhpbmcgd2hpY2ggbWFrZXMgbWUgc2xpZ2h0bHkgdW5jb21m
b3J0YWJsZS4gcy9qbXAvY2FsbC8KbWVhbnMgdGhhdCwgdGhlb3JldGljYWxseSwgdGhlIGNhbGxl
ZCBmdW5jdGlvbiBjb3VsZCByZXR1cm4uIEdDQyB0aGVuCmdlbmVyYXRlcyBub3Qgc28gbmljZSBj
b2RlIGFuZCB0aGVyZSBpcwphc21fY3B1X2JyaW5ndXBfYW5kX2lkbGUrMHg1LzB4MTAwMCBzeW1i
b2wgbGFzdCBvbiB0aGUgc3RhY2sgZHVlIHRvCmFsaWdubWVudCBpbiBhc20veDg2L3hlbi94ZW4t
aGVhZC5TIHdoaWNoIGNvdWxkIGJlIGNvbmZ1c2luZy4KUHJhY3RpY2FsbHkgaXQgaXMgYWxsIGZp
bmUsIGJlY2F1c2UgbmVpdGhlciB4ZW5fc3RhcnRfa2VybmVsKCksIG5vcgpjcHVfYnJpbmd1cF9h
bmRfaWRsZSgpIHJldHVybiAodGhlcmUgaXMgdW5ib3VuZGVkIGxvb3AgaW4KY3B1X3N0YXJ0dXBf
ZW50cnkoKSBhcm91bmQgZG9faWRsZSgpKS4gX19ub3JldHVybiBhbm5vdGF0aW9uIG9mIHRoZXNl
CmZ1bmN0aW9ucyBkaWQgbm90IGhlbHAuCgpTbyBJIGRvbid0IHRoaW5rIGl0IGlzIHJlYWxseSBh
IHByb2JsZW0sIGJ1dCBvbmUgbWF5IHdvbmRlci4KCk1pcm9zbGF2IEJlbmVzICgyKToKICB4ODYv
eGVuOiBNYWtlIHRoZSBib290IENQVSBpZGxlIHRhc2sgcmVsaWFibGUKICB4ODYveGVuOiBNYWtl
IHRoZSBzZWNvbmRhcnkgQ1BVIGlkbGUgdGFza3MgcmVsaWFibGUKCiBhcmNoL3g4Ni94ZW4vc21w
X3B2LmMgICB8ICAzICsrLQogYXJjaC94ODYveGVuL3hlbi1oZWFkLlMgfCAxNiArKysrKysrKysr
KysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
