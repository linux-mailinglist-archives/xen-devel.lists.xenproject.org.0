Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEA9AA0838
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971782.1360182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hxW-00031I-VK; Tue, 29 Apr 2025 10:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971782.1360182; Tue, 29 Apr 2025 10:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hxW-0002zo-Rl; Tue, 29 Apr 2025 10:13:02 +0000
Received: by outflank-mailman (input) for mailman id 971782;
 Tue, 29 Apr 2025 10:13:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b72w=XP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u9hxW-0002lF-01
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:13:02 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 883c51b5-24e2-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 12:13:01 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so54300835e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 03:13:01 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441ad81c19fsm11819825e9.0.2025.04.29.03.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 03:12:59 -0700 (PDT)
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
X-Inumbo-ID: 883c51b5-24e2-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745921580; x=1746526380; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ri4wmQ14jFAaQdVruW8LmHQFglkscs4x372ajXNwYuk=;
        b=kjOvnWNmVROXeImcp2cztIiTVgWUn3Uk5h+wkckU2L4fxEMiIv8FrGsEtoYFN1d5yD
         P239A8P1GrJN8ZhkyOJ9yNFGZPH8ldevSO6GWMlRayaIgWtKfW5rqNzSHCQzu/xTcJxy
         X0ogxdyIBv3lSIS/2oIm9AsasOJLh51qh9R3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745921580; x=1746526380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ri4wmQ14jFAaQdVruW8LmHQFglkscs4x372ajXNwYuk=;
        b=Pul3xI7d7Igo9GblNC7kK8EeNr53jNiPOQGz86mdCfbM4vMQVnUTdFLjBPddBylUbR
         X4x/M+t4OO/jJ8x7MyGAhw+P0AiXH7FVe+dgQUjkwwBaZ4yErUZ8FCMqxeDdXG6SpSHp
         43dEcwiJmChrENQplwcyciVTI9Ro6IlIVX5Q2paQxiK1hPmqcm7dgASf44sVdKhQrsMT
         IVQ0wcxLhq+sOL25TGXtwjq/FT+h0aC2OUWMJO3SLSKb0q6BZl9ZhWi4Mc2yWPcbTN+G
         /zAfZO9Jh7x2vPUVZiJ19lG1NYZqG9Jzji4V62KahUubZ502bvaW2SDz9+LG8iASRfft
         d5pw==
X-Gm-Message-State: AOJu0Ywh95CzOPOoCh5XaZ3fFbO+ZOyApt7dDJkA9hNdJDWaK6WlPWl3
	AC2kQ9DvsC0dvWLxt9rYE5uuKshgt5WF6B0GSIPcR4u3Y7XkgKVzuswhtCpEmIbTffJcNh1F9FP
	e
X-Gm-Gg: ASbGncsg+WXzKNPPBkbz1KwaWpTjjz/H+uPtNUku2LlQlCXSUUrxoANrlZVtSHzNTer
	0GKo0l70ys4CouB8iDhBZU3zjyCi4W+T6vRsE1N1Te+1KI8LR6arSKF26KB5N58nluHDNbn6FNi
	rEdRHxSDp29oB/6NQk1XN/Zjt45c/0XJ9S+m+ReE6cMP3H4IV5aVh5d5EkbRWlqQl5FrLozgO1w
	vVVjY4ygIRljp8Ju1sEieha1PcQA8LOrPEKJZKRJ1c0tGqWU6CmU0l+V6Y1BtHRdGS0+UOqlJ01
	FYwGh6l4rTH7dRwzoF8ayN34bTBOUeNEJfLzSFAy3pGNUA==
X-Google-Smtp-Source: AGHT+IHgXp+/R0LpuIdMsyNrEQcDMzkWjxDQlbrc35ABQreyke2WHfj270jhEweqbBy9adnfizgq9w==
X-Received: by 2002:a05:600c:1912:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-441ac857271mr29144405e9.12.1745921580280;
        Tue, 29 Apr 2025 03:13:00 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 1/4] xen/io: provide helpers for multi size MMIO accesses
