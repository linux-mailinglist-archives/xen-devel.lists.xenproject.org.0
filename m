Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDE04AF2F8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 14:37:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269158.463164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHn99-0008OB-J2; Wed, 09 Feb 2022 13:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269158.463164; Wed, 09 Feb 2022 13:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHn99-0008MM-Fs; Wed, 09 Feb 2022 13:36:35 +0000
Received: by outflank-mailman (input) for mailman id 269158;
 Wed, 09 Feb 2022 13:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yTKH=SY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nHn97-0008MG-53
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 13:36:33 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a4ead9e-89ad-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 14:36:31 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id z19so4156167lfq.13
 for <xen-devel@lists.xenproject.org>; Wed, 09 Feb 2022 05:36:31 -0800 (PST)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y17sm851199lfk.57.2022.02.09.05.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 05:36:29 -0800 (PST)
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
X-Inumbo-ID: 4a4ead9e-89ad-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sSYB8Uua8dhBxMUDXPZLmZ3DA/dC79AYBt3A+4Vje6E=;
        b=VvgUt7QFPqt9j5DuBvdUjQn0gYlQbP1BwfJMzJeO9qCSneZlnKVETmo/w7cwsmuHji
         h5Mofnkg2ChwR1fa6oX+87DoQovK5MKczJD2+fWSZ4QEfQAABAF+tIBwSRSdrx8gfXK3
         sb2nH1kdXijBQgn1lQCZPRzZ0qrYObuKLZDAZ+dbFiSMTeiQJ3tyj/MPsphDNb2uJLA0
         h9oq84+zNOGdRG4nq1YWSYqvWQx6qndZnIXRqXUJ3muCzftHNr9qctKMiajSvSzX4cLE
         FnA+xAZjTbpbxayhLHnPgR1AmFiWaKv5uwHF2zaR0nRqktsLePGEs9LonLbej8rcxz2+
         xnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sSYB8Uua8dhBxMUDXPZLmZ3DA/dC79AYBt3A+4Vje6E=;
        b=fWriBGb4/+q5M8CDpYIYEfRn2YBy0PWm0tZqyxv0j39rNDkNZG4R8M+oE/8tZ4hBYO
         LKJ5YKhhac0QeZIfhERZueyPWfl5+iq+1vS9qxCl5rn42H5LsX3/cbDHMLMGheTRv7z4
         rlAEU3napxW6aVBEUi9qLDyN8KVCm2mLQ2jFXuuGZGvo+/IWrNVcyx3mi7YBsZUe/Ker
         d6vfb0Izy8Yx5Lf2NJMJd+v2nMPi7Nk3/ZOArnHfAbrsGrWAaAH0dsfO4eYy6EbmltOI
         ZUajE6bCygBPRyS7LP/0HpfEChymbipMxbXHXvKTFdI239jdAKPkVj+nSuFp4MKcF0n5
         wRdA==
X-Gm-Message-State: AOAM531ZqUPoc2yI5J33WMJPSE+XCFt4Ou+si6bgeafcencp1cXsftbb
	7+XAmBTt3NNw3IFRwO37N0Bmpo5dRkI=
X-Google-Smtp-Source: ABdhPJzznhZpNNYmrX6FU9ODrsiWwhlNfBlA9abbfZy5PxTohxWJhwieB5LzSGlwOsez5hE49Dxl1Q==
X-Received: by 2002:a05:6512:3f0f:: with SMTP id y15mr1615416lfa.543.1644413790088;
        Wed, 09 Feb 2022 05:36:30 -0800 (PST)
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
Subject: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Date: Wed,  9 Feb 2022 15:36:27 +0200
Message-Id: <20220209133627.959649-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Introduce a per-domain read/write lock to check whether vpci is present,
so we are sure there are no accesses to the contents of the vpci struct
if not. This lock can be used (and in a few cases is used right away)
so that vpci removal can be performed while holding the lock in write
mode. Previously such removal could race with vpci_read for example.

1. Per-domain's vpci_rwlock is used to protect pdev->vpci structure
from being removed.

2. Writing the command register and ROM BAR register may trigger
modify_bars to run, which in turn may access multiple pdevs while
checking for the existing BAR's overlap. The overlapping check, if done
under the read lock, requires vpci->lock to be acquired on both devices
being compared, which may produce a deadlock. It is not possible to
upgrade read lock to write lock in such a case. So, in order to prevent
the deadlock, check which registers are going to be written and acquire
the lock in the appropriate mode from the beginning.

