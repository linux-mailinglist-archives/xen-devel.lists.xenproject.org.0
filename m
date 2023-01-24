Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FF9679839
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 13:42:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483551.749795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIch-0000yS-Rk; Tue, 24 Jan 2023 12:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483551.749795; Tue, 24 Jan 2023 12:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIch-0000wI-Op; Tue, 24 Jan 2023 12:41:59 +0000
Received: by outflank-mailman (input) for mailman id 483551;
 Tue, 24 Jan 2023 12:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jOcK=5V=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pKIcf-0008J9-Po
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 12:41:57 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ce0a908-9be4-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 13:41:56 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id ud5so38686018ejc.4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 04:41:56 -0800 (PST)
Received: from uni.router.wind (adsl-208.109.242.227.tellas.gr.
 [109.242.227.208]) by smtp.googlemail.com with ESMTPSA id
 bj10-20020a170906b04a00b0086b0d53cde2sm825419ejb.201.2023.01.24.04.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:41:56 -0800 (PST)
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
X-Inumbo-ID: 7ce0a908-9be4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EgviqXdsqUwriDOWVGOdIK/T7/metkpbG7A4cQJ2uM=;
        b=dwsOZAS5rGzi1Ofj87fXv0WD7WUuIB75h0TEF5Ruc/RaQMx/79fNgMlZvoNKa0k5Nc
         DHjFz6sXcnNXrLLhcy43dlptrgkzZ64vEWGaj40GCxbEqL/wAFeLixT7Pcum+xzNmE/b
         V4u6CebPD8EqbGQK8j3NXWKjDLm2tyOWqwMxF1SD1KbQ7IUFUIzaeCwoReSAgHXT8kaY
         kiw1Fdrjp20reAcib9nqPY9VMYq+/H+/u0wuZsUWJ6JN3+EWnm+nKgeUSU5Yx0F3Qdzb
         JgFEo4N10r8eu18p5XEfuMJ9qiJ98h1/smycwYb+kbN1t16I3hKcZqX0qKpTXHItdpAC
         O9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EgviqXdsqUwriDOWVGOdIK/T7/metkpbG7A4cQJ2uM=;
        b=aukeWaVH0LuuLimBHY2ZN4/eMi39pEw9mSIGJEwSxzwIStz4XqsI6uDZ29j/b0OZux
         UTKTOeIAy22hvhigiV7A/wv7XX+Tbh8MD7+PqhoE3emErQKnxxgD1vC0ZtlwPCBe2p4p
         RGxleo2iIqwjV3TyNrJXwX+P72nGAJxWLi0c/fo0qdd5fVVtCe/cSJGoP9KGQv+ZNll/
         yRThwJMa2czpIr0Wzyun1W1AllEyERnTqhZFU2AlHq7yFAk0442S3a+wXcewq12Lnjs6
         7S8GNl1cRFbDBLWyXxez90bTZjKZMNWBJ6T1xplCIBXxL5aQtaf4uxey7L+c0pHmZ+B2
         3G/A==
X-Gm-Message-State: AFqh2kqDWhxDgzdLEH5h28wjCAVkVW7drFH6VGSowjZDj+h27ZJjxiuY
	jX1Qt2NJ1A9STR1IOt8be0Q3q9XTLwM=
X-Google-Smtp-Source: AMrXdXuu898LxZLuSz2oDd0XfXT03BihJWbG9k2uXtx2TqQAtr+MEkO3mu7cDr2DGovejAcxS3YntA==
X-Received: by 2002:a17:906:4b4c:b0:871:e336:cd2a with SMTP id j12-20020a1709064b4c00b00871e336cd2amr28087550ejv.47.1674564116369;
        Tue, 24 Jan 2023 04:41:56 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 4/5] x86/dpci: move hvm_dpci_isairq_eoi() to generic HVM code
Date: Tue, 24 Jan 2023 14:41:41 +0200
Message-Id: <20230124124142.38500-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230124124142.38500-1-burzalodowa@gmail.com>
References: <20230124124142.38500-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function hvm_dpci_isairq_eoi() has no dependencies on VT-d driver code
and can be moved from xen/drivers/passthrough/vtd/x86/hvm.c to
xen/drivers/passthrough/x86/hvm.c, along with the corresponding copyrights.

Remove the now empty xen/drivers/passthrough/vtd/x86/hvm.c.

Since the function is used only in this file, declare it static.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

No changes in v4

 xen/drivers/passthrough/vtd/x86/Makefile |  1 -
 xen/drivers/passthrough/vtd/x86/hvm.c    | 64 ------------------------
 xen/drivers/passthrough/x86/hvm.c        | 45 +++++++++++++++++
 xen/include/xen/iommu.h                  |  1 -
 4 files changed, 45 insertions(+), 66 deletions(-)
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
index e720461a14..6bbd04bf3d 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -14,6 +14,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  *
  * Copyright (C) Allen Kay <allen.m.kay@intel.com>
+ * Copyright (C) Weidong Han <weidong.han@intel.com>
  * Copyright (C) Xiaohui Xin <xiaohui.xin@intel.com>
  */
 
@@ -924,6 +925,50 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
     hvm_pirq_eoi(pirq);
 }
 
+static int cf_check _hvm_dpci_isairq_eoi(
+    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
+{
+    const struct hvm_irq *hvm_irq = hvm_domain_irq(d);
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
+    const struct hvm_irq_dpci *dpci = NULL;
+
+    ASSERT(isairq < NR_ISAIRQS);
+
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
+
+    write_unlock(&d->event_lock);
+}
+
 void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi)
 {
     const struct hvm_irq_dpci *hvm_irq_dpci;
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 626731941b..405db59971 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -201,7 +201,6 @@ int hvm_do_IRQ_dpci(struct domain *, struct pirq *);
 int pt_irq_create_bind(struct domain *, const struct xen_domctl_bind_pt_irq *);
 int pt_irq_destroy_bind(struct domain *, const struct xen_domctl_bind_pt_irq *);
 
-void hvm_dpci_isairq_eoi(struct domain *d, unsigned int isairq);
 struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *);
 void free_hvm_irq_dpci(struct hvm_irq_dpci *dpci);
 
-- 
2.37.2


