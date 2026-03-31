Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG0kEd0azGmePwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 21:05:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB74370591
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 21:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269260.1558367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eOA-0005E6-Eq; Tue, 31 Mar 2026 19:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269260.1558367; Tue, 31 Mar 2026 19:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eOA-0005CN-Ar; Tue, 31 Mar 2026 19:04:34 +0000
Received: by outflank-mailman (input) for mailman id 1269260;
 Tue, 31 Mar 2026 19:04:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7eO8-0004oP-6q
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 19:04:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7eO7-002qYo-J1
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 21:04:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc1aa3-2eae-0a2a0a5409dd-0a2a450ba5fc-44
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:04:31 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc1abf-ef63-0a2a450b0019-d1558036a919-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:04:31 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-486fe36cfabso1092635e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 12:04:31 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a6ebsm66704905e9.6.2026.03.31.12.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 12:04:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774983871; x=1775588671; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDr/6yFSh7ffXnt3TkKTvjWGoxscpXmm0MBYPU21APE=;
        b=jwglvYkOa8yor6zYJiFKat5QPlNjTC16G8W+EpXhi+HVhRkNtNZlO3+NAk7XrChKTy
         sCZTw4GdsF1yPLqwrlUpnSBAMhASyHmZM5am0FD/68Jd4QqgUkId01cpMrNEPN2qq9m7
         xX/IepbPoUlvK1iDz5xdBy4jO5cXyu51uc/EbX4tthFJwUqWj/1TYnrNiZhLtwTBLv5B
         yLoodGo7LZguwsR3TDIX+s9zrUewooeYSliUclKprMGxYv0JaQH+n1uWGNp77HITb1Zu
         u/tEH+f94alscN+Gojs8OqtitXmlL4ITsYzs+MT+9667inbSvtr6xgVMDZXGndrJa+WB
         o8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774983871; x=1775588671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vDr/6yFSh7ffXnt3TkKTvjWGoxscpXmm0MBYPU21APE=;
        b=fCA2jIIKjA5731ORlS+9JTN4piD4rfxH6awggSvTOG8fAoLtqhLHq1Hryq04qWtZtc
         waWkWHfeQwRUJjGg6Yjguy+N1Qk7KRI5U1pjVXg177OHhKAa6knWfJcrr9Ognxi3KUnp
         wQsg2PS5zlO8LfwT7s2wTm5Vwc4EotiLbL6z4jzyiwFKY2yvciVpAv3QcVoZQxCDXUnE
         A9012H8NTUQeGUtHw1KprorMFxNQfXLGaq2mWWjt0P0ZBhoDAnUuWzsl+is4jW0Q+tMq
         LKQLUpmZRyfjk1QXeZ2rlM07R1dlyjekPcfNeXNqDXBIlcisqgHSkE2mafkwk097d+36
         fYIQ==
X-Gm-Message-State: AOJu0YzakHEuLhquetsR2TZjHxOX+B8r/c4gs1yUs04dg/PMOY1mhJg9
	pIo4KwsQamk5XGVUNOVxuf3LtAWh5pyvIfLxRe4ViGHZSSapKgJTjWniF6DztQ==
X-Gm-Gg: ATEYQzyF78otg2WscSwA0Art8QgTyWuDeU1CakiUVXtSNyd5fmbxkLfP1lTXHIEhYxD
	NNQZzhwZUXvfD4nVvEnYFv0Oh27hs2szE8CYb956rQ5gUD9rZsySI2le5zF3BjhKNCG4IrSH4vs
	q0PnsvzvcuH/6Pzdd+MlRMhy8MXY2NiMUzivusDbcgHL5etT494CqjYS6BcVKQOPGxpj4tRulvk
	eHdr/C4W2pZZ8IPjYGHpRw7bAR42Vl4mov3L4iTv4oTcm6sW/BZQHZqZWOd33Ud0V2Gbpb2pMtH
	A1BntGjbgc+VhLCFGquKNFJh0VIPDC7c/1mNXvVZmraK4+SVlra3ilg6qXtQnUr8Cutz6nzrEwK
	SXF5ppcdGKv2UN9wUdd1rt1z6r0uX01FjrJh1ZbIs79CO1uHVME5KRghjVCDhBYs0Gxn/GWmxzD
	dSmDLgO8ETGyCnbM4BZ8rpm+AyftZ6gYu2fksu3WX2SjP+a6rr65LKGuvcUApWXNWm0A==
