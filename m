Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F3D2C823B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:32:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40810.73805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTr-0000qg-AK; Mon, 30 Nov 2020 10:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40810.73805; Mon, 30 Nov 2020 10:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTr-0000pu-3q; Mon, 30 Nov 2020 10:32:27 +0000
Received: by outflank-mailman (input) for mailman id 40810;
 Mon, 30 Nov 2020 10:32:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgTp-0000Uu-CO
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:32:25 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3f1b784-1180-4b2c-bb88-f2f13bb2d93f;
 Mon, 30 Nov 2020 10:32:05 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id j10so17065418lja.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:05 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:03 -0800 (PST)
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
X-Inumbo-ID: f3f1b784-1180-4b2c-bb88-f2f13bb2d93f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BMgHi30kkpPIOBuivFYxLOwMmC5wtjLvN0gOaeT0A2k=;
        b=UUg5dCSoinN5YJ15ePPYLqNzyVdSWglcKASLNn74daGGVtFK3RMfdzdFbiJt/NyfDu
         PHsdv1ou5dsi5CplxXvgnzTziyzyldowCEOlOYoK84Z385ls8jRqhWyPsWJRAjjD01Dp
         K6mFVo3794BGC8F2ldWClGDS42pvVDNElVV+jn+tPvoxv8ddckP1cJg50liFgeNFitxW
         EK6IlcCDECZYBAahrbAz7EHAOPCPlm6PfLS2B8RRZzcrjzLXg8L4bFmVt+oP0yVtdCAO
         EmIlMwCIKXA9H4Y++XXpV9G2j7ZuPHiJKY1sCZn3K9CWzQ4bWk6nYBRTuHdOOusb+v/M
         nDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BMgHi30kkpPIOBuivFYxLOwMmC5wtjLvN0gOaeT0A2k=;
        b=Jc0hwZEhePLzP3lT6Dr6XcpWhfeQ/jBAHX3UF7pgmepsgDo6Mz3CNDvBgz+rMdUi6p
         Sxk5z8OdX0/C582G0p4yjNbEevokORXb/cTqepriEcy64fg71lwqYM7EiNw4uAMGrfil
         9OJQYjccuy+EWH3NwEWEPRjMde/imJPB4xf+rSemz4oeMP2ym1QviAQjs6FrbzDZxIB0
         RrGrwicaHq8kRPMEes7usHtENKk6bCzcQHzGxixdjghLp8g0QRCvBA5YwC9mxMsSCduc
         OMqunpIsYy0MM2lDBSe12NkfAhb30WTuNgJffZXuSap6bpSRCbDGK064ES3IU4gFiCbX
         Qmdg==
X-Gm-Message-State: AOAM530uoxSeJXdfI48x93CR/7GwqRQVcZ+u1VWmvzUFenmD3wvnIT8k
	t9XnDJnnHn62kSKRBet71wWj+XKay/xaHw==
X-Google-Smtp-Source: ABdhPJykjxP4/PJoWDRQ7qfNn7lsdrTkU5Cf96Dhxh76xp7TDH9yYoSuS+as+u7kdkrtXDH4d9oLLA==
X-Received: by 2002:a2e:924f:: with SMTP id v15mr9106399ljg.6.1606732323860;
        Mon, 30 Nov 2020 02:32:03 -0800 (PST)
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
Subject: [PATCH V3 06/23] xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
Date: Mon, 30 Nov 2020 12:31:21 +0200
Message-Id: <1606732298-22107-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and these helpers will be used
on Arm as is. Move them to xen/ioreq.h and replace "hvm" prefixes
with "ioreq".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Paul Durrant <paul@xen.org>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - replace "hvm" prefix by "ioreq"

Changes V2 -> V3:
   - add Paul's R-b
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
index e267513..e184664 100644
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
index 44385ef..6e9f745 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -1075,8 +1075,8 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
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
index 3cc333d..2746bb1 100644
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


