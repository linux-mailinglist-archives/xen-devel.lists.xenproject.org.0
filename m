Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNkCJvgQimnXGQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DE6112B44
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225791.1532429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVF-0000oL-Rq; Mon, 09 Feb 2026 16:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225791.1532429; Mon, 09 Feb 2026 16:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVF-0000ki-Go; Mon, 09 Feb 2026 16:52:49 +0000
Received: by outflank-mailman (input) for mailman id 1225791;
 Mon, 09 Feb 2026 16:52:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVD-0007Zd-NA
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:47 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2443fb1-05d7-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:52:46 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so626648566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:46 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:45 -0800 (PST)
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
X-Inumbo-ID: c2443fb1-05d7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655965; x=1771260765; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rogtIGkdjsiYuHIg+cB4eDpb8GAwkYYPz5C7nze5IWY=;
        b=Z/MCfMErKNZxhDZA1lKjhPNZsFYniq/YhHahD0zI5qnH/nwVER4+/pJm/XN8Mo1UGd
         ixA3Vx7JJPQXymj2aUTzEYJr+sH23RzIeJXRkHM5//27kLf6z6IA4VSz3EwiWRlZfBFY
         Zpoe372MGc8NVnjre9RemZ4Hw3NPqQT2cj+vnT+o2tZ3WxaL6v5/sB+mJAqVqvbDDuij
         coiiqZigAGbD3T5uXQuJAiLm2BdzIsErMdPXTir2te+mrRRYMn0re0/HGzp0BhoqfP4T
         P6IJwbfVcWXSqbDf0z40r+oNZCHtDr1t9rBTtlZxA7zhff3ObKP3kie2pV3T0KdiqDDj
         4sHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655965; x=1771260765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rogtIGkdjsiYuHIg+cB4eDpb8GAwkYYPz5C7nze5IWY=;
        b=cU7QNVXpcC6caKbTsCHYWupMJyR8mzm3LYLYB7KtmQu/5AXE0m+7B4z7MkjdxnggpW
         /ttpweImYOq/2Whv+2BA6V5ji/nV0DlOxdL5r8gqDl3d7AxnjRIXY63A7/TkPv8r3p1N
         1P17wcF52pdwoAMtORrEbm/FJbmMXWwZgusg64LBNfFS73KS5VLXEssljjJwoflEc3CP
         twgz+lA/k9clG5SqcxssoE4cIk6QyjscQ8HMcLnQ36HAWZlcIcnzK5/xBBdrkPpW7/Ij
         wLiFkn4FgdN/14EypmQ4sPw+ysCwoXSMVeKT8n1/GDANbYXdd/gvEkVwoj+6eLdELQfG
         Aeyg==
X-Gm-Message-State: AOJu0Yz0zP8n9RrjSfXhVy4et2ZXTCAEOYY4EPt6ZGSURmgIf9FoWJBT
	N+qn1MN5wQ2G16vcCZFWIk+vnyFiBt4o9QK6o0936Deyy8kp8Cl/JMBQqBPK+Hmq
X-Gm-Gg: AZuq6aJB9N9XtBpdK1zm9Y9dwx00tACIqvmyaHBYkuxl3M9GiIPE/nS65qiHhDWhKVM
	EOzA9L20D1eA2ue/iZW5XeLMjai1f5fy2RbyBNAvi0lo3njsp7GDncIWvFo7P8nDQ/DxxDypjpw
	rq4QE5FnE0uuOJwMS7yRyhzvMa0h+p9PS4cgxJTVKv1WBI8/XPmFBfRwpk0iRRmymGKpTz27qx0
	uRvsyzfsa4Ky5rXgdDctvdLnxUs2r9JVHL0cCKNps0K7JWMbhhxEEPR3RtXqfYzs9jZr7CI4R3J
	d0z74a9GQ0nnLkbpcuNR0BFVlaW3pMmb7ZjeXIHxXeyNtsTRYy066YRAw7XgV9Q8QqJ2XDT5cgs
	0+YeopvF2F4WCqcyT3gBusMgfI7FwHUE1/l6j8WiC7DEMmeMOVz9Uexco1DTdJ7bg/UJyszAiF9
	OuBPd+kqyRKmRKJm/36EDmAqS7Y2U7aPJrK0/JqHo4fbabme1OLn/lYOIIk86KwPK3
X-Received: by 2002:a17:907:849:b0:b87:720c:f182 with SMTP id a640c23a62f3a-b8edf173b94mr602939866b.9.1770655965308;
        Mon, 09 Feb 2026 08:52:45 -0800 (PST)
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
Subject: [PATCH v3 07/16] xen/time: move ticks<->ns helpers to common code
Date: Mon,  9 Feb 2026 17:52:20 +0100
Message-ID: <5c9644065978daa7d227713b2e2f83ee39b18a64.1770650552.git.oleksii.kurochko@gmail.com>
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
X-Rspamd-Queue-Id: 45DE6112B44
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


