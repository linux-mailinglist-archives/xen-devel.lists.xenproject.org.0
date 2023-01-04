Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6801565CE92
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 09:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470989.730728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOg-0001m1-RT; Wed, 04 Jan 2023 08:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470989.730728; Wed, 04 Jan 2023 08:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOg-0001fz-Jc; Wed, 04 Jan 2023 08:45:18 +0000
Received: by outflank-mailman (input) for mailman id 470989;
 Wed, 04 Jan 2023 08:45:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfqB=5B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pCzOe-0008Pe-KN
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 08:45:16 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c29c3f9-8c0c-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 09:45:15 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id kw15so80791873ejc.10
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 00:45:15 -0800 (PST)
Received: from uni.router.wind (adsl-57.109.242.233.tellas.gr.
 [109.242.233.57]) by smtp.googlemail.com with ESMTPSA id
 k22-20020a170906129600b007c10fe64c5dsm15016382ejb.86.2023.01.04.00.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 00:45:14 -0800 (PST)
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
X-Inumbo-ID: 1c29c3f9-8c0c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqo5/tDlicPu5mCxcbh6Z6IjcPc3BV3fslYWB3OSArs=;
        b=LePRpHzDhHQjRWbDbuAHMYF8Ya6h/Nu3+/MhJyIyz06QAqOF1EVetuhx8mCgZMC887
         kH7P9lgSIwn4eWBO93tmf01OzBKP4dDKVIzeOr/DpfVmuLWgRGIvYMUtgTa7YisgLZgP
         hn4oemUODuBnAQ5fxvN+mIWNSILJQwDbX1t+FNyMouEeOdIpJlDG/9kQdAlAsx80UlJL
         jTl1vRnFgs+K9AUDdy5LxW2dtzxuLLDtfPFyv45+htKGvvluZ6coAPK+sH8X0xLuVXjg
         UdP7pHR2LaOY4Om4f1/aSV5nvuxO0okrXOk2pJ/uSDKf7tvvuqVZZc3JdHrSVpAS7xzL
         yl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqo5/tDlicPu5mCxcbh6Z6IjcPc3BV3fslYWB3OSArs=;
        b=3RCtZm2Kzdh1cL0CLDS7L1jN/eOCXAthuVTJlyTy8YpW94x+Lv/8IhDYau+gKUpocY
         55oTEfZMEcTYPRFx8aIqs5uZXWTN387uWzzBqQAyoJHAS3kk73L26WwIgdRnFwyXjBDS
         WQ2ndI9cOlM+isgbM7/GODZzKnd7Coiufs/emP8KyvNZG6YTI5FOYavD23X8ZCp7m/Bf
         WxUU6hixUDLhcKx0z2xB7cBrCZCqtXjzyuuj87LVZPovlAdZsCU8NUDaN+bqCP4pQkqY
         VBJYl4Nv5vWBVDp442llz3ZWej40bvJK3NG+QAfCUxRi0TrEHI5Up8uO8JJHKph4Mij3
         cJFA==
X-Gm-Message-State: AFqh2kqCh9TZv7AtNxZ8VZf5kWsFO883dmNqY96J8zpgvDz72Sb1G/IO
	87pQ5//ssTfCd6fGx5mB5bgLX3BXKzc=
X-Google-Smtp-Source: AMrXdXs5y3cNVYlCIU2x42F91fpieCpDGRWVHMwTv5YUoJffv5zEYYp91gCsYfg7Tg8x1q5qUj4dZw==
X-Received: by 2002:a17:907:cb85:b0:7c0:f216:cc14 with SMTP id un5-20020a170907cb8500b007c0f216cc14mr40673315ejc.11.1672821915341;
        Wed, 04 Jan 2023 00:45:15 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 7/8] x86/dpci: move hvm_dpci_isairq_eoi() to generic HVM code
Date: Wed,  4 Jan 2023 10:45:01 +0200
Message-Id: <20230104084502.61734-8-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104084502.61734-1-burzalodowa@gmail.com>
References: <20230104084502.61734-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function hvm_dpci_isairq_eoi() has no dependencies on VT-d driver code
and can be moved from xen/drivers/passthrough/vtd/x86/hvm.c to
xen/drivers/passthrough/x86/hvm.c, along with the corresponding copyrights.

Remove the now empty xen/drivers/passthrough/vtd/x86/hvm.c.

Since the funcion is used only in this file, declare it static.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - update the copyright
  - declare hvm_dpci_isairq_eoi() static

 xen/drivers/passthrough/vtd/x86/Makefile |  1 -
 xen/drivers/passthrough/vtd/x86/hvm.c    | 64 ------------------------
 xen/drivers/passthrough/x86/hvm.c        | 43 ++++++++++++++++
 xen/include/xen/iommu.h                  |  1 -
 4 files changed, 43 insertions(+), 66 deletions(-)
 delete mode 100644 xen/drivers/passthrough/vtd/x86/hvm.c

