Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF/aCCRP52lW6QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:19:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701FF4396C6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288781.1569025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8C2-00048d-MA; Tue, 21 Apr 2026 10:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288781.1569025; Tue, 21 Apr 2026 10:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8C2-00045d-JB; Tue, 21 Apr 2026 10:18:58 +0000
Received: by outflank-mailman (input) for mailman id 1288781;
 Tue, 21 Apr 2026 10:18:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF8C1-00045V-19
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:18:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8Bz-00E6S9-S2
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:18:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e74f08-e002-0a2a0a5209dd-0a2a4506a582-26
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:18:55 +0200
Received: from [209.85.167.44] (helo=mail-lf1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e74f0f-7371-0a2a45060019-d155a72ca5f1-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:18:55 +0200
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5a415fd6bceso4495468e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 03:18:55 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e12e0sm3564564e87.51.2026.04.21.03.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 03:18:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776766735; x=1777371535; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U1jc54BGtToaT12LTQTuzf+wdJ5L1Gzc0Hnuk+KSU3E=;
        b=fD+JmlI+AXOUVNf51VrV8JbEdfz+fH+yGUX4vdMTEPKBjG7Q7ztMl8JnSPW2gfbfjP
         VxrNLYj12kYkadFwnad3MIhFypIgNstlSxtU4Ddk1sWclDuKfOsoCcmv3KXChj4OXxuL
         j1KHMF6RRBagAlHDt/kORLIBq449X0YVs/sVcyk3F5fji5F1cLbPHyW2ChW8NrPAZsby
         PgZkBmmIqF0kYXLeR5FTIWf0siwt0cpi5fiZnj/N6JcfCnkD19k7c2D0N3UJUKikqvMr
         e0jde7AmqdkGNzx2zLus9bCPUlHmc026yFSmFpPNSMU8g3ddmZPp3Zo0ScBjiNnhbjVl
         Rx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776766735; x=1777371535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1jc54BGtToaT12LTQTuzf+wdJ5L1Gzc0Hnuk+KSU3E=;
        b=COwKmjNZOo95DZuGwa3MuOgH9MwDrK04SIWHhibv/bQ1YxaQhASL3c2e1MjYAlbceK
         9X+DVY3T+xQdCSsm+QTBAqYIAKlOzNuBXWStorJucTaHox+NaeABBGjl0SmqqrfKueje
         Hq0K4LxdAAzxCwRMJc7A7T0Jb5elemHDJJgIDOzD0V5ZMQdShbQkPoNAgZuCDWaTkVzp
         2nI4HdG8xBEolrRHMWKLQCT+mvbrX3AQJFlTzshnVxQJXhhCH7HBgdmQt+7QLOkkNTFF
         GK5gNABz9DzFF7jlFReLixdlbTyPMcYYnNG7/w8hCYtZrVxGzayXRkCpbk96z7/n2SIq
         zXCA==
X-Gm-Message-State: AOJu0YzYDagfQDHqCu4B1N3dd5OMXutl8NnElIjBqnFszLt5qha7WYfg
	eB9JZhTJmbLlJ8UwXhgPSVtboJUtTVy0daGiOOaoko5q2vzzxGXoAd0CuynvvQ==
X-Gm-Gg: AeBDiesV0IafGx+/ij/To3gHOqequx9F3xC+ux8l8AVlgVyZRYsbpvhd2R4fz3DdFgu
	7mR9G989Nnubc2mLhKmz5a6i/c+UNKHgHhhhMOOOD4q/KH+1QB59z8kBK2M5DOODyvB91g4RGw4
	IryNLvXvvOWpbRGjj5cMjk6gm/9IxlXnz5ur+3xXeTwitj5w+8WneBnuy0ke37cveQElxA9ciJ5
	mzd/oDzkt/RmfIs6xWuUlAFKhMc7j2f9Y9k+XNfq7EyFWt/iJ5ZuJT+jnHSZZeFRUBOC5xUMnaV
	Qnv6rmMSLrV41+rqNICwGe4wRg/0ipMwhoZ+eaBON/NXkFkwun0Nefe6T6NrzBF+FKsJrI3yzev
	zeiL4slY33ibEv6pXU+9mtgQQBki53LYjTxKNoAevg/sjurhRB56ertBUo5ANK/UlpkcMJTqGSL
	FqvMczTM0OBWAVeuCoBCnxMy8srEHlOl4Jjd2fsveMIZ+ywd2poPCrgbQYf9hpnH/d3FoAKWmVz
	e1o
X-Received: by 2002:a05:6512:138c:b0:5a4:6f3:e0a with SMTP id 2adb3069b0e04-5a417174ccamr5585750e87.8.1776766734014;
        Tue, 21 Apr 2026 03:18:54 -0700 (PDT)
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
Subject: [PATCH v5] xen/riscv: allow Xen to use SSTC while hiding it from guests
Date: Tue, 21 Apr 2026 12:18:45 +0200
Message-ID: <2d5892447d6b6ad72962b8bbcb7c4d865b9e9989.1776765651.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1776766735-90670D75-4D5EE2F0/10/73395122804
X-purgate-type: spam
X-purgate-size: 13991
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.957];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 701FF4396C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OpenSBI currently does not advertise the SSTC extension via the device
tree, so if SSTC support is detected by Xen the riscv_isa bitmap is updated
manually. Furthermore, removing the "sstc" string from riscv,isa is not
a reliable way to disable SSTC, because OpenSBI probes support by
attempting to access CSR_STIMECMP.

