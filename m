Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UNb8HKnQS2obawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053D8712E9E
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WIOzPhMw;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355484.1610277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliB-0006fd-EF; Mon, 06 Jul 2026 15:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355484.1610277; Mon, 06 Jul 2026 15:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliB-0006dQ-AY; Mon, 06 Jul 2026 15:58:23 +0000
Received: by outflank-mailman (input) for mailman id 1355484;
 Mon, 06 Jul 2026 15:58:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgli9-0006UQ-HS
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgli8-00AcTL-RM
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd070-5cb7-0a2a0a5109dd-0a2a4508e958-40
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:20 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd09c-edec-0a2a45080019-d155dd31f13a-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:20 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-475881b9a4bso2780970f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:20 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:19 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783353500; x=1783958300; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkd0v8Xp/yZj78/ox1+RnfdTHP8Nmjo3Xh1oO+t56kw=;
        b=WIOzPhMw5ynVQbkmJm7fEDb29hMVDpigmlRBSyGdh2YsCLuXkAYFaRMyFHMe+HqfFF
         seSELFyBsPvdt1GqEBsaPSEj0O/6GqziQUS7d54JBUAwLriaxWHjDgJYjaq08zRtT86U
         RNPlaJAC4fSd2FrWWZ4u0MAIznlnFvuA5LhWa6mzLqnmy2Vd2Nt1dqfhatSz6lFnAeTf
         QaQw4mpKzzpL52uVMwIjXxdkLNZObbZhLxcykkT2IuCDdwWazQmSXCvYqgFCUCK7fALX
         sIRQFURA1XmBXfJqqcD2vYRNA9svvpPHQ/RhrVVQQr4Zc2uQhSXxz4zxFmPNGOD2s5sq
         NBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353500; x=1783958300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkd0v8Xp/yZj78/ox1+RnfdTHP8Nmjo3Xh1oO+t56kw=;
        b=mcp0FDtzZlJIiJmwfEFAngof5TJjqxxnpx0iCTZZi2fNs2GKb1DmC/1pcUDz3C6jBc
         dExRK8pXLo9rTXrvR9sFvK8lRaph+bwwdEp9vxSVUp+qqQjLmhNTjaHT27WFGAtYpruF
         q/QP0kKC0IYFrnLWjw4LTavqK1aLoSCv+tjhUrds67Q1h4IOyfGL9l7b67B3jbOGb5fF
         VLyrjleVNp5RWPs1uI/EhJFOnrDTk2/hiQIehMQQ3EugVbw/lcty0xVp4H1fSk1iP+LX
         uiDDS1C2L+kEKA27/t4HFZXcAuPzl5EOkxDMeKSIjdq3V1YQBEEyIMAOX3d1Kza6B0U4
         6AbA==
X-Gm-Message-State: AOJu0YyVEZ7uho/3wEgukzS7i9p2u+OUckd6AuHIbO5rnvjenkNV5vtz
	KlAm/Mwtgu+kti3bSyc6F2NLbtQ8sfpNb4Et/6rcLxWh3EOJWj68NPhgWrCKnQ==
X-Gm-Gg: AfdE7cnErzZvbchNPiage6n8qnVbwhCHJ0KCswf9bnmMgLVLjm5VZ3THnhFtnyf1Khj
	3RM6nm4DKL+wIXbXcrDbtAeE2wnBYog+LjgX4GD0isXVabRTInec6r2jn5yi0gcOfYEn8UtBJg2
	zXcMbPoVKTaOG24hOQ/Xw6LOQ46S/tD2Rqnuld2sxGMsGi0JWBM/9khU6kvgBvZ+8udUP6md7dJ
	o6fZ13N1Ozvg2d6Kz8kg5G2cQV+JmJsqDGeMcoTW8TrrvBrtOcTUG6IlR67cPWM2NaaXnb6S2lf
	40kHDFlI4j/bOQkJ32MU8r2VEXhSDRQJjaX9f46cPsrOxdcr9iu+66haruB1C9pnSu+te0RQb2a
	JsOgQrtzCR4GfqC1bsErTpIy56UiEf+vCbw3RiaXsuXUaM8FpVt9z1Fy6IXJGBPxnjW/FjI3SqI
	NzwrUYCuqUM+9JqNKjeQtdXlYv7by7EkiuxOuWXNa8rbTZEM8Xxm7oi9tA+7M2j3E8+9oL
X-Received: by 2002:a05:600c:530c:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-493df087129mr11946045e9.25.1783353499906;
        Mon, 06 Jul 2026 08:58:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 01/26] xen/dom0less: turn max_init_domid into a common variable
Date: Mon,  6 Jul 2026 17:57:42 +0200
Message-ID: <36325cfc8ad82a85d9039965222e278058a18a60.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1783353500-A2D3B3FC-209DFCE5/10/73395122804
X-purgate-type: spam
X-purgate-size: 5768
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,suse.com,raptorengineering.com,wdc.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 053D8712E9E

