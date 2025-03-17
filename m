Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A97A65DCA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 20:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918003.1322767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuG0l-0005fw-Os; Mon, 17 Mar 2025 19:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918003.1322767; Mon, 17 Mar 2025 19:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuG0l-0005ch-Kx; Mon, 17 Mar 2025 19:20:31 +0000
Received: by outflank-mailman (input) for mailman id 918003;
 Mon, 17 Mar 2025 19:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuG0j-0005ZB-Us
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 19:20:29 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2c6be57-0364-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 20:20:28 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso17564045e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 12:20:28 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe292d0sm113505845e9.20.2025.03.17.12.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 12:20:27 -0700 (PDT)
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
X-Inumbo-ID: e2c6be57-0364-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742239228; x=1742844028; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn2ZnCS88cctTOr/fFl+tXYklVer0fE8Q23JyiJ581g=;
        b=UUYKxvMgnvb+UQ6Oz5A8rz98Xs2PvykLoWimk12W3VzjbX3BMi8bxdjj2ltLVP/hM6
         hjM4b7I0DMkh8Yo8U9gT1LeC+0ELpabhE7qOxvLL1MkVZ7MQiEC10dLxnOhZPryAiE6J
         a8Dzo18s+7pA0BEAph30mhph28gpvXRX25mZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742239228; x=1742844028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn2ZnCS88cctTOr/fFl+tXYklVer0fE8Q23JyiJ581g=;
        b=ZrR3uj3c2oYwYYxrkprJnbqgTZtRYp+bBzdCfhWeitj92Ho0S4vxks8zOq3qQlyELL
         fRCqzz9HajDHIMgimX9NRhSvI991GbckWo+6ForlKOP/kWFLRkX7H4fv2Dvp+fMnLWwz
         5BGHJvNiTu0TuZH1PV/ds1ehQSZ/neypqwNut+yJeo5dLMtq54oaLxa6eoPNp7e7t17l
         cAuzB0eUd5dIqVWrwVAmHAaTiflDPk1EAVqiAenu37IDojmc1qtQEcUXT/YBrB9LHyUj
         OmfLu8Bgc4niND1CboXuwq4u/z9ky0o2PhCMWpxiVFcXRmJURqqbJ61tvPwkmLLxEvdm
         gbpw==
X-Gm-Message-State: AOJu0Yxmg5i5o6rjwhAZwSdnXCSQMQrD9tE4+A/nbVvjuGLzh6GQnuZc
	6bo6EuCFKhHytebu7MCxbtN6N7w0Yk8hHvAIaJQKNkP+tcokcGaBbe5PxYjPXBmvM/5v+AJ1Kko
	w
X-Gm-Gg: ASbGncv/fZJwNHD4nX9n2Qlu9ncSCWfTe3g9A1C6loj33+HUHPxD+6W6hJVPm6S9JzX
	57AEcoT+3RRFLWnIWRolykPha318CQn1q2Zfpil3p0fTrdU62TrQuJz8ptcsIoij4Kb7jKyaQiw
	3gHceMev0dexpfvbwaLyEbrYumIvG8fAhpFV7KW8uMvewaGwbj1KTrwf5cTWnYQe3+8I2sMrZU/
	xctENWAFX8ET4ScnvaQSGEicQTOmz/vj92lZG5fk3+fRn+5S81w/lVDHsx3Sfylv13HpelKQk6n
	bXU7oCsI8STx6Zk5OwL0n66XdDawHrY8eEhotW6LjypLby2ONIa/FVDNs3O5qYgW/UlAqkddI6L
	igrrYx/Hk/bgRe9PVbERJqPwsFWR/BAM6PU0=
X-Google-Smtp-Source: AGHT+IED2fjIxPb5278njdcOgCM0rtNVDgryI/NEgXo/0aq+WjEe5XRdH3zps90jtpIvnqge6fiz6Q==
X-Received: by 2002:a05:600c:154c:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-43d1ecff43amr121883025e9.23.1742239227827;
        Mon, 17 Mar 2025 12:20:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/4] x86/traps: Move percpu_traps_init() into traps-setup.c
Date: Mon, 17 Mar 2025 19:20:21 +0000
Message-Id: <20250317192023.568432-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317192023.568432-1-andrew.cooper3@citrix.com>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the declaration from asm/system.h into asm/traps.h.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/power.c         |  1 +
 xen/arch/x86/include/asm/system.h |  1 -
 xen/arch/x86/include/asm/traps.h  |  2 ++
 xen/arch/x86/setup.c              |  1 +
 xen/arch/x86/smpboot.c            |  1 +
 xen/arch/x86/traps-setup.c        | 15 +++++++++++++++
 xen/arch/x86/traps.c              |  8 --------
 7 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index fe70257864e1..3196a33b1918 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -31,6 +31,7 @@
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
 #include <asm/trampoline.h>
+#include <asm/traps.h>
 
 #include <public/platform.h>
 
diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 73cb16ca68d6..73364056c702 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -266,7 +266,6 @@ static inline int local_irq_is_enabled(void)
 void trap_init(void);
 void init_idt_traps(void);
 void load_system_tables(void);
-void percpu_traps_init(void);
 void subarch_percpu_traps_init(void);
 
 #endif
diff --git a/xen/arch/x86/include/asm/traps.h b/xen/arch/x86/include/asm/traps.h
index 01ef362edc8c..825f7441c86e 100644
--- a/xen/arch/x86/include/asm/traps.h
+++ b/xen/arch/x86/include/asm/traps.h
@@ -7,6 +7,8 @@
 #ifndef ASM_TRAP_H
 #define ASM_TRAP_H
 
+void percpu_traps_init(void);
+
 const char *vector_name(unsigned int vec);
 
 #endif /* ASM_TRAP_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 718297ca541a..b092106ccca5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -56,6 +56,7 @@
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
 #include <asm/trampoline.h>
+#include <asm/traps.h>
 
 #include <xsm/xsm.h>
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b63a9ce13e0a..54207e6d8830 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -41,6 +41,7 @@
 #include <asm/tboot.h>
 #include <asm/time.h>
 #include <asm/trampoline.h>
+#include <asm/traps.h>
 
 uint32_t __ro_after_init trampoline_phys;
 enum ap_boot_method __read_mostly ap_boot_method = AP_BOOT_NORMAL;
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index 3ee28319584d..fa78a35a7ebf 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -3,5 +3,20 @@
  * Configuration of event handling for all CPUs.
  */
 #include <asm/idt.h>
+#include <asm/msr.h>
+#include <asm/system.h>
+#include <asm/traps.h>
 
 DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
+
+/*
+ * Set up per-CPU linkage registers for exception, interrupt and syscall
+ * handling.
+ */
+void percpu_traps_init(void)
+{
+    subarch_percpu_traps_init();
+
+    if ( cpu_has_xen_lbr )
+        wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
+}
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index a89f4f4f34ea..29d7e4123f90 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1864,14 +1864,6 @@ void asmlinkage do_entry_CP(struct cpu_user_regs *regs)
     panic("CONTROL-FLOW PROTECTION FAULT: #CP[%04x] %s\n", ec, err);
 }
 
-void percpu_traps_init(void)
-{
-    subarch_percpu_traps_init();
-
-    if ( cpu_has_xen_lbr )
-        wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
-}
-
 void nocall entry_PF(void);
 
 void __init init_idt_traps(void)
-- 
2.39.5


