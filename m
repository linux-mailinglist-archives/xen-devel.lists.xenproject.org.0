Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB529411A9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 14:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767694.1178395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlnh-0002Xf-9B; Tue, 30 Jul 2024 12:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767694.1178395; Tue, 30 Jul 2024 12:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlnh-0002Vg-52; Tue, 30 Jul 2024 12:17:57 +0000
Received: by outflank-mailman (input) for mailman id 767694;
 Tue, 30 Jul 2024 12:17:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jiA=O6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYlnf-0002To-I4
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 12:17:55 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bedecef6-4e6d-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 14:17:53 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52efa9500e0so5499060e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 05:17:53 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23132sm638852666b.27.2024.07.30.05.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 05:17:51 -0700 (PDT)
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
X-Inumbo-ID: bedecef6-4e6d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722341872; x=1722946672; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJt36nY/JnhLYtPKhz3iINvaXsKib9chEKF3Ew8HPvA=;
        b=gj0GMDPMefbsZzysTD1QrbCVH+QeJdW5xDniYaAskjwijuAdV9qSlmThoVawnPtkV0
         WTQzVAhJU0ey640icv8ea/KZxmpZ/DYZkK/gwb6jQgGfyUmvCG30X/ywILct3t2ohLN8
         AmBxNAeaYU0YccGQ/4UF71jBlvj2owSpKys3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722341872; x=1722946672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJt36nY/JnhLYtPKhz3iINvaXsKib9chEKF3Ew8HPvA=;
        b=OFxkoaBUhuqahRGM7/fsCVVjwfJXOL2yyrF4g0s2cLfjPSF17H8Rx3LnPyz/f5CQO9
         Y5rbDBSh4bcpwcUiVUO5qtiggQmE8ElHIkXMHvKICh4TOj7RmPwCXemOWTT3lA6lzPJ7
         5K8nr8tqmm0+Di5My9XBI0lmCnF6JhhZ9oU7ZukcJIEunXcYdS7IRHQrlRtTDZI7srfn
         Flvq4PKFtaeMVjEWn9dpkebd6m7ezmnxfCWpwgqWLA/Y3NWxpvAnMrlgo26FHq72GPXm
         J20zoFIDu3SnVtOG+9FerPLq4154aTLhU5YRDg/e+c7upOuhZR/Zh2xGbYrnyae5lThB
         383g==
X-Gm-Message-State: AOJu0YzmP0ZBJuWENwQNsBhBExhVPLNmd31SwHRN8jSgksEikuEShWAn
	PMv7xXjyoYd11OgdvXghqd3W6kJhgcNCABX5aojum1rYxuVERImAJHy/t13H3MYxd2A1YZ1tTBo
	n
X-Google-Smtp-Source: AGHT+IFc0u2RQD+LmaEGt1f8CY8IZectWqgNjeIMQbR+0lneeB4GEhs0HWO/e7J129/P5FGGoChtTg==
X-Received: by 2002:ac2:4f07:0:b0:52e:a60e:3a08 with SMTP id 2adb3069b0e04-5309b25aa12mr9326707e87.11.1722341872315;
        Tue, 30 Jul 2024 05:17:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/APIC: Drop APIC_BASE and use fix_to_virt()
Date: Tue, 30 Jul 2024 13:17:49 +0100
Message-Id: <20240730121749.637879-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now the apic_mem_*() helpers only compile because sizeof(void *) ==
sizeof(long long).  Switch to using fix_to_virt() which is a void *type.

Also adjust the two places where the APIC/IO-APIC virtual address is rendered
in a printk().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Split out of %L patch.
---
 xen/arch/x86/apic.c                |  4 ++--
 xen/arch/x86/include/asm/apic.h    | 10 +++++++---
 xen/arch/x86/include/asm/apicdef.h |  2 --
 xen/arch/x86/io_apic.c             |  4 ++--
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 6567af685a1b..7869c30e83f6 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -938,8 +938,8 @@ void __init init_apic_mappings(void)
         apic_phys = mp_lapic_addr;
 
     set_fixmap_nocache(FIX_APIC_BASE, apic_phys);
-    apic_printk(APIC_VERBOSE, "mapped APIC to %08Lx (%08lx)\n", APIC_BASE,
-                apic_phys);
+    apic_printk(APIC_VERBOSE, "mapped APIC to %p (%08lx)\n",
+                fix_to_virt(FIX_APIC_BASE), apic_phys);
 
 __next:
     /*
diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index a7798de02993..25faa54d9d10 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -51,12 +51,16 @@ const struct genapic *apic_x2apic_probe(void);
 
 static inline void apic_mem_write(unsigned int reg, uint32_t v)
 {
-	*((volatile u32 *)(APIC_BASE+reg)) = v;
+    volatile uint32_t *addr = fix_to_virt(FIX_APIC_BASE) + reg;
+
+    *addr = v;
 }
 
-static inline u32 apic_mem_read(unsigned int reg)
+static inline uint32_t apic_mem_read(unsigned int reg)
 {
-	return *((volatile u32 *)(APIC_BASE+reg));
+    volatile uint32_t *addr = fix_to_virt(FIX_APIC_BASE) + reg;
+
+    return *addr;
 }
 
 /* NOTE: in x2APIC mode, we should use apic_icr_write()/apic_icr_read() to
diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/apicdef.h
index b0790fad1cdb..49e29ec80156 100644
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -117,8 +117,6 @@
 /* Applicable to vectors, TPR, and PPR. */
 #define		APIC_PRIO_CLASS(v)	((v) & 0xF0)
 
-#define APIC_BASE __fix_to_virt(FIX_APIC_BASE)
-
 #define MAX_IO_APICS 128
 
 extern bool x2apic_enabled;
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 7744b43f2414..772700584639 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2596,8 +2596,8 @@ static void __init ioapic_init_mappings(void)
         }
 
         set_fixmap_nocache(idx, ioapic_phys);
-        apic_printk(APIC_VERBOSE, "mapped IOAPIC to %08Lx (%08lx)\n",
-                    __fix_to_virt(idx), ioapic_phys);
+        apic_printk(APIC_VERBOSE, "mapped IOAPIC to %p (%08lx)\n",
+                    fix_to_virt(idx), ioapic_phys);
 
         if ( bad_ioapic_register(i) )
         {
-- 
2.39.2


