Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F0A24E63
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2025 14:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880347.1290417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teaLD-0001Qn-Ao; Sun, 02 Feb 2025 13:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880347.1290417; Sun, 02 Feb 2025 13:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teaLD-0001PM-6R; Sun, 02 Feb 2025 13:48:51 +0000
Received: by outflank-mailman (input) for mailman id 880347;
 Sun, 02 Feb 2025 13:48:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okHa=UZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1teaLB-0001PE-7x
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2025 13:48:49 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ccc99f7-e16c-11ef-a0e7-8be0dac302b0;
 Sun, 02 Feb 2025 14:48:47 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9a88793so5464810a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Feb 2025 05:48:47 -0800 (PST)
Received: from andrew-laptop.. ([89.207.171.161])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a818csm583715266b.6.2025.02.02.05.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 05:48:45 -0800 (PST)
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
X-Inumbo-ID: 6ccc99f7-e16c-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738504126; x=1739108926; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bFcQ659jbUzCeZCoQlcoXVT2+2vW+6Th9OMJj6ERNYE=;
        b=XEELsrMo+MUH9C+6LySRjRcwuU+3VbU8eWzAZu5i04F1Sbs590hqpxG2FL7QI3sGN7
         i6HHFpZtur+itaLXhaRTlijegd+0yAvPb74YdyV8xzUbqWOfw7Y81F9J9V/4F1Qney+5
         Fbst7GctYmAl74EDloqmCKjV4lizUl3Ua8iaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738504126; x=1739108926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFcQ659jbUzCeZCoQlcoXVT2+2vW+6Th9OMJj6ERNYE=;
        b=ULaRoJC2oDu1dbWIAQWLvAhHf4G0yB1NDBgmljnm8y8iKFHG26wWolBOv+rL/iJKa1
         O9XvbNAFfp1qxJtgBIGcVA+7uTgkuPBLMFO/Iw8qmvnaBEQYbAMAs77i3DQn2cSP91dW
         qoYaoO/f/9LvFNvOmQtPnV25W/nZirB+SxD+cQpTxRSqLAVKSJROUNv/X74wWmI+BVed
         XGEJrfuvhBNiqc9SQUoYqBfhzYp36TPakorsL4rKGgq+8mKhEpjripYqgzQrU6PGqvUB
         eR1UIwx0K+0DnzFB5bvBIA6me68qtaGgCb+jiRAeFaKNj77AsqM2GjBqCH4iwUFLA98N
         mzTA==
X-Gm-Message-State: AOJu0YyqRDaK3GmU6h05NkewmqqsCrtX95NZ45cn67Ai5XHzEahOHXGw
	lg/BZ/70MVCtca6rWpZ9q/cF69WfbQvWthY3I2uEwAZ+/SAZGgUbq/HRl7nyyByHcOO5+PHdILx
	vZEs=
X-Gm-Gg: ASbGnct/8K8jGzgjJB+wVGoIHnxBdKGACMM3j2SMhE7MiAXmBVS0+3ihsaqmzRyJ/Cp
	yFtMAvsPTueuc3WJHJAdy6aDs2xCJv37zmx9jPj1Ac1gdmihVJKIuPVPELDrpTUMC5G03zVWW3y
	rj8lx3/5sG4jHuL1wty714lfTMXEll3EXkbYQ5cRLm6IZNj4K9X74DHlbaIE1d2XNcH5qs3rq0c
	8Bv406/AmDcNpyz7ozkxCY/YmCXfsMJSlVi5gGpLMoXx31uDIlVYE/sxzpKPlU1ih8d0B+QoWgP
	Fcxs9f7aec73zQviSgjTRDp90MUJ
X-Google-Smtp-Source: AGHT+IECVpLoroUXEVvQkkxrfppPcKlQYxzlv3FvJl9DjijsgsKrhUxwfmmrB3JBquhUA6M4Thp1pA==
X-Received: by 2002:a17:907:3f0b:b0:ab6:37c3:381d with SMTP id a640c23a62f3a-ab6cfceb5c2mr1898548766b.24.1738504126248;
        Sun, 02 Feb 2025 05:48:46 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.21] x86/msi: Change __msi_set_enable() to take pci_sbdf_t
