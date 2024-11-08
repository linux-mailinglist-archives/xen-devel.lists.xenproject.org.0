Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F389C1FB8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 15:54:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832655.1247946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QMs-0007uA-O4; Fri, 08 Nov 2024 14:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832655.1247946; Fri, 08 Nov 2024 14:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QMs-0007s1-L8; Fri, 08 Nov 2024 14:53:46 +0000
Received: by outflank-mailman (input) for mailman id 832655;
 Fri, 08 Nov 2024 14:53:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9QMq-0007rv-R3
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 14:53:44 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d0f137e-9de1-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 15:53:39 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a99f1fd20c4so319758966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 06:53:39 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc4c18sm243429266b.121.2024.11.08.06.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 06:53:37 -0800 (PST)
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
X-Inumbo-ID: 3d0f137e-9de1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNkMGYxMzdlLTlkZTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDc3NjE5LjEwMjQ5OSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731077618; x=1731682418; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6xkYzsBAesyu5Y5WNvzvYUHdQIIWi9YiQJdKKIjz60=;
        b=JeLxG2YGumr8LenUQWGP63WFKmO841B4uZDQMX5GPmz0taxb/Go4TW254zayVyiM7I
         MkaaRK8eNUA/UQ+6JW80yzqWn5/bGJ3P5uhr0uKcl5ykKjAJ4pWw7Yi9HjZyTBQOp6nP
         RzN9Hbl9EmHxN1gThO0OYEMzzi3CdqPnxLyvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077618; x=1731682418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z6xkYzsBAesyu5Y5WNvzvYUHdQIIWi9YiQJdKKIjz60=;
        b=iRm7sL22+w1JGG+7mpNaRVBNr+LA+KYxnk7H4ECjr5yPz9dTwnq9qfubrmHUmws0x/
         eHufQ5ZQ84TymgucsoA1bxrgMgUHwLXG/aukVr2ScQLBNB7lbXD8MIftAO2kRXnZlddm
         ADZwj9s1rfRlMDLE/sAf+NouRbAsrjdGkM6xL+KAu5Ke4H3zaZgsua2PvdkKN7SzQU8W
         /Skhrb5V8NmEPa492wo0N0wQnSpPUSokP5yTrI9SyWHGSUvNm3zZq/XB3WsuE179OFtv
         oOmzfdPezCAz9hIyP2l3s8NXEXcoWSpTk1oZ/bKuLKx0h2iIvCNNl7XQs1dictm7sgni
         isRw==
X-Gm-Message-State: AOJu0YzBqrv+88/wo+YqqglpO5ck1wfIDYPU+7cT+oRBrg5VPzv+98RV
	5i45/uOMQf7fjU5H1xdrYyuebLVVtT/sHhzxbwyabr9ZBLSIXyC0/TvV/VktzJC3J2uXgiZW7x7
	4
X-Google-Smtp-Source: AGHT+IH1aAKwK2xcMvN/qXmksM/XFL1VDe8FffY+N36SeEN+2yxfild1wDuGcesclASN7vrQu8nCMQ==
X-Received: by 2002:a17:907:60cf:b0:a9a:1253:4d81 with SMTP id a640c23a62f3a-a9eefff1ffemr248768866b.47.1731077617984;
        Fri, 08 Nov 2024 06:53:37 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v2] x86/trampoline: Collect other scattered trampoline symbols
Date: Fri,  8 Nov 2024 14:53:35 +0000
Message-Id: <20241108145335.315884-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
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

v2:
 * Rebase

video.h, edd.h and e820.h also contain trampoline symbols, but they're pretty
well contained headers already.

kbd_shift_flags seems especially dubious.  It's a snapshot of the keyboard
state when Xen happened to pass through the trampoline, and surely cannot be
useful for dom0 in the slightest...
---
 xen/arch/x86/include/asm/processor.h  |  2 --
 xen/arch/x86/include/asm/setup.h      |  2 --
 xen/arch/x86/include/asm/trampoline.h | 15 +++++++++++++++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 26e2fb13699a..877651212273 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -96,8 +96,6 @@ extern void ctxt_switch_levelling(const struct vcpu *next);
 extern void (*ctxt_switch_masking)(const struct vcpu *next);
 
 extern bool opt_cpu_info;
-extern u32 trampoline_efer;
-extern u64 trampoline_misc_enable_off;
 
 /* Maximum width of physical addresses supported by the hardware. */
 extern unsigned int paddr_bits;
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index d7ed4f40024c..25c15ef9140d 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -48,8 +48,6 @@ int remove_xen_ranges(struct rangeset *r);
 
 int cf_check stub_selftest(void);
 
-extern uint8_t kbd_shift_flags;
-
 #ifdef NDEBUG
 # define highmem_start 0
 #else
diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
index 57a1f85a539e..838c2f0b6fcd 100644
--- a/xen/arch/x86/include/asm/trampoline.h
+++ b/xen/arch/x86/include/asm/trampoline.h
@@ -85,9 +85,24 @@ extern uint32_t trampoline_xen_phys_start;
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

base-commit: 75035c386eeb8bd5dbed1831dbb96a35b31521f6
-- 
2.39.5


