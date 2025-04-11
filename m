Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6D8A85A90
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 12:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947031.1344782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1f-0000cP-5C; Fri, 11 Apr 2025 10:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947031.1344782; Fri, 11 Apr 2025 10:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3C1e-0000at-Vv; Fri, 11 Apr 2025 10:54:22 +0000
Received: by outflank-mailman (input) for mailman id 947031;
 Fri, 11 Apr 2025 10:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3ez=W5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u3C1d-00006G-No
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 10:54:21 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51f9e349-16c3-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 12:54:20 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39c30d9085aso1117000f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 03:54:20 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eaf43cc72sm1683094f8f.67.2025.04.11.03.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 03:54:18 -0700 (PDT)
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
X-Inumbo-ID: 51f9e349-16c3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744368859; x=1744973659; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jkOKV9f4wIs23OL1gwfLbIIZcMjYz7cTYPK8gN12NE=;
        b=HAxexIbzVJONbPT6WhLGRJZqjcsoEoXWiDR6ucwG1e92JA6vYiJcgqgdrvsGVx3gyv
         ONA3ymr6fUfIaKV6xmZIHwO6RGTu+BK/KZn4cIh1t0XCdVtLigtN2PcXYrUuhPWozATd
         exBuiuhq1OzfahzNVVQARM4Z2cObSlP5f1zFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368859; x=1744973659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jkOKV9f4wIs23OL1gwfLbIIZcMjYz7cTYPK8gN12NE=;
        b=iJZrHJLtkECOYqZvFRBtqlucfDP+MM//ehviayw5VDzH3qW9EhqL40u/VFxKVxUwlM
         SPMnGHOCIXHu9tlOUoyodLtwb9PfdYOdK6owZMpiIK2Gwm63OzQVcxKJ//G1orHVjUCi
         WlOcnpXJYPNYysYk0hbONCxyoBOyjjzF0g0WpdCOYpK94b1fJN8+fsFEk6B07t2iKLFP
         hY/FvrwNVvSYeDBC+4ll/64enJafxFnQEVMMPC/WJiATM1RDhXVs4ltVmJagZRPwBGtP
         bRXTzJaqKvyF50NRZ6yK0vbTNJ5o4uTCBNC83cI0F1QUg3dilqkv9affAIfRgr48kmQx
         SQJA==
X-Gm-Message-State: AOJu0Yz50dfYnrR4XAyDU4EKIIUzmoEQCUBfw6hg9I6elmIEbvn0m4ev
	Mt7bUeQN2kHW7STK/44CpqV0jWC7F9DEkE6gEMwk7zwQSOVE+DlXP3gn05H99YJOZdQUQcBmvC0
	7
X-Gm-Gg: ASbGncv6Z2rcx9SMGzzSqlNrnu9zNqJimtSO/OexE7wiU/tLuSb/huMse/YuUnUaL5D
	+qG0noyzpgeDfqTePP45+VVi13tjY6o8N3Lv0ycQ0mnTl95vi8u13jFjuJ/Sfao3ITRV6OQ0LFe
	qBaZsFVeFuYBAPmbyCBkcsN/G5e54fw8n0uMS8HWZY9FZMaNDs70AAUU6JIx0TLB4pc2xBxhBM/
	SyjxnYK/evd0Krg6tZugA4W4Vdn8sEPU1oM3TrwCQi7z+ucojjRVmV8jHva84OslCtdjh2RnxEJ
	UXcWavqRVBCzqRoHng60Z2oeV6B5RJiZSz5Sw62m05OkCNQMl7cxhpVP
X-Google-Smtp-Source: AGHT+IEalTEBHnBqdw6GEGhLxDVi54GZZQNzRPx8BV3uHkoWl8+oFfZLmR2QsPzNm7+zvZ5QyNA7zw==
X-Received: by 2002:a05:6000:144e:b0:39c:1f11:ead with SMTP id ffacd0b85a97d-39ea5213077mr1863723f8f.26.1744368859090;
        Fri, 11 Apr 2025 03:54:19 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/5] xen/io: provide helpers for multi size MMIO accesses
Date: Fri, 11 Apr 2025 12:54:08 +0200
Message-ID: <20250411105411.22334-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411105411.22334-1-roger.pau@citrix.com>
References: <20250411105411.22334-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Several handlers have the same necessity of reading from an MMIO region
using 1, 2, 4 or 8 bytes accesses.  So far this has been open-coded in the
function itself.  Instead provide a new handler that encapsulates the
accesses.

Since the added helpers are not architecture specific, introduce a new
generic io.h header.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmsi.c | 47 ++----------------------------
 xen/arch/x86/mm.c       | 32 +++++----------------
 xen/drivers/vpci/msix.c | 47 ++----------------------------
 xen/include/xen/io.h    | 63 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+), 113 deletions(-)
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
index 1cf236516789..989e62e7ce6f 100644
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
@@ -5115,7 +5115,6 @@ static void subpage_mmio_write_emulate(
 
     if ( test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
     {
- write_ignored:
         gprintk(XENLOG_WARNING,
                 "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
                 mfn_x(mfn), offset, len);
@@ -5131,26 +5130,7 @@ static void subpage_mmio_write_emulate(
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
-        goto write_ignored;
-    }
+    write_mmio(addr + offset, data, len);
 }
 
 #ifdef CONFIG_HVM
@@ -5185,18 +5165,20 @@ int cf_check mmio_ro_emulated_write(
     struct x86_emulate_ctxt *ctxt)
 {
     struct mmio_ro_emulate_ctxt *mmio_ro_ctxt = ctxt->data;
+    unsigned long data = 0;
 
     /* Only allow naturally-aligned stores at the original %cr2 address. */
     if ( ((bytes | offset) & (bytes - 1)) || !bytes ||
-         offset != mmio_ro_ctxt->cr2 )
+         offset != mmio_ro_ctxt->cr2 || bytes > sizeof(data) )
     {
         gdprintk(XENLOG_WARNING, "bad access (cr2=%lx, addr=%lx, bytes=%u)\n",
                 mmio_ro_ctxt->cr2, offset, bytes);
         return X86EMUL_UNHANDLEABLE;
     }
 
+    memcpy(&data, p_data, bytes);
     subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
-                               p_data, bytes);
+                               data, bytes);
 
     return X86EMUL_OKAY;
 }
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 6bd8c55bb48e..6455f2a03a01 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -17,6 +17,7 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/io.h>
 #include <xen/sched.h>
 #include <xen/vpci.h>
 
@@ -344,28 +345,7 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
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
@@ -493,28 +473,7 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
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
index 000000000000..5c360ce9dee2
--- /dev/null
+++ b/xen/include/xen/io.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic helpers for doing MMIO accesses.
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
+static inline uint64_t read_mmio(const volatile void __iomem *mem,
+                                 unsigned int size)
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
+    case 8:
+        return readq(mem);
+    }
+
+    ASSERT_UNREACHABLE();
+    return ~0UL;
+}
+
+static inline void write_mmio(volatile void __iomem *mem, uint64_t data,
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
+    case 8:
+        writeq(data, mem);
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+}
+
+#endif /* XEN_IO_H */
-- 
2.48.1


