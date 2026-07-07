Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8IR8I1ZVTWoHygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 21:36:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6271F474
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 21:36:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=jL47bVTl;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356508.1611097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whBa7-0003GE-1b; Tue, 07 Jul 2026 19:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356508.1611097; Tue, 07 Jul 2026 19:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whBa6-0003Dc-Uh; Tue, 07 Jul 2026 19:35:46 +0000
Received: by outflank-mailman (input) for mailman id 1356508;
 Tue, 07 Jul 2026 19:35:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1whBa4-0003DG-SM
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 19:35:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whBa3-00EsSV-QX
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 21:35:43 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4d550e-2eae-0a2a0a5409dd-0a2a4505ad64-2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 21:35:43 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4d550f-3cb2-0a2a45050019-d155802dc12e-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 21:35:43 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493b779003fso23109185e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 12:35:43 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f50418sm70994505e9.11.2026.07.07.12.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 12:35:41 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1783452943; x=1784057743; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLIGahyTwlNdQVGeXjRBYS94ZxdoPIaROepzvXQIKV0=;
        b=jL47bVTlyRKk1attDMSrCoscS1Tridor1TlMRJFfUOO8UEVI/gX/ylVsHZnvwxVKwP
         qMCXmEykgUVQ5DVuuQBoOD/YAW2V3S7LJd2FJvFSmJpzkZ6iazL1UlHuYekPyknC/YkU
         0J5C69BacfMzhPv6jUONU07/PBlSOBhDLoF8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452943; x=1784057743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLIGahyTwlNdQVGeXjRBYS94ZxdoPIaROepzvXQIKV0=;
        b=EOm2BH246kUQrhwG5+TXChgrtGYNXgNSXUfjUfyey/6XcJrsvROqSY04Uhlzf5GElU
         INebsBLxPv6KoapPruL9bJcoo9RKT25CD8hU1NkT7fKPfx8SI4vctHS4w2a0nryyQJEb
         cYFA2hoA1/DtMMwI+FOPHcZVLBMF8nW7GXEOSK4o24ZHJj1rWvOq/g23SrS1hN2lEM5v
         zYi0YArDoOrBj4Ff2YFRVvtcAxSCPkS1Z5CQZ750WR0kYF4XLMq+viYCB3bG3AOC1xet
         NGEZn2R3JFg33bIjbGbPA9AMIfqtxfcsGIuLwyucIo0INEnrwuCqUzCu9iyC5yyi8eZ+
         HOMg==
X-Gm-Message-State: AOJu0Yx+R2dhxKLytsPk69a/FzDJUrhrBt36wXSkLS83IOwbOOg1WFJ4
	XQOaWvSLXq+Ox0c/ngrHylDbs2y8owCYCQGOKFKgLFr+Eeg9h3H61b1SgkOJYkljPKHwfOKUR1q
	pthrI
X-Gm-Gg: AfdE7clWxfZTYTDcQBnkVKBV8qlz45Vjq/t5TSWJzf7qCbQAUKwrJPgrVSQiHLSHeW4
	wYdv9qHnNbrrr6RqAcnosEXDwRMCyv+YJuN3f3NyMQ4p/saeGLFOoqlapa+fa3Qpy4Y14xKFvRT
	dM9zHbW+pHM4egvUro4VoS8ivmPZAC5aQeQuIfI4d3S6/avv8O1VWkvZ7AwzOylj7SAf4CB54c+
	aYnU0nIJ4rBHMt7R1Z7RvYcZFVjMBk+D9rKRHqz8GswNjCyvjhZ1m6XhXrI7sCb1JFabrINuT1p
	gFl/FAhMEU6rCG5Xd47D6UQ1dH7MOlfg/7bFRtyiC9FqsSbYVkAao9NSeinn/1HWpOLOXUahsvo
	yvvahuoYso9zTbjYdVzldF09XackipGO/SDWFFI56tYxVZbyFjqTNjHJS3euSMBPpGW0itTvELT
	LSiTG8dPHI4Pufhl1UaJvh3BjCmbQ9AB8gdiQ7Arb307MLyVpTjpiF1zOp3riWMQA=
