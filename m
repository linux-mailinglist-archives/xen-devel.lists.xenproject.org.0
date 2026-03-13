Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAA9LxI/tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:45:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210D287568
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:45:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254119.1550113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15d7-0004cg-7H; Fri, 13 Mar 2026 16:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254119.1550113; Fri, 13 Mar 2026 16:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15d7-0004Wr-2I; Fri, 13 Mar 2026 16:44:53 +0000
Received: by outflank-mailman (input) for mailman id 1254119;
 Fri, 13 Mar 2026 16:44:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p3qR=BN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w15d5-00048B-Pw
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:44:51 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f435c1fd-1efb-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 17:44:50 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-66174cf4549so4941958a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 09:44:50 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66350b86008sm1394733a12.28.2026.03.13.09.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:44:49 -0700 (PDT)
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
X-Inumbo-ID: f435c1fd-1efb-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420290; x=1774025090; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egLBPEab6gTvn7B0yNjcrbib+hRrlZdbL6l46eIKhHg=;
        b=PCUXyVC2uvQ+ozJDii+Px996LuQlkOdk6UdUymyowukD2LOJ9Y9Xh6VCnXDU1SsZWv
         cbED5sVTUp4c6OWXy6D3a5vGhkXWGB6HaLuZhG+kdVl8TqehOzuZT3GuBmBIA6pjMCNd
         PZfZ2vvo1PLdFUQQmH4AfVAiQ6olhGuK8yMxAdp93aKomX6QhBuOr7QWqcXWeuth5pcH
         dxQiRUvtAOZM7T1PcSaGqKPrG1rWMIquN2SFsjyMAqsxHfFqiH2PBPuCX85ql6v/UCkF
         5hSHgaVwK1RBlb/QSsr9dsirgXKgTNN72LPncm5c3CGdkzOt/qdw59lRPid0VdIoMlBf
         QMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420290; x=1774025090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egLBPEab6gTvn7B0yNjcrbib+hRrlZdbL6l46eIKhHg=;
        b=iliqa567zrjuUQUKokjcwy1wUU/wNh6/IkJfSpjYNrp3kYeBDfN9eTTwqgPXSKoMB2
         n626ljDoQiiopCMZnzfV44i1z31I4y+0Rj1nUtmPxaaEX/X6wdUigCdZosehiZz7O/vo
         FoTIqZuyJXiKW2Ly1Q37ebL/71uOLR27PV8gI2j5tRo5nbjxG7Yh/Aq1Nr2AqTCSTni4
         THHeICHnriMbRQF1awHK8yyv6pNh76Lc1fqdkopmjXx0XhjXSym+x9hNEXlxeISm+DNb
         Wb8rSnPy57YNrQYaTHX01Br73/4GxfJWjNJjI0bTbKGUUP4CW40u5XzVWD3JqGZwzRCT
         E08A==
X-Gm-Message-State: AOJu0YwXo4CIYIB/SxQSVFcLlFsWYSu/JxarOq63jmFjevymYmi03gy6
	mdXOGdXFbkIaTzwqaQIEkfpoWoIE3XwDlfVk5rIqjqaltq9do+gzW5bmVR9yNg==
X-Gm-Gg: ATEYQzy5tUsM8Uq3Iz8Vu+Q7MjIja0I184M2Q7bsqvebAtoGlaCp9i3ol/7qyrjI93i
	sVPRAQaBDhMH25F24/e/6oIqkpxtxPUBedrfzkZbF1JlqVlSbTCqEO7f+/7BXh57WpI7BSX2omg
	P7SM726+hAY9eNymaIEtClHCzWWsjr9ql/3MVfXz3HAvG9tMgm2R8eLOBFviMRfhXosTrzRQbMC
	kRLuhgCyKHkXLJL+tyo/7Xdq/Qc1Qv4Zkdd2nv+JrIwPhVbVnyMtd3FhNKsqM/EylS+y4Ia7EFy
	izTIXSIxwwTtB06N9RQY2nIFuLqivQ9T8Fa2Z0YmlvmJ0sOYpnpmpgiT5ru5Tl+s+MZmBCFuuCC
	LQetyXaNwuCzBsPLPrAcGQu2GQ6sWK7XizflZUe8v3w3Em6GZBTSH8oEW5A6r9pEtnpVv0Nr+qo
	utgJFzH83KPFCmhA0B4/pq81VQHxc0uzbVTB+jH4wsfVWRfl0cTG7DBh/zZ328P01+QA==
