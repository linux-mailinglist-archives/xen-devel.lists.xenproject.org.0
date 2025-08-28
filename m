Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C06B3A3A3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099156.1453082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHH-000751-Hg; Thu, 28 Aug 2025 15:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099156.1453082; Thu, 28 Aug 2025 15:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHH-0006zr-Cy; Thu, 28 Aug 2025 15:11:03 +0000
Received: by outflank-mailman (input) for mailman id 1099156;
 Thu, 28 Aug 2025 15:11:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCm-0003MD-Qb
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:24 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 904c730d-8420-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:06:24 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1b065d59so7219705e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:24 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:22 -0700 (PDT)
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
X-Inumbo-ID: 904c730d-8420-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393583; x=1756998383; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcUNjSmRE8zrBdNfJ83+ye8WTIwfGJ+o51CvT8zs2YM=;
        b=A0TiPBD7EUGGlJ2Mgeg5s3yiAOeVJEF+0T6AT44NO++MWOYOQIYWLX7mqvF7qg9SMB
         G0x9AmbKlkP4jU5Vnac45fmxP7k3MuVuI27k1rPvh+LgAx/2kXdvR6N6blHueXnITDeU
         kU/+Lx88es9TBBX61x0j9919kNM64FyUF9rUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393583; x=1756998383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcUNjSmRE8zrBdNfJ83+ye8WTIwfGJ+o51CvT8zs2YM=;
        b=ffBU7BMDyQ1pIW40h7t9mOWMBJueyNWL9fKZBrAhPvlxY+ZYbU2byUAgrHmC1y8Fgy
         WZ23yzV8aIST0UQ0+Ix4HX+5IK/vnnGUAOFIYtt7NFJwl+8Bv0kYpxQUCOR9RarKsXGf
         +K2reFp4M4V8xlHjo0kd1WdPI9dvsmL6Ss1kxRe+BerGY96E6r9sNHf3FSbX7M3AhxI6
         nNOmp/8Ph+h/r+7Tr7cnNyhWjKLqMuX13qdcDxySiqFiqDBreq0/faCG6wI843VJVmSP
         5hmuagDsCm2Dhn6O8RuhC+cbZU/aG7aHM2XBsPH4kwN30DrMBq1LCxEwC+/A6uCJe2ae
         JXRA==
X-Gm-Message-State: AOJu0YxSM++k+Il5EkItIVfFFZCVi2yR95LwBEWkghrUiMKpWjNw051d
	tTAMgBuislPMx0RwHDIp/VRQENBnlCOTejfkbPOCXj9K/e9SBbrscMDFPlUxW9qEjH32khDf1Df
	XbBiX
X-Gm-Gg: ASbGnctmj+yCPRqllr0Aj3eTsRom2G0J+ey2EmbucXX60qHldcJcQxwgEssmAc+BQ3R
	AdOaqmQRNCCZafUMvpO0MlKM1In68leufN8qV2zYLJI3lS8gNI/LCv98x9NelJznWjXL+5NT6QX
	/0v2Q/T6Stq7tLhtPziNLYXFV9sq9LRr3qghGpiFiPS5ET7ULHzJsy5tSu73AtyJoCiB7suD/re
	1NLjBrWyrcoH+Nn9LHGwsfUAwzAWGmvx5i/0bAKgfHuo4C8078cqnzX7lpCCZ3R0s3Uu8GgS6P8
	SJVTBIKLRqBkSsKv+MVFvgf8+5D/Ac6m7wltYqDFHeJYIdJp8X/aeDHLULkciDsSAf0RWHqaxzd
	WGn6ZTccdPG2Qytp9WiEKAa7XBhBymkvp+WZGIZ4QSO7ZzuOvZFsoIqK67Nj/SVuT1/RVAL49dM
	HO
X-Google-Smtp-Source: AGHT+IGQffCxU2zMYu+MQa1R3h5Bc5ZyjQroxmWWfsryOtQ1GbfkVA7yfgV6Ah9VyQdpRWl6Ga3HZA==
X-Received: by 2002:a05:600c:1caa:b0:458:bbed:a806 with SMTP id 5b1f17b1804b1-45b6503919emr85513525e9.22.1756393583190;
        Thu, 28 Aug 2025 08:06:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 20/23] x86/pv: Exception handling in FRED mode
Date: Thu, 28 Aug 2025 16:04:06 +0100
Message-Id: <20250828150409.901315-21-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under FRED, entry_from_pv() handles everything.  To start with, implement
exception handling in the same manner as entry_from_xen(), although we can
unconditionally enable interrupts after the async/fatal events.

After entry_from_pv() returns, test_all_events() needs to run to perform
exception and interrupt injection.  Split entry_FRED_R3() into two and
introduce eretu_exit_to_guest() as the latter half, coming unilaterally from
restore_all_guest().

