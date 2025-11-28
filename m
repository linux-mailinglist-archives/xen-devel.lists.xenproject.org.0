Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B861C91D01
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 12:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174755.1499703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOwod-0000xi-Nj; Fri, 28 Nov 2025 11:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174755.1499703; Fri, 28 Nov 2025 11:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOwod-0000vS-Kf; Fri, 28 Nov 2025 11:39:07 +0000
Received: by outflank-mailman (input) for mailman id 1174755;
 Fri, 28 Nov 2025 11:39:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHoX=6E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vOwob-0000vM-JM
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 11:39:05 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d72ba709-cc4e-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 12:39:03 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64088c6b309so3075839a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 03:39:04 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751035c2fsm4129969a12.17.2025.11.28.03.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 03:39:02 -0800 (PST)
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
X-Inumbo-ID: d72ba709-cc4e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764329943; x=1764934743; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXfbT/FpY5CQ8C35c+ic/Wf898+NeaAHknX8FFRVVfE=;
        b=Vcpko5Q+ZqPpwNSTzXBp7XcFXhHcfPE4bkEj+0udzyaWTcV2Zibkby0li+FZN8q/Vf
         MvCpQV/7O7CdxIeEO/9TioaiXNzO1mV9FhyA+KLMYbsPpvN4zWNr0E7CkaywzfIEUkcy
         VsfeT9XlPfsrl1lmcwvb24UN2VaSLQ+vhlRkU8mDPZ025/6gGMqr9kZVk6KbqN7PkBcX
         e6RZpIIFaJm2k6U7Z8UzXshqF1a472EmQQj8bdcRHAQbBrC66B0bluLl3k6Ld0OJ56CH
         bhbeaiZAV6KcfmMEuHXUHQSL8suRJlHa3qSTE9cc/L918peztS3xAXa7QR3VD6eOjswo
         k2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764329943; x=1764934743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXfbT/FpY5CQ8C35c+ic/Wf898+NeaAHknX8FFRVVfE=;
        b=a7h3Tg0VTmhQX40ciR4K8tFdAyEKRjo7Z7/foNuxvXEWSTz7s84GkKrsRHuCC6AU7G
         Qk4OCjxMbpHNtyCiGjNKD7FpYIFT7NhgiQGI7NRfgNM4gUIZw3JxLDYOiCTAY+7ns5MG
         FMQYyEw090PG4COzGWZ6vu3HfDqnYokOlynpOQHWfJ3n7WNZFkwTR4pqvd4hr71HHRGO
         76uI1sivsmjPahz9LFm7HPja94NRXzKd1wJwmb50QVqctuH/v7SpmveO9cmwiSarv/nj
         chquCqG4DBkPh1abBMrLAWVAYT7u46afmkc3aOuBRsdMfh8LBg03KAW4H4tpw4IiYv40
         xSjw==
X-Gm-Message-State: AOJu0Yx6rHBUJw0a0W6TEgSDlGHd7tVLkUqwlXAPkR2WWV3bARR4qJRg
	OD6o11kaDJFJPsPq2vAhFj9cQ7Jh8CD+VdYwc+huNMVF6riTVfT53se2eEgNgOtW
X-Gm-Gg: ASbGncuaLziWvj6ICInZbuSzcLgn+gnGOYp7PYYBqeLV73R0iexkLMtbGpZ/JNrDZCO
	MYtRLFEH6IrjW/9axFc26JbDw8vNfBC+KWXwFEnts5/6tqPkil5NoIxawt0Sa3X3jxmIEhwy6uh
	S0axdvzrVeDyIpS/cDuszkl1NVDNknTyugXuW4pXpRvWxvPZZ26qtVtRFUkACT698x0HmjUAiCF
	Fx9anp+oTJXH4CvdTO7DVE7o7CcqizIKicCH0BLvxFLxDIyGKAWHzGGvtNBoATYS50OfPJ6bGvd
	1dofZgaG8/CVE7YaSajYu/8ReCOZ/QeTV9JDzbHgsJYKynf0A6SULWlEgBxJRyp5gQsUJZwab/l
	tGpW60BMmU/7euH+gjdrdbu0sKaSbJ3yZyzu/cSqP/YwCTxuaf/lvLj+Oz0qLtvFPMexC5eTHjr
	MAXyc1oWMFwuqrbvLmHQjqTZwKtN7lJFyflwMnjc9rRDnSugQT7SEL+RQ=
X-Google-Smtp-Source: AGHT+IHizFmzbyV9v2C7uOQf7awlyiYFbv9AVG4WILYAlux01RHvKZYFPrqB5VQ3OhJOFUqiZSlksg==
X-Received: by 2002:a05:6402:234c:b0:640:7690:997e with SMTP id 4fb4d7f45d1cf-64555b86de4mr29113776a12.3.1764329943181;
        Fri, 28 Nov 2025 03:39:03 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
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
	Paul Durrant <paul@xen.org>
Subject: [PATCH v1] xen: move vcpu_kick() declaration to common header
Date: Fri, 28 Nov 2025 12:38:54 +0100
Message-ID: <f291e02042a24de86cab5f62cb2301ad8c72fecf.1764328801.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vcpu_kick() declaration is duplicated across multiple
architecture-specific event.h headers (ARM, x86, PPC).

Remove the redundant declarations and move vcpu_kick() into
the common xen/include/xen/event.h header.

Drop the definition of vcpu_kick() from ppc/include/asm/event.h,
as it is already provided in ppc/stubs.c.

