Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF84B658D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 09:12:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272812.467773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJsw2-00011A-GC; Tue, 15 Feb 2022 08:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272812.467773; Tue, 15 Feb 2022 08:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJsw2-0000zN-D9; Tue, 15 Feb 2022 08:11:42 +0000
Received: by outflank-mailman (input) for mailman id 272812;
 Tue, 15 Feb 2022 08:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i+nY=S6=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nJsw1-0000zH-FO
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 08:11:41 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6b9bc4a-8e36-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 09:11:39 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id b9so11155571lfv.7
 for <xen-devel@lists.xenproject.org>; Tue, 15 Feb 2022 00:11:39 -0800 (PST)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id o2sm1314543lfr.31.2022.02.15.00.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 00:11:36 -0800 (PST)
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
X-Inumbo-ID: e6b9bc4a-8e36-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZF1B9rIAPx61ZY1fKj9JXTDoSUJ4I9hy3WNShA/lFu8=;
        b=kXiC35QtWZHI3xzisD8UHMXTIT9qC84t5U2O0h/CLHPweKNL/A1Ar/OxC7oaZGXbdx
         eS87tSaKE/QIrNDNYgiv699UojOb9qCRgmrOC0uEfTwekGPhAJ9mQNLVZ/CHCJVCo6nX
         OwEfyVh2zaran0EfpBLtTTNJreBSV2JSlajDPIFMv5L4hhg7Vwn9ycicuCBKg2Q7RQDf
         kJDBGzRtGBN5dlfq2fY8um7chAZBEYEgSfeqI+1mBRBMfpkG9Sk2pHBB0pHk6b2d/OyM
         n2hiY3IFnX3zXyOELOV7SoApfhgdTNPAF9dPNQA9bRFTaK0ub/GJPNg37aaXQIEM7x/1
         u/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZF1B9rIAPx61ZY1fKj9JXTDoSUJ4I9hy3WNShA/lFu8=;
        b=e+00wCu9xRZCYK9EijLTrgv0Ys5pz5/xUhtL5+WjWtzDGevwDyztCUqRSasjo2hf3H
         7Riilc4PFtO2iT7hOADezKiiU0fB7hUblcS8gaD5LoxAGiQ8K0mDrHySR54luUbK9f96
         JnT0lKOVaBCO9bvLCTQPVnODEWtHQcqOJdtfo67hPqIEQAtzti8lkFO8rMkFJflvli6O
         xT42ZNGBiN9PDHpTkM93KaLDc1szWTHJLdLm4RFGBGy2gR2rpwrKFjHxeNTvfsoDHeg1
         RF9RgM8shpNYrnz38iVbecswE41VWrS/5jlcdbY5wyE4n1afHS06ozpZy5rlytKQzAb4
         NrWg==
X-Gm-Message-State: AOAM531MztHDGM6TgepF+PXswfn9guMaod9UFXqEoEBCuQc2IbV1+Vlm
	+OPyKYKtpxZluxbvx0LNRckNvh0wj6E=
X-Google-Smtp-Source: ABdhPJymnsLcP5/sLAPVYw2RjyfY7zPovopXxavsixGDGxaEfTNOJrY2vqsvbhaVkqA/j8dTU+/ITg==
X-Received: by 2002:a05:6512:3da2:: with SMTP id k34mr2229684lfv.217.1644912698031;
        Tue, 15 Feb 2022 00:11:38 -0800 (PST)
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
Subject: [PATCH v2] vpci: introduce per-domain lock to protect vpci structure
Date: Tue, 15 Feb 2022 10:11:35 +0200
Message-Id: <20220215081135.1497470-1-andr2000@gmail.com>
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

8. Do not call process_pending_softirqs with any locks held. For that unlock
prior the call and re-acquire the locks after. After re-acquiring the
lock there is no need to check if pdev->vpci exists:
 - in apply_map because of the context it is called (no race condition
   possible)
 - for MSI/MSI-X debug code because it is called at the end of
   pdev->vpci access and no further access to pdev->vpci is made

9. Check for !pdev->vpci in vpci_{read|write} after acquiring the lock
and if so, allow reading or writing the hardware register directly. This is
acceptable as we only deal with Dom0 as of now. Once DomU support is
added the write will need to be ignored and read return all 0's for the
guests, while Dom0 can still access the registers directly.

10. Introduce pcidevs_trylock, so there is a possibility to try locking
the pcidev's lock.

11. Use pcidev's lock around for_each_pdev and pci_get_pdev_by_domain
while accessing pdevs in vpci code.

12. This is based on the discussion at [1].

[1] https://lore.kernel.org/all/20220204063459.680961-4-andr2000@gmail.com/

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
This was checked on x86: with and without PVH Dom0.

