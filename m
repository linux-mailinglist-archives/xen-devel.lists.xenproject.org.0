Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548FC438CFF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 03:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215616.374928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meokV-0002Xe-E2; Mon, 25 Oct 2021 01:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215616.374928; Mon, 25 Oct 2021 01:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1meokV-0002Uv-AN; Mon, 25 Oct 2021 01:26:03 +0000
Received: by outflank-mailman (input) for mailman id 215616;
 Mon, 25 Oct 2021 01:26:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eqc=PN=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1meokT-0002Ul-G0
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 01:26:01 +0000
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc59fe92-a2c6-486b-9e83-df967df2cc64;
 Mon, 25 Oct 2021 01:26:00 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id h20so10227437qko.13
 for <xen-devel@lists.xenproject.org>; Sun, 24 Oct 2021 18:26:00 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:51e0:9342:22f6:f52e])
 by smtp.gmail.com with ESMTPSA id r186sm7786376qkf.128.2021.10.24.18.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 18:26:00 -0700 (PDT)
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
X-Inumbo-ID: dc59fe92-a2c6-486b-9e83-df967df2cc64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VTEYBOVFC48ADDa8N43omwk7puK0joc4PFn0uiGMRcg=;
        b=jKwWtJj2+XorNlj49nPSke8a/Qft4zbyuljV+uV1cJ7UmjuQuKWRkIXvggCUofTGt2
         fVLAFa4nO7JOjDgshLvnReog5af2DO50+AKqbFHsLrCtSaIDbdw/d+yolCFh41KxOSfN
         JVrb5fOhJaDW0VdpOkD29CdgWJIRr413QXPcsaa21SPYZeWR1awOiKVnY5bYaAwYT63e
         bcdon+VyuSQ/O2n5n6MdhWxvzdZFckaSws/nc0JIcHPY8GX9nTah8n3p2z6eDL8M3BFF
         ZdhsE+C9QKoA/Bmsq03tfGHaljFw1Onk2KR26sai4r2EtPJtDmHiT1O6XklkU9XdFD90
         +Usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VTEYBOVFC48ADDa8N43omwk7puK0joc4PFn0uiGMRcg=;
        b=aQZbhqCZ2MqMlH3UI+2XdjpPlml9Zy5rq/kdZ2R/df8E+4cNQdjd5hlmlOt/T6QJG/
         488rcavU2utXWRnCiV8ZqLqlPtzt2ICWnGEjlBtmCTi+V7D8E5imWpOaJU90aGCO+n4o
         UzfmJVRmBX8r4Z3B1If9SzSFzvUt2o1YE9uGJhJxEOWWxfqsjp4nlv+wF4ZhyUgZekWa
         puHpB3VPM87aTc6H0TjSDS8zcywsEX9NxnW0Yi0M1vmHye9tDtM7n2FlBAFFi6lKaVLd
         TFll+Wbpj/SeTh7JypYjMJ2LcX0EcffuAcDP6KYJpgg+3wufZAO5dakmLCTABL8vrXLD
         PRVA==
X-Gm-Message-State: AOAM530OuME6GMthHu8hlAtPXxLuz4XwU8PjF3SozK7BOWqckzaUv53v
	gJVgs43jUMP5+wysGcvNZG0=
X-Google-Smtp-Source: ABdhPJxdhx9YsyD2piku1kRFpYGiExJbAde47xpWYo9zrILaPmf8HpF05Y/EzU1HwylCgQrMbg2KWQ==
X-Received: by 2002:a05:620a:45a3:: with SMTP id bp35mr11126547qkb.262.1635125160419;
        Sun, 24 Oct 2021 18:26:00 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: josef@oderland.se
Cc: boris.ostrovsky@oracle.com,
	helgaas@kernel.org,
	jandryuk@gmail.com,
	jgross@suse.com,
	linux-pci@vger.kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	xen-devel@lists.xenproject.org
Subject: [PATCH] PCI/MSI: Fix masking MSI/MSI-X on Xen PV
Date: Sun, 24 Oct 2021 21:25:03 -0400
Message-Id: <20211025012503.33172-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask
functions") introduce functions pci_msi_update_mask() and
pci_msix_write_vector_ctrl() that is missing checks for
pci_msi_ignore_mask that exists in commit 446a98b19fd6 ("PCI/MSI: Use
new mask/unmask functions").  The checks are in place at the high level
__pci_msi_mask_desc()/__pci_msi_unmask_desc(), but some functions call
directly to the helpers.

Push the pci_msi_ignore_mask check down to the functions that make
the actual writes.  This keeps the logic local to the writes that need
to be bypassed.

With Xen PV, the hypervisor is responsible for masking and unmasking the
interrupts, which pci_msi_ignore_mask is used to indicate.

This change avoids lockups in amdgpu drivers under Xen during boot.

Fixes: commit 446a98b19fd6 ("PCI/MSI: Use new mask/unmask functions")
Reported-by: Josef Johansson <josef@oderland.se>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 drivers/pci/msi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
index 4b4792940e86..478536bafc39 100644
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -148,6 +148,9 @@ static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 s
 	raw_spinlock_t *lock = &desc->dev->msi_lock;
 	unsigned long flags;
 
+	if (pci_msi_ignore_mask)
+		return;
+
 	raw_spin_lock_irqsave(lock, flags);
 	desc->msi_mask &= ~clear;
 	desc->msi_mask |= set;
@@ -181,6 +184,9 @@ static void pci_msix_write_vector_ctrl(struct msi_desc *desc, u32 ctrl)
 {
 	void __iomem *desc_addr = pci_msix_desc_addr(desc);
 
+	if (pci_msi_ignore_mask)
+		return;
+
 	writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 }
 
@@ -200,7 +206,7 @@ static inline void pci_msix_unmask(struct msi_desc *desc)
 
 static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
 {
-	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
+	if (desc->msi_attrib.is_virtual)
 		return;
 
 	if (desc->msi_attrib.is_msix)
@@ -211,7 +217,7 @@ static void __pci_msi_mask_desc(struct msi_desc *desc, u32 mask)
 
 static void __pci_msi_unmask_desc(struct msi_desc *desc, u32 mask)
 {
-	if (pci_msi_ignore_mask || desc->msi_attrib.is_virtual)
+	if (desc->msi_attrib.is_virtual)
 		return;
 
 	if (desc->msi_attrib.is_msix)
-- 
2.30.2


