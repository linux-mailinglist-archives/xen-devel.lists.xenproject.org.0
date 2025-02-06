Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664F3A2AC1D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:06:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882926.1293058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3Sa-0004H4-CA; Thu, 06 Feb 2025 15:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882926.1293058; Thu, 06 Feb 2025 15:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3Sa-0004AV-4J; Thu, 06 Feb 2025 15:06:32 +0000
Received: by outflank-mailman (input) for mailman id 882926;
 Thu, 06 Feb 2025 15:06:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEyC=U5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tg3SY-0002qU-OI
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:06:30 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f155c01d-e49b-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 16:06:29 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5dcc38c7c6bso2054816a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 07:06:29 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f491dcsm111083066b.22.2025.02.06.07.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 07:06:26 -0800 (PST)
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
X-Inumbo-ID: f155c01d-e49b-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738854388; x=1739459188; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0ovGj55iVS260GGwyIambmI1156khDmYHppn2PNqbM=;
        b=OfBcpQOiYku/j67p+tz8IqXEhVcGWQbt0hQ8uZdcPltFac7qSG+1NMdM7sJ1WzdeSS
         Sfa5YNAHZI3fsCGIyOfvVRW0rvpI6tnJ5QB+7Q6ZdAdExnqvtc5rf0SrX9t3b4Vgk2hr
         a+ZK+Wryn+srjZvgEbFUZVx4HVnDo+4hC1oLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854388; x=1739459188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0ovGj55iVS260GGwyIambmI1156khDmYHppn2PNqbM=;
        b=S2hnegQN8DhIxNDW+uZF3Z3Q430ps6TNgxJhfDGBBbNMOSYHQ4Mdi/OxcQ5yB3KfIW
         wkhhwr8wTybtp+qlaaq1klvIIt8r7uwBNZ+7ZpezSEHYryDL0jmFQnc975FKf3fW/8Fz
         7lMcmiWNKB3IMpiyWcZqk0KxjTrjOBc1ZxETx4W+dWRthqpsQ1eB9X282e0m+JdGrF9N
         uVb50PJmYVofkaKu7iVlH2batuYhEMwcPLR1LLMQ/XLryDIuV7i2fL/TFSIN7bh2hjWJ
         8fX1BIYnIlqaycWFxDnFCEfb3mVc2az/fXD/iWdyda1KU+pslIvLNgVnhXuj2GPyAFBC
         akQA==
X-Gm-Message-State: AOJu0YzhvHjfMwXSHmgm94PQX1qqDXIhUngiTfod0hOZfUtCwoYAI5+j
	Qq6fqDb8eC4ypmhYUBzfkXK3hXfV2+sPQQY/zn7m/eUvFZoCItvTxhE1s0bH2J7SA03skZyOufW
	l
X-Gm-Gg: ASbGncvrDHZ3bqZFKp+zfcRvOJFBbZ4tW89KCc9Z5cJx4QydUCxlZqug1mIQGOjSEbK
	GhUVNRMe0V9k94LdN5kJd9lBupXQkZ+Dbl0u5zLUrbXOmslHLZZMmCkpn6egETZszoo6Sr9wSMB
	73HQLcESqaJEkRx289hoO6RFA+6TmaIP43e2dHIIRK5EyMlPUCm1YP5TxhKXoNHSgRM6b6Bfny6
	QHd1PpeLNunXRwZJgSQ06+Jv8Bium6uTRrQ956XxikeLgvCZxik21rUanmy8srCN1MW3n+CKrKT
	8BP271CjjTXKlpRf/L3B
X-Google-Smtp-Source: AGHT+IHGlVhkxHSOoLQK1U4QnHqyRKKxrQ9vlFjLukcvGvocJz0uyp3SQkcmSHcHzy+unuKq/hdrLQ==
X-Received: by 2002:a17:907:2d22:b0:ab6:d7c4:fc7d with SMTP id a640c23a62f3a-ab75e35dc0dmr658202466b.39.1738854386398;
        Thu, 06 Feb 2025 07:06:26 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/5] x86/pci: disable MSI(-X) on all devices at shutdown
Date: Thu,  6 Feb 2025 16:06:14 +0100
Message-ID: <20250206150615.52052-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250206150615.52052-1-roger.pau@citrix.com>
References: <20250206150615.52052-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Attempt to disable MSI(-X) capabilities on all PCI devices know by Xen at
shutdown.  Doing such disabling should facilitate kexec chained kernel from
booting more reliably, as device MSI(-X) interrupt generation should be
quiesced.

It would also prevent "Receive accept error" being raised as a result of
non-disabled interrupts targeting offline CPUs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Split from bigger patch.
 - Iterate over all devices, even if the handler returns failure.
---
 xen/arch/x86/crash.c           |  1 +
 xen/arch/x86/include/asm/msi.h |  1 +
 xen/arch/x86/msi.c             | 18 ++++++++++++++++++
 xen/arch/x86/smp.c             |  1 +
 xen/drivers/passthrough/pci.c  | 33 +++++++++++++++++++++++++++++++++
 xen/include/xen/pci.h          |  4 ++++
 6 files changed, 58 insertions(+)

diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index a789416ca3ae..c946225c0b9b 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -177,6 +177,7 @@ static void nmi_shootdown_cpus(void)
 
         disable_IO_APIC();
         hpet_disable();
+        pci_disable_msi_all();
     }
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
index f931db0d71c6..f58c8d3cafe1 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -376,6 +376,7 @@ void smp_send_stop(void)
     local_irq_disable();
     disable_IO_APIC();
     hpet_disable();
+    pci_disable_msi_all();
 
     if ( num_online_cpus() > 1 )
     {
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 777c6b1a7fdc..945118383f45 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1803,6 +1803,39 @@ int iommu_do_pci_domctl(
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
index f784e9116059..983c592124a8 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -226,6 +226,10 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
 void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
 
+/* Iterate without locking or preemption over all PCI devices known by Xen. */
+int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
+                        void *arg);
+
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);
 uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg);
 uint32_t pci_conf_read32(pci_sbdf_t sbdf, unsigned int reg);
-- 
2.46.0