Since v1:
- s/ASSERT(!!/ASSERT(
- move vpci_header_write_lock to vpci.c and rename to
  vpci_header_need_write_lock
- use a simple static overlap function instead of vpci_offset_cmp
- signal no ROM BAR with rom_reg == 0
- msix_accept: new line before return
- do not run process_pending_softirqs with locks held
- in-code comments update
- move rom_reg before rom_enabled in struct vpci. Roger, it is not
  possible to move it after 'type' as in this case it becomes per BAR
  and we need it per vpci
- add !pdev->vpci checks to vpci_{read|write}
- move ASSERT(pdev->vpci) in add_handlers under the write lock
- introduce pcidevs_trylock
- protect for_each_pdev with pcidevs lock
---
 xen/arch/x86/hvm/vmsi.c       |   7 +++
 xen/common/domain.c           |   3 +
 xen/drivers/passthrough/pci.c |   5 ++
 xen/drivers/vpci/header.c     |  56 +++++++++++++++++++
 xen/drivers/vpci/msi.c        |  25 ++++++++-
 xen/drivers/vpci/msix.c       |  41 ++++++++++++--
 xen/drivers/vpci/vpci.c       | 100 ++++++++++++++++++++++++++--------
 xen/include/xen/pci.h         |   1 +
 xen/include/xen/sched.h       |   3 +
 xen/include/xen/vpci.h        |   6 ++
 10 files changed, 215 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 13e2a190b439..2a13c6581345 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -893,6 +893,9 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
 {
     unsigned int i;
 
+    ASSERT(rw_is_locked(&msix->pdev->domain->vpci_rwlock));
+    ASSERT(pcidevs_locked());
+
     for ( i = 0; i < msix->max_entries; i++ )
     {
         const struct vpci_msix_entry *entry = &msix->entries[i];
@@ -911,7 +914,11 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
             struct pci_dev *pdev = msix->pdev;
 
             spin_unlock(&msix->pdev->vpci->lock);
+            pcidevs_unlock();
+            read_unlock(&pdev->domain->vpci_rwlock);
             process_pending_softirqs();
+            read_lock(&pdev->domain->vpci_rwlock);
+            pcidevs_lock();
             /* NB: we assume that pdev cannot go away for an alive domain. */
             if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
                 return -EBUSY;
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
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index e8b09d77d880..57077dd52d10 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -57,6 +57,11 @@ void pcidevs_lock(void)
     spin_lock_recursive(&_pcidevs_lock);
 }
 
+int pcidevs_trylock(void)
+{
+    return spin_trylock_recursive(&_pcidevs_lock);
+}
+
 void pcidevs_unlock(void)
 {
     spin_unlock_recursive(&_pcidevs_lock);
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 40ff79c33f8f..8736da95af86 100644
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
@@ -171,8 +173,24 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
     struct map_data data = { .d = d, .map = true };
     int rc;
 
+    ASSERT(rw_is_write_locked(&d->vpci_rwlock));
+
     while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
+    {
+        /*
+         * FIXME: apply_map is called from dom0 specific init code when
+         * system_state < SYS_STATE_active, so there is no race condition
+         * possible between this code and vpci_process_pending. So, neither
+         * vpci_process_pending may try to acquire the lock in read mode and
+         * also destroy pdev->vpci in its error path nor pdev may be disposed
+         * yet. This means that it is not required to check if the relevant
+         * pdev->vpci still exists after re-acquiring the lock.
+         */
+        write_unlock(&d->vpci_rwlock);
         process_pending_softirqs();
+        write_lock(&d->vpci_rwlock);
+    }
+
     rangeset_destroy(mem);
     if ( !rc )
         modify_decoding(pdev, cmd, false);
@@ -203,6 +221,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
     raise_softirq(SCHEDULE_SOFTIRQ);
 }
 
+/* This must hold domain's vpci_rwlock in write mode. */
 static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 {
     struct vpci_header *header = &pdev->vpci->header;
@@ -267,6 +286,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      * Check for overlaps with other BARs. Note that only BARs that are
      * currently mapped (enabled) are checked for overlaps.
      */
+    pcidevs_lock();
     for_each_pdev ( pdev->domain, tmp )
     {
         if ( tmp == pdev )
@@ -306,10 +326,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
                        start, end, rc);
                 rangeset_destroy(mem);
+                pcidevs_unlock();
                 return rc;
             }
         }
     }
+    pcidevs_unlock();
 
     ASSERT(dev);
 
@@ -454,6 +476,8 @@ static int init_bars(struct pci_dev *pdev)
     struct vpci_bar *bars = header->bars;
     int rc;
 
+    ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
+
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_NORMAL:
@@ -542,6 +566,8 @@ static int init_bars(struct pci_dev *pdev)
         }
     }
 
