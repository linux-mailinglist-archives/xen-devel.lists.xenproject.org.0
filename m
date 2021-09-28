Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6241B857
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 22:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198417.351924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJkp-0005U0-N5; Tue, 28 Sep 2021 20:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198417.351924; Tue, 28 Sep 2021 20:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJkp-0005Qm-If; Tue, 28 Sep 2021 20:31:07 +0000
Received: by outflank-mailman (input) for mailman id 198417;
 Tue, 28 Sep 2021 20:31:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sVw8=OS=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mVJkn-0004O5-8a
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 20:31:05 +0000
Received: from mail-pj1-x1029.google.com (unknown [2607:f8b0:4864:20::1029])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e1b3f39-e5a9-43d1-aa06-bc1981eaae04;
 Tue, 28 Sep 2021 20:30:53 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id kn18so2846331pjb.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 13:30:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::5])
 by smtp.gmail.com with ESMTPSA id p15sm44201pfn.31.2021.09.28.13.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 13:30:51 -0700 (PDT)
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
X-Inumbo-ID: 1e1b3f39-e5a9-43d1-aa06-bc1981eaae04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3cH5NMmmhhrKVlr9rQQI0c7DM+lnZiRUgrGaScpUArg=;
        b=MIwX4bL4cVoR5aRrDq6die7FAJDBGUpZdW1160GnVJ8yqc3g22G9120i7ZUT0ZlJCW
         GTE/j7wTTcWgOsbdmQQwA3g3GeKLZa3+aMkhnGMpN0NgPD9Sbo4FpyRqWjvnp363KTyS
         aiNoDK/AnsJGgB/ZjeIg4OcAGC59R8CkHpa3coNOVSXUI60uOF2YQyldH3hcrkmx/NaN
         Ls9sQKjAGKuyU8IgS8XIQmNXbL0LEIuorTSlPL7gvMFJ3TRdmoELARs0ubn3SwJvwCvD
         NZG8dNMy57Wua1xE63bM7SUL8NPSdF8W1Wzs8LD2/KqKdmRbrBVerAfR4mY9hDQf/TSA
         Tqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=3cH5NMmmhhrKVlr9rQQI0c7DM+lnZiRUgrGaScpUArg=;
        b=vCeQn2UyLkpgW8ceEONqKrmZUgpxuxrGQ9q6ZpyNzp8jSOdlJGEHSD1909YPAsDMtF
         01fmd5QXpoCFlvJXOiUetdSFxLHgl/X9AFAd3bcYNBuXlZRdJzLT83mB9+63bKtdpjuy
         os4p2tknOBXGdfUNGwJTJNIAYuQOTqgkiE+aZSzUjBPq6AapFuB4WPpvsdjStr63t/z6
         sicMtrQJt762iyTwhsyZZC0s2qvTvkAA9japv2Dira1WzuYJ2u6gFgYBtRXLngGlXcgH
         MKG64p3bl3ArKmvd/6fAMhUYhaAX/Pl6KB+hQ9AncGVW+uapWB08gh8oyVLUYEB1uK19
         qq4g==
X-Gm-Message-State: AOAM5329xsZeTmxodGgitdFtCdoxrOROYDuOQC0ZNQn4bh4eSKb7Q3TM
	87/RsjrOuqy6YKwoIcJDe2/Rcsoq0t1MVqdl
X-Google-Smtp-Source: ABdhPJxlhP9wJVBhJuh8dHrjEZf/bP4hh4MfpGHaHA7u6jZFR1drBojqRdGgD/wzzQbgbQQvae6JtQ==
X-Received: by 2002:a17:902:7c17:b0:13e:2dd5:e5c4 with SMTP id x23-20020a1709027c1700b0013e2dd5e5c4mr6932711pll.68.1632861052219;
        Tue, 28 Sep 2021 13:30:52 -0700 (PDT)
Sender: Bobby Eshleman <bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v4 3/6] arch/x86: rename debug.c to gdbsx.c
Date: Tue, 28 Sep 2021 13:30:26 -0700
Message-Id: <389ae979063a4afc38d8dbadaf539e7f411a24ba.1632860589.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1632860589.git.bobby.eshleman@gmail.com>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit renames debug.c to gdbsx.c to clarify its purpose.

The function gdbsx_guest_mem_io() is moved from domctl.c to gdbsx.c.