X-Received: by 2002:a05:6402:42cc:b0:660:f351:758d with SMTP id 4fb4d7f45d1cf-663b6f7ffafmr2600176a12.7.1773420289901;
        Fri, 13 Mar 2026 09:44:49 -0700 (PDT)
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
Subject: [PATCH v1 3/4] xen/riscv: allow Xen to use SSTC while hiding it from guests
Date: Fri, 13 Mar 2026 17:44:37 +0100
Message-ID: <0f0849b53625f9f9f939000f29579e264e522fd2.1773419622.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773419622.git.oleksii.kurochko@gmail.com>
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 7210D287568
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OpenSBI currently does not advertise the SSTC extension via the device
tree. Additionally, SSTC can no longer be reliably disabled by removing
the "sstc" string from riscv,isa, as OpenSBI probes support by attempting
to access CSR_STIMECMP.

Introduce a runtime probe in Xen to determine whether SSTC is available.
The probe attempts to read CSR_STIMECMP using csr_allowed_read(). If the
access succeeds, SSTC is considered available; if a trap occurs, it is
treated as unsupported.

When SSTC is detected, Xen may use it internally to program timers.
However, the extension is not exposed to guests because the required
context switch handling for the SSTC CSRs is not yet implemented.

To prevent guests from using SSTC, RISCV_ISA_EXT_sstc is cleared from the
riscv_isa bitmap. As a result, the corresponding HENVCFG bit is not set
and guests fall back to the SBI timer interface. Timer requests are then
handled by Xen via the usual SBI interception path.

Introduce set_xen_timer() to abstract how the timer is programmed,
either via the SSTC extension or an SBI call. This also reduces the
number of if statements in reprogram_timer().

The set_xen_timer function pointer is selected based on
csr_allowed_read() rather than riscv_isa_extension(). The latter
reflects features supported by both Xen and the guest, while SSTC is
currently only supported for Xen. Therefore, relying solely on
riscv_isa_extension() would not reliably determine whether SSTC can be
used.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/cpufeature.c                 | 33 +++++++++++++++++++
 xen/arch/riscv/domain.c                     |  3 ++
 xen/arch/riscv/include/asm/cpufeature.h     |  1 +
 xen/arch/riscv/include/asm/riscv_encoding.h |  2 ++
 xen/arch/riscv/time.c                       | 36 +++++++++++++--------
 xen/arch/riscv/vtimer.c                     |  7 +++-
 6 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 03e27b037be0..a7aa2358b73b 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -17,6 +17,7 @@
 #include <xen/sections.h>
 
 #include <asm/cpufeature.h>
+#include <asm/csr.h>
 
 #ifdef CONFIG_ACPI
 # error "cpufeature.c functions should be updated to support ACPI"
@@ -139,6 +140,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(smaia),
     RISCV_ISA_EXT_DATA(smstateen),
     RISCV_ISA_EXT_DATA(ssaia),
+    RISCV_ISA_EXT_DATA(sstc),
     RISCV_ISA_EXT_DATA(svade),
     RISCV_ISA_EXT_DATA(svpbmt),
 };
@@ -483,6 +485,7 @@ void __init riscv_fill_hwcap(void)
     unsigned int i;
     const size_t req_extns_amount = ARRAY_SIZE(required_extensions);
     bool all_extns_available = true;
+    unsigned long tmp;
 
     riscv_fill_hwcap_from_isa_string();
 
@@ -495,6 +498,36 @@ void __init riscv_fill_hwcap(void)
         panic("HW capabilities parsing failed: %s\n", failure_msg);
     }
 
