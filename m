Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE07F302B26
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74301.133565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47Eo-0000Jk-GS; Mon, 25 Jan 2021 19:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74301.133565; Mon, 25 Jan 2021 19:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47Eo-0000Iy-Bm; Mon, 25 Jan 2021 19:09:22 +0000
Received: by outflank-mailman (input) for mailman id 74301;
 Mon, 25 Jan 2021 19:09:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47Em-0008N7-GT
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:09:20 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b347190a-9f79-4f28-9d72-0066c8359a55;
 Mon, 25 Jan 2021 19:08:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l12so14101918wry.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:08:59 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.08.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:08:58 -0800 (PST)
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
X-Inumbo-ID: b347190a-9f79-4f28-9d72-0066c8359a55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BoY0i+xc8eGVnOTYuk/xVaKxY5o/2NyqxPbuZ81MBYw=;
        b=s1nla7VbneAaYxYlqA3tdXVAWfBiEpsHuGdiKzAwNTq5bna17/7bD2ZtSNUcdRy8yr
         NbE0SQVcbT4WUe6jxii3Vs8PKrQ5FzpvTFprqw1jzZSkwD27FfVXe+UmoNTkA1AD3SPl
         PvAqFfHqC/Ru0uw+vSkZv4TAi8NpAXNxFXmJNReGMFrUPjtNDi5G0F8mSPCT9LAdQpcb
         mJHANrNo6/xZcKzxZEFG265rbB7EtC0EMCzd1rwKeBfEOVDh9h1s3s66Hi92M7k+q4d/
         HRt5UmUunhmJ7QLj/j0tC268oh50D22Gbrw5nir80ieqKBg9tj8K6+cKr5XE6wA7OyED
         D4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BoY0i+xc8eGVnOTYuk/xVaKxY5o/2NyqxPbuZ81MBYw=;
        b=W/NSNuIdj7KtOC8T1ntvh8CP0pj5ZHgZoGXbu3QRVhy3NWXZUPk9ylw0Y4BjsxPYOi
         tb2N6uzygTOgsdjlUMfbYGq8pkI8R/4dmQh07EMbHXtWcsH1Nb0P2nkl4P2SZpHDiZRi
         uukgrpq2msRma/5BAZ+Nfe6zib9/edY23YhLCdrJN/xLh3z5Qy9c5GFA+O6/vTmdPU9I
         7KOd2tfw/CphO2BHm9jekktzc38iR66udytY7SkIenwTI2NjclAAanmtxLm84J+eFmM4
         NazyVAKVO2T8jbMLw4CaFv/kShCVCDsr/ezzIjp7JtlXnfJ+BzmN8oXZ1LZh1y8LXDhg
         /F/A==
X-Gm-Message-State: AOAM530SaKKncY+BQaeLxBNAJbMA9v39DmqdwNRbMAkv6B2zhCygG1i2
	V+IM38HhtruqGzgbh/6YF0c886KVDH0fpg==
X-Google-Smtp-Source: ABdhPJyiSLRJ6NSIB7W89yFmbKIMy676yPxZocuTupN4lW46MeIWve2sPqz817trNF65a6GbuwuNpg==
X-Received: by 2002:a5d:452f:: with SMTP id j15mr2598185wra.298.1611601738986;
        Mon, 25 Jan 2021 11:08:58 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V5 06/22] xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
Date: Mon, 25 Jan 2021 21:08:13 +0200
Message-Id: <1611601709-28361-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and these helpers will be used
on Arm as is. Move them to xen/ioreq.h and replace "hvm" prefixes
with "ioreq".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - replace "hvm" prefix by "ioreq"

Changes V2 -> V3:
   - add Paul's R-b

Changes V3 -> V4:
   - add Jan's A-b

Changes V4 -> V5:
   - rebase
   - add Julien's and Alex's R-b
---
---
 xen/arch/x86/hvm/intercept.c |  5 +++--
 xen/arch/x86/hvm/stdvga.c    |  4 ++--
 xen/common/ioreq.c           |  4 ++--
 xen/include/asm-x86/hvm/io.h | 16 ----------------
 xen/include/xen/ioreq.h      | 16 ++++++++++++++++
 5 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/hvm/intercept.c b/xen/arch/x86/hvm/intercept.c
