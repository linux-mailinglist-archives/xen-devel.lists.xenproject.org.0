Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F422FAE6C9D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 18:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023952.1400023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6gj-00009A-Ay; Tue, 24 Jun 2025 16:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023952.1400023; Tue, 24 Jun 2025 16:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6gj-00006Q-4J; Tue, 24 Jun 2025 16:40:01 +0000
Received: by outflank-mailman (input) for mailman id 1023952;
 Tue, 24 Jun 2025 16:40:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X7et=ZH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uU6gi-00006A-6B
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 16:40:00 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de293fa2-5119-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 18:39:59 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4536b8c183cso315165e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 09:39:59 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e810caefsm2295472f8f.87.2025.06.24.09.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 09:39:58 -0700 (PDT)
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
X-Inumbo-ID: de293fa2-5119-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750783198; x=1751387998; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6JXyUMx3IjQ54X/lCoYWUS3iBYfCqkhLOnaKoIjagI=;
        b=t7DzAA+ZcKtrqS5X1zuCZyD23c2N2WCkq1o4yME6hlampDzGiqGdSgDmKtPzb2yU7r
         8h7xuC8dFxtmvyZzrkELvYVTUO+5VIPFAt9jHDbbi5Ea+6DJFunqVity82Rl2Rkuu5KS
         5ZmkDis16Fyl1hszwD1WK4iCLfRLGD/3t8KEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783198; x=1751387998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6JXyUMx3IjQ54X/lCoYWUS3iBYfCqkhLOnaKoIjagI=;
        b=HF5VGeUDRGdmq22pTWpvCCHyBZ1DDWN4xLwtWPIedIJxCqzU1+spgO2yF3yT9p0aXg
         Ci8oWvrh4gvATOcZgbTuTvtaFrP/goSqzAcC293NPHJDPujTwsmYvdjObq9SpdUJFSJZ
         m50eBztkgPIX1B61bJWa6Zsg3GbOo2x4uWoyNnopZWglV9dNYC+DuuY4ucDCFfBLKFPP
         XNsUN0sUcXYmd06qmN+EL7rOjz80DzVl5Pv7FEUEI/nbqgUSD8nv2eQCy8Ff2UfE+Rbr
         IVlPBzULey/yFIbAmnAbmk1O+WSoda5OlI2pkSO2zbZzvOFeEezRar2M/UaJss7LFL06
         xJCg==
X-Gm-Message-State: AOJu0YwSlFXiYwK1JS8QF2FhHDuSExvIgReaAJ20NRfSWog+F2Q4j89z
	TtG++7Z3GLbreaMIlL/Z791khjc/931OiAKA3wgFI8LmYwx97jGOtyJdjrlP+XKs1aRLnOaUZc7
	j6msWxGBPoA==
X-Gm-Gg: ASbGnctS1vUBTGoeWeZk1a0ehIXANvnUSuOXYYaU2zUwZL2ostZLR0JKQz6WxJPXqvr
	JE1iTdC+fWtWSqWtmm9f9G8kdY+wYabwuOtQzx02j+CDqr6jI3EkkSyP63SxaI58zzlTWwaKH2H
	gTcOZnPcqgLLp15RMG9hlG93kPnPaFuJXfBTCsiZpkopdSEST93v5PwTdYwTuvt+kq1Yfr5uxB7
	hYrj/2p8uURsW8puOqoN+83pKKhXA2Rb6jZaqVwy0Yq4WVjMXp05jwbMgsCbrU15u09R08v6W9K
	zUlHeXSK4FGs6JofajCyGTNwhZpD98EId/M1kKPhkF485Mw2lvVroI1eo3h6MIcL/96w4sF38TZ
	1unRwnwwCroq558q5NrfgouEUHGwf1fKxPAc=
X-Google-Smtp-Source: AGHT+IFQPLT83iQ184sq26JwFUC7OyLxsojaK3bBbVO5G1nNWggAhvjJkebTS7WzIykBYxvVMQQYbQ==
X-Received: by 2002:a05:600c:a107:b0:453:9b3:5b58 with SMTP id 5b1f17b1804b1-4537b73816bmr35245505e9.4.1750783198505;
        Tue, 24 Jun 2025 09:39:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/4] x86/idle: Move monitor()/mwait() wrappers into cpu-idle.c
Date: Tue, 24 Jun 2025 17:39:48 +0100
Message-Id: <20250624163951.301743-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624163951.301743-1-andrew.cooper3@citrix.com>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They're not used by any other translation unit, so shouldn't live in
asm/processor.h, which is included almost everywhere.

Our new toolchain baseline knows the MONITOR/MWAIT instructions, so use them
directly rather than using raw hex.

Change the hint/extention parameters from long to int.  They're specified to
remain 32bit operands even 64-bit mode.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/cpu_idle.c         | 21 +++++++++++++++++----
 xen/arch/x86/include/asm/processor.h | 17 -----------------
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 1dbf15b01ed7..40af42a18fb8 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -60,6 +60,19 @@
 
 /*#define DEBUG_PM_CX*/
 
+static always_inline void monitor(
+    const void *addr, unsigned int ecx, unsigned int edx)
+{
+    asm volatile ( "monitor"
+                   :: "a" (addr), "c" (ecx), "d" (edx) );
+}
+
+static always_inline void mwait(unsigned int eax, unsigned int ecx)
+{
+    asm volatile ( "mwait"
+                   :: "a" (eax), "c" (ecx) );
+}
+
 #define GET_HW_RES_IN_NS(msr, val) \
     do { rdmsrl(msr, val); val = tsc_ticks2ns(val); } while( 0 )
 #define GET_MC6_RES(val)  GET_HW_RES_IN_NS(0x664, val)
@@ -470,7 +483,7 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
         mb();
     }
 
-    __monitor(monitor_addr, 0, 0);
+    monitor(monitor_addr, 0, 0);
     smp_mb();
 
     /*
@@ -484,7 +497,7 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
         cpumask_set_cpu(cpu, &cpuidle_mwait_flags);
 
         spec_ctrl_enter_idle(info);
-        __mwait(eax, ecx);
+        mwait(eax, ecx);
         spec_ctrl_exit_idle(info);
 
         cpumask_clear_cpu(cpu, &cpuidle_mwait_flags);
@@ -915,9 +928,9 @@ void cf_check acpi_dead_idle(void)
              */
             mb();
             clflush(mwait_ptr);
-            __monitor(mwait_ptr, 0, 0);
+            monitor(mwait_ptr, 0, 0);
             mb();
-            __mwait(cx->address, 0);
+            mwait(cx->address, 0);
         }
     }
     else if ( (current_cpu_data.x86_vendor &
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 96b9bf5f5edb..04824c3633cf 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -315,23 +315,6 @@ static always_inline void set_in_cr4 (unsigned long mask)
         cr4_pv32_mask |= (mask & XEN_CR4_PV32_BITS);
 }
 
-static always_inline void __monitor(const void *eax, unsigned long ecx,
-                                    unsigned long edx)
-{
-    /* "monitor %eax,%ecx,%edx;" */
-    asm volatile (
-        ".byte 0x0f,0x01,0xc8;"
-        : : "a" (eax), "c" (ecx), "d"(edx) );
-}
-
-static always_inline void __mwait(unsigned long eax, unsigned long ecx)
-{
-    /* "mwait %eax,%ecx;" */
-    asm volatile (
-        ".byte 0x0f,0x01,0xc9;"
-        : : "a" (eax), "c" (ecx) );
-}
-
 #define IOBMP_BYTES             8192
 #define IOBMP_INVALID_OFFSET    0x8000
 
-- 
2.39.5


