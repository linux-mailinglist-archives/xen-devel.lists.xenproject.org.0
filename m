Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A994B8C39
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 16:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274218.469626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKM2l-00011I-B2; Wed, 16 Feb 2022 15:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274218.469626; Wed, 16 Feb 2022 15:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKM2l-0000yQ-5E; Wed, 16 Feb 2022 15:16:35 +0000
Received: by outflank-mailman (input) for mailman id 274218;
 Wed, 16 Feb 2022 15:16:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=miT7=S7=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nKM2j-0000ia-Gd
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 15:16:33 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c6fe179-8f3b-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 16:16:32 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id f37so4414142lfv.8
 for <xen-devel@lists.xenproject.org>; Wed, 16 Feb 2022 07:16:32 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id bt2sm3082357lfb.93.2022.02.16.07.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 07:16:31 -0800 (PST)
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
X-Inumbo-ID: 6c6fe179-8f3b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZBCrQj2lwFzNomdp2NiauAmt+Mty9vunRDBJMAz0cCY=;
        b=Ai0VY8bkdyCx673J/QNboO6zC0ztb8oEypvUaqAWMKiHZpZ9kZHNhnNoBv8K9GhR0b
         u2CHNI0W5hTY44LcHYvRb2l+jxZdUI6Dcn4lpThT+katfuO2R5yhvO/npS0hdM3MaTrM
         zq62uqAs1yET2T44+O5Q/vdV1oCdyv3RF4XlHnlZKeP6SxWxiKTJgV6l7HmfgMpmNhJe
         bu1+i+0JJ/g1CQHaOIbj4fTVGndgvOSIcpqmn3L2o3qyI+cwZWoDO1W4R0WsWb1SLLKh
         Ot2DbmXAWjtWXXyf5u/+3GKuMEhkY1pPAMR6S6QHGOD34qkgMC2xwfzoEQ6N4lTLQsLy
         TU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZBCrQj2lwFzNomdp2NiauAmt+Mty9vunRDBJMAz0cCY=;
        b=GjfqcMNYVq1EE0k5rJBFKupfxph1QQiz1fv0vL1xO5jIjXvI0n0MOYbGRbSDissCLb
         nM3FVyXLM6LZ6NEkya6Hl6ZTl/ukCY2fhnayc/xrWTiNjNTCcCLxkbO81HT0f0TZt5L1
         ip9XG9E8BXkz4sbXUb6PD3zmwKCByOlauYdsVDQcHVu67vAjrRpogU3NoQvlrw7gBoCo
         0Pd7JPBsPHBCI0EiWRObJBi2IOmOGEhBoDse8I5DgYfI/YqCQ9miaHtLDB9RMLwyOicc
         2otBUKZvEiGoWqN2X6APNjEvmP/p9MG4V1eqIYukcrDjDzhkWLgvyil9BlMB3AUUo1LD
         R1lg==
X-Gm-Message-State: AOAM533Qv1+gqwonshQZD6p3h5pKYoJe/TK4+kjtngnAZ57kIAtqv8F7
	qfdswxQmOrN9Rh6xEV+szmEGKFPfdTg=
X-Google-Smtp-Source: ABdhPJwS/eNqTVLggc40y8HHbv3uipeAY422byje3hbaUB099wArdAJ5Hix4jdXxi9QwZIcucwHrgw==
X-Received: by 2002:a05:6512:220e:b0:439:cb39:cb83 with SMTP id h14-20020a056512220e00b00439cb39cb83mr2258047lfu.551.1645024591977;
        Wed, 16 Feb 2022 07:16:31 -0800 (PST)
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
Subject: [PATCH 1/4] pci: add rwlock to pcidevs_lock machinery
Date: Wed, 16 Feb 2022 17:16:25 +0200
Message-Id: <20220216151628.1610777-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216151628.1610777-1-andr2000@gmail.com>
References: <20220216151628.1610777-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Currently pcidevs lock is a global recursive spinlock which is fine for
the existing use cases. It is used to both protect pdev instances
themselves from being removed while in use and to make sure the update
of the relevant pdev properties is synchronized.

Moving towards vPCI is used for guests this becomes problematic in terms
of lock contention. For example, during vpci_{read|write} the access to
pdev must be protected to prevent pdev disappearing under our feet.
This needs to be done with the help of pcidevs_{lock|unlock}.
On the other hand it is highly undesirable to lock all other pdev accesses
which only use pdevs in read mode, e.g. those which do not remove or
add pdevs.

