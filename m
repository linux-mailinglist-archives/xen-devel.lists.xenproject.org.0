Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 30+hC75UcmkIiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:47:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAA56A3E0
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211345.1522888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqV-0007X3-85; Thu, 22 Jan 2026 16:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211345.1522888; Thu, 22 Jan 2026 16:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqV-0007W9-4O; Thu, 22 Jan 2026 16:47:47 +0000
Received: by outflank-mailman (input) for mailman id 1211345;
 Thu, 22 Jan 2026 16:47:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqT-0007Id-Ct
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:45 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12e17298-f7b2-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 17:47:44 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6505d3b84bcso1589974a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:44 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:42 -0800 (PST)
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
X-Inumbo-ID: 12e17298-f7b2-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100463; x=1769705263; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yeF8Jc7Y0UzeLgMob1T0cLJ1Uc8AiT2zOW9g8mOyGs=;
        b=dzhzdsGsNLUKHpBU1UeScuv5wScuBRKU41tApu0ec6Ko407QhGrku7BMwOcOTMVW82
         mou3M9EPJIJchXivtYowS/iQA0+2HlsJ2JnNlfwEpPybLDHJimQy35bNdcVwCBBqiI+y
         lfEm7oonjgtr+cF96EG5QAR1KJlSAo9dcFyBpH2347BKpJuSv4UUGUOg7oFwFRB1jOYd
         b3U9XSuTCsXKfc7sgq3jUVDFGE2UNAjysRFU4m/na5rLyL8Fs7/ArE9OoeKEwTmmozCu
         1Tr4PSIaYVbeDQWGs1kCx1hUc4seq4hkiTBFtYUHwpFtRzO7nuf+D0otCDNwWUsytFrN
         VZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100463; x=1769705263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6yeF8Jc7Y0UzeLgMob1T0cLJ1Uc8AiT2zOW9g8mOyGs=;
        b=WY5fya9N7r/5XHy2AFxGHWjmncvj0nPZvhiqZL9HVjxHnQLof7k/2r53ZtnpQj9XOp
         8GmPieC7dvMXkNqXDB/UM8fe2Kjzs6YxCrBNTTqsBjV9OJLJiPsxPChDSOFwibMrghFS
         9Ki7wyimUpBdv1vvOJoBHWcIJ/CEArtsoWURWKGcrUYywhocSxXvlUrzLl7vedHlx/Hr
         xX4OWcY9WeOnBbpx78bxYvJgleydJFRLT/naZrKWKDjsh96RWMeplOMZc3tZvajQtkVW
         3e3LrA4nXh8vw9BMm5O8jPntFmBbRK4Zi8yI+fRGbShLoPmsspKFlYS1qNgJ6Tg49jV+
         svlA==
X-Gm-Message-State: AOJu0YzYDl3k7LDpSrPNcGSF23TMZzKJOWknRlbJGlPWcK51wMfMsSXa
	LojmIOdLGNIqwjsEoDsdDr7FQAy+DSr+kWrtNz4cX5xQFBSSPQIn7lY4tuSTvA==
X-Gm-Gg: AZuq6aJsIpbUBvfNeU0MUKKCtKBd093hpPJdUJCrL/zbpiGQZ/J0lLpgSDwbERmVXns
	sJkwO9UjWzY0vzh5ozRo5hkA3p+DmgNRwCws1RYUgSkUwcAec7sn15ULbr6/u5t8Q1dgYTHc0bj
	XdckiET5x34xgu8Jz8n3s9yBmTwIfUPyUpRxweftoAaYm7PvTLG/AI8ZCJ5LdJheGdWFQufDaAV
	eyOU2C1eMSYqK6k8ibYuzXZv2FvCeI1CgU0sfIUs/m7pustwOymx4mHClKPOXWAhtERawDGABTr
	5ZGfQtBXwb+d1m8MntvQL8nnahpnoTx4Hv3ujCY+T1MAoumwQjTu825i+s5beOSXfn88CLESk/t
	GXUJmQoaRNSAf4ipJZemOUDPVF5rb3ucBS/Q+nSFQSBFjn1V6N/IyKiSJRCG5CcFFdpkGq9T0AZ
	RCXYz3Ve0Genk2iLW8eQnkSIe86BVDSCG8YYC0lSJ4+ptVypq4uEZ1Xw==
