Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D80A4CEA6
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 23:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900653.1308497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpEXR-0002PV-Fb; Mon, 03 Mar 2025 22:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900653.1308497; Mon, 03 Mar 2025 22:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpEXR-0002NX-Cj; Mon, 03 Mar 2025 22:45:29 +0000
Received: by outflank-mailman (input) for mailman id 900653;
 Mon, 03 Mar 2025 22:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpEXQ-0002NR-70
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 22:45:28 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32bae9eb-f881-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 23:45:25 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-390fb1b987fso2854354f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 14:45:25 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b6cd8sm15525825f8f.44.2025.03.03.14.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 14:45:24 -0800 (PST)
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
X-Inumbo-ID: 32bae9eb-f881-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741041925; x=1741646725; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Op+2Z4J1fpmGQcVAqWM36slAs7UPYrH2z8fDdpQ0Gm8=;
        b=kr09kByNqqITJJi7xjF3kLHI1Dfs5nAvZvVcpaTxKIBNIyV+Re8KZ5jG2SnTQcGqsp
         lS0IIZZs1a3yiBMxfhKycGYFj9mcRsUGrwlmQOI8WEoBHAXFp4A9cD1DF/392zSqu/+C
         fSv72PYwyVbRICevMiJXC5a7PNpFzZ3dxMwhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741041925; x=1741646725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Op+2Z4J1fpmGQcVAqWM36slAs7UPYrH2z8fDdpQ0Gm8=;
        b=GgaSp+OKHIj4Dg6ByWGTamFL63B6gNLfZv6vUOtyPQb/K3PDoK2RNLTeCnQTb4agL0
         old4tWi9vybn9aEUC/owtitnx3cegtMuwj28pVMd8MNQ4HrPViwbgOlT/mijyjnO7ZYI
         8coas/4bKfIfWYKldG7I89gtgOj460nis9ReXtjAfNxT8Xznr9ABuh5DIYNNHeORAaKh
         rPEkvp0sAIh9BuqH03yakBZOwbzaj/BPxSCkHZydCBz3L6g3VuZ1p4xeuuX9ZUN82HMi
         g+znSJoqO9/SSOpdoNzz0L2b54UwkVw8wl+ZP3Upfwrc/dUtj9mi8XNBTIQD7B2zuXEU
         DXzg==
X-Gm-Message-State: AOJu0YxSeo14EvIdIntA1O8tb7rZ5u3aLJru6WwagiknKhrmJHgfmFvg
	B8adlE4YTupLxHHAgNuNIyzRFwZCINvAQLDp5uXXyQj52sYuPx8Cisx083++a7kH/tDWckNgc6Q
	L
X-Gm-Gg: ASbGncsXsScm8MgKhl02J5OeE6KowO9AmkRiIVCazIpXVVBuMmJ/7M6s0sqqz8klkCK
	yuE+Zlp6QgDUDparw8gMAlU+L202Hv+3eHMaqRHLRDTs7O6xSix91BKKzbcRjSpi5Ui5pJHA6om
	ahFp5ooTyw2s9lf49cvCVKYrJpUiQlt8ybGPfHtieNpf1Rmen6MMpDkof7L8KdfIztQEbROW+cW
	MxxFV9L7Y1sVnsCSUpIOVeHZQoZq/Pbc0kA+/6nj3zZUx4haiUOTKOHRPmOYGNSTjPwttN9vRlG
	GLPelmgZAEHz6HBlNRuX2xk5KrVYh8IWW6l1DhEUlqGMSIFEZ20k8PcWpTrap/EItLM1rBrD+If
	nowq8LMG3E4DplPjz2cIMP6dp
X-Google-Smtp-Source: AGHT+IHJhked+OhND9gqtrZcM2uUB/vulqlEWgYX4Qe+VeLqTn8yTIaqDEnwouZ1aR9UQnTxOaZqpA==
X-Received: by 2002:a05:6000:1845:b0:390:f4c7:ea20 with SMTP id ffacd0b85a97d-390f4c7ec27mr11379880f8f.24.1741041925006;
        Mon, 03 Mar 2025 14:45:25 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/trampoline: Rename entrypoints
Date: Mon,  3 Mar 2025 22:43:22 +0000
Message-Id: <20250303224322.2572611-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... to be more concise, and to match our other entrypoints into Xen.