For the above reasons introduce a read/write lock which will help
preventing locking contentions between pdev readers and writers:
- make pci_{add|remove}_device and setup_hwdom_pci_devices use the
  new write lock
- keep all the rest using the existing API (pcidevs_{lock|unlock},
  but extend the later to also acquire the rwlock in read mode.

This is in preparation for vPCI to be used for guests.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/passthrough/pci.c | 45 ++++++++++++++++++++++++++---------
 xen/include/xen/pci.h         |  4 ++++
 2 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index e8b09d77d880..2a0d3d37a69f 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -51,20 +51,38 @@ struct pci_seg {
 };
 
 static spinlock_t _pcidevs_lock = SPIN_LOCK_UNLOCKED;
+static DEFINE_RWLOCK(_pcidevs_rwlock);
 
 void pcidevs_lock(void)
 {
+    read_lock(&_pcidevs_rwlock);
     spin_lock_recursive(&_pcidevs_lock);
 }
 
 void pcidevs_unlock(void)
 {
     spin_unlock_recursive(&_pcidevs_lock);
+    read_unlock(&_pcidevs_rwlock);
 }
 
 bool_t pcidevs_locked(void)
 {
-    return !!spin_is_locked(&_pcidevs_lock);
+    return !!spin_is_locked(&_pcidevs_lock) || pcidevs_write_locked();
+}
+
+void pcidevs_write_lock(void)
+{
+    write_lock(&_pcidevs_rwlock);
+}
+
+void pcidevs_write_unlock(void)
+{
+    write_unlock(&_pcidevs_rwlock);
+}
+
+bool pcidevs_write_locked(void)
+{
+    return !!rw_is_write_locked(&_pcidevs_rwlock);
 }
 
 static struct radix_tree_root pci_segments;
@@ -758,7 +776,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
 
     ret = -ENOMEM;
 
-    pcidevs_lock();
+    pcidevs_write_lock();
     pseg = alloc_pseg(seg);
     if ( !pseg )
         goto out;
@@ -854,7 +872,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     pci_enable_acs(pdev);
 
 out:
-    pcidevs_unlock();
+    pcidevs_write_unlock();
     if ( !ret )
     {
         printk(XENLOG_DEBUG "PCI add %s %pp\n", pdev_type,  &pdev->sbdf);
@@ -885,7 +903,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     if ( !pseg )
         return -ENODEV;
 
-    pcidevs_lock();
+    pcidevs_write_lock();
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
         {
@@ -899,7 +917,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
             break;
         }
 
-    pcidevs_unlock();
+    pcidevs_write_unlock();
     return ret;
 }
 
@@ -1176,6 +1194,11 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
                ctxt->d->domain_id, err);
 }
 
+/*
+ * It's safe to drop and re-acquire the write lock in this context without
+ * risking pdev disappearing because devices cannot be removed until the
+ * initial domain has been started.
+ */
 static int __hwdom_init _setup_hwdom_pci_devices(struct pci_seg *pseg, void *arg)
 {
     struct setup_hwdom *ctxt = arg;
@@ -1208,17 +1231,17 @@ static int __hwdom_init _setup_hwdom_pci_devices(struct pci_seg *pseg, void *arg
 
             if ( iommu_verbose )
             {
-                pcidevs_unlock();
+                pcidevs_write_unlock();
                 process_pending_softirqs();
-                pcidevs_lock();
+                pcidevs_write_lock();
             }
         }
 
         if ( !iommu_verbose )
         {
-            pcidevs_unlock();
+            pcidevs_write_unlock();
             process_pending_softirqs();
-            pcidevs_lock();
+            pcidevs_write_lock();
         }
     }
 
@@ -1230,9 +1253,9 @@ void __hwdom_init setup_hwdom_pci_devices(
 {
     struct setup_hwdom ctxt = { .d = d, .handler = handler };
 
-    pcidevs_lock();
+    pcidevs_write_lock();
     pci_segments_iterate(_setup_hwdom_pci_devices, &ctxt);
-    pcidevs_unlock();
+    pcidevs_write_unlock();
 }
 
 /* APEI not supported on ARM yet. */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index b6d7e454f814..e814d9542bfc 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -152,6 +152,10 @@ void pcidevs_lock(void);
 void pcidevs_unlock(void);
 bool_t __must_check pcidevs_locked(void);
 
+void pcidevs_write_lock(void);
+void pcidevs_write_unlock(void);
+bool __must_check pcidevs_write_locked(void);
+
 bool_t pci_known_segment(u16 seg);
 bool_t pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
 int scan_pci_devices(void);
-- 
2.25.1


