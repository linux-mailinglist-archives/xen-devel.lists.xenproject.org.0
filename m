Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LucgBfcQimnZGQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A041112B21
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225788.1532399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVC-00005T-GW; Mon, 09 Feb 2026 16:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225788.1532399; Mon, 09 Feb 2026 16:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVC-0008TX-D2; Mon, 09 Feb 2026 16:52:46 +0000
Received: by outflank-mailman (input) for mailman id 1225788;
 Mon, 09 Feb 2026 16:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVA-0007Zd-Hm
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:44 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03d163d-05d7-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:52:42 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b884a84e655so678536366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:42 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:41 -0800 (PST)
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
X-Inumbo-ID: c03d163d-05d7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655962; x=1771260762; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKSs5oLs7wKY5onKUxL0luWYu7wbrnabRL4F2MZ4aOo=;
        b=IKnlpJU8Rpx6G4T98OUGeQiHevEPOitBsq15/zwJF3DMqkinFf0vuOczod14ZWLFMZ
         uD3zzlDOlQ0MuvRn5aEMcYuF/zfHadks+SYWEpri+nJ0VX0LCpUdCetiZggqyKvkewIp
         YC5/+fh3RS3Z8sdhBv3fW2kHDM+vFZyPeouxy4xelqv+GVZwtQq1+zUToPreefYXDmTB
         JdaGx0g6Xsv+78hIO33qpoyVNQwxdUL3b+nuCBMywpw0OweqyADk1zMmcOB/euEW6QOU
         GTK0ZY2k+bQWJFycU7arJahriuLTRK1CGf2S1dOr2GGE0KSkEvwMeM+odfMUTZGWlg61
         NH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655962; x=1771260762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EKSs5oLs7wKY5onKUxL0luWYu7wbrnabRL4F2MZ4aOo=;
        b=PNrN4EfIEmzFNuuctVl6/TDLN9nMGyULLoDq4QaNYBubeb+g/WAfNuk+OxkewoRslK
         guMSkMDzrIJOiZCiWm2Z+UcGK9mk0nySxOLakhARi02yedY0eSDId5G8NM9Z2xgpIVzt
         RH6aiHh5JkOJm6fovmdW9xSulavdRnkbGA/ff0nU2BthICrwdJyI6hH8N1DgBLGyPn1w
         IU+q71DbsH5J72ZsFblsEYBCWnTkAxMlO9cAEWwfVSTkySP3K1/pbTvur0vvaAX9ZoN0
         fXdaQXNOznmiUf56ywVmf7MYuQSWyzNNKzw7NoBytjINqSIf09Ptpflz6+m1cA8uxptN
         sYwQ==
X-Gm-Message-State: AOJu0YyHByASxPQTGEBrL1AZqpqa+STJ5kg3SUwjKT5f3x8LwzJGP+EZ
	rnLheVT0YfmLe/5xrAPeqQSAKnZcu658CD9o8ISBDgYBHME7iyPCKCUXW1jdNeUL
X-Gm-Gg: AZuq6aIQcveX+epL76c55I8DDmIgxYmiiAhVrmQVEy1NLv6/XaKiT8ZimeH0SD5UJD2
	9cnwnzVa/I+ztCthYKVPQZikXi0wNNz73a2YBc81Aej4nNWmtJ0J9yiGcgan7RcxNCpMHNXfsT3
	xU559fJdCfZc8pKhzJtb8bVpE3eG87NO1bAfxbaMPxz5q/H85KRxpRe6oLJ2EkMZ52rYY+ILPY2
	ija62YUE7jOgMJifgkhitaPRdBdqm/CxvacwErJcZVRK1LxPOpYyo9uu6waFlpv53RkkLES7ZQn
	kP9v3zkhTtnlYU7/1J8W9wpvTt1HZkjtX8betnk1crAFyAOqj5YADayl4N2KcHX/Q5tEMz7nPJB
	rebN3PhjEZxtt5fix76cP8X6NQDYyaf2jv1aQhVGmIlhlSuesnlwLfGsXWdDzAAS2mmSz2tCL1q
	mWI5HgolOCcozZL8uUFR9k31km7SJo+KHKIOtopCnGAv1Ui2OaGc541w==
X-Received: by 2002:a17:907:a45:b0:b8e:a1ae:f96a with SMTP id a640c23a62f3a-b8edf38cbf3mr741790166b.46.1770655961769;
        Mon, 09 Feb 2026 08:52:41 -0800 (PST)
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
Subject: [PATCH v3 04/16] xen/riscv: implement vcpu_csr_init()
Date: Mon,  9 Feb 2026 17:52:17 +0100
Message-ID: <212accf20032cc9cbe6c33752fa45de1c1284e3c.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8A041112B21
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
 xen/arch/riscv/domain.c                     | 68 +++++++++++++++++++++
 xen/arch/riscv/include/asm/current.h        |  2 +
 xen/arch/riscv/include/asm/domain.h         |  6 ++
 xen/arch/riscv/include/asm/riscv_encoding.h |  2 +
 4 files changed, 78 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index d035b105c2cc..af9586a4eb0d 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -5,6 +5,72 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
+#include <asm/cpufeature.h>
+#include <asm/csr.h>
+#include <asm/riscv_encoding.h>
+#include <asm/setup.h>
+
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
+static void vcpu_csr_init(struct vcpu *v)
+{
+    register_t hstateen0;
+
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
+         if (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia))
+            /*
+             * If the hypervisor extension is implemented, the same three
+             * bitsare defined also in hypervisor CSR hstateen0 but concern
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
+            hstateen0 = SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT;
+
+        /* Allow guest to access CSR_ENVCFG */
+        hstateen0 |= SMSTATEEN0_HSENVCFG;
+
+        v->arch.hstateen0 = hstateen0 & csr_masks.hstateen0;
+    }
+}
+
 static void continue_new_vcpu(struct vcpu *prev)
 {
     BUG_ON("unimplemented\n");
@@ -32,6 +98,8 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
     v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
 
+    vcpu_csr_init(v);
+
     /* Idle VCPUs don't need the rest of this setup */
     if ( is_idle_vcpu(v) )
         return rc;
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
index f78f145258d6..6bb06a50c6ab 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -48,6 +48,12 @@ struct arch_vcpu {
     } xen_saved_context;
 
     struct cpu_info *cpu_info;
+
+    register_t hcounteren;
+    register_t hedeleg;
+    register_t henvcfg;
+    register_t hideleg;
+    register_t hstateen0;
 };
 
 struct paging_domain {
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
2.52.0


