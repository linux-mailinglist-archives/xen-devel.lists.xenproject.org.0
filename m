Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16F2B216CA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077956.1439039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS8-0008Id-Et; Mon, 11 Aug 2025 20:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077956.1439039; Mon, 11 Aug 2025 20:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS8-0008DN-3h; Mon, 11 Aug 2025 20:49:08 +0000
Received: by outflank-mailman (input) for mailman id 1077956;
 Mon, 11 Aug 2025 20:49:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZS6-00063z-1e
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:49:06 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d80cc54-76f4-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 22:49:03 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6156463fae9so9170657a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:49:03 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:49:01 -0700 (PDT)
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
X-Inumbo-ID: 9d80cc54-76f4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945343; x=1755550143; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vCXXOUavoZEz6D2AXJtCOcWlfxhKLbJDHEKs+IY4pA=;
        b=PhCLYhne379ksm8mcXqWW6nb/iLzlDTY6PJ5GbnlMgj3/FF1d8Bd84tL+49N+uCEnx
         /usrWKeDFbUKA/8cgY3g/MqZHgkbZ3w11Y2W1n4TSgcZI6cGz1e0uOmB2VzLm+MWzuX4
         KVN0v7P/U44M5moXnGyVTu47u7WvBLfL/rHGR7MSt3eYXNHxNK+pTMfK9Xr8Wbnr5gfA
         ey8nmIY7quiCp7OjBJbSerV0jjKBXNBcJcJvsJ4MiD+IEpHpNn/Iw2JG7DUhjfHmZTWP
         K5+DRLiScp8zW41VvwVXeZArqTVWg2iQEIHyFYi+ZrJS9i4iKzunVEDwX0snakW8USuq
         iExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945343; x=1755550143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vCXXOUavoZEz6D2AXJtCOcWlfxhKLbJDHEKs+IY4pA=;
        b=MTJJj+PjKq7yBbpSUCbmMye1DXj17kda72RFV9Kwoqkhlqj6R5kHYZt0v2h/LJSE+0
         0ycRtblroQ8+ALYQoZWleGneSgyyrd5b6R7Hqc874uRWtQUIwxRqlxkTmWBSEfwUHvjU
         T8aAbRPdKTB/5KR2OpWLzYckgaz3t6tbY+1ki9DcSqDFzP88Qx62aPbNN5W6mA53ago2
         Li7uoprSGn9K+9x869kUYwGkHhpq0PNgX3ouAHii0J9GWW2VNdsLtc2B+amwZJdJydAh
         uqmygQnszEYNl86ySVdePxYM44fkSrW/TY2CslgwxLHlBT50CCrkXbh03kL26vgz94F9
         oG3g==
X-Gm-Message-State: AOJu0YwKB6YPA5JU1CpuS56yder6XzAa7lgawRKRoGTjZEXRC2dOW9Wo
	Fyqacw7vnLlJS+F/dqUXL3af70fLOY+pXjxCov1rJeWoiacc4HFGReuz3rGBDg==
X-Gm-Gg: ASbGncuhQT2UOZ4J5Yp2QHVjY2i3T4Y/38LT1g2kQ1RWa+2sziUcZ2bPZ38DsG0tRwX
	PLNdcECDTPu+b7b1BeumjxvikuRGs2nFUBBeRtuipzPXkD7KYU5JIEFJ2q5POWR6SDdvbewD55V
	zKtSib3yAxgbpW82zYIuVdt7jkQDHP6lcVcII6dQAVmpHE4A9RiEBgesLD3rP1FbA4kpXOYNvET
	zwxlIABHmG1ycChKW9uaniZ40X/tsG7MJhaEywvm64uh/7EADXMYjTjIc9PYcarstOGWS1vwRFV
	Q6zaJQf0BjA+QTi2QYWRojIH+j1djCJSVFbas/wwGGQ/n4pv8lD8h/d7yVmkIRxTAFv3X1+VHTf
	7/BLpyqjZky69zv7PUyAonRtaG5nbsBUULRN8dyoZBnW+Rfz/8mb4Nn0bh9jo4MjZPes=
X-Google-Smtp-Source: AGHT+IFvx2QD9CEtIMTGc3JxuJiqe7FLmH+70iO+zvpaaiT8vngEUoYYhmLIc6hkC66nAn22bDo2qg==
X-Received: by 2002:a17:907:1b0e:b0:ae6:c334:af3a with SMTP id a640c23a62f3a-afa1d617a33mr113078066b.6.1754945342363;
        Mon, 11 Aug 2025 13:49:02 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v5 09/12] xen/arm: Resume memory management on Xen resume
Date: Mon, 11 Aug 2025 23:48:05 +0300
Message-ID: <f0b8c21e34fc4a0e639cb677912f54e4f316d8c0.1754943875.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
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
index fb79aeb088..3400cb2bff 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -365,6 +365,8 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
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
index 11e86b7f51..08b6acaede 100644
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


