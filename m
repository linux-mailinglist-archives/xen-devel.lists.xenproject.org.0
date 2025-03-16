Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F43A634F5
	for <lists+xen-devel@lfdr.de>; Sun, 16 Mar 2025 11:09:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915996.1321193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttkvW-0004d5-JI; Sun, 16 Mar 2025 10:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915996.1321193; Sun, 16 Mar 2025 10:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttkvW-0004Zs-GA; Sun, 16 Mar 2025 10:09:02 +0000
Received: by outflank-mailman (input) for mailman id 915996;
 Sun, 16 Mar 2025 10:09:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZWB=WD=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1ttkvU-0004ZD-Ve
 for xen-devel@lists.xenproject.org; Sun, 16 Mar 2025 10:09:00 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad50ce06-024e-11f0-9899-31a8f345e629;
 Sun, 16 Mar 2025 11:08:58 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso11677695e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 16 Mar 2025 03:08:58 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffc4173sm73909045e9.20.2025.03.16.03.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 03:08:57 -0700 (PDT)
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
X-Inumbo-ID: ad50ce06-024e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742119737; x=1742724537; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQLTn/XenpIx0boi8H9Y1QqNDqCLS4K8C+EwtPClR+I=;
        b=PiWX9Rr6sexLAOF40PNvULOXf9twiX3ACVpWXmObfMXGkBq+0od9SPazACosunpjSi
         Wk/qqSsVuH1ULBbxtdZmL1Kg2gDKhNn15z1mcqUoNeKlhfJCzn+EkK4aIGfiG3hbXkjW
         Xm6xJGKwyC/LE4iqJjBuF+t9IVTe5YAQfjnFRAqhi5svebK1bX3m6NjucYAl/A7VPcdA
         hj9drwd5mmUXUXY4b7U8YWxmBJQkdxa9Vo1ZKdroJWaBMCKpz9cSKyxoEsI657N6M2sq
         IwOMuOLAd1+OB/vEcbMcHQ9xrvNeAUy/dAf7YkT5dRKxvB3HoBWXcBNIA2be0HfQBA25
         uleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742119737; x=1742724537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQLTn/XenpIx0boi8H9Y1QqNDqCLS4K8C+EwtPClR+I=;
        b=ncWTMT5xlMEsrC3e4/hKm19grs5xSd5udFgLmg3KNst5KIfmYGpKiiMHLFskyfO3/N
         ww0jmJCa3MUMDYKXZunsaLnnVu7AxeCNaZkAYpy0EX6ilTkFnoIcIQanFqYvgji/aA2P
         WQIHCsfi97+Oz/idHUnhBBEL0r0TEyecQ9KC3y4gfTcry49qhYQe26+NbhXj2jYYYvJp
         SIzBBuUBE3AAAykBlFkhreycyeL6lFpGhmK0U/OpaZn/BIT6KeeIFbg9OW7fMpIn0oNd
         Dg/CfRRtP51HKOO8dhSiGxBsyTOjxUjaJgmRxlJMQyXBy7nRsHOCW9vcQe47TWS2Wjec
         7YBw==
X-Gm-Message-State: AOJu0Yxy4hlgg5D5aTAoPYrk75I+VxUN681UDFFbkAZ/Tk3hPcfSBihQ
	Es5Ph1jKSJ7mmBF+qR1ZwT8JpMMDp9jV4BCRBpxiksbkj8PAzUFWBchJNB6i
X-Gm-Gg: ASbGncs74WCWoz8TsEz6CRgVJS8A7820I4dk2kJqj2XF5v/qKNzGcaSm5oJfJq/tZjG
	vk3THUHqpc1iG5nPSnM22mYPjrjFijqf3h2DhOl1ok6/MIZtA9XfiEqJw7KECObJ+g+ZBmbpFZF
	Y6b/UP8WoiMVN/gytY1iZ87ieA9r7P2nCpSm359qcFXCvqeQJ7X0YFcoo+oRdeJNKu4xqZkJGU2
	qJyU5idijvu/2tUMs+Acq7oi3NwHtv6okvxaF25WvozjbVrmgW21xhy0rukWoUD8Jh3Hw8zwiVR
	u1qmjDy77a93ISCveRcgFhjR0kG3iMoQ642iFaH5JbLY1fuaJzVS83uoeN4l7sU53WnWBqBTCc7
	IbRZtvhPUeLCgjOGeUFj4T1pYnXjE0XqcvHkXzc8bvQpE
