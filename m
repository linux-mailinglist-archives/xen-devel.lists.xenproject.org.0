Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EB54B8C37
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 16:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274220.469648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKM2n-0001a7-W0; Wed, 16 Feb 2022 15:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274220.469648; Wed, 16 Feb 2022 15:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKM2n-0001W8-Rt; Wed, 16 Feb 2022 15:16:37 +0000
Received: by outflank-mailman (input) for mailman id 274220;
 Wed, 16 Feb 2022 15:16:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=miT7=S7=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nKM2m-0001Dp-JB
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 15:16:36 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dcb8634-8f3b-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 16:16:35 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id c10so3784777ljr.9
 for <xen-devel@lists.xenproject.org>; Wed, 16 Feb 2022 07:16:35 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id bt2sm3082357lfb.93.2022.02.16.07.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 07:16:33 -0800 (PST)
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
X-Inumbo-ID: 6dcb8634-8f3b-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mnHvlszou+sUt2CMWmsEloA/G0o6HD6lA07Jc0hGpOo=;
        b=CnqsZL9viXZMQHQvHmttTnJ0eEVzg9JrOJABXFnJpgoEwIzWtPkIzsA/Khf1vCiYWv
         lROUz5o/Dk2xoX6bpRS47rkPRDkeScth8pCG1ND3JjccdDZ0TKKtux2CYpWpYwewMtK7
         z2OJnLULlUSOZ6VsCf66MzxuSrbxPy6OEA7V58iL05jmDW8IbayQRuS+8f6883ImsQSg
         FSnZqZN5mq1z5qY4tt5HxePYhHWlSPUPHVnGBK1QDnBBfa5sv3v3jEQS9P6oa/0FiMSx
         yacoEAQOOwQq9l0YmUElHzMYeSeZJFxPWFHXHiLglQ3FOEpIbpROc7In0gEv6jnVbzKj
         D1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mnHvlszou+sUt2CMWmsEloA/G0o6HD6lA07Jc0hGpOo=;
        b=CwSnFCTSskQ+1e5uAc86f3jqecdq5oL5rT30ifN2e+TKphhqqhpPSapDeqqJ/Xi+Gd
         V3JXNr+t2EbICuo0cJp5WnCkiDzDW/TaKBZEVbDkt2DUJ8zmxAxJr9ROTVe1sYPUfYIx
         8TZNdV08iYtZx9SDtxm0h2pGtTjzh0EE3+XAyh5Ewh/dmWUeWH3Mdwr2aZaKEeghituJ
         dt6e0FpLQd0TzZpssPd9kZIHWNGpD9SMNGwbWovAszlLvcvcOxGKtCy7XeS72xjAqivk
         7YHLvzASlFz3vALjNLqHIEjAvw2sWSln12oDv8ugwtH32aPT1n4wyK2xRj4PulPe0wWJ
         kkAw==
X-Gm-Message-State: AOAM533J0MyWYximf68cCwxsmnGswUtRx0yLJ5fqJWdLCqyMFjUpLcNm
	uNjtJ5DBrmcc+oZUy5/LgX9uEE0qhcQ=
X-Google-Smtp-Source: ABdhPJxbY8NbS1ZgG14niedixXiySlg73DQhQT2TTHksvvrKaiNwPIMy+7I3IkDlaf2T6KXsC9hn8w==
X-Received: by 2002:a05:651c:1787:b0:244:3308:eb71 with SMTP id bn7-20020a05651c178700b002443308eb71mr2427606ljb.492.1645024594247;
        Wed, 16 Feb 2022 07:16:34 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 3/4] vpci: use pcidevs locking to protect MMIO handlers
Date: Wed, 16 Feb 2022 17:16:27 +0200
Message-Id: <20220216151628.1610777-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216151628.1610777-1-andr2000@gmail.com>
References: <20220216151628.1610777-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

vPCI MMIO handlers are accessing pdevs without protecting this access
with pcidevs_{lock|unlock}. This is not a problem as of now as these
are only used by Dom0. But, towards vPCI is used also for guests, we need
to properly protect pdev and pdev->vpci from being removed while still
in use.

For that add new locking helpers: pcidevs_read_{un}lock and means to
check if the lock is held in read mode.

Note, that pcidevs_read_{un}lock doesn't acquire _pcidevs_lock recursive
lock because its users are not expected to modify pdev's contents
other than pdev->vpci which is protected by pdev->vpci->lock (where
appropriate). These new helpers are also suitable for simple pdev
list traversals such as for_each_pdev, pci_get_pdev_by_domain and others.

