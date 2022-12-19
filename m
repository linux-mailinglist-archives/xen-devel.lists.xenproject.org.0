Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB1565079D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 07:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465762.724616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kL-00054x-96; Mon, 19 Dec 2022 06:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465762.724616; Mon, 19 Dec 2022 06:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kL-0004zU-3R; Mon, 19 Dec 2022 06:35:33 +0000
Received: by outflank-mailman (input) for mailman id 465762;
 Mon, 19 Dec 2022 06:35:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4Hg=4R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p79kJ-000383-EC
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 06:35:31 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 550595ca-7f67-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 07:35:30 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id kw15so19071425ejc.10
 for <xen-devel@lists.xenproject.org>; Sun, 18 Dec 2022 22:35:30 -0800 (PST)
Received: from uni.router.wind (adsl-211.109.242.226.tellas.gr.
 [109.242.226.211]) by smtp.googlemail.com with ESMTPSA id
 q14-20020a17090676ce00b008302732f569sm77062ejn.78.2022.12.18.22.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 22:35:29 -0800 (PST)
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
X-Inumbo-ID: 550595ca-7f67-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKxCBs5CR8gwNTFWB5aXerKwnJpGPquUnlinCcVM5FA=;
        b=Uo5w3wXObfuiN5tRzjP0JoRHi1FVdKzGEU7MsGY9as6vCBHEfqCY2R1y9abHaueSvI
         VTOdGg3K+AEjmyfAaekLlNaAcIBWzm5oBVCUcurGYbIBvpYjq+anjr8whlA6v52YLPQ1
         goVSFwW6NaRwWIEtK8/jowcF6R6o1q+AuVpESXgAm3cDlhudbRqYSOSYztdTvY8KDvvp
         RasP3krz/BJ9oWu+JMN0DHK/E86j+VH6Kd+opgX4esWcVDSLZyUW1zSHAKf/W/0ut64N
         xjKDmRo1rMISxNY6AL0xOgHcrIR7JwBKCsavOCjBjxNoUO5VR1Ul16VXikEjcFsO74XS
         QU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKxCBs5CR8gwNTFWB5aXerKwnJpGPquUnlinCcVM5FA=;
        b=etkoqA9shtpYKdWQGcc3tD6ZTnEy+FmTPIsHHcKJFQZXiSH2vCrDJr54W7XxpWR+G4
         btXTS/k3jkELajxrEauCQeYKGwbqU4A+LgjcZAUigQpzT10eD6abWBUbIkw3U1MKEbUH
         3rpwgHLhnUnoQ2mfJEFE+aEphDFqlF3OBdvh+cH4xN2skgPnH3tY38G4lCIljl6Ivit8
         MajBTAbCpBtW5YBjdLS7W+cac4krDymfYDfL1dsIbyVcnHNc5WMlfDTNxiYeEwWA0Obs
         7qM6C4OPT9qAAj2Prka+VjzmcxuCJkaaLdfFd6mcRQLhW3fOFeaMT9UaTvCVNV2bPZ7x
         BBAg==
X-Gm-Message-State: ANoB5plbJvkkj7BUCoXLg47a8x8p8JDCuNoyWy9rOh8u02ii8wn5BUf/
	CjDhuiluUTmnTpv0YLvS+156/F/grVs=
X-Google-Smtp-Source: AA0mqf6Gummy9mqukj5QeKi01nMnG1vJjThOo+agSusjb1/LeCt1yFFbaPAnNRG23PSksLfeaoPITg==
X-Received: by 2002:a17:906:2a0e:b0:7be:9340:b3e6 with SMTP id j14-20020a1709062a0e00b007be9340b3e6mr50460978eje.43.1671431729850;
        Sun, 18 Dec 2022 22:35:29 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [RFC 7/7] x86/dpci: move hvm_dpci_isairq_eoi() to generic HVM code
Date: Mon, 19 Dec 2022 08:34:56 +0200
Message-Id: <20221219063456.2017996-8-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221219063456.2017996-1-burzalodowa@gmail.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function hvm_dpci_isairq_eoi() has no dependencies on VT-d driver code
and can be moved from xen/drivers/passthrough/vtd/x86/hvm.c to
xen/drivers/passthrough/x86/hvm.c.

Remove the now empty xen/drivers/passthrough/vtd/x86/hvm.c.

Since the funcion is hvm specific, move its declaration from xen/iommu.h
to asm/hvm/io.h.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

I was not sure how to handle the copyright. I assume that I have to
retain the copyright of Weidong Han <weidong.han@intel.com>, right?

 xen/arch/x86/include/asm/hvm/io.h        |  1 +
 xen/drivers/passthrough/vtd/x86/Makefile |  1 -
 xen/drivers/passthrough/vtd/x86/hvm.c    | 64 ------------------------
 xen/drivers/passthrough/x86/hvm.c        | 42 ++++++++++++++++
 xen/include/xen/iommu.h                  |  1 -
 5 files changed, 43 insertions(+), 66 deletions(-)
 delete mode 100644 xen/drivers/passthrough/vtd/x86/hvm.c

diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index 54e0161b49..5e1071b798 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -102,6 +102,7 @@ bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
 bool handle_pio(uint16_t port, unsigned int size, int dir);
 void hvm_interrupt_post(struct vcpu *v, int vector, int type);
 void hvm_dpci_eoi(struct domain *d, unsigned int guest_irq);
+void hvm_dpci_isairq_eoi(struct domain *d, unsigned int isairq);
 void msix_write_completion(struct vcpu *);
 
 #ifdef CONFIG_HVM
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
index e720461a14..94cc1646c0 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -924,6 +924,48 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
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
+void hvm_dpci_isairq_eoi(struct domain *d, unsigned int isairq)
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
index d9285a7760..b9e1288de8 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -202,7 +202,6 @@ int hvm_do_IRQ_dpci(struct domain *, struct pirq *);
 int pt_irq_create_bind(struct domain *, const struct xen_domctl_bind_pt_irq *);
 int pt_irq_destroy_bind(struct domain *, const struct xen_domctl_bind_pt_irq *);
 
-void hvm_dpci_isairq_eoi(struct domain *d, unsigned int isairq);
 struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *);
 void free_hvm_irq_dpci(struct hvm_irq_dpci *dpci);
 
-- 
2.37.2