index cd4c4c1..02ca3b0 100644
--- a/xen/arch/x86/hvm/intercept.c
+++ b/xen/arch/x86/hvm/intercept.c
@@ -17,6 +17,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/ioreq.h>
 #include <xen/types.h>
 #include <xen/sched.h>
 #include <asm/regs.h>
@@ -34,7 +35,7 @@
 static bool_t hvm_mmio_accept(const struct hvm_io_handler *handler,
                               const ioreq_t *p)
 {
-    paddr_t first = hvm_mmio_first_byte(p), last;
+    paddr_t first = ioreq_mmio_first_byte(p), last;
 
     BUG_ON(handler->type != IOREQ_TYPE_COPY);
 
@@ -42,7 +43,7 @@ static bool_t hvm_mmio_accept(const struct hvm_io_handler *handler,
         return 0;
 
     /* Make sure the handler will accept the whole access. */
-    last = hvm_mmio_last_byte(p);
+    last = ioreq_mmio_last_byte(p);
     if ( last != first &&
          !handler->mmio.ops->check(current, last) )
         domain_crash(current->domain);
diff --git a/xen/arch/x86/hvm/stdvga.c b/xen/arch/x86/hvm/stdvga.c
index fd7cadb..17dee74 100644
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -524,8 +524,8 @@ static bool_t stdvga_mem_accept(const struct hvm_io_handler *handler,
      * deadlock when hvm_mmio_internal() is called from
      * hvm_copy_to/from_guest_phys() in hvm_process_io_intercept().
      */
-    if ( (hvm_mmio_first_byte(p) < VGA_MEM_BASE) ||
-         (hvm_mmio_last_byte(p) >= (VGA_MEM_BASE + VGA_MEM_SIZE)) )
+    if ( (ioreq_mmio_first_byte(p) < VGA_MEM_BASE) ||
+         (ioreq_mmio_last_byte(p) >= (VGA_MEM_BASE + VGA_MEM_SIZE)) )
         return 0;
 
     spin_lock(&s->lock);
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 61ddd54..89e75ff 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -1078,8 +1078,8 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
             break;
 
         case XEN_DMOP_IO_RANGE_MEMORY:
-            start = hvm_mmio_first_byte(p);
-            end = hvm_mmio_last_byte(p);
+            start = ioreq_mmio_first_byte(p);
+            end = ioreq_mmio_last_byte(p);
 
             if ( rangeset_contains_range(r, start, end) )
                 return s;
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 9453b9b..6bc80db 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -40,22 +40,6 @@ struct hvm_mmio_ops {
     hvm_mmio_write_t write;
 };
 
-static inline paddr_t hvm_mmio_first_byte(const ioreq_t *p)
-{
-    return unlikely(p->df) ?
-           p->addr - (p->count - 1ul) * p->size :
-           p->addr;
-}
-
-static inline paddr_t hvm_mmio_last_byte(const ioreq_t *p)
-{
-    unsigned long size = p->size;
-
-    return unlikely(p->df) ?
-           p->addr + size - 1:
-           p->addr + (p->count * size) - 1;
-}
-
 typedef int (*portio_action_t)(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val);
 
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index e957b52..6853aa3 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -23,6 +23,22 @@
 
 #include <public/hvm/dm_op.h>
 
+static inline paddr_t ioreq_mmio_first_byte(const ioreq_t *p)
+{
+    return unlikely(p->df) ?
+           p->addr - (p->count - 1ul) * p->size :
+           p->addr;
+}
+
+static inline paddr_t ioreq_mmio_last_byte(const ioreq_t *p)
+{
+    unsigned long size = p->size;
+
+    return unlikely(p->df) ?
+           p->addr + size - 1:
+           p->addr + (p->count * size) - 1;
+}
+
 static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
 {
     return ioreq->state == STATE_IOREQ_READY &&
-- 
2.7.4


