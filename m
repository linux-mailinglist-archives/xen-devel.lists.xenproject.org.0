Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A74A940E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265006.458297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBY-0000Y1-LR; Fri, 04 Feb 2022 06:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265006.458297; Fri, 04 Feb 2022 06:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBY-0000Ug-Dv; Fri, 04 Feb 2022 06:35:08 +0000
Received: by outflank-mailman (input) for mailman id 265006;
 Fri, 04 Feb 2022 06:35:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBW-0008DW-GL
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:06 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96944681-8584-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 07:35:05 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id bu18so10750710lfb.5
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:05 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:04 -0800 (PST)
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
X-Inumbo-ID: 96944681-8584-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yxvQBdV5Q4sDH3B8Pg7aZNA92D9cHrIG2H+0rNtBrr0=;
        b=VOub8JoCp14IgAzRiaxfC0PpVpvjywdzU8mGd7JwFmaFwxGjA+BjTaDh8w1KVx/A3g
         90Eb5m7hpLa2lEdBvxJ14XNBekRwYoxtC5ofat8XoikToYiCq8V1sVYBoi5z/Okh6mEn
         Nk06PTuxB9YQKcTmHD27MeoSt/qzsD+LPmYpn/3uMCaRPv3UJTqYYHRR9Sbd1q5g/EF9
         pCRb8UJFdRl3S/E0lKNT0FqoCYzbAhS13E7tf9fgx7eV3VZEeo/nM2ZM4F95KKzhjxV6
         CdElOXTXSDVZc/tztA8uS0V40TcRi2i40CFeqO4mTEmTk1FdOl58riBFXboQYB8l430N
         VgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yxvQBdV5Q4sDH3B8Pg7aZNA92D9cHrIG2H+0rNtBrr0=;
        b=JFB+SR2byGIYjnQ+CGtjt3mCF0UouY4LLiQcKtwA9FfcvFnMDBlubTdH89HSv+i+Bn
         6BlFu87ROknkY1hlhIfNyXVD25MJ9MkvY0r61BqPVbiXsraA+iChfLp3UEuUrHGDWLrL
         l0r1i/rSark1q6oAsmqstuo6x5WzK79bRhVxXjjsJ5JOA+7HrLAfkdd+hS8a6YzWeocB
         /j+48VUU5+yTZvyH6V0NTWeHOkolaMPYaNeOhsq1+wnzGwLJ0/7nyXNQb61dBjJDg3ab
         QK9OZydq7Ez+xa9SzBj0CBpZL8uxj3CUQxq53JpqjLj7CmwniEInh6dp5vMlD32kAlc9
         E20A==
X-Gm-Message-State: AOAM532WJiHnNyCYwTdWx/7KnN+TprbaCgwdsZchW2LolBwZjkz6R3xz
	P+xB3MgBhrxLeArFjDKGgkbv931VOCs=
X-Google-Smtp-Source: ABdhPJzh7UX3hWPz+NmdK0JSfU2SwFsZ5hSTEX8nR+b06eIGCf0NrZK59mb8mm2x/wgotivf/NXbIA==
X-Received: by 2002:a05:6512:68a:: with SMTP id t10mr1337219lfe.520.1643956504487;
        Thu, 03 Feb 2022 22:35:04 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Date: Fri,  4 Feb 2022 08:34:49 +0200
Message-Id: <20220204063459.680961-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

This way the lock can be used (and in a few cases is used right away)
to check whether vpci is present, and removal can be performed while
holding the lock, in order to make sure there are no accesses to the
contents of the vpci struct.
Previously removal could race with vpci_read for example, since the
lock was dropped prior to freeing pdev->vpci.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
New in v5 of this series: this is an updated version of the patch published at
https://lore.kernel.org/xen-devel/20180717094830.54806-2-roger.pau@citrix.com/

Changes since v5:
 - vpci_lock in test_pdev is already initialized to false by default
 - introduce msix_{get|put} to protect former msix_find's result
 - add comments to vpci_{add|remove}_registers about pdev->vpci_lock must
   be held.
 - do not split code into vpci_remove_device_handlers_locked yet
 - move INIT_LIST_HEAD outside the locked region (Jan)
 - stripped out locking optimizations for vpci_{read|write} into a
   dedicated patch
