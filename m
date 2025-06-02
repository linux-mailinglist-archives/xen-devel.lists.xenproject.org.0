Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017A9ACAB21
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002951.1382443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16R-0001j9-2C; Mon, 02 Jun 2025 09:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002951.1382443; Mon, 02 Jun 2025 09:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16Q-0001aw-Q9; Mon, 02 Jun 2025 09:05:06 +0000
Received: by outflank-mailman (input) for mailman id 1002951;
 Mon, 02 Jun 2025 09:05:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM16P-00081k-4S
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:05:05 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abc4a5a5-3f90-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 11:05:03 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55350d0eedeso56746e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:05:03 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdc3sm1507541e87.176.2025.06.02.02.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:05:02 -0700 (PDT)
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
X-Inumbo-ID: abc4a5a5-3f90-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855103; x=1749459903; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teuh5RSMor4Ejk4U6N2jEUsE+RWNO2fK7HvyuJpLGDk=;
        b=SOvwPxt5zh9+aUvv1EWJwG8xBGuXyAU+k218MbkKmTvz6VwOLoQ1ujp5qKnUOAhwr5
         VKDP8vI7gtY1DvGOKt2vLUQE9luC8oCP3itSAk94oF2bVYVK6AbKUT3/J7e+tZ2fjoN6
         HcHQPVZyGViXW10NY4sVkxxV8uGhQb6Fny+uWd+Cr4P1TG+BYAWjDrZc4pb7f4dAcWMP
         5OhdE0IChlHmsA1tB7W0KB5FWOGquADN3ISFRPgyapdd+OcZ1R7X7YYfupygDfe/a8dx
         H3AQfuSYjACxJsYsxn0Tp/UAlToE2saSE0Agp4Nk+UM3QX2NpL3Bv0H1698mZe8JAA0v
         V46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855103; x=1749459903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teuh5RSMor4Ejk4U6N2jEUsE+RWNO2fK7HvyuJpLGDk=;
        b=qXex9VcZkLLH6fBJQNSEBdKcpPwg8xjjrR2jg7JzElH8WEd+AT9Yw7rwd/9pMUkUgR
         VCW1xbL5vo3GrAk77V/DMdTLbFOQbUlEzUkNvHcIRR9BIBKYIRibePRz1PiRzM5QyW74
         1Oyg6h55UV8PaTJh9PJIMkd7xs4rZ1E6XVI0h4O+Y+kWY4cElUcokJAiI/NID8qgQBXj
         OPdGlFZ8vNLTicAlPTtEjAbguWlr+0Uf66LR9JvMdJAsgM8w7HdGBvo1YdmIEVpVS1F2
         QfU8g6NUx8bYrXbUN4nwxPS96JYhcYdeQtfoDK5QYR6qIiTYB6xCtdMPzy8YvPDO4D0o
         3nPA==
X-Gm-Message-State: AOJu0Yx8btZ1eIblxl9MiM2Zxg3UdjQ+almSeRi91jbLUsTcBggbF2OJ
	20oc/1tiy8FUNiusHAHOz8dowS4h8BOzknEOxCsSaJIoC6JvnfF8kOtqjSNMymFe
X-Gm-Gg: ASbGnct0/P4nv4VBR1sw31Fdq3XANiW802W0j6UX9WRAAmhFys3IS0Sow71AUq3eMlp
	zZm55lwXeLjqwHsaqB87MJg1ODfEYDMmPbEJnk1HjLGQT2G836YbYBxqknqycKPmLqKq9NBl8C1
	CrgeZVWo2OLa4VPEH+1+lYTuTXT5oo1Y3FMFduZYtUGoLueIeXUKloOqYMdVZ3LJZa4idgHL4ov
	/do//50j9JuVZLEal3JtqsF61WpZ8cEVjCZiAMKY3jzRBCycznUmvJukeQyGTrkwh9lGrjfSPmv
	H1RkJ2KQeH7WK0OkfdU2H0vSkHMwFNCUXlSaDhqUad+k7Nzkz7PkV2tYSpAR1rlEywyjafndhUt
	oP9jFT+4V9X2CHVEtfkduWG80Hw==