Date: Tue, 29 Apr 2025 12:12:49 +0200
Message-ID: <20250429101252.50071-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429101252.50071-1-roger.pau@citrix.com>
References: <20250429101252.50071-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Several handlers have the same necessity of reading or writing from or to
an MMIO region using 1, 2, 4 or 8 bytes accesses.  So far this has been
open-coded in the function itself.  Instead provide a new set of handlers
that encapsulate the accesses.

Since the added helpers are not architecture specific, introduce a new
generic io.h header.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Rebase on top of Jan's fix to mmio_ro_emulated_write().
---
 xen/arch/x86/hvm/vmsi.c | 47 ++-------------------------
 xen/arch/x86/mm.c       | 32 ++++++-------------
 xen/drivers/vpci/msix.c | 47 ++-------------------------
 xen/include/xen/io.h    | 70 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+), 111 deletions(-)
 create mode 100644 xen/include/xen/io.h

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index fd83abb929ec..61b89834d97d 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -24,6 +24,7 @@
  * Will be merged it with virtual IOAPIC logic, since most is the same
 */
 
+#include <xen/io.h>
 #include <xen/types.h>
 #include <xen/mm.h>
 #include <xen/xmalloc.h>
@@ -304,28 +305,7 @@ static void adjacent_read(
 
     hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
 
-    switch ( len )
-    {
-    case 1:
-        *pval = readb(hwaddr);
-        break;
-
-    case 2:
-        *pval = readw(hwaddr);
-        break;
-
-    case 4:
-        *pval = readl(hwaddr);
-        break;
-
-    case 8:
-        *pval = readq(hwaddr);
-        break;
-
-    default:
-        ASSERT_UNREACHABLE();
-        break;
-    }
+    *pval = read_mmio(hwaddr, len);
 }
 
 static void adjacent_write(
@@ -344,28 +324,7 @@ static void adjacent_write(
 
     hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
 
-    switch ( len )
-    {
-    case 1:
-        writeb(val, hwaddr);
-        break;
-
-    case 2:
-        writew(val, hwaddr);
-        break;
-
-    case 4:
-        writel(val, hwaddr);
-        break;
-
-    case 8:
-        writeq(val, hwaddr);
-        break;
-
-    default:
-        ASSERT_UNREACHABLE();
-        break;
-    }
+    write_mmio(hwaddr, val, len);
 }
 
 static int cf_check msixtbl_read(
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index ac5b51d17aca..732ca1366f33 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -95,6 +95,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/io.h>
 #include <xen/iocap.h>
 #include <xen/ioreq.h>
 #include <xen/irq.h>
@@ -116,7 +117,6 @@
 #include <asm/flushtlb.h>
 #include <asm/guest.h>
 #include <asm/idt.h>
-#include <asm/io.h>
 #include <asm/io_apic.h>
 #include <asm/ldt.h>
 #include <asm/mem_sharing.h>
@@ -5102,7 +5102,7 @@ static void __iomem *subpage_mmio_map_page(
 static void subpage_mmio_write_emulate(
     mfn_t mfn,
     unsigned int offset,
-    const void *data,
+    unsigned long data,
     unsigned int len)
 {
     struct subpage_ro_range *entry;
@@ -5131,26 +5131,8 @@ static void subpage_mmio_write_emulate(
         return;
     }
 
-    addr += offset;
-    switch ( len )
-    {
-    case 1:
-        writeb(*(const uint8_t*)data, addr);
-        break;
-    case 2:
-        writew(*(const uint16_t*)data, addr);
-        break;
-    case 4:
-        writel(*(const uint32_t*)data, addr);
-        break;
-    case 8:
-        writeq(*(const uint64_t*)data, addr);
-        break;
-    default:
-        /* mmio_ro_emulated_write() already validated the size */
-        ASSERT_UNREACHABLE();
+    if ( !write_mmio(addr + offset, data, len) )
         goto write_ignored;
-    }
 }
 
 #ifdef CONFIG_HVM
@@ -5185,6 +5167,7 @@ int cf_check mmio_ro_emulated_write(
     struct x86_emulate_ctxt *ctxt)
 {
     struct mmio_ro_emulate_ctxt *mmio_ro_ctxt = ctxt->data;
+    unsigned long data = 0;
 
     /* Only allow naturally-aligned stores at the original %cr2 address. */
     if ( ((bytes | offset) & (bytes - 1)) || !bytes ||
@@ -5195,9 +5178,12 @@ int cf_check mmio_ro_emulated_write(
         return X86EMUL_UNHANDLEABLE;
     }
 
-    if ( bytes <= 8 )
+    if ( bytes <= sizeof(data) )
+    {
+        memcpy(&data, p_data, bytes);
         subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
-                                   p_data, bytes);
+                                   data, bytes);
+    }
     else if ( subpage_mmio_find_page(mmio_ro_ctxt->mfn) )
         gprintk(XENLOG_WARNING,
                 "unsupported %u-byte write to R/O MMIO 0x%"PRI_mfn"%03lx\n",
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 3568f2a65183..74211301ba10 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -17,6 +17,7 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/io.h>
 #include <xen/sched.h>
 #include <xen/vpci.h>
 
@@ -338,28 +339,7 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
         return X86EMUL_OKAY;
     }
 
-    switch ( len )
-    {
-    case 1:
-        *data = readb(mem + PAGE_OFFSET(addr));
-        break;
-
-    case 2:
-        *data = readw(mem + PAGE_OFFSET(addr));
-        break;
-
-    case 4:
-        *data = readl(mem + PAGE_OFFSET(addr));
-        break;
-
-    case 8:
-        *data = readq(mem + PAGE_OFFSET(addr));
-        break;
-
-    default:
-        ASSERT_UNREACHABLE();
-        break;
-    }
+    *data = read_mmio(mem + PAGE_OFFSET(addr), len);
     spin_unlock(&vpci->lock);
 
     return X86EMUL_OKAY;
@@ -487,28 +467,7 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
         return X86EMUL_OKAY;
     }
 
-    switch ( len )
-    {
-    case 1:
-        writeb(data, mem + PAGE_OFFSET(addr));
-        break;
-
-    case 2:
-        writew(data, mem + PAGE_OFFSET(addr));
-        break;
-
-    case 4:
-        writel(data, mem + PAGE_OFFSET(addr));
-        break;
-
-    case 8:
-        writeq(data, mem + PAGE_OFFSET(addr));
-        break;
-
-    default:
-        ASSERT_UNREACHABLE();
-        break;
-    }
+    write_mmio(mem + PAGE_OFFSET(addr), data, len);
     spin_unlock(&vpci->lock);
 
     return X86EMUL_OKAY;
diff --git a/xen/include/xen/io.h b/xen/include/xen/io.h
new file mode 100644
index 000000000000..164a20c5d7b5
--- /dev/null
+++ b/xen/include/xen/io.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * IO related routines.
+ *
+ * Copyright (c) 2025 Cloud Software Group
+ */
+#ifndef XEN_IO_H
+#define XEN_IO_H
+
+#include <xen/bug.h>
+
+#include <asm/io.h>
+
+static inline unsigned long read_mmio(const volatile void __iomem *mem,
+                                      unsigned int size)
+{
+    switch ( size )
+    {
+    case 1:
+        return readb(mem);
+
+    case 2:
+        return readw(mem);
+
+    case 4:
+        return readl(mem);
+
+#ifdef CONFIG_64BIT
+    case 8:
+        return readq(mem);
+#endif
+
+    default:
+        ASSERT_UNREACHABLE();
+        return ~0UL;
+    }
+}
+
+static inline bool write_mmio(volatile void __iomem *mem, unsigned long data,
+                              unsigned int size)
+{
+    switch ( size )
+    {
+    case 1:
+        writeb(data, mem);
+        break;
+
+    case 2:
+        writew(data, mem);
+        break;
+
+    case 4:
+        writel(data, mem);
+        break;
+
+#ifdef CONFIG_64BIT
+    case 8:
+        writeq(data, mem);
+        break;
+#endif
+
+    default:
+        ASSERT_UNREACHABLE();
+        return false;
+    }
+
+    return true;
+}
+
+#endif /* XEN_IO_H */
-- 
2.48.1


