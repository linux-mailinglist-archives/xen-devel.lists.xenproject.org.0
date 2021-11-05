Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445A6445FEF
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222087.384130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9S-0000ML-5P; Fri, 05 Nov 2021 06:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222087.384130; Fri, 05 Nov 2021 06:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9S-0000KE-1c; Fri, 05 Nov 2021 06:56:38 +0000
Received: by outflank-mailman (input) for mailman id 222087;
 Fri, 05 Nov 2021 06:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9Q-0008NQ-Cl
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:36 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83fe1709-3e05-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:56:35 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id v11so27203983edc.9
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:35 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:34 -0700 (PDT)
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
X-Inumbo-ID: 83fe1709-3e05-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6lI/emOWTuirK6y60vvPuIerMn7oLAhUBrzibAoZIaY=;
        b=WCrBBXgcHf+gNUzvLec/FGEN0I45bKwR7dhe/BEj3ewFeldoCRSnISCh/7BsOUw3EM
         z/AyEABFXCyhXDZli/d3jPsKiKxWW6KseG/9ZmImy7j7UX1PULDxn1xTTU7nDKSEclZm
         n3MUlfXe2cXlZiQ7upfmT647hQ2GqlsADdm0+Gq8+KY34i+ge+i5b8os1r9/KtsHphB0
         yrcINSdO9pQwGCc+2Hy8esbXiBTVdEUTH75khVXCHVqaXYjtOWaV0VsYcs4Qt5JHa9lS
         b0qNKzb5OqGWm4kDfQS1EIO86SoYQRoSbXuU2n4/WZaw7QJr1C04crS1O3C9MPrJtCg0
         EfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6lI/emOWTuirK6y60vvPuIerMn7oLAhUBrzibAoZIaY=;
        b=hsRIVW3EdS+8RZ/5AD2PK5CuNEgzIqbh0M1hS76ZNswfP7bQrprFotz7SHGbMzQT9x
         SnyvWRSvdPH8QlJ77z9L7gQQiSUbzt9CH2XWxkkYOv5QHuYGhCLGTdsbTgaWex+eOrxg
         q3h2PgX327ByVcF3wUPo2XXrOJ2Ruo7O5wdXmFZ+hRgDk6HNwnCjCrBcU5kqwitAiWBS
         jeqvIw8+UFbr8Sed5i9lmGx9OfmHTLKi+Nwi6vhZlVG40QkXSL9gThn8pNhBwGgkS0SI
         RvniRrt+kFDNM2kUSNYM8CkbbbhohFwGkHyJuj37l0p3A3g9lOwCihLk43pWXzjcWtsb
         XIKg==
X-Gm-Message-State: AOAM5303A3T+DT1bZq3VN/k+S2V7MhctbZEQKuFinyXoHNf0hSlXiFUB
	Zi+7/DZ8ryzAQTumtxiAtAmxb8/dTUJArA==
X-Google-Smtp-Source: ABdhPJymCd9sLsIV7Rr3M2VzY0Yo2fETPycY1rmqoGvzy38X4VgIs53DsYMsZFc/OMd+LldvIKHN6A==
X-Received: by 2002:a17:906:730c:: with SMTP id di12mr66471844ejc.184.1636095394698;
        Thu, 04 Nov 2021 23:56:34 -0700 (PDT)
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
Subject: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Date: Fri,  5 Nov 2021 08:56:20 +0200
Message-Id: <20211105065629.940943-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
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
device has been deassigned

For unprivileged domains that get a failure in the middle of a vPCI
{un}map operation we need to destroy them, as we don't know in which
state the p2m is. This can only happen in vpci_process_pending for
DomUs as they won't be allowed to call pci_add_device.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Cc: Roger Pau Monné <roger.pau@citrix.com>

New in v4
---
 xen/drivers/vpci/header.c | 15 +++++++++++++--
 xen/drivers/vpci/vpci.c   |  2 ++
 xen/include/xen/vpci.h    |  6 ++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 40ff79c33f8f..ef538386e95d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -149,8 +149,7 @@ bool vpci_process_pending(struct vcpu *v)
                         !rc && v->vpci.rom_only);
         spin_unlock(&v->vpci.pdev->vpci->lock);
 
-        rangeset_destroy(v->vpci.mem);
-        v->vpci.mem = NULL;
+        vpci_cancel_pending(v->vpci.pdev);
         if ( rc )
             /*
              * FIXME: in case of failure remove the device from the domain.
@@ -165,6 +164,18 @@ bool vpci_process_pending(struct vcpu *v)
     return false;
 }
 
+void vpci_cancel_pending(const struct pci_dev *pdev)
+{
+    struct vcpu *v = current;
+
+    /* Cancel any pending work now. */
+    if ( v->vpci.mem && v->vpci.pdev == pdev)
+    {
+        rangeset_destroy(v->vpci.mem);
+        v->vpci.mem = NULL;
+    }
+}
+
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
                             struct rangeset *mem, uint16_t cmd)
 {
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 657697fe3406..4e24956419aa 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -51,6 +51,8 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
+
+    vpci_cancel_pending(pdev);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 3f32de9d7eb3..609d6383b252 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -56,6 +56,7 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
  * should not run.
  */
 bool __must_check vpci_process_pending(struct vcpu *v);
+void vpci_cancel_pending(const struct pci_dev *pdev);
 
 struct vpci {
     /* List of vPCI handlers for a device. */
@@ -252,6 +253,11 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
     ASSERT_UNREACHABLE();
     return false;
 }
+
+static inline void vpci_cancel_pending(const struct pci_dev *pdev)
+{
+    ASSERT_UNREACHABLE();
+}
 #endif
 
 #endif
-- 
2.25.1


