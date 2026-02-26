Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJPYGeEzoGmLgAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E15E1A5588
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241453.1542497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZty-0006hg-Fg; Thu, 26 Feb 2026 11:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241453.1542497; Thu, 26 Feb 2026 11:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZty-0006fZ-CB; Thu, 26 Feb 2026 11:51:30 +0000
Received: by outflank-mailman (input) for mailman id 1241453;
 Thu, 26 Feb 2026 11:51:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZtx-0006EH-6A
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:29 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b62d24c-1309-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 12:51:27 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-483bd7354efso10329965e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:27 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:25 -0800 (PST)
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
X-Inumbo-ID: 7b62d24c-1309-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106686; x=1772711486; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjWgFbv6nb7y5dLkGr2P5tKeDiy8GNkU4xO5G3VBP8c=;
        b=MBtGR8KDxfg18JepBfQo1A0LcxujEdFRM+/zs5i9nGmj7KTyTwQsaIrEZYY21Cnqke
         Aj94WesKr6p/k2ywn/LgAa7VwrkXJ1TVKwUr6sfW8no5gZGGK6DX+QkZByr5NRXNkc+T
         P+iqItUIMTW6aC8uo4PojkTFHN1dc7UES88Doq9UQJ0KOOJnaONeowWXWCmG1BW/LIYV
         0NbTB1SeBVJ90vREk9s78olkIHPFCGnIYP4cOeVhjTAjLCWkjfaAT/7mJJxgEu9QW4Hg
         ls61i0f389J6Wtakard/c3Cav+c5nrsWPFPvTNDE6KQM/9zYsbxCX6Jo8BPsZk9oDU0I
         o5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106686; x=1772711486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mjWgFbv6nb7y5dLkGr2P5tKeDiy8GNkU4xO5G3VBP8c=;
        b=QoUVzCjOcSx2SAwSIjWJ4wrWvRn07Lai4fbhKiKEkwXHL2kbN8NsMHSDYVlkuq3/2m
         t+vbOAGm7QuDvEW2kAb2NHxTMCy9fMPN3Qup9wYH08GcLHncQsQGn8Pmwd7e0WYfShAM
         QqvmKbFhx6HOm3Ih62DcNVWhlTyJujwwmXpD+162k3Cy9q6fw4q9PAh6FaHvpd1Agxrb
         aI8iac8KZ+Hd8mwZ+5ChzxqyWxvT/3XEIH41WymHjDpL/bxIpCRsNRAKl//hUMlK1mt7
         zL+mu3PSdEse0zMxMQUiocgEbnjjIH0+8kzHFTTtiOfv38oO9M3Hqe44/HWLSydAhb5b
         ye9A==
X-Gm-Message-State: AOJu0YxzQb6JevxbG6N03Umu2yt504FvSPqgFlRj12fHDh1JAIQy8X4K
	jWdpdNGQA9kqCo2I4d1pWhQ1Qdvf4EpUdZJRQuXjB5U7NEi9lIll/43r/31EmA==
X-Gm-Gg: ATEYQzyKWU7dDI1bAe59lIQJuzxxm6DHUI6yAGTPxqWAffsfq1XyJO1Ocgp4OBk+8S0
	JiDEng+7UHxrRbyIzji8mxOMkHQDYJNr526Gox/m/Up3o8U7U4ZaBpRymxzz/LJB9m/OU+3wwTq
	wn2iod8KCLRcvVYKzDwV76weGCOTa8j4T2TzF62+KdkwdoBtJy7XzhMfiy1khuGFFx73Rz79Z/0
	9BW+r6v2hmWY6mSdl8I9YmB525biLupEJDrTIc3UclyytxDFKRNxD+9ronem7VUKEQNydfKn0jF
	jJ9GZkJE+Gp3cHOrsSd4v6h2mNnj16WU63I4pcSxMzBrAwWG9+t0vY8TLwgwZolUSDccYkdzQHk
	q8PIYZ5VQ2yXTbz1sHYUtnSCtb9CH2Q2Q6ahW9HlY0XB2yB0a7oUmndrFcrtocjrJdJR4ZfM+Jn
	MSNGqRUzzmfndeaQdaZ3rCr+o2cQlrhrU2yH2kO3wX3mIjkC0WPYod+4eSHxtyUqLl1luAeu/tx
	LA0
X-Received: by 2002:a05:600c:8708:b0:483:a922:2e8d with SMTP id 5b1f17b1804b1-483c216ab55mr57961995e9.4.1772106685950;
        Thu, 26 Feb 2026 03:51:25 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 02/14] xen/riscv: implement vcpu_csr_init()