All other code, which doesn't lead to pdev->vpci destruction and does not
access multiple pdevs at the same time, can still use a combination of the
read lock and pdev->vpci->lock.

3. Optimize if ROM BAR write lock required detection by caching offset
of the ROM BAR register in vpci->header->rom_reg which depends on
header's type.

4. Reduce locked region in vpci_remove_device as it is now possible
to set pdev->vpci to NULL early right after the write lock is acquired.

5. Reduce locked region in vpci_add_handlers as it is possible to
initialize many more fields of the struct vpci before assigning it to
pdev->vpci.

6. vpci_{add|remove}_register are required to be called with the write lock
held, but it is not feasible to add an assert there as it requires
struct domain to be passed for that. So, add a comment about this requirement
to these and other functions with the equivalent constraints.

7. Drop const qualifier where the new rwlock is used and this is appropriate.

8. This is based on the discussion at [1].

[1] https://lore.kernel.org/all/20220204063459.680961-4-andr2000@gmail.com/

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
This was checked on x86: with and without PVH Dom0.
---
 xen/arch/x86/hvm/vmsi.c   |   2 +
 xen/common/domain.c       |   3 +
 xen/drivers/vpci/header.c |   8 +++
 xen/drivers/vpci/msi.c    |   8 ++-
 xen/drivers/vpci/msix.c   |  40 +++++++++++--
 xen/drivers/vpci/vpci.c   | 114 ++++++++++++++++++++++++++++----------
 xen/include/xen/sched.h   |   3 +
 xen/include/xen/vpci.h    |   2 +
 8 files changed, 146 insertions(+), 34 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 13e2a190b439..351cb968a423 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -893,6 +893,8 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
 {
     unsigned int i;
 
+    ASSERT(!!rw_is_locked(&msix->pdev->domain->vpci_rwlock));
+
     for ( i = 0; i < msix->max_entries; i++ )
     {
         const struct vpci_msix_entry *entry = &msix->entries[i];
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 2048ebad86ff..10558c22285d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -616,6 +616,9 @@ struct domain *domain_create(domid_t domid,
 
 #ifdef CONFIG_HAS_PCI
     INIT_LIST_HEAD(&d->pdev_list);
+#ifdef CONFIG_HAS_VPCI
+    rwlock_init(&d->vpci_rwlock);
+#endif
 #endif
 
     /* All error paths can depend on the above setup. */
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 40ff79c33f8f..9e2aeb2055c9 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -142,12 +142,14 @@ bool vpci_process_pending(struct vcpu *v)
         if ( rc == -ERESTART )
             return true;
 
+        read_lock(&v->domain->vpci_rwlock);
         spin_lock(&v->vpci.pdev->vpci->lock);
         /* Disable memory decoding unconditionally on failure. */
         modify_decoding(v->vpci.pdev,
                         rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
                         !rc && v->vpci.rom_only);
         spin_unlock(&v->vpci.pdev->vpci->lock);
+        read_unlock(&v->domain->vpci_rwlock);
 
         rangeset_destroy(v->vpci.mem);
         v->vpci.mem = NULL;
@@ -203,6 +205,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
     raise_softirq(SCHEDULE_SOFTIRQ);
 }
 
+/* This must hold domain's vpci_rwlock in write mode. */
 static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 {
     struct vpci_header *header = &pdev->vpci->header;
@@ -454,6 +457,8 @@ static int init_bars(struct pci_dev *pdev)
     struct vpci_bar *bars = header->bars;
     int rc;
 
+    ASSERT(!!rw_is_write_locked(&pdev->domain->vpci_rwlock));
+
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_NORMAL:
@@ -548,6 +553,7 @@ static int init_bars(struct pci_dev *pdev)
     {
         struct vpci_bar *rom = &header->bars[num_bars];
 
+        header->rom_reg = rom_reg;
         rom->type = VPCI_BAR_ROM;
         rom->size = size;
         rom->addr = addr;
@@ -559,6 +565,8 @@ static int init_bars(struct pci_dev *pdev)
         if ( rc )
             rom->type = VPCI_BAR_EMPTY;
     }
+    else
+        header->rom_reg = ~(unsigned int)0;
 
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
 }
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 5757a7aed20f..5df3dfa8243c 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -190,6 +190,8 @@ static int init_msi(struct pci_dev *pdev)
     uint16_t control;
     int ret;
 
+    ASSERT(!!rw_is_write_locked(&pdev->domain->vpci_rwlock));
+
     if ( !pos )
         return 0;
 
@@ -265,7 +267,7 @@ REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
 
 void vpci_dump_msi(void)
 {
-    const struct domain *d;
+    struct domain *d;
 
     rcu_read_lock(&domlist_read_lock);
     for_each_domain ( d )
@@ -277,6 +279,9 @@ void vpci_dump_msi(void)
 
         printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
 
+        if ( !read_trylock(&d->vpci_rwlock) )
+            continue;
+
         for_each_pdev ( d, pdev )
         {
             const struct vpci_msi *msi;
@@ -326,6 +331,7 @@ void vpci_dump_msi(void)
             spin_unlock(&pdev->vpci->lock);
             process_pending_softirqs();
         }
+        read_unlock(&d->vpci_rwlock);
     }
     rcu_read_unlock(&domlist_read_lock);
 }
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 846f1b8d7038..5296d6025d8e 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -138,6 +138,7 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, val);
 }
 