+    ASSERT(!header->rom_reg);
+
     /* Check expansion ROM. */
     rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
     if ( rc > 0 && size )
@@ -558,12 +584,42 @@ static int init_bars(struct pci_dev *pdev)
                                4, rom);
         if ( rc )
             rom->type = VPCI_BAR_EMPTY;
+
+        header->rom_reg = rom_reg;
     }
 
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
 }
 REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
 
+static bool overlap(unsigned int r1_offset, unsigned int r1_size,
+                    unsigned int r2_offset, unsigned int r2_size)
+{
+    /* Return true if there is an overlap. */
+    return r1_offset < r2_offset + r2_size && r2_offset < r1_offset + r1_size;
+}
+
+bool vpci_header_need_write_lock(const struct pci_dev *pdev,
+                                 unsigned int start, unsigned int size)
+{
+    /*
+     * Writing the command register and ROM BAR register may trigger
+     * modify_bars to run, which in turn may access multiple pdevs while
+     * checking for the existing BAR's overlap. The overlapping check, if done
+     * under the read lock, requires vpci->lock to be acquired on both devices
+     * being compared, which may produce a deadlock. At the same time it is not
+     * possible to upgrade read lock to write lock in such a case.
+     * Check which registers are going to be written and return true if lock
+     * needs to be acquired in write mode.
+     */
+    if ( overlap(start, size, PCI_COMMAND, 2) ||
+         (pdev->vpci->header.rom_reg &&
+          overlap(start, size, pdev->vpci->header.rom_reg, 4)) )
+        return true;
+
+    return false;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 5757a7aed20f..396f336fd330 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -190,6 +190,8 @@ static int init_msi(struct pci_dev *pdev)
     uint16_t control;
     int ret;
 
+    ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
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
@@ -277,6 +279,15 @@ void vpci_dump_msi(void)
 
         printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
 
+        if ( !read_trylock(&d->vpci_rwlock) )
+            continue;
+
+        if ( !pcidevs_trylock() )
+        {
+            read_unlock(&d->vpci_rwlock);
+            continue;
+        }
+
         for_each_pdev ( d, pdev )
         {
             const struct vpci_msi *msi;
@@ -318,14 +329,22 @@ void vpci_dump_msi(void)
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
+            pcidevs_unlock();
+            read_unlock(&d->vpci_rwlock);
+
             process_pending_softirqs();
+
+            read_lock(&d->vpci_rwlock);
+            pcidevs_lock();
         }
+        pcidevs_unlock();
+        read_unlock(&d->vpci_rwlock);
     }
     rcu_read_unlock(&domlist_read_lock);
 }
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 846f1b8d7038..0d473bfbe3a5 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -138,6 +138,7 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, val);
 }
 
+/* This must hold domain's vpci_rwlock in write mode. */
 static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 {
     struct vpci_msix *msix;
@@ -158,7 +159,13 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 
 static int msix_accept(struct vcpu *v, unsigned long addr)
 {
-    return !!msix_find(v->domain, addr);
+    int rc;
+
+    read_lock(&v->domain->vpci_rwlock);
+    rc = !!msix_find(v->domain, addr);
+    read_unlock(&v->domain->vpci_rwlock);
+
+    return rc;
 }
 
 static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
@@ -185,18 +192,27 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
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
@@ -222,6 +238,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
             break;
         }
 
+        read_unlock(&d->vpci_rwlock);
         return X86EMUL_OKAY;
     }
 
@@ -255,6 +272,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
         break;
     }
     spin_unlock(&msix->pdev->vpci->lock);
+    read_unlock(&d->vpci_rwlock);
 
     return X86EMUL_OKAY;
 }
@@ -262,16 +280,25 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
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
@@ -294,6 +321,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
             }
         }
 
+        read_unlock(&d->vpci_rwlock);
         return X86EMUL_OKAY;
     }
 
@@ -371,6 +399,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
         break;
     }
     spin_unlock(&msix->pdev->vpci->lock);
+    read_unlock(&d->vpci_rwlock);
 
     return X86EMUL_OKAY;
 }
@@ -437,6 +466,8 @@ static int init_msix(struct pci_dev *pdev)
     struct vpci_msix *msix;
     int rc;
 
+    ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
+
     msix_offset = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
                                       PCI_CAP_ID_MSIX);
     if ( !msix_offset )
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index fb0947179b79..68e9f0ac8c3e 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -37,43 +37,58 @@ extern vpci_register_init_t *const __end_vpci_array[];
 
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
 
     if ( !has_vpci(pdev->domain) )
         return 0;
 
+    vpci = xzalloc(struct vpci);
+    if ( !vpci )
+        return -ENOMEM;
+
+    INIT_LIST_HEAD(&vpci->handlers);
+    spin_lock_init(&vpci->lock);
+
+    write_lock(&pdev->domain->vpci_rwlock);
+
     /* We should not get here twice for the same device. */
     ASSERT(!pdev->vpci);
 
