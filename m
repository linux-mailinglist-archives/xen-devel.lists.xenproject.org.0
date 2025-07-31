Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668D6B16E9A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065150.1430497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPa8-0000Nm-Tt; Thu, 31 Jul 2025 09:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065150.1430497; Thu, 31 Jul 2025 09:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPa8-0000LC-QX; Thu, 31 Jul 2025 09:28:12 +0000
Received: by outflank-mailman (input) for mailman id 1065150;
 Thu, 31 Jul 2025 09:28:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X87O=2M=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uhPa7-0000Jb-AZ
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:28:11 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac1871b7-6df0-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:28:09 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-456053b5b8cso958275e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:28:09 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfcc1sm60905485e9.17.2025.07.31.02.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 02:28:08 -0700 (PDT)
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
X-Inumbo-ID: ac1871b7-6df0-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753954089; x=1754558889; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdUDk8PNeElBQFIXVeH+4JTV5pz3z+NOKkKyz1LFf2U=;
        b=W5s9AU48HEztfQElEyALu36g8EOW7LFaYMund+6XxQ8krzuJZvQHjY+4CmFz/BxIUY
         F9ZBJ8jCqFvrYHQbQE/jwE/Yh9nz2xwfuyaalGdke4Ct+51mOrNnVW/zsfCpTQl3AaKq
         d7RkNtko0/CDYHZ2tB/PI3rJRCwYnAGBIPnmywAOdXHw38A5qzlPq/gb7e9ad9ohsZGS
         Ru/rv49XewJpWuW12LoxFhW7GTXIO4SMBCdQCT4AGEDw3fIgGRwmN+sk1qWlTRylv00k
         feZnuQv1YZkyBNP/xxHlGHYPgK8u+nrYzGI9zVoynbnX3Dx0YCDaGQ/dywcIMlhPh87S
         eTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954089; x=1754558889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdUDk8PNeElBQFIXVeH+4JTV5pz3z+NOKkKyz1LFf2U=;
        b=hloyoCdu+DySIaQEhp/4Z35udMAr1bA81VTrWgfxiqgegN7LdXsnBY34ULtPuZL4zR
         v3iTRiWqBDjxg0FwEnMOzvGCk6GcyfY8sRbZT/i6GufRcWJQ6KjhfEIgCfHSBX8ZFMtv
         pd3bkYZ8MaiaFhNRu/Ql1RccjU377zExu3appiCZipEzYtX0au9m9zQ2608xsVXKgY73
         DKd+TofP40Sc8b8rVQD157hi0BbsV5XubCOYlHhwvvKc/f8ZRbpJap6Um5dmUXVuK9SI
         DDIvVPV01A+lZVMg0MmBxWGdHaZd4dPKyWfyNWbfnyXEBvHmu9uKwMKxlltcfD64EV81
         WexQ==
X-Gm-Message-State: AOJu0YxpCD5wrWNMrMU++gIUSlX7HJgPHOB8f3bTXUVrc3Fdz+mODR8L
	hujp4bC+cYiEMiAbA2ggffw+1Gjp/DAclVeLmtC+atXKoLRbwb+M0UXoyDeIIr90
X-Gm-Gg: ASbGncs/bwsKkf5DuzSj4KZfYehHw7aNRbbrAkZlDQFsrk1VrXbMGZ4NpRzV/4pBhGm
	lipIOMHvz4fn169KH23A4dn+1n919o6GS593BeWUpoEOKnF82Dv8EeeEgCEwnCOKtg0RGGi6nyr
	CSkXC4YVSyZAOiHrZ1L9hzfmFWzuSeFIPe3Vj504701YLHD7HnYOy2JnXlJcEfQc8NWjb5sApIG
	s1/b6/aq44WGqq8lPqa3RTcM0jAJv+m1Dzitw85Udl46CwQZFPS4Kupo2vlOWB6fr1qQM6CKwDS
	hVKM9o2XxUtQQ5pvsZQ/xA6H3pEI74gOF9IDzKbnyRun+NN8adiQ+374o5/+NY5jTjOG9U5cbF5
	lfoqxmZr0XbTO5Jr+5qtFwqL4/DkokumHoSCmZZ+A8TA8oS6Lklk36KP5ENdKCaRbY17q3+eNrT
	4WhXGUfeG2dsvtw/prLDvqqw==
X-Google-Smtp-Source: AGHT+IG6n6aFGbUSrsHSAh0aU46l2diUOlWIJm35CRQ1UhDTmou18GJKCwrhit53VyT1kWPxPp8SOg==
X-Received: by 2002:a05:600c:3e15:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-4589e8745e9mr8944225e9.6.1753954088600;
        Thu, 31 Jul 2025 02:28:08 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v12 1/6] altp2m: Drop p2m_altp2m_check() stubs on non-x86, move prototype, and guard uses
