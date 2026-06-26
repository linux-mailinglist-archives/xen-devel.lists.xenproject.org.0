Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MNV+KgefPmoFJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C655E6CEA07
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=S0MPT4Jk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346272.1604748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lY-0000vG-IT; Fri, 26 Jun 2026 15:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346272.1604748; Fri, 26 Jun 2026 15:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lY-0000to-E6; Fri, 26 Jun 2026 15:46:52 +0000
Received: by outflank-mailman (input) for mailman id 1346272;
 Fri, 26 Jun 2026 15:46:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lW-0000f0-I9
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lV-008hQp-VB
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:49 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ebb-2eae-0a2a0a5409dd-0a2a450a98aa-36
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:45 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ee4-e40e-0a2a450a0019-d155a732cd05-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:45 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5ad583dc41eso936682e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:44 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488804; x=1783093604; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1ntZTjXuPMc3S9pVqmhNEY95hHRXNFcsq1srHmQDd0=;
        b=S0MPT4Jk6uuwFXfsQc2fvbhV9+gfNJS0GFv0cb1VyNtiVBIZSw6gs2sTg9EUrBgh4O
         N9LIaFkz30GJe1NqSM7kbpcu7sN8PoYzlskYTSIrdQbUeaCvniTAoROZba1ujk7FBG8j
         04bzi2+WweoZHQco7dAZ+l/DArcETmcpUjRyXv4F9xgHWsukgOzFNxUbm6M9+2MxIsvM
         6ivt5U/QAP44vExlRYi0HbzvZ7sI29J9GC2sCxwAV//lIX0L3hsmD3ivUvV12g8UkS79
         oiSAQjnXy2FtZGsneuN6LkOHDgeTGiubd+fAkJRipucVSvVQAN96HdgbSAdBFwlED6tk
         +5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488804; x=1783093604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E1ntZTjXuPMc3S9pVqmhNEY95hHRXNFcsq1srHmQDd0=;
        b=IBjdb/cgPIreqfFF7KFYDYgYTOk5Aqcmed2zRvfULLtf/UR92hP98yf71ebDaJJ1jY
         FSivloE/y9qDXZqNg8wLlC+chy8SMafdr1/RXOq6ZkUNBCKwzhH28uYvN66ka4RjoZOY
         aksfQ7ovcq6G4XwuPgzNbSSIYcHUHUBU2DJUXz7G0HtO7GtAuBe0Arcr64qPlDna6M6a
         fySlTFIqSrV8fHxxA/Vrnje3Zpzn2F5TPgphXVLOf+laPX6GXaocrTl18bb8bevJrDER
         IR3w51GcAeJ4aTfG12Ql0Jmsa5R+Tvs1q8oSXpSjbB6jedbIk9ZWakaOTxi01H+D59EO
         g6jg==
X-Gm-Message-State: AOJu0Yzcqpb3+7WGm1sUDkF3rc+sGwkizTD7GZLHkfOEVIhtOVotOqYH
	ZPGC0i3Q9mRcUk3WdBp5659OQi88yC+w6JH2uUAonUp3Giwb9ht13hRLffMeGA==
X-Gm-Gg: AfdE7ckaXM7iR9U8GEdH7OR17jm/tN7WziUn86b+BI4GirSG63ly5DevvjRG/En608e
	AoM4NhTpn/d1aKfmuxjTWtfvj2eSoXPzG36MhiqbZ8lGkMcOt2TAVVkijGeFCUE43S/vxTKfLVP
	pOuy6IJETYn4C4GPr9bH26stMo5/jdZ/GWgA38xmcZxKthdd0eT4J4cf2oqLkklyGu5F37Z00Kj
	UvNP2LBVnRZgOjHNUj9l710fvgtMO/+ufKacTLrUUXHT6PhIz3POQrqQNxFVF1qEcH2APCNw5up
	q3H4C5nkLOzHaWaCPUdf/j00OpG93LrjaW/4kqC+RTT6djvT4pMRJ1/9lAugfRF2bVMnH0Q1QFY
	Df5eC2rxwGCUHviHXkf7BlsMKwv080HoY8snXzeLUU3pg1MnhcCOLwwc0iiaQ7I0gh/f/Hpj/23
	wxrzRwr2Jy0lkaGUybMm8xact3Rw/2aWTKvvkCwjl8frPpaKNFyS0C8vxxBQ==
X-Received: by 2002:a05:6512:1515:20b0:5aa:8824:156a with SMTP id 2adb3069b0e04-5aea1f57886mr1584108e87.46.1782488804127;
        Fri, 26 Jun 2026 08:46:44 -0700 (PDT)
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
Subject: [PATCH v4 01/25] xen/dom0less: turn max_init_domid into a common variable
Date: Fri, 26 Jun 2026 17:46:10 +0200
Message-ID: <2c60cbed167fda0f90ce3aa4324ea4c4b076c43d.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1782488805-D7139DDE-CB210E16/10/73395122804
X-purgate-type: spam
X-purgate-size: 5746
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,suse.com,raptorengineering.com,wdc.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C655E6CEA07

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
---
Regarding last paragraph it is also alternative option just make
dom0less-build.init.o no-init.
---
Changes in v4:
 - New patch.
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


