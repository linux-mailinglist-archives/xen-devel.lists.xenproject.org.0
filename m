Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FCA1E4E03
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1aH-00042G-Kh; Wed, 27 May 2020 19:19:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1aF-00041n-QK
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:19:23 +0000
X-Inumbo-ID: f33f80e4-a04e-11ea-81bc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f33f80e4-a04e-11ea-81bc-bc764e2007e4;
 Wed, 27 May 2020 19:19:13 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Tq6+s3Zh7QaRK595E15ZFckIpIk5gndEZuDz8ttfd0qmFsoM1hkOEjbDpJmnafihXdS2HWfRcK
 QVkAVn3Rogew9UeKYWAH/IlD37FBiRZJR2anYYwrexQOk8+W6IdikgmgQ91IBXK3pEfLaP1DAM
 N6gd/Mt3pHXf98aiI/OYkIiMcPVmOwN4qrs210s1yoSsDlLfidrAwIRjL7qHSPnlzZBL0xbvuQ
 67mO7Yp3pPLaQirrO8TluPLa7vsdyPssxO/H6VF+3sCQfFEywaUHox0NAOzp6g/8KgpVgvw+RP
 Q7A=
X-SBRS: 2.7
X-MesageID: 18850558
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="18850558"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 07/14] x86/cpu: Adjust enable_nmis() to be shadow stack
 compatible
Date: Wed, 27 May 2020 20:18:40 +0100
Message-ID: <20200527191847.17207-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200527191847.17207-1-andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
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

When executing an IRET-to-self, the shadow stack must agree with the regular
stack.  We can't manipulate SSP directly, so have to fake a shadow IRET frame
by executing 3 CALLs, then editing the result to look correct.

This is not a fastpath, is called on the BSP long before CET can be set up,
and may be called on the crash path after CET is disabled.  Use the fact that
INCSSP is allocated from the hint nop space to construct a test for CET being
active which is safe on all processors.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/asm-x86/processor.h | 43 +++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index 859bd9e2ec..badd7e60e5 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -545,17 +545,40 @@ static inline void enable_nmis(void)
 {
     unsigned long tmp;
 
-    asm volatile ( "mov %%rsp, %[tmp]     \n\t"
-                   "push %[ss]            \n\t"
-                   "push %[tmp]           \n\t"
-                   "pushf                 \n\t"
-                   "push %[cs]            \n\t"
-                   "lea 1f(%%rip), %[tmp] \n\t"
-                   "push %[tmp]           \n\t"
-                   "iretq; 1:             \n\t"
-                   : [tmp] "=&r" (tmp)
+    asm volatile ( "mov     %%rsp, %[rsp]        \n\t"
+                   "lea    .Ldone(%%rip), %[rip] \n\t"
+#ifdef CONFIG_XEN_SHSTK
+                   /* Check for CET-SS being active. */
+                   "mov    $1, %k[ssp]           \n\t"
+                   "rdsspq %[ssp]                \n\t"
+                   "cmp    $1, %k[ssp]           \n\t"
+                   "je     .Lshstk_done          \n\t"
+
+                   /* Push 3 words on the shadow stack */
+                   ".rept 3                      \n\t"
+                   "call 1f; nop; 1:             \n\t"
+                   ".endr                        \n\t"
+
+                   /* Fixup to be an IRET shadow stack frame */
+                   "wrssq  %q[cs], -1*8(%[ssp])  \n\t"
+                   "wrssq  %[rip], -2*8(%[ssp])  \n\t"
+                   "wrssq  %[ssp], -3*8(%[ssp])  \n\t"
+
+                   ".Lshstk_done:"
+#endif
+                   /* Write an IRET regular frame */
+                   "push   %[ss]                 \n\t"
+                   "push   %[rsp]                \n\t"
+                   "pushf                        \n\t"
+                   "push   %q[cs]                \n\t"
+                   "push   %[rip]                \n\t"
+                   "iretq                        \n\t"
+                   ".Ldone:                      \n\t"
+                   : [rip] "=&r" (tmp),
+                     [rsp] "=&r" (tmp),
+                     [ssp] "=&r" (tmp)
                    : [ss] "i" (__HYPERVISOR_DS),
-                     [cs] "i" (__HYPERVISOR_CS) );
+                     [cs] "r" (__HYPERVISOR_CS) );
 }
 
 void sysenter_entry(void);
-- 
2.11.0


