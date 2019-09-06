Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E53AB913
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:16:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6E3d-0000mo-CF; Fri, 06 Sep 2019 13:13:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i6E3c-0000mg-H8
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:13:44 +0000
X-Inumbo-ID: 26e08b0e-d0a8-11e9-abf5-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26e08b0e-d0a8-11e9-abf5-12813bfff9fa;
 Fri, 06 Sep 2019 13:13:44 +0000 (UTC)
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BAE95206BB;
 Fri,  6 Sep 2019 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567775623;
 bh=04VMkFAKwpuBxhJdJIYLigr+4AaTxM1JYsTMgdArZEQ=;
 h=From:To:Cc:Subject:Date:From;
 b=NZs4T0sE2RnKQkKahhNeB4+KuDgjS8z/UykH4cTyaD0PQ1MVUOymSG9DaLaHzbaKY
 6hhhzFGTqnZwNtCbZHUxgK+Lh3U8tnuxEfjT/3cQB9ZckHnj9qxw+JndI+b/pa4dIP
 BBsBWpVCwCnvjEqMcpu5Iq/W4HK+wvoDI7ZKxXZw=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Date: Fri,  6 Sep 2019 22:13:37 +0900
Message-Id: <156777561745.25081.1205321122446165328.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH -tip v4 0/4] x86: kprobes: Prohibit kprobes on
 Xen/KVM emulate prefixes
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

SGksCgpIZXJlIGlzIHRoZSA0dGggdmVyc2lvbiBvZiBwYXRjaGVzIHRvIGhhbmRsZSBYZW4vS1ZN
IGVtdWxhdGUKcHJlZml4IGJ5IHg4NiBpbnN0cnVjdGlvbiBkZWNvZGVyLgoKVGhlc2UgcGF0Y2hl
cyBhbGxvdyB4ODYgaW5zdHJ1Y3Rpb24gZGVjb2RlciB0byBkZWNvZGUKWGVuIGFuZCBLVk0gZW11
bGF0ZSBwcmVmaXggY29ycmVjdGx5LCBhbmQgcHJvaGliaXQga3Byb2JlcyB0bwpwcm9iZSBvbiBp
dC4KUHJldmlvdXMgdmVyc2lvbiBpcyBoZXJlOwoKIGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3Iv
MTU2NzczNDMzODIxLjMxNDQxLjI5MDU5NTEyNDY2NjQxNDg0ODcuc3RnaXRAZGV2bm90ZTIKCklu
IHRoaXMgdmVyc2lvbiwgSSBhZGRlZCAyIHBhdGNoZXMsIFsxLzRdIGZpeGVzIF9fQVNNX0ZPUk0o
KSB0bwphY2NlcHQgbWFjcm9zIHVzaW5nIF9fc3RyaW5naWZ5KCksIFsyLzRdIGludHJvZHVjZXMg
bmV3CmFzbS9lbXVsYXRlX3ByZWZpeC5oIHRvIGluaXRpYWxpemUgWGVuIGFuZCBLVk0gZW11bGF0
ZSBwcmVmaXgKYXQgb25lIHBsYWNlLiBbMy80XSBpcyB1cGRhdGVkIHRvIHVzZSBuZXcgZW11bGF0
ZV9wcmVmaXguaCBhbmQKZml4IHRvIGFkZCBlbXVsYXRlX3ByZWZpeC5oIHRvIHN5bmMgY2hlY2sg
bGlzdC4KClRoaXMgc2VyaWVzIGNhbiBiZSBhcHBsaWVkIG9uIC10aXAgbWFzdGVyIGJyYW5jaCB3
aGljaApoYXMgbWVyZ2VkIEpvc2gncyBvYmp0b29sL3BlcmYgc2hhcmluZyBjb21tb24geDg2IGlu
c24KZGVjb2RlciBzZXJpZXMuCgpUaGFuayB5b3UsCgotLS0KCk1hc2FtaSBIaXJhbWF0c3UgKDQp
OgogICAgICB4ODYvYXNtOiBBbGxvdyB0byBwYXNzIG1hY3JvcyB0byBfX0FTTV9GT1JNKCkKICAg
ICAgeDg2OiB4ZW46IGt2bTogR2F0aGVyIHRoZSBkZWZpbml0aW9uIG9mIGVtdWxhdGUgcHJlZml4
ZXMKICAgICAgeDg2OiB4ZW46IGluc246IERlY29kZSBYZW4gYW5kIEtWTSBlbXVsYXRlLXByZWZp
eCBzaWduYXR1cmUKICAgICAgeDg2OiBrcHJvYmVzOiBQcm9oaWJpdCBwcm9iaW5nIG9uIGluc3Ry
dWN0aW9uIHdoaWNoIGhhcyBlbXVsYXRlIHByZWZpeAoKCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9h
c20uaCAgICAgICAgICAgICAgICAgIHwgICAgOCArKysrLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNt
L2VtdWxhdGVfcHJlZml4LmggICAgICAgfCAgIDE0ICsrKysrKysrKysrCiBhcmNoL3g4Ni9pbmNs
dWRlL2FzbS9pbnNuLmggICAgICAgICAgICAgICAgIHwgICAgNiArKysrKwogYXJjaC94ODYvaW5j
bHVkZS9hc20veGVuL2ludGVyZmFjZS5oICAgICAgICB8ICAgMTEgKysrLS0tLS0tCiBhcmNoL3g4
Ni9rZXJuZWwva3Byb2Jlcy9jb3JlLmMgICAgICAgICAgICAgIHwgICAgNCArKysKIGFyY2gveDg2
L2t2bS94ODYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA0ICsrLQogYXJjaC94ODYv
bGliL2luc24uYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMzQgKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiB0b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9lbXVsYXRlX3ByZWZpeC5o
IHwgICAxNCArKysrKysrKysrKwogdG9vbHMvYXJjaC94ODYvaW5jbHVkZS9hc20vaW5zbi5oICAg
ICAgICAgICB8ICAgIDYgKysrKysKIHRvb2xzL2FyY2gveDg2L2xpYi9pbnNuLmMgICAgICAgICAg
ICAgICAgICAgfCAgIDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvb2JqdG9v
bC9zeW5jLWNoZWNrLnNoICAgICAgICAgICAgICAgICB8ICAgIDMgKysKIHRvb2xzL3BlcmYvY2hl
Y2staGVhZGVycy5zaCAgICAgICAgICAgICAgICAgfCAgICAzICsrCiAxMiBmaWxlcyBjaGFuZ2Vk
LCAxMjggaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC94ODYvaW5jbHVkZS9hc20vZW11bGF0ZV9wcmVmaXguaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IHRvb2xzL2FyY2gveDg2L2luY2x1ZGUvYXNtL2VtdWxhdGVfcHJlZml4LmgKCi0tCk1hc2FtaSBI
aXJhbWF0c3UgKExpbmFybykgPG1oaXJhbWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
