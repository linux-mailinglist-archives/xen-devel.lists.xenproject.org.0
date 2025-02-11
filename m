Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A54A30F01
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 16:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885644.1295456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thrlJ-0004hz-Ig; Tue, 11 Feb 2025 15:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885644.1295456; Tue, 11 Feb 2025 15:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thrlJ-0004ez-Fq; Tue, 11 Feb 2025 15:01:21 +0000
Received: by outflank-mailman (input) for mailman id 885644;
 Tue, 11 Feb 2025 15:01:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thrlI-0004et-Pf
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 15:01:20 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05383c1a-e889-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 16:01:07 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-21f5268cf50so61107295ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 07:01:07 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f368c07f8sm96797105ad.236.2025.02.11.07.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 07:01:05 -0800 (PST)
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
X-Inumbo-ID: 05383c1a-e889-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739286066; x=1739890866; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBU9ElzNzhO9J7X2Twi8JupWoAQA+sxVj0YFzigvEQw=;
        b=bJHvz7FP5I8h2AWwTvqRtd2BH/mFi1hYUh5HYn2VjrC90eZKuP6HiNzcY7XxW4YSI+
         hwVL0euJ4duREfoErfL2kutP3oRrREv89EXtPehjQbXIaAB7U6yphNUrKtefs9R30bzb
         uwC1fFxXTSUWDHVOrsQU0KXEI9i4IPKyQw8OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286066; x=1739890866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBU9ElzNzhO9J7X2Twi8JupWoAQA+sxVj0YFzigvEQw=;
        b=ld3945sHqHraP2M49fV5p2mmnKTEn7nxyWtQ6sDqXDVXAUkZS7Jw3twZfqfPsJN/U1
         GvRJwWY24xBFi5H6yxWaUQEpRZThlsKeirckn+BBzxipLPOqIPck0VXpHVBjf490+Vtk
         r1HA748wphCz8KI+WE9f42U4njvPMq5WS/Oq8ofJ11mLKmXRORASLebRCltXAQOU+H7c
         eKK3BgrVcVkyVfCDdsDddjaWsYVEI3YJ9XvsMyIxyo7//aF5m6TcqHREgTYj9dgciEzA
         gWmaSjmQPveNsaiJ0gn7S2kkwb3iv8Dz3b3MAynyjkrAyLKTw4fWIhxpjFTxahnaR8xH
         GMYg==
X-Gm-Message-State: AOJu0YwuYJtojPbt0KNdV4AHM+lvCdLEmho9RyG7GZ94vWEZo2cEBVCu
	0w9cuC9Z1r286DtCYcAVLZIn3CTtb12LwMrQXGcYVIWmRcqSFhNh2hGZCF04RU+nvZthF/85pAp
	7
X-Gm-Gg: ASbGncvkibC9up8C86UGnZsc+zJXPK2WBxE1mkYAgfE0CewoFDlWTDbvC5QQtFrPfl9
	XKFMNw9ir+8mxmb5DWAyCzxL23xHWw7x3/W6F7gfxHz/c9M56Joa2RoTeLNuaOdGUq3Z8mgUYer
	owo3CIjRc7Hix5ioy91pBdE7tUxA6qupT8Kpw1daJjqrL34mBh4+iXRmRq7BtKiLoHA26DrZ4B2
	OG9qhvl190h4dk5vhObe+G8mgxwh80Gk7qQ35zvkFk3V4tlF43/PJ7y16VT5sHSRqwHmPt87rnW
	KcmzOnC7tyBibIG9z/daEoT9FQ==
X-Google-Smtp-Source: AGHT+IHxIspOIBDVcKltAoH2X0/wA514ZrPDkYg2z4r6qN0fYkck0CYNgPnor+vCN5Q7DWA4tTKiVw==
X-Received: by 2002:a17:902:e5d1:b0:215:9ea1:e95e with SMTP id d9443c01a7336-21fb641be71mr46234765ad.13.1739286065642;
        Tue, 11 Feb 2025 07:01:05 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 v4 4/5] x86/pci: disable MSI(-X) on all devices at shutdown
Date: Tue, 11 Feb 2025 15:48:13 +0100
Message-ID: <20250211144813.89137-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250211110209.86974-5-roger.pau@citrix.com>
References: <20250211110209.86974-5-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Attempt to disable MSI(-X) capabilities on all PCI devices know by Xen at
shutdown.  Doing such disabling should facilitate kexec chained kernel from
booting more reliably, as device MSI(-X) interrupt generation should be
quiesced.

Only attempt to disable MSI(-X) on all devices in the crash context if the
PCI lock is not taken, otherwise the PCI device list could be in an
inconsistent state.  This requires introducing a new pcidevs_trylock()
helper to check whether the lock is currently taken.

Disabling MSI(-X) should prevent "Receive accept error" being raised as a
result of non-disabled interrupts targeting offline CPUs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Introduce and use pcidevs_trylock().
 - Remove assert from pci_iterate_devices().