This patch adds ASSERTs in the code to check that the rwlock is taken
and in appropriate mode. Some of such checks require changes to the
initialization of local variables which may be accessed before the
ASSERT checks the locking. For example see init_bars and mask_write.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/x86/hvm/vmsi.c       | 24 +++++++++++++--
 xen/drivers/passthrough/pci.c | 20 +++++++++++++
 xen/drivers/vpci/header.c     | 24 +++++++++++++--
 xen/drivers/vpci/msi.c        | 21 +++++++++----
 xen/drivers/vpci/msix.c       | 55 ++++++++++++++++++++++++++++++-----
 xen/drivers/vpci/vpci.c       | 22 ++++++++++++--
 xen/include/xen/pci.h         |  5 ++++
 xen/include/xen/vpci.h        |  2 +-
 8 files changed, 151 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 13e2a190b439..5ef8f37ab0fc 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -889,10 +889,16 @@ void vpci_msix_arch_init_entry(struct vpci_msix_entry *entry)
     entry->arch.pirq = INVALID_PIRQ;
 }
 
-int vpci_msix_arch_print(const struct vpci_msix *msix)
+int vpci_msix_arch_print(const struct domain *d, const struct vpci_msix *msix)
 {
     unsigned int i;
 
+    /*
+     * FIXME: this is not immediately correct, as the lock can be grabbed
+     * by a different CPU. But this is better then nothing.
+     */
+    ASSERT(pcidevs_read_locked());
+
     for ( i = 0; i < msix->max_entries; i++ )
     {
         const struct vpci_msix_entry *entry = &msix->entries[i];
@@ -909,11 +915,23 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
         if ( i && !(i % 64) )
         {
             struct pci_dev *pdev = msix->pdev;
+            pci_sbdf_t sbdf = pdev->sbdf;
 
             spin_unlock(&msix->pdev->vpci->lock);
+            pcidevs_read_unlock();
+
+            /* NB: we still hold rcu_read_lock(&domlist_read_lock); here. */
             process_pending_softirqs();
-            /* NB: we assume that pdev cannot go away for an alive domain. */
-            if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
+
+            if ( !pcidevs_read_trylock() )
+                return -EBUSY;
+            pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
+            /*
+             * FIXME: we may find a re-allocated pdev's copy here.
+             * Even occupying the same address as before. Do our best.
+             */
+            if ( !pdev || (pdev != msix->pdev) || !pdev->vpci ||
+                 !spin_trylock(&pdev->vpci->lock) )
                 return -EBUSY;
             if ( pdev->vpci->msix != msix )
             {
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 2a0d3d37a69f..74fe1c94cf71 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -70,6 +70,26 @@ bool_t pcidevs_locked(void)
     return !!spin_is_locked(&_pcidevs_lock) || pcidevs_write_locked();
 }
 
+void pcidevs_read_lock(void)
+{
+    read_lock(&_pcidevs_rwlock);
+}
+
+int pcidevs_read_trylock(void)
+{
+    return read_trylock(&_pcidevs_rwlock);
+}
+
+void pcidevs_read_unlock(void)
+{
+    read_unlock(&_pcidevs_rwlock);
+}
+
+bool pcidevs_read_locked(void)
+{
+    return !!rw_is_locked(&_pcidevs_rwlock);
+}
+
 void pcidevs_write_lock(void)
 {
     write_lock(&_pcidevs_rwlock);
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 40ff79c33f8f..75e972740106 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -142,16 +142,19 @@ bool vpci_process_pending(struct vcpu *v)
         if ( rc == -ERESTART )
             return true;
 
+        pcidevs_read_lock();
         spin_lock(&v->vpci.pdev->vpci->lock);
         /* Disable memory decoding unconditionally on failure. */
         modify_decoding(v->vpci.pdev,
                         rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
                         !rc && v->vpci.rom_only);
         spin_unlock(&v->vpci.pdev->vpci->lock);
+        pcidevs_read_unlock();
 
         rangeset_destroy(v->vpci.mem);
         v->vpci.mem = NULL;
         if ( rc )
+        {
             /*
              * FIXME: in case of failure remove the device from the domain.
              * Note that there might still be leftover mappings. While this is
@@ -159,7 +162,10 @@ bool vpci_process_pending(struct vcpu *v)
              * killed in order to avoid leaking stale p2m mappings on
              * failure.
              */
+            pcidevs_write_lock();
             vpci_remove_device(v->vpci.pdev);
+            pcidevs_write_unlock();
+        }
     }
 
     return false;
@@ -172,7 +178,16 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
     int rc;
 
     while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
+    {
+        /*
+         * It's safe to drop and re-acquire the lock in this context
+         * without risking pdev disappearing because devices cannot be
+         * removed until the initial domain has been started.
+         */
+        pcidevs_write_unlock();
         process_pending_softirqs();
+        pcidevs_write_lock();
+    }
     rangeset_destroy(mem);
     if ( !rc )
         modify_decoding(pdev, cmd, false);
@@ -450,10 +465,15 @@ static int init_bars(struct pci_dev *pdev)
     uint16_t cmd;
     uint64_t addr, size;
     unsigned int i, num_bars, rom_reg;
-    struct vpci_header *header = &pdev->vpci->header;
-    struct vpci_bar *bars = header->bars;
+    struct vpci_header *header;
+    struct vpci_bar *bars;
     int rc;
 
+    ASSERT(pcidevs_write_locked());
+
+    header = &pdev->vpci->header;
+    bars = header->bars;
+
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_NORMAL:
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 5757a7aed20f..4d19b036c98f 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -184,12 +184,17 @@ static void mask_write(const struct pci_dev *pdev, unsigned int reg,
 
 static int init_msi(struct pci_dev *pdev)
 {
-    uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
-    unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
-                                           PCI_CAP_ID_MSI);
+    uint8_t slot, func;
+    unsigned int pos;
     uint16_t control;
     int ret;
 
+    ASSERT(pcidevs_write_locked());
+
+    slot = PCI_SLOT(pdev->devfn);
+    func = PCI_FUNC(pdev->devfn);
+    pos = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func, PCI_CAP_ID_MSI);
+
     if ( !pos )
         return 0;
 
@@ -277,6 +282,9 @@ void vpci_dump_msi(void)
 
         printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
 
+        if ( !pcidevs_read_trylock() )
+            continue;
+
         for_each_pdev ( d, pdev )
         {
             const struct vpci_msi *msi;
@@ -310,7 +318,7 @@ void vpci_dump_msi(void)
                 printk("  entries: %u maskall: %d enabled: %d\n",
                        msix->max_entries, msix->masked, msix->enabled);
 
-                rc = vpci_msix_arch_print(msix);
+                rc = vpci_msix_arch_print(d, msix);
                 if ( rc )
                 {
                     /*
@@ -318,12 +326,13 @@ void vpci_dump_msi(void)
                      * holding the lock.
                      */
                     printk("unable to print all MSI-X entries: %d\n", rc);
-                    process_pending_softirqs();
-                    continue;
+                    goto pdev_done;
                 }
             }
 
             spin_unlock(&pdev->vpci->lock);
+ pdev_done:
+            pcidevs_read_unlock();
             process_pending_softirqs();
         }
     }
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 846f1b8d7038..f0adfb6c1dbc 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -144,9 +144,13 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 
     list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
     {
-        const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
+        const struct vpci_bar *bars;
         unsigned int i;
 
+        if ( !msix->pdev->vpci )
+            continue;
+
+        bars = msix->pdev->vpci->header.bars;
         for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
             if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
                  VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
@@ -158,7 +162,13 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 
 static int msix_accept(struct vcpu *v, unsigned long addr)
 {
-    return !!msix_find(v->domain, addr);
+    int rc;
+
+    pcidevs_read_lock();
+    rc = !!msix_find(v->domain, addr);
+    pcidevs_read_unlock();
+
+    return rc;
 }
 
 static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
@@ -186,17 +196,26 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
                      unsigned long *data)
 {
     const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
+    struct vpci_msix *msix;
     const struct vpci_msix_entry *entry;
     unsigned int offset;
 
     *data = ~0ul;
 
+    pcidevs_read_lock();
+
+    msix = msix_find(d, addr);
     if ( !msix )
+    {
+        pcidevs_read_unlock();
         return X86EMUL_RETRY;
+    }
 
     if ( !access_allowed(msix->pdev, addr, len) )
+    {
+        pcidevs_read_unlock();
         return X86EMUL_OKAY;
+    }
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -255,6 +274,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
         break;
     }
     spin_unlock(&msix->pdev->vpci->lock);
+    pcidevs_read_unlock();
 
     return X86EMUL_OKAY;
 }
