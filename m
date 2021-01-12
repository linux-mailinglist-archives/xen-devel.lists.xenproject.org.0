Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5DC2F3BEE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66044.117176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRbO-0002lX-L7; Tue, 12 Jan 2021 21:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66044.117176; Tue, 12 Jan 2021 21:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRbO-0002kS-FQ; Tue, 12 Jan 2021 21:53:22 +0000
Received: by outflank-mailman (input) for mailman id 66044;
 Tue, 12 Jan 2021 21:53:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRbM-0002PK-Gv
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:53:20 +0000
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 875b43d8-11f8-49e2-83a6-fe1f17854035;
 Tue, 12 Jan 2021 21:52:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 190so3226428wmz.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:52:59 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.52.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:52:58 -0800 (PST)
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
X-Inumbo-ID: 875b43d8-11f8-49e2-83a6-fe1f17854035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qHt2C5CJrXgXEhS7KQneWBAhFD+/+G5EoA81FF2rr6I=;
        b=d4v/KQZxKstm+f6m9qRY+T/BjkLp1BBK30nv0aO4rwzp2fjtitLkVPD47I70sNP2GT
         vnP/QFDF+90zVN/mGODH7geBT5qtVtXxis0DJ7f9uxu+FKH5LQF1AxL7Qr5IfzUyYC2X
         AmYUqsgHXKqAjQAAfjLKJWWIP6bGyR7TaK2Cv/9IcWhO1sJb2qVmrNBdeB6AC6CzcRzn
         hASzhCHV7W7WNBhsTfFw0RR6Qut+Vstcfz38g+QgSToasJPUbEiPznIWWj9E2DZhh6QM
         dOATPUGDWiRREAQbrxH006NB5s5KlwGf05R9dFVgKS1WCce+dsBgGHB6teZwyQC6X/ns
         i0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qHt2C5CJrXgXEhS7KQneWBAhFD+/+G5EoA81FF2rr6I=;
        b=XDzFHesxV7tDcacqk9zs5NeRj3Vgjh+HSfykAh/H/YralGwRn648lkshiy2mDMVkwG
         DWFfhMCcuHd/+Gy6LffHoic38BG98CI5LLatucgFLjoZZeXxxcBtivQnlJSlk+1DbSxZ
         FwwokAQxEH4ZGsOIgW0a1wfauijKvBq4NzL3OL4/APle6Eo6fObbW+SHSVodtemQePNz
         FQ0mF6QfEfA/EK9EHsfGceW7V0toMJbixzGiAcJShM74q/vaUkD1HAbW9U9grLlIi+xb
         4bIU4hiTCkC4tUFcGI2D+/MmWFo0wpPUTwTqVKm9Cwq9MrUS2x1Ors4BrvQ+cWCQwSZ7
         ZkyA==
X-Gm-Message-State: AOAM531WCtY4ccaZBhjdkXGFx1ww/kK9IAmqcsF34W6FeGbrp4XIA6RR
	ivYv4QlqZ7ri3AfPOO8BkMqLlKalLv2mLw==
X-Google-Smtp-Source: ABdhPJy7rea5BQVC702NHVbtbnq8YMGeb8odK485dVaGhZeAISIFliFcv2hzWVI/av/xLl3CKGaibg==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr1088042wmf.95.1610488378631;
        Tue, 12 Jan 2021 13:52:58 -0800 (PST)
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
Subject: [PATCH V4 06/24] xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
Date: Tue, 12 Jan 2021 23:52:14 +0200
Message-Id: <1610488352-18494-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and these helpers will be used
on Arm as is. Move them to xen/ioreq.h and replace "hvm" prefixes
with "ioreq".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Paul Durrant <paul@xen.org>
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

Changes V32 -> V4:
   - add Jan's A-b
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
index 47e38b6..a196e14 100644
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
index 558426b..fb64294 100644
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
index 750d884..aeea67e 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -21,6 +21,22 @@
 
 #include <xen/sched.h>
 
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


