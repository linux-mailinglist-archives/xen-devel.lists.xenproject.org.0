Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 675CD45D8B0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230877.399163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWs-0002cI-GS; Thu, 25 Nov 2021 11:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230877.399163; Thu, 25 Nov 2021 11:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWs-0002Uk-5p; Thu, 25 Nov 2021 11:03:02 +0000
Received: by outflank-mailman (input) for mailman id 230877;
 Thu, 25 Nov 2021 11:03:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCWq-0001Km-DK
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:00 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40673b5c-4ddf-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 12:02:59 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id n12so15409529lfe.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:02:59 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:02:58 -0800 (PST)
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
X-Inumbo-ID: 40673b5c-4ddf-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7kzoaEt6IOOYgPm1yLVSMOcEeyel0wJP73UNzPtLoAI=;
        b=J7c62W6SQ1rWnkjJWulpfBcyPUfKdE/+Jcyqho4A2lXAbkjJISdmAyJhVhmrqhFfCD
         sBlU8pcYaH7OZ3oZwgKGmXYkcGqlEb8mwLaIN1O94wzuLcxO6dmd1kzNp73BbKX4hHkg
         UEYLMLifl8f88XrGdvTNmzNYIBolNacU+y+F49X4YAlT89s9x+WxyIRh1U4Q4DE0i5CQ
         8c27FKLoYlVyoznJc2hLa5n9+ww6v6wGNIzr0lZS3sgt4wc8waC+f+afm9eV4pPuyFEw
         7ByiCf05YD+K6KrDSi3HPV6IvOkcWMSWch+h98S8tJJ6GGNN9Ctm2561xOC/MRyDA1gF
         /NIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7kzoaEt6IOOYgPm1yLVSMOcEeyel0wJP73UNzPtLoAI=;
        b=y0Ra6Muia4tgAZmiofolkv8udmaacozHAPutY4yID9f1nRIA3xddzTOaeYhD2PAfl1
         w9ZsLZ0YKOKqPHXLqsQDppOIYyY+YJ14uPkIVfZy/jv5xbaz8UG8C28DTtl5CeG7pM4p
         olRun4yMqsddZMBxJumjIbPbGbtMoHPwnfZNmJZLHvPaZ8gNgObse6Qp4WJgjMDqzZ69
         7aSQ4p2L1vj7AW3gW51FTNOb0kjMo4myo9fA1TIbPak7eE5MgZtGqNU06Wktugby1cPM
         ypB0UTee9CTFNMtklGWyzw5+DDmBIJQIcXksxtv+w9L7GftrQaE8cVfHJALLzxXAuVc3
         Y0CQ==
X-Gm-Message-State: AOAM530RnILgj7r71xySDKuVG++hWfROKaEqoAD3DFr+/Dlll3QUkkXH
	X8sekm0YzW/LCiUKNgQRzG4Y2ceov17eQ3Da
X-Google-Smtp-Source: ABdhPJwyW9PROrjGv8m7q1noHVv59lv+CBLisM5gGjx3LBOvlGDfmhbBF7oxhVinCIR6CAKyXD07SQ==
X-Received: by 2002:ac2:4828:: with SMTP id 8mr23352757lft.332.1637838178981;
        Thu, 25 Nov 2021 03:02:58 -0800 (PST)
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v5 04/14] vpci: cancel pending map/unmap on vpci removal
Date: Thu, 25 Nov 2021 13:02:41 +0200
Message-Id: <20211125110251.2877218-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a vPCI is removed for a PCI device it is possible that we have
scheduled a delayed work for map/unmap operations for that device.
For example, the following scenario can illustrate the problem:

pci_physdev_op
   pci_add_device
       init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
   iommu_add_device <- FAILS
   vpci_remove_device -> xfree(pdev->vpci)

leave_hypervisor_to_guest
   vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL

For the hardware domain we continue execution as the worse that
could happen is that MMIO mappings are left in place when the
device has been deassigned.

For unprivileged domains that get a failure in the middle of a vPCI
{un}map operation we need to destroy them, as we don't know in which
state the p2m is. This can only happen in vpci_process_pending for
DomUs as they won't be allowed to call pci_add_device.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Cc: Roger Pau Monné <roger.pau@citrix.com>
---
Since v4:
 - crash guest domain if map/unmap operation didn't succeed
 - re-work vpci cancel work to cancel work on all vCPUs
 - use new locking scheme with pdev->vpci_lock