Date: Thu, 26 Feb 2026 12:51:02 +0100
Message-ID: <9694ff5787d5f162581a16f0974ac9a55c538019.1772016457.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772016457.git.oleksii.kurochko@gmail.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.978];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1E15E1A5588
X-Rspamd-Action: no action

Introduce vcpu_csr_init() to initialise hypervisor CSRs that control
vCPU execution and virtualization behaviour before the vCPU is first
scheduled.
The function configures trap and interrupt delegation to VS-mode by
setting the appropriate bits in the hedeleg and hideleg registers,
initializes hstatus so that execution enters VS-mode when control is
passed to the guest, and restricts guest access to hardware performance
counters by initializing hcounteren, as unrestricted access would
require additional handling in Xen.
When the Smstateen and SSAIA extensions are available, access to AIA
CSRs and IMSIC guest interrupt files is enabled by setting the
corresponding bits in hstateen0, avoiding unnecessary traps into Xen
(note that SVSLCT(Supervisor Virtual Select) name is used intead of
CSRIND as OpenSBI uses such name and riscv_encoding.h is mostly based
on it).
If the Svpbmt extension is supported, the PBMTE bit is set in
henvcfg to allow its use for VS-stage address translation. Guest
access to the ENVCFG CSR is also enabled by setting ENVCFG bit in
hstateen0, as a guest may need to control certain characteristics of
the U-mode (VU-mode when V=1) execution environment.

For CSRs that may contain read-only bits (e.g. hedeleg, hideleg,
hstateen0), to the written value a correspondent mask is applied to
avoid divergence between the software state and the actual CSR
contents.

As hstatus is not part of struct arch_vcpu (it already resides in
struct cpu_user_regs), introduce vcpu_guest_cpu_user_regs() to provide
a uniform way to access hstatus and other guest CPU user registers.

This establishes a consistent and well-defined initial CSR state for
vCPUs prior to their first context switch.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - Apply introduced in prev. patch csr_masks.ro_one.hstaten0 in vcpu_csr_init().
---
Changes in v5:
 - Initialize of hstateen0 with SMSTATEEN0_HSENVCFG when a variable is
   defined.
 - Use |= for a code inside if (*_ssaia) case.
 - Put declaration of the registers hedeleg and hideleg together in arch_vcpu
   structure as they are typically used together so better chances to
   be in the same cache line.
---
Changes in v4:
 - Move local variable hstateen0 into narrower scope.
 - Code style fixes.
 - Move the call of vcpu_csr_init(v) after if ( is_idle_vcpu() ) check in
   arcg_vcpu_create().
---
Changes in v3:
 - Add hypervisor register used to initalize vCPU state.
 - Apply masks introduced before instead of csr_write()/csr_read() pattern.
---
Changes in v2:
 - As hstatus isn't a part of arch_vcpu structure (as it is already a part of
   cpu_user_regs) introduce vcpu_guest_cpu_user_regs() to be able to access
   hstatus and other CPU user regs.
 - Sort hideleg bit setting by value. Drop a stray blank.
 - Drop | when the first initialization of hcounteren and hennvcfg happen.
 - Introduce HEDELEG_DEFAULT. Sort set bits by value and use BIT() macros
   instead of open-coding it.
 - Apply pattern csr_write() -> csr_read() for hedeleg and hideleg instead
   of direct bit setting in v->arch.h{i,e}deleg as it could be that for some
   reason some bits of hedeleg and hideleg are r/o.
   The similar patter is used for hstateen0 as some of the bits could be r/o.
 - Add check that SSAIA is avaialable before setting of SMSTATEEN0_AIA |
   SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT bits.
 - Drop local variables hstatus, hideleg and hedeleg as they aren't used
   anymore.
---
 xen/arch/riscv/domain.c                     | 63 +++++++++++++++++++++
 xen/arch/riscv/include/asm/current.h        |  2 +
 xen/arch/riscv/include/asm/domain.h         |  6 ++
 xen/arch/riscv/include/asm/riscv_encoding.h |  2 +
 4 files changed, 73 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 902aaac74290..2a81f8d94f9a 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -8,6 +8,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/riscv_encoding.h>
 
 struct csr_masks {
     register_t hedeleg;
@@ -20,6 +21,21 @@ struct csr_masks {
     } ro_one;
 };
 
