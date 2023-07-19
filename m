Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970E6759724
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 15:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565870.884450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7Na-0007Zn-DO; Wed, 19 Jul 2023 13:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565870.884450; Wed, 19 Jul 2023 13:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7Na-0007Xu-Ae; Wed, 19 Jul 2023 13:38:10 +0000
Received: by outflank-mailman (input) for mailman id 565870;
 Wed, 19 Jul 2023 13:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dh/8=DF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qM7NZ-0007Xo-4v
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 13:38:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ee32a38-2639-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 15:38:08 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.163.72.116])
 by support.bugseng.com (Postfix) with ESMTPSA id CEBDD4EE0C89;
 Wed, 19 Jul 2023 15:38:05 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7ee32a38-2639-11ee-b23a-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH] xen: address MISRA C:2012 Rule 4.1
Date: Wed, 19 Jul 2023 15:37:57 +0200
Message-Id: <378f18c287cfb65d25b42209c85645a2a10ff9b2.1689763253.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Rule 4.1 has the following headline:
"Octal and hexadecimal escape sequences shall be terminated."

The string literals modified by this patch contain octal or
hexadecimal escape sequences that are neither terminated by the
end of the literal, nor by the beginning of another escape sequence.

Therefore, such unterminated sequences have been split into a
separate literal as a way to comply with the rule and preserve the
semantics of the code.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
The choice whether to put a blank between the literals is up to
the maintainers' preference, I chose to do so to improve legibility.
---
 xen/arch/x86/hvm/hvm.c  | 2 +-
 xen/common/decompress.c | 4 ++--
 xen/common/xz/stream.h  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 57363c2ae1..24ccf60d77 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3853,7 +3853,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
                                         cs, &addr) &&
              (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
                                          walk, NULL) == HVMTRANS_okay) &&
-             (memcmp(sig, "\xf\xbxen", sizeof(sig)) == 0) )
+             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
         {
             regs->rip += sizeof(sig);
             regs->eflags &= ~X86_EFLAGS_RF;
diff --git a/xen/common/decompress.c b/xen/common/decompress.c
index 989336983f..2c2c2ad877 100644
--- a/xen/common/decompress.c
+++ b/xen/common/decompress.c
@@ -19,13 +19,13 @@ int __init decompress(void *inbuf, unsigned int len, void *outbuf)
     if ( len >= 3 && !memcmp(inbuf, "\x42\x5a\x68", 3) )
         return bunzip2(inbuf, len, NULL, NULL, outbuf, NULL, error);
 
-    if ( len >= 6 && !memcmp(inbuf, "\3757zXZ", 6) )
+    if ( len >= 6 && !memcmp(inbuf, "\375" "7zXZ", 6) )
         return unxz(inbuf, len, NULL, NULL, outbuf, NULL, error);
 
     if ( len >= 2 && !memcmp(inbuf, "\135\000", 2) )
         return unlzma(inbuf, len, NULL, NULL, outbuf, NULL, error);
 
-    if ( len >= 5 && !memcmp(inbuf, "\x89LZO", 5) )
+    if ( len >= 5 && !memcmp(inbuf, "\x89" "LZO", 5) )
         return unlzo(inbuf, len, NULL, NULL, outbuf, NULL, error);
 
     if ( len >= 2 && !memcmp(inbuf, "\x02\x21", 2) )
diff --git a/xen/common/xz/stream.h b/xen/common/xz/stream.h
index d36d0fec64..8d9fbbe1b5 100644
--- a/xen/common/xz/stream.h
+++ b/xen/common/xz/stream.h
@@ -18,7 +18,7 @@
 
 #define STREAM_HEADER_SIZE 12
 
-#define HEADER_MAGIC "\3757zXZ"
+#define HEADER_MAGIC "\375" "7zXZ"
 #define HEADER_MAGIC_SIZE 6
 
 #define FOOTER_MAGIC "YZ"
-- 
2.34.1