Date: Sun,  2 Feb 2025 13:48:40 +0000
Message-Id: <20250202134840.40102-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This removes the unnecessary work of splitting a 32-bit number across
4 registers, and recombining later.  Bloat-o-meter reports:

  add/remove: 0/0 grow/shrink: 0/9 up/down: 0/-295 (-295)
  Function                                     old     new   delta
  enable_iommu                                1748    1732     -16
  iommu_msi_unmask                              98      81     -17
  iommu_msi_mask                               100      83     -17
  disable_iommu                                286     269     -17
  __msi_set_enable                              81      50     -31
  __pci_disable_msi                            178     146     -32
  pci_cleanup_msi                              268     229     -39
  pci_enable_msi                              1063    1019     -44
  pci_restore_msi_state                       1116    1034     -82

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/msi.h           |  2 +-
 xen/arch/x86/msi.c                       | 14 ++++----------
 xen/drivers/passthrough/amd/iommu_init.c |  5 +++--
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 63adb19820e8..5bb9abd3eb6f 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -237,7 +237,7 @@ struct arch_msix {
 void early_msi_init(void);
 void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask,
                      struct msi_msg *msg);
-void __msi_set_enable(u16 seg, u8 bus, u8 slot, u8 func, int pos, int enable);
+void __msi_set_enable(pci_sbdf_t sbdf, int pos, int enable);
 void cf_check mask_msi_irq(struct irq_desc *desc);
 void cf_check unmask_msi_irq(struct irq_desc *desc);
 void guest_mask_msi_irq(struct irq_desc *desc, bool mask);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index e2360579deda..52117d97b522 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -267,28 +267,22 @@ void cf_check set_msi_affinity(struct irq_desc *desc, const cpumask_t *mask)
     write_msi_msg(msi_desc, &msg);
 }
 
-void __msi_set_enable(u16 seg, u8 bus, u8 slot, u8 func, int pos, int enable)
+void __msi_set_enable(pci_sbdf_t sbdf, int pos, int enable)
 {
-    uint16_t control = pci_conf_read16(PCI_SBDF(seg, bus, slot, func),
-                                       pos + PCI_MSI_FLAGS);
+    uint16_t control = pci_conf_read16(sbdf, pos + PCI_MSI_FLAGS);
 
     control &= ~PCI_MSI_FLAGS_ENABLE;
     if ( enable )
         control |= PCI_MSI_FLAGS_ENABLE;
-    pci_conf_write16(PCI_SBDF(seg, bus, slot, func),
-                     pos + PCI_MSI_FLAGS, control);
+    pci_conf_write16(sbdf, pos + PCI_MSI_FLAGS, control);
 }
 
 static void msi_set_enable(struct pci_dev *dev, int enable)
 {
     unsigned int pos = dev->msi_pos;
-    u16 seg = dev->seg;
-    u8 bus = dev->bus;
-    u8 slot = PCI_SLOT(dev->devfn);
-    u8 func = PCI_FUNC(dev->devfn);
 
     if ( pos )
-        __msi_set_enable(seg, bus, slot, func, pos, enable);
+        __msi_set_enable(dev->sbdf, pos, enable);
 }
 
 static void msix_set_enable(struct pci_dev *dev, int enable)
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 05fd3bde6e29..f1076bf11d62 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -409,8 +409,9 @@ static void iommu_reset_log(struct amd_iommu *iommu,
 
 static void amd_iommu_msi_enable(struct amd_iommu *iommu, int flag)
 {
-    __msi_set_enable(iommu->seg, PCI_BUS(iommu->bdf), PCI_SLOT(iommu->bdf),
-                     PCI_FUNC(iommu->bdf), iommu->msi.msi_attrib.pos, flag);
+    pci_sbdf_t sbdf = { .seg = iommu->seg, .bdf = iommu->bdf };
+
+    __msi_set_enable(sbdf, iommu->msi.msi_attrib.pos, flag);
 }
 
 static void cf_check iommu_msi_unmask(struct irq_desc *desc)
-- 
2.34.1


