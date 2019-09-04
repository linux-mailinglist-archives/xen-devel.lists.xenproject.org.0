Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90867A814E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 13:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5TjX-0007xv-Lz; Wed, 04 Sep 2019 11:45:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ghLv=W7=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i5TjX-0007xq-1q
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 11:45:55 +0000
X-Inumbo-ID: 8d13ec40-cf09-11e9-b299-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d13ec40-cf09-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 11:45:54 +0000 (UTC)
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1263F20820;
 Wed,  4 Sep 2019 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567597553;
 bh=l8d1aa7jQJ/+VWO5N87LIpHbBJvkf1x8vkxmsAaaPmw=;
 h=From:To:Cc:Subject:Date:From;
 b=RFtNBZbRmcEoaVoPNrGJW0/6TiJdHVXY7qaUXkrvTVCtEuxjgH9/5O28TJaV4fSxT
 laVSLarKnl7bRJ+WnLYsvIC/yZHTXmb54ccLzTD6jwTLq0beVHLnaNN7M+rMh2z0os
 eryfvmNkA9h5RntyMUq3ogjeQQEn98EF+J/K7iWg=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Date: Wed,  4 Sep 2019 20:45:47 +0900
Message-Id: <156759754770.24473.11832897710080799131.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH -tip 0/2] x86: Prohibit kprobes on
 XEN_EMULATE_PREFIX
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
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpUaGVzZSBwYXRjaGVzIGFsbG93IHg4NiBpbnN0cnVjdGlvbiBkZWNvZGVyIHRvIGRlY29k
ZQp4ZW4tY3B1aWQgd2hpY2ggaGFzIFhFTl9FTVVMQVRFX1BSRUZJWCwgYW5kIHByb2hpYml0Cmtw
cm9iZXMgdG8gcHJvYmUgb24gaXQuCgpKb3NoIHJlcG9ydGVkIHRoYXQgdGhlIG9ianRvb2wgY2Fu
IG5vdCBkZWNvZGUgc3VjaCBzcGVjaWFsCnByZWZpeGVkIGluc3RydWN0aW9ucywgYW5kIEkgZm91
bmQgdGhhdCB3ZSBhbHNvIGhhdmUgdG8KcHJvaGliaXQga3Byb2JlcyB0byBwcm9iZSBvbiBzdWNo
IGluc3RydWN0aW9uLgoKVGhpcyBzZXJpZXMgY2FuIGJlIGFwcGxpZWQgb24gLXRpcCBtYXN0ZXIg
YnJhbmNoIHdoaWNoCmhhcyBtZXJnZWQgSm9zaCdzIG9ianRvb2wvcGVyZiBzaGFyaW5nIGNvbW1v
biB4ODYgaW5zbgpkZWNvZGVyIHNlcmllcy4KCgpUaGFuayB5b3UsCgotLS0KCk1hc2FtaSBIaXJh
bWF0c3UgKDIpOgogICAgICB4ODY6IHhlbjogaW5zbjogRGVjb2RlIFhFTl9FTVVMQVRFX1BSRUZJ
WCBjb3JyZWN0bHkKICAgICAgeDg2OiBrcHJvYmVzOiBQcm9oaWJpdCBwcm9iaW5nIG9uIGluc3Ry
dWN0aW9uIHdoaWNoIGhhcyBYZW4gcHJlZml4CgoKIGFyY2gveDg2L2luY2x1ZGUvYXNtL2luc24u
aCAgICAgICAgICAgICB8ICAgIDIgKwogYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL2ludGVyZmFj
ZS5oICAgIHwgICAgNyArKysrLQogYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3ByZWZpeC5oICAg
ICAgIHwgICAxMCArKysrKysrCiBhcmNoL3g4Ni9rZXJuZWwva3Byb2Jlcy9jb3JlLmMgICAgICAg
ICAgfCAgICA0ICsrKwogYXJjaC94ODYvbGliL2luc24uYyAgICAgICAgICAgICAgICAgICAgIHwg
ICA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9pbnNuLmggICAgICAgfCAgICAyICsKIHRvb2xzL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3hlbi9wcmVmaXguaCB8ICAgMTAgKysrKysrKwogdG9vbHMvYXJjaC94ODYvbGliL2luc24uYyAg
ICAgICAgICAgICAgIHwgICA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29s
cy9vYmp0b29sL3N5bmMtY2hlY2suc2ggICAgICAgICAgICAgfCAgICAzICstCiA5IGZpbGVzIGNo
YW5nZWQsIDEyMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9wcmVmaXguaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IHRvb2xzL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9wcmVmaXguaAoKLS0KTWFzYW1pIEhpcmFt
YXRzdSAoTGluYXJvKSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