X-Google-Smtp-Source: AGHT+IGWulxFYD5zs1t2I9sftuvJCisLqiiX2mMGAKhh8yZDRX72uVzJE3LerTkhP8odzl82fAxtLw==
X-Received: by 2002:a05:600c:46c8:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43d1ec6946cmr102089345e9.7.1742119737341;
        Sun, 16 Mar 2025 03:08:57 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <sultanovandriy@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/3] drivers: Change amd_iommu struct to contain pci_sbdf_t, simplify code
Date: Sun, 16 Mar 2025 10:08:49 +0000
Message-ID: <73295790a1df8f4f1406a8e86e7c81a98cb1d3e6.1742063500.git.sultanovandriy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1742063500.git.sultanovandriy@gmail.com>
References: <cover.1742063500.git.sultanovandriy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following on from 250d87dc3ff9 ("x86/msi: Change __msi_set_enable() to
take pci_sbdf_t"), struct amd_iommu has its seg and bdf fields
backwards with relation to pci_sbdf_t. Swap them around, and simplify the
expressions regenerating an sbdf_t from seg+bdf.

Bloat-o-meter reports:
add/remove: 0/0 grow/shrink: 6/11 up/down: 135/-327 (-192)
Function                                     old     new   delta
_einittext                                 22028   22092     +64
amd_iommu_prepare                            853     897     +44
_hvm_dpci_msi_eoi                            157     168     +11
__mon_lengths                               2928    2936      +8
_invalidate_all_devices                      133     138      +5
amd_iommu_get_reserved_device_memory         521     524      +3
amd_iommu_domain_destroy                      46      43      -3
build_info                                   752     744      -8
amd_iommu_add_device                         856     844     -12
amd_iommu_msi_enable                          33      20     -13
update_intremap_entry_from_msi_msg           879     859     -20
amd_iommu_get_supported_ivhd_type             86      54     -32
amd_iommu_detect_one_acpi                    918     886     -32
iterate_ivrs_mappings                        169     129     -40
flush_command_buffer                         460     417     -43
set_iommu_interrupt_handler                  421     377     -44
enable_iommu                                1745    1665     -80

Resolves: https://gitlab.com/xen-project/xen/-/issues/198

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>

---
Changes in V2:
* Split single commit into several patches
* Added the commit title of the referenced patch
* Dropped brackets around &(iommu->sbdf) and &(sbdf)
---
 xen/drivers/passthrough/amd/iommu.h        | 10 ++++++++--
 xen/drivers/passthrough/amd/iommu_cmd.c    |  4 ++--
 xen/drivers/passthrough/amd/iommu_detect.c |  2 +-
 xen/drivers/passthrough/amd/iommu_init.c   | 23 ++++++++++------------
 xen/drivers/passthrough/amd/iommu_map.c    |  2 +-
 5 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 00e81b4b2a..a30c8c97ea 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -77,8 +77,14 @@ struct amd_iommu {
     struct list_head list;
     spinlock_t lock; /* protect iommu */
 
-    u16 seg;
-    u16 bdf;
+    union {
+        struct {
+            uint16_t bdf;
+            uint16_t seg;
+        };
+        pci_sbdf_t sbdf;
+    };
+
     struct msi_desc msi;
 
     u16 cap_offset;
diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index 83c525b84f..d7162e36d6 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -85,7 +85,7 @@ static void flush_command_buffer(struct amd_iommu *iommu,
             threshold |= threshold << 1;
             printk(XENLOG_WARNING
                    "AMD IOMMU %pp: %scompletion wait taking too long\n",
-                   &PCI_SBDF(iommu->seg, iommu->bdf),
+                   &iommu->sbdf,
                    timeout_base ? "iotlb " : "");
             timeout = 0;
         }
@@ -95,7 +95,7 @@ static void flush_command_buffer(struct amd_iommu *iommu,
     if ( !timeout )
         printk(XENLOG_WARNING
                "AMD IOMMU %pp: %scompletion wait took %lums\n",
-               &PCI_SBDF(iommu->seg, iommu->bdf),
+               &iommu->sbdf,
                timeout_base ? "iotlb " : "",
                (NOW() - start) / 10000000);
 }
diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passthrough/amd/iommu_detect.c
index cede44e651..8567da2b24 100644
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -231,7 +231,7 @@ int __init amd_iommu_detect_one_acpi(
     rt = pci_ro_device(iommu->seg, bus, PCI_DEVFN(dev, func));
     if ( rt )
         printk(XENLOG_ERR "Could not mark config space of %pp read-only (%d)\n",
-               &PCI_SBDF(iommu->seg, iommu->bdf), rt);
+               &iommu->sbdf, rt);
 
     list_add_tail(&iommu->list, &amd_iommu_head);
     rt = 0;
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index bb25b55c85..ea930426be 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -409,9 +409,7 @@ static void iommu_reset_log(struct amd_iommu *iommu,
 
 static void amd_iommu_msi_enable(struct amd_iommu *iommu, int flag)
 {
-    pci_sbdf_t sbdf = { .seg = iommu->seg, .bdf = iommu->bdf };
-
-    __msi_set_enable(sbdf, iommu->msi.msi_attrib.pos, flag);
+    __msi_set_enable(iommu->sbdf, iommu->msi.msi_attrib.pos, flag);
 }
 
 static void cf_check iommu_msi_unmask(struct irq_desc *desc)
@@ -752,12 +750,11 @@ static bool __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
     }
 
     pcidevs_lock();
-    iommu->msi.dev = pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bdf));
+    iommu->msi.dev = pci_get_pdev(NULL, iommu->sbdf);
     pcidevs_unlock();
     if ( !iommu->msi.dev )
     {
-        AMD_IOMMU_WARN("no pdev for %pp\n",
-                       &PCI_SBDF(iommu->seg, iommu->bdf));
+        AMD_IOMMU_WARN("no pdev for %pp\n", &iommu->sbdf);
         return 0;
     }
 