Although gdbsx_guest_mem_io() is conditionally removed from its single
call site in domctl.c upon !CONFIG_GDBSX and so no stub is technically
necessary, this commit adds a stub that would preserve the functioning
of that call site if the #ifdef CONFIG_GDBSX were to ever be removed or
the function were to ever be called outside of such an ifdef block.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
Changes in v4:
- Alphebetize Makefile addition
- Fix broken header guard
- Include errno.h in gdbsx.h

 xen/arch/x86/Makefile             |  2 +-
 xen/arch/x86/domctl.c             | 12 +-----------
 xen/arch/x86/{debug.c => gdbsx.c} | 12 ++++++++++--
 xen/include/asm-x86/debugger.h    |  6 ------
 xen/include/asm-x86/gdbsx.h       | 19 +++++++++++++++++++
 5 files changed, 31 insertions(+), 20 deletions(-)
 rename xen/arch/x86/{debug.c => gdbsx.c} (93%)
 create mode 100644 xen/include/asm-x86/gdbsx.h

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index fe38cfd544..9fa2ea9aa1 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -20,7 +20,6 @@ obj-y += cpuid.o
 obj-$(CONFIG_PV) += compat.o
 obj-$(CONFIG_PV32) += x86_64/compat.o
 obj-$(CONFIG_KEXEC) += crash.o
-obj-$(CONFIG_GDBSX) += debug.o
 obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
@@ -32,6 +31,7 @@ obj-y += emul-i8254.o
 obj-y += extable.o
 obj-y += flushtlb.o
 obj-$(CONFIG_CRASH_DEBUG) += gdbstub.o
+obj-$(CONFIG_GDBSX) += gdbsx.o
 obj-y += hypercall.o
 obj-y += i387.o
 obj-y += i8259.o
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 26a76d2be9..a492fe140e 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -20,6 +20,7 @@
 #include <xen/console.h>
 #include <xen/iocap.h>
 #include <xen/paging.h>
+#include <asm/gdbsx.h>
 #include <asm/irq.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
@@ -33,20 +34,9 @@
 #include <public/vm_event.h>
 #include <asm/mem_sharing.h>
 #include <asm/xstate.h>
-#include <asm/debugger.h>
 #include <asm/psr.h>
 #include <asm/cpuid.h>
 
-#ifdef CONFIG_GDBSX
-static int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop)
-{
-    iop->remain = dbg_rw_mem(iop->gva, guest_handle_from_ptr(iop->uva, void),
-                             iop->len, domid, iop->gwr, iop->pgd3val);
-
-    return iop->remain ? -EFAULT : 0;
-}
-#endif
-
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
 {
diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/gdbsx.c
similarity index 93%
rename from xen/arch/x86/debug.c
rename to xen/arch/x86/gdbsx.c
index d90dc93056..adea0f017b 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/gdbsx.c
@@ -19,7 +19,7 @@
 #include <xen/mm.h>
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
-#include <asm/debugger.h>
+#include <asm/gdbsx.h>
 #include <asm/p2m.h>
 
 typedef unsigned long dbgva_t;
@@ -158,7 +158,7 @@ static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
  * pgd3: value of init_mm.pgd[3] in guest. see above.
  * Returns: number of bytes remaining to be copied.
  */
-unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
+static unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
                         unsigned int len, domid_t domid, bool toaddr,
                         uint64_t pgd3)
 {
@@ -174,6 +174,14 @@ unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
     return len;
 }
 
+int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop)
+{
+    iop->remain = dbg_rw_mem(iop->gva, guest_handle_from_ptr(iop->uva, void),
+                             iop->len, domid, iop->gwr, iop->pgd3val);
+
+    return iop->remain ? -EFAULT : 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-x86/debugger.h b/xen/include/asm-x86/debugger.h
index cd6b9477f7..ed4d5c829b 100644
--- a/xen/include/asm-x86/debugger.h
+++ b/xen/include/asm-x86/debugger.h
@@ -54,10 +54,4 @@ static inline bool debugger_trap_fatal(
 
 #endif
 
-#ifdef CONFIG_GDBSX
-unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
-                        unsigned int len, domid_t domid, bool toaddr,
-                        uint64_t pgd3);
-#endif
-
 #endif /* __X86_DEBUGGER_H__ */
diff --git a/xen/include/asm-x86/gdbsx.h b/xen/include/asm-x86/gdbsx.h
new file mode 100644
index 0000000000..473229a7fb
--- /dev/null
+++ b/xen/include/asm-x86/gdbsx.h
@@ -0,0 +1,19 @@
+#ifndef __X86_GDBX_H__
+#define __X86_GDBX_H__
+
+#include <xen/errno.h>
+
+#ifdef CONFIG_GDBSX
+
+int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop);
+
+#else
+
+static inline int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop)
+{
+    return -EOPNOTSUPP;
+}
+
+#endif
+
+#endif
-- 
2.32.0


