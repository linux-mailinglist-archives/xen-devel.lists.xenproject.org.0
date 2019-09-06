Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B948AB914
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:16:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6E3z-0000qN-WF; Fri, 06 Sep 2019 13:14:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i6E3x-0000q9-TD
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:14:05 +0000
X-Inumbo-ID: 3377ecea-d0a8-11e9-b299-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3377ecea-d0a8-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 13:14:05 +0000 (UTC)
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD58C206CD;
 Fri,  6 Sep 2019 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567775644;
 bh=xwevScULOZ8aHH02UdNxNNbZKln2GGka5KsITPUu01w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ywcKvpjP6yQuQ4ollCyO25HczFce4Msz6VtqlYmlk6swCFAeqdhyWFKeD3CXoeHoF
 HL6carKTp5DncQeBKlw9iX41TV7uwbKZENeYEhGGqqzGNpND5Gc1qxqdTOaBpfSAf3
 /Pp9GZwNtIvwmSvmfreLDNphR1OkYBf/+h5lC5uc=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Date: Fri,  6 Sep 2019 22:13:59 +0900
Message-Id: <156777563917.25081.7286628561790289995.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <156777561745.25081.1205321122446165328.stgit@devnote2>
References: <156777561745.25081.1205321122446165328.stgit@devnote2>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH -tip v4 2/4] x86: xen: kvm: Gather the
 definition of emulate prefixes
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2F0aGVyIHRoZSBlbXVsYXRlIHByZWZpeGVzLCB3aGljaCBmb3JjaWJseSBtYWtlIHRoZSBmb2xs
b3dpbmcKaW5zdHJ1Y3Rpb24gZW11bGF0ZWQgb24gdmlydHVhbGl6YXRpb24sIGluIG9uZSBwbGFj
ZS4KClN1Z2dlc3RlZC1ieTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpT
aWduZWQtb2ZmLWJ5OiBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPgotLS0K
IGFyY2gveDg2L2luY2x1ZGUvYXNtL2VtdWxhdGVfcHJlZml4LmggfCAgIDE0ICsrKysrKysrKysr
KysrCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vaW50ZXJmYWNlLmggIHwgICAxMSArKysrLS0t
LS0tLQogYXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICAgICAgICAgICAgICB8ICAgIDQgKysrLQog
MyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gveDg2L2luY2x1ZGUvYXNtL2VtdWxhdGVfcHJlZml4LmgKCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9lbXVsYXRlX3ByZWZpeC5oIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20vZW11bGF0ZV9wcmVmaXguaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLjcwZjViOThhNTI4NgotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2VtdWxhdGVfcHJlZml4LmgKQEAgLTAsMCArMSwxNCBAQAorLyogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KKyNpZm5kZWYgX0FTTV9YODZfRU1VTEFURV9QUkVG
SVhfSAorI2RlZmluZSBfQVNNX1g4Nl9FTVVMQVRFX1BSRUZJWF9ICisKKy8qCisgKiBWaXJ0IGVz
Y2FwZSBzZXF1ZW5jZXMgdG8gdHJpZ2dlciBpbnN0cnVjdGlvbiBlbXVsYXRpb247CisgKiBpZGVh
bGx5IHRoZXNlIHdvdWxkIGRlY29kZSB0byAnd2hvbGUnIGluc3RydWN0aW9uIGFuZCBub3QgZGVz
dHJveQorICogdGhlIGluc3RydWN0aW9uIHN0cmVhbTsgc2FkbHkgdGhpcyBpcyBub3QgdHJ1ZSBm
b3IgdGhlICdrdm0nIG9uZSA6LworICovCisKKyNkZWZpbmUgX19YRU5fRU1VTEFURV9QUkVGSVgg
IDB4MGYsMHgwYiwweDc4LDB4NjUsMHg2ZSAgLyogdWQyIDsgLmFzY2lpICJ4ZW4iICovCisjZGVm
aW5lIF9fS1ZNX0VNVUxBVEVfUFJFRklYICAweDBmLDB4MGIsMHg2YiwweDc2LDB4NmQJLyogdWQy
IDsgLmFzY2lpICJrdm0iICovCisKKyNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20veGVuL2ludGVyZmFjZS5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL2ludGVyZmFj
ZS5oCmluZGV4IDYyY2EwM2VmNWM2NS4uOTEzOWIzZTg2MzE2IDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS94ZW4vaW50ZXJmYWNlLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
eGVuL2ludGVyZmFjZS5oCkBAIC0zNzksMTIgKzM3OSw5IEBAIHN0cnVjdCB4ZW5fcG11X2FyY2gg
ewogICogUHJlZml4IGZvcmNlcyBlbXVsYXRpb24gb2Ygc29tZSBub24tdHJhcHBpbmcgaW5zdHJ1
Y3Rpb25zLgogICogQ3VycmVudGx5IG9ubHkgQ1BVSUQuCiAgKi8KLSNpZmRlZiBfX0FTU0VNQkxZ
X18KLSNkZWZpbmUgWEVOX0VNVUxBVEVfUFJFRklYIC5ieXRlIDB4MGYsMHgwYiwweDc4LDB4NjUs
MHg2ZSA7Ci0jZGVmaW5lIFhFTl9DUFVJRCAgICAgICAgICBYRU5fRU1VTEFURV9QUkVGSVggY3B1
aWQKLSNlbHNlCi0jZGVmaW5lIFhFTl9FTVVMQVRFX1BSRUZJWCAiLmJ5dGUgMHgwZiwweDBiLDB4
NzgsMHg2NSwweDZlIDsgIgotI2RlZmluZSBYRU5fQ1BVSUQgICAgICAgICAgWEVOX0VNVUxBVEVf
UFJFRklYICJjcHVpZCIKLSNlbmRpZgorI2luY2x1ZGUgPGFzbS9lbXVsYXRlX3ByZWZpeC5oPgor
CisjZGVmaW5lIFhFTl9FTVVMQVRFX1BSRUZJWCBfX0FTTV9GT1JNKC5ieXRlIF9fWEVOX0VNVUxB
VEVfUFJFRklYIDspCisjZGVmaW5lIFhFTl9DUFVJRCAgICAgICAgICBYRU5fRU1VTEFURV9QUkVG
SVggX19BU01fRk9STShjcHVpZCkKIAogI2VuZGlmIC8qIF9BU01fWDg2X1hFTl9JTlRFUkZBQ0Vf
SCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5j
CmluZGV4IDI5MGMzYzNlZmI4Ny4uNWY4YjBhNjBmNDhiIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9r
dm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCkBAIC02OCw2ICs2OCw3IEBACiAjaW5j
bHVkZSA8YXNtL21zaHlwZXJ2Lmg+CiAjaW5jbHVkZSA8YXNtL2h5cGVydmlzb3IuaD4KICNpbmNs
dWRlIDxhc20vaW50ZWxfcHQuaD4KKyNpbmNsdWRlIDxhc20vZW11bGF0ZV9wcmVmaXguaD4KICNp
bmNsdWRlIDxjbG9ja3NvdXJjZS9oeXBlcnZfdGltZXIuaD4KIAogI2RlZmluZSBDUkVBVEVfVFJB
Q0VfUE9JTlRTCkBAIC01MzE5LDYgKzUzMjAsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChrdm1fd3Jp
dGVfZ3Vlc3RfdmlydF9zeXN0ZW0pOwogCiBpbnQgaGFuZGxlX3VkKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKIHsKKwlzdGF0aWMgY29uc3QgY2hhciBrdm1fZW11bGF0ZV9wcmVmaXhbXSA9IHsgX19L
Vk1fRU1VTEFURV9QUkVGSVggfTsKIAlpbnQgZW11bF90eXBlID0gRU1VTFRZUEVfVFJBUF9VRDsK
IAllbnVtIGVtdWxhdGlvbl9yZXN1bHQgZXI7CiAJY2hhciBzaWdbNV07IC8qIHVkMjsgLmFzY2lp
ICJrdm0iICovCkBAIC01MzI3LDcgKzUzMjksNyBAQCBpbnQgaGFuZGxlX3VkKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSkKIAlpZiAoZm9yY2VfZW11bGF0aW9uX3ByZWZpeCAmJgogCSAgICBrdm1fcmVh
ZF9ndWVzdF92aXJ0KHZjcHUsIGt2bV9nZXRfbGluZWFyX3JpcCh2Y3B1KSwKIAkJCQlzaWcsIHNp
emVvZihzaWcpLCAmZSkgPT0gMCAmJgotCSAgICBtZW1jbXAoc2lnLCAiXHhmXHhia3ZtIiwgc2l6
ZW9mKHNpZykpID09IDApIHsKKwkgICAgbWVtY21wKHNpZywga3ZtX2VtdWxhdGVfcHJlZml4LCBz
aXplb2Yoc2lnKSkgPT0gMCkgewogCQlrdm1fcmlwX3dyaXRlKHZjcHUsIGt2bV9yaXBfcmVhZCh2
Y3B1KSArIHNpemVvZihzaWcpKTsKIAkJZW11bF90eXBlID0gMDsKIAl9CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