Changes since v2:
 - fixed pdev->vpci = xzalloc(struct vpci); under spin_lock (Jan)
Changes since v1:
 - Assert that vpci_lock is locked in vpci_remove_device_locked.
 - Remove double newline.
 - Shrink critical section in vpci_{read/write}.
---
 tools/tests/vpci/emul.h       |  5 ++-
 tools/tests/vpci/main.c       |  3 +-
 xen/arch/x86/hvm/vmsi.c       |  8 ++---
 xen/drivers/passthrough/pci.c |  1 +
 xen/drivers/vpci/header.c     | 21 +++++++----
 xen/drivers/vpci/msi.c        | 11 ++++--
 xen/drivers/vpci/msix.c       | 39 ++++++++++++++++-----
 xen/drivers/vpci/vpci.c       | 65 ++++++++++++++++++++++-------------
 xen/include/xen/pci.h         |  1 +
 xen/include/xen/vpci.h        |  3 +-
 10 files changed, 106 insertions(+), 51 deletions(-)

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
index b9a0a6006bb9..3b86ed232eb1 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -23,7 +23,7 @@ static struct vpci vpci;
 
 const static struct domain d;
 
-const struct pci_dev test_pdev = {
+struct pci_dev test_pdev = {
     .vpci = &vpci,
 };
 
@@ -158,7 +158,6 @@ main(int argc, char **argv)
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
index e8b09d77d880..50dec3bb73d0 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -397,6 +397,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
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
index 846f1b8d7038..d1dbfc6e0ffd 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -138,7 +138,7 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, val);
 }
 
-static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
+static struct vpci_msix *msix_get(const struct domain *d, unsigned long addr)
 {
     struct vpci_msix *msix;
 
@@ -150,15 +150,29 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
         for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
             if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
                  VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
+            {
+                spin_lock(&msix->pdev->vpci_lock);
                 return msix;
+            }
     }
 
     return NULL;
 }
 
+static void msix_put(struct vpci_msix *msix)
+{
+    if ( !msix )
+        return;
+
+    spin_unlock(&msix->pdev->vpci_lock);
+}
+
 static int msix_accept(struct vcpu *v, unsigned long addr)
 {
-    return !!msix_find(v->domain, addr);
+    struct vpci_msix *msix = msix_get(v->domain, addr);
+
+    msix_put(msix);
+    return !!msix;
 }
 
 static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
@@ -186,7 +200,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
                      unsigned long *data)
 {
     const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
+    struct vpci_msix *msix = msix_get(d, addr);
     const struct vpci_msix_entry *entry;
     unsigned int offset;
 
@@ -196,7 +210,10 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
         return X86EMUL_RETRY;
 
     if ( !access_allowed(msix->pdev, addr, len) )
+    {
+        msix_put(msix);
         return X86EMUL_OKAY;
+    }
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -222,10 +239,10 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
             break;
         }
 
+        msix_put(msix);
         return X86EMUL_OKAY;
     }
 
-    spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
 
@@ -254,7 +271,8 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
         ASSERT_UNREACHABLE();
         break;
     }
-    spin_unlock(&msix->pdev->vpci->lock);
+
+    msix_put(msix);
 
     return X86EMUL_OKAY;
 }
@@ -263,7 +281,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
                       unsigned long data)
 {
     const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
+    struct vpci_msix *msix = msix_get(d, addr);
     struct vpci_msix_entry *entry;
     unsigned int offset;
 
@@ -271,7 +289,10 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
         return X86EMUL_RETRY;
 
     if ( !access_allowed(msix->pdev, addr, len) )
+    {
+        msix_put(msix);
         return X86EMUL_OKAY;
+    }
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
@@ -294,10 +315,11 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
             }
         }
 
+        msix_put(msix);
+
         return X86EMUL_OKAY;
     }
 
-    spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
 
@@ -370,7 +392,8 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
         ASSERT_UNREACHABLE();
         break;
     }