Introduce a runtime probe in Xen to determine whether SSTC is available.
The probe attempts to read CSR_STIMECMP using csr_read_safe(). If the
access succeeds, SSTC is considered available; if a trap occurs, it is
treated as unsupported.

When SSTC is detected, Xen may use it internally to program timers.
However, the extension is not exposed to guests because the required
context switch handling for the SSTC CSRs is not yet implemented.

Note: clearing RISCV_ISA_EXT_sstc from the DTS riscv,isa property is
deferred to a follow-up patch. Also, the corresponding HENVCFG bit is
not set so guests fall back to the SBI timer interface. Timer requests
are then handled by Xen via the usual SBI interception path.

Introduce set_xen_timer() to abstract how the timer is programmed,
either via the SSTC extension or an SBI call.

Drop sbi_set_timer() as it is more than enough to have only introduced
set_xen_timer().

Drop "SBI v0.2 TIME extension detected" message to avoid confusion
which set timer function is really used.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
----
Changes in v5:
 - Update defintion of csr_write64() to avoid compilation issue.
----
Changes in v4:
 - Introduce csr_write64() and __csr_write32h().
 - Sort numericaly definitions of CSR_VSTIMECMP{H}.
---
Changes in v3:
 - Reword print message when SSTC extension is detected.
 - s/__clear_bit/__set_bit() for the case when SSTC is detected in
   riscv_fill_hwcap().
   Update also the comment above __set_bit().
 - Drop BUG_ON()s in vtimer.c.
 - s/printk/dprintk for the message: SSTC detected...
 - Drop sbi_set_timer global variable, it is enough just to have set_xen_timer.
 - As we set bit in riscv_isa bitmap there is no need to use csr_read_safe(CSR_STIMECMP) second time.
 - Move init of CSR_VSTIMECMP in preinit_xen_time as it looks more correct place.
 - Update the commit message.
---
Changes in v2:
 - Minor style fixes.
 - Drop from vcpu_csr_init() setting of SSTC bit in HENVCFG register. Add it
   back when SSTC for guests will be available.
 - Add static to set_xen_timer function pointer.
 - Refactor sstc_set_xen_timer().
 - s/csr_allowed_read/csr_read_safe()
---
 xen/arch/riscv/cpufeature.c                 | 18 +++++++++
 xen/arch/riscv/include/asm/cpufeature.h     |  1 +
 xen/arch/riscv/include/asm/csr.h            | 15 ++++++++
 xen/arch/riscv/include/asm/riscv_encoding.h |  2 +
 xen/arch/riscv/include/asm/sbi.h            | 18 ---------
 xen/arch/riscv/include/asm/time.h           |  3 ++
 xen/arch/riscv/sbi.c                        | 29 +++++++++++---
 xen/arch/riscv/time.c                       | 42 +++++++++++++--------
 xen/arch/riscv/vtimer.c                     |  1 +
 9 files changed, 90 insertions(+), 39 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 03e27b037be0..92235fdfd5ab 100644
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
 
