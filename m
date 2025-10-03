Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456D6BB85DA
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137043.1473503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4ohE-00067x-S0; Fri, 03 Oct 2025 22:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137043.1473503; Fri, 03 Oct 2025 22:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4ohE-00064a-Oi; Fri, 03 Oct 2025 22:56:16 +0000
Received: by outflank-mailman (input) for mailman id 1137043;
 Fri, 03 Oct 2025 22:56:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4of8-0004mF-9C
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:54:06 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcbe6d48-a0ab-11f0-9d14-b5c5bf9af7f9;
 Sat, 04 Oct 2025 00:54:05 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso2056662f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:54:05 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:54:03 -0700 (PDT)
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
X-Inumbo-ID: dcbe6d48-a0ab-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532044; x=1760136844; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XTD7h2Ab6a+CORJxr33+ND6CJ87jCU42y3vBojuyiI=;
        b=QIhTsC7askTFAkRtIfBqGq+2dUtdATmX4hs02LbH7CrS+OUVkSZe0LjdcPODz+gePp
         44cq8JA2AMZlmcdQAErV1V/Amhc9zllz9gpPp2PxoYOTC63Xh01lYnOOL5e7kHjsdWZT
         VEhVuqTNO/0T7Lll9kEPzd8Cw/6QyFFVUcBnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532044; x=1760136844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XTD7h2Ab6a+CORJxr33+ND6CJ87jCU42y3vBojuyiI=;
        b=lUjnp4Dp/KsJS6ZsTCvus5kIhc+sqT9UrrRDj1Mgxan5+Qw2y6m/WpF9ZO824YtMAP
         kAYIWgL3X18M1BEE1I2VEp7WbNwlep0hRiN/HsSqaZxfSTgH3wPD0uzreWK0dqfYP957
         Km0XSvrGFtmkJQqiq9hMMs2JgAdyOaTlzJuaWYnTHONzzfFDBWuujTNywYcNPwhyfWRZ
         NM/ED/102QWMfjnCM8PaEaVJDtO0qdRkwLgPI4SDnVuOQyZb83d5BOlnHY8+3ro787ce
         RaS0Wa15JyAd1ws/v8fZqMFPkNlv4dLTyZjevjEN6t+s2qAkCxFWAVGTuzv+b91Me/yn
         mw6A==
X-Gm-Message-State: AOJu0YxpQbVoC/qZVdpUwRvSZ13KXSc7PMN9YO3THYp3bL67BXVocczr
	HuW1e3CmS2q/ip+ws8nWWb5uJ76X35RKtI4WriXt986xNFfbyoACI1JZuHntGB2IyrGzurLwAJF
	WT9It/sSbKA==
X-Gm-Gg: ASbGnctzUIWRmxrAoIsMKkNbm6tVsJrkctb8/eFfXWa18hRO26KEr79uPELs7wjOxxF
	aqYY5q232d/VQlb1JzR/7K/A37fN0V48DDv4gGn1A0elWYaa3cni5JyvrZvbmf/U1Ay45y/vsZt
	PpswL+oD/ya6XfYfaP4UbSdQtNcUG91TUNjzEIpPbcg7a+21nU6ZEMZ9xYjj19fu2Icv1ABMzg1
	fGWbyztDozWCZUASa2khe69OtUVJZpcymGIhsSGR7530+7lohULYShfBv02EXropqJ+YY994xY4
	SZfzDLwbCk9ZmhAtAlKMy/Wf/1WY1nqb+e+fKN2jiZR+3r0UpLfzfh6sTMDiYtkgK2kiprXGojL
	qaIByPs5MgvHuZ5+VpZvqRcEAbWRr0jwAbcQscFy47DkEVSOZPJDFlghzcxFnOdIFgxi3V4YzDT
	0KAA2y2BrdKg1rQf6kyEru66+z6B8K47A=
X-Google-Smtp-Source: AGHT+IGOcfyNSZTubcAKC8WOfHT1jDZKuYz6MiU79gd8rsVFJtwdlf4g6w6Cc3Jl4HKHfY0WPVGuLg==
X-Received: by 2002:a05:6000:288a:b0:3ee:1233:4681 with SMTP id ffacd0b85a97d-4256715327emr3150252f8f.23.1759532044330;
        Fri, 03 Oct 2025 15:54:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 19/22] x86/pv: Guest exception handling in FRED mode
Date: Fri,  3 Oct 2025 23:53:31 +0100
Message-Id: <20251003225334.2123667-20-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
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

v3:
 * Adjust comments.
 * Group CP with others.  It's definitely wrong for perf, but that's out the
   window anyway now that we're letting a compiler make the decision tree.
v2:
 * New
---
 xen/arch/x86/traps.c             | 75 +++++++++++++++++++++++++++++++-
 xen/arch/x86/x86_64/entry-fred.S | 13 +++++-
 xen/arch/x86/x86_64/entry.S      |  4 +-
 3 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 0027f096a6c3..3f7db11c247b 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2266,9 +2266,82 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
 
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
+
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
+     * ones.  PV guest context always had interrupts enabled.
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
+        case X86_EXC_CP:  do_entry_CP(regs); break;
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
index 3c3320df22cb..a1ff9a4a9747 100644
--- a/xen/arch/x86/x86_64/entry-fred.S
+++ b/xen/arch/x86/x86_64/entry-fred.S
@@ -15,9 +15,20 @@ FUNC(entry_FRED_R3, 4096)
         mov     %rsp, %rdi
         call    entry_from_pv
 
+#ifdef CONFIG_PV
+        GET_STACK_END(14)
+        movq    STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
+
+        jmp     test_all_events
+#else
+        BUG     /* Not Reached */
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


