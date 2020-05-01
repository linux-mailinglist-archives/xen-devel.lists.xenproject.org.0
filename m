Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9205C1C2116
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 01:04:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUehw-0001G4-5N; Fri, 01 May 2020 23:04:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUehu-0001FM-JM
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 23:04:34 +0000
X-Inumbo-ID: 1aa23f5e-8c00-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1aa23f5e-8c00-11ea-ae69-bc764e2007e4;
 Fri, 01 May 2020 23:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588374266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uwqto+nsVNLj4DX0sYxzltmriQwYE0YYvDMISJG9Vwo=;
 b=ca/Y9wdg9cmMQpC3zP2Ui4KH0I8NVjJXvc0kr3vkrt3YLGY2usoshxAX
 nhfOsQW3Cku71pAPLN/s+m5eBRf+kvHP+SBlA5zqYSN+8KYbZYor0ro4I
 DyI23g5Tf59uthtG8myT92ICjOsJQEXCIuhMgjH4N2KjVr/Zgt0vRVxhq 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vyZJf3XChK3+6Biz+YWJLkqCcBFG7t+PFauyzWQfKb9zrybxorqUy3rh0tRdcOmcwU3CGgISvh
 AH+Bh7Ql2I3ViuWPd3lwaZ/ovOI8NPHBZEFMxWfxzDjTzc2pnXc7vFq0zTZrOcincvZo0Ph3FH
 tCaVyfz5hEEiOHBL60lcUiC8CQCTswwturEabnlNLXsLXQsfyZh2bRhBM6jxWb4HLI9q9hyu4N
 Be8ZGyyI27g3DUZr1FjC13O0uesvVRjPAJPRoplG9UjBwr3UaYkomzHNjiZJTT7JJkg6DikVbw
 oWI=
X-SBRS: 2.7
X-MesageID: 16855103
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16855103"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 10/16] x86/cpu: Adjust reset_stack_and_jump() to be shadow
 stack compatible
Date: Fri, 1 May 2020 23:58:32 +0100
Message-ID: <20200501225838.9866-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We need to unwind up to the supervisor token.  See the comment for details.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/asm-x86/current.h | 42 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/xen/include/asm-x86/current.h b/xen/include/asm-x86/current.h
index 99b66a0087..2a7b728b1e 100644
--- a/xen/include/asm-x86/current.h
+++ b/xen/include/asm-x86/current.h
@@ -124,13 +124,49 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
 # define CHECK_FOR_LIVEPATCH_WORK ""
 #endif
 
+#ifdef CONFIG_XEN_SHSTK
+/*
+ * We need to unwind the primary shadow stack to its supervisor token, located
+ * at 0x5ff8 from the base of the stack blocks.
+ *
+ * Read the shadow stack pointer, subtract it from 0x5ff8, divide by 8 to get
+ * the number of slots needing popping.
+ *
+ * INCSSPQ can't pop more than 255 entries.  We shouldn't ever need to pop
+ * that many entries, and getting this wrong will cause us to #DF later.
+ */
+# define SHADOW_STACK_WORK                      \
+    "mov $1, %[ssp];"                           \
+    "rdsspd %[ssp];"                            \
+    "cmp $1, %[ssp];"                           \
+    "je 1f;" /* CET not active?  Skip. */       \
+    "mov $"STR(0x5ff8)", %[val];"               \
+    "and $"STR(STACK_SIZE - 1)", %[ssp];"       \
+    "sub %[ssp], %[val];"                       \
+    "shr $3, %[val];"                           \
+    "cmp $255, %[val];"                         \
+    "jle 2f;"                                   \
+    "ud2a;"                                     \
+    "2: incsspq %q[val];"                       \
+    "1:"
+#else
+# define SHADOW_STACK_WORK ""
+#endif
+
 #define switch_stack_and_jump(fn, instr)                                \
     ({                                                                  \
+        unsigned int tmp;                                               \
         __asm__ __volatile__ (                                          \
-            "mov %0,%%"__OP"sp;"                                        \
+            "cmc;"                                                      \
+            SHADOW_STACK_WORK                                           \
+            "mov %[stk], %%rsp;"                                        \
             instr                                                       \
-             "jmp %c1"                                                  \
-            : : "r" (guest_cpu_user_regs()), "i" (fn) : "memory" );     \
+            "jmp %c[fun];"                                              \
+            : [val] "=&r" (tmp),                                        \
+              [ssp] "=&r" (tmp)                                         \
+            : [stk] "r" (guest_cpu_user_regs()),                        \
+              [fun] "i" (fn)                                            \
+            : "memory" );                                               \
         unreachable();                                                  \
     })
 
-- 
2.11.0


