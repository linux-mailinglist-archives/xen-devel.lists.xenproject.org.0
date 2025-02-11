Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E91A30958
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:02:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885349.1295184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho2C-0006C9-Md; Tue, 11 Feb 2025 11:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885349.1295184; Tue, 11 Feb 2025 11:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho2C-00069j-Hy; Tue, 11 Feb 2025 11:02:32 +0000
Received: by outflank-mailman (input) for mailman id 885349;
 Tue, 11 Feb 2025 11:02:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tho2A-0005b1-B7
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:02:30 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeea617c-e867-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 12:02:28 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab771575040so1043583266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 03:02:28 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7b7f98188sm473048166b.76.2025.02.11.03.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:02:27 -0800 (PST)
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
X-Inumbo-ID: aeea617c-e867-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739271748; x=1739876548; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDaxzJFjL9hpy0bIqZLAOYXowlYPXeqf+Vn+cdNImxU=;
        b=oOBYP8HwT1zDQ9k+1pbzp8t+xESGA9ggcbIVjxaAgxH3Cux8sqAZWZuvkzoa6jVP5I
         vwVtQD7yznf4gw8WEs8TX97KGPPd55Nu96pcGQOZV0LTeMygClg/N6OsDa23M3owIhPx
         YG8qjhRo6fQhDQKSzGArHK5NfLgmmkzt3/O20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271748; x=1739876548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDaxzJFjL9hpy0bIqZLAOYXowlYPXeqf+Vn+cdNImxU=;
        b=ZyqICxNMuCJvNx9reY6Xbn98KYb7a8G8Yc1ZWVhTrZIS1WICFxqUHd7mt+UOdSU0Kx
         9C3XmHKW34VuNAnt2gkn5yyf5hl8XAduj9DSQ0rIxgjhJ3PbEfReHAq1nz/kTumb1jxk
         xz2pfQ8Ah2cfD2zHXThgcr6uNrufOUpnIg1m4Vu0t3jtgP1sXM/MoJ8wlQNt1bN2tZ0k
         0+miUYoZQWI0OXQtsWtSmUPzi80CpNWhqXJZIzavfzCA24msJftnGoyKLSS1vavHjGk7
         e7xUSrfUmlr7TckgnRwJM3d2ye7b8IpFFH4b7yi0YqgUJQEZb5EC9t0dwEa73/wno50o
         k2pQ==
X-Gm-Message-State: AOJu0Yz+0iqfa/+BLLsRrv3uVcwn2VFqbHFMfjMvUyn57CSUn88SCLkk
	iMIkaxW8wxpm+A7IMRgEfd9O9CzwHR39wO5J7YCLhYMLczK21Nyv9Da5fDYA60JYFHb2uJrJGDm
	h
X-Gm-Gg: ASbGncsXeJoRe35Nr/SpOILTXv7dO5+7D2SMsWsvbYR6WD4pncWBcofBCU77w8HLz4q
	bhv4WHPElFNN71k2CUUhQiR3WeXr2noDn0sGPnJPhl4EeyaavCkuBgUwSWTP+6bJsJxeRp1m+dC
	jKvP9t4rnJ/comyneAyKCe0DcNjJRt8eCBRotI/RtyWGiuQszJy7IzimCP4WQxM9wBfAzahLKJm
	/ZH3hFdf8ZMgYWr+tt+UaKlMnrXgjpToCCT97DFoahDhVj++ShfpspHU45s0/tmgm3rNdTpiB6q
	XvsKSHoQOidw6ZsHLyZu
X-Google-Smtp-Source: AGHT+IE3VU7GGVwqyYi0lesUwWrbkuUFVf0cckS2J1esvlsayG+nhNwB9dau/k65MPZHr4ICV+bNjQ==
X-Received: by 2002:a17:907:a089:b0:ab6:f4eb:91aa with SMTP id a640c23a62f3a-ab7dafef037mr246749066b.10.1739271747828;
        Tue, 11 Feb 2025 03:02:27 -0800 (PST)
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
Subject: [PATCH for-4.20 v3 4/5] x86/pci: disable MSI(-X) on all devices at shutdown
Date: Tue, 11 Feb 2025 12:02:08 +0100
Message-ID: <20250211110209.86974-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250211110209.86974-1-roger.pau@citrix.com>
References: <20250211110209.86974-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Attempt to disable MSI(-X) capabilities on all PCI devices know by Xen at
shutdown.  Doing such disabling should facilitate kexec chained kernel from
booting more reliably, as device MSI(-X) interrupt generation should be
quiesced.  Only attempt to disable MSI(-X) on all devices in the crash
context if the PCI lock is not taken, otherwise the PCI device list could
be in an inconsistent state.

Disabling MSI(-X) should prevent "Receive accept error" being raised as a
result of non-disabled interrupts targeting offline CPUs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
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
 xen/arch/x86/crash.c           |  7 ++++++
 xen/arch/x86/include/asm/msi.h |  1 +
 xen/arch/x86/msi.c             | 18 ++++++++++++++++
 xen/arch/x86/smp.c             |  1 +
 xen/drivers/passthrough/pci.c  | 39 ++++++++++++++++++++++++++++++++++
 xen/include/xen/pci.h          |  7 ++++++
 6 files changed, 73 insertions(+)

diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index a789416ca3ae..621af81acc09 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -175,6 +175,13 @@ static void nmi_shootdown_cpus(void)
          */
         x2apic_enabled = (current_local_apic_mode() == APIC_MODE_X2APIC);
 
+        if ( !pcidevs_locked() )
+            /*
+             * Assume the PCI device list to be in a consistent state if the
+             * lock is not held when the crash happened.
+             */
+            pci_disable_msi_all();
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
index f398c3aa65dc..6c6b18a16dbc 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1802,6 +1802,45 @@ int iommu_do_pci_domctl(
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
+ * Expected to be called with interrupts disabled.
+ */
+int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
+                        void *arg)
+{
+    struct segment_iter iter = {
+        .handler = handler,
+        .arg = arg,
+    };
+
+    ASSERT(!local_irq_is_enabled());
+
+    return pci_segments_iterate(iterate_all, &iter) ?: iter.rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index f784e9116059..815589dcea16 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -226,6 +226,13 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
 
+/*
+ * Iterate without locking or preemption over all PCI devices known by Xen.
+ * Expected to be called with interrupts disabled.
+ */
+int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
+                        void *arg);
+
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);
 uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg);
 uint32_t pci_conf_read32(pci_sbdf_t sbdf, unsigned int reg);
-- 
2.46.0


