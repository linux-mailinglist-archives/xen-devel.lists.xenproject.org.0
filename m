Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ED6A92170
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958058.1351030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R8R-0007sL-HH; Thu, 17 Apr 2025 15:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958058.1351030; Thu, 17 Apr 2025 15:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R8R-0007nl-CO; Thu, 17 Apr 2025 15:26:39 +0000
Received: by outflank-mailman (input) for mailman id 958058;
 Thu, 17 Apr 2025 15:26:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dr0F=XD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u5R8P-0007lK-Uc
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:26:37 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a1f7288-1ba0-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 17:26:37 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-acb415dd8faso139819866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 08:26:37 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acb6ec90950sm8154866b.75.2025.04.17.08.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 08:26:35 -0700 (PDT)
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
X-Inumbo-ID: 5a1f7288-1ba0-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744903596; x=1745508396; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5LzAPNb/14/24HUMEXjvdgVaGJA9HOIEBYT1bvFhrY=;
        b=ZAIA8FZlImkCzYO1jE6LNJOEyKRuFsPRnRyXZOG6r1DMoCHyaVFPqgqNDFANn4WXBH
         DfqXEIx1miVNZccydwV9EV5K4KBxAwvRUdcG5Y6Btl/KqGhG6kV1dW5RqN+nsD2XqsJc
         TZp+cguZHlxXPDS0Q7MKnv6hJvar+SXrxlR5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903596; x=1745508396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5LzAPNb/14/24HUMEXjvdgVaGJA9HOIEBYT1bvFhrY=;
        b=CeYdyUamlIipLvg5StyF4ELzWhmcaRg5oNJ8xuMKZBt8UkH94f53uMj1Sx91zkldUn
         7N5nqIAEArGoQXzR0EmzRpQE4H6udogN7GNcEuZTWE9gWHObjMkKNp9UAdFgwYASr4yA
         fGvgh1lOupUqCe93hxqLylFYxxFpk46l7tP72SeSMBvNTbL5EiSrxZS5RA3JDXyYuhiG
         0336LJRyexrQZnz9/HxmLNS9/q5FJus2VxIT5GFB8We6+AB8uK5ifjgsFsaQJ2XYJIW9
         4sNBtB+P9MkJYyWcwFWabxK0DFPTOIfTGUJIieKSg9GowXcKrgYo+NFHFL2WRMv3NPig
         f7qw==
X-Gm-Message-State: AOJu0YycCJiHxtAnW1risVpnqsttftrPkrz0qClytjq0MMpx+0tOPfEu
	vqtRAO1QFfdD1F9UQzySf+jjNJEH18WOBYgcfYs4kC1VtJcwac8xWqdZLGVcfWZ2TXDTPAI40qw
	W
X-Gm-Gg: ASbGnctl+9u+3y16ZYXWadJf4XeWaVA8rTIdJVtDPa0z95yVbhHYlv748MdV9BQTArv
	GaqU6TWy196v6TIjMtdGt7sSyk2DaR3bWDf7peZzn4NUtUUSYF6e23NKO6OVWibHozzbWBJpGGq
	wLPUNeyjTMKTVtPwUVEYn1/q7ORa15iOfnRbNCQGHAee0WaMCvEBNWcxXRWvT9j9FGi0sFW/1kY
	EBQY1zXEf4JMbr64NoLqnultvsFcJ1L6rFW5ZFJ+bXwxaRutLtwo+vuUJNww8ZAmS75QlJa++g/
	NW3Aiw6QSO9MHGcybG7/bVuGG8pI/Snl1kqN8I26M/Of1ZlOobmxK3B1
X-Google-Smtp-Source: AGHT+IH/ckS332y3R6Pq/rnTozg4syB5mCwJzYY2eabMvw5c9KcnwbGic64Qif9TTbjSQDWj21fOwA==
X-Received: by 2002:a17:906:478f:b0:ac7:b48f:4cd6 with SMTP id a640c23a62f3a-acb4298229amr559808866b.24.1744903596027;
        Thu, 17 Apr 2025 08:26:36 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/4] xen/io: provide helpers for multi size MMIO accesses
Date: Thu, 17 Apr 2025 17:25:11 +0200
Message-ID: <20250417152514.13702-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417152514.13702-1-roger.pau@citrix.com>
References: <20250417152514.13702-1-roger.pau@citrix.com>
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
Changes since v2:
 - Keep error message when handling non-allowed access sizes.

Changes since v1:
 - Limit {read,write}q() to 64bit architectures.
 - Always have a default case in switch statement.
---
 xen/arch/x86/hvm/vmsi.c | 47 ++-------------------------
 xen/arch/x86/mm.c       | 30 +++++-------------
 xen/drivers/vpci/msix.c | 47 ++-------------------------
 xen/include/xen/io.h    | 70 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+), 111 deletions(-)
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
index 1cf236516789..8baac132b484 100644
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
@@ -5185,18 +5167,20 @@ int cf_check mmio_ro_emulated_write(
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


