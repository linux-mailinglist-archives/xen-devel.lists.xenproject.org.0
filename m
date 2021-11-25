Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2751745D8AC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230876.399156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWr-0002UB-OP; Thu, 25 Nov 2021 11:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230876.399156; Thu, 25 Nov 2021 11:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWr-0002Qt-Ky; Thu, 25 Nov 2021 11:03:01 +0000
Received: by outflank-mailman (input) for mailman id 230876;
 Thu, 25 Nov 2021 11:03:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCWp-0001K8-V5
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:00 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fc44399-4ddf-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:02:58 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id bi37so15338121lfb.5
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:02:58 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:02:57 -0800 (PST)
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
X-Inumbo-ID: 3fc44399-4ddf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SIXE3W6i3s/PLOl0AkNDVroqqsWXQtCAA5ldmwUu770=;
        b=D+5JaGFFqqHmDxTsOOorPtGxHkEZFwzBu8u0Ib/1AIjClZhQfGcgdZsbeG+F4KlAu0
         qfUdHXdlpt6JhltuKb/SjBVBPmF8vEYJ+joBuI5hJ5hdz+4DdY6ZWSMr0rOD6UDsMKgL
         ELc3zM3CIXiKloq8zIrjfDrJBzJUS8uTOjHtNP3eUJTh/80ICApR5fR1yUDIRyhQa4ls
         jmcT7Z15nSOicM6ugh1X1Qwga7Xs5KbM2p8XmfCUKXLMmQ828Sw78qJHUhNYCwIG0UGH
         Pa6jafKpRcOXpuX8upViqmUOSgeVf4LAWv8f8OL1y1v6SwYo3wNVDw338hvfJCumvgao
         DL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SIXE3W6i3s/PLOl0AkNDVroqqsWXQtCAA5ldmwUu770=;
        b=CpK9TANEogQGpDTWAhuQMjhu3lLloaaQrUe3xrORJAdE/Hv2nwkMDih7126A9gRAl6
         AgK70YzpRf1l6Dr2XRo7hzCdo2vFhhqAtCc/AFdfQonnXeP6OW6EwCNCTnvrH/sKoezD
         DsTogGG7CX+SSd+RAbucWPXpczKsCDCE3osf/XdzX05xamtsYZw4rv6h4ky3dkZSMmbJ
         ZWqLxgOQxD62rtU4eVSFCSi0m0n3PGGDJGfh+BirX8/Tc/qtvQS6SIugSto/ua0//Htm
         NlAs9d6/u12X0S7ZAXgAaYFJ9+zUqXt63FhFtCg4R8uyFtgssoETOhrfp6fxRWg/t2OF
         tWog==
X-Gm-Message-State: AOAM531VcCz0ACZ/nzL7FNt61J1M+OFcm1FuDuMHm2ueWSyTd4W+DCcz
	FtIKuTHWzTT7vvokVlKjFidkCUS1LvNs8dIF
X-Google-Smtp-Source: ABdhPJx09MIvNVbWsL5ybmB16oQuTeaKVlA/ijtzUP+FwCqO601HhcDh+t2TR1dIzqqxcX0aPTnfoQ==
X-Received: by 2002:a05:6512:39ca:: with SMTP id k10mr23315305lfu.426.1637838177842;
        Thu, 25 Nov 2021 03:02:57 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Date: Thu, 25 Nov 2021 13:02:40 +0200
Message-Id: <20211125110251.2877218-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monne <roger.pau@citrix.com>

This way the lock can be used to check whether vpci is present, and
removal can be performed while holding the lock, in order to make
sure there are no accesses to the contents of the vpci struct.
Previously removal could race with vpci_read for example, since the
lock was dropped prior to freeing pdev->vpci.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
New in v5 of this series: this is an updated version of the patch published at
https://lore.kernel.org/xen-devel/20180717094830.54806-2-roger.pau@citrix.com/

Changes since v2:
 - fixed pdev->vpci = xzalloc(struct vpci); under spin_lock (Jan)
Changes since v1:
 - Assert that vpci_lock is locked in vpci_remove_device_locked.
 - Remove double newline.
 - Shrink critical section in vpci_{read/write}.
---
 tools/tests/vpci/emul.h       |  5 ++-
 tools/tests/vpci/main.c       |  4 +--
 xen/arch/x86/hvm/vmsi.c       |  8 ++---
 xen/drivers/passthrough/pci.c |  1 +
 xen/drivers/vpci/header.c     | 21 +++++++----
 xen/drivers/vpci/msi.c        | 11 ++++--
 xen/drivers/vpci/msix.c       |  8 ++---
 xen/drivers/vpci/vpci.c       | 68 +++++++++++++++++++++++------------
 xen/include/xen/pci.h         |  1 +
 xen/include/xen/vpci.h        |  5 +--
 10 files changed, 85 insertions(+), 47 deletions(-)

diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index 2e1d3057c9d8..d018fb5eef21 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -44,6 +44,7 @@ struct domain {
 };
 
 struct pci_dev {
+    bool vpci_lock;
     struct vpci *vpci;
 };
 
@@ -53,10 +54,8 @@ struct vcpu
 };
 
 extern const struct vcpu *current;
-extern const struct pci_dev test_pdev;
+extern struct pci_dev test_pdev;
 
-typedef bool spinlock_t;
-#define spin_lock_init(l) (*(l) = false)
 #define spin_lock(l) (*(l) = true)
 #define spin_unlock(l) (*(l) = false)
 
diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index b9a0a6006bb9..26c95b08b6b1 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -23,7 +23,8 @@ static struct vpci vpci;
 
 const static struct domain d;
 
-const struct pci_dev test_pdev = {
+struct pci_dev test_pdev = {
+    .vpci_lock = false,
     .vpci = &vpci,
 };
 
@@ -158,7 +159,6 @@ main(int argc, char **argv)
     int rc;
 
     INIT_LIST_HEAD(&vpci.handlers);
-    spin_lock_init(&vpci.lock);
 
     VPCI_ADD_REG(vpci_read32, vpci_write32, 0, 4, r0);
     VPCI_READ_CHECK(0, 4, r0);
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 13e2a190b439..1f7a37f78264 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -910,14 +910,14 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
         {
             struct pci_dev *pdev = msix->pdev;
 
-            spin_unlock(&msix->pdev->vpci->lock);
+            spin_unlock(&msix->pdev->vpci_lock);
             process_pending_softirqs();
             /* NB: we assume that pdev cannot go away for an alive domain. */
-            if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
+            if ( !spin_trylock(&pdev->vpci_lock) )
                 return -EBUSY;
-            if ( pdev->vpci->msix != msix )
+            if ( !pdev->vpci || pdev->vpci->msix != msix )
             {
-                spin_unlock(&pdev->vpci->lock);
+                spin_unlock(&pdev->vpci_lock);
                 return -EAGAIN;
             }
         }
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index a9d31293ac09..286808b25e65 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -328,6 +328,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     *((u8*) &pdev->bus) = bus;
     *((u8*) &pdev->devfn) = devfn;
     pdev->domain = NULL;
+    spin_lock_init(&pdev->vpci_lock);
 
     arch_pci_init_pdev(pdev);
 
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 40ff79c33f8f..bd23c0274d48 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -142,12 +142,13 @@ bool vpci_process_pending(struct vcpu *v)
         if ( rc == -ERESTART )
             return true;
 
-        spin_lock(&v->vpci.pdev->vpci->lock);
-        /* Disable memory decoding unconditionally on failure. */
-        modify_decoding(v->vpci.pdev,
-                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
-                        !rc && v->vpci.rom_only);
-        spin_unlock(&v->vpci.pdev->vpci->lock);
+        spin_lock(&v->vpci.pdev->vpci_lock);
+        if ( v->vpci.pdev->vpci )
+            /* Disable memory decoding unconditionally on failure. */
+            modify_decoding(v->vpci.pdev,
+                            rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
+                            !rc && v->vpci.rom_only);
+        spin_unlock(&v->vpci.pdev->vpci_lock);
 
         rangeset_destroy(v->vpci.mem);
         v->vpci.mem = NULL;
@@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 continue;
         }
 
+        spin_lock(&tmp->vpci_lock);
+        if ( !tmp->vpci )
+        {
+            spin_unlock(&tmp->vpci_lock);
+            continue;
+        }
         for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
         {
             const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
@@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             rc = rangeset_remove_range(mem, start, end);
             if ( rc )
             {
+                spin_unlock(&tmp->vpci_lock);
                 printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
                        start, end, rc);
                 rangeset_destroy(mem);
                 return rc;
             }
         }
+        spin_unlock(&tmp->vpci_lock);
     }
 
     ASSERT(dev);
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 5757a7aed20f..e3ce46869dad 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -270,7 +270,7 @@ void vpci_dump_msi(void)
     rcu_read_lock(&domlist_read_lock);
     for_each_domain ( d )
     {
-        const struct pci_dev *pdev;
+        struct pci_dev *pdev;
 
         if ( !has_vpci(d) )
             continue;
@@ -282,8 +282,13 @@ void vpci_dump_msi(void)
             const struct vpci_msi *msi;
             const struct vpci_msix *msix;
 
-            if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
+            if ( !spin_trylock(&pdev->vpci_lock) )
                 continue;
+            if ( !pdev->vpci )
+            {
+                spin_unlock(&pdev->vpci_lock);
+                continue;
+            }
 
             msi = pdev->vpci->msi;
             if ( msi && msi->enabled )
@@ -323,7 +328,7 @@ void vpci_dump_msi(void)
                 }
             }
 
