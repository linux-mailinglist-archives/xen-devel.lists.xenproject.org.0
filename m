Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id B+umLHFRj2kMQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443DA138013
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231316.1536549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2j-00071A-IL; Fri, 13 Feb 2026 16:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231316.1536549; Fri, 13 Feb 2026 16:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2j-0006v6-Aa; Fri, 13 Feb 2026 16:29:21 +0000
Received: by outflank-mailman (input) for mailman id 1231316;
 Fri, 13 Feb 2026 16:29:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2h-0005Ws-EK
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:19 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 250672fc-08f9-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 17:29:18 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso9047375e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:18 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:17 -0800 (PST)
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
X-Inumbo-ID: 250672fc-08f9-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000158; x=1771604958; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtYixxVFRGricJNR3QGHatVLbdL2gCHohkRG/oMMero=;
        b=a9hrPUnYVSTpnjsjLOdKvuRFZD9HXiXb2CCe0xQaeZa4r7ZmNX1xF2TDtV0G7l02a8
         hPxzBcDf0OeZfbXXtgApM9i5EQ1XzYXJQBaX3Xs94x1FDKGkVvx3DZiOqIVmB9VzvgyC
         i18Nnb8STNMDv+PsWF0u1xVn6AYMbTdrL1Dt5p1HgHiQqPpVb8NUujhEVAH+uNLCUx+m
         0+OEsEBvFfRk3dLVSmxEZWosFeJy0Wd8vwOhb03B40LSDbRKRBelcmf74mpVXVhbFttI
         LNCP3vupLGsiM9R9UuHjcSNq/FOoVQ0m8zyGWZyMj7RSPRU1OqwsbcueQEdUbs2vHkZU
         Nkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000158; x=1771604958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtYixxVFRGricJNR3QGHatVLbdL2gCHohkRG/oMMero=;
        b=BWlBfC7d6Aqr2+4QyRdCNzjzeMH/4Bm1jxMnTEwdgAnbh2QcF+GIzFR53YfhHwMBUA
         9VP8BTouq8oP8ZBcEf7+YbEX3XmiX7HkKY0+H0gjguoZ+lTHibQfu0vgLyYNTPwaCtIm
         wJJLRWmgQzPbUIBqCJbX2GIgJyzjKiq3LMWVw+FIMnOGi/2Wzx7DMkZ2yKNV0Tb09shB
         IqcVnjdNicxSDYw+MyuiNh6x0P7AQAJJoDnzz2AMAkia5w2eWinYn0gfbW8gFDbpBRQP
         BtfP2Jyri/OGvkjVN6qgj7x5gEead/DbZA+qszuIRAyzdxWsp7SuTdLsvh/QdrPUGMJG
         qGRA==
X-Gm-Message-State: AOJu0YxLeWJOH5ABvPRdXiCbpWh59uNVNl34qdPbHIlnWYzJnhdP/4Cz
	6xNt67WBH0mtsJc6YGJM/GRjmnz/LetlPNhjoYfNcJR5qgAVytfr1YO4P27ywQia
X-Gm-Gg: AZuq6aLiZOiIQE2kKeIoCeWed3lRwosKKGFq3bwLtLymUF/+x3dtsRcIeftW2I1U/6Y
	nWybUpmMrlliKlFk+PuOgbkJG8LxHA0Ipi0mnUIISjivXvsnLsY6gwRq25ApsGSPZz3fAh1Odc2
	MX0c7zg4HD/mO2IbJGrDaoTSF1HygV44KMoJxgr6qwtQm0zMqglS2C3m7eACOTMdYo3ca/xef9L
	94jbjVFIvta5c4U6boXX7bKtGhKkPzs/Uun0pHqdFuZhUFqX/JJx22zmk+FNNQ4yK3I7ej4AINX
	ROxlbLpPnJ1LVVhkYigz/XuAactimFn6ni7lZCOBTTvMg5qF482S2Jgtngu10uiBySucv9Xq1g0
	px5SUBUAYDmK19wLot0eWYF70F67u8HIGdHAIXgBFxF6+Xfy0aIl18p4YhAGj/B++xDiLciN6C0
	+Qdp6OjapA4Q7wJAu+knOspWwms4WX5oVnMw07lf2/5Z+2z+CpPecuiJW1zPN3zfowFowtPvKg7
	rTv/dF3
X-Received: by 2002:a05:600c:1907:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-48373a79afbmr42485465e9.35.1771000157888;
        Fri, 13 Feb 2026 08:29:17 -0800 (PST)
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
Subject: [PATCH v4 07/16] xen/time: move ticks<->ns helpers to common code
Date: Fri, 13 Feb 2026 17:28:53 +0100
Message-ID: <360aa61f2a0d1a95268e431909d1f210733d7dc9.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 443DA138013
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
Changes in v4:
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
2.52.0