+#define HEDELEG_DEFAULT (BIT(CAUSE_MISALIGNED_FETCH, U) | \
+                         BIT(CAUSE_FETCH_ACCESS, U) | \
+                         BIT(CAUSE_ILLEGAL_INSTRUCTION, U) | \
+                         BIT(CAUSE_BREAKPOINT, U) | \
+                         BIT(CAUSE_MISALIGNED_LOAD, U) | \
+                         BIT(CAUSE_LOAD_ACCESS, U) | \
+                         BIT(CAUSE_MISALIGNED_STORE, U) | \
+                         BIT(CAUSE_STORE_ACCESS, U) | \
+                         BIT(CAUSE_USER_ECALL, U) | \
+                         BIT(CAUSE_FETCH_PAGE_FAULT, U) | \
+                         BIT(CAUSE_LOAD_PAGE_FAULT, U) | \
+                         BIT(CAUSE_STORE_PAGE_FAULT, U))
+
+#define HIDELEG_DEFAULT (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
+
 static struct csr_masks __ro_after_init csr_masks;
 
 void __init init_csr_masks(void)
@@ -52,6 +68,51 @@ void __init init_csr_masks(void)
     }
 }
 
+static void vcpu_csr_init(struct vcpu *v)
+{
+    v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
+
+    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
+
+    v->arch.hideleg = HIDELEG_DEFAULT & csr_masks.hideleg;
+
+    /*
+     * VS should access only the time counter directly.
+     * Everything else should trap.
+     */
+    v->arch.hcounteren = HCOUNTEREN_TM;
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
+        v->arch.henvcfg = ENVCFG_PBMTE & csr_masks.henvcfg;
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+    {
+        /* Allow guest to access CSR_SENVCFG */
+        register_t hstateen0 = SMSTATEEN0_HSENVCFG;
+
+        if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+            /*
+             * If the hypervisor extension is implemented, the same three
+             * bits are defined also in hypervisor CSR hstateen0 but concern
+             * only the state potentially accessible to a virtual machine
+             * executing in privilege modes VS and VU:
+             *      bit 60 CSRs siselect and sireg (really vsiselect and
+             *             vsireg)
+             *      bit 59 CSRs siph and sieh (RV32 only) and stopi (really
+             *             vsiph, vsieh, and vstopi)
+             *      bit 58 all state of IMSIC guest interrupt files, including
+             *             CSR stopei (really vstopei)
+             * If one of these bits is zero in hstateen0, and the same bit is
+             * one in mstateen0, then an attempt to access the corresponding
+             * state from VS or VU-mode raises a virtual instruction exception.
+             */
+            hstateen0 |= SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT;
+
+        v->arch.hstateen0 = (hstateen0 & csr_masks.hstateen0) |
+                            csr_masks.ro_one.hstateen0;
+    }
+}
+
 static void continue_new_vcpu(struct vcpu *prev)
 {
     BUG_ON("unimplemented\n");
@@ -74,6 +135,8 @@ int arch_vcpu_create(struct vcpu *v)
     if ( is_idle_vcpu(v) )
         return 0;
 
+    vcpu_csr_init(v);
+
     /*
      * As the vtimer and interrupt controller (IC) are not yet implemented,
      * return an error.
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index 58c9f1506b7c..5fbee8182caa 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -48,6 +48,8 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
 #define get_cpu_current(cpu)  per_cpu(curr_vcpu, cpu)
 
 #define guest_cpu_user_regs() ({ BUG_ON("unimplemented"); NULL; })
+#define vcpu_guest_cpu_user_regs(vcpu) \
+    (&(vcpu)->arch.cpu_info->guest_cpu_user_regs)
 
 #define switch_stack_and_jump(stack, fn) do {               \
     asm volatile (                                          \
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 5aec627a7adb..17be792afe7d 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -49,6 +49,12 @@ struct arch_vcpu {
 
     struct cpu_info *cpu_info;
 
+    register_t hcounteren;
+    register_t hedeleg;
+    register_t hideleg;
+    register_t henvcfg;
+    register_t hstateen0;
+
     register_t vsatp;
 };
 
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 1f7e612366f8..dd15731a86fa 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -228,6 +228,8 @@
 #define ENVCFG_CBIE_INV			_UL(0x3)
 #define ENVCFG_FIOM			_UL(0x1)
 
+#define HCOUNTEREN_TM BIT(1, U)
+
 /* ===== User-level CSRs ===== */
 
 /* User Trap Setup (N-extension) */
-- 
2.53.0