Include <xen/event.h> instead of <asm/event.h> in places where
vcpu_kick() is used, since its declaration now resides in
<xen/event.h>.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/include/asm/event.h | 1 -
 xen/arch/arm/vgic.c              | 2 +-
 xen/arch/arm/vgic/vgic.c         | 2 +-
 xen/arch/ppc/include/asm/event.h | 1 -
 xen/arch/x86/hvm/vioapic.c       | 2 +-
 xen/arch/x86/hvm/viridian/time.c | 2 +-
 xen/arch/x86/hvm/vmx/vmx.c       | 2 +-
 xen/arch/x86/hvm/vpt.c           | 2 +-
 xen/arch/x86/include/asm/event.h | 1 -
 xen/include/xen/event.h          | 2 ++
 10 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/event.h b/xen/arch/arm/include/asm/event.h
index 509157b2b3..e036ab7fb8 100644
--- a/xen/arch/arm/include/asm/event.h
+++ b/xen/arch/arm/include/asm/event.h
@@ -3,7 +3,6 @@
 
 #include <asm/domain.h>
 
-void vcpu_kick(struct vcpu *v);
 void vcpu_mark_events_pending(struct vcpu *v);
 void vcpu_update_evtchn_irq(struct vcpu *v);
 void vcpu_block_unless_event_pending(struct vcpu *v);
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 3ebdf9953f..6f4047bb77 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -9,6 +9,7 @@
  */
 
 #include <xen/bitops.h>
+#include <xen/event.h>
 #include <xen/lib.h>
 #include <xen/init.h>
 #include <xen/domain_page.h>
@@ -17,7 +18,6 @@
 #include <xen/sched.h>
 #include <xen/perfc.h>
 
-#include <asm/event.h>
 #include <asm/current.h>
 
 #include <asm/mmio.h>
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index b2c0e1873a..7361e38709 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -16,9 +16,9 @@
  */
 
 #include <xen/bug.h>
+#include <xen/event.h>
 #include <xen/list_sort.h>
 #include <xen/sched.h>
-#include <asm/event.h>
 #include <asm/new_vgic.h>
 
 #include "vgic.h"
diff --git a/xen/arch/ppc/include/asm/event.h b/xen/arch/ppc/include/asm/event.h
index 0f475c4b89..565eee1439 100644
--- a/xen/arch/ppc/include/asm/event.h
+++ b/xen/arch/ppc/include/asm/event.h
@@ -5,7 +5,6 @@
 #include <xen/lib.h>
 
 /* TODO: implement */
-static inline void vcpu_kick(struct vcpu *v) { BUG_ON("unimplemented"); }
 static inline void vcpu_mark_events_pending(struct vcpu *v) { BUG_ON("unimplemented"); }
 static inline void vcpu_update_evtchn_irq(struct vcpu *v) { BUG_ON("unimplemented"); }
 static inline void vcpu_block_unless_event_pending(struct vcpu *v) { BUG_ON("unimplemented"); }
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 7c725f9e47..5e8938a799 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -29,6 +29,7 @@
 #include <xen/xmalloc.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
+#include <xen/event.h>
 #include <xen/sched.h>
 #include <xen/nospec.h>
 #include <public/hvm/ioreq.h>
@@ -36,7 +37,6 @@
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/support.h>
 #include <asm/current.h>
-#include <asm/event.h>
 #include <asm/io_apic.h>
 
 /* HACK: Route IRQ0 only to VCPU0 to prevent time jumps. */
diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/time.c
index 9311858d63..710a58879b 100644
--- a/xen/arch/x86/hvm/viridian/time.c
+++ b/xen/arch/x86/hvm/viridian/time.c
@@ -7,12 +7,12 @@
  */
 
 #include <xen/domain_page.h>
+#include <xen/event.h>
 #include <xen/hypercall.h>
 #include <xen/sched.h>
 #include <xen/version.h>
 
 #include <asm/apic.h>
-#include <asm/event.h>
 #include <asm/guest/hyperv.h>
 #include <asm/guest/hyperv-tlfs.h>
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 6b407226c4..7009b9d0b0 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -5,6 +5,7 @@
  */
 
 #include <xen/domain_page.h>
+#include <xen/event.h>
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
@@ -21,7 +22,6 @@
 #include <asm/cpufeature.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
-#include <asm/event.h>
 #include <asm/fsgsbase.h>
 #include <asm/gdbsx.h>
 #include <asm/guest-msr.h>
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 50ed738998..e7737ac808 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -5,10 +5,10 @@
  * Copyright (c) 2006, Xiaowei Yang, Intel Corporation.
  */
 
+#include <xen/event.h>
 #include <xen/sched.h>
 #include <xen/time.h>
 #include <asm/hvm/vpt.h>
-#include <asm/event.h>
 #include <asm/apic.h>
 #include <asm/mc146818rtc.h>
 #include <public/hvm/params.h>
diff --git a/xen/arch/x86/include/asm/event.h b/xen/arch/x86/include/asm/event.h
index 434f65007e..d13ce28167 100644
--- a/xen/arch/x86/include/asm/event.h
+++ b/xen/arch/x86/include/asm/event.h
@@ -11,7 +11,6 @@
 
 #include <xen/shared.h>
 
-void vcpu_kick(struct vcpu *v);
 void vcpu_mark_events_pending(struct vcpu *v);
 
 static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 930190054c..211a3ae8d0 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -306,4 +306,6 @@ static inline int evtchn_port_poll(struct domain *d, evtchn_port_t port)
     return rc;
 }
 
+void vcpu_kick(struct vcpu *v);
+
 #endif /* __XEN_EVENT_H__ */
-- 
2.52.0


