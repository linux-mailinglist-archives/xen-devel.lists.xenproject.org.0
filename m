Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96285B15E5B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 12:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063727.1429457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4D9-0008Bv-C4; Wed, 30 Jul 2025 10:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063727.1429457; Wed, 30 Jul 2025 10:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4D9-00088q-8B; Wed, 30 Jul 2025 10:39:03 +0000
Received: by outflank-mailman (input) for mailman id 1063727;
 Wed, 30 Jul 2025 10:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06yH=2L=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uh4D8-0007vS-7b
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 10:39:02 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 672e308e-6d31-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 12:39:00 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af8ed6ae8c4so32262866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 03:39:00 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af8f1b17364sm183230166b.66.2025.07.30.03.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 03:38:58 -0700 (PDT)
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
X-Inumbo-ID: 672e308e-6d31-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753871939; x=1754476739; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fs7immBpsjg/CC1c0NrPQ+GJ1vwL40420mXoAA5WNDg=;
        b=CY6cPzsx3L/4+wxlvr0nQ2Qm+puTvDdcETe6c4b7cWO+6CF04+WkiRfasbYVkDteKt
         GWBV/81pXhUvfn3ez4n3tvLwXwdh8vSWNS1Wq3XtpJAmxq3+3LIQTfD/6SqAWi/KoAMb
         1K878zZn1f3uFKZJGuBLNzN4eGyTC+t0X20s4C1p+VzOqz3QuXCyFmD1wwgZE3+md4wH
         2yrHPHBWj6lOrQ+wy3sh5ha/ANQU3EkkJ5/bVV+vfKliSLIIrlfrVLq55RxuA3BNpvRj
         47RZhZ9OOouZgky5ELk2W90E2+OB3sABVZxuVBMMNnGWbWrgUcOuahwCoEJTmJxG2Cu1
         xvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753871939; x=1754476739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fs7immBpsjg/CC1c0NrPQ+GJ1vwL40420mXoAA5WNDg=;
        b=ffocWNnJmnx2s6vJTKHP8ud3a+BWphfQJdx6MegV8SUZNo64FQIQovFY4maUyKkBRA
         2fCfmesdAVfyf/YYn6Y6/u31wXXwfMr2O5pXP9+EXX3ZMiZAXnVbPUxxGZQa9PPe9M74
         Jw0aedQnDO7fKQ1ysgjmivc7fHeXzvFrBacQkVmMZXdKXkeVxMlOpM7BN9UFA3AoBheE
         jHBMKghE+UNPT9//5MjlCvozQeTkosEU0z7C2zE13MdIxih9GCRKXaxMJrAyL2LAxBhd
         fRabuacb3OlEvWtl4LrqS81klAapHTF1+HGf1hcXHU1SRGWMtVf7gTvH3xqPcd5NwoLQ
         vIxg==
X-Gm-Message-State: AOJu0YzfKSKM9dhnBFSaCcpP/X9IcaGT4LFh7ecMEZvWPX86qXPC040X
	KvKYnRM/StNh+K+SzKwRWWRcvRni2UiHUjK9Zficsl65TzTDTSDm+jAfOj9JI3Td48I=
X-Gm-Gg: ASbGnctVMBwRVlBozpCwj9bvRjnBNCGp70oahX8MYBEiwGXY+veFsR6P+pJb0RIgQMS
	rtbCgEmyUnctL4q4+N7mu9gUlLcU3lZ5oay5/ZHRF+M+cFO2KQFQgn4sfscUiXecA4PDPeedHz4
	UcsbJj6NKOZC9sQ3jbAHHVJMMgmhXLRTJLAW1B/JVzJKpjsndR2KTMxEokRM2Uzn2d/Xvxo96VQ
	PmJhf6/vphsertmeBAg4pozcGkOvLF/x7RRrq8SwTKVTgL4JltJRN9nE6PO4qFQ9pGFdbx6u5Zq
	LzHIJgqCdc82+GKsgk43JMmUx/qHo4FflgBP2i6xP1rB5Mw2/PGbi6KKJAbxZNwMQXbtAKvBuMI
	gOcrolZ9dFeWxvS0K/+A/u9igwAsy/ukn7UWO825bt4AWyI9AvT5CiQABYK/V3gWc24GKzNE/sR
	GvcYWdIeoA9rPAZbwbTuab3A==
X-Google-Smtp-Source: AGHT+IFno4gD5Y7pvle2bN5tEJvlNS3/nYgVwaIf2nbxvuDWeKRZdpgVfDgukn+beZvtPJz8RDrPOA==
X-Received: by 2002:a17:907:3f16:b0:ae0:bb1a:8c4 with SMTP id a640c23a62f3a-af8fd69c0bcmr126204766b.1.1753871939112;
        Wed, 30 Jul 2025 03:38:59 -0700 (PDT)
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
Subject: [PATCH v11 1/6] altp2m: Drop p2m_altp2m_check() stubs on non-x86, move prototype, and guard uses
Date: Wed, 30 Jul 2025 10:38:45 +0000
Message-Id: <ee9b656301dfc7dbe09a729ff8c2febbfddb61c7.1753871755.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753871755.git.w1benny@gmail.com>
References: <cover.1753871755.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Remove the no‑op stubs from the ARM, PPC, and RISC‑V p2m headers and stop
providing a stub in arch/x86/include/asm/p2m.h.

Declare p2m_altp2m_check() in xen/include/xen/p2m-common.h and gate all
call sites with CONFIG_ALTP2M:
 - wrap the fast_single_step block in hvm/monitor.c with #ifdef CONFIG_ALTP2M
   (IS_ENABLED(CONFIG_ALTP2M) is not used here, because in the following commit
   hvm_vcpu::fast_single_step will be guarded by CONFIG_ALTP2M)
 - make the vm_event.c path conditional via IS_ENABLED(CONFIG_ALTP2M)

No functional change intended: on builds without ALTP2M the calls are
compiled out; on builds with ALTP2M behavior is unchanged.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
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


