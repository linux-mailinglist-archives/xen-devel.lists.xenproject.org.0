Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E8EA4F99C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901876.1309871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknS-0000PD-DP; Wed, 05 Mar 2025 09:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901876.1309871; Wed, 05 Mar 2025 09:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknR-0000Ld-Vq; Wed, 05 Mar 2025 09:12:09 +0000
Received: by outflank-mailman (input) for mailman id 901876;
 Wed, 05 Mar 2025 09:12:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknP-0006ev-S6
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:07 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e957a17f-f9a1-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:12:07 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54958009d4dso4389302e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:07 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:05 -0800 (PST)
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
X-Inumbo-ID: e957a17f-f9a1-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165926; x=1741770726; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/DQSzA8Mm1BXyH1yps+EV4PgxUn5myADhhJYlS6Wxs=;
        b=Ckp1V16ZPYSAPtzFzs0WwiF5I5aidZKU/HO6+7+C/CO061QX4jM1SSL9ejlOs1IZwZ
         gbwpyv6og7nvRXPvyGZAfkr59hQRLqmaWUjZymW+ZcD+0Dt7m2SiIFruwgX5jyQhvEBs
         /sYbVwRJlBlVd5b1wHdF65IGKcvp3LFfEzUinKd0wITYP/lkI2v5K+rxG+Bjr2TyQi78
         vLwaK5ov5Yu1NeC5dqjkD/Me2mj9/D7Y56hsJ0uNQ0XgJAU3Rpo+64kKh+iA92oCW5SD
         zrdPIlZRgjDhBwVkKZlXVgrs+CbpdQFTsBqwiJOrIulLHIQ36Cr/lzd7SLbYx8Ij1CDN
         YncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165926; x=1741770726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/DQSzA8Mm1BXyH1yps+EV4PgxUn5myADhhJYlS6Wxs=;
        b=xSFH4xp/qN5jRY7K2ZHJLx0oJYwT263xQgDjJaIODy1hx4gxvEsAFOuyFBgceXokbP
         bymrQ4Puh1Xmx3UaTRWOaPq/nmEIiXH4haVObBkGwrKL2erseH0JKr88SH94agemncpg
         0N5CnPQVm4Q7czVHr2MinJD5Mt6tcHYKOZU+gnkkJf9BSiX+47Nux86LLcAIduJD7AG8
         AIEgRkuBiaW5odAh+hZMDlq5W+5TLGCu1dJ+JzUR13/Tdp50jtTWLYQW3uCkOtX2+dC9
         db9z3h+9gRwmsrRpDcUVCRi0r/ZYryUtKNjBnevdw7EnC/QgjbMJlkznF7C680M8Hzt2
         lC5g==
X-Gm-Message-State: AOJu0Yy35fWO6HWKaDmvx/GZLxPB+NdLr195Zas+Z0qN9lCaaPW3HTrF
	Tt1H1np10BDjN/kOnDHUvEVAUvqyQI8sZH1+qCP+Kqn316uAp/6ZhHGQBWYg
X-Gm-Gg: ASbGncvuoN1Q0GlDceD39dAsZwT1gZQglxD1YlX4xCfeH33gfpglpeEe1b6WUPAY11U
	VPmFiwRecjU7g/POz+aFdW9Kx+TXhu+i7S+w9eSVRrxhop0WJREcLQD9gRJ4uiBF0vtBBs+8dnJ
	wsaoiNChr/8R/bx2DAX5i/DOWUHNo/7OwFFFHPDrWdLSuqNFanfSFAHtyij0whAaspfEp/09bZN
	Vx9+78urPniYa7maFr21WcPtveq/jvgLcEg1FeQiiivnkEKockxd4OaJPw/GxK5ASKAyZ15rDkm
	hFhU8OVNUJHHUyC2ym4Zk2cIMRX3MPyAHvpL5ZdGP8gWVq7/Sg==
X-Google-Smtp-Source: AGHT+IGtxa5Pj8kBsJaWyLXDgkv7/rHGgii+0cSx8gjh5ZUbdc71zh95bWBESehdjid4tSsm3aPzQQ==
X-Received: by 2002:a05:6512:2316:b0:545:1193:1256 with SMTP id 2adb3069b0e04-5497d32f847mr706274e87.1.1741165925893;
        Wed, 05 Mar 2025 01:12:05 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH 09/16] xen/arm: add suspend and resume timer helpers
Date: Wed,  5 Mar 2025 11:11:17 +0200
Message-ID: <1c84532d015797f23172598a820223b6fa8bcb8d.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Timer interrupts have to be disabled while the system is in suspend.
Otherwise, a timer interrupt would fire and wake-up the system.
Suspending the timer interrupts consists of disabling physical EL1
and EL2 timers. The resume consists only of raising timer softirq,
which will trigger the generic timer code to reprogram the EL2 timer
as needed. Enabling of EL1 physical timer will be triggered by an
entity which uses it.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/include/asm/time.h |  5 +++++
 xen/arch/arm/time.c             | 26 ++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
index 49ad8c1a6d..f4fd0c6af5 100644
--- a/xen/arch/arm/include/asm/time.h
+++ b/xen/arch/arm/include/asm/time.h
@@ -108,6 +108,11 @@ void preinit_xen_time(void);
 
 void force_update_vcpu_system_time(struct vcpu *v);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+void time_suspend(void);
+void time_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #endif /* __ARM_TIME_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index e74d30d258..89c5773244 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -372,6 +372,32 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
     /* XXX update guest visible wallclock time */
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+void time_suspend(void)
+{
+    /* Disable physical EL1 timer */
+    WRITE_SYSREG(0, CNTP_CTL_EL0);
+
+    /* Disable hypervisor's timer */
+    WRITE_SYSREG(0, CNTHP_CTL_EL2);
+    isb();
+}
+
+void time_resume(void)
+{
+    /*
+     * Raising timer softirq will trigger generic timer code to reprogram_timer
+     * with the correct timeout value (which is not known here). There is no
+     * need to do anything else in order to recover the time keeping from power
+     * down, because the system counter is not affected by the power down (it
+     * resides out of the ARM's cluster in an always-on part of the SoC).
+     */
+    raise_softirq(TIMER_SOFTIRQ);
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int cpu_time_callback(struct notifier_block *nfb,
                              unsigned long action,
                              void *hcpu)
-- 
2.43.0


