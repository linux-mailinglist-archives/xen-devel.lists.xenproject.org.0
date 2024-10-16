Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BCF9A0532
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819725.1233176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108X-0005md-5c; Wed, 16 Oct 2024 09:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819725.1233176; Wed, 16 Oct 2024 09:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108W-0005es-Vk; Wed, 16 Oct 2024 09:16:08 +0000
Received: by outflank-mailman (input) for mailman id 819725;
 Wed, 16 Oct 2024 09:16:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8GJ6=RM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t108V-0005Dr-9e
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:16:07 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45fe840f-8b9f-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 11:16:06 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-539983beb19so6739871e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:16:06 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a000129eesm391451e87.259.2024.10.16.02.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:16:04 -0700 (PDT)
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
X-Inumbo-ID: 45fe840f-8b9f-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729070166; x=1729674966; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lMS96kWM5Eui5gIIP4UZOxeSh3q2YL3fIRawSS4m1s=;
        b=Mj0Wx8eCBhJJoinEo/hdwMCMVWWoA0evI5uarwiSx5zXUCfwylbAaVBCq/3d+L1m+L
         Hp8jepS4l7vnMfL/QApXfrnwVyPnwO2LSSpzGV4Nblh2Wn4HOsxLi+4GdSQU2dK3PXQE
         Mic6MA02b3SSZso4H0L6s+/LX6F3oaHaYHLzM7Ec2XlicUW7d7/m5/RzRXxloVdyolcM
         +fDIvM5BRsfEIgQ2q0fsrDL/W8X2YDFcl9SI5+4HAtW9ySZxTiw3gSSnLNjOoebP/9/+
         B37FBZClijhVdeqvHBgpY1bavUte3WK2RKGomkV4nQWETTazGUhrhrorcZs8YbMTctbC
         QBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070166; x=1729674966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lMS96kWM5Eui5gIIP4UZOxeSh3q2YL3fIRawSS4m1s=;
        b=W5DQMtfJX0Q1r6FZVQ5+IL5bLSb2+IYTgSTXF+B26BLU1S02QPtXQ0beO9j2uDe+io
         gCM6jiM3ongdZ1qOWKWrwle/umbRTX8nCPiY3oiyB6SA8WHqIUiFDzIVATEfJDogEPbK
         wRoYkMXcvjYeMxzXr04uut9XFCjPF9YKZH04nxSkrdxXgaCtCQi7irXjHPSSiOu4nsqG
         jCBiakjaMWJHhLcddfbAVEOVUQMZvq/orjrcwO0YECZjlf6z5jtxHtXIoNnOh5KZwbS2
         5x2ot7I90zMq5WFh6Dy1m+JdyKOTzVGEMWJzn/xvypCj4EB4UY9gMQWLdfjr9jKWQZX8
         0t2A==
X-Gm-Message-State: AOJu0YwQgBBq9goMRSNjGuV7cEU1lMI6cmIMic/5dXcywUWvCNIqV70s
	DJzhRWNovGoA8+cQ47AqfdVk4S3NpEbVokjRBhEBcvGdCKKTg0INYhi/eQ==
X-Google-Smtp-Source: AGHT+IGb80fSI23TL9q6T+bth+NXlB2cHrY4hxUWVqG0EVh54POIsEn5HZendV2P+tHGigv2GJpZ1Q==
X-Received: by 2002:ac2:4c4c:0:b0:539:8e77:9129 with SMTP id 2adb3069b0e04-539da583e0fmr9305769e87.44.1729070165278;
        Wed, 16 Oct 2024 02:16:05 -0700 (PDT)
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
Subject: [PATCH v1 4/5] xen/riscv: initialize the VMAP_DEFAULT virtual range
Date: Wed, 16 Oct 2024 11:15:56 +0200
Message-ID: <c1aac25b3e772ca243ee74a131e2c861ef2a20ca.1729068334.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729068334.git.oleksii.kurochko@gmail.com>
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call vm_init() to initialize the VMAP_DEFAULT virtual range.

To support this, introduce the populate_pt_range() and
arch_vmap_virt_end() functions, which are used by
vm_init()->vm_init_type().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/mm.c    | 11 +++++------
 xen/arch/riscv/pt.c    |  6 ++++++
 xen/arch/riscv/setup.c |  3 +++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 53b7483f75..2a55246f80 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -352,12 +352,6 @@ void arch_dump_shared_mem_info(void)
     BUG_ON("unimplemented");
 }
 
-int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
-{
-    BUG_ON("unimplemented");
-    return -1;
-}
-
 int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
                               union add_to_physmap_extra extra,
                               unsigned long idx, gfn_t gfn)
@@ -516,3 +510,8 @@ void __init setup_mm(void)
 #else /* CONFIG_RISCV_32 */
 #error setup_mm(), setup_{directmap,frametable}_mapping() should be implemented for RV_32
 #endif
+
+void *__init arch_vmap_virt_end(void)
+{
+    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
+}
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index cc5e2d3266..d62aceb36c 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -1,6 +1,7 @@
 #include <xen/bug.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
+#include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
@@ -419,3 +420,8 @@ int map_pages_to_xen(unsigned long virt,
 
     return pt_update(virt, mfn, nr_mfns, flags);
 }
+
+int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+{
+    return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 2887a18c0c..3652cb056d 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -7,6 +7,7 @@
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/shutdown.h>
+#include <xen/vmap.h>
 
 #include <public/version.h>
 
@@ -62,6 +63,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     setup_mm();
 
+    vm_init();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.47.0