-            spin_unlock(&pdev->vpci->lock);
+            spin_unlock(&pdev->vpci_lock);
             process_pending_softirqs();
         }
     }
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 846f1b8d7038..5310cc3ff520 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -225,7 +225,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
         return X86EMUL_OKAY;
     }
 
-    spin_lock(&msix->pdev->vpci->lock);
+    spin_lock(&msix->pdev->vpci_lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
 
@@ -254,7 +254,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
         ASSERT_UNREACHABLE();
         break;
     }
-    spin_unlock(&msix->pdev->vpci->lock);
+    spin_unlock(&msix->pdev->vpci_lock);
 
     return X86EMUL_OKAY;
 }
@@ -297,7 +297,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
         return X86EMUL_OKAY;
     }
 
-    spin_lock(&msix->pdev->vpci->lock);
+    spin_lock(&msix->pdev->vpci_lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
 
@@ -370,7 +370,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
         ASSERT_UNREACHABLE();
         break;
     }
-    spin_unlock(&msix->pdev->vpci->lock);
+    spin_unlock(&msix->pdev->vpci_lock);
 
     return X86EMUL_OKAY;
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 657697fe3406..ceaac4516ff8 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -35,12 +35,10 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
-void vpci_remove_device(struct pci_dev *pdev)
+static void vpci_remove_device_handlers_locked(struct pci_dev *pdev)
 {
-    if ( !has_vpci(pdev->domain) )
-        return;
+    ASSERT(spin_is_locked(&pdev->vpci_lock));
 
-    spin_lock(&pdev->vpci->lock);
     while ( !list_empty(&pdev->vpci->handlers) )
     {
         struct vpci_register *r = list_first_entry(&pdev->vpci->handlers,
@@ -50,15 +48,33 @@ void vpci_remove_device(struct pci_dev *pdev)
         list_del(&r->node);
         xfree(r);
     }
-    spin_unlock(&pdev->vpci->lock);
+}
+
+void vpci_remove_device_locked(struct pci_dev *pdev)
+{
+    ASSERT(spin_is_locked(&pdev->vpci_lock));
+
+    vpci_remove_device_handlers_locked(pdev);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
     pdev->vpci = NULL;
 }
 
+void vpci_remove_device(struct pci_dev *pdev)
+{
+    if ( !has_vpci(pdev->domain) )
+        return;
+
+    spin_lock(&pdev->vpci_lock);
+    if ( pdev->vpci )
+        vpci_remove_device_locked(pdev);
+    spin_unlock(&pdev->vpci_lock);
+}
+
 int vpci_add_handlers(struct pci_dev *pdev)
 {
+    struct vpci *vpci;
     unsigned int i;
     int rc = 0;
 
@@ -68,12 +84,13 @@ int vpci_add_handlers(struct pci_dev *pdev)
     /* We should not get here twice for the same device. */
     ASSERT(!pdev->vpci);
 
-    pdev->vpci = xzalloc(struct vpci);
-    if ( !pdev->vpci )
+    vpci = xzalloc(struct vpci);
+    if ( !vpci )
         return -ENOMEM;
 
+    spin_lock(&pdev->vpci_lock);
+    pdev->vpci = vpci;
     INIT_LIST_HEAD(&pdev->vpci->handlers);
-    spin_lock_init(&pdev->vpci->lock);
 
     for ( i = 0; i < NUM_VPCI_INIT; i++ )
     {
@@ -83,7 +100,8 @@ int vpci_add_handlers(struct pci_dev *pdev)
     }
 
     if ( rc )
-        vpci_remove_device(pdev);
+        vpci_remove_device_locked(pdev);
+    spin_unlock(&pdev->vpci_lock);
 
     return rc;
 }
@@ -152,8 +170,6 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     r->offset = offset;
     r->private = data;
 
-    spin_lock(&vpci->lock);
-
     /* The list of handlers must be kept sorted at all times. */
     list_for_each ( prev, &vpci->handlers )
     {
@@ -165,14 +181,12 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
             break;
         if ( cmp == 0 )
         {
-            spin_unlock(&vpci->lock);
             xfree(r);
             return -EEXIST;
         }
     }
 
     list_add_tail(&r->node, prev);
-    spin_unlock(&vpci->lock);
 
     return 0;
 }