X-Received: by 2002:a05:600c:c04a:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-4888356610dmr7617095e9.1.1774983870625;
        Tue, 31 Mar 2026 12:04:30 -0700 (PDT)
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
Subject: [PATCH v2 3/4] xen/riscv: allow Xen to use SSTC while hiding it from guests
Date: Tue, 31 Mar 2026 21:04:18 +0200
Message-ID: <ff0e2e7332d5b887d00ad10caf01952f90f5da5c.1774863161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774863161.git.oleksii.kurochko@gmail.com>
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1774983871-9A2B0112-CA7E9819/10/73395122804
X-purgate-type: spam
X-purgate-size: 8423
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AFB74370591
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OpenSBI currently does not advertise the SSTC extension via the device
tree. Additionally, SSTC can no longer be reliably disabled by removing
the "sstc" string from riscv,isa, as OpenSBI probes support by attempting
to access CSR_STIMECMP.

Introduce a runtime probe in Xen to determine whether SSTC is available.
The probe attempts to read CSR_STIMECMP using csr_read_safe(). If the
access succeeds, SSTC is considered available; if a trap occurs, it is
treated as unsupported.

When SSTC is detected, Xen may use it internally to program timers.
However, the extension is not exposed to guests because the required
context switch handling for the SSTC CSRs is not yet implemented.

To prevent guests from using SSTC, RISCV_ISA_EXT_sstc is cleared from the
riscv_isa bitmap and in future patches from riscv_isa DTS property.
As a result, the corresponding HENVCFG bit is not set and guests fall
back to the SBI timer interface. Timer requests are then handled by Xen
via the usual SBI interception path.

Introduce set_xen_timer() to abstract how the timer is programmed,
either via the SSTC extension or an SBI call. This also reduces the
number of if statements in reprogram_timer().

The set_xen_timer function pointer is selected based on
csr_read_safe() rather than riscv_isa_extension(). The latter
reflects features supported by both Xen and the guest, while SSTC is
currently only supported for Xen. Therefore, relying solely on
riscv_isa_extension() would not reliably determine whether SSTC can be
used.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/cpufeature.c                 | 33 ++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h     |  1 +
 xen/arch/riscv/include/asm/riscv_encoding.h |  2 ++
 xen/arch/riscv/time.c                       | 34 ++++++++++++---------
 xen/arch/riscv/vtimer.c                     |  7 ++++-
 5 files changed, 62 insertions(+), 15 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 03e27b037be0..823af53ca18e 100644
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
 
+    if ( csr_read_safe(CSR_STIMECMP, &tmp) )
+    {
+        printk("SSTC is detected but is supported only for Xen usage not for "
+               "a guest\n");
+
+        /*
+         * As SSTC for guest isn't supported it is needed temprorary to:
+         *
+         * 1. Clear bit RISCV_ISA_EXT_sstc in riscv_isa as theoretuically it
+         *    could be that OpenSBI (it doesn't pass it now) or whatever ran
+         *    before Xen will add SSTC to riscv,isa string. This bit clear
+         *    won't allow guest to use SSTC extension as vtimer context
+         *    switch and restore isn't ready for that.
+         */
+        __clear_bit(RISCV_ISA_EXT_sstc, riscv_isa);
+
+        /*
+         * 2. A VS-timer interrupt becomes pending whenever the value of
+         *    (time + htimedelta) is greater than or equal to vstimecmp CSR.
+         *    Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
+         *    ULONG_MAX.
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
index dd15731a86fa..d0d60ba15e62 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -396,6 +396,8 @@
 #define CSR_VSTVAL			0x243
 #define CSR_VSIP			0x244
 #define CSR_VSATP			0x280
+#define CSR_VSTIMECMP		0x24d
+#define CSR_VSTIMECMPH		0x25d
 
 /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
 #define CSR_HVIEN			0x608
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index 7efa76fdbcb1..42d547a03e0f 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -13,6 +13,18 @@
 unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
 uint64_t __ro_after_init boot_clock_cycles;
 
+static int cf_check sstc_set_xen_timer(uint64_t deadline)
+{
+    csr_write(CSR_STIMECMP, deadline);
+#ifdef CONFIG_RISCV_32
+    csr_write(CSR_STIMECMPH, deadline >> 32);
+#endif
+
+    return 0;
+}
+
+static int (* __ro_after_init set_xen_timer)(uint64_t deadline);
+
 s_time_t get_s_time(void)
 {
     uint64_t ticks = get_cycles() - boot_clock_cycles;
@@ -61,20 +73,7 @@ int reprogram_timer(s_time_t timeout)
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
@@ -85,10 +84,17 @@ int reprogram_timer(s_time_t timeout)
 
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
+    if ( csr_read_safe(CSR_STIMECMP, &tmp) )
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


