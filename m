Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA2FAF986D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 18:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033544.1406926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMl-0006YS-8g; Fri, 04 Jul 2025 16:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033544.1406926; Fri, 04 Jul 2025 16:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMl-0006Tz-1h; Fri, 04 Jul 2025 16:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1033544;
 Fri, 04 Jul 2025 16:34:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FCR=ZR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXjMi-0005FA-Pd
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 16:34:20 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb1b1a91-58f4-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 18:34:18 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-454ac069223so11402595e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 09:34:18 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9989fcesm59199345e9.16.2025.07.04.09.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:34:17 -0700 (PDT)
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
X-Inumbo-ID: bb1b1a91-58f4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751646858; x=1752251658; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO+Mvsl7T4wCFNFbuv0DlhNSF3ioM+Cmaq7CZFYbXdE=;
        b=tMNWO0DfFlXx2U0P/0b1rThrfB8ZZmkY5r1eaBJZ1VDIKmPwXL73LqGGxAP/dWFX/p
         CPurcNZsbPHoYrVIssPHx9sYFz4JGTG5SRLOC6mNB5gZlToyY3q2ZW5z9YtFwwaciQE6
         er+BZ5VsMCtgPQTA4VwKJuuHCoIqH7wc1I5To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646858; x=1752251658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO+Mvsl7T4wCFNFbuv0DlhNSF3ioM+Cmaq7CZFYbXdE=;
        b=GPdBZt/VzYajvApE00MMTq3y8Ysa5PtitHLWxi0p6ViJKoL8u2Sm6oAR40LqbEtktw
         7Kj89KGLG/LqV9KYz9iWtJFgJoLkOFfwNhPof2gEUMlp6WlOZKckT4FynJ0pGRmQk1pR
         9+64Z6VTd/Mmwoqpww9AyPviuj70RT/5hliEbvO7RsVVXQQtnNOsVjX3WcvxGcfIZSwE
         IFzw/+tLrOUi3XN9ODC7NbP9gaIGItDoeoPW6uIX0ChQ6W6N1OP80oB9/fZZFGP5csrl
         TreS4S1C/rj9fv3SYuleIvhnkm5AOZQR9gO92D7LJT7vV1gqGV7B8KTd0cI0haSZZ2OS
         TsgQ==
X-Gm-Message-State: AOJu0Yzw5GYePPJVpj6+6NZDoWrH3nIUyFjOT9/J1XrZPrV5T9H+s9bC
	gTqOLC2H/Xandhs6//a+o4tE9p1uD7oPIJ4dgVyIl2LD/G0BgzdTiUNBjHSwqVu8bz01w4PR8TA
	gigqaxmFehg==
X-Gm-Gg: ASbGncszI+tL9I06bqDQV66J1IDDBE6J833BtXq8FwAvgeKX8FGrr5sED2MWvxgKFJF
	87Xhy5txXVuXDpQuut30PhuAJKyAkJ1b4qTOcOqXF/bQW34uHcvUUM7jXrGfAYAy1/9TmSVpcYU
	MOMEX8byXiBqHbdQfbF/40nqkpNGNgPdZn3uD0af0UZv2By587dZXXoSGxzHV0JMsdeUna/MSbD
	9entOm7WfpMn6doVUqNVadCQw0Ky4whdZkulXIMnnM5YZrggXXKf/fK2baalWECQmbyxbOYFzTl
	fQ2BPIet+xlTH5V3qbD31vEUcp49kSl97JQLoPG4xzXHL6O6j+NOTyzBUhsIoY9350xkjQ1V+3y
	Bg+lwPMv39eJ1J01Vfw99woVcdH0r/7b+z9c=
X-Google-Smtp-Source: AGHT+IE2d/OampR6SLtstlBq6hmveCWj/rNyeENkROaUbFT4K4SfTi1e0fXMFWyVMIv6wvHs+240Ew==
X-Received: by 2002:a05:600c:1da0:b0:453:835a:db with SMTP id 5b1f17b1804b1-454b1f471fdmr32877685e9.4.1751646857639;
        Fri, 04 Jul 2025 09:34:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 6/6] x86/idle: Fix buggy "x86/mwait-idle: enable interrupts before C1 on Xeons"
Date: Fri,  4 Jul 2025 17:34:10 +0100
Message-Id: <20250704163410.1412367-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
References: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
index c5d7a6c6fe2a..e50a9234a0d4 100644
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
index 5c16f5ad3a82..5e98011bfd0c 100644
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
+			      cx->irq_enable_early ? 0 : MWAIT_ECX_INTERRUPT_BREAK);
 
 	after = alternative_call(cpuidle_get_tick);
 
-- 
2.39.5