+/* This must hold domain's vpci_rwlock in write mode. */
 static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 {
     struct vpci_msix *msix;
@@ -158,7 +159,12 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 
 static int msix_accept(struct vcpu *v, unsigned long addr)
 {
-    return !!msix_find(v->domain, addr);
+    int rc;
+
+    read_lock(&v->domain->vpci_rwlock);
+    rc = !!msix_find(v->domain, addr);
+    read_unlock(&v->domain->vpci_rwlock);
+    return rc;
 }
 
 static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
@@ -185,18 +191,27 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
 static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
                      unsigned long *data)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
+    struct domain *d = v->domain;
+    struct vpci_msix *msix;
     const struct vpci_msix_entry *entry;
     unsigned int offset;
 
     *data = ~0ul;
 
+    read_lock(&d->vpci_rwlock);
+
+    msix = msix_find(d, addr);
     if ( !msix )
+    {
+        read_unlock(&d->vpci_rwlock);
         return X86EMUL_RETRY;
+    }
 
     if ( !access_allowed(msix->pdev, addr, len) )
+    {
+        read_unlock(&d->vpci_rwlock);
         return X86EMUL_OKAY;
+    }
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -222,6 +237,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
             break;
         }
 
+        read_unlock(&d->vpci_rwlock);
         return X86EMUL_OKAY;
     }
 
@@ -255,6 +271,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
         break;
     }
     spin_unlock(&msix->pdev->vpci->lock);
+    read_unlock(&d->vpci_rwlock);
 
     return X86EMUL_OKAY;
 }
@@ -262,16 +279,25 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
 static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
                       unsigned long data)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
+    struct domain *d = v->domain;
+    struct vpci_msix *msix;
     struct vpci_msix_entry *entry;
     unsigned int offset;
 
+    read_lock(&d->vpci_rwlock);
+
+    msix = msix_find(d, addr);
     if ( !msix )
+    {
+        read_unlock(&d->vpci_rwlock);
         return X86EMUL_RETRY;
+    }
 
     if ( !access_allowed(msix->pdev, addr, len) )
+    {
+        read_unlock(&d->vpci_rwlock);
         return X86EMUL_OKAY;
+    }
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -294,6 +320,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
             }
         }
 
+        read_unlock(&d->vpci_rwlock);
         return X86EMUL_OKAY;
     }
 
@@ -371,6 +398,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
         break;
     }
     spin_unlock(&msix->pdev->vpci->lock);
+    read_unlock(&d->vpci_rwlock);
 
     return X86EMUL_OKAY;
 }
@@ -437,6 +465,8 @@ static int init_msix(struct pci_dev *pdev)
     struct vpci_msix *msix;
     int rc;
 