-    spin_unlock(&msix->pdev->vpci->lock);
+
+    msix_put(msix);
 
     return X86EMUL_OKAY;
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index fb0947179b79..cb2ababa28e3 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -35,12 +35,10 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
-void vpci_remove_device(struct pci_dev *pdev)
+static void vpci_remove_device_locked(struct pci_dev *pdev)
 {
-    if ( !has_vpci(pdev->domain) )
-        return;
+    ASSERT(spin_is_locked(&pdev->vpci_lock));
 
-    spin_lock(&pdev->vpci->lock);
     while ( !list_empty(&pdev->vpci->handlers) )
     {
         struct vpci_register *r = list_first_entry(&pdev->vpci->handlers,
@@ -50,15 +48,26 @@ void vpci_remove_device(struct pci_dev *pdev)
         list_del(&r->node);
         xfree(r);
     }
-    spin_unlock(&pdev->vpci->lock);
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
 
@@ -68,12 +77,14 @@ int vpci_add_handlers(struct pci_dev *pdev)
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
+
+    spin_lock(&pdev->vpci_lock);
+    pdev->vpci = vpci;
 
     for ( i = 0; i < NUM_VPCI_INIT; i++ )
     {
@@ -83,7 +94,8 @@ int vpci_add_handlers(struct pci_dev *pdev)
     }
 
     if ( rc )
-        vpci_remove_device(pdev);
+        vpci_remove_device_locked(pdev);
+    spin_unlock(&pdev->vpci_lock);
 
     return rc;
 }
@@ -129,6 +141,7 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
     return pci_conf_read32(pdev->sbdf, reg);
 }
 
+/* Must be called with pdev->vpci_lock held. */
 int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
                       vpci_write_t *write_handler, unsigned int offset,
                       unsigned int size, void *data)
@@ -152,8 +165,6 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     r->offset = offset;
     r->private = data;
 
-    spin_lock(&vpci->lock);
-
     /* The list of handlers must be kept sorted at all times. */
     list_for_each ( prev, &vpci->handlers )
     {
@@ -165,25 +176,23 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
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
 
+/* Must be called with pdev->vpci_lock held. */
 int vpci_remove_register(struct vpci *vpci, unsigned int offset,
                          unsigned int size)
 {
     const struct vpci_register r = { .offset = offset, .size = size };
     struct vpci_register *rm;
 
-    spin_lock(&vpci->lock);
     list_for_each_entry ( rm, &vpci->handlers, node )
     {
         int cmp = vpci_register_cmp(&r, rm);
@@ -195,14 +204,12 @@ int vpci_remove_register(struct vpci *vpci, unsigned int offset,
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
@@ -311,7 +318,7 @@ static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 {
     const struct domain *d = current->domain;
-    const struct pci_dev *pdev;
+    struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset = 0;
     uint32_t data = ~(uint32_t)0;
@@ -327,7 +334,12 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
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
@@ -370,7 +382,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
             break;
         ASSERT(data_offset < size);
     }
-    spin_unlock(&pdev->vpci->lock);
+    spin_unlock(&pdev->vpci_lock);
 
     if ( data_offset < size )
     {
@@ -414,7 +426,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data)
 {
     const struct domain *d = current->domain;
-    const struct pci_dev *pdev;
+    struct pci_dev *pdev;
     const struct vpci_register *r;
     unsigned int data_offset = 0;
     const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
@@ -440,7 +452,14 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
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
@@ -475,7 +494,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
             break;
         ASSERT(data_offset < size);
     }
-    spin_unlock(&pdev->vpci->lock);
+    spin_unlock(&pdev->vpci_lock);
 
     if ( data_offset < size )
         /* Tailing gap, write the remaining. */
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
index e8ac1eb39513..f2a7d82ce77b 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -31,7 +31,7 @@ int __must_check vpci_add_handlers(struct pci_dev *dev);
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
 
-/* Add/remove a register handler. */
+/* Add/remove a register handler. Must be called holding the vpci_lock. */
 int __must_check vpci_add_register(struct vpci *vpci,
                                    vpci_read_t *read_handler,
                                    vpci_write_t *write_handler,
@@ -60,7 +60,6 @@ bool __must_check vpci_process_pending(struct vcpu *v);
 struct vpci {
     /* List of vPCI handlers for a device. */
     struct list_head handlers;
-    spinlock_t lock;
 
 #ifdef __XEN__
     /* Hide the rest of the vpci struct from the user-space test harness. */
-- 
2.25.1


