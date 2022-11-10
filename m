Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB976247CA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 18:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442032.696103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otAuK-0003ks-HA; Thu, 10 Nov 2022 17:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442032.696103; Thu, 10 Nov 2022 17:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otAuK-0003g9-AG; Thu, 10 Nov 2022 17:00:04 +0000
Received: by outflank-mailman (input) for mailman id 442032;
 Thu, 10 Nov 2022 17:00:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqAE=3K=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1otAuI-0002uf-Oz
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 17:00:02 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d976744-6119-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 18:00:01 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso3881881wme.5
 for <xen-devel@lists.xenproject.org>; Thu, 10 Nov 2022 09:00:01 -0800 (PST)
Received: from pear.davidvrabel.org.uk (pear.davidvrabel.org.uk.
 [82.70.146.41]) by smtp.googlemail.com with ESMTPSA id
 j5-20020a05600c1c0500b003cfbbd54178sm9403666wms.2.2022.11.10.08.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 09:00:00 -0800 (PST)
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
X-Inumbo-ID: 1d976744-6119-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MJeW3qL/c7Nl4JPpfIgJfXaM8AY5MEnPk3q1bmBjO0=;
        b=AQvCwpnwVjp3w+MErojUhbmijOfiwpaBMHtyR/Ux9TYtGaRbrG3eIEXpvlhlN5cdqs
         2siEbbuirbd8VG84r6buUjggBxObJ2jots3hO3qEZhSOSNzXgfMHZkelr4bNxpCQVa+I
         o+z/fiklDX0anJMA+QjU8u/W2LG+6FUw7fxs7kyAyWDe9hBuWvHbTn7SepiLt2AUT9k/
         EUXBNEnVyjIO0wDdf7hxtJrDcU80JyjOI3zJzh18meU4d78HQZ0UxoCJW4Ktdr03gB5a
         /btoLShA3+6q8ualNTEw4skoAlb8cSbaLYF/7g9ldcjYIFsy0YmoqaNE4s/3DeWmiIvf
         8ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3MJeW3qL/c7Nl4JPpfIgJfXaM8AY5MEnPk3q1bmBjO0=;
        b=3N4RQczP+4nnZ5lEzHxAbIsuvgbkkSqjEjD+510Fiw1b0oOo5WnkTCVUkS5OOTj4vl
         DvOczIiuCSsLrNWj5tqBuHD7iQGSJYzqHWZqIexrqEM2RkMG5/CaZ7YPC5WEgONXoVGm
         QS57b6TYSL1xx/joE443Q+ctH4LWFGSiu/yT4eGmxzb5DqmSTAiTGztxCXJKWEPX+naC
         KC9bBj0jeXMZoQXfp/TRkT/h6l2tED5g2r8+mLYpvXNOtvnPS4Usg4Qh6l1QAK62PI9c
         /wEiTyYJfaiIWhyIX3+o55H+MiTyeEd8MwTmdmMMLFqisNpGd/0ed85HSxPNJkiN79rv
         +foA==
X-Gm-Message-State: ACrzQf05ceyyawdpb2b1pPpAlFK+lmHP+ZZg23zL5MGbD6my9ke7YJLq
	A7DJo4OPatDM/QliUYdRMHsHwOWqpR2MmQ==
X-Google-Smtp-Source: AMsMyM40n8czUkrqnA7n+hbZVa0+8Z+b/+T5uaerrS29tarrjqZX00xmpUVP3PYRoSHVqyKEW9glFw==
X-Received: by 2002:a7b:c3d8:0:b0:3cf:9b7b:b96c with SMTP id t24-20020a7bc3d8000000b003cf9b7bb96cmr21909005wmj.113.1668099601471;
        Thu, 10 Nov 2022 09:00:01 -0800 (PST)
Sender: David Vrabel <d.vrabel.98@gmail.com>
From: David Vrabel <dvrabel@cantab.net>
X-Google-Original-From: David Vrabel <dvrabel@amazon.co.uk>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCH 2/3] x86/msi: remove return value from msi_set_mask_bit()
Date: Thu, 10 Nov 2022 16:59:34 +0000
Message-Id: <20221110165935.106376-3-dvrabel@amazon.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110165935.106376-1-dvrabel@amazon.co.uk>
References: <20221110165935.106376-1-dvrabel@amazon.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value was only used for WARN()s or BUG()s so it has no
functional purpose. Simplify the code by removing it.

