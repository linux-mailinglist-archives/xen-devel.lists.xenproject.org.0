Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60C9B07EB0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045627.1415798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xm-0004U4-5p; Wed, 16 Jul 2025 20:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045627.1415798; Wed, 16 Jul 2025 20:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xm-0004Jd-0A; Wed, 16 Jul 2025 20:15:58 +0000
Received: by outflank-mailman (input) for mailman id 1045627;
 Wed, 16 Jul 2025 20:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2WS3=Z5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uc8Xk-0003uZ-IS
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:15:56 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae08f426-6281-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 22:15:56 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4e57d018cso22315f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 13:15:56 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e8csm30504145e9.5.2025.07.16.13.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 13:15:54 -0700 (PDT)
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
X-Inumbo-ID: ae08f426-6281-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696955; x=1753301755; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOOuvJZYZXWyW3TNAhVhGpb6GbfsoYMK9X46Miiu2ok=;
        b=Tk4Y9bNmuBiUKX4XRhaPWKKDR0m6u6JON4totcjUEDoTthhM3YckfxXlYFeRCyXowl
         NUrIbfF4pLiKg2OkN/OX8okDM7oBaLOQuWZJ3u+e9mSjDXOZcBGnJowvugHjOKFK9EaX
         V53WlMWlCLtpzTdfge/LAVlKSDLa2PQhBJsF6ZflwaKrncw7ABdf5y2Sj682GQeQv19U
         7GsLWqGruxMXO7kFT2L3iExl1VbNgTbZ1kGhss/v7PN9YCEalrrZ7m3HHP4gTVm4Ksod
         NGOXtREpUnDB6HgPKR9y/gHveoKCsGcVRb7g58ywslsG4zBoNAPX0YvpV7NSbEAdn5PW
         RC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696955; x=1753301755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOOuvJZYZXWyW3TNAhVhGpb6GbfsoYMK9X46Miiu2ok=;
        b=d60ge1uKFuIsHD3MhNQF/ZH5iuT3hqhYW7LshRgQho9P503V2qPcXsVouwfmpKJAmz
         HwZKhJclVlM3Ew+B6D3HbMv1xfOxfEszdlYe+9ZA2dj4wsGWW2XSfj+xQM4r8OH9iBfP
         pRsaCAIHvJ/S4yP70ii236COU5av1OIKCyk/E1kNv6gNxF4BC8S+F+7wZdC9t/ggUYMi
         45BrJ5yBkf1NeVZK9XGg4sRnD6fJfqEwlNzdb3j430Ph+3vBthpV0PlHuyIu44vH6B8D
         u7I23aZb3aW4YZMVQkZqcM33MGZ5Eb+SzAkSLF53zs6kIIKEHc/jJIcXEKtuenC5kjJO
         nQSg==
X-Gm-Message-State: AOJu0YyOTHsWoGIgMs7A546RYYOn2AMa3WlSzf1cZsWhl5iVDf/O0Hvo
	lxOHXTQWcH0fAWYp1hDgNghBvPLBrtAo0+WLf+qZ8vrTodvOHeMwmo1SmV+Vow==
X-Gm-Gg: ASbGncsrsxGWtSmIX78TLdfZ0L9WMKfA30QaUy/83lp7cSwHU71Ex9ySEwM99LtOZJ3
	7TDqM0Da+cv8tuli4QRZ+/+zUzlJD3nFQnW7xfgn0zepqFr1jje3COb1CcvZZwTg9LwHJ0Ae8lp
	fBKuCavR5G2TUMhRoUvTsNeL7oVio/Z8OCT1R/vSM3r1SUUlrDmZ9pMv+BMSZyUt2D0NIP875/T
	iGP4sszVLhvicLvrSVUp8LbSl5xFua/AcEIOOUj+UUSFSnK5aw75b9cAcWTAT7pNQbqbU26Ugzg
	8rqA6ofRYX2iYnzPhKSggP/s2Qe/OeF9t5JDV3et6oPv0vo4y+fjfphsbBuH75m3OUQ/+6p0U+8
	alHI0AgEt1VEwKzdd8kD1ZAQ7whTDcYRRimnLI3ZZcgjyhneMx1hEvYqDmMvZAbXvG3H4psVqa2
	HSpoX0HZ63qvbVyLDi4xNqhg==
X-Google-Smtp-Source: AGHT+IHe33aKatrvuakEauHcsqKPfkwsS7bKer6g4mjhfSUEZ/C0u+ncTGyA8RtCy14IPsBduuTpMg==
X-Received: by 2002:a05:600c:4f0c:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-4562dff98b5mr19593435e9.1.1752696954808;
        Wed, 16 Jul 2025 13:15:54 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v10 4/9] x86/altp2m: Remove p2m_altp2m_check stubs from unsupported architectures
Date: Wed, 16 Jul 2025 20:15:34 +0000
Message-Id: <3c46e6bd09b2481360fbdf812926d199c5416198.1752691429.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752691429.git.w1benny@gmail.com>
References: <cover.1752691429.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

The p2m_altp2m_check() stub was previously declared on all architectures,
even though the altp2m feature is only supported on x86. This patch removes
the unused stub definitions from ARM, PPC, and RISC-V, and wraps the actual
usage sites in #ifdef CONFIG_ALTP2M instead.

Additionally, the declaration and definition of p2m_altp2m_check() are now
correctly nested under CONFIG_HVM, reflecting the fact that CONFIG_ALTP2M
always implies CONFIG_HVM.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/arm/include/asm/p2m.h   | 6 ------
 xen/arch/ppc/include/asm/p2m.h   | 5 -----
 xen/arch/riscv/include/asm/p2m.h | 5 -----
 xen/arch/x86/hvm/monitor.c       | 2 ++
 xen/arch/x86/include/asm/p2m.h   | 9 ++++-----
 xen/common/vm_event.c            | 2 ++
 6 files changed, 8 insertions(+), 21 deletions(-)

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
index 58b56e575e..7375895836 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -962,17 +962,16 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
 /* Set a specific p2m view visibility */
 int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
                                    uint8_t visible);
-#else /* !CONFIG_HVM */
-struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
-#endif /* CONFIG_HVM */
 
 #ifdef CONFIG_ALTP2M
 /* Check to see if vcpu should be switched to a different p2m. */
 void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
-#else
-static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx) {}
 #endif
 
+#else /* !CONFIG_HVM */
+struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
+#endif /* CONFIG_HVM */
+
 /* p2m access to IOMMU flags */
 static inline unsigned int p2m_access_to_iommu_flags(p2m_access_t p2ma)
 {
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 1666ff615f..98204cbf43 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -430,9 +430,11 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
              */
             vm_event_toggle_singlestep(d, v, &rsp);
 
+#ifdef CONFIG_ALTP2M
             /* Check for altp2m switch */
             if ( rsp.flags & VM_EVENT_FLAG_ALTERNATE_P2M )
                 p2m_altp2m_check(v, rsp.altp2m_idx);
+#endif
 
             if ( rsp.flags & VM_EVENT_FLAG_SET_REGISTERS )
                 vm_event_set_registers(v, &rsp);
-- 
2.34.1