diff --git a/xen/drivers/passthrough/vtd/x86/Makefile b/xen/drivers/passthrough/vtd/x86/Makefile
index 4ef00a4c5b..fe20a0b019 100644
--- a/xen/drivers/passthrough/vtd/x86/Makefile
+++ b/xen/drivers/passthrough/vtd/x86/Makefile
@@ -1,3 +1,2 @@
 obj-y += ats.o
-obj-$(CONFIG_HVM) += hvm.o
 obj-y += vtd.o
diff --git a/xen/drivers/passthrough/vtd/x86/hvm.c b/xen/drivers/passthrough/vtd/x86/hvm.c
deleted file mode 100644
index bc776cf7da..0000000000
--- a/xen/drivers/passthrough/vtd/x86/hvm.c
+++ /dev/null
@@ -1,64 +0,0 @@
-/*
- * Copyright (c) 2008, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- *
- * Copyright (C) Allen Kay <allen.m.kay@intel.com>
- * Copyright (C) Weidong Han <weidong.han@intel.com>
- */
-
-#include <xen/iommu.h>
-#include <xen/irq.h>
-#include <xen/sched.h>
-
-static int cf_check _hvm_dpci_isairq_eoi(
-    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
-{
-    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
-    unsigned int isairq = (long)arg;
-    const struct dev_intx_gsi_link *digl;
-
-    list_for_each_entry ( digl, &pirq_dpci->digl_list, list )
-    {
-        unsigned int link = hvm_pci_intx_link(digl->device, digl->intx);
-
-        if ( hvm_irq->pci_link.route[link] == isairq )
-        {
-            hvm_pci_intx_deassert(d, digl->device, digl->intx);
-            if ( --pirq_dpci->pending == 0 )
-                pirq_guest_eoi(dpci_pirq(pirq_dpci));
-        }
-    }
-
-    return 0;
-}
-
-void hvm_dpci_isairq_eoi(struct domain *d, unsigned int isairq)
-{
-    struct hvm_irq_dpci *dpci = NULL;
-
-    ASSERT(isairq < NR_ISAIRQS);
-    if ( !is_iommu_enabled(d) )
-        return;
-
-    write_lock(&d->event_lock);
-
-    dpci = domain_get_irq_dpci(d);
-
-    if ( dpci && test_bit(isairq, dpci->isairq_map) )
-    {
-        /* Multiple mirq may be mapped to one isa irq */
-        pt_pirq_iterate(d, _hvm_dpci_isairq_eoi, (void *)(long)isairq);
-    }
-    write_unlock(&d->event_lock);
-}
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index e720461a14..5043ecab9c 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -14,6 +14,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  *
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
+ * Copyright (C) Weidong Han <weidong.han@intel.com>
  * Copyright (C) Xiaohui Xin <xiaohui.xin@intel.com>
  */
 
@@ -924,6 +925,48 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
     hvm_pirq_eoi(pirq);
 }
 
+static int cf_check _hvm_dpci_isairq_eoi(
+    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
+{
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+    unsigned int isairq = (long)arg;
+    const struct dev_intx_gsi_link *digl;
+
+    list_for_each_entry ( digl, &pirq_dpci->digl_list, list )
+    {
+        unsigned int link = hvm_pci_intx_link(digl->device, digl->intx);
+
+        if ( hvm_irq->pci_link.route[link] == isairq )
+        {
+            hvm_pci_intx_deassert(d, digl->device, digl->intx);
+            if ( --pirq_dpci->pending == 0 )
+                pirq_guest_eoi(dpci_pirq(pirq_dpci));
+        }
+    }
+
+    return 0;
+}
+
+static void hvm_dpci_isairq_eoi(struct domain *d, unsigned int isairq)
+{
+    struct hvm_irq_dpci *dpci = NULL;
+
+    ASSERT(isairq < NR_ISAIRQS);
+    if ( !is_iommu_enabled(d) )
+        return;
+
+    write_lock(&d->event_lock);
+
+    dpci = domain_get_irq_dpci(d);
+
+    if ( dpci && test_bit(isairq, dpci->isairq_map) )
+    {
+        /* Multiple mirq may be mapped to one isa irq */
+        pt_pirq_iterate(d, _hvm_dpci_isairq_eoi, (void *)(long)isairq);
+    }
+    write_unlock(&d->event_lock);
+}
+
 void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi)
 {
     const struct hvm_irq_dpci *hvm_irq_dpci;
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index aa924541d5..f08bc2a4a5 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -200,7 +200,6 @@ int hvm_do_IRQ_dpci(struct domain *, struct pirq *);
 int pt_irq_create_bind(struct domain *, const struct xen_domctl_bind_pt_irq *);
 int pt_irq_destroy_bind(struct domain *, const struct xen_domctl_bind_pt_irq *);
 
-void hvm_dpci_isairq_eoi(struct domain *d, unsigned int isairq);
 struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *);
 void free_hvm_irq_dpci(struct hvm_irq_dpci *dpci);
 
-- 
2.37.2