The meaning of the return value and the purpose of the various WARNs()
and BUGs() is rather unclear. The only failure path (where an MSI-X
vector needs to be masked but the MSI-X table is not accessible) has a
useful warning message.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>

CR: https://code.amazon.com/reviews/CR-79020927
---
 xen/arch/x86/msi.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 8bde6b9be1..6c675d11d1 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -314,7 +314,7 @@ int msi_maskable_irq(const struct msi_desc *entry)
            || entry->msi_attrib.maskbit;
 }
 
-static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
+static void msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
 {
     struct msi_desc *entry = desc->msi_desc;
     struct pci_dev *pdev;
@@ -361,11 +361,6 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
 
             if ( likely(control & PCI_MSIX_FLAGS_ENABLE) )
                 break;
-
-            entry->msi_attrib.host_masked = host;
-            entry->msi_attrib.guest_masked = guest;
-
-            flag = true;
         }
         else if ( flag && !(control & PCI_MSIX_FLAGS_MASKALL) )
         {
@@ -385,14 +380,10 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
             control |= PCI_MSIX_FLAGS_MASKALL;
         pci_conf_write16(pdev->sbdf,
                          msix_control_reg(entry->msi_attrib.pos), control);
-        return flag;
-    default:
-        return 0;
+        break;
     }
     entry->msi_attrib.host_masked = host;
     entry->msi_attrib.guest_masked = guest;
-
-    return 1;
 }
 
 static int msi_get_mask_bit(const struct msi_desc *entry)
@@ -418,16 +409,12 @@ static int msi_get_mask_bit(const struct msi_desc *entry)
 
 void cf_check mask_msi_irq(struct irq_desc *desc)
 {
-    if ( unlikely(!msi_set_mask_bit(desc, 1,
-                                    desc->msi_desc->msi_attrib.guest_masked)) )
-        BUG_ON(!(desc->status & IRQ_DISABLED));
+    msi_set_mask_bit(desc, 1, desc->msi_desc->msi_attrib.guest_masked);
 }
 
 void cf_check unmask_msi_irq(struct irq_desc *desc)
 {
-    if ( unlikely(!msi_set_mask_bit(desc, 0,
-                                    desc->msi_desc->msi_attrib.guest_masked)) )
-        WARN();
+    msi_set_mask_bit(desc, 0, desc->msi_desc->msi_attrib.guest_masked);
 }
 
 void guest_mask_msi_irq(struct irq_desc *desc, bool mask)
@@ -437,15 +424,13 @@ void guest_mask_msi_irq(struct irq_desc *desc, bool mask)
 
 static unsigned int cf_check startup_msi_irq(struct irq_desc *desc)
 {
-    if ( unlikely(!msi_set_mask_bit(desc, 0, !!(desc->status & IRQ_GUEST))) )
-        WARN();
+    msi_set_mask_bit(desc, 0, !!(desc->status & IRQ_GUEST));
     return 0;
 }
 
 static void cf_check shutdown_msi_irq(struct irq_desc *desc)
 {
-    if ( unlikely(!msi_set_mask_bit(desc, 1, 1)) )
-        BUG_ON(!(desc->status & IRQ_DISABLED));
+    msi_set_mask_bit(desc, 1, 1);
 }
 
 void cf_check ack_nonmaskable_msi_irq(struct irq_desc *desc)
@@ -1358,10 +1343,9 @@ int pci_restore_msi_state(struct pci_dev *pdev)
 
         for ( i = 0; ; )
         {
-            if ( unlikely(!msi_set_mask_bit(desc,
-                                            entry[i].msi_attrib.host_masked,
-                                            entry[i].msi_attrib.guest_masked)) )
-                BUG();
+            msi_set_mask_bit(desc,
+                             entry[i].msi_attrib.host_masked,
+                             entry[i].msi_attrib.guest_masked);
 
             if ( !--nr )
                 break;
-- 
2.30.2


