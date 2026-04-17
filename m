Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOuiBHng4WkKzgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 09:25:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307A417E2A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 09:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283976.1565942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDdZ9-0002Jg-0I; Fri, 17 Apr 2026 07:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283976.1565942; Fri, 17 Apr 2026 07:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDdZ8-0002HT-Tj; Fri, 17 Apr 2026 07:24:38 +0000
Received: by outflank-mailman (input) for mailman id 1283976;
 Fri, 17 Apr 2026 07:24:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDdZ7-0002HN-B5
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 07:24:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDdZ6-00GTA6-O0
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 09:24:36 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e1e02b-2eae-0a2a0a5409dd-0a2a4509a54c-38
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 09:24:36 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e1e034-2497-0a2a45090019-d1558036bdbf-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 09:24:36 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488b0046078so3128595e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 00:24:36 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb6e16b3sm14578345e9.0.2026.04.17.00.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 00:24:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776410676; x=1777015476; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g2D/0gDX5iLGL2+CnfFG8EhHTMrOO2S+Kr3prVGAwic=;
        b=EWegANMuLgHZV5O8e0zlpWF28wXmzK3/RaZvu0WiRsSBmjtokJO/OZrsjTb6uoG3YD
         ScjAfsCki45PD/8QPF6oVieEDn7zcEATGQWqkG7t00g9cWbk4roYUwMlR+E0BZOdafuC
         /p05OZxFnaYZVAM00TOrX+dKBYQ56hoKL7GFTJmef8Xf/SZNck+fEeFj8jg4CclovJbO
         A0B9xLqVdevWLHNyw2+5TZSztcSlNMNMFxDCrp3IGkvSSGnvW6VFuUtqEfHMs0EXlb1W
         E5wdcF/q/uavhUBHL+RE6HzAzOZTKZTPjuQSBd4Jnqy9HD7ynv8GqAS4iv1nWQlaLuSx
         UJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776410676; x=1777015476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2D/0gDX5iLGL2+CnfFG8EhHTMrOO2S+Kr3prVGAwic=;
        b=QVPWTxB3Uv7VjCkzXh5rXpqEVGuLhHHl4g+s27MhVF8wbLJFm47vZW7P8S2zab4WJO
         WHsbQZ2FaVdOvAy/CV3LGpaK6e66n2Guhuor24B3sh7DPWlXDNxNJ1Vwsy/D/gbqdchk
         EoCxHeZAf2+YaC8tq5mJAMt+HMZM/O0h6QGfYVPJXR3Ng9Xe90ta27k2g2U3XFT+6NJI
         w/8wpNVX+yHHglzFLrNGyAXI5ttP8DYyAsfZz3DYKlgfhJF+HpsDmsuqcNds+MZPnh9Q
         rfb/ZuNqR5FTxLk8iWOi1hxvXEH3MWK4PFE/1pp+pHHAmlavNe5CQr4TDfPTJiPYycWW
         CWrg==
X-Gm-Message-State: AOJu0YyFaTw+e7tq2VlJw7gcoZhR/WOwAJPmmX1n/BpAbJP5mQPVKUHO
	4AYO62bDOruOhjmZMJGnIXKNXcNwpcBMsy2yuKVXEzJ6NQkFOFMWZfF7JqYFNA==
X-Gm-Gg: AeBDiesbmvV7n8oblEVbdjg6dlOUten3U7ZH79tzSJdYbsk7H7n2ZPBZpAdtF3rBl6f
	hAVk+qJ5G4Aaori8BiQszfR7aj3aGT483TD51i3iNt9OzrKhImoVUU5Oiaq2ngckCGx1aB7YPNL
	RBH93EkTdwLfKlKWZe2zjQ7ujSjBzhJnEtDpBxE93c9sfoHUILUBIOZ4Q29szkjKhZOygE9ZKt9
	S1ecC6Y1uNi4LBvpEn68YjExrrLQBALe/2csGAU7o88LiW0Zs1qjfnBC/VvkF9WD+2P3AE6WkrY
	9XUAXUqrXy35Qn98ygBjelmnHzwoWYkA5E+r12Qxh6yAQcVt0OQhiX9WQMxhywJBL2l00f1DvTn
	SAjhS3PMXdvl7t/DBYK/sEd7mKhrrMnl6oOJIBzsSM7O01IjuLD+wZAfzQ1Zv6ywlIY+l6LFRiO
	uWwnl5GW3fLOrvaPfs+T4RwOEQ/enfCMH2kVxYeVdD7TnqhATF4dj0NU5C3pXMp/syyLrMLljxj
	T7whYj7g5kIX5M=
X-Received: by 2002:a05:600c:5246:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488fb750a1dmr22851325e9.11.1776410675594;
        Fri, 17 Apr 2026 00:24:35 -0700 (PDT)
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
Subject: [PATCH v4] xen/riscv: allow Xen to use SSTC while hiding it from guests
Date: Fri, 17 Apr 2026 09:24:26 +0200
Message-ID: <5285075f24cd2a2c5566b2a7724198d34aab51c5.1776354739.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1776410676-42B70A53-66B3954F/10/73395122804
X-purgate-type: spam
X-purgate-size: 13888
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9307A417E2A
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
 xen/arch/riscv/include/asm/csr.h            | 14 +++++++
 xen/arch/riscv/include/asm/riscv_encoding.h |  2 +
 xen/arch/riscv/include/asm/sbi.h            | 18 ---------
 xen/arch/riscv/include/asm/time.h           |  3 ++
 xen/arch/riscv/sbi.c                        | 29 +++++++++++---
 xen/arch/riscv/time.c                       | 42 +++++++++++++--------
 xen/arch/riscv/vtimer.c                     |  1 +
 9 files changed, 89 insertions(+), 39 deletions(-)

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
index 27d4b7942f6b..9dc5f8767508 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -32,6 +32,20 @@
                            : "memory" );                        \
 })
 
+#ifdef CONFIG_RISCV_32
+# define __csr_write32h(csr, val) csr_write(csr ## H, (val) >> 32)
+#else
+# define __csr_write32h(csr, val) ((void)(csr), (void)(val))
+#endif
+
+#define csr_write64(csr, val)   \
+({                              \
+    uint64_t _v = (val);        \
+                                \
+    csr_write(csr, _v);         \
+    __csr_write32h(csr, _v);    \
+})
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


