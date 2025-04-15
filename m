Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0E4A8A2D3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 17:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954132.1348471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iIl-0004sg-Rf; Tue, 15 Apr 2025 15:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954132.1348471; Tue, 15 Apr 2025 15:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4iIl-0004q9-OY; Tue, 15 Apr 2025 15:34:19 +0000
Received: by outflank-mailman (input) for mailman id 954132;
 Tue, 15 Apr 2025 15:34:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4iIk-0004bx-A0
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 15:34:18 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17866889-1a0f-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 17:34:17 +0200 (CEST)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-736a7e126c7so4972880b3a.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 08:34:17 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b02a2d3a2b8sm11127529a12.58.2025.04.15.08.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:34:14 -0700 (PDT)
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
X-Inumbo-ID: 17866889-1a0f-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744731255; x=1745336055; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeT5t+7PLGgLUSY6R9I0jYmGVga2OLQ/Zvlwarpqm88=;
        b=tnPUrM9ejR3LnKuwxDBe92fXkZAPkq4Trm4WFYxqn1gjIecVrEBDCpeO4sm5r0dH1P
         0JH/eAyTjHla7AtkmUDvhQekrvGA2XST+i1WOUOYOus/q8Kf2oZodEjlJEy6FTOV7DwH
         zouSJlFoKyJK4urpszslE2XNi06OIJGZcRF4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731255; x=1745336055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeT5t+7PLGgLUSY6R9I0jYmGVga2OLQ/Zvlwarpqm88=;
        b=RSrTb45OSgG8TEtvWP6GB9sgrgV4ZISzX8+RksOcgl3sAHkTyiM68VAdwk5H+qj/2S
         1DFEqMTO2ekWDg41AIp/Ca485GtOpZIHd1dLFparPLL49rJSNuigPr1OsjYhaPhVeiVh
         hw+h2sKvS2FZFUzbyVarpN5TktrFNP/IIMClZsQb6cjIo+4jdeJ+6O7ZWt8iQJGYfCqc
         wd6VIf3LY0Hs2nIcCxgvcNmVYyOdkhQn13GjStrR0lXobgH5FGKQYb/0vt8IVZ8Z/Km3
         lJNQyvm7sXHH1id/63nDEKoKoc+HS+utQ1e4VXRdvNNLf5okasvJaImBqV3kWLgvrfkk
         87ug==
X-Gm-Message-State: AOJu0YxWlkebzB/QYKjLAVv3uckRcUmdZr7zQMzwGmA2nwPkbncOihOO
	5FI61YVYfkmxhhQ3i0tIhNj2GkClQtkp5CeKfVphI7tqpI2wkwBMHAg3wi3iJEeHm0HIbvqr2KR
	7
X-Gm-Gg: ASbGncsQh+wLqXfXB/t2BHeVPYLUxwlkkT75UBfko+p20BnBGUr/faHm0RnevGxYTv5
	inXFAhHLmSmBw7PVs8ILPfpQcvTqC9am0N3hKgKIeT/mhAeIAWB0AtDYHeQucuWz9JF9ScG6h3k
	g9CZwtlVIb/J2ZEWXUkzMeESyNVFjwkQb9y4axaMdRh66orDUOFvMRgwyYMv1lZ6nN19PYSs2EO
	tTEOIBirGz8xMKwObT9Yj2gxX5lfG9E1QH3+M5JlNoC0OFGz2N2zuUJ3FnnOWcrWbuFrGEjs5tW
	U997r/8w9jsFLX29mYn4GJWfuI6/jzYKGAwlZona3LUV/Q==
X-Google-Smtp-Source: AGHT+IFi+8H6UVpnUZrRJSN4ByTR3JG4By1EKozq/qxPY0SaQWQcDguT8MKM+uJa2BQR3YhWpSynaw==
X-Received: by 2002:a05:6a21:1346:b0:1f5:63f9:9ea1 with SMTP id adf61e73a8af0-201797a2f99mr26786130637.13.1744731254961;
        Tue, 15 Apr 2025 08:34:14 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/4] xen/io: provide helpers for multi size MMIO accesses
Date: Tue, 15 Apr 2025 17:32:43 +0200
Message-ID: <20250415153246.81688-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415153246.81688-1-roger.pau@citrix.com>
References: <20250415153246.81688-1-roger.pau@citrix.com>
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
Changes since v1:
 - Limit {read,write}q() to 64bit architectures.
 - Always have a default case in switch statement.
---
 xen/arch/x86/hvm/vmsi.c | 47 ++--------------------------
 xen/arch/x86/mm.c       | 32 +++++--------------
 xen/drivers/vpci/msix.c | 47 ++--------------------------
 xen/include/xen/io.h    | 68 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 81 insertions(+), 113 deletions(-)
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
index 000000000000..4495a04c403e
--- /dev/null
+++ b/xen/include/xen/io.h
@@ -0,0 +1,68 @@
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
+static inline void write_mmio(volatile void __iomem *mem, unsigned long data,
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
+        break;
+    }
+}
+
+#endif /* XEN_IO_H */
-- 
2.48.1