-    pdev->vpci = xzalloc(struct vpci);
-    if ( !pdev->vpci )
-        return -ENOMEM;
-
-    INIT_LIST_HEAD(&pdev->vpci->handlers);
-    spin_lock_init(&pdev->vpci->lock);
+    pdev->vpci = vpci;
 
     for ( i = 0; i < NUM_VPCI_INIT; i++ )
     {
@@ -81,6 +96,7 @@ int vpci_add_handlers(struct pci_dev *pdev)
         if ( rc )
             break;
     }
+    write_unlock(&pdev->domain->vpci_rwlock);
 
     if ( rc )
         vpci_remove_device(pdev);
@@ -129,6 +145,7 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
     return pci_conf_read32(pdev->sbdf, reg);
 }
 
+/* This must hold domain's vpci_rwlock in write mode. */
 int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
                       vpci_write_t *write_handler, unsigned int offset,
                       unsigned int size, void *data)
@@ -152,8 +169,6 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     r->offset = offset;
     r->private = data;
 
-    spin_lock(&vpci->lock);
-
     /* The list of handlers must be kept sorted at all times. */
     list_for_each ( prev, &vpci->handlers )
     {
@@ -165,25 +180,23 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
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
@@ -310,7 +321,7 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
 
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 {
-    const struct domain *d = current->domain;
+    struct domain *d = current->domain;
     const struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset = 0;
@@ -323,10 +334,18 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
     }
 
     /* Find the PCI dev matching the address. */
+    pcidevs_lock();
     pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
+    pcidevs_unlock();
     if ( !pdev )
         return vpci_read_hw(sbdf, reg, size);
 
+    read_lock(&d->vpci_rwlock);
+    if ( !pdev->vpci )
+    {
+        read_unlock(&d->vpci_rwlock);
+        return vpci_read_hw(sbdf, reg, size);
+    }
     spin_lock(&pdev->vpci->lock);
 
     /* Read from the hardware or the emulated register handlers. */
@@ -371,6 +390,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
+    read_unlock(&d->vpci_rwlock);
 
     if ( data_offset < size )
     {
@@ -413,11 +433,12 @@ static void vpci_write_helper(const struct pci_dev *pdev,
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
@@ -433,14 +454,38 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
      * Find the PCI dev matching the address.
      * Passthrough everything that's not trapped.
      */
+    pcidevs_lock();
     pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
+    pcidevs_unlock();
     if ( !pdev )
     {
         vpci_write_hw(sbdf, reg, size, data);
         return;
     }
 
-    spin_lock(&pdev->vpci->lock);
+    if ( vpci_header_need_write_lock(pdev, reg, size) )
+    {
+        /* Gain exclusive access to all of the domain pdevs vpci. */
+        write_lock(&d->vpci_rwlock);
+        if ( !pdev->vpci )
+        {
+            write_unlock(&d->vpci_rwlock);
+            vpci_write_hw(sbdf, reg, size, data);
+            return;
+        }
+        write_locked = true;
+    }
+    else
+    {
+        read_lock(&d->vpci_rwlock);
+        if ( !pdev->vpci )
+        {
+            read_unlock(&d->vpci_rwlock);
+            vpci_write_hw(sbdf, reg, size, data);
+            return;
+        }
+        spin_lock(&pdev->vpci->lock);
+    }
 
     /* Write the value to the hardware or emulated registers. */
     list_for_each_entry ( r, &pdev->vpci->handlers, node )
@@ -475,7 +520,14 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
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
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index b6d7e454f814..bb916433cce4 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -149,6 +149,7 @@ struct pci_dev {
  */
 
 void pcidevs_lock(void);
+int pcidevs_trylock(void);
 void pcidevs_unlock(void);
 bool_t __must_check pcidevs_locked(void);
 
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
index e8ac1eb39513..be388e14bfb3 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -57,6 +57,9 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
  */
 bool __must_check vpci_process_pending(struct vcpu *v);
 
+bool vpci_header_need_write_lock(const struct pci_dev *pdev,
+                                 unsigned int start, unsigned int size);
+
 struct vpci {
     /* List of vPCI handlers for a device. */
     struct list_head handlers;
@@ -83,6 +86,9 @@ struct vpci {
         } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
         /* At most 6 BARS + 1 expansion ROM BAR. */
 
+        /* Offset to the ROM BAR register if any. */
+        unsigned int rom_reg;
+
         /*
          * Store whether the ROM enable bit is set (doesn't imply ROM BAR
          * is mapped into guest p2m) if there's a ROM BAR on the device.
-- 
2.25.1