@@ -495,6 +498,21 @@ void __init riscv_fill_hwcap(void)
         panic("HW capabilities parsing failed: %s\n", failure_msg);
     }
 
+    if ( csr_read_safe(CSR_STIMECMP, &tmp) )
+    {
+        dprintk(XENLOG_DEBUG,
+                "SSTC detected; supported for Xen use, but not for guests\n");
+
+        /*
+         * As there is no any guarantee that SSTC will be added to riscv,isa
+         * property by OpenSBI(it doesn't add it now) or whatever ran before
+         * Xen, it is needed to set this bit manually.
+         *
+         * Guest isolation is maintained by not setting ENVCFG_STCE in henvcfg.
+         */
+        __set_bit(RISCV_ISA_EXT_sstc, riscv_isa);
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
diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index 27d4b7942f6b..888d6a2a86d6 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -32,6 +32,21 @@
                            : "memory" );                        \
 })
 
+#ifdef CONFIG_RISCV_32
+#define csr_write64(csr, val)       \
+({                                  \
+    uint64_t v_ = (val);            \
+    csr_write(csr, v_);             \
+    csr_write(csr ## H, v_ >> 32);  \
+})
+#else
+#define csr_write64(csr, val)       \
+({                                  \
+    csr_write(csr, val);            \
+    (void)csr ## H;                 \
+})
+#endif
+
 #define csr_swap(csr, val)                                      \
 ({                                                              \
     unsigned long __v = (unsigned long)(val);                   \
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index dd15731a86fa..03e186bcdb8c 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -395,6 +395,8 @@
 #define CSR_VSCAUSE			0x242
 #define CSR_VSTVAL			0x243
 #define CSR_VSIP			0x244
+#define CSR_VSTIMECMP		0x24d
+#define CSR_VSTIMECMPH		0x25d
 #define CSR_VSATP			0x280
 
 /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index ed7af200288f..1952868e963c 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -13,7 +13,6 @@
 #define ASM__RISCV__SBI_H
 
 #include <xen/cpumask.h>
-#include <xen/sections.h>
 
 /* SBI-defined implementation ID */
 #define SBI_XEN_IMPID 7
@@ -139,23 +138,6 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
 int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
                                 size_t size, unsigned long vmid);
 
-/*
- * Programs the clock for next event at (or after) stime_value. stime_value is
- * in absolute time. This function must clear the pending timer interrupt bit
- * as well.
- *
- * If the supervisor wishes to clear the timer interrupt without scheduling the
- * next timer event, it can either request a timer interrupt infinitely far
- * into the future (i.e., (uint64_t)-1), or it can instead mask the timer
- * interrupt by clearing sie.STIE CSR bit.
- *
- * The stime_value parameter represents absolute time measured in ticks.
- *
- * This SBI call returns 0 upon success or an implementation specific negative
- * error code.
- */
-extern int (* __ro_after_init sbi_set_timer)(uint64_t stime_value);
-
 /*
  * Initialize SBI library
  *
diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index be3875b9984e..4d68900151a7 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -4,6 +4,7 @@
 
 #include <xen/bug.h>
 #include <xen/muldiv64.h>
+#include <xen/sections.h>
 
 #include <asm/csr.h>
 
@@ -26,6 +27,8 @@ static inline cycles_t get_cycles(void)
 
 void preinit_xen_time(void);
 
+extern int (* __ro_after_init set_xen_timer)(uint64_t deadline);
+
 #endif /* ASM__RISCV__TIME_H */
 
 /*
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
index b4a7ae6940c1..3576e26033a5 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -22,6 +22,7 @@
 
 #include <asm/processor.h>
 #include <asm/sbi.h>
+#include <asm/time.h>
 
 static unsigned long __ro_after_init sbi_spec_version = SBI_SPEC_VERSION_DEFAULT;
 
@@ -249,6 +250,21 @@ static int (* __ro_after_init sbi_rfence)(unsigned long fid,
                                           unsigned long arg4,
                                           unsigned long arg5);
 
+/*
+ * Programs the clock for next event at (or after) stime_value. stime_value is
+ * in absolute time. This function must clear the pending timer interrupt bit
+ * as well.
+ *
+ * If the supervisor wishes to clear the timer interrupt without scheduling the
+ * next timer event, it can either request a timer interrupt infinitely far
+ * into the future (i.e., (uint64_t)-1), or it can instead mask the timer
+ * interrupt by clearing sie.STIE CSR bit.
+ *
+ * The stime_value parameter represents absolute time measured in ticks.
+ *
+ * This SBI call returns 0 upon success or an implementation specific negative
+ * error code.
+ */
 static int cf_check sbi_set_timer_v02(uint64_t stime_value)
 {
     struct sbiret ret;
@@ -264,6 +280,10 @@ static int cf_check sbi_set_timer_v02(uint64_t stime_value)
     return sbi_err_map_xen_errno(ret.error);
 }
 
+/*
+ * Legacy SBI v0.1 SET_TIMER; functionally equivalent to sbi_set_timer_v02
+ * from Xen's perspective.
+ */
 static int cf_check sbi_set_timer_v01(uint64_t stime_value)
 {
     struct sbiret ret;
@@ -279,8 +299,6 @@ static int cf_check sbi_set_timer_v01(uint64_t stime_value)
     return sbi_err_map_xen_errno(ret.error);
 }
 
-int (* __ro_after_init sbi_set_timer)(uint64_t stime_value) = sbi_set_timer_v01;
-
 int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
                           size_t size)
 {
@@ -360,10 +378,9 @@ int __init sbi_init(void)
         }
 
         if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
-        {
-            sbi_set_timer = sbi_set_timer_v02;
-            dprintk(XENLOG_INFO, "SBI v0.2 TIME extension detected\n");
-        }
+            set_xen_timer = sbi_set_timer_v02;
+        else
+            set_xen_timer = sbi_set_timer_v01;
     }
     else
         panic("Ooops. SBI spec version 0.1 detected. Need to add support");
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index 698ab49d1292..8769709e5227 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -7,12 +7,21 @@
 #include <xen/time.h>
 #include <xen/types.h>
 
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
-#include <asm/sbi.h>
 
 unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
 uint64_t __ro_after_init boot_clock_cycles;
 
