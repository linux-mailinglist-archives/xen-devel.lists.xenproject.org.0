Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09A3B076EE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 15:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045186.1415290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2Bo-0008I5-PK; Wed, 16 Jul 2025 13:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045186.1415290; Wed, 16 Jul 2025 13:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2Bo-0008Bd-Km; Wed, 16 Jul 2025 13:28:52 +0000
Received: by outflank-mailman (input) for mailman id 1045186;
 Wed, 16 Jul 2025 13:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc2Bn-00089u-06
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 13:28:51 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce0b7ed5-6248-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 15:28:48 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45611a517a4so3635435e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 06:28:48 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e8075d6sm21076205e9.16.2025.07.16.06.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 06:28:46 -0700 (PDT)
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
X-Inumbo-ID: ce0b7ed5-6248-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752672527; x=1753277327; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SWevODLJ+fzb/9Yq/i9XlQJEacJCg7yiAeXrmzA9pg=;
        b=i0JgtxVjvk4aPA13oQFVLXeKM115eM6RwXj6xQSdjWKXF79wAV93XuTm23jISY5w+M
         XV85zDwiCY4diYjsiKRsW4k7KN5HVJ5iwV/PIs1bEw/Tz7m0ESWtDjV4d3PX4LfZkigM
         /z63awnPjp2lUN0cyHPUym+9yd/fwJTf23cl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672527; x=1753277327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SWevODLJ+fzb/9Yq/i9XlQJEacJCg7yiAeXrmzA9pg=;
        b=e8m0uy1ovDgt36s7AL5WlH9lMe1tLPnWV+XTcIzp9bYmTuQAjyJ2qpnDErSR+s2ITW
         l3T9hfw/Yr6J3OBkTdoFa5+PkmQnz7S38qNtUPjE7jyVuoRzhabNZb76zf6Dha83ju8h
         mO1cu7UiKspz64zgMkL12YOTsMpDGu09ox1T6yqNjWc+FTFAT9r0UsgVc6YNj10SNBpO
         puO1PMTOIgiWqoGDBZXU+QGtCh5uLCPQQNvoJd3eEUlFk27y6c1HzYQ3ckBIU8iV8caH
         Tp+Bc8mEIW6RUIab1Aru132vqDMlhgrCQkd2EPrVvQmGgwVKDLGN4gW1pvpE9q2wj1c5
         KS3g==
X-Gm-Message-State: AOJu0YyD0xSnMBd6Z8bZmbRJtZrhklSjWcxpSdAKEA2r+goxFN+0TTc3
	6dYoj7aer1j/W1tV3Ivn6SZxIYDhKAQwB1nZW8wzLBe3oehzAgIu3TRMD1avoqNlL/F3J8kQahW
	BQDKwD1Hk0w==
X-Gm-Gg: ASbGncvjuNEKkuzGKSLbhcqm6HPpFjtJQdgUjTScFiFWKQbXtjs6gR7BO7fQ1BCz+QW
	AjTis6D6OH9qeKN41k+5M52+1JlLF7gBMKnZuvEpsVGZ0vdmTusyzaYSlMtJGiHH1f2BsfLJYXP
	39acPIe5GOfyX3f7XNCZthOtdZ/CUERNvchA5Ert7sOyIFfE+nVla5oP5J6GHXNO0kdKZprkb5Z
	KU1vNBEmGmdKW8Oyj7/FL4YcVQQMOEoxuOr5kbV364EFnHyn03OwjYE4c/OnakAXEBdMNU10eoj
	nlUPrtSyfKZ44Pzy+3pry+g55kCO/uYqOCnWEIcJF2rgo8G6x/lEc5/jpmioSgcv3uGqlDJLwrw
	iU15NLgkH06eWSR8d3y+ywppPuKU4e6Vy0/mBJFvC7R+052/qXMLATeA4C4nmLM7xxlkRc3/0M/
	t8
X-Google-Smtp-Source: AGHT+IE3Dt4YAJolKJXGzyfi60Daf1oX8xk8HsNUDT08cP57clDp+yUC+lxTZR5FLAZnMCcDbNrfDQ==
X-Received: by 2002:a05:600c:4f91:b0:456:2139:456a with SMTP id 5b1f17b1804b1-4562dccd11fmr29861445e9.15.1752672527464;
        Wed, 16 Jul 2025 06:28:47 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86: Rearrange struct cpuinfo_x86 to introduce a vfm field
Date: Wed, 16 Jul 2025 14:28:41 +0100
Message-Id: <20250716132843.2086965-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
References: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Intel have run out of model space in Family 6 and will start using Family 19
starting with Diamond Rapids.  Xen, like Linux, has model checking logic which
will malfunction owing to bad assumptions about the family field.

Reorder the family, vendor and model fields so they can be accessed together
as a single vfm field.

As we're cleaning up the logic, take the opportunity to introduce better
names, dropping the x86 prefix.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/cpufeature.h | 28 +++++++++++++++++++++++----
 xen/arch/x86/setup.c                  |  4 +++-
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 3c2ac964e410..707b134c09c7 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -20,10 +20,30 @@
 #ifndef __ASSEMBLY__
 
 struct cpuinfo_x86 {
-    unsigned char x86;                 /* CPU family */
-    unsigned char x86_vendor;          /* CPU vendor */
-    unsigned char x86_model;
-    unsigned char x86_mask;
+    /* TODO: Phase out the x86 prefixed names. */
+    union {
+        struct {
+            union {
+                uint8_t x86_model;
+                uint8_t model;
+            };
+            union {
+                uint8_t x86;
+                uint8_t family;
+            };
+            union {
+                uint8_t x86_vendor;
+                uint8_t vendor;
+            };
+            uint8_t _rsvd;
+        };
+        uint32_t vfm;                  /* Vendor Family Model */
+    };
+    union {
+        uint8_t x86_mask;
+        uint8_t stepping;
+    };
+
     unsigned int cpuid_level;          /* Maximum supported CPUID level */
     unsigned int extended_cpuid_level; /* Maximum supported CPUID extended level */
     unsigned int x86_capability[NCAPINTS];
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 24e4f5ac7f5d..37421ac9d05b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -178,7 +178,9 @@ void *stack_start = cpu0_stack + STACK_SIZE - sizeof(struct cpu_info);
 /* Used by the boot asm and EFI to stash the multiboot_info paddr. */
 unsigned int __initdata multiboot_ptr;
 
-struct cpuinfo_x86 __read_mostly boot_cpu_data = { 0, 0, 0, 0, -1 };
+struct cpuinfo_x86 __read_mostly boot_cpu_data = {
+    .cpuid_level = -1,
+};
 
 unsigned long __read_mostly mmu_cr4_features = XEN_MINIMAL_CR4;
 
-- 
2.39.5