Changes since v2:
 - Disable MSI(-X) ahead of IO-APIC disabling.
 - Duplicate and expand comment about pci_iterate_devices() in function
   declaration.
 - Add assert interrupts are disabled in pci_iterate_devices().
 - Only walk PCI device list on crash context if the pci lock is not taken.

Changes since v1:
 - Split from bigger patch.
 - Iterate over all devices, even if the handler returns failure.
---
 xen/arch/x86/crash.c           | 10 ++++++++
 xen/arch/x86/include/asm/msi.h |  1 +
 xen/arch/x86/msi.c             | 18 +++++++++++++++
 xen/arch/x86/smp.c             |  1 +
 xen/drivers/passthrough/pci.c  | 42 ++++++++++++++++++++++++++++++++++
 xen/include/xen/pci.h          | 12 ++++++++++
 6 files changed, 84 insertions(+)

diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index a789416ca3ae..22b1121d7a40 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -175,6 +175,16 @@ static void nmi_shootdown_cpus(void)
          */
         x2apic_enabled = (current_local_apic_mode() == APIC_MODE_X2APIC);
 
+        if ( pcidevs_trylock() )
+        {
+            /*
+             * Assume the PCI device list to be in a consistent state if the
+             * lock is not held when the crash happened.
+             */
+            pci_disable_msi_all();
+            pcidevs_unlock();
+        }
+
         disable_IO_APIC();
         hpet_disable();
     }
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 63adb19820e8..7f9e531f73e6 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -86,6 +86,7 @@ extern int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
 extern void pci_disable_msi(struct msi_desc *msi_desc);
 extern int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off);
 extern void pci_cleanup_msi(struct pci_dev *pdev);
+extern void pci_disable_msi_all(void);
 extern int setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc);
 extern int __setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc,
                            hw_irq_controller *handler);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index e2360579deda..c9fe942c46f3 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1248,6 +1248,24 @@ void pci_cleanup_msi(struct pci_dev *pdev)
     msi_free_irqs(pdev);
 }
 
+static int cf_check disable_msi(struct pci_dev *pdev, void *arg)
+{
+    msi_set_enable(pdev, 0);
+    msix_set_enable(pdev, 0);
+
+    return 0;
+}
+
+/* Disable MSI and/or MSI-X on all devices known by Xen. */
+void pci_disable_msi_all(void)
+{
+    int rc = pci_iterate_devices(disable_msi, NULL);
+
+    if ( rc )
+        printk(XENLOG_ERR
+               "Failed to disable MSI(-X) on some devices: %d\n", rc);
+}
+
 int pci_reset_msix_state(struct pci_dev *pdev)
 {
     unsigned int pos = pdev->msix_pos;
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 4d29a09a9a95..28bc041e03a9 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -374,6 +374,7 @@ void smp_send_stop(void)
         smp_call_function(stop_this_cpu, &stop_aps, 0);
 
     local_irq_disable();
+    pci_disable_msi_all();
     disable_IO_APIC();
     hpet_disable();
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index f398c3aa65dc..e1a09344df25 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -68,6 +68,11 @@ bool pcidevs_locked(void)
     return rspin_is_locked(&_pcidevs_lock);
 }
 
+bool pcidevs_trylock_unsafe(void)
+{
+    return _rspin_trylock(&_pcidevs_lock);
+}
+
 static RADIX_TREE(pci_segments);
 
 static inline struct pci_seg *get_pseg(u16 seg)
@@ -1802,6 +1807,43 @@ int iommu_do_pci_domctl(
     return ret;
 }
 
+struct segment_iter {
+    int (*handler)(struct pci_dev *pdev, void *arg);
+    void *arg;
+    int rc;
+};
+
+static int cf_check iterate_all(struct pci_seg *pseg, void *arg)
+{
+    struct segment_iter *iter = arg;
+    struct pci_dev *pdev;
+
+    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
+    {
+        int rc = iter->handler(pdev, iter->arg);
+
+        if ( !iter->rc )
+            iter->rc = rc;
+    }
+
+    return 0;
+}
+
+/*
+ * Iterate without locking or preemption over all PCI devices known by Xen.
+ * Can be called with interrupts disabled.
+ */
+int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
+                        void *arg)
+{
+    struct segment_iter iter = {
+        .handler = handler,
+        .arg = arg,
+    };
+
+    return pci_segments_iterate(iterate_all, &iter) ?: iter.rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index f784e9116059..4f12bcf089ac 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -190,6 +190,11 @@ static always_inline void pcidevs_lock(void)
 }
 void pcidevs_unlock(void);
 bool __must_check pcidevs_locked(void);
+bool pcidevs_trylock_unsafe(void);
+static always_inline bool pcidevs_trylock(void)
+{
+    return lock_evaluate_nospec(pcidevs_trylock_unsafe());
+}
 
 #ifndef NDEBUG
 /*
@@ -226,6 +231,13 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
 
+/*
+ * Iterate without locking or preemption over all PCI devices known by Xen.
+ * Can be called with interrupts disabled.
+ */
+int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
+                        void *arg);
+
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);
 uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg);
 uint32_t pci_conf_read32(pci_sbdf_t sbdf, unsigned int reg);
-- 
2.46.0