+static int cf_check sstc_set_xen_timer(uint64_t deadline)
+{
+    csr_write64(CSR_STIMECMP, deadline);
+
+    return 0;
+}
+
+int (* __ro_after_init set_xen_timer)(uint64_t deadline);
+
 s_time_t get_s_time(void)
 {
     uint64_t ticks = get_cycles() - boot_clock_cycles;
@@ -61,20 +70,7 @@ int reprogram_timer(s_time_t timeout)
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
@@ -91,4 +87,20 @@ void __init preinit_xen_time(void)
         panic("%s: ACPI isn't supported\n", __func__);
 
     boot_clock_cycles = get_cycles();
+
+    /* set_xen_timer must have been set by sbi_init() already */
+    ASSERT(set_xen_timer);
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc) )
+    {
+        set_xen_timer = sstc_set_xen_timer;
+
+        /*
+         * A VS-timer interrupt becomes pending whenever the value of
+         * (time + htimedelta) is greater than or equal to vstimecmp CSR.
+         * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
+         * ULONG_MAX.
+         */
+        csr_write64(CSR_STIMECMP, ULONG_MAX);
+    }
 }
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
index afd8a53a7387..d5a8dfcb2edb 100644
--- a/xen/arch/riscv/vtimer.c
+++ b/xen/arch/riscv/vtimer.c
@@ -4,6 +4,7 @@
 #include <xen/sched.h>
 #include <xen/timer.h>
 
+#include <asm/cpufeature.h>
 #include <asm/vtimer.h>
 
 static void vtimer_expired(void *data)
-- 
2.53.0