New in v4

Fixes: 86dbcf6e30cb ("vpci: cancel pending map/unmap on vpci removal")

---

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/header.c | 49 ++++++++++++++++++++++++++++++---------
 xen/drivers/vpci/vpci.c   |  2 ++
 xen/include/xen/pci.h     |  5 ++++
 xen/include/xen/vpci.h    |  6 +++++
 4 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index bd23c0274d48..ba333fb2f9b0 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -131,7 +131,13 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
 
 bool vpci_process_pending(struct vcpu *v)
 {
-    if ( v->vpci.mem )
+    struct pci_dev *pdev = v->vpci.pdev;
+
+    if ( !pdev )
+        return false;
+
+    spin_lock(&pdev->vpci_lock);
+    if ( !pdev->vpci_cancel_pending && v->vpci.mem )
     {
         struct map_data data = {
             .d = v->domain,
@@ -140,32 +146,53 @@ bool vpci_process_pending(struct vcpu *v)
         int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
 
         if ( rc == -ERESTART )
+        {
+            spin_unlock(&pdev->vpci_lock);
             return true;
+        }
 
-        spin_lock(&v->vpci.pdev->vpci_lock);
-        if ( v->vpci.pdev->vpci )
+        if ( pdev->vpci )
             /* Disable memory decoding unconditionally on failure. */
-            modify_decoding(v->vpci.pdev,
+            modify_decoding(pdev,
                             rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
                             !rc && v->vpci.rom_only);
-        spin_unlock(&v->vpci.pdev->vpci_lock);
 
-        rangeset_destroy(v->vpci.mem);
-        v->vpci.mem = NULL;
         if ( rc )
+        {
             /*
              * FIXME: in case of failure remove the device from the domain.
              * Note that there might still be leftover mappings. While this is
-             * safe for Dom0, for DomUs the domain will likely need to be
-             * killed in order to avoid leaking stale p2m mappings on
-             * failure.
+             * safe for Dom0, for DomUs the domain needs to be killed in order
+             * to avoid leaking stale p2m mappings on failure.
              */
-            vpci_remove_device(v->vpci.pdev);
+            if ( is_hardware_domain(v->domain) )
+                vpci_remove_device_locked(pdev);
+            else
+                domain_crash(v->domain);
+        }
     }
+    spin_unlock(&pdev->vpci_lock);
 
     return false;
 }
 
+void vpci_cancel_pending_locked(struct pci_dev *pdev)
+{
+    struct vcpu *v;
+
+    ASSERT(spin_is_locked(&pdev->vpci_lock));
+
+    /* Cancel any pending work now on all vCPUs. */
+    for_each_vcpu( pdev->domain, v )
+    {
+        if ( v->vpci.mem && (v->vpci.pdev == pdev) )
+        {
+            rangeset_destroy(v->vpci.mem);
+            v->vpci.mem = NULL;
+        }
+    }
+}
+
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
                             struct rangeset *mem, uint16_t cmd)
 {
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index ceaac4516ff8..37103e207635 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -54,7 +54,9 @@ void vpci_remove_device_locked(struct pci_dev *pdev)
 {
     ASSERT(spin_is_locked(&pdev->vpci_lock));
 
+    pdev->vpci_cancel_pending = true;
     vpci_remove_device_handlers_locked(pdev);
+    vpci_cancel_pending_locked(pdev);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 3f60d6c6c6dd..52d302ac5f35 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -135,6 +135,11 @@ struct pci_dev {
 
     /* Data for vPCI. */
     spinlock_t vpci_lock;
+    /*
+     * Set if PCI device is being removed now and we need to cancel any
+     * pending map/unmap operations.
+     */
+    bool vpci_cancel_pending;
     struct vpci *vpci;
 };
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 8b22bdef11d0..cfff87e5801e 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -57,6 +57,7 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
  * should not run.
  */
 bool __must_check vpci_process_pending(struct vcpu *v);
+void vpci_cancel_pending_locked(struct pci_dev *pdev);
 
 struct vpci {
     /* List of vPCI handlers for a device. */
@@ -253,6 +254,11 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
     ASSERT_UNREACHABLE();
     return false;
 }
+
+static inline void vpci_cancel_pending_locked(struct pci_dev *pdev)
+{
+    ASSERT_UNREACHABLE();
+}
 #endif
 
 #endif
-- 
2.25.1


