Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDjZCp2JmGlwJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB0169438
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237337.1539727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTDz-0001QS-BG; Fri, 20 Feb 2026 16:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237337.1539727; Fri, 20 Feb 2026 16:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTDz-0001M4-4b; Fri, 20 Feb 2026 16:19:27 +0000
Received: by outflank-mailman (input) for mailman id 1237337;
 Fri, 20 Feb 2026 16:19:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTDx-0000QF-C1
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:25 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb99eeb8-0e77-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 17:19:24 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43626796202so2065397f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:24 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:23 -0800 (PST)
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
X-Inumbo-ID: eb99eeb8-0e77-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604363; x=1772209163; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8rDhEwL+Si1TVzLRrIFs43T5seQJmCokC0zj36jVKw=;
        b=Mltsu189idcgA+MU02SEnGj3vyjtiWKRvclUcij6eoSzIwMucd0oORU1UHNGSjCFnV
         V6x/O0eNZ59jw4GOIz3Es3tXsJejF+78WzwGZ7qaSw468uVeFeYrEerCaLtWsAy127pA
         B1WGFGQECanCs01n5luu+HpbHzpKHwAyi079P6BzWH9GDpPMY8r3AdNoAsdWpNTBEYaF
         ppaje8orhrOvgGWl+ZCbL38g/8OJzzPMHGsFJvORjfWYiP3NNa3l+cOJxCdO4OzkI7DK
         qMz8Mjh8OAUubUObV2rVmrtYcF9vCyxTUy38c930o5zLCbRGYxpg+Ti0B0dohyey3MnT
         z9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604363; x=1772209163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h8rDhEwL+Si1TVzLRrIFs43T5seQJmCokC0zj36jVKw=;
        b=b7fcRwNRR+pxGhaVqPlax3e+rzavO9yD4oq970JrwTnnhzHo0YuNJVklxy8RvYt68t
         yS3UepytCWF8uyVnz9Qrg1mi7XJl5NuuyZBzm0gj7Piv0RzuFO/rSLhCMlXUEiH8TSeN
         rqLZK0Jp0RulrwAzONA62A3CE92VzFO5hUO+1rmDeu2QMTCYlXHCvmOpHbFWTy0Lus5B
         DkAfl0gmmkactOx8p9oAGn5oLJFBG034LjA8iXG4jPSBq7ndewAB2P4v2VWNaNoGFzgy
         /5ipYKIpqc0k6lx4L0tK613TC93UPSOuNX0EM+q0MkYHmljmmHQdoctjyDv4MSCaGKA4
         Bd9Q==
X-Gm-Message-State: AOJu0YwigyabrzhwfbLnOdwSSQ4i0xcXmGZbWqPyNB5Enw9ejkovXUOs
	2UmTA/aIu7ZBahRcvKplUQY44YzWag7bN5uQdbzKUULpeP2E6g3Rzi6XcMf96w==
X-Gm-Gg: AZuq6aLUefhGKddeaHsjadW6KuJYdrfasjaIywX6HH79VfIghI50T1E+KE4ibNCS3Ch
	a1MA9aN1FCZ6bkYw6BToGwk2CnA8wRWJI1WbYgPHf++ytM6tq26gHd2BEF93el1ReEVnBMx6v+s
	xDI+irNvMksIA/ua0tOt3DenK88HuovPzbpTKMIjwhjS/j4Emx/bCL4+mnO1sAJnIVXvdWHFwZ3
	1f3kd1zidyg/atoT/eHgIuVLjZRrHkIeXP2ZnmwbiLlk6Atzw63zu11zIK0VDGXUyaXJ94Wks/v
	QxzNWrAlGl5+q4dJ7RuJD/Tyi46ARS0AA84/Rn6JOzzo7CSJ2rd+UyDDKti6ZaBkLAHMJqfd/zm
	GCrejBBRlGf0euoZ14GSEI1hoL4h8NC41QcBUAwSrKj4pM94uDFB+S0axNJzupjufJkSDPp6oY6
	Vz03z7YlZ5OKLOgTttLmkSuEDkEumDsElrHtn/UXEc91wjk1OKkulPj3rNf8eP4y3hwGninw==
X-Received: by 2002:a05:6000:40dc:b0:437:7268:8e1e with SMTP id ffacd0b85a97d-4396f181294mr829953f8f.51.1771604363451;
        Fri, 20 Feb 2026 08:19:23 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 05/14] xen/time: move ticks<->ns helpers to common code
Date: Fri, 20 Feb 2026 17:19:00 +0100
Message-ID: <83299215f631fced495d25d0b11ea5449cf9d6d1.1771590794.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1771590794.git.oleksii.kurochko@gmail.com>
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: D1AB0169438
X-Rspamd-Action: no action

