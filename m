Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C76F1833C0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 15:51:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCP9b-0000ZZ-8q; Thu, 12 Mar 2020 14:49:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=780U=45=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jCOhB-0006YB-RA
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:20:21 +0000
X-Inumbo-ID: 953c387a-646c-11ea-b19e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 953c387a-646c-11ea-b19e-12813bfff9fa;
 Thu, 12 Mar 2020 14:20:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD2FCB2FA;
 Thu, 12 Mar 2020 14:20:10 +0000 (UTC)
From: Miroslav Benes <mbenes@suse.cz>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 jpoimboe@redhat.com
Date: Thu, 12 Mar 2020 15:20:07 +0100
Message-Id: <20200312142007.11488-3-mbenes@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200312142007.11488-1-mbenes@suse.cz>
References: <20200312142007.11488-1-mbenes@suse.cz>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Mar 2020 14:49:40 +0000
Subject: [Xen-devel] [RFC PATCH 2/2] x86/xen: Make the secondary CPU idle
 tasks reliable
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
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 xen-devel@lists.xenproject.org, Miroslav Benes <mbenes@suse.cz>,
 jslaby@suse.cz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHVud2luZGVyIHJlcG9ydHMgdGhlIHNlY29uZGFyeSBDUFUgaWRsZSB0YXNrcycgc3RhY2sg
