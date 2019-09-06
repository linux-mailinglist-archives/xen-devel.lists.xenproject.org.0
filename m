Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A44AB057
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 03:48:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i63Jp-0000l2-W7; Fri, 06 Sep 2019 01:45:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i63Jo-0000kx-2n
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 01:45:44 +0000
X-Inumbo-ID: 09d95672-d048-11e9-abe5-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09d95672-d048-11e9-abe5-12813bfff9fa;
 Fri, 06 Sep 2019 01:45:43 +0000 (UTC)
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1421206A3;
 Fri,  6 Sep 2019 01:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567734343;
 bh=lRua2zvyLgvotqYOjbb+UVo5g3Ivo1xIo+HFgNhUcSE=;
 h=From:To:Cc:Subject:Date:From;
 b=nuJ5FzVqwGlmsc0Kk6PpuDOwlyGC6hh8MzyANH4Hjc+FHgxfSUacEv/FHImp5F5Vb
 wsR61Snl9pj8CBVU1Yf5Zt3td7q4UfwAUo+xgnI+ErDgCmc63AkfW03GZxMmnvo5aV
 W7ApSsrbMamTzz5FsSjQzkkFNssKP1adkV1CbzjI=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Date: Fri,  6 Sep 2019 10:45:38 +0900
Message-Id: <156773433821.31441.2905951246664148487.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH -tip v3 0/2] x86: kprobes: Prohibit kprobes on
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

SGksCgpIZXJlIGlzIHRoZSAzcmQgdmVyc2lvbiBvZiBwYXRjaGVzIHRvIGhhbmRsZSBYZW4vS1ZN
IGVtdWxhdGUKcHJlZml4IGJ5IHg4NiBpbnN0cnVjdGlvbiBkZWNvZGVyLgoKVGhlc2UgcGF0Y2hl
cyBhbGxvdyB4ODYgaW5zdHJ1Y3Rpb24gZGVjb2RlciB0byBkZWNvZGUKWGVuIGFuZCBLVk0gZW11
bGF0ZSBwcmVmaXggY29ycmVjdGx5LCBhbmQgcHJvaGliaXQga3Byb2JlcyB0bwpwcm9iZSBvbiBp
dC4KCkpvc2ggcmVwb3J0ZWQgdGhhdCB0aGUgb2JqdG9vbCBjYW4gbm90IGRlY29kZSBzdWNoIHNw
ZWNpYWwKcHJlZml4ZWQgaW5zdHJ1Y3Rpb25zLCBhbmQgSSBmb3VuZCB0aGF0IHdlIGFsc28gaGF2
ZSB0bwpwcm9oaWJpdCBrcHJvYmVzIHRvIHByb2JlIG9uIHN1Y2ggaW5zdHJ1Y3Rpb24uCgpUaGlz
IHNlcmllcyBjYW4gYmUgYXBwbGllZCBvbiAtdGlwIG1hc3RlciBicmFuY2ggd2hpY2gKaGFzIG1l
cmdlZCBKb3NoJ3Mgb2JqdG9vbC9wZXJmIHNoYXJpbmcgY29tbW9uIHg4NiBpbnNuCmRlY29kZXIg
c2VyaWVzLgoKSW4gdGhlIDJuZCB2ZXJzaW9uLCBJIGFkZGVkIEtWTSBlbXVsYXRlIHByZWZpeCBz
dXBwb3J0IGFuZCBnZW5lcmFsaXplZAp0aGUgaW50ZXJmYWNlLiAoaW5zbl9oYXNfeGVuX3ByZWZp
eCAtPiBpbnNuX2hhc19lbXVsYXRlX3ByZWZpeCkKQWxzbywgSSBhZGRlZCBpbnNuLmVtdWxhdGVf
cHJlZml4X3NpemUgZm9yIHRob3NlIHByZWZpeGVzIGJlY2F1c2UKdGhhdCBwcmVmaXggaXMgTk9U
IGFuIHg4NiBpbnN0cnVjdGlvbiBwcmVmaXgsIGFuZCB0aGUgbmV4dCBpbnN0cnVjdGlvbgpvZiB0
aG9zZSBlbXVsYXRlIHByZWZpeGVzIGNhbiBoYXZlIHg4NiBpbnN0cnVjdGlvbiBwcmVmaXguIFNv
IHdlCmNhbiBub3QgdXNlIGluc24ucHJlZml4IGZvciBpdC4KCkluIHRoaXMgM3JkIHZlcnNpb24s
IEkganVzdCBmaXhlZCB0b29scy9wZXJmL2NoZWNrLWhlYWRlcnMuc2ggc28KdGhhdCBpdCBjYW4g
aWdub3JlIHRoZSBkaWZmZXJlbmNlIG9mIHhlbi9wcmVmaXggaGVhZGVyIHBhdGguCgpUaGFuayB5
b3UsCgotLS0KCk1hc2FtaSBIaXJhbWF0c3UgKDIpOgogICAgICB4ODY6IHhlbjogaW5zbjogRGVj
b2RlIFhlbiBhbmQgS1ZNIGVtdWxhdGUtcHJlZml4IHNpZ25hdHVyZQogICAgICB4ODY6IGtwcm9i
ZXM6IFByb2hpYml0IHByb2Jpbmcgb24gaW5zdHJ1Y3Rpb24gd2hpY2ggaGFzIGVtdWxhdGUgcHJl
Zml4CgoKIGFyY2gveDg2L2luY2x1ZGUvYXNtL2luc24uaCAgICAgICAgICAgICB8ICAgIDYgKysr
KysKIGFyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRlcmZhY2UuaCAgICB8ICAgIDcgKysrKy0t
CiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmggICAgICAgfCAgIDEwICsrKysrKysr
KwogYXJjaC94ODYva2VybmVsL2twcm9iZXMvY29yZS5jICAgICAgICAgIHwgICAgNCArKysKIGFy
Y2gveDg2L2xpYi9pbnNuLmMgICAgICAgICAgICAgICAgICAgICB8ICAgMzYgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogdG9vbHMvYXJjaC94ODYvaW5jbHVkZS9hc20vaW5zbi5oICAg
ICAgIHwgICAgNiArKysrKwogdG9vbHMvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3ByZWZpeC5o
IHwgICAxMCArKysrKysrKysKIHRvb2xzL2FyY2gveDg2L2xpYi9pbnNuLmMgICAgICAgICAgICAg
ICB8ICAgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvb2JqdG9vbC9z
eW5jLWNoZWNrLnNoICAgICAgICAgICAgIHwgICAgMyArKy0KIHRvb2xzL3BlcmYvY2hlY2staGVh
ZGVycy5zaCAgICAgICAgICAgICB8ICAgIDIgKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDExNiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gveDg2L2lu
Y2x1ZGUvYXNtL3hlbi9wcmVmaXguaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3hlbi9wcmVmaXguaAoKLS0KTWFzYW1pIEhpcmFtYXRzdSAoTGluYXJvKSA8
bWhpcmFtYXRAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
