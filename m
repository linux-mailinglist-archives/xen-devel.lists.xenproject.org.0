Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6E928F710
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7574.19953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6NQ-0005GK-Is; Thu, 15 Oct 2020 16:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7574.19953; Thu, 15 Oct 2020 16:45:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6NQ-0005FT-De; Thu, 15 Oct 2020 16:45:16 +0000
Received: by outflank-mailman (input) for mailman id 7574;
 Thu, 15 Oct 2020 16:45:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6NP-0004yr-5R
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:15 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec0d2ac8-c18c-49dc-a0e7-e58aa7a9280c;
 Thu, 15 Oct 2020 16:44:58 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c21so3880022ljj.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:58 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:44:56 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6NP-0004yr-5R
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:15 +0000
X-Inumbo-ID: ec0d2ac8-c18c-49dc-a0e7-e58aa7a9280c
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ec0d2ac8-c18c-49dc-a0e7-e58aa7a9280c;
	Thu, 15 Oct 2020 16:44:58 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c21so3880022ljj.0
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KgNrI0jjP6nQ+Uo9tT9QhBTyECmVbDeACqoYsGAUBPM=;
        b=ARUsd/BRZI5s/0J26oyNn8wIKcKZFAYkEa6I4wJXTRpkFPlrQQwHcbEUI3Os0zKtVu
         ypzmn9T/WO7Br8v/RvWuYLid8C8xy+Z8sCQGfL6hf8lXdQmEBCTsOG1ebukCwPPDjfqI
         Gc5PEaYtZIXMLGKohs2D0J6/9WEEtgIT5TIK/8zQMlIMJucQxE0HDVzyUj7i78Hx5BaJ
         h4xXR3joTKyku6PHCeWFOtuF06OBTsMwRdOlJZa31schR18SRcGe+y44bxe0xTdeQnlT
         lvZN6qRGSo6i3wDz95REeelfvOVpBnNhAZGqI1o/tk7Wtdwx/EFyNR0laxKxkkC+pOKM
         +v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KgNrI0jjP6nQ+Uo9tT9QhBTyECmVbDeACqoYsGAUBPM=;
        b=BBMVDfEoCQpBODiWq2aOs9PxZ+KwYODtYtPzBQ7ROcJlmXf2+RYozj/FulwIS2La95
         uajuuCYBpuhx/1OBgLhyfYoItEyeRhxPyL49VGi755ooykhQnNtn0zcszMg7UIVouVUJ
         NIN683PPQY09ONjun4X5PBGpH7+1S2ImgMEvp33uEInCzGsNj2VJlBoFPEcTGvgI/v8+
         L0uUaKCkOlRopxQkL4eeQ0kgYHmopG9pOwVRZD0Gnjcks9nidFggyxunXQaNOH7+53Fl
         8s0y3dnv9LFtip9/zg8ydUwiDqyVWHBO8nO5nGj8XTH/O5nm5pyfhHNgQx+wSJLNmvdz
         3BrA==
X-Gm-Message-State: AOAM530NuNbZVJ1Fk/PVc1oWkZxQT5Lt/VdeUm3uX1Jl2Jj1nabZf+Jp
	denRCId9rr2DDEFTB8ficFUkIcdT782ljQ==
X-Google-Smtp-Source: ABdhPJwknzxpiS2ZDmlrF2YihbjX8Gao6YgxxSmqJ8ySUZVR2HPG3uujUIxGTa3tZl6W/rBa9AT94g==
X-Received: by 2002:a2e:9a9a:: with SMTP id p26mr1523137lji.4.1602780297235;
        Thu, 15 Oct 2020 09:44:57 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:44:56 -0700 (PDT)
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
Subject: [PATCH V2 05/23] xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
Date: Thu, 15 Oct 2020 19:44:16 +0300
Message-Id: <1602780274-29141-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The IOREQ is a common feature now and these helpers will be used
on Arm as is. Move them to xen/ioreq.h and replace "hvm" prefixes
with "ioreq".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - replace "hvm" prefix by "ioreq"
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
index 29ad48e..5fa10b6 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -1210,8 +1210,8 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
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
index 8e1603c..768ac94 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -24,6 +24,22 @@
 struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
                                           unsigned int id);
 
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