+    if ( csr_allowed_read(CSR_STIMECMP, &tmp) )
+    {
+        printk("SSTC is detected but is supported only for Xen usage not for "
+               "a guest.\n");
+
+        /*
+         * As SSTC for guest isn't supported it is needed temprorary to:
+         *
+         * 1. Clear bit RISCV_ISA_EXT_sstc in riscv_isa as theoretuically it
+         *    could be that OpenSBI (it doesn't pass it now) or whatever ran
+         *    before Xen will add SSTC to riscv,isa string. This bit  clear
+         *    willn't allow guest to use SSTC extension as vtimer context
+         *    switch and restore isn't ready for that.
+         */
+        __clear_bit(RISCV_ISA_EXT_sstc, riscv_isa);
+
+        /*
+         * 2. A VS-timer interrupt becomes pending whenever the value of
+         *    (time + htimedelta) is greater than or equal to vstimecmp CSR.
+         *    Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
+         *    -1.
+         *
+         * It should be dropped when SSTC for guests will be supported.
+         */
+        csr_write(CSR_VSTIMECMP, ULONG_MAX);
+#ifdef CONFIG_RISCV_32
+        csr_write(CSR_VSTIMECMPH, ULONG_MAX);
+#endif
+    }
+
     for ( i = 0; i < req_extns_amount; i++ )
     {
         const struct riscv_isa_ext_data ext = required_extensions[i];
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index c327f44d07ca..5f15dda88c8e 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -99,6 +99,9 @@ static void vcpu_csr_init(struct vcpu *v)
     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
         v->arch.henvcfg = ENVCFG_PBMTE & csr_masks.henvcfg;
 
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc) )
+        v->arch.henvcfg |= ENVCFG_STCE & csr_masks.henvcfg;
+
     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
     {
         /* Allow guest to access CSR_SENVCFG */
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index ef02a3e26d2c..0c48d57a03bb 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -38,6 +38,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_smaia,
     RISCV_ISA_EXT_smstateen,
     RISCV_ISA_EXT_ssaia,
+    RISCV_ISA_EXT_sstc,
     RISCV_ISA_EXT_svade,
     RISCV_ISA_EXT_svpbmt,
     RISCV_ISA_EXT_MAX
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index dd15731a86fa..7fc379cab588 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -396,6 +396,8 @@
 #define CSR_VSTVAL			0x243
 #define CSR_VSIP			0x244
 #define CSR_VSATP			0x280
+#define CSR_VSTIMECMP		0x24D
+#define CSR_VSTIMECMPH		0x25D
 
 /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
 #define CSR_HVIEN			0x608
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index 7efa76fdbcb1..98eca2887d5c 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -13,6 +13,20 @@
 unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
 uint64_t __ro_after_init boot_clock_cycles;
 
+static int cf_check sstc_set_xen_timer(uint64_t deadline)
+{
+#ifdef CONFIG_RISCV_32
+    csr_write(CSR_STIMECMP, deadline & 0xFFFFFFFF);
+    csr_write(CSR_STIMECMPH, deadline >> 32);
+#else
+    csr_write(CSR_STIMECMP, deadline);
+#endif
+
+    return 0;
+}
+
+int (* __ro_after_init set_xen_timer)(uint64_t deadline);
+
 s_time_t get_s_time(void)
 {
     uint64_t ticks = get_cycles() - boot_clock_cycles;
@@ -61,20 +75,7 @@ int reprogram_timer(s_time_t timeout)
     if ( deadline <= now )
         return 0;
 
-    /*
-     * TODO: When the SSTC extension is supported, it would be preferable to
-     *       use the supervisor timer registers directly here for better
-     *       performance, since an SBI call and mode switch would no longer
-     *       be required.
-     *
-     *       This would also reduce reliance on a specific SBI implementation.
-     *       For example, it is not ideal to panic() if sbi_set_timer() returns
-     *       a non-zero value. Currently it can return 0 or -ENOSUPP, and
-     *       without SSTC we still need an implementation because only the
-     *       M-mode timer is available, and it can only be programmed in
-     *       M-mode.
-     */
-    if ( (rc = sbi_set_timer(deadline)) )
+    if ( (rc = set_xen_timer(deadline)) )
         panic("%s: timer wasn't set because: %d\n", __func__, rc);
 
     /* Enable timer interrupt */
@@ -85,10 +86,17 @@ int reprogram_timer(s_time_t timeout)
 
 void __init preinit_xen_time(void)
 {
+    unsigned long tmp;
+
     if ( acpi_disabled )
         preinit_dt_xen_time();
     else
         panic("%s: ACPI isn't supported\n", __func__);
 
     boot_clock_cycles = get_cycles();
+
+    if ( csr_allowed_read(CSR_STIMECMP, &tmp) )
+        set_xen_timer = sstc_set_xen_timer;
+    else
+        set_xen_timer = sbi_set_timer;
 }
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
index afd8a53a7387..c065052afeb7 100644
--- a/xen/arch/riscv/vtimer.c
+++ b/xen/arch/riscv/vtimer.c
@@ -4,6 +4,7 @@
 #include <xen/sched.h>
 #include <xen/timer.h>
 
+#include <asm/cpufeature.h>
 #include <asm/vtimer.h>
 
 static void vtimer_expired(void *data)
@@ -75,12 +76,16 @@ void vtimer_ctxt_switch_from(struct vcpu *p)
 {
     ASSERT(!is_idle_vcpu(p));
 
-    /* Nothing to do at the moment as SSTC isn't supported now. */
+    BUG_ON(riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc));
+
+    /* Nothing to do at the moment as SSTC for guests isn't supported now */
 }
 
 void vtimer_ctxt_switch_to(struct vcpu *n)
 {
     ASSERT(!is_idle_vcpu(n));
 
+    BUG_ON(riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc));
+
     migrate_timer(&n->arch.vtimer.timer, n->processor);
 }
-- 
2.53.0


