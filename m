Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B555C18B0AC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 10:58:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEruU-0007zk-Kh; Thu, 19 Mar 2020 09:56:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f9wY=5E=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jEruT-0007zX-Et
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 09:56:17 +0000
X-Inumbo-ID: dd1cf138-69c7-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd1cf138-69c7-11ea-92cf-bc764e2007e4;
 Thu, 19 Mar 2020 09:56:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6CB58AF85;
 Thu, 19 Mar 2020 09:56:11 +0000 (UTC)
From: Miroslav Benes <mbenes@suse.cz>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 jpoimboe@redhat.com
Date: Thu, 19 Mar 2020 10:56:06 +0100
Message-Id: <20200319095606.23627-3-mbenes@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319095606.23627-1-mbenes@suse.cz>
References: <20200319095606.23627-1-mbenes@suse.cz>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/2] x86/xen: Make the secondary CPU idle
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
Cc: andrew.cooper3@citrix.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, xen-devel@lists.xenproject.org,
 Miroslav Benes <mbenes@suse.cz>, jslaby@suse.cz
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
cmFtZS4KCkludHJvZHVjZSBhIHdyYXBwZXIgaW4gYXNzZW1ibHksIHdoaWNoIGp1c3QgY2FsbHMK
Y3B1X2JyaW5ndXBfYW5kX2lkbGUoKS4gVGhlIHJldHVybiBhZGRyZXNzIGlzIHRodXMgcHVzaGVk
IG9uIHRoZSBzdGFjawphbmQgdGhlIHdyYXBwZXIgY29udGFpbnMgdGhlIGFubm90YXRpb24gaGlu
dCBmb3IgdGhlIHVud2luZGVyIHJlZ2FyZGluZwp0aGUgc3RhY2sgc3RhdGUuCgpTaWduZWQtb2Zm
LWJ5OiBNaXJvc2xhdiBCZW5lcyA8bWJlbmVzQHN1c2UuY3o+Ci0tLQogYXJjaC94ODYveGVuL3Nt
cF9wdi5jICAgfCAzICsrLQogYXJjaC94ODYveGVuL3hlbi1oZWFkLlMgfCA4ICsrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni94ZW4vc21wX3B2LmMgYi9hcmNoL3g4Ni94ZW4vc21wX3B2LmMKaW5kZXgg
ODAyZWU1YmJhNjZjLi42Yjg4Y2RjYmVmOGYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9zbXBf
cHYuYworKysgYi9hcmNoL3g4Ni94ZW4vc21wX3B2LmMKQEAgLTUzLDYgKzUzLDcgQEAgc3RhdGlj
IERFRklORV9QRVJfQ1BVKHN0cnVjdCB4ZW5fY29tbW9uX2lycSwgeGVuX2lycV93b3JrKSA9IHsg
LmlycSA9IC0xIH07CiBzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IHhlbl9jb21tb25faXJx
LCB4ZW5fcG11X2lycSkgPSB7IC5pcnEgPSAtMSB9OwogCiBzdGF0aWMgaXJxcmV0dXJuX3QgeGVu
X2lycV93b3JrX2ludGVycnVwdChpbnQgaXJxLCB2b2lkICpkZXZfaWQpOworZXh0ZXJuIHVuc2ln
bmVkIGNoYXIgYXNtX2NwdV9icmluZ3VwX2FuZF9pZGxlW107CiAKIHN0YXRpYyB2b2lkIGNwdV9i
cmluZ3VwKHZvaWQpCiB7CkBAIC0zMDksNyArMzEwLDcgQEAgY3B1X2luaXRpYWxpemVfY29udGV4
dCh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKmlkbGUpCiAJICogcG9pbnRp
bmcganVzdCBiZWxvdyB3aGVyZSBwdF9yZWdzIHdvdWxkIGJlIGlmIGl0IHdlcmUgYSBub3JtYWwK
IAkgKiBrZXJuZWwgZW50cnkuCiAJICovCi0JY3R4dC0+dXNlcl9yZWdzLmVpcCA9ICh1bnNpZ25l
ZCBsb25nKWNwdV9icmluZ3VwX2FuZF9pZGxlOworCWN0eHQtPnVzZXJfcmVncy5laXAgPSAodW5z
aWduZWQgbG9uZylhc21fY3B1X2JyaW5ndXBfYW5kX2lkbGU7CiAJY3R4dC0+ZmxhZ3MgPSBWR0NG
X0lOX0tFUk5FTDsKIAljdHh0LT51c2VyX3JlZ3MuZWZsYWdzID0gMHgxMDAwOyAvKiBJT1BMX1JJ
TkcxICovCiAJY3R4dC0+dXNlcl9yZWdzLmRzID0gX19VU0VSX0RTOwpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYveGVuL3hlbi1oZWFkLlMgYi9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUwppbmRleCBlZGM3
NzZhZjBlMGEuLjlkYzZmOWE0MjBhOCAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL3hlbi1oZWFk
LlMKKysrIGIvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMKQEAgLTU4LDYgKzU4LDE0IEBAIFNZTV9D
T0RFX1NUQVJUKHN0YXJ0dXBfeGVuKQogCWNhbGwgeGVuX3N0YXJ0X2tlcm5lbAogU1lNX0NPREVf
RU5EKHN0YXJ0dXBfeGVuKQogCV9fRklOSVQKKworLnB1c2hzZWN0aW9uIC50ZXh0CitTWU1fQ09E
RV9TVEFSVChhc21fY3B1X2JyaW5ndXBfYW5kX2lkbGUpCisJVU5XSU5EX0hJTlRfRU1QVFkKKwor
CWNhbGwgY3B1X2JyaW5ndXBfYW5kX2lkbGUKK1NZTV9DT0RFX0VORChhc21fY3B1X2JyaW5ndXBf
YW5kX2lkbGUpCisucG9wc2VjdGlvbgogI2VuZGlmCiAKIC5wdXNoc2VjdGlvbiAudGV4dAotLSAK
Mi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
