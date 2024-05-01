Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD48B9FB6
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 19:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716042.1118134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aUA-0002j0-TJ; Thu, 02 May 2024 17:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716042.1118134; Thu, 02 May 2024 17:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aUA-0002gR-OJ; Thu, 02 May 2024 17:44:46 +0000
Received: by outflank-mailman (input) for mailman id 716042;
 Thu, 02 May 2024 17:44:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2aU8-0000pj-Ub
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 17:44:44 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8a5b5f0-08ab-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 19:44:43 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2dd615b6c44so93017441fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 10:44:43 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a056512054300b0051d94297380sm246511lfl.241.2024.05.02.10.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 10:44:40 -0700 (PDT)
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
X-Inumbo-ID: a8a5b5f0-08ab-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714671882; x=1715276682; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlS4R+HzAaSNTc1UbpABFZoTWu/mGL1X+XqG4cvjVE0=;
        b=F9R6ufdprF+Tj4Ul7mfpt03VlmdISYD9tR4/Da7gTnZprT6Km3bIVXgpjBqAqXKJ+p
         OtKFHQM17/sOJ2BV9Z3H3zp54hc1ochqGg2gPuLrIyen3y8Y0L3jFtV1dZSlVajWVpnh
         TKVBlY5I4Iuv3bevyP2v25AWjd8ycJcvU1jW3BvO1t6V7MPwQO54F4dsjPeEYPyXRxb6
         omYuhQps7AX+ZGub9vSQrB4E/RDVDSOhAiFu6nLa/ncL08D6LI+ByC6SCCCjBE0UEZoI
         H1MLZ7XEg2WnAuWrhbUFI8aqTF+Ck9TBlzdocHVORc95Pf+mdAnQ20QApY97IcYBjeh5
         ueQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714671882; x=1715276682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlS4R+HzAaSNTc1UbpABFZoTWu/mGL1X+XqG4cvjVE0=;
        b=brY201RW4GF2rHigqcEl2wuH5dafECwHkktHwL5/CDqgHjvo0/59Uk11lcakUhl0Nl
         cAvAv8KV+heG+w+j0ymqzD+yg/wi+Ex58xv0nlCOGIJU5W/CfCOPJA8AK1mWv3JO70l1
         SvuDPtZLfMl+YYbDxSOo68U71GHG9MjRlkeDGG6SUz5YWBS2QFVsu/REF98kweR4F83r
         wLYWPoQxZuXOBIUcjxdv8vXeIMA/A6yQ6gH/2ZUMrGd6+5CLvZ2l88dAMJCczxncVgks
         pW6Zn8pjl/5X4xnA+EGApW96XHvJIzwPMx8pU631ShinQbf3fA/X2Mdep5MjKqkq48a2
         te8g==
X-Gm-Message-State: AOJu0YzlB1eKRUH58gR8plrJyWxKM00XmpbLBdLlAT3tkag9LAzwKd+K
	mY34stmZjHt1zr2MMBt/3D5/7hGbEvd3fA2JMI6/mKQxkfA+rS0m2FEBee6G
X-Google-Smtp-Source: AGHT+IGjRyaLWSg4QpF1AbHHDfSCxyUL9ZKMbaLfp1r20NYD3hObym3Qg7SvgzXrGR8cJopa5nRmnQ==
X-Received: by 2002:a19:2d5c:0:b0:51f:5760:dd34 with SMTP id t28-20020a192d5c000000b0051f5760dd34mr307685lft.55.1714671882354;
        Thu, 02 May 2024 10:44:42 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v3 7/9] xen/arm64: mmu/head: Add missing code symbol annotations
Date: Wed,  1 May 2024 05:54:46 +0200
Message-Id: <20240501035448.964625-8-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501035448.964625-1-edgar.iglesias@gmail.com>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols
and add missing annotations.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/arm64/mmu/head.S | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index fa40b696dd..7788bb95e5 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -138,7 +138,7 @@
  *
  * Clobbers x0 - x4
  */
-create_page_tables:
+FUNC_LOCAL(create_page_tables)
         /* Prepare the page-tables for mapping Xen */
         ldr   x0, =XEN_VIRT_START
         create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
@@ -260,7 +260,7 @@ virtphys_clash:
         /* Identity map clashes with boot_third, which we cannot handle yet */
         PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
         b     fail
-ENDPROC(create_page_tables)
+END(create_page_tables)
 
 /*
  * Turn on the Data Cache and the MMU. The function will return on the 1:1
@@ -273,7 +273,7 @@ ENDPROC(create_page_tables)
  *
  * Clobbers x0 - x5
  */
-enable_mmu:
+FUNC_LOCAL(enable_mmu)
         mov   x4, x0
         mov   x5, x1
         PRINT_ID("- Turning on paging -\r\n")
@@ -304,7 +304,7 @@ enable_mmu:
         PRINT_ID("- Paging turned on -\r\n")
 
         ret
-ENDPROC(enable_mmu)
+END(enable_mmu)
 
 /*
  * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
@@ -316,7 +316,7 @@ ENDPROC(enable_mmu)
  *
  * Clobbers x0 - x6
  */
-ENTRY(enable_secondary_cpu_mm)
+FUNC(enable_secondary_cpu_mm)
         mov   x6, lr
 
         load_paddr x0, init_ttbr
@@ -328,7 +328,7 @@ ENTRY(enable_secondary_cpu_mm)
 
         /* Return to the virtual address requested by the caller. */
         ret
-ENDPROC(enable_secondary_cpu_mm)
+END(enable_secondary_cpu_mm)
 
 /*
  * Enable mm (turn on the data cache and the MMU) for the boot CPU.
@@ -340,7 +340,7 @@ ENDPROC(enable_secondary_cpu_mm)
  *
  * Clobbers x0 - x6
  */
-ENTRY(enable_boot_cpu_mm)
+FUNC(enable_boot_cpu_mm)
         mov   x6, lr
 
         bl    create_page_tables
@@ -365,7 +365,7 @@ ENTRY(enable_boot_cpu_mm)
          * by the caller.
          */
         b     remove_identity_mapping
-ENDPROC(enable_boot_cpu_mm)
+END(enable_boot_cpu_mm)
 
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
@@ -377,7 +377,7 @@ ENDPROC(enable_boot_cpu_mm)
  *
  * Clobbers x0 - x1
  */
-remove_identity_mapping:
+FUNC_LOCAL(remove_identity_mapping)
         /*
          * Find the zeroeth slot used. Remove the entry from zeroeth
          * table if the slot is not XEN_ZEROETH_SLOT.
@@ -419,20 +419,20 @@ identity_mapping_removed:
         flush_xen_tlb_local
 
         ret
-ENDPROC(remove_identity_mapping)
+END(remove_identity_mapping)
 
 /* Fail-stop */
-fail:   PRINT("- Boot failed -\r\n")
+FUNC_LOCAL(fail)   PRINT("- Boot failed -\r\n")
 1:      wfe
         b     1b
-ENDPROC(fail)
+END(fail)
 
 /*
  * Switch TTBR
  *
  * x0    ttbr
  */
-ENTRY(switch_ttbr_id)
+FUNC(switch_ttbr_id)
         /* 1) Ensure any previous read/write have completed */
         dsb    ish
         isb
@@ -464,7 +464,7 @@ ENTRY(switch_ttbr_id)
         isb
 
         ret
-ENDPROC(switch_ttbr_id)
+END(switch_ttbr_id)
 
 /*
  * Local variables:
-- 
2.40.1


