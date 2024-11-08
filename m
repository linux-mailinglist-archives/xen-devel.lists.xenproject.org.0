Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0889C25FA
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832781.1248145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7z-0002IO-4m; Fri, 08 Nov 2024 19:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832781.1248145; Fri, 08 Nov 2024 19:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7y-0002AJ-Ta; Fri, 08 Nov 2024 19:58:42 +0000
Received: by outflank-mailman (input) for mailman id 832781;
 Fri, 08 Nov 2024 19:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9V7x-0008TY-Kt
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:58:41 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d778e7c9-9e0b-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 20:58:37 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so347762166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 11:58:37 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5db6sm271523466b.119.2024.11.08.11.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 11:58:34 -0800 (PST)
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
X-Inumbo-ID: d778e7c9-9e0b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ3NzhlN2M5LTllMGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDk1OTE3LjAyODE1Niwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731095916; x=1731700716; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUt6z7qotJTk+Jtsld6eOnMm4y4nkKlOfdMmgeqNQZs=;
        b=Xi2dX2gZJ1GAsaWPr8BLEA0xQkvRjtKRXZlhoVTTGzoiMCvfpePGJ8/WcPvAsC7dzo
         q0y9OEk8gasGS9a+2P+hnWJG4wrxwxNHQKr8DD61OmtsdJ2T0ZH+X/8lpy2qYWRb9P+N
         AYpis9D7Vr/HrpSWsdOMU0Zl5JC1zyT1FUfg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095916; x=1731700716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUt6z7qotJTk+Jtsld6eOnMm4y4nkKlOfdMmgeqNQZs=;
        b=D9AjKbq364Y4rKuyjLn/xbuyI+ro6pW413q4DeUm1a8B3cwtVkrp0XF2Yb4GZCS7Vs
         S0g9DHlMxwrDyrANuJ2GUOu1R59DI6VlnImninsqX5a9HsAiWHpPrDTwgF3A1vpV81HD
         7qUG+eff982esReUcLLCASDddye7r23QxcQHMVNWWtaVX7Mje84Nv8wJmEuElHaQAqhU
         5ko5PvjHRy2v+CxuXO1b+ogWS7YXLp28El3Eb8uBBKRJrlGZ50XS1QXPyarL4kp+DP6K
         abRGuBPPYh5CFxjrnFd/1o/VdiGsXTNXsUrcO03SFgUzfS/5TDydFBE2t1TUw5JVK35o
         9bcg==
X-Gm-Message-State: AOJu0Yym8ds47TbGUJT0RnhlyPGAGf7BSWZMYDgGqqmI/ibmJAAzOFFz
	hD1ZesImncxSxSgJHToQII+6NUf9P1pIYlgUTUN8sdF+g6ZzV7EZCoZ/pGyw0LO0BG/YSY2ixG/
	4
X-Google-Smtp-Source: AGHT+IHcM9/g6UuN1NPBnHBdf2XO8eZElhhw83hxBGhwOm+YwzANwjNhHUrnnEvFQvs3nJMuqWdMug==
X-Received: by 2002:a17:907:9288:b0:a9a:10c9:f4b8 with SMTP id a640c23a62f3a-a9ef0040b8amr345801966b.61.1731095915662;
        Fri, 08 Nov 2024 11:58:35 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 08/10] x86/mach-apic: Drop set_apicid()
Date: Fri,  8 Nov 2024 19:58:18 +0000
Message-Id: <20241108195820.789716-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108195820.789716-1-andrew.cooper3@citrix.com>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's an unnecessary wrapper, and longer than the operation it wraps.

It's also the only reason that mpparse.c includes mach_apic.h, other than for
transitive dependencies.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/mach-generic/mach_apic.h | 11 -----------
 xen/arch/x86/io_apic.c                            |  4 ++--
 xen/arch/x86/mpparse.c                            |  7 ++++---
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/include/asm/mach-generic/mach_apic.h b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
index 7940c0234cb9..b4a2f0a0b068 100644
--- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
+++ b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
@@ -39,15 +39,4 @@ static inline int multi_timer_check(int apic, int irq)
 	return 0;
 }
 
-/*
- * The following functions based around phys_cpu_present_map are disabled in
- * some i386 Linux subarchitectures, and in x86_64 'cluster' genapic mode. I'm
- * really not sure why, since all local APICs should have distinct physical
- * IDs, and we need to know what they are.
- */
-static inline void set_apicid(int phys_apicid, physid_mask_t *map)
-{
-	physid_set(phys_apicid, *map);
-}
-
 #endif /* __ASM_MACH_APIC_H */
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 5a4d8597e07a..2774cd45c091 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1537,7 +1537,7 @@ static void __init setup_ioapic_ids_from_mpc(void)
                         "phys_id_present_map\n",
                         mp_ioapics[apic].mpc_apicid);
         }
-        set_apicid(mp_ioapics[apic].mpc_apicid, &phys_id_present_map);
+        physid_set(mp_ioapics[apic].mpc_apicid, phys_id_present_map);
 
         /*
          * We need to adjust the IRQ routing table
@@ -2270,7 +2270,7 @@ int __init io_apic_get_unique_id (int ioapic, int apic_id)
         apic_id = i;
     } 
 
-    set_apicid(apic_id, &apic_id_map);
+    physid_set(apic_id, apic_id_map);
 
     if (reg_00.bits.ID != apic_id) {
         reg_00.bits.ID = apic_id;
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index e13b83bbe9dd..b16c105b18bf 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -20,8 +20,10 @@
 #include <xen/delay.h>
 #include <xen/efi.h>
 #include <xen/sched.h>
-
 #include <xen/bitops.h>
+
+#include <asm/apic.h>
+#include <asm/genapic.h>
 #include <asm/smp.h>
 #include <asm/acpi.h>
 #include <asm/mtrr.h>
@@ -29,7 +31,6 @@
 #include <asm/io_apic.h>
 #include <asm/setup.h>
 
-#include <mach_apic.h>
 #include <bios_ebda.h>
 
 /* Have we found an MP table */
@@ -161,7 +162,7 @@ static int MP_processor_info_x(struct mpc_config_processor *m,
 	}
 	apic_version[apicid] = ver;
 
-	set_apicid(apicid, &phys_cpu_present_map);
+	physid_set(apicid, phys_cpu_present_map);
 
 	if (num_processors >= nr_cpu_ids) {
 		printk_once(XENLOG_WARNING
-- 
2.39.5


