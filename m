Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D956EAF5B5C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031268.1405091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeW-0000pQ-Ga; Wed, 02 Jul 2025 14:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031268.1405091; Wed, 02 Jul 2025 14:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeW-0000hz-CZ; Wed, 02 Jul 2025 14:41:36 +0000
Received: by outflank-mailman (input) for mailman id 1031268;
 Wed, 02 Jul 2025 14:41:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4T1d=ZP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uWyeU-0007qI-Lc
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:41:34 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5d84690-5752-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 16:41:33 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so3040309f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:41:33 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad20bsm230946905e9.20.2025.07.02.07.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 07:41:31 -0700 (PDT)
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
X-Inumbo-ID: a5d84690-5752-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751467292; x=1752072092; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsaIUoYrgMaZ6LILx+fXrGcgIxtKBujRKKhSNH9JnHQ=;
        b=FuwU2zjcf5O96UGtew2sOxrGxXaGWCpLhXvHG1jFQHg1xJkZu+/3c08Ivh1znztCMa
         77VHzDzm0a5WamS4m2Bln924oSwOMbX1hPWa6SWzEZGtxh73uqySKrJxG8JY+/762vby
         gdubz8GeSOqDmYoxOPJ37tRh8RNOrvuSy193w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467292; x=1752072092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsaIUoYrgMaZ6LILx+fXrGcgIxtKBujRKKhSNH9JnHQ=;
        b=P0TygWY7Z20Nidndh/ndYbxileWSiLrVefp+GsVaU5dv3LQnhYTfyipqZHFmg8Jdnd
         RFCDhTz75zoEM180px7ox6VuVoZ06UfjNeNyJtkpWveuz6mvns7OfknszPaWy1P+y6+P
         yq4lOcDBjnNhhWn59SgT/KXQxVXSiD6sBoiH7dqdjSyr9j345X9ea9p7HG5+3b6dOGL3
         99BsZx4I0bSmWYQZlumUq3ZU36sID+c4jvrbXTLJ/8RtN6ONfV8NBBHRl9G03mRS14Qz
         TTvffpy3PBkQtgcPJVA2FtjaRAuRL3vTcUdyZfcImpFTxK0wXfbGRv30LVg3ZKFHiC11
         UvpQ==
X-Gm-Message-State: AOJu0YzU82UBoxAvI9lWxVR6bIdh+wdNZHn9NnkqRgxSP2TFI5lnAmZT
	uy9Pz/s9ttbWXvIBou2bPq19SmmHxjHqABDelVaJ3/3okL0XbgXSon22nj1O9da7qRJSC/6ltoW
	mvj2PxsXp1g==
X-Gm-Gg: ASbGncs9l4LHla5aUbAl8MPZOTustRpYSdRcNVqw7hR5KrGRw8KoF3cVdjyIEjdOeKM
	rXv96kW7lOp2Pq75JUV1GcwmtTSUJAE3VRAxDwkR2Xj8QnbXhO+JlfZe/uLTH51GRQMFkW8lnpB
	+OMETsiYPlj3JmeikloxtXhNnG6bCJJT2LPTZtgNBebWl2GSIh24dPkbeHrHjQxPDkeIV5YNBwV
	lc2tu8YaSWVHzH3VTkxuHauf97OrSaINbHbhzlAB52mGbK2HO+UWwJmyIymNAxznWqkO3pfqAdN
	CAWyV+WBhMf2yP7FJyqRP+8iJQjEVygeeOIlJmgS2mzFYzdNH3QFyjWMuY/YHnExnemFGGE2Yzf
	SOPB6XB9LV4exX4/WBAlNXvqbEEluWZwOrBCLDWM4SXZgtw==
X-Google-Smtp-Source: AGHT+IGgsRlQqTrN48VnadNjRK976IFEOtd7SxWtrGSsHZVPB/eV6P78ZtXvOx3+j5k61B2pskhXRw==
X-Received: by 2002:a05:6000:2385:b0:3a4:ee3f:8e1e with SMTP id ffacd0b85a97d-3b201e84a1cmr2523786f8f.39.1751467292250;
        Wed, 02 Jul 2025 07:41:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 6/6] x86/idle: Fix buggy "x86/mwait-idle: enable interrupts before C1 on Xeons"
Date: Wed,  2 Jul 2025 15:41:21 +0100
Message-Id: <20250702144121.1096448-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The check of this_softirq_pending must be performed with irqs disabled, but
this property was broken by an attempt to optimise entry/exit latency.

Commit c227233ad64c in Linux (which we copied into Xen) was fixed up by
edc8fc01f608 in Linux, which we have so far missed.

Going to sleep without waking on interrupts is nonsensical outside of
play_dead(), so overload this to select between two possible MWAITs, the
second using the STI shadow to cover MWAIT for exactly the same reason as we
do in safe_halt().

Fixes: b17e0ec72ede ("x86/mwait-idle: enable interrupts before C1 on Xeons")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/acpi/cpu_idle.c  | 16 +++++++++++++++-
 xen/arch/x86/cpu/mwait-idle.c |  8 ++------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index de020dfee87f..dc8b7111a181 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -80,6 +80,13 @@ static always_inline void mwait(unsigned int eax, unsigned int ecx)
                    :: "a" (eax), "c" (ecx) );
 }
 
+static always_inline void sti_mwait_cli(unsigned int eax, unsigned int ecx)
+{
+    /* STI shadow covers MWAIT. */
+    asm volatile ( "sti; mwait; cli"
+                   :: "a" (eax), "c" (ecx) );
+}
+
 #define GET_HW_RES_IN_NS(msr, val) \
     do { rdmsrl(msr, val); val = tsc_ticks2ns(val); } while( 0 )
 #define GET_MC6_RES(val)  GET_HW_RES_IN_NS(0x664, val)
@@ -461,12 +468,19 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
 
     monitor(this_softirq_pending, 0, 0);
 
+    ASSERT(!local_irq_is_enabled());
+
     if ( !*this_softirq_pending )
     {
         struct cpu_info *info = get_cpu_info();
 
         spec_ctrl_enter_idle(info);
-        mwait(eax, ecx);
+
+        if ( ecx & MWAIT_ECX_INTERRUPT_BREAK )
+            mwait(eax, ecx);
+        else
+            sti_mwait_cli(eax, ecx);
+
         spec_ctrl_exit_idle(info);
     }
 
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 5c16f5ad3a82..b65d6ae9ddc5 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -946,12 +946,8 @@ static void cf_check mwait_idle(void)
 
 	update_last_cx_stat(power, cx, before);
 
-	if (cx->irq_enable_early)
-		local_irq_enable();
-
-	mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
-
-	local_irq_disable();
+	mwait_idle_with_hints(cx->address,
+                              cx->irq_enable_early ? 0 : MWAIT_ECX_INTERRUPT_BREAK);
 
 	after = alternative_call(cpuidle_get_tick);
 
-- 
2.39.5