+    ASSERT(!!rw_is_write_locked(&pdev->domain->vpci_rwlock));
+
     msix_offset = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
                                       PCI_CAP_ID_MSIX);
     if ( !msix_offset )
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index fb0947179b79..16bb3b832e6a 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -37,28 +37,39 @@ extern vpci_register_init_t *const __end_vpci_array[];
 
 void vpci_remove_device(struct pci_dev *pdev)
 {
+    struct vpci *vpci;
+
     if ( !has_vpci(pdev->domain) )
         return;
 
-    spin_lock(&pdev->vpci->lock);
+    write_lock(&pdev->domain->vpci_rwlock);
+    if ( !pdev->vpci )
+    {
+        write_unlock(&pdev->domain->vpci_rwlock);
+        return;
+    }
+
+    vpci = pdev->vpci;
+    pdev->vpci = NULL;
+    write_unlock(&pdev->domain->vpci_rwlock);
+
     while ( !list_empty(&pdev->vpci->handlers) )
     {
-        struct vpci_register *r = list_first_entry(&pdev->vpci->handlers,
+        struct vpci_register *r = list_first_entry(&vpci->handlers,
                                                    struct vpci_register,
                                                    node);
 
         list_del(&r->node);
         xfree(r);
     }
-    spin_unlock(&pdev->vpci->lock);
-    xfree(pdev->vpci->msix);
-    xfree(pdev->vpci->msi);
-    xfree(pdev->vpci);
-    pdev->vpci = NULL;
+    xfree(vpci->msix);
+    xfree(vpci->msi);
+    xfree(vpci);
 }
 
 int vpci_add_handlers(struct pci_dev *pdev)
 {
+    struct vpci *vpci;
     unsigned int i;
     int rc = 0;
 
@@ -68,12 +79,15 @@ int vpci_add_handlers(struct pci_dev *pdev)
     /* We should not get here twice for the same device. */
     ASSERT(!pdev->vpci);
 
-    pdev->vpci = xzalloc(struct vpci);
-    if ( !pdev->vpci )
+    vpci = xzalloc(struct vpci);
+    if ( !vpci )
         return -ENOMEM;
 
-    INIT_LIST_HEAD(&pdev->vpci->handlers);
-    spin_lock_init(&pdev->vpci->lock);
+    INIT_LIST_HEAD(&vpci->handlers);
+    spin_lock_init(&vpci->lock);
+
+    write_lock(&pdev->domain->vpci_rwlock);
+    pdev->vpci = vpci;
 
     for ( i = 0; i < NUM_VPCI_INIT; i++ )
     {
@@ -81,6 +95,7 @@ int vpci_add_handlers(struct pci_dev *pdev)
         if ( rc )
             break;
     }
+    write_unlock(&pdev->domain->vpci_rwlock);
 
     if ( rc )
         vpci_remove_device(pdev);
@@ -89,22 +104,28 @@ int vpci_add_handlers(struct pci_dev *pdev)
 }
 #endif /* __XEN__ */
 
-static int vpci_register_cmp(const struct vpci_register *r1,
-                             const struct vpci_register *r2)
+static int vpci_offset_cmp(unsigned int r1_offset, unsigned int r1_size,
+                           unsigned int r2_offset, unsigned int r2_size)
 {
     /* Return 0 if registers overlap. */
-    if ( r1->offset < r2->offset + r2->size &&
-         r2->offset < r1->offset + r1->size )
+    if ( r1_offset < r2_offset + r2_size &&
+         r2_offset < r1_offset + r1_size )
         return 0;
-    if ( r1->offset < r2->offset )
+    if ( r1_offset < r2_offset )
         return -1;
-    if ( r1->offset > r2->offset )
+    if ( r1_offset > r2_offset )
         return 1;
 
     ASSERT_UNREACHABLE();
     return 0;
 }
 
+static int vpci_register_cmp(const struct vpci_register *r1,
+                             const struct vpci_register *r2)
+{
+    return vpci_offset_cmp(r1->offset, r1->size, r2->offset, r2->size);
+}
+
 /* Dummy hooks, writes are ignored, reads return 1's */
 static uint32_t vpci_ignored_read(const struct pci_dev *pdev, unsigned int reg,
                                   void *data)
@@ -129,6 +150,7 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
     return pci_conf_read32(pdev->sbdf, reg);
 }
 
+/* This must hold domain's vpci_rwlock in write mode. */
 int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
                       vpci_write_t *write_handler, unsigned int offset,
                       unsigned int size, void *data)
@@ -152,8 +174,6 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     r->offset = offset;
     r->private = data;
 
