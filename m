Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39282B820B7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125587.1467536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08B-0000RD-Ju; Wed, 17 Sep 2025 21:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125587.1467536; Wed, 17 Sep 2025 21:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08B-0000N6-Dq; Wed, 17 Sep 2025 21:56:03 +0000
Received: by outflank-mailman (input) for mailman id 1125587;
 Wed, 17 Sep 2025 21:56:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08A-0007Lt-0B
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:02 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 188a8614-9411-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 23:56:00 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-26060bcc5c8so2756425ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:00 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:55:58 -0700 (PDT)
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
X-Inumbo-ID: 188a8614-9411-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146158; x=1758750958; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYl+pG2N9Nhab3KxViLh94cYkpftDfJm9blLM7BMKXo=;
        b=ZabRb93aMI/6jVxFRW65/LeNkDgD5LGWU8azLn5lD85DtbNeEwZHNHKw1oN7gVCIti
         YNWPUTuoMus5Ih/rfts9SpQ2Urc/SQH5LCur9Z0iJGOW/bKwVeKjU3qORwlEZnXMDiYr
         hFlXSceAyb87nmIE/n2SzIAD/pYmNne/UyR4nrFygVu0RQmFeLQjeelLQw14Gv0ipgER
         2Z6WHQgTmkaCr1fVomrAAMvPCcY0qrazIiHTkUfbUatbl9NSVZnrd5IR1tNUPlP3MJgY
         7BodOzkQ8eQAgOfJuuzq9m/6yHODvWEsMFheoGhZuyAM2/8nV8kMMUgSsSD9AVUzMJA5
         aY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146158; x=1758750958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYl+pG2N9Nhab3KxViLh94cYkpftDfJm9blLM7BMKXo=;
        b=tUzPrmqXmcwLZnEMGLz+9ftpxafQC42jczdH1qZubRqvuGec9oYHl1qbKBFLj7mtUR
         1bEKAT+oBXTzUgXllBmg7hTVmwrOvRYzmXEi1R6MlQ08A8IYs7scv3ugJOHIl/6qInjn
         4s985EQ3XtNqQQhhO5egt8Zyew8FzUhAJej9Hpc5rn6b1EJFtvpjpoms3sVGz2OhIK1J
         TVqTuTgOM/hD8LPJ7kaHZDUQQdHyZXOadV2qyH5kCVvTeecC5etbVmFkMmn2gDS9E3Bf
         tJD9m6wMXqEiS4PlKXsu54RzujmO9WYMyn7JUUs7lystaWwoyNVnrHf9x+Pkyun+3bzr
         ztPA==
X-Gm-Message-State: AOJu0YxVF3tiiNGc6JuEXy1+SlyRnsex17gu3kwHehev0zymK8qhDBTt
	n7nKjIhPA45/xQD1BDkedwwyxxnfF4arfkflkvY4Ut/kbhzCuxhGPzvwayIzNkpUChg=
X-Gm-Gg: ASbGnctQdL40e5moIb6zA8jKWHjVtw6OmRy7YYKk8625n2mOph2Koeh2BpDcE/jgZSy
	6Qp+rwcXypKVnhf3ou/NstPgoiumTQwIJdtf04XJ4i4HEB+zv/hm5KBCtKea8GCmSv7LGCv2ypT
	oH8TfPFaouQTLrkm7LUmVs8q+N+TRALodeAB+t67UOpgwgQ17YTCp8RSH5Y7knqrrG8K6H0IpUL
	NQ+fQTOmUuC3YWZij8NZCK/U7stO12T2qII9idxWHNG0+Jan/olRjbesy+JTk9xsVRdmhJIevwA
	agZntRQnZHQDWLNFlJIdQXtpX6dS7M/bGtClORiOGf4e3S4qfIxOgtfLhkmgtsCDL3+Y+BXAmPJ
	/K+quxbWNJoVeEutBmwcdVpJydWYKmRvTA+M3wKybcGSD
X-Google-Smtp-Source: AGHT+IFnumY9siDQegtICLpdxupa9QH6vR74mAKgKmfzrPcceZ89BYgc2V5zoRaIeToLTpYbTDMb8Q==
X-Received: by 2002:a17:902:ea03:b0:24b:4a9a:703a with SMTP id d9443c01a7336-2681216914bmr54014015ad.17.1758146158593;
        Wed, 17 Sep 2025 14:55:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 06/18] xen/riscv: introduce pte_{set,get}_mfn()
Date: Wed, 17 Sep 2025 23:55:26 +0200
Message-ID: <88bac831f9d1dddd1186179f8fa6fbb44a07dd35.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce helpers pte_{set,get}_mfn() to simplify setting and getting
of mfn.

Also, introduce PTE_PPN_MASK and add BUILD_BUG_ON() to be sure that
PTE_PPN_MASK remains the same for all MMU modes except Sv32.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - Nothing changed. Only Rebase.
---
Changes in V3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V2:
 - Patch "[PATCH v1 4/6] xen/riscv: define pt_t and pt_walk_t structures" was
   renamed to xen/riscv: introduce pte_{set,get}_mfn() as after dropping of
   bitfields for PTE structure, this patch introduce only pte_{set,get}_mfn().
 - As pt_t and pt_walk_t were dropped, update implementation of
   pte_{set,get}_mfn() to use bit operations and shifts instead of bitfields.
 - Introduce PTE_PPN_MASK to be able to use MASK_INSR for setting/getting PPN.
 - Add BUILD_BUG_ON(RV_STAGE1_MODE > SATP_MODE_SV57) to be sure that when
   new MMU mode will be added, someone checks that PPN is still bits 53:10.
---
 xen/arch/riscv/include/asm/page.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index ddcc4da0a3..66cb192316 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -112,6 +112,30 @@ typedef struct {
 #endif
 } pte_t;
 
+#if RV_STAGE1_MODE != SATP_MODE_SV32
+#define PTE_PPN_MASK _UL(0x3FFFFFFFFFFC00)
+#else
+#define PTE_PPN_MASK _U(0xFFFFFC00)
+#endif
+
+static inline void pte_set_mfn(pte_t *p, mfn_t mfn)
+{
+    /*
+     * At the moment spec provides Sv32 - Sv57.
+     * If one day new MMU mode will be added it will be needed
+     * to check that PPN mask still continue to cover bits 53:10.
+     */
+    BUILD_BUG_ON(RV_STAGE1_MODE > SATP_MODE_SV57);
+
+    p->pte &= ~PTE_PPN_MASK;
+    p->pte |= MASK_INSR(mfn_x(mfn), PTE_PPN_MASK);
+}
+
+static inline mfn_t pte_get_mfn(pte_t p)
+{
+    return _mfn(MASK_EXTR(p.pte, PTE_PPN_MASK));
+}
+
 static inline bool pte_is_valid(pte_t p)
 {
     return p.pte & PTE_VALID;
-- 
2.51.0


