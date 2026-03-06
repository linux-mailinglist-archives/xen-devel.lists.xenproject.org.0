Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCIBEfcBq2m4ZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4439224FB9
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247973.1546331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7W-0003Un-W9; Fri, 06 Mar 2026 16:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247973.1546331; Fri, 06 Mar 2026 16:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7W-0003Rm-S0; Fri, 06 Mar 2026 16:33:46 +0000
Received: by outflank-mailman (input) for mailman id 1247973;
 Fri, 06 Mar 2026 16:33:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7V-0003HN-BP
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:45 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d1f88e6-197a-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 17:33:42 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so92166675e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:42 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:41 -0800 (PST)
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
X-Inumbo-ID: 3d1f88e6-197a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814822; x=1773419622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzQC2ov+xYcuBZPHbnymUYPvOXLbca5uUsTK8SmNRMc=;
        b=ZFs5by6RhXhoDd7Xfev6/OC0yC/6Q+DO+L2wRqeSNMljxn9pBcPyWZ3kaJggx/ybUN
         RGr99E2GvVJJr/IXIwB5SzjvZ2taWxTquPhNcDwgvQPwS7POJOnDF6eNx9PZvexeJMS/
         WppRZqcSgWbY08lr5kXh9jkuDYSbnOeRQ4rs3jgUQNHS6MwSS3Ao/oGc1iRLQEEBa9ry
         IRuuRKXAGLEEeNNX7/XPVAn++LVI7VtaXZjjHokf2xbR/hmdNGXP/kjBepM3Ci3R5F6L
         lzV6vw0zmYMSriHkH6+rQBWeu4UjfjJFzioHoLktjfD9fXg0ZUVTmYSZ/YBzmHWPxSJl
         avAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814822; x=1773419622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CzQC2ov+xYcuBZPHbnymUYPvOXLbca5uUsTK8SmNRMc=;
        b=P/OkvASnzkwwRbh5MeMOMZH5NPCw0bE6/WURsrXPAxsyqAy45DMdgRKUJH+Y/jaDt7
         Qj8+eiJPNG+yIDfTbiKo98qe67Hm7MccSiNQvNBjoAeSuzEZFHV26rFQBEF+Aucvjxhr
         KI7Hr7olVCgi2XGDqBGmXVtFSsA4nyDilbY5c4jaRWPba/T0uyxdHEIpkgI6SDk8YKSI
         sdPTPXjDbS84RZx8N4Ijj65tBuf2il8G40GSA6dtRLYKdnq7JM5Zcwx+U3IypQxAolYW
         78L1pN+ooddzdjE3yIBxyQaDq3m0mBTGnjPpR0epf6eEI9UZOfW3PPC4QsN9/ORdV8Gw
         Hs6w==
X-Gm-Message-State: AOJu0YwAh7Uht4yBL1xM2Za9xhnqOPZtg+IWN7XCUTe2vqZFAQB78p4Q
	IvBoteCLbkaIZFfUzruSt8yYGblSaAKPIOj2putkimAl04cewBYcKUuv3MVTTA==
X-Gm-Gg: ATEYQzwFPLwX8YOfeY7onVC4mEVA5s+T1eccOTWry15snnHsDnR7hdrwM3/poLgEwbK
	euEq0zrSQGZ3hozr/SAWW2VoYjXu4fvLGIuCmOjRPqbshkAJ6x3lsVZgF8qnLx3DfJEO+4mHYxe
	VSoe8QUvb/nkJu13j+GPnPDjSOctT2hvOE0qeB9HGUu+S43AcZjpMCzSRrlSf4JbRd4rw5Ypwev
	bbUO87XD3tuWaNmF7D5T8ayjemDaeFalmS47Z5FLbAZuwGqorodfM2DAfX4BYLhMDY/YlkXDbJB
	lf4SaZpqksgFv6TGJ5klmi4TZp8s7s9Uy5xwk9WwSZeuG/EWupsTK4aoywNY8mCAKuTsLf2xt6O
	vG+nyv60HfmXNDOjESWJQjXEol/aekRtCtDKk4yyW9QfonAkZ0Y4r5cLguAGowr/3nJQzR4VCoO
	EVunaf13fhqvbAC7mc6GF7XWrrIvuMMqhs6ZIMd6yKl0BjeWKtkuk7s5JaYsop4S07UpOnyQ==
X-Received: by 2002:a05:600c:154b:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-4852675edf7mr40929495e9.17.1772814821883;
        Fri, 06 Mar 2026 08:33:41 -0800 (PST)
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
Subject: [PATCH v7 02/14] xen/riscv: implement vcpu_csr_init()
Date: Fri,  6 Mar 2026 17:33:19 +0100
Message-ID: <91724a0d6f2d2de3979a1a7d1f92da11ffd06171.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E4439224FB9
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V7:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
index 32974cb48929..08b990f7b9f6 100644
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
 
 #define HEDELEG_AVAIL_MASK ULONG_MAX
@@ -62,6 +78,51 @@ void __init init_csr_masks(void)
 #undef INIT_RO_ONE_MASK
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
@@ -84,6 +145,8 @@ int arch_vcpu_create(struct vcpu *v)
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