@@ -183,7 +197,6 @@ int vpci_remove_register(struct vpci *vpci, unsigned int offset,
     const struct vpci_register r = { .offset = offset, .size = size };
     struct vpci_register *rm;
 
-    spin_lock(&vpci->lock);
     list_for_each_entry ( rm, &vpci->handlers, node )
     {
         int cmp = vpci_register_cmp(&r, rm);
@@ -195,14 +208,12 @@ int vpci_remove_register(struct vpci *vpci, unsigned int offset,
         if ( !cmp && rm->offset == offset && rm->size == size )
         {
             list_del(&rm->node);
-            spin_unlock(&vpci->lock);
             xfree(rm);
             return 0;
         }
         if ( cmp <= 0 )
             break;
     }
-    spin_unlock(&vpci->lock);
 
     return -ENOENT;
 }
@@ -311,7 +322,7 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 {
     const struct domain *d = current->domain;
-    const struct pci_dev *pdev;
+    struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset = 0;
     uint32_t data = ~(uint32_t)0;
@@ -327,7 +338,12 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
     if ( !pdev )
         return vpci_read_hw(sbdf, reg, size);
 
-    spin_lock(&pdev->vpci->lock);
+    spin_lock(&pdev->vpci_lock);
+    if ( !pdev->vpci )
+    {
+        spin_unlock(&pdev->vpci_lock);
+        return vpci_read_hw(sbdf, reg, size);
+    }
 
     /* Read from the hardware or the emulated register handlers. */
     list_for_each_entry ( r, &pdev->vpci->handlers, node )
@@ -370,6 +386,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
             break;
         ASSERT(data_offset < size);
     }
+    spin_unlock(&pdev->vpci_lock);
 
     if ( data_offset < size )
     {
@@ -379,7 +396,6 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 
         data = merge_result(data, tmp_data, size - data_offset, data_offset);
     }
-    spin_unlock(&pdev->vpci->lock);
 
     return data & (0xffffffff >> (32 - 8 * size));
 }
@@ -414,7 +430,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data)
 {
     const struct domain *d = current->domain;
-    const struct pci_dev *pdev;
+    struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset = 0;
     const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
@@ -440,7 +456,14 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
         return;
     }
 
-    spin_lock(&pdev->vpci->lock);
+    spin_lock(&pdev->vpci_lock);
+    if ( !pdev->vpci )
+    {
+        spin_unlock(&pdev->vpci_lock);
+        vpci_write_hw(sbdf, reg, size, data);
+        return;
+    }
+
 
     /* Write the value to the hardware or emulated registers. */
     list_for_each_entry ( r, &pdev->vpci->handlers, node )
@@ -475,13 +498,12 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
             break;
         ASSERT(data_offset < size);
     }
+    spin_unlock(&pdev->vpci_lock);
 
     if ( data_offset < size )
         /* Tailing gap, write the remaining. */
         vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
                       data >> (data_offset * 8));
-
-    spin_unlock(&pdev->vpci->lock);
 }
 
 /* Helper function to check an access size and alignment on vpci space. */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index b6d7e454f814..3f60d6c6c6dd 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -134,6 +134,7 @@ struct pci_dev {
     u64 vf_rlen[6];
 
     /* Data for vPCI. */
+    spinlock_t vpci_lock;
     struct vpci *vpci;
 };
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 3f32de9d7eb3..8b22bdef11d0 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -30,8 +30,9 @@ int __must_check vpci_add_handlers(struct pci_dev *dev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
+void vpci_remove_device_locked(struct pci_dev *pdev);
 
-/* Add/remove a register handler. */
+/* Add/remove a register handler. Must be called holding the vpci_lock. */
 int __must_check vpci_add_register(struct vpci *vpci,
                                    vpci_read_t *read_handler,
                                    vpci_write_t *write_handler,
@@ -60,7 +61,6 @@ bool __must_check vpci_process_pending(struct vcpu *v);
 struct vpci {
     /* List of vPCI handlers for a device. */
     struct list_head handlers;
-    spinlock_t lock;
 
 #ifdef __XEN__
     /* Hide the rest of the vpci struct from the user-space test harness. */
@@ -231,6 +231,7 @@ static inline int vpci_add_handlers(struct pci_dev *pdev)
 }
 
 static inline void vpci_remove_device(struct pci_dev *pdev) { }
+static inline void vpci_remove_device_locked(struct pci_dev *pdev) { }
 
 static inline void vpci_dump_msi(void) { }
 
-- 
2.25.1


