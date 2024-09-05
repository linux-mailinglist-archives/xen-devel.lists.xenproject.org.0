Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0779B96D9D5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 15:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791095.1200894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smCCb-0002hZ-Ke; Thu, 05 Sep 2024 13:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791095.1200894; Thu, 05 Sep 2024 13:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smCCb-0002eL-Fp; Thu, 05 Sep 2024 13:07:09 +0000
Received: by outflank-mailman (input) for mailman id 791095;
 Thu, 05 Sep 2024 13:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smCCZ-00025l-S5
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 13:07:07 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0c39f3f-6b87-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 15:07:07 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a868b739cd9so107703966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 06:07:07 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a61fbb093sm136972766b.11.2024.09.05.06.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 06:07:04 -0700 (PDT)
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
X-Inumbo-ID: c0c39f3f-6b87-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725541626; x=1726146426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bn1ALFAeLpl/ODrwK3JYlSPQ79apDKK1tuhbixfgHM=;
        b=VE3+Xehoq3nOdbCcXcAQQUr3tRWLjWs3JLsZmVE9gOeTL3Wpo77kf1HbiBmdiRTWku
         7g0ASH+P2VDKCmKzX2pzrop0IrMAmTGhaa/Gbo9xLwEiylsqk6ShdFikVN4isb79i+p2
         prFb9PWkk38rMDSQwvAxsEXg3Uyd0Szpy6TDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541626; x=1726146426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bn1ALFAeLpl/ODrwK3JYlSPQ79apDKK1tuhbixfgHM=;
        b=WmKKmrook310+m65oPhUCKXcVNRScfrvp63W7HVJhG9Z4YetHYeCfHSwvf3Y7dkHHi
         Zhkqm2OPELYZUYEof4owO7gW3oeRft4gCY3kl6GiD0PvulsqcK/DQzm4qodcAgXKBJNA
         aBMIHIyNnmVAVNhFnqUbx2mtN1phvC2/eZTeZPcodH+bkbiHZmhxbXAaycw5Wkjl1Dkj
         cE14Y4J1RLbiYxCZrPuL97ylJ/lDLPbSQYL0nJ7xbrEDZA88FPwgs4wKCsopiNHTL4OG
         j6vekIyWLod4XnOIKbJpJLAAXXdJITlXxtku0oKaVgTNaLkBDq5c/HwB/UKODJBynOe9
         tsXg==
X-Gm-Message-State: AOJu0YwnhmpaE7JltpPqNmfHp7XHwZVnr7FiCAa2NFDC7qhrccixJmP4
	/0VXsWEQq6kc+YOl38XFH+XkX6OQDVDWzqQ3Y67iDNO1xVjXXvayxwI3eNmsIsrSK7X/HFJK/rt
	W
X-Google-Smtp-Source: AGHT+IHuISNz5DOuHF9CfOTBL56qMltKoJbmCKvWrK3lCJpPnCe6XUW/G1UOjkblDzAr10BVcicINQ==
X-Received: by 2002:a17:906:6a18:b0:a77:deb2:8b01 with SMTP id a640c23a62f3a-a897f789470mr2082786766b.1.1725541626076;
        Thu, 05 Sep 2024 06:07:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH 3/3] x86/trampoline: Collect other scattered trampoline symbols
Date: Thu,  5 Sep 2024 14:06:57 +0100
Message-Id: <20240905130657.4075906-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and document them too.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>

video.h, edd.h and e820.h also contain trampoline symbols, but they're pretty
well contained headers already.

kbd_shift_flags seems especially dubious.  It's a snapshot of the keyboard
state when Xen happened to pass through the trampoline, and surely cannot be
useful for dom0 in the slightest...
---
 xen/arch/x86/efi/efi-boot.h           |  3 ---
 xen/arch/x86/include/asm/processor.h  |  2 --
 xen/arch/x86/include/asm/setup.h      |  2 --
 xen/arch/x86/include/asm/trampoline.h | 22 ++++++++++++++++++++++
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 23e510c77e2e..833e343a475e 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -102,9 +102,6 @@ static void __init efi_arch_relocate_image(unsigned long delta)
     }
 }
 
-extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
-extern const s32 __trampoline_seg_start[], __trampoline_seg_stop[];
-
 static void __init relocate_trampoline(unsigned long phys)
 {
     const s32 *trampoline_ptr;
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index e71dbb8d3fbf..b8d8127e2dc3 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -97,8 +97,6 @@ extern void ctxt_switch_levelling(const struct vcpu *next);
 extern void (*ctxt_switch_masking)(const struct vcpu *next);
 
 extern bool opt_cpu_info;
-extern u32 trampoline_efer;
-extern u64 trampoline_misc_enable_off;
 
 /* Maximum width of physical addresses supported by the hardware. */
 extern unsigned int paddr_bits;
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index d75589178b91..4d88503fd2e6 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -40,8 +40,6 @@ int remove_xen_ranges(struct rangeset *r);
 
 int cf_check stub_selftest(void);
 
-extern uint8_t kbd_shift_flags;
-
 #ifdef NDEBUG
 # define highmem_start 0
 #else
diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
index cc3420ba3530..dc2c47946be4 100644
--- a/xen/arch/x86/include/asm/trampoline.h
+++ b/xen/arch/x86/include/asm/trampoline.h
@@ -49,6 +49,13 @@
 /* SAF-0-safe */
 extern char trampoline_start[], trampoline_end[];
 
+/*
+ * Relocations for the trampoline.  Generated by the bootsym_{seg,}rel()
+ * macros, and collected by the linker.
+ */
+extern const int32_t __trampoline_rel_start[], __trampoline_rel_stop[];
+extern const int32_t __trampoline_seg_start[], __trampoline_seg_stop[];
+
 /*
  * The physical address of trampoline_start[] in low memory.  It must be below
  * the 1M boundary (as the trampoline contains 16-bit code), and must be 4k
@@ -87,9 +94,24 @@ extern uint32_t trampoline_xen_phys_start;
 /* A semaphore to indicate signs-of-life at the start of the AP boot path. */
 extern uint8_t trampoline_cpu_started;
 
+/*
+ * Extra MSR_EFER settings when activating Long Mode.  EFER_NXE is necessary
+ * for APs to boot if the BSP found and activated support.
+ */
+extern uint32_t trampoline_efer;
+
+/*
+ * When nonzero, clear the specified bits in MSR_MISC_ENABLE.  This is
+ * necessary to clobber XD_DISABLE before trying to set MSR_EFER.NXE.
+ */
+extern uint64_t trampoline_misc_enable_off;
+
 /* Quirks about video mode-setting on S3 resume. */
 extern uint8_t video_flags;
 
+/* BIOS Int 16h, Fn 02h.  The keyboard shift status. */
+extern uint8_t kbd_shift_flags;
+
 /* Extended Display Identification Data, gathered from the BIOS. */
 extern uint16_t boot_edid_caps;
 extern uint8_t boot_edid_info[128];
-- 
2.39.2