-    spin_lock(&vpci->lock);
-
     /* The list of handlers must be kept sorted at all times. */
     list_for_each ( prev, &vpci->handlers )
     {
@@ -165,25 +185,23 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
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
 
+/* This must hold domain's vpci_rwlock in write mode. */
 int vpci_remove_register(struct vpci *vpci, unsigned int offset,
                          unsigned int size)
 {
     const struct vpci_register r = { .offset = offset, .size = size };
     struct vpci_register *rm;
 
-    spin_lock(&vpci->lock);
     list_for_each_entry ( rm, &vpci->handlers, node )
     {
         int cmp = vpci_register_cmp(&r, rm);
@@ -195,14 +213,12 @@ int vpci_remove_register(struct vpci *vpci, unsigned int offset,
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
@@ -310,7 +326,7 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
 
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 {
-    const struct domain *d = current->domain;
+    struct domain *d = current->domain;
     const struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset = 0;
@@ -327,6 +343,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
     if ( !pdev )
         return vpci_read_hw(sbdf, reg, size);
 
+    read_lock(&d->vpci_rwlock);
     spin_lock(&pdev->vpci->lock);
 
     /* Read from the hardware or the emulated register handlers. */
@@ -371,6 +388,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    read_unlock(&d->vpci_rwlock);
 
     if ( data_offset < size )
     {
@@ -410,14 +428,37 @@ static void vpci_write_helper(const struct pci_dev *pdev,
              r->private);
 }
 
+static bool vpci_header_write_lock(const struct pci_dev *pdev,
+                                   unsigned int start, unsigned int size)
+{
+    /*
+     * Writing the command register and ROM BAR register may trigger
+     * modify_bars to run which in turn may access multiple pdevs while
+     * checking for the existing BAR's overlap. The overlapping check, if done
+     * under the read lock, requires vpci->lock to be acquired on both devices
+     * being compared, which may produce a deadlock. It is not possible to
+     * upgrade read lock to write lock in such a case. So, in order to prevent
+     * the deadlock, check which registers are going to be written and acquire
+     * the lock in the appropriate mode from the beginning.
+     */
+    if ( !vpci_offset_cmp(start, size, PCI_COMMAND, 2) )
+        return true;
+
+    if ( !vpci_offset_cmp(start, size, pdev->vpci->header.rom_reg, 4) )
+        return true;
+
+    return false;
+}
+
 void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data)
 {
-    const struct domain *d = current->domain;
+    struct domain *d = current->domain;
     const struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset = 0;
     const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
+    bool write_locked = false;
 
     if ( !size )
     {
@@ -440,7 +481,17 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
         return;
     }
 
-    spin_lock(&pdev->vpci->lock);
+    if ( vpci_header_write_lock(pdev, reg, size) )
+    {
+        /* Gain exclusive access to all of the domain pdevs vpci. */
+        write_lock(&d->vpci_rwlock);
+        write_locked = true;
+    }
+    else
+    {
+        read_lock(&d->vpci_rwlock);
+        spin_lock(&pdev->vpci->lock);
+    }
 
     /* Write the value to the hardware or emulated registers. */
     list_for_each_entry ( r, &pdev->vpci->handlers, node )
@@ -475,7 +526,14 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
             break;
         ASSERT(data_offset < size);
     }
-    spin_unlock(&pdev->vpci->lock);
+
+    if ( write_locked )
+        write_unlock(&d->vpci_rwlock);
+    else
+    {
+        spin_unlock(&pdev->vpci->lock);
+        read_unlock(&d->vpci_rwlock);
+    }
 
     if ( data_offset < size )
         /* Tailing gap, write the remaining. */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 37f78cc4c4c9..ecd34481a7af 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -444,6 +444,9 @@ struct domain
 
 #ifdef CONFIG_HAS_PCI
     struct list_head pdev_list;
+#ifdef CONFIG_HAS_VPCI
+    rwlock_t vpci_rwlock;
+#endif
 #endif
 
 #ifdef CONFIG_HAS_PASSTHROUGH
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e8ac1eb39513..e19e462ee5cb 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -88,6 +88,8 @@ struct vpci {
          * is mapped into guest p2m) if there's a ROM BAR on the device.
          */
         bool rom_enabled      : 1;
+        /* Offset to the ROM BAR register if any. */
+        unsigned int rom_reg;
         /* FIXME: currently there's no support for SR-IOV. */
     } header;
 
-- 
2.25.1


