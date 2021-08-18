Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656503F0CCA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 22:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168319.307353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCR-0000Hg-JR; Wed, 18 Aug 2021 20:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168319.307353; Wed, 18 Aug 2021 20:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCR-0000Dq-Ep; Wed, 18 Aug 2021 20:30:11 +0000
Received: by outflank-mailman (input) for mailman id 168319;
 Wed, 18 Aug 2021 20:30:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydNC=NJ=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mGSCP-000714-Nd
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 20:30:09 +0000
Received: from mail-pf1-x435.google.com (unknown [2607:f8b0:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd9e6df9-4592-4715-ae5d-e603d1893426;
 Wed, 18 Aug 2021 20:29:53 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 7so3368365pfl.10
 for <xen-devel@lists.xenproject.org>; Wed, 18 Aug 2021 13:29:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id h25sm663775pfo.68.2021.08.18.13.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:29:50 -0700 (PDT)
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
X-Inumbo-ID: bd9e6df9-4592-4715-ae5d-e603d1893426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8OBC9884kmwmCHY2iZR5n9BK6YWwg3ipAzzHcSbYvfU=;
        b=aYYTc19KeDyUYd0t94QMEaH6q9fhEci8qpdovRYZuUMY7fz+5XrpgsdGa9C7nQCexA
         WwQD17e3FIwPisFBSif8BvlJEa53NJD+W0uke4Z0OFQAO91yJwQ9hxN91eH3oxJiunYF
         EmVk0arSgSaNZn132JojeNDAPyPSnBHrbzkKvOYV66X2q1u4mTuPdXvHIquR3FlAKfZi
         fDNuIjfyVvypGwUSG109X7DP4Sr/XflCB8XafQiesYjaTJxE7bj/1HpjQkc8ZFo/2lgB
         WJwjELHXXXx52+w+LUrkPZBb/oHtDn+rEdFB5VL/w1MUNfcWw5mkeR9X3lqQCNCr4SES
         MfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=8OBC9884kmwmCHY2iZR5n9BK6YWwg3ipAzzHcSbYvfU=;
        b=LSfprd0VcePxPBBkhNBw6ZheCDE1IjqivtQ9tDcImFIJbJrSNuUOnq2av9wmvBjIqq
         kzL4uARwN6yooJki9/sDt+mrJFYCYxPNyVcx9+udr6KmT6leSu/802+SlwP+BjZjPhfm
         SnxNvzawueXBP2zfMhzvdZmjyNzF76HYxKiIPW8DrNZsW0MfOZowOF1e+q5zKrWFc+eu
         cAXWNfaNJorM2slsuCW+1rwjeEDyIivaHNPUITs6XibDC9d9qnWuy/LWpc3GZecmF8Ys
         lz2mRZWi0zLJJ8WeHferywNnH4mvhT0GcQYIsi0ek33aST4g9RxwOOVinvSnmJVw2fxh
         GhjQ==
X-Gm-Message-State: AOAM532Ju/jEbU+13swPyB/sCQyZrzctuO4RfsIcIc1GjDyO74aeYgbp
	g5ox3wxBEnNP1nk3whpUmBPNLbZ56fuMJYoC
X-Google-Smtp-Source: ABdhPJwQBPt96fqTcpLeTFg1kVF+kEHwh8L6sFdo5h44QFmLMKaVmZZz0ny+bibgDTMn7Z4TIvOTAA==
X-Received: by 2002:a62:b615:0:b029:3e0:20c3:181c with SMTP id j21-20020a62b6150000b02903e020c3181cmr11199194pff.62.1629318590543;
        Wed, 18 Aug 2021 13:29:50 -0700 (PDT)
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
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v3 3/6] arch/x86: rename debug.c to gdbsx.c
Date: Wed, 18 Aug 2021 13:29:04 -0700
Message-Id: <9ab53497cdd52e3aeaeff8079d934dcee94d6479.1629315873.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629315873.git.bobby.eshleman@gmail.com>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
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
 xen/arch/x86/Makefile             |  2 +-
 xen/arch/x86/domctl.c             | 12 +-----------
 xen/arch/x86/{debug.c => gdbsx.c} | 12 ++++++++++--
 xen/include/asm-x86/debugger.h    |  6 ------
 xen/include/asm-x86/gdbsx.h       | 17 +++++++++++++++++
 5 files changed, 29 insertions(+), 20 deletions(-)
 rename xen/arch/x86/{debug.c => gdbsx.c} (93%)
 create mode 100644 xen/include/asm-x86/gdbsx.h

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index fe38cfd544..ef8c2c4770 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -20,7 +20,7 @@ obj-y += cpuid.o
 obj-$(CONFIG_PV) += compat.o
 obj-$(CONFIG_PV32) += x86_64/compat.o
 obj-$(CONFIG_KEXEC) += crash.o
-obj-$(CONFIG_GDBSX) += debug.o
+obj-$(CONFIG_GDBSX) += gdbsx.o
 obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
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
index 0000000000..2b8812881d
--- /dev/null
+++ b/xen/include/asm-x86/gdbsx.h
@@ -0,0 +1,17 @@
+#ifndef __X86_GDBX_H
+#define __X86_GDBX_H__
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


