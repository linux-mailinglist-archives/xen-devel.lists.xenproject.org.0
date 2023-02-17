Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444269B205
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 18:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497213.768104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT4qd-0002ud-JQ; Fri, 17 Feb 2023 17:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497213.768104; Fri, 17 Feb 2023 17:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT4qd-0002rz-GK; Fri, 17 Feb 2023 17:48:39 +0000
Received: by outflank-mailman (input) for mailman id 497213;
 Fri, 17 Feb 2023 17:48:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZJw=6N=citrix.com=prvs=405a65846=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pT4qc-0002rh-E7
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 17:48:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c015a78-aeeb-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 18:48:35 +0100 (CET)
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
X-Inumbo-ID: 4c015a78-aeeb-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676656115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pQkR+t2gNbGqRxj7fNmsb+K2rgz5dHlSLHWFbF6Ydbw=;
  b=B9EhBZtg13lP1HYjlI50/jpjSxhHBocxQpB5dq62keTMAI01I89nJ23y
   tPd6OHMGd5jx0+ZPOYT/fBQYKkS0XDOjcWvTWn1DUZCEfg/p4BQe6zDsb
   n2WBckDPE3PTBLyit56nYuQWKvJFDi+Tks7gS8CD9kvprcaNeFEeBM3ud
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96897979
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6pGO3a9+L3jit0PR2HqfDrUDln6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GsYXGuDMqmLNzfxct53b4u//E5U6JXUn941GgBs/yE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6kU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklB+
 sA8MDxdMSuTmvyUnr28CbdMlPwseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0EwBbJ+
 TOZrgwVBDkrLNbGwn2I4kj3l7H9pBPaZN4CGu2Bo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cNahMgVQdVvOLzvZ8R0B3IDYhDApa624id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9w4DNJWfh0B3iM4ldjBO
 Ra7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHYonwxPxLIjzu2wCDAdJ3T3
 r/BLK6R4YsyU/w7nFJauc9DuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/FqmhmreVY3RjhxU6WKntvMueVNxsxoqwsBx
 VnlMmcw9bY1rSevxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:1N5Kzao2CEnA+oDbgt0Dg3oaV5oUeYIsimQD101hICG9vPbo7v
 xG/c5rrSMc7Qx6ZJhOo6HkBEDtewK/yXcx2/hzAV7AZmjbUQmTXeVfBOLZqlWKJ8S9zI5gPM
 xbAs9D4bPLfD5HZAXBjDVQ0exM/DBKys+VbC7loUtQcQ==
X-IronPort-AV: E=Sophos;i="5.97,306,1669093200"; 
   d="scan'208";a="96897979"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86/kexec: Annotate functions with ELF metadata
Date: Fri, 17 Feb 2023 17:48:14 +0000
Message-ID: <20230217174814.1006961-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217174814.1006961-1-andrew.cooper3@citrix.com>
References: <20230217174814.1006961-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All of kexec_reloc(), relocate_pages() and compatibility_mode() are
function-like.  Annotate them appropriately.

Furthermore, move the data into a different cacheline from the code, so the
relocation of compat_mode_gdt_desc doesn't trigger self-modifying safety logic
in the pipeline.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/kexec_reloc.S | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index a81f64146190..c7fc11fa5868 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -13,6 +13,7 @@
 
         .file __FILE__
 
+#include <xen/cache.h>
 #include <xen/kimage.h>
 
 #include <asm/asm_defns.h>
@@ -90,7 +91,10 @@ ENTRY(kexec_reloc)
         push    %rax
         lretq
 
-relocate_pages:
+        .type kexec_reloc, @function
+        .size kexec_reloc, . - kexec_reloc
+
+ENTRY(relocate_pages)
         /* %rdi - indirection page maddr */
         pushq   %rbx
 
@@ -137,9 +141,12 @@ relocate_pages:
         popq    %rbx
         ret
 
+        .type relocate_pages, @function
+        .size relocate_pages, . - relocate_pages
+
         .code32
 
-compatibility_mode:
+ENTRY(compatibility_mode)
         /* Setup some sane segments. */
         movl    $0x0008, %eax
         movl    %eax, %ds
@@ -167,7 +174,14 @@ compatibility_mode:
         call    *%ebp
         ud2
 
-        .align 4
+        .type compatibility_mode, @function
+        .size compatibility_mode, . - compatibility_mode
+
+        /*
+         * Ensure data is in a different cache line to code.
+         */
+        .align SMP_CACHE_BYTES, 0
+
 compat_mode_gdt_desc:
         .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
         .quad . - kexec_reloc        /* Relocated before use */
-- 
2.30.2