X-Received: by 2002:a05:600c:37ce:b0:492:4363:e7d6 with SMTP id 5b1f17b1804b1-493df0777bemr75781515e9.37.1783452942679;
        Tue, 07 Jul 2026 12:35:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/vmx: Fix cascade crash in vmx_vmentry_failure()
Date: Tue,  7 Jul 2026 20:35:21 +0100
Message-Id: <20260707193521.1423908-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1783452943-151042B8-720FE842/0/0
X-purgate-type: clean
X-purgate-size: 7326
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:email,citrix.com:mid,citrix.com:dkim,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2E6271F474

The VMEntry failure handling does not distinguish VMFail Valid vs Invalid.  In
the latter case, vmx_vmentry_failure() will hit a BUG() when trying to look up
VM_INSTRUCTION_ERROR.

Preserving CF around PUSH_AND_CLEAR_GPRS is rather complicated.  Borrow a
spare byte in the cpu_info block.

Move all the failure logic into .text.cold to keep it out of the fastpath
cachelines.

In vmx_vmentry_failure(), only collect the instruction error in the case of
VMFailValid.  As well as printing the instruction error number decode them to
human readable names, except those which pertain to STM (a.k.a. SMI
dual-monitor or executive-VMCS-pointer), which is a mode Xen does not support.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

Slightly RFC - it's fairly hard to these these.  It came from code inspection
rather than encountering a VMFailInvalid case in practice.

I'm surprised that Eclair wasn't logging a violation at the absence of an
asmlinkage or SAF lable considering that vmx_vmentry_failure() has no
declaration.
---
 xen/arch/x86/hvm/vmx/entry.S            | 43 +++++++++++++--------
 xen/arch/x86/hvm/vmx/vmcs.c             | 51 +++++++++++++++++++++----
 xen/arch/x86/include/asm/current.h      |  3 ++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  1 +
 xen/arch/x86/x86_64/asm-offsets.c       |  1 +
 5 files changed, 76 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index cebc70064048..24789341a082 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -154,21 +154,7 @@ UNLIKELY_END(realmode)
 
 .Lvmx_launch:
         vmlaunch
-
-.Lvmx_vmentry_fail:
-        sti
-        PUSH_AND_CLEAR_GPRS
-
-        /*
-         * SPEC_CTRL_ENTRY notes
-         *
-         * If we end up here, no guest code has executed.  The MSR lists have
-         * not been processed, so we still have Xen's choice of MSR_SPEC_CTRL
-         * in context, and the RSB is unchanged.
-         */
-
-        call vmx_vmentry_failure
-        jmp  .Lvmx_process_softirqs
+        jmp  .Lvmx_vmentry_fail
 
 LABEL(vmx_asm_do_vmentry)
         GET_CURRENT(bx)
@@ -189,3 +175,30 @@ LABEL(vmx_asm_do_vmentry)
         call do_softirq
         jmp  .Lvmx_do_vmentry
 END(vmx_asm_vmexit_handler)
+
+        .section .text.cold, "ax", @progbits
+
+FUNC(vmx_asm_vmexit_handler.cold)
+.Lvmx_vmentry_fail:
+        /*
+         * SPEC_CTRL_ENTRY notes
+         *
+         * If we end up here, no guest code has executed.  The MSR lists have
+         * not been processed, so we still have Xen's choice of MSR_SPEC_CTRL
+         * in context, and the RSB is unchanged.
+         *
+         * The guest registers are live, and the on-stack copy is up-to-date.
+         * PUSH_AND_CLEAR_GPRS clobbers flags and can't reasonably be made not
+         * to.  The Carry flag (VMFail Invalid vs Valid) needs preserving.
+         *
+         * We could opencode PUSH_AND_CLEAR_GPRS but that's fragile to stack
+         * layout changes.  Instead, use a spare byte in the cpuinfo block.
+         */
+        setnc   STK_REL(CPUINFO_vmx_vmfail_valid, CPUINFO_error_code)(%rsp)
+
+        PUSH_AND_CLEAR_GPRS
+        sti
+
+        call    vmx_vmentry_failure
+        jmp     .Lvmx_process_softirqs
+END(vmx_asm_vmexit_handler.cold)
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 8e52ef4d497a..8ff8d2426e94 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1833,18 +1833,53 @@ void vmx_destroy_vmcs(struct vcpu *v)
     free_xenheap_page(v->arch.hvm.vmx.msr_bitmap);
 }
 