@@ -779,7 +776,7 @@ static bool __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
         hw_irq_controller *handler;
         u16 control;
 
-        control = pci_conf_read16(PCI_SBDF(iommu->seg, iommu->bdf),
+        control = pci_conf_read16(iommu->sbdf,
                                   iommu->msi.msi_attrib.pos + PCI_MSI_FLAGS);
 
         iommu->msi.msi.nvec = 1;
@@ -843,22 +840,22 @@ static void amd_iommu_erratum_746_workaround(struct amd_iommu *iommu)
          (boot_cpu_data.x86_model > 0x1f) )
         return;
 
-    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
-    value = pci_conf_read32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4);
+    pci_conf_write32(iommu->sbdf, 0xf0, 0x90);
+    value = pci_conf_read32(iommu->sbdf, 0xf4);
 
     if ( value & (1 << 2) )
         return;
 
     /* Select NB indirect register 0x90 and enable writing */
-    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90 | (1 << 8));
+    pci_conf_write32(iommu->sbdf, 0xf0, 0x90 | (1 << 8));
 
-    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4, value | (1 << 2));
+    pci_conf_write32(iommu->sbdf, 0xf4, value | (1 << 2));
     printk(XENLOG_INFO
            "AMD-Vi: Applying erratum 746 workaround for IOMMU at %pp\n",
-           &PCI_SBDF(iommu->seg, iommu->bdf));
+           &iommu->sbdf);
 
     /* Clear the enable writing bit */
-    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
+    pci_conf_write32(iommu->sbdf, 0xf0, 0x90);
 }
 
 static void enable_iommu(struct amd_iommu *iommu)
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index dde393645a..ea68edc0f2 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -730,7 +730,7 @@ int cf_check amd_iommu_get_reserved_device_memory(
              * the same alias ID.
              */
             if ( bdf != req && ivrs_mappings[req].iommu &&
-                 func(0, 0, PCI_SBDF(seg, req).sbdf, ctxt) )
+                 func(0, 0, sbdf.sbdf, ctxt) )
                 continue;
 
             if ( global == pending )
-- 
2.48.1