X-Google-Smtp-Source: AGHT+IEJbNUnDx2JeNnvdW9LV+EzHVXhdrAnE0wIQugHmKVHXrDvwNO2KkiktLN3zfaenjrUIhcqXw==
X-Received: by 2002:a05:6512:3b23:b0:553:27cb:b84e with SMTP id 2adb3069b0e04-5533d1bb77amr3481253e87.41.1748855102981;
        Mon, 02 Jun 2025 02:05:02 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xakep.amatop@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4][PART 2 09/10] xen/arm: Resume memory management on Xen resume
Date: Mon,  2 Jun 2025 12:04:20 +0300
Message-ID: <d8b9d3a9c6ba9c91045c8005b842082d47a68652.1748848482.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748848482.git.mykola_kvach@epam.com>
References: <cover.1748848482.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The MMU must be enabled during the resume path before restoring context,
as virtual addresses are used to access the saved context data.

This patch adds MMU setup during resume by reusing the existing
enable_secondary_cpu_mm function, which enables data cache and the MMU.
Before the MMU is enabled, the content of TTBR0_EL2 is changed to point
to init_ttbr (page tables used at runtime).

On boot, init_ttbr is normally initialized during secondary CPU hotplug.
On uniprocessor systems, this would leave init_ttbr uninitialized,
causing resume to fail. To address this, the boot CPU now sets init_ttbr
during suspend.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v4:
- Drop unnecessary DAIF masking; interrupts are already masked on resume
- Remove leftover TLB flush instructions; flushing is done in enable_mmu
- Avoid setting x19 in hyp_resume; not needed
- Replace prepare_secondary_mm with set_init_ttbr; call it from system_suspend

Changes in v3:
- Update commit message for clarity
- Replace create_page_tables, enable_mmu, and mmu_init_secondary_cpu
  with enable_secondary_cpu_mm
- Move prepare_secondary_mm to start_xen to avoid crash
- Add early UART init during resume

Changes in v2:
- Move hyp_resume to head.S to keep resume logic together
- Simplify hyp_resume using existing helpers: check_cpu_mode, cpu_init,
  create_page_tables, enable_mmu
---
 xen/arch/arm/arm64/head.S     | 16 ++++++++++++++++
 xen/arch/arm/include/asm/mm.h |  2 ++
 xen/arch/arm/mmu/smpboot.c    |  2 +-
 xen/arch/arm/suspend.c        |  2 ++
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 3522c497c5..596e960152 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -564,6 +564,22 @@ END(efi_xen_start)
 #ifdef CONFIG_SYSTEM_SUSPEND
 
 FUNC(hyp_resume)
+        /* Initialize the UART if earlyprintk has been enabled. */
+#ifdef CONFIG_EARLY_PRINTK
+        bl    init_uart
+#endif
+        PRINT_ID("- Xen resuming -\r\n")
+
+        bl    check_cpu_mode
+        bl    cpu_init
+
+        ldr   x0, =start
+        adr   x20, start             /* x20 := paddr (start) */
+        sub   x20, x20, x0           /* x20 := phys-offset */
+        ldr   lr, =mmu_resumed
+        b     enable_secondary_cpu_mm
+
+mmu_resumed:
         b .
 END(hyp_resume)
 
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 011bc1fd30..868282ec06 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -363,6 +363,8 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
+void set_init_ttbr(lpae_t *root);
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index 37e91d72b7..ff508ecf40 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
     clear_table(boot_third);
 }
 
-static void set_init_ttbr(lpae_t *root)
+void set_init_ttbr(lpae_t *root)
 {
     /*
      * init_ttbr is part of the identity mapping which is read-only. So
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index e3a9b68622..f3ad8517ac 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -65,6 +65,8 @@ static long system_suspend(void *data)
         goto resume_console;
     }
 
+    set_init_ttbr(xen_pgtable);
+
     /*
      * Enable identity mapping before entering suspend to simplify
      * the resume path
-- 
2.48.1


