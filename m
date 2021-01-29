Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0A230835F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77579.140620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Iuk-0004y0-Ah; Fri, 29 Jan 2021 01:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77579.140620; Fri, 29 Jan 2021 01:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Iuk-0004xO-2R; Fri, 29 Jan 2021 01:49:34 +0000
Received: by outflank-mailman (input) for mailman id 77579;
 Fri, 29 Jan 2021 01:49:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5Iui-0004da-Jv
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:49:32 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a50a8c0f-025e-4589-8e3e-82577820982b;
 Fri, 29 Jan 2021 01:49:12 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id r14so8743959ljc.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:12 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:10 -0800 (PST)
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
X-Inumbo-ID: a50a8c0f-025e-4589-8e3e-82577820982b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4xuAT5BoXwLYZKVpDnJ4oCiBPzwMaEaaq9l2TzHM01U=;
        b=YssgsN8JEg7tB9BnA3WAA2KozYG+SFlVIZZhqp/xJ9Zru9Xh33PmKG8hF6dopt/sRt
         mp9mYbpvTBXDGQhk1cDu5jszmXY1ld10KuYMx33GBn374Entw7KQBN2WmXV+m+b77fa6
         Zb96a9beo5u1c9D1+lpBu26wnkFSe4ZbdphMH9Q+xbGEOeLUcRNUYo1sYEQYmVJi8hY8
         qCWEWD6vXrINglygqeaVngymldJDE/Go+SpDaKtmVpbgGYgyyORssjKb5CoOHRbqQkfS
         ZCDsxkmRq72Qgz9hta7rzops+qNDV4ljsqp4G5b1TaZuNDehW9ZLtvbwkAk3Qzp/pCGQ
         vwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4xuAT5BoXwLYZKVpDnJ4oCiBPzwMaEaaq9l2TzHM01U=;
        b=A00s2JUjD8eNH6E/UpXOmzD9pWyUVtRxm0NCKULw1YOSbB7mJe5m24wkrFk9oP5uf2
         W40EfTWgZAaKXtu+nGXvaAx9ED6D9hs5QBvsQFllMskIRDoXMUFGOF936bqAT8wZt6N6
         MRrIG3iWPTYm13fJCS/qTED0q+Z36PRvX+yJs5m7GpPdl0dRms5MazjX3UyeVKZbg7Rw
         YoSP03QYiKb3aJAcym9HGxIN9cF0PZfSofWDU5jYOoQjfGF3IoSHvlxn8N8oLGV5sDof
         oLC4fR1Qxjj1EKnosmuaWQg9+Ga8/MKd6tvjLLEd7sFNoBbi5TJaauoqrww3OHO8CUAk
         O7MQ==
X-Gm-Message-State: AOAM5300jnzahFmQNyjQ9l765svEsHIyRwtDqvMAUak/3pFg5fl6syKK
	9ZY8/waS0MtU7sHs1ywooI+iac1Urq2UZA==
X-Google-Smtp-Source: ABdhPJyZiSygaXMCJRK6GlVWwJv30GUfOrPNK17jx7jQtqN6Jkc4F1vh48J31jBGU1IJqAM9yz8Xyg==
X-Received: by 2002:a2e:5802:: with SMTP id m2mr1176199ljb.145.1611884950983;
        Thu, 28 Jan 2021 17:49:10 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V6 06/24] xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
Date: Fri, 29 Jan 2021 03:48:34 +0200
Message-Id: <1611884932-1851-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
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

Changes V5 -> V6:
   - no changes

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
index 3d2e877..3a4a739 100644
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


