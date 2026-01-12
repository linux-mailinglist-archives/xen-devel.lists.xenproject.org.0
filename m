Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40F6D12A46
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 13:57:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200229.1516214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfHTv-0003tM-LI; Mon, 12 Jan 2026 12:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200229.1516214; Mon, 12 Jan 2026 12:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfHTv-0003rl-Hi; Mon, 12 Jan 2026 12:57:15 +0000
Received: by outflank-mailman (input) for mailman id 1200229;
 Mon, 12 Jan 2026 12:57:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbli=7R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vfHTu-0003rf-69
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 12:57:14 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3687a98c-efb6-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 13:57:12 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-65089cebdb4so8429107a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 04:57:12 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-252-44.as6723.net. [185.5.252.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86ebfd007fsm736803866b.31.2026.01.12.04.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 04:57:11 -0800 (PST)
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
X-Inumbo-ID: 3687a98c-efb6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768222632; x=1768827432; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBY9S+KFYmQiPJ56+D97Psmms27C+LWFU82ctDGNHow=;
        b=UYWt1dndNihBF2JHPs/U9JhGkT4FbdE7ZDKek/chfdUhSyXa66Q3Ah81MqWq1OVfph
         7JSIk7TvyXA1fX+xB6mvL+WlSdLuEhxbi+EOyan/v/OpVFQsasZuK2k7sGNvrqucQcCW
         enOjd76TywYkabxIIwhQpdX4t4gKGOl8yX0xxP3kvjNaRgyFIRW36Xa4sM8DOt/XmsOk
         EfMEul5B1CZ8jS/UrjQ+TbaoQIBF+zjKqj/BPSk0gzS6R+LfZD/xaBzlVYUpZ4RSLpGZ
         Z6gBj/va/cCZwOyHU/p+zYwdonhYebo2qbocqukx+cnFSw2hw99UAkSEWHTDUzU15Vgn
         BAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222632; x=1768827432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBY9S+KFYmQiPJ56+D97Psmms27C+LWFU82ctDGNHow=;
        b=HVZBO0S47QFtmBiNekZASNgH1bLQCTsyc/bvq9yXkELoYENgte/s1+luhKv3vDvjrs
         rmPGbm35QoeHjMYJ0jEwide4ICtJrPo15teA6SULfz4tK2KTuv9as0p12oqQXa5uMjl7
         DfgMi9rlAFIb6lpf4NdrypVeN8Ej7YkFyxWylQjEtt/7bfMOvhfFKYNK4krfLxUeiZMR
         k4dYPjYvSpcwwzmEVbxiKGDiD0C86Hu0mtyqRH8NsYjkhPL3fpGR8DFRgFcyMr/ou8vG
         P0P9LNjTKxu9J9/5kvRjQFcekdZ1ZnC3q46Vs+Sf1WwekYh7veyDiG1Eek79jO9ghnMt
         3R6g==
X-Gm-Message-State: AOJu0Yw30CtT5L5Xe7bLw7Rsjf3ztstTKF9Z93tyCRS22F0wghfvpmQm
	v9BvartqfBc6+yW+v16e1E1dGjYw8xYMIqUNsF0hHsC/nVoclvZX3wtbhVt/Uw==
X-Gm-Gg: AY/fxX4MiHeiYIdm0PjDdC0g+p+kRWDVk3qzolKMSCdEhiXYwa46+oiS1of5FLKYFUv
	RiHqqO7W2Y9+AckES1qSFSVFC3hCtoYlk1sf6XJc3hmIkjVi8xaRYsZ0Ma2u+86LyHLlIFb6Vwr
	3CXxJLPO7jtQmE8MVzVccI1f/IHHbAoU0aCKyUKcYu5P6B4OezafB5ja75JJ5jzwHfYMgDuRRaI
	Zj38wpLKbkfMNGPEN+QKgCbV9Bvsb3Tq3hvlsXw/QFLLdMrmLGQMg5h+ecTpiMkOKbb4x3mIBTM
	1u2SYBTP8n/48N6EKhO90C2HdWzYEGQ5/zWb/acADcpk/K898Sp60GN38iKqlDBQCdIBvl2FxST
	wEwTASunYtgxNV37iCUzocMcAZtAZ+neJpICNN3ivOhPvz555eRiqXQJZ31/9MlKqKkNxcapQ48
	xgCEbtVK651aQsH7/g+t/dBZxHD2vZujOzSDMPPi4ujxk=
X-Google-Smtp-Source: AGHT+IE4Y1tT+YwHM8rTCpBoriXh/dfRZwckJV0pJNuP8LyW1+Hqfz9HVOPxinrnk9+Ri0M5sTdf3A==
X-Received: by 2002:a17:907:3d0b:b0:b83:1326:7d45 with SMTP id a640c23a62f3a-b8445345f6dmr1801522866b.32.1768222631515;
        Mon, 12 Jan 2026 04:57:11 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: ignore spurious interrupts from virtual timer
Date: Mon, 12 Jan 2026 14:50:02 +0200
Message-ID: <436a0405a9482dadce7f7cdb1e9721ee461f26a7.1768219676.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

If a spurious virtual timer interrupt occurs (i.e. the interrupt fires
but CNTV_CTL_EL0 does not report it as pending), Xen masks the virtual
timer and injects the vtimer IRQ into the guest. For Linux guests, the
timer interrupt is unmasked only after programming a new CVAL value from
the timer interrupt handler. When the interrupt is not reported as
pending, the handler can skip that programming step, leaving the timer
masked and stalling the affected CPU.

This patch mirrors the Linux arm generic timer handler: if the interrupt
fires but the pending bit is not set, treat it as spurious and ignore it.

This issue is reproducible under heavy load on the R-Car X5H board
(Cortex-A720AE r0p0).

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/include/asm/perfc_defn.h |  7 ++++---
 xen/arch/arm/time.c                   | 11 ++++++++++-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
index effd25b69e..f83989d95a 100644
--- a/xen/arch/arm/include/asm/perfc_defn.h
+++ b/xen/arch/arm/include/asm/perfc_defn.h
@@ -69,9 +69,10 @@ PERFCOUNTER(ppis,                 "#PPIs")
 PERFCOUNTER(spis,                 "#SPIs")
 PERFCOUNTER(guest_irqs,           "#GUEST-IRQS")
 
-PERFCOUNTER(hyp_timer_irqs,   "Hypervisor timer interrupts")
-PERFCOUNTER(virt_timer_irqs,  "Virtual timer interrupts")
-PERFCOUNTER(maintenance_irqs, "Maintenance interrupts")
+PERFCOUNTER(hyp_timer_irqs,             "Hypervisor timer interrupts")
+PERFCOUNTER(virt_timer_irqs,            "Virtual timer interrupts")
+PERFCOUNTER(virt_timer_spurious_irqs,   "Virtual timer spurious interrupts")
+PERFCOUNTER(maintenance_irqs,           "Maintenance interrupts")
 
 PERFCOUNTER(atomics_guest,    "atomics: guest access")
 PERFCOUNTER(atomics_guest_paused,   "atomics: guest paused")
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index cc3fcf47b6..d18d6568bb 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -258,6 +258,8 @@ static void htimer_interrupt(int irq, void *dev_id)
 
 static void vtimer_interrupt(int irq, void *dev_id)
 {
+    register_t ctl;
+
     /*
      * Edge-triggered interrupts can be used for the virtual timer. Even
      * if the timer output signal is masked in the context switch, the
@@ -271,9 +273,16 @@ static void vtimer_interrupt(int irq, void *dev_id)
     if ( unlikely(is_idle_vcpu(current)) )
         return;
 
+    ctl = READ_SYSREG(CNTV_CTL_EL0);
+    if ( unlikely(!(ctl & CNTx_CTL_PENDING)) )
+    {
+        perfc_incr(virt_timer_spurious_irqs);
+        return;
+    }
+
     perfc_incr(virt_timer_irqs);
 
-    current->arch.virt_timer.ctl = READ_SYSREG(CNTV_CTL_EL0);
+    current->arch.virt_timer.ctl = ctl;
     WRITE_SYSREG(current->arch.virt_timer.ctl | CNTx_CTL_MASK, CNTV_CTL_EL0);
     vgic_inject_irq(current->domain, current, current->arch.virt_timer.irq, true);
 }
-- 
2.43.0