@@ -263,15 +283,24 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
                       unsigned long data)
 {
     const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
+    struct vpci_msix *msix;
     struct vpci_msix_entry *entry;
     unsigned int offset;
 
+    pcidevs_read_lock();
+
+    msix = msix_find(d, addr);
     if ( !msix )
+    {
+        pcidevs_read_unlock();
         return X86EMUL_RETRY;
+    }
 
     if ( !access_allowed(msix->pdev, addr, len) )
+    {
+        pcidevs_read_unlock();
         return X86EMUL_OKAY;
+    }
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -294,6 +323,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
             }
         }
 
+        pcidevs_read_unlock();
         return X86EMUL_OKAY;
     }
 
@@ -371,6 +401,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
         break;
     }
     spin_unlock(&msix->pdev->vpci->lock);
+    pcidevs_read_unlock();
 
     return X86EMUL_OKAY;
 }
@@ -383,9 +414,13 @@ static const struct hvm_mmio_ops vpci_msix_table_ops = {
 
 int vpci_make_msix_hole(const struct pci_dev *pdev)
 {
-    struct domain *d = pdev->domain;
+    struct domain *d;
     unsigned int i;
 
+    ASSERT(pcidevs_read_locked());
+
+    d = pdev->domain;
+
     if ( !pdev->vpci->msix )
         return 0;
 
@@ -430,13 +465,19 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
 
 static int init_msix(struct pci_dev *pdev)
 {
-    struct domain *d = pdev->domain;
-    uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
+    struct domain *d;
+    uint8_t slot, func;
     unsigned int msix_offset, i, max_entries;
     uint16_t control;
     struct vpci_msix *msix;
     int rc;
 
+    ASSERT(pcidevs_write_locked());
+
+    d = pdev->domain;
+    slot = PCI_SLOT(pdev->devfn);
+    func = PCI_FUNC(pdev->devfn);
+
     msix_offset = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
                                       PCI_CAP_ID_MSIX);
     if ( !msix_offset )
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index f564572a51cb..119219220a70 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -37,7 +37,9 @@ extern vpci_register_init_t *const __end_vpci_array[];
 
 void vpci_remove_device(struct pci_dev *pdev)
 {
-    if ( !has_vpci(pdev->domain) )
+    ASSERT(pcidevs_write_locked());
+
+    if ( !has_vpci(pdev->domain) || !pdev->vpci )
         return;
 
     spin_lock(&pdev->vpci->lock);
@@ -62,6 +64,8 @@ int vpci_add_handlers(struct pci_dev *pdev)
     unsigned int i;
     int rc = 0;
 
+    ASSERT(pcidevs_write_locked());
+
     if ( !has_vpci(pdev->domain) )
         return 0;
 
@@ -136,6 +140,8 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     struct list_head *prev;
     struct vpci_register *r;
 
+    ASSERT(pcidevs_write_locked());
+
     /* Some sanity checks. */
     if ( (size != 1 && size != 2 && size != 4) ||
          offset >= PCI_CFG_SPACE_EXP_SIZE || (offset & (size - 1)) ||
@@ -183,6 +189,8 @@ int vpci_remove_register(struct vpci *vpci, unsigned int offset,
     const struct vpci_register r = { .offset = offset, .size = size };
     struct vpci_register *rm;
 
+    ASSERT(pcidevs_write_locked());
+
     spin_lock(&vpci->lock);
     list_for_each_entry ( rm, &vpci->handlers, node )
     {
@@ -330,10 +338,14 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         return data;
     }
 
+    pcidevs_read_lock();
     /* Find the PCI dev matching the address. */
     pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
-    if ( !pdev )
+    if ( !pdev || (pdev && !pdev->vpci) )
+    {
+        pcidevs_read_unlock();
         return vpci_read_hw(sbdf, reg, size);
+    }
 
     spin_lock(&pdev->vpci->lock);
 
@@ -379,6 +391,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    pcidevs_read_unlock();
 
     if ( data_offset < size )
     {
@@ -441,9 +454,11 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
      * Find the PCI dev matching the address.
      * Passthrough everything that's not trapped.
      */
+    pcidevs_read_lock();
     pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
-    if ( !pdev )
+    if ( !pdev || (pdev && !pdev->vpci) )
     {
+        pcidevs_read_unlock();
         vpci_write_hw(sbdf, reg, size, data);
         return;
     }
@@ -484,6 +499,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    pcidevs_read_unlock();
 
     if ( data_offset < size )
         /* Tailing gap, write the remaining. */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index e814d9542bfc..53cea3167b1f 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -152,6 +152,11 @@ void pcidevs_lock(void);
 void pcidevs_unlock(void);
 bool_t __must_check pcidevs_locked(void);
 
+void pcidevs_read_lock(void);
+int pcidevs_read_trylock(void);
+void pcidevs_read_unlock(void);
+bool __must_check pcidevs_read_locked(void);
+
 void pcidevs_write_lock(void);
 void pcidevs_write_unlock(void);
 bool __must_check pcidevs_write_locked(void);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e8ac1eb39513..c5f0054026a4 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -173,7 +173,7 @@ int __must_check vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,
 int __must_check vpci_msix_arch_disable_entry(struct vpci_msix_entry *entry,
                                               const struct pci_dev *pdev);
 void vpci_msix_arch_init_entry(struct vpci_msix_entry *entry);
-int vpci_msix_arch_print(const struct vpci_msix *msix);
+int vpci_msix_arch_print(const struct domain *d, const struct vpci_msix *msix);
 
 /*
  * Helper functions to fetch MSIX related data. They are used by both the
-- 
2.25.1


