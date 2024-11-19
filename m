Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF819D23AB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 11:35:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839920.1255720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLZS-00017g-96; Tue, 19 Nov 2024 10:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839920.1255720; Tue, 19 Nov 2024 10:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLZS-00014T-5a; Tue, 19 Nov 2024 10:34:58 +0000
Received: by outflank-mailman (input) for mailman id 839920;
 Tue, 19 Nov 2024 10:34:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDLZP-0000aC-UI
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 10:34:55 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e924aa79-a661-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 11:34:52 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9a6b4ca29bso611738766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 02:34:52 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e044bb8sm633706166b.150.2024.11.19.02.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 02:34:51 -0800 (PST)
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
X-Inumbo-ID: e924aa79-a661-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU5MjRhYTc5LWE2NjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDEyNDkyLjcxNjM3OSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732012492; x=1732617292; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZ82fMjo7f/+Ug2kFMZ6vDINmL+ZwDvWFTn794Oj1rk=;
        b=XdUF2ZGRLC2BXrdEdZh4ugKZfSWf5g88OzRuNCWVef+jYQUFTa6CpWkM9q2wuB3u0r
         tIqnktK2cbt36yb0iArJdnf1ENSan+R6gyKcG/NDR04KNiA/2LEY3cl2Xi1hqoSlfvuG
         5j6mE7fKSIyXtnwCS7NXXjjOmCbRoEl+ZTy/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732012492; x=1732617292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZ82fMjo7f/+Ug2kFMZ6vDINmL+ZwDvWFTn794Oj1rk=;
        b=iyXV449nmrVz/AvLiKWI2aW8jcUyTWTOEQ9+c4DNMFoL1DN5Xoyj/pk3EJTVrsDZ2B
         J+i3L0ngPnxhz1zISPpRn8IcCwRG1KZMso8W+3lBMotXkJVm6cxJajbjHUlOpd9PRzWm
         Z729YpdVPc7rqGoamE6FFXsQGPhUisdaHV7J0xISlieqs3zkMevRAP3Mqz892y0GO/ao
         kbz16B1cSqZu5Vue49hLffMOwxSU5fvW6KJ5DAKHJhpSTYaawwa6MQM7EiiL3gL94lG6
         oQS/1Z+4LPL3TCYGiT5LJEPj7chjrMCv6/kK0elAw7mCF7Fo1suwZR1x/UInS8pmy4oy
         FjaQ==
X-Gm-Message-State: AOJu0Yx74mEEhRnfjSMHVmLcyKlZrwhFieSD49uxRKTz/fE/ePdzNmNQ
	XFqfDjgd2bEuwl2T16borTm9dPsuK+W8OjRO/ORM8CcFq6PsVQzHPbM5dYyDhv93MIFz47ctLxc
	N
X-Google-Smtp-Source: AGHT+IE9mIPwptfQcOONcgsmg3XZysj9KYiZdM0dzj59xhF/TX7rURgl7iaAvoo81T+LuCAHu+X3nw==
X-Received: by 2002:a17:907:928a:b0:a9a:bbcc:5092 with SMTP id a640c23a62f3a-aa48350b016mr1511216166b.39.1732012491894;
        Tue, 19 Nov 2024 02:34:51 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/4] x86/msi: fix Misra Rule 20.7 in msi.h
Date: Tue, 19 Nov 2024 11:34:42 +0100
Message-ID: <20241119103444.23296-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241119103444.23296-1-roger.pau@citrix.com>
References: <20241119103444.23296-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prune unused macros and adjust the remaining ones to parenthesize macro
arguments.

No functional change intended.

Singed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/msi.h | 35 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 748bc3cd6d8b..49a576383288 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -147,33 +147,26 @@ int msi_free_irq(struct msi_desc *entry);
  */
 #define NR_HP_RESERVED_VECTORS 	20
 
-#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
-#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
-#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
+#define msi_control_reg(base)		((base) + PCI_MSI_FLAGS)
+#define msi_lower_address_reg(base)	((base) + PCI_MSI_ADDRESS_LO)
+#define msi_upper_address_reg(base)	((base) + PCI_MSI_ADDRESS_HI)
 #define msi_data_reg(base, is64bit)	\
-	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
+	((base) + ((is64bit) ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32))
 #define msi_mask_bits_reg(base, is64bit) \
-	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
+	((base) + PCI_MSI_MASK_BIT - ((is64bit) ? 0 : 4))
 #define msi_pending_bits_reg(base, is64bit) \
 	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
-#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
 #define multi_msi_capable(control) \
-	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
+	(1U << MASK_EXTR(control, PCI_MSI_FLAGS_QMASK))
 #define multi_msi_enable(control, num) \
-	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
-#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
-#define is_mask_bit_support(control)	(!!(control & PCI_MSI_FLAGS_MASKBIT))
-#define msi_enable(control, num) multi_msi_enable(control, num); \
-	control |= PCI_MSI_FLAGS_ENABLE
-
-#define msix_control_reg(base)		(base + PCI_MSIX_FLAGS)
-#define msix_table_offset_reg(base)	(base + PCI_MSIX_TABLE)
-#define msix_pba_offset_reg(base)	(base + PCI_MSIX_PBA)
-#define msix_enable(control)	 	control |= PCI_MSIX_FLAGS_ENABLE
-#define msix_disable(control)	 	control &= ~PCI_MSIX_FLAGS_ENABLE
-#define msix_table_size(control) 	((control & PCI_MSIX_FLAGS_QSIZE)+1)
-#define msix_unmask(address)	 	(address & ~PCI_MSIX_VECTOR_BITMASK)
-#define msix_mask(address)		(address | PCI_MSIX_VECTOR_BITMASK)
+	((control) |= MASK_INSR(fls(num) - 1, PCI_MSI_FLAGS_QSIZE))
+#define is_64bit_address(control)	!!((control) & PCI_MSI_FLAGS_64BIT)
+#define is_mask_bit_support(control)	!!((control) & PCI_MSI_FLAGS_MASKBIT)
+
+#define msix_control_reg(base)		((base) + PCI_MSIX_FLAGS)
+#define msix_table_offset_reg(base)	((base) + PCI_MSIX_TABLE)
+#define msix_pba_offset_reg(base)	((base) + PCI_MSIX_PBA)
+#define msix_table_size(control) 	(((control) & PCI_MSIX_FLAGS_QSIZE) + 1)
 
 /*
  * MSI Defined Data Structures
-- 
2.46.0


