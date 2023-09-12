Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D8D79DCA0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 01:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600821.936646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChL-0000l8-8Q; Tue, 12 Sep 2023 23:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600821.936646; Tue, 12 Sep 2023 23:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChL-0000ge-3W; Tue, 12 Sep 2023 23:21:35 +0000
Received: by outflank-mailman (input) for mailman id 600821;
 Tue, 12 Sep 2023 23:21:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qLIb=E4=citrix.com=prvs=612d1dac3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgChJ-0008LM-PS
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 23:21:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b46ccd3-51c3-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 01:21:31 +0200 (CEST)
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
X-Inumbo-ID: 1b46ccd3-51c3-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694560891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=apmerlyDUBgQyxtkEbBPNC4C0DW18lxpoQKg6ktPeMI=;
  b=GNU7BbtQZe7IUE4NS4X7GG8SjU2lunIePUv/DuH/hDj9yTFSyUMKL0hh
   WxqaO8feQpuCvjcza9Y3/B8TfM81pSiQ19Xb1LM1xYwQ86vpPDmC4YbV2
   orxGN6yqA8Bvk5PEi9LI7Y9ywMXqnae4zmc5weXr2VgOHzQMAcn6/jnJp
   E=;
X-CSE-ConnectionGUID: nO66D9+OQ+yXSxiZ0nj3dw==
X-CSE-MsgGUID: 3A1q4fmuT5W4bqNegB7EWg==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125168442
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:WluxHaoRxEKXmnclhAYkSF5bz3BeBmIwZRIvgKrLsJaIsI4StFCzt
 garIBmAafbZY2ejeIgnOYiz9UsC7MLQz4UwQAI+qCgxE34UoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5wePziNNUfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADYqME6v1qGR+fGqetJ8h/Z7KsuwMJxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jucoj2nUk1GbrRzzxLe2yu12uHKgB+mZ94YDZu1+dQ1rWKckzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBLT5utrqVD3GU8LjSrimaNi0cLGtEbigBJTbp+PG6/tt11EiWCI8+Tujs1Iad9SzML
 y6iqg9g2ZlCzukylLSLxkDGsWqqpMPFUVtgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9jhYyjJ5fK6fTgAahwzRoMUCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoFrtAjeR1m3ljmDq7qXXHI/OPi+b2WZJoYe1dbAvmgh4RvMtoXzk5A
 /4AbpDXmn2zocX1YzXN8J57ELz5BSFTOHwCkOQOLrTrClM/SAkc5wr5netJl3pNw/4EyY8lP
 xiVBidl9bYIrSSed17SOik9MOKHsFQWhStTABHA9G2AgxALCbtDJo9FH3frVdHLLNBe8MM=
IronPort-HdrOrdr: A9a23:zJpDGqDuy/6moNHlHemW55DYdb4zR+YMi2TDgXoBLiC9Ffbo9P
 xG/c566faasl0ssR0b8+xoW5PgfZq/z/FICNIqTNOftWDd0QOVxedZgLcKqAePJ8SRzIJgPQ
 gLSdkZNDVdZ2IK7/oTQWODYrMd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3AOC6ACGp2xm/8TAVC0A384tbmUcYCLCPxnTT3Ggy?=
 =?us-ascii?q?pOV15SY/NT13L9Lwxxg=3D=3D?=
X-Talos-MUID: 9a23:XKj01gT2w/Wjb3k8RXS3rWh7aMlt/pjzNxwHiLMLtOPbGBN/bmI=
X-IronPort-AV: E=Sophos;i="6.02,141,1688443200"; 
   d="scan'208";a="125168442"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 2/5] x86: Introduce x86_merge_dr6()
Date: Wed, 13 Sep 2023 00:21:10 +0100
Message-ID: <20230912232113.402347-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230912232113.402347-1-andrew.cooper3@citrix.com>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The current logic used to update %dr6 when injecting #DB is buggy.  The
architectural behaviour is to overwrite B{0..3} and accumulate all other bits.

Introduce x86_merge_dr6() to perform the operaton properly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/debug.c                 | 20 ++++++++++++++++++++
 xen/arch/x86/include/asm/debugreg.h  |  7 +++++++
 xen/arch/x86/include/asm/x86-defns.h |  7 +++++++
 3 files changed, 34 insertions(+)

diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index 127fe83021cd..bfcd83ea4d0b 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2023 XenServer.
  */
 #include <xen/kernel.h>
+#include <xen/lib.h>
 
 #include <xen/lib/x86/cpu-policy.h>
 
@@ -28,6 +29,25 @@ unsigned int x86_adj_dr6_rsvd(const struct cpu_policy *p, unsigned int dr6)
     return dr6;
 }
 
+unsigned int x86_merge_dr6(const struct cpu_policy *p, unsigned int dr6,
+                           unsigned int new)
+{
+    /* Flip dr6 to have positive polarity. */
+    dr6 ^= X86_DR6_DEFAULT;
+
+    /* Sanity check that only known values are passed in. */
+    ASSERT(!(dr6 & ~X86_DR6_KNOWN_MASK));
+    ASSERT(!(new & ~X86_DR6_KNOWN_MASK));
+
+    /* Breakpoint matches are overridden.  All other bits accumulate. */
+    dr6 = (dr6 & ~X86_DR6_BP_MASK) | new;
+
+    /* Flip dr6 back to having default polarity. */
+    dr6 ^= X86_DR6_DEFAULT;
+
+    return x86_adj_dr6_rsvd(p, dr6);
+}
+
 unsigned int x86_adj_dr7_rsvd(const struct cpu_policy *p, unsigned int dr7)
 {
     unsigned int zeros = X86_DR7_ZEROS;
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index 39ba312b84ee..e98a9ce977fa 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -89,4 +89,11 @@ struct cpu_policy;
 unsigned int x86_adj_dr6_rsvd(const struct cpu_policy *p, unsigned int dr6);
 unsigned int x86_adj_dr7_rsvd(const struct cpu_policy *p, unsigned int dr7);
 
+/*
+ * Merge new bits into dr6.  'new' is always given in positive polarity,
+ * matching the Intel VMCS PENDING_DBG semantics.
+ */
+unsigned int x86_merge_dr6(const struct cpu_policy *p, unsigned int dr6,
+                           unsigned int new);
+
 #endif /* _X86_DEBUGREG_H */
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 5838631ef634..edfecc89bd08 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -116,6 +116,13 @@
 #define X86_DR6_BT              (_AC(1, UL) << 15)   /* Task switch                 */
 #define X86_DR6_RTM             (_AC(1, UL) << 16)   /* #DB/#BP in RTM region (INV) */
 
+#define X86_DR6_BP_MASK                                 \
+    (X86_DR6_B0 | X86_DR6_B1 | X86_DR6_B2 | X86_DR6_B3)
+
+#define X86_DR6_KNOWN_MASK                                      \
+    (X86_DR6_BP_MASK | X86_DR6_BLD | X86_DR6_BD | X86_DR6_BS |  \
+     X86_DR6_BT | X86_DR6_RTM)
+
 #define X86_DR6_ZEROS           _AC(0x00001000, UL)  /* %dr6 bits forced to 0       */
 #define X86_DR6_DEFAULT         _AC(0xffff0ff0, UL)  /* Default %dr6 value          */
 
-- 
2.30.2


