Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0978CB2B0
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 19:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727007.1131407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9T5g-00051X-AE; Tue, 21 May 2024 17:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727007.1131407; Tue, 21 May 2024 17:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9T5g-0004zw-6X; Tue, 21 May 2024 17:15:56 +0000
Received: by outflank-mailman (input) for mailman id 727007;
 Tue, 21 May 2024 17:15:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryb1=MY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s9T5e-0004kx-Uh
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 17:15:54 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6cc0968-1795-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 19:15:52 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a5a5cb0e6b7so914803766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 10:15:52 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01a2esm1633701766b.185.2024.05.21.10.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 10:15:51 -0700 (PDT)
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
X-Inumbo-ID: c6cc0968-1795-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716311752; x=1716916552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5B2c9g1y7aKzjwGqZJNQwIvT3KveJvpY8WkxZZKikdI=;
        b=ntoYAngRptf6uQPSoPC5WUrVq1bnhlzt4WZpb5J9f2CykjF17levd1gENElY1PD6va
         ZWOCHkUhtJhJSo3y4sG2+JCqx7L9iPOR1Y8FRqeKp8qeAK4NozQJ/qZfUE+PDlZE9y4i
         +qQ/evlIngJtjucblxthV0IgI9SLQkYXHWTDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311752; x=1716916552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5B2c9g1y7aKzjwGqZJNQwIvT3KveJvpY8WkxZZKikdI=;
        b=d9ufg7LN2KrHB/Ia1flrUr7ZFaEe1QLksA3ppi2k+wzOHeJ+LkRrK+aRpZy0KcaiNX
         Y58i/0PkuZPbAsgslWrQVAZD35IzWDvPIlBB+9zycfnU7TsxOgDK8dCp1luLWs/3466D
         uyOzyMEQfC679X+64J4ylOAL2rRCRkPUcFdGQVx+MToFT4tLFRUC5Y4ya6be23chNHOP
         zpDFbIqqlP5hajoGTC/SDTklZDnkC9Qm2DwiBu+5SLYB8uQsJb/FjMd224EFFi/62tzG
         JjytInpabPFbayKGFhfAMrukAWmuCA7zwsBG7yTDnR6evXMnytHiWM63ZuZFOFeyBc9g
         YEHQ==
X-Gm-Message-State: AOJu0Yz2Wr5ajnkii1cCTpUEZqr6JSWLQ5OUQSEeHfPLwPHgswkXBW1d
	qa2xnEr8fxEBHWuTMFM4qKPrIMr82ytxSDbOjucnKpQ3v0fytyt0/AAOBxQ9wSiKkbC286U8a8H
	NjQc=
X-Google-Smtp-Source: AGHT+IGKBlnC4aUlAtSStcXUBX/m7c79FkGO43xaEXt+WhXGcyap3nd6jcMgUWmIeKjp87TzozmoFw==
X-Received: by 2002:a17:906:8315:b0:a59:a977:a154 with SMTP id a640c23a62f3a-a5a2d6786b5mr2132997566b.64.1716311751813;
        Tue, 21 May 2024 10:15:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/3] xen/x86: Drop useless non-Kconfig CONFIG_* variables
Date: Tue, 21 May 2024 18:15:45 +0100
Message-Id: <20240521171546.3650664-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
References: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are all either completely unused, or do nothing useful.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/x86/include/asm/config.h |  4 ----
 xen/include/xen/acpi.h            |  9 ---------
 xen/include/xen/watchdog.h        | 11 -----------
 3 files changed, 24 deletions(-)

diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index ab7288cb3682..24b005ba1ff7 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -20,7 +20,6 @@
 #define BITS_PER_XEN_ULONG BITS_PER_LONG
 
 #define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS 1
-#define CONFIG_DISCONTIGMEM 1
 #define CONFIG_NUMA_EMU 1
 
 #define CONFIG_PAGEALLOC_MAX_ORDER (2 * PAGETABLE_ORDER)
@@ -30,11 +29,8 @@
 /* Intel P4 currently has largest cache line (L2 line size is 128 bytes). */
 #define CONFIG_X86_L1_CACHE_SHIFT 7
 
-#define CONFIG_ACPI_SRAT 1
 #define CONFIG_ACPI_CSTATE 1
 
-#define CONFIG_WATCHDOG 1
-
 #define CONFIG_MULTIBOOT 1
 
 #define HZ 100
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index e78e7e785252..bc4818c9430a 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -140,15 +140,6 @@ int get_cpu_id(u32 acpi_id);
 unsigned int acpi_register_gsi (u32 gsi, int edge_level, int active_high_low);
 int acpi_gsi_to_irq (u32 gsi, unsigned int *irq);
 
-/*
- * This function undoes the effect of one call to acpi_register_gsi().
- * If this matches the last registration, any IRQ resources for gsi
- * are freed.
- */
-#ifdef CONFIG_ACPI_DEALLOCATE_IRQ
-void acpi_unregister_gsi (u32 gsi);
-#endif
-
 #ifdef	CONFIG_ACPI_CSTATE
 /*
  * max_cstate sets the highest legal C-state.
diff --git a/xen/include/xen/watchdog.h b/xen/include/xen/watchdog.h
index 86fde0884ae7..434fcbdd2b11 100644
--- a/xen/include/xen/watchdog.h
+++ b/xen/include/xen/watchdog.h
@@ -9,8 +9,6 @@
 
 #include <xen/types.h>
 
-#ifdef CONFIG_WATCHDOG
-
 /* Try to set up a watchdog. */
 int watchdog_setup(void);
 
@@ -23,13 +21,4 @@ void watchdog_disable(void);
 /* Is the watchdog currently enabled. */
 bool watchdog_enabled(void);
 
-#else
-
-#define watchdog_setup() ((void)0)
-#define watchdog_enable() ((void)0)
-#define watchdog_disable() ((void)0)
-#define watchdog_enabled() ((void)0)
-
-#endif
-
 #endif /* __XEN_WATCHDOG_H__ */
-- 
2.30.2