Date: Thu, 31 Jul 2025 09:27:56 +0000
Message-Id: <44b4b60854cd7db6d529ff23bb228e9ac19a2a75.1753953832.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753953832.git.w1benny@gmail.com>
References: <cover.1753953832.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Remove the no‑op stubs from the ARM, PPC, and RISC‑V p2m headers and stop
providing a stub in arch/x86/include/asm/p2m.h.

Declare p2m_altp2m_check() in xen/include/xen/p2m-common.h and gate all
call sites with CONFIG_ALTP2M:
 - wrap the fast_single_step block in hvm/monitor.c with #ifdef CONFIG_ALTP2M
   (IS_ENABLED(CONFIG_ALTP2M) is not used here, because in the subsequent commit
   hvm_vcpu::fast_single_step will be guarded by CONFIG_ALTP2M)
 - make the vm_event.c path conditional via IS_ENABLED(CONFIG_ALTP2M)

No functional change intended: on builds without ALTP2M the calls are
compiled out; on builds with ALTP2M behavior is unchanged.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/arm/include/asm/p2m.h   | 6 ------
 xen/arch/ppc/include/asm/p2m.h   | 5 -----
 xen/arch/riscv/include/asm/p2m.h | 5 -----
 xen/arch/x86/hvm/monitor.c       | 2 ++
 xen/arch/x86/include/asm/p2m.h   | 8 +-------
 xen/common/vm_event.c            | 3 ++-
 xen/include/xen/p2m-common.h     | 3 +++
 7 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 2d53bf9b61..ef98bc5f4d 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -180,12 +180,6 @@ static inline bool arch_acquire_resource_check(struct domain *d)
     return true;
 }
 
-static inline
-void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
-{
-    /* Not supported on ARM. */
-}
-
 /*
  * Helper to restrict "p2m_ipa_bits" according the external entity
  * (e.g. IOMMU) requirements.
diff --git a/xen/arch/ppc/include/asm/p2m.h b/xen/arch/ppc/include/asm/p2m.h
index f144ef8e1a..c96149ef74 100644
--- a/xen/arch/ppc/include/asm/p2m.h
+++ b/xen/arch/ppc/include/asm/p2m.h
@@ -88,9 +88,4 @@ static inline bool arch_acquire_resource_check(struct domain *d)
     return false;
 }
 
-static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
-{
-    /* Not supported on PPC. */
-}
-
 #endif /* __ASM_PPC_P2M_H__ */
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 28f57a74f2..e43c559e0c 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -88,11 +88,6 @@ static inline bool arch_acquire_resource_check(struct domain *d)
     return false;
 }
 
-static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
-{
-    /* Not supported on RISCV. */
-}
-
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index 523586ca98..d22a2e4644 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -178,6 +178,7 @@ int hvm_monitor_debug(unsigned long rip, enum hvm_monitor_debug_type type,
         break;
 
     case HVM_MONITOR_SINGLESTEP_BREAKPOINT:
+#ifdef CONFIG_ALTP2M
         if ( curr->arch.hvm.fast_single_step.enabled )
         {
             p2m_altp2m_check(curr, curr->arch.hvm.fast_single_step.p2midx);
@@ -186,6 +187,7 @@ int hvm_monitor_debug(unsigned long rip, enum hvm_monitor_debug_type type,
             curr->arch.hvm.fast_single_step.p2midx = 0;
             return 0;
         }
+#endif
         if ( !ad->monitor.singlestep_enabled )
             return 0;
         req.reason = VM_EVENT_REASON_SINGLESTEP;
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 58b56e575e..c53f4e487d 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -962,17 +962,11 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
 /* Set a specific p2m view visibility */
 int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
                                    uint8_t visible);
+
 #else /* !CONFIG_HVM */
 struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
 #endif /* CONFIG_HVM */
 
-#ifdef CONFIG_ALTP2M
-/* Check to see if vcpu should be switched to a different p2m. */
-void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
-#else
-static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx) {}
-#endif
-
 /* p2m access to IOMMU flags */
 static inline unsigned int p2m_access_to_iommu_flags(p2m_access_t p2ma)
 {
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 1666ff615f..b2787c0108 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -431,7 +431,8 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
             vm_event_toggle_singlestep(d, v, &rsp);
 
             /* Check for altp2m switch */
-            if ( rsp.flags & VM_EVENT_FLAG_ALTERNATE_P2M )
+            if ( IS_ENABLED(CONFIG_ALTP2M) &&
+                 rsp.flags & VM_EVENT_FLAG_ALTERNATE_P2M )
                 p2m_altp2m_check(v, rsp.altp2m_idx);
 
             if ( rsp.flags & VM_EVENT_FLAG_SET_REGISTERS )
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index a322e738ef..f0bd9a6b98 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -24,6 +24,9 @@ int unmap_mmio_regions(struct domain *d,
                        unsigned long nr,
                        mfn_t mfn);
 
+/* Check to see if vcpu should be switched to a different p2m. */
+void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
+
 /*
  * Populate-on-Demand
  */
-- 
2.34.1