X-Received: by 2002:a17:907:1ca9:b0:b87:35fc:ae5f with SMTP id a640c23a62f3a-b87930381c7mr2000586266b.52.1769100463285;
        Thu, 22 Jan 2026 08:47:43 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v2 03/16] xen/riscv: implement vcpu_csr_init()
Date: Thu, 22 Jan 2026 17:47:18 +0100
Message-ID: <57ef3bcff854d4b50641641d300b3e8aa715c3c3.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8CAA56A3E0
X-Rspamd-Action: no action

Introduce vcpu_csr_init() to set up the initial hypervisor-visible CSR
state for a vCPU before it is first scheduled.
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
hstateen0), the written value is re-read from hardware and cached in
vcpu->arch to avoid divergence between the software state and the actual
CSR contents.

As hstatus is not part of struct arch_vcpu (it already resides in
struct cpu_user_regs), introduce vcpu_guest_cpu_user_regs() to provide
a uniform way to access hstatus and other guest CPU user registers.

This establishes a consistent and well-defined initial CSR state for
vCPUs prior to their first context switch.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/cpufeature.c                 |  1 +
 xen/arch/riscv/domain.c                     | 73 +++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h     |  1 +
 xen/arch/riscv/include/asm/current.h        |  2 +
 xen/arch/riscv/include/asm/riscv_encoding.h |  2 +
 5 files changed, 79 insertions(+)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 02b68aeaa49f..03e27b037be0 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -137,6 +137,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(zbb),
     RISCV_ISA_EXT_DATA(zbs),
     RISCV_ISA_EXT_DATA(smaia),
+    RISCV_ISA_EXT_DATA(smstateen),
     RISCV_ISA_EXT_DATA(ssaia),
     RISCV_ISA_EXT_DATA(svade),
     RISCV_ISA_EXT_DATA(svpbmt),
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 9c546267881b..3ae5fa3a8805 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -5,6 +5,77 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
+#include <asm/cpufeature.h>
+#include <asm/csr.h>
+#include <asm/riscv_encoding.h>
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
+    csr_write(CSR_HEDELEG, HEDELEG_DEFAULT);
+    v->arch.hedeleg = csr_read(CSR_HEDELEG);
+
+    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
+
+    csr_write(CSR_HIDELEG, HIDELEG_DEFAULT);
+    v->arch.hideleg = csr_read(CSR_HIDELEG);
+
+    /*
+     * VS should access only the time counter directly.
+     * Everything else should trap.
+     */
+    v->arch.hcounteren = HCOUNTEREN_TM;
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
+    {
+        csr_write(CSR_HENVCFG, ENVCFG_PBMTE);
+        v->arch.henvcfg = csr_read(CSR_HENVCFG);
+    }
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
+        csr_write(CSR_HSTATEEN0, hstateen0);
+        v->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
+    }
+}
+
 static void continue_new_vcpu(struct vcpu *prev)
 {
     BUG_ON("unimplemented\n");
@@ -33,6 +104,8 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
     v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
 
+    vcpu_csr_init(v);
+
     /* Idle VCPUs don't need the rest of this setup */
     if ( is_idle_vcpu(v) )
         return rc;
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index b69616038888..ef02a3e26d2c 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -36,6 +36,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_zbb,
     RISCV_ISA_EXT_zbs,
     RISCV_ISA_EXT_smaia,
+    RISCV_ISA_EXT_smstateen,
     RISCV_ISA_EXT_ssaia,
     RISCV_ISA_EXT_svade,
     RISCV_ISA_EXT_svpbmt,
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