For all of this, there is a slightly complicated relationship with CONFIG_PV.
entry_FRED_R3() must exist irrespective of CONFIG_PV, because it's the
entrypoint registered with hardware.  For simplicity, entry_from_pv() is
always called, but it collapses into fatal_trap() in the !PV case.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/traps.c             | 76 +++++++++++++++++++++++++++++++-
 xen/arch/x86/x86_64/entry-fred.S | 13 +++++-
 xen/arch/x86/x86_64/entry.S      |  4 +-
 3 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 67763bec0dc5..72df446a6a78 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2265,9 +2265,83 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
 
 void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
 {
+    struct fred_info *fi = cpu_regs_fred_info(regs);
+    uint8_t type = regs->fred_ss.type;
+    uint8_t vec = regs->fred_ss.vector;
+
     /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
-    regs->entry_vector = regs->fred_ss.vector;
+    regs->entry_vector = vec;
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        goto fatal;
+
+    /*
+     * First, handle the asynchronous or fatal events.  These are either
+     * unrelated to the interrupted context, or may not have valid context
+     * recorded, and all have special rules on how/whether to re-enable IRQs.
+     */
+    switch ( type )
+    {
+    case X86_ET_EXT_INTR:
+        return do_IRQ(regs);
 
+    case X86_ET_NMI:
+        return do_nmi(regs);
+
+    case X86_ET_HW_EXC:
+        switch ( vec )
+        {
+        case X86_EXC_DF: return do_double_fault(regs);
+        case X86_EXC_MC: return do_machine_check(regs);
+        }
+        break;
+    }
+
+    /*
+     * With the asynchronous events handled, what remains are the synchronous
+     * ones.  Guest context always had interrupts enabled.
+     */
+    local_irq_enable();
+
+    switch ( type )
+    {
+    case X86_ET_HW_EXC:
+    case X86_ET_PRIV_SW_EXC:
+    case X86_ET_SW_EXC:
+        switch ( vec )
+        {
+        case X86_EXC_PF:  handle_PF(regs, fi->edata); break;
+        case X86_EXC_GP:  do_general_protection(regs); break;
+        case X86_EXC_UD:  do_invalid_op(regs); break;
+        case X86_EXC_NM:  do_device_not_available(regs); break;
+        case X86_EXC_BP:  do_int3(regs); break;
+        case X86_EXC_DB:  handle_DB(regs, fi->edata); break;
+
+        case X86_EXC_DE:
+        case X86_EXC_OF:
+        case X86_EXC_BR:
+        case X86_EXC_NP:
+        case X86_EXC_SS:
+        case X86_EXC_MF:
+        case X86_EXC_AC:
+        case X86_EXC_XM:
+            do_trap(regs);
+            break;
+
+        case X86_EXC_CP:  do_entry_CP(regs); break;
+
+        default:
+            goto fatal;
+        }
+        break;
+
+    default:
+        goto fatal;
+    }
+
+    return;
+
+ fatal:
     fatal_trap(regs, false);
 }
 
diff --git a/xen/arch/x86/x86_64/entry-fred.S b/xen/arch/x86/x86_64/entry-fred.S
index 3c3320df22cb..07684f38a078 100644
--- a/xen/arch/x86/x86_64/entry-fred.S
+++ b/xen/arch/x86/x86_64/entry-fred.S
@@ -15,9 +15,20 @@ FUNC(entry_FRED_R3, 4096)
         mov     %rsp, %rdi
         call    entry_from_pv
 
+#ifndef CONFIG_PV
+        BUG     /* Not Reached */
+#else
+        GET_STACK_END(14)
+        movq    STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
+
+        jmp     test_all_events
+#endif
+END(entry_FRED_R3)
+
+FUNC(eretu_exit_to_guest)
         POP_GPRS
         eretu
-END(entry_FRED_R3)
+END(eretu_exit_to_guest)
 
         /* The Ring0 entrypoint is at Ring3 + 0x100. */
         .org entry_FRED_R3 + 0x100, 0xcc
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index ca446c6ff0ce..0692163faa44 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -63,7 +63,7 @@ UNLIKELY_END(syscall_no_callback)
         /* Conditionally clear DF */
         and   %esi, UREGS_eflags(%rsp)
 /* %rbx: struct vcpu */
-test_all_events:
+LABEL(test_all_events, 0)
         ASSERT_NOT_IN_ATOMIC
         cli                             # tests must not race interrupts
 /*test_softirqs:*/
@@ -152,6 +152,8 @@ END(switch_to_kernel)
 FUNC_LOCAL(restore_all_guest)
         ASSERT_INTERRUPTS_DISABLED
 
+        ALTERNATIVE "", "jmp eretu_exit_to_guest", X86_FEATURE_XEN_FRED
+
         /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
         mov VCPU_arch_msrs(%rbx), %rdx
         mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
-- 
2.39.5