b24gWEVOIFBWIGFzCnVucmVsaWFibGUsIHdoaWNoIGFmZmVjdHMgYXQgbGVhc3QgbGl2ZSBwYXRj
aGluZy4KY3B1X2luaXRpYWxpemVfY29udGV4dCgpIHNldHMgdXAgdGhlIGNvbnRleHQgb2YgdGhl
IENQVSB0aHJvdWdoClZDUFVPUF9pbml0aWFsaXNlIGh5cGVyY2FsbC4gQWZ0ZXIgaXQgaXMgd29r
ZW4gdXAsIHRoZSBpZGxlIHRhc2sgc3RhcnRzCmluIGNwdV9icmluZ3VwX2FuZF9pZGxlKCkgZnVu
Y3Rpb24gYW5kIGl0cyBzdGFjayBzdGFydHMgYXQgdGhlIG9mZnNldApyaWdodCBiZWxvdyBwdF9y
ZWdzLiBUaGUgdW53aW5kZXIgY29ycmVjdGx5IGRldGVjdHMgdGhlIGVuZCBvZiBzdGFjawp0aGVy
ZSBidXQgaXQgaXMgY29uZnVzZWQgYnkgTlVMTCByZXR1cm4gYWRkcmVzcyBpbiB0aGUgbGFzdCBm
cmFtZS4KClJGQzogSSBoYXZlbid0IGZvdW5kIHRoZSB3YXkgdG8gdGVhY2ggdGhlIHVud2luZGVy
IGFib3V0IHRoZSBzdGF0ZSBvZgp0aGUgc3RhY2sgdGhlcmUuIFRodXMgdGhlIHVnbHkgaGFjayB1
c2luZyBhc3NlbWJseS4gU2ltaWxhciB0byB3aGF0CnN0YXJ0dXBfeGVuKCkgaGFzIGdvdCBmb3Ig
Ym9vdCBDUFUuCgpJdCBpbnRyb2R1Y2VzIG9ianRvb2wgInVucmVhY2hhYmxlIGluc3RydWN0aW9u
IiB3YXJuaW5nIGp1c3QgcmlnaHQgYWZ0ZXIKdGhlIGp1bXAgdG8gY3B1X2JyaW5ndXBfYW5kX2lk
bGUoKS4gSXQgc2hvdWxkIHNob3cgdGhlIGlkZWEgd2hhdCBuZWVkcwp0byBiZSBkb25lIHRob3Vn
aCwgSSB0aGluay4gSWRlYXMgd2VsY29tZS4KClNpZ25lZC1vZmYtYnk6IE1pcm9zbGF2IEJlbmVz
IDxtYmVuZXNAc3VzZS5jej4KLS0tCiBhcmNoL3g4Ni94ZW4vc21wX3B2LmMgICB8ICAzICsrLQog
YXJjaC94ODYveGVuL3hlbi1oZWFkLlMgfCAxMCArKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94
ZW4vc21wX3B2LmMgYi9hcmNoL3g4Ni94ZW4vc21wX3B2LmMKaW5kZXggODAyZWU1YmJhNjZjLi42
Yjg4Y2RjYmVmOGYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9zbXBfcHYuYworKysgYi9hcmNo
L3g4Ni94ZW4vc21wX3B2LmMKQEAgLTUzLDYgKzUzLDcgQEAgc3RhdGljIERFRklORV9QRVJfQ1BV
KHN0cnVjdCB4ZW5fY29tbW9uX2lycSwgeGVuX2lycV93b3JrKSA9IHsgLmlycSA9IC0xIH07CiBz
dGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IHhlbl9jb21tb25faXJxLCB4ZW5fcG11X2lycSkg
PSB7IC5pcnEgPSAtMSB9OwogCiBzdGF0aWMgaXJxcmV0dXJuX3QgeGVuX2lycV93b3JrX2ludGVy
cnVwdChpbnQgaXJxLCB2b2lkICpkZXZfaWQpOworZXh0ZXJuIHVuc2lnbmVkIGNoYXIgYXNtX2Nw
dV9icmluZ3VwX2FuZF9pZGxlW107CiAKIHN0YXRpYyB2b2lkIGNwdV9icmluZ3VwKHZvaWQpCiB7
CkBAIC0zMDksNyArMzEwLDcgQEAgY3B1X2luaXRpYWxpemVfY29udGV4dCh1bnNpZ25lZCBpbnQg
Y3B1LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKmlkbGUpCiAJICogcG9pbnRpbmcganVzdCBiZWxvdyB3
aGVyZSBwdF9yZWdzIHdvdWxkIGJlIGlmIGl0IHdlcmUgYSBub3JtYWwKIAkgKiBrZXJuZWwgZW50
cnkuCiAJICovCi0JY3R4dC0+dXNlcl9yZWdzLmVpcCA9ICh1bnNpZ25lZCBsb25nKWNwdV9icmlu
Z3VwX2FuZF9pZGxlOworCWN0eHQtPnVzZXJfcmVncy5laXAgPSAodW5zaWduZWQgbG9uZylhc21f
Y3B1X2JyaW5ndXBfYW5kX2lkbGU7CiAJY3R4dC0+ZmxhZ3MgPSBWR0NGX0lOX0tFUk5FTDsKIAlj
dHh0LT51c2VyX3JlZ3MuZWZsYWdzID0gMHgxMDAwOyAvKiBJT1BMX1JJTkcxICovCiAJY3R4dC0+
dXNlcl9yZWdzLmRzID0gX19VU0VSX0RTOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3hlbi1o
ZWFkLlMgYi9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUwppbmRleCA2NDJmMzQ2YmZlMDIuLmM5YTlj
MGJiNzllZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMKKysrIGIvYXJjaC94
ODYveGVuL3hlbi1oZWFkLlMKQEAgLTU2LDYgKzU2LDE2IEBAIFNZTV9DT0RFX1NUQVJUKHN0YXJ0
dXBfeGVuKQogMToKIFNZTV9DT0RFX0VORChzdGFydHVwX3hlbikKIAlfX0ZJTklUCisKKy5wdXNo
c2VjdGlvbiAudGV4dAorU1lNX0NPREVfU1RBUlQoYXNtX2NwdV9icmluZ3VwX2FuZF9pZGxlKQor
CVVOV0lORF9ISU5UX0VNUFRZCisKKwlwdXNoICQxZgorCWptcCBjcHVfYnJpbmd1cF9hbmRfaWRs
ZQorMToKK1NZTV9DT0RFX0VORChhc21fY3B1X2JyaW5ndXBfYW5kX2lkbGUpCisucG9wc2VjdGlv
bgogI2VuZGlmCiAKIC5wdXNoc2VjdGlvbiAudGV4dAotLSAKMi4yNS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