In acpi_sleep_prepare(), calculate bootsym_phys() once, which GCC seems
unwilling to of it's own accord.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/power.c             |  9 ++++++---
 xen/arch/x86/boot/trampoline.S        |  5 ++---
 xen/arch/x86/boot/wakeup.S            | 10 +++++-----
 xen/arch/x86/include/asm/trampoline.h |  4 ++--
 xen/arch/x86/smpboot.c                |  2 +-
 5 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 08a7fc250800..e1b5c2827fc0 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -168,6 +168,7 @@ static void thaw_domains(void)
 static void acpi_sleep_prepare(u32 state)
 {
     void *wakeup_vector_va;
+    paddr_t entry_pa;
 
     if ( state != ACPI_STATE_S3 )
         return;
@@ -180,10 +181,12 @@ static void acpi_sleep_prepare(u32 state)
     wakeup_vector_va = fix_to_virt(FIX_ACPI_END) +
                        PAGE_OFFSET(acpi_sinfo.wakeup_vector);
 
+    entry_pa = bootsym_phys(entry_S3);
+
     if ( acpi_sinfo.vector_width == 32 )
-        *(uint32_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
+        *(uint32_t *)wakeup_vector_va = entry_pa;
     else
-        *(uint64_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
+        *(uint64_t *)wakeup_vector_va = entry_pa;
 
     clear_fixmap(FIX_ACPI_END);
 }
@@ -445,7 +448,7 @@ static void tboot_sleep(u8 sleep_state)
     g_tboot_shared->acpi_sinfo.wakeup_vector = acpi_sinfo.wakeup_vector;
     g_tboot_shared->acpi_sinfo.vector_width = acpi_sinfo.vector_width;
     g_tboot_shared->acpi_sinfo.kernel_s3_resume_vector =
-                                              bootsym_phys(wakeup_start);
+                                              bootsym_phys(entry_S3);
 
     switch ( sleep_state )
     {
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index 924bda37c1b7..a92e399fbe0e 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -42,10 +42,9 @@
  * do_boot_cpu() programs the Startup-IPI to point here.  Due to the SIPI
  * format, the relocated entrypoint must be 4k aligned.
  *
- * It is entered in Real Mode, with %cs = trampoline_realmode_entry >> 4 and
- * %ip = 0.
+ * It is entered in Real Mode, with %cs = entry_SIPI16 >> 4 and %ip = 0.
  */
-GLOBAL(trampoline_realmode_entry)
+GLOBAL(entry_SIPI16)
         mov     %cs,%ax
         mov     %ax,%ds
         movb    $0xA5,bootsym(trampoline_cpu_started)
diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index bbf9aa6040fa..654e97005ff4 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -7,18 +7,18 @@
         .equ    wakeup_stack, trampoline_start + PAGE_SIZE
         .local  wakeup_stack
 
-#define wakesym(sym) (sym - wakeup_start)
+#define wakesym(sym) (sym - entry_S3)
 
 /*
  * acpi_sleep_prepare() programs the S3 wakeup vector to point here.
  *
  * The ACPI spec says that we shall be entered in Real Mode with:
- *   %cs = wakeup_start >> 4
- *   %ip = wakeup_start & 0xf
+ *   %cs = entry_S3 >> 4
+ *   %ip = entry_S3 & 0xf
  *
- * As wakeup_start is 16-byte aligned, %ip is 0 in practice.
+ * As entry_S3 is 16-byte aligned, %ip is 0 in practice.
  */
-ENTRY(wakeup_start)
+ENTRY(entry_S3)
         cli
         cld
 
diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
index 0c508d0222d0..dc536efe1f3d 100644
--- a/xen/arch/x86/include/asm/trampoline.h
+++ b/xen/arch/x86/include/asm/trampoline.h
@@ -130,10 +130,10 @@ extern uint32_t trampoline_phys;
 #define bootsym(sym) (*((typeof(sym) *)__va(bootsym_phys(sym))))
 
 /* The INIT-SIPI-SIPI entrypoint.  16-bit code. */
-void nocall trampoline_realmode_entry(void);
+void nocall entry_SIPI16(void);
 
 /* The S3 wakeup vector.  16-bit code. */
-void nocall wakeup_start(void);
+void nocall entry_S3(void);
 
 /*
  * A variable in the trampoline, containing Xen's physical address.  Amongst
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 891a29fca146..65a0c6b5d05b 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -571,7 +571,7 @@ static int do_boot_cpu(int apicid, int cpu)
 
     booting_cpu = cpu;
 
-    start_eip = bootsym_phys(trampoline_realmode_entry);
+    start_eip = bootsym_phys(entry_SIPI16);
 
     /* start_eip needs be page aligned, and below the 1M boundary. */
     if ( start_eip & ~0xff000 )

base-commit: e95dc03717b8ae00de2a0b41b88905af6170b210
-- 
2.39.5