ticks_to_ns() and ns_to_ticks() are not architecture-specific, so provide a
common implementation that is more resilient to overflow than the historical
Arm version. This is not a practical issue for Arm, as the latest ARM ARM
that timer frequency should be fixed at 1 GHz and older platforms used much
lower rates, which is shy of 32-bit overflow. As the helpers are declared
as static inline, they should not affect x86, which does not use them.

On Arm, these helpers were historically implemented as out-of-line functions
because the counter frequency was originally defined as static and unavailable
to headers [1]. Later changes [2] removed this restriction, but the helpers
remained unchanged. Now they can be implemented as static inline without any
issues.

Centralising the helpers avoids duplication and removes subtle differences
between architectures while keeping the implementation simple.

Drop redundant <asm/time.h> includes where <xen/time.h> already pulls it in.

No functional change is intended.

[1] ddee56dc2994 arm: driver for the generic timer for ARMv7
[2] 096578b4e489 xen: move XEN_SYSCTL_physinfo, XEN_SYSCTL_numainfo and
                      XEN_SYSCTL_topologyinfo to common code

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-v5:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Move ns_to_ticks() and ticks_to_ns() to common code.
---
 xen/arch/arm/include/asm/time.h   |  3 ---
 xen/arch/arm/time.c               | 11 -----------
 xen/arch/arm/vtimer.c             |  2 +-
 xen/arch/riscv/include/asm/time.h |  5 -----
 xen/arch/riscv/time.c             |  1 +
 xen/include/xen/time.h            | 11 +++++++++++
 6 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
index 49ad8c1a6d47..c194dbb9f52d 100644
--- a/xen/arch/arm/include/asm/time.h
+++ b/xen/arch/arm/include/asm/time.h
@@ -101,9 +101,6 @@ extern void init_timer_interrupt(void);
 /* Counter value at boot time */
 extern uint64_t boot_count;
 
-extern s_time_t ticks_to_ns(uint64_t ticks);
-extern uint64_t ns_to_ticks(s_time_t ns);
-
 void preinit_xen_time(void);
 
 void force_update_vcpu_system_time(struct vcpu *v);
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index cc3fcf47b66a..a12912a106a0 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -27,7 +27,6 @@
 #include <asm/cpufeature.h>
 #include <asm/platform.h>
 #include <asm/system.h>
-#include <asm/time.h>
 #include <asm/vgic.h>
 
 uint64_t __read_mostly boot_count;
@@ -47,16 +46,6 @@ unsigned int timer_get_irq(enum timer_ppi ppi)
     return timer_irq[ppi];
 }
 
-/*static inline*/ s_time_t ticks_to_ns(uint64_t ticks)
-{
-    return muldiv64(ticks, SECONDS(1), 1000 * cpu_khz);
-}
-
-/*static inline*/ uint64_t ns_to_ticks(s_time_t ns)
-{
-    return muldiv64(ns, 1000 * cpu_khz, SECONDS(1));
-}
-
 static __initdata struct dt_device_node *timer;
 
 #ifdef CONFIG_ACPI
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index d2124b175521..2e85ff2b6e62 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -12,13 +12,13 @@
 #include <xen/lib.h>
 #include <xen/perfc.h>
 #include <xen/sched.h>
+#include <xen/time.h>
 #include <xen/timer.h>
 
 #include <asm/cpregs.h>
 #include <asm/div64.h>
 #include <asm/irq.h>
 #include <asm/regs.h>
-#include <asm/time.h>
 #include <asm/vgic.h>
 #include <asm/vreg.h>
 #include <asm/vtimer.h>
diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index 1e7801e2ea0e..be3875b9984e 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -24,11 +24,6 @@ static inline cycles_t get_cycles(void)
     return csr_read(CSR_TIME);
 }
 
-static inline s_time_t ticks_to_ns(uint64_t ticks)
-{
-    return muldiv64(ticks, MILLISECS(1), cpu_khz);
-}
-
 void preinit_xen_time(void);
 
 #endif /* ASM__RISCV__TIME_H */
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index e962f8518d78..2c7af0a5d63b 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -4,6 +4,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/sections.h>
+#include <xen/time.h>
 #include <xen/types.h>
 
 unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
index fe0d7a578a99..2185dd26a439 100644
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -8,6 +8,7 @@
 #ifndef __XEN_TIME_H__
 #define __XEN_TIME_H__
 
+#include <xen/muldiv64.h>
 #include <xen/types.h>
 #include <public/xen.h>
 
@@ -75,6 +76,16 @@ extern void send_timer_event(struct vcpu *v);
 
 void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds);
 
+static inline s_time_t ticks_to_ns(uint64_t ticks)
+{
+    return muldiv64(ticks, MILLISECS(1), cpu_khz);
+}
+
+static inline uint64_t ns_to_ticks(s_time_t ns)
+{
+    return muldiv64(ns, cpu_khz, MILLISECS(1));
+}
+
 #include <asm/time.h>
 
 #endif /* __XEN_TIME_H__ */
-- 
2.53.0


