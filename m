Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BDEAB90C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:15:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6E3o-0000oQ-Lo; Fri, 06 Sep 2019 13:13:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i6E3m-0000oC-Ow
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:13:54 +0000
X-Inumbo-ID: 2d0f1d88-d0a8-11e9-abf5-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d0f1d88-d0a8-11e9-abf5-12813bfff9fa;
 Fri, 06 Sep 2019 13:13:54 +0000 (UTC)
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00E2E206BB;
 Fri,  6 Sep 2019 13:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567775633;
 bh=rZzxI9XArt0wbskwU2r8uJHAgPdmUcSFpX/eT3zQGMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C6NY01TImkhzgeTZiksXsH1gnuCvp59kbibTxZmzs4RbcDHmv/N8J/RTAVQ1u2WUM
 gNBp8lMkjd6IlByDMIOGHwx0Z7DL/Xa6VMvWQykvlni9e1vmH4ZVGHPTnbOotvK1oO
 Lmo+YFCSuclG7ZsK7KMSa+YJj0y4flOxq8/Qb3oc=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Date: Fri,  6 Sep 2019 22:13:48 +0900
Message-Id: <156777562873.25081.2288083344657460959.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <156777561745.25081.1205321122446165328.stgit@devnote2>
References: <156777561745.25081.1205321122446165328.stgit@devnote2>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH -tip v4 1/4] x86/asm: Allow to pass macros to
 __ASM_FORM()
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

VXNlIF9fc3RyaW5naWZ5KCkgYXQgX19BU01fRk9STSgpIHNvIHRoYXQgdXNlciBjYW4gcGFzcwpj
b2RlIGluY2x1ZGluZyBtYWNyb3MgdG8gX19BU01fRk9STSgpLgoKU2lnbmVkLW9mZi1ieTogTWFz
YW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRl
L2FzbS9hc20uaCB8ICAgIDggKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vYXNt
LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hc20uaAppbmRleCAzZmY1NzdjMGIxMDIuLjFiNTYz
ZjkxNjdlYSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vYXNtLmgKKysrIGIvYXJj
aC94ODYvaW5jbHVkZS9hc20vYXNtLmgKQEAgLTcsOSArNywxMSBAQAogIyBkZWZpbmUgX19BU01f
Rk9STV9SQVcoeCkgICAgIHgKICMgZGVmaW5lIF9fQVNNX0ZPUk1fQ09NTUEoeCkgeCwKICNlbHNl
Ci0jIGRlZmluZSBfX0FTTV9GT1JNKHgpCSIgIiAjeCAiICIKLSMgZGVmaW5lIF9fQVNNX0ZPUk1f
UkFXKHgpICAgICAjeAotIyBkZWZpbmUgX19BU01fRk9STV9DT01NQSh4KSAiICIgI3ggIiwiCisj
aW5jbHVkZSA8bGludXgvc3RyaW5naWZ5Lmg+CisKKyMgZGVmaW5lIF9fQVNNX0ZPUk0oeCkJIiAi
IF9fc3RyaW5naWZ5KHgpICIgIgorIyBkZWZpbmUgX19BU01fRk9STV9SQVcoeCkgICAgIF9fc3Ry
aW5naWZ5KHgpCisjIGRlZmluZSBfX0FTTV9GT1JNX0NPTU1BKHgpICIgIiBfX3N0cmluZ2lmeSh4
KSAiLCIKICNlbmRpZgogCiAjaWZuZGVmIF9feDg2XzY0X18KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