-void vmx_vmentry_failure(void)
+static const char *vmx_error_str(unsigned int error)
+{
+    switch ( error )
+    {
+    case VMX_INSN_VMLAUNCH_NONCLEAR_VMCS:
+        return "VMLAUNCH with non-clear VMCS";
+
+    case VMX_INSN_VMRESUME_NONLAUNCHED_VMCS:
+        return "VMRESUME with non-launched VMCS";
+
+    case VMX_INSN_VMRESUME_AFTER_VMXOFF:
+        return "VMRESUME after VMXOFF";
+
+    case VMX_INSN_INVALID_CONTROL_STATE:
+        return "Invalid control state";
+
+    case VMX_INSN_INVALID_HOST_STATE:
+        return "Invalid host state";
+
+    case VMX_INSN_VMENTRY_BLOCKED_BY_MOV_SS:
+        return "Blocked by MOV-SS";
+
+    default:
+        return "Unknown";
+    }
+}
+
+void asmlinkage __cold vmx_vmentry_failure(void)
 {
     struct vcpu *curr = current;
-    unsigned long error;
+    bool valid = get_cpu_info()->vmx_vmfail_valid;
 
-    __vmread(VM_INSTRUCTION_ERROR, &error);
-    gprintk(XENLOG_ERR, "VM%s error: %#lx\n",
-            curr->arch.hvm.vmx.launched ? "RESUME" : "LAUNCH", error);
+    gprintk(XENLOG_ERR, "VM%s Failure, VMCS %svalid\n",
+            curr->arch.hvm.vmx.launched ? "RESUME" : "LAUNCH",
+            valid ? "" : "not ");
 
-    if ( error == VMX_INSN_INVALID_CONTROL_STATE ||
-         error == VMX_INSN_INVALID_HOST_STATE )
-        vmcs_dump_vcpu(curr);
+    if ( valid )
+    {
+        unsigned int error = vmread(VM_INSTRUCTION_ERROR);
+
+        gprintk(XENLOG_ERR, "  Instruction Error %u, %s\n",
+                error, vmx_error_str(error));
+
+        if ( error == VMX_INSN_INVALID_CONTROL_STATE ||
+             error == VMX_INSN_INVALID_HOST_STATE )
+            vmcs_dump_vcpu(curr);
+    }
 
     domain_crash(curr->domain);
 }
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index 6139980ab115..3c53235d341a 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -80,6 +80,9 @@ struct cpu_info {
      */
     bool         use_pv_cr3;
 
+    /* Scratch space for the VT-x logic.  See users. */
+    uint8_t      vmx_vmfail_valid;
+
     /* get_stack_bottom() must be 16-byte aligned */
 };
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 88bded5190c9..3b1c54fd055e 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -619,6 +619,7 @@ enum vmx_insn_errno
     VMX_INSN_VMCLEAR_WITH_VMXON_PTR        = 3,
     VMX_INSN_VMLAUNCH_NONCLEAR_VMCS        = 4,
     VMX_INSN_VMRESUME_NONLAUNCHED_VMCS     = 5,
+    VMX_INSN_VMRESUME_AFTER_VMXOFF         = 6,
     VMX_INSN_INVALID_CONTROL_STATE         = 7,
     VMX_INSN_INVALID_HOST_STATE            = 8,
     VMX_INSN_VMPTRLD_INVALID_PHYADDR       = 9,
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 9d4536402661..65b2b96fd528 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -163,6 +163,7 @@ void __dummy__(void)
     OFFSET(CPUINFO_scf, struct cpu_info, scf);
     OFFSET(CPUINFO_root_pgt_changed, struct cpu_info, root_pgt_changed);
     OFFSET(CPUINFO_use_pv_cr3, struct cpu_info, use_pv_cr3);
+    OFFSET(CPUINFO_vmx_vmfail_valid, struct cpu_info, vmx_vmfail_valid);
     DEFINE(CPUINFO_sizeof, sizeof(struct cpu_info));
     BLANK();
 

base-commit: c4bf5bc5f0edbcbc5965c924db069483b2cf6049
-- 
2.39.5


