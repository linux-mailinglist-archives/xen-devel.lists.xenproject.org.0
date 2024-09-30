Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC498A823
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807433.1218899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI0k-0002a4-8H; Mon, 30 Sep 2024 15:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807433.1218899; Mon, 30 Sep 2024 15:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI0k-0002Wm-2B; Mon, 30 Sep 2024 15:08:30 +0000
Received: by outflank-mailman (input) for mailman id 807433;
 Mon, 30 Sep 2024 15:08:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svI0i-00022q-LS
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:08:28 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d855b50b-7f3d-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:08:27 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5399041167cso2164067e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:08:27 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a0432219sm1264423e87.132.2024.09.30.08.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 08:08:25 -0700 (PDT)
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
X-Inumbo-ID: d855b50b-7f3d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727708906; x=1728313706; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAL8c3GW2uyga/G1EVaDK0Z5EZU/EC3svPKlERObHus=;
        b=WLP6wSU6g+4wFJNdOUFG5TctPLLXUTqz+sR6Kg6gNY7bYwh2kUr2prXpUgpSpKE7vg
         P2qb7fcEYUHc2sgSSKc8a6l8SGZzH+XAl6QDxrx+pOF6+7MBFVwgOgxQdKLpq8Vg2ucc
         gh1oT/s8t87OKY62v1g9fhYg/yTzshJVVAwM7V5eMvD229HNlVI1ZZrEEfZAJoyO286D
         t+ZUFQj+kcPOw6VicK345vzaopyXjriHxdjG6Rer0aZusRGkxyvkBSR2nGuzp7fvyhb0
         I1oN2FAYSsXfCponVSlLmFq44TnYAkNcp1ZAzczGISbpi1PQ8aErizJbevB8D7twcYys
         pKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727708906; x=1728313706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAL8c3GW2uyga/G1EVaDK0Z5EZU/EC3svPKlERObHus=;
        b=Sjx7SpeozYoY91bUex3+tnJWUzojiJE/qrF1LjPsqyDGW1c3tPuV3FBGEIRLgVtfyV
         DjurMD/w5HEYwuvJJcSePEsPcyqlbTYgErX8kLlz/ON2XFaF0CSRZ1brbcfancsIpHlR
         sqV6jLC6j5Xyf6gteveIlKHRsXOhLCcnMXRyRYIlr+7eWsnJ4/BxKYjKNXDVMvb7pwVh
         Pd+BFhH4guIRtLzmCjGxKV6T2TTA33IWEcc2+HkkTIror4db3QL9da1JXKCxxABblIXB
         vNXbF4ShL0Yz4PAFHURoIButWKmwlVQS6xBlnWI7ovhhsHOOK9mI4TR/a1vW5vezqc8j
         wAew==
X-Gm-Message-State: AOJu0Yzcu2b+3e76VuFem7DSlb+B5SDvgIdZNGbq20KFGDHufD2IK+zf
	PIooL9cZB9RivGUA00lvUYb2F3yr2x+Qeyd7fJ9I4csWGwsUCI7gFJxUIg==
X-Google-Smtp-Source: AGHT+IH7aEAQXCy/i3YX3YbUX6WObvTj3zirVkQ4qR/nnBeN3hj60JKDTTq0fRHr6v5e9HrzHe0szw==
X-Received: by 2002:a05:6512:2c04:b0:539:8f3c:4586 with SMTP id 2adb3069b0e04-5398f3c45famr3711256e87.55.1727708905915;
        Mon, 30 Sep 2024 08:08:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/3] xen/riscv: implement virt_to_maddr()
Date: Mon, 30 Sep 2024 17:08:20 +0200
Message-ID: <1d4270af6469af2f95ede34abd8e9f98f775c1f1.1727708665.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727708665.git.oleksii.kurochko@gmail.com>
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the virt_to_maddr() function to convert virtual addresses
to machine addresses, including checks for address ranges such as
the direct mapping area (DIRECTMAP_VIRT_START) and the Xen virtual
address space. To implement this, the phys_offset variable is made
accessible outside of riscv/mm.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/config.h |  4 ++++
 xen/arch/riscv/include/asm/mm.h     | 15 ++++++++++++++-
 xen/arch/riscv/mm.c                 |  2 +-
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 7dbb235685..8884aeab16 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -155,6 +155,10 @@
 
 #define IDENT_AREA_SIZE 64
 
+#ifndef __ASSEMBLY__
+extern unsigned long phys_offset;
+#endif
+
 #endif /* __RISCV_CONFIG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 4b7b00b850..aa1f86cd5e 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -28,7 +28,20 @@ static inline void *maddr_to_virt(paddr_t ma)
     return NULL;
 }
 
-#define virt_to_maddr(va) ({ BUG_ON("unimplemented"); 0; })
+static inline unsigned long virt_to_maddr(unsigned long va)
+{
+    ASSERT(va >= (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE));
+    if ((va >= DIRECTMAP_VIRT_START) &&
+        (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
+        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);
+
+    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
+    ASSERT(((long)va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
+           ((long)XEN_VIRT_START >> (PAGETABLE_ORDER + PAGE_SHIFT)));
+
+    return phys_offset + va;
+}
+#define virt_to_maddr(va) virt_to_maddr((unsigned long)(va))
 
 /* Convert between Xen-heap virtual addresses and machine frame numbers. */
 #define __virt_to_mfn(va)  mfn_x(maddr_to_mfn(virt_to_maddr(va)))
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 4a628aef83..7a1919e07e 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -26,7 +26,7 @@ struct mmu_desc {
     pte_t *pgtbl_base;
 };
 
-static unsigned long __ro_after_init phys_offset;
+unsigned long __ro_after_init phys_offset;
 
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 #define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
-- 
2.46.1