Until now every architecture carried its own notion of max_init_domid:
Arm defined a real variable (declared in asm/setup.h, defined in
setup.c), while ppc, riscv and x86 each provided a "#define
max_init_domid (0)" stub in their asm/setup.h. This duplicated the same
declaration across all arches and placed a purely dom0less concept in
arch setup headers.

Now that the dom0less build code lives in common (xen/common/
device-tree/dom0less-build.c sets max_init_domid, and the console
serial-input switcher reads it), there is no reason for the symbol to be
per-arch. Provide a single declaration in <xen/dom0less-build.h>, with
the !CONFIG_DOM0LESS_BOOT stub kept there as well, so there is one source
of truth and the arch headers no longer need to mention it. Update
console.c to include <xen/dom0less-build.h> for the declaration instead
of relying on asm/setup.h.

Place the definition in xen/common/domid.c rather than in dom0less-
build.c. The latter is built as dom0less-build.init.o, i.e. the whole
object is relocated into the .init.* sections and freed after boot,
whereas max_init_domid must outlive boot because it is read at runtime
by the console serial-input switcher. domid.c is always linked (obj-y)
and resides in regular (non-init) sections, so it is a correct home for
the variable. It is marked __ro_after_init since it is only updated
while creating boot-time domains and read-only afterwards, and guarded
by CONFIG_DOM0LESS_BOOT as domid.c itself is unconditional.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - New patch.
---
---
 xen/arch/arm/include/asm/setup.h   | 2 --
 xen/arch/arm/setup.c               | 2 --
 xen/arch/ppc/include/asm/setup.h   | 2 --
 xen/arch/riscv/include/asm/setup.h | 2 --
 xen/arch/x86/include/asm/setup.h   | 2 --
 xen/common/domid.c                 | 5 +++++
 xen/drivers/char/console.c         | 1 +
 xen/include/xen/dom0less-build.h   | 7 +++++++
 8 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 0d29b46ea52b..14fa92d5c1db 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -25,8 +25,6 @@ struct map_range_data
     struct rangeset *irq_ranges;
 };
 
-extern domid_t max_init_domid;
-
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 size_t estimate_efi_size(unsigned int mem_nr_banks);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6310a47d68b6..86532d0a35b6 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -62,8 +62,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
 bool __read_mostly acpi_disabled;
 #endif
 
-domid_t __read_mostly max_init_domid;
-
 static __used void noreturn init_done(void)
 {
     /* Must be done past setting system_state. */
diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
index e4f64879b68c..956fa6985adb 100644
--- a/xen/arch/ppc/include/asm/setup.h
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -1,6 +1,4 @@
 #ifndef __ASM_PPC_SETUP_H__
 #define __ASM_PPC_SETUP_H__
 
-#define max_init_domid (0)
-
 #endif /* __ASM_PPC_SETUP_H__ */
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 2215894cfbb1..73ce2f293348 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,8 +5,6 @@
 
 #include <xen/types.h>
 
-#define max_init_domid (0)
-
 void setup_mm(void);
 
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index b01e83a8ed9f..5925c5f39cff 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -68,6 +68,4 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
 
-#define max_init_domid (0)
-
 #endif
diff --git a/xen/common/domid.c b/xen/common/domid.c
index b0258e477c1a..cd46cf952be6 100644
--- a/xen/common/domid.c
+++ b/xen/common/domid.c
@@ -9,6 +9,11 @@
  */
 
 #include <xen/domain.h>
+#include <xen/dom0less-build.h>
+
+#ifdef CONFIG_DOM0LESS_BOOT
+domid_t __ro_after_init max_init_domid;
+#endif
 
 static DEFINE_SPINLOCK(domid_lock);
 static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index bcd6d261491b..4c09f4c7a984 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -31,6 +31,7 @@
 #include <xen/warning.h>
 #include <xen/pv_console.h>
 #include <asm/setup.h>
+#include <xen/dom0less-build.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
 
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-build.h
index 4118dec76c0a..8d4da16d1f0a 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -5,6 +5,8 @@
 
 #include <xen/stdbool.h>
 
+#include <public/xen.h>
+
 struct domain;
 
 #ifdef CONFIG_DOM0LESS_BOOT
@@ -13,6 +15,9 @@ struct boot_domain;
 struct dt_device_node;
 struct kernel_info;
 
+/* Highest domain ID assigned to a boot-time (dom0less) domain. */
+extern domid_t max_init_domid;
+
 /*
  * List of possible features for dom0less domUs
  *
@@ -72,6 +77,8 @@ static inline bool is_dom0less_mode(void)
 }
 static inline void set_xs_domain(struct domain *d) {}
 
+#define max_init_domid 0
+
 #endif /* CONFIG_DOM0LESS_BOOT */
 
 #endif /* __ASM_GENERIC_DOM0LESS_BUILD_H__ */
-- 
2.54.0


