Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B19966B7CB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 08:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478342.741518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYN-0000ea-Lf; Mon, 16 Jan 2023 07:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478342.741518; Mon, 16 Jan 2023 07:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYN-0000Yr-F9; Mon, 16 Jan 2023 07:05:11 +0000
Received: by outflank-mailman (input) for mailman id 478342;
 Mon, 16 Jan 2023 07:05:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85+=5N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pHJYL-00077f-Sj
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 07:05:10 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c6aa1c2-956c-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 08:05:08 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id v13so5336401eda.11
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 23:05:08 -0800 (PST)
Received: from uni.router.wind (adsl-67.109.242.224.tellas.gr.
 [109.242.224.67]) by smtp.googlemail.com with ESMTPSA id
 v15-20020a056402184f00b0046c5baa1f58sm10990824edy.97.2023.01.15.23.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 23:05:07 -0800 (PST)
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
X-Inumbo-ID: 1c6aa1c2-956c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGOhxxftnqS09dviAWeYBv4kGOGjyoGhBUYO7YzYbYs=;
        b=OZ6V5vdKz7FFRoISBZXF7APZzMyRs4Dekxlt/ZX8BMBYrEh9WNRKmjL+QRljNKO3YV
         IaT96mDVLeZW/4wHYy7Qx7XBIiEI4KM+5YpmCWLF12pEMxZnWVjQVH1uj0FO7OIh6KTF
         rj4L8ACmVVW3qs7SvlizAVUqOIdk4UrGpoNy8DpoesdH7WcU4mvpCOYSA4PXXQ9AuI3D
         anOIST4FrAyPAi2WGg1Xk7da7jc4tiYWrEnkQZTE7Grqzju18zj614RSq1/tbe0ymxw2
         gvK3YlSxyoHoozQI1p3PNQIlmvTCswMYIpAdI4PFgWutfntmKHNBgzFcE9f6054bip0A
         IKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGOhxxftnqS09dviAWeYBv4kGOGjyoGhBUYO7YzYbYs=;
        b=47CVnAnDJ0ud8fpXuaJ9XIrnLTOhdta/EU2mJAqg8Wj52m4qjYKId3mny5Kkp+yoIS
         Sq9S6lQ8auooEhOA0f1hIWTeFQLGRI6kN0LSE+lBwm0AgVb4+nwj1D00CpxcE0C4JjU3
         NcTOT71BvwriiRuv2fiPllnshyEhZMjve8KS/iTxrBTwdWCjS6Kb+0ZshmPcPXG+Px0K
         IWYJtNeaT7fydUmQmTgx/7wl9NnZ6JFDVoae6EYyJ7CcvyLYOUZuBknEpEOmjxTMgzv0
         4fgCvK/e2N9FQNOS9Z5Bgx+ghDO20AOBMFBYd1gkhBVW3TDc51NHPvI0kiEWnSfTn+NP
         hRgQ==
X-Gm-Message-State: AFqh2krxDxJdWwi/9eM/hzhU2oyKCZIjFBkLhInfgO3NIzvADJzAHtns
	jhQi34lfh3WozIWZ678NaBOKipKqbUA=
X-Google-Smtp-Source: AMrXdXsvE+JsU2LZw6kyJBg/vfrH3k7HKGQmR4l10D1ovSVMoTnbGcwDyIItl91Muq+VqxxBPZzpmw==
X-Received: by 2002:a05:6402:b02:b0:499:e564:a1c with SMTP id bm2-20020a0564020b0200b00499e5640a1cmr7513207edb.11.1673852707760;
        Sun, 15 Jan 2023 23:05:07 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 7/8] x86/dpci: move hvm_dpci_isairq_eoi() to generic HVM code
Date: Mon, 16 Jan 2023 09:04:30 +0200
Message-Id: <20230116070431.905594-8-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230116070431.905594-1-burzalodowa@gmail.com>
References: <20230116070431.905594-1-burzalodowa@gmail.com>
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

Changes in v3:
  - in _hvm_dpci_isairq_eoi(), make hvm_irq pointer to const
  - in hvm_dpci_isairq_eoi(), make dpci pointer to const, add a blank line
    after ASSERT(isairq < NR_ISAIRQS), add a blank line before write_unlock()
  - fix typo in commit log, s/funcion/function/
  - add Jan's Reviewed-by tag

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


