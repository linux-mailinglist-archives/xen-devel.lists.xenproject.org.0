Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIuuB23WmGl+NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6316516B08B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237614.1539892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL9-0000vc-Jy; Fri, 20 Feb 2026 21:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237614.1539892; Fri, 20 Feb 2026 21:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL9-0000mO-Ae; Fri, 20 Feb 2026 21:47:11 +0000
Received: by outflank-mailman (input) for mailman id 1237614;
 Fri, 20 Feb 2026 21:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYL8-0008IG-4a
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:10 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b433f758-0ea5-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 22:47:08 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso33419435e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:08 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:06 -0800 (PST)
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
X-Inumbo-ID: b433f758-0ea5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624027; x=1772228827; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38Q6mGCwbKjhhK8kwdPI5HfU9QB1AsZ0yVRPxRPU2XA=;
        b=I5uwAh+6sicY4jOD/nMZRlwFvDLFYB3wwyJodfcP4iGUWiFCQODI1Z/6jNVjS7Cp6a
         TfoSIIcNQgn8tVWRU4b2Ov+UaiulA2J5DLjiZbE6u2cs0IBkgG/2q9L+u97FZ9BVXgjR
         +GtSz+hLhE6DbJqIyqcmYp8TtG02CsJmrp93M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624027; x=1772228827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=38Q6mGCwbKjhhK8kwdPI5HfU9QB1AsZ0yVRPxRPU2XA=;
        b=Oh8QheO174nVZ3g+Z54X0Pw+SMbejOe6xQTSkr7jgHFlE3IpDul+ifZH3LPHUlrDMY
         i3judnK3yepxQEe1AFpRFchgpNOKMGY59DLjR/y5mxyQ7OBt/1MlP3iSpI3NQJ1G0vbb
         QfixbGP/CnQUF8cZiyEcrFvFbMd288IS7IzNl2ptW581OTT0sGYOLa0yhpVSID9Djl9F
         Tv1KKqG7lYu1R9wNYABZMYMQm3aQQL2m8n65jOiphlaYJM0FaEAFVeGGWhiLMgnx6tsg
         qbUoCucersE+3cTjM0ziEhQefO5GrCZjgt4AIAj1Luq7zh8QkVrLCuP3YIydlZxtl833
         KMbw==
X-Gm-Message-State: AOJu0YzEn8xWv7hH0yytfIEtLOEub0id7PQgkQ5MFuNDhjqVwyxDDj0h
	un9O2XWlQVpNbgLxSNMcpgJAdtUX3uBThOv0iXCsFYBBLprpu2jX4h1JAk/e5e24PfZac2QSU62
	O9d7gQNI3hA==
X-Gm-Gg: AZuq6aK/PcnT4dHqJKcMop8WMVR9YekwNIpMYuu7wrFtuv6LD9/IeIWQnJD7U94z2+G
	hfHZbeCWMKQqdtCoIDjMgnBU+XMC+I0i6GmpP+lW2vfBSMDTPSZ29GFRewtapEQchCxBqiNUKRa
	9rqNRStA4rBmafCOdloFpOXVjaoY9H4caWr4Ft3Rek/VR+/cJznSOPNSIBi/mcB2RXydfk0rsFo
	SqCb7ynYCkGHNqs9Lk4s7aivVEu0FAXO1OQqTqcSwGIhO6rnbpZtxmnGiyGTT8XuZ4AJcDyS25z
	DDewoHqFW86qGua9sEzzyyRSHqy0m1zNA3tMIWViX2xIhzBBUWKTOxyQr/ZJz1Ey9iwzzzzMRut
	02j/KGriRB7A4dzXKcS6nEDQoZL3Mq2QDV5k+84GhhO9ynz/LEZUVRjAKD5nakkHUhKB8A3mnWB
	8WcYJf93C9PYtx+h0+Pmj4ngso+FnHJFjED4vdSdtRxj+qxA75wT+IQzVibW+TaOCzkLAhbBc=
X-Received: by 2002:a05:600c:1989:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-483a94c99admr21112605e9.9.1771624027207;
        Fri, 20 Feb 2026 13:47:07 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 06/12] xen: Include suitable headers to make declarations visible
Date: Fri, 20 Feb 2026 21:46:47 +0000
Message-Id: <20260220214653.3497384-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6316516B08B
X-Rspamd-Action: no action

A range of functions can't see their declarations, requiring the inclusion of
appropriate headers.

For pv/mm.h and pv/traps.h, this requires adjustements to become standalone.

In pv/mm.h, swap xen/lib.h for xen/bug.h now that ASSERT_UNREACHABLE() has
moved.  For pv/traps.h, pv_trap_callback_registered() needs to see a complete
struct vcpu, and xen/sched.h is not something appropriate to pull in
conditionally.

stack-protector.c can't see the declaration of __stack_chk_guard, and fixing
that reveals that stack-protector.h needs get_cycles() too.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/include/asm/pv/mm.h    | 8 +++++++-
 xen/arch/x86/include/asm/pv/traps.h | 6 ++----
 xen/arch/x86/mm/mem_paging.c        | 6 ++++--
 xen/arch/x86/pv/emul-gate-op.c      | 2 ++
 xen/arch/x86/pv/emul-inv-op.c       | 1 +
 xen/arch/x86/pv/emul-priv-op.c      | 1 +
 xen/arch/x86/pv/emulate.c           | 1 +
 xen/arch/x86/pv/grant_table.c       | 1 +
 xen/arch/x86/pv/mm.c                | 1 +
 xen/arch/x86/pv/ro-page-fault.c     | 1 +
 xen/arch/x86/pv/traps.c             | 1 +
 xen/arch/x86/x86_64/machine_kexec.c | 3 ++-
 xen/common/stack-protector.c        | 1 +
 xen/include/xen/stack-protector.h   | 2 ++
 14 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/pv/mm.h b/xen/arch/x86/include/asm/pv/mm.h
index a5745908206a..11a43f15e222 100644
--- a/xen/arch/x86/include/asm/pv/mm.h
+++ b/xen/arch/x86/include/asm/pv/mm.h
@@ -10,6 +10,12 @@
 #ifndef __X86_PV_MM_H__
 #define __X86_PV_MM_H__
 
+#include <xen/stdbool.h>
+
+struct cpu_user_regs;
+struct page_info;
+struct vcpu;
+
 #ifdef CONFIG_PV
 
 int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs);
@@ -26,7 +32,7 @@ int validate_segdesc_page(struct page_info *page);
 #else
 
 #include <xen/errno.h>
-#include <xen/lib.h>
+#include <xen/bug.h>
 
 static inline int pv_ro_page_fault(unsigned long addr,
                                    struct cpu_user_regs *regs)
diff --git a/xen/arch/x86/include/asm/pv/traps.h b/xen/arch/x86/include/asm/pv/traps.h
index 8c31d5a793c5..8c201190923d 100644
--- a/xen/arch/x86/include/asm/pv/traps.h
+++ b/xen/arch/x86/include/asm/pv/traps.h
@@ -10,9 +10,9 @@
 #ifndef __X86_PV_TRAPS_H__
 #define __X86_PV_TRAPS_H__
 
-#ifdef CONFIG_PV
+#include <xen/sched.h>
 
-#include <public/xen.h>
+#ifdef CONFIG_PV
 
 int pv_raise_nmi(struct vcpu *v);
 
@@ -28,8 +28,6 @@ static inline bool pv_trap_callback_registered(const struct vcpu *v,
 
 #else  /* !CONFIG_PV */
 
-#include <xen/errno.h>
-
 static inline int pv_raise_nmi(struct vcpu *v) { return -EOPNOTSUPP; }
 
 static inline int pv_emulate_privileged_op(struct cpu_user_regs *regs) { return 0; }
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index d4b3cb990c54..33929b526ab9 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -7,10 +7,12 @@
  * Copyright (c) 2009 Citrix Systems, Inc. (Patrick Colp)
  */
 
-
-#include <asm/p2m.h>
 #include <xen/guest_access.h>
 #include <xen/vm_event.h>
+
+#include <asm/mem_paging.h>
+#include <asm/p2m.h>
+
 #include <xsm/xsm.h>
 
 #include "mm-locks.h"
diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
index 1faf13b962b1..c2c699fbff40 100644
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -9,6 +9,8 @@
 
 #include <xen/err.h>
 
+#include <asm/pv/traps.h>
+
 #include "emulate.h"
 
 static int read_gate_descriptor(unsigned int gate_sel,
diff --git a/xen/arch/x86/pv/emul-inv-op.c b/xen/arch/x86/pv/emul-inv-op.c
index 346ac1124d7b..23d2928b00cd 100644
--- a/xen/arch/x86/pv/emul-inv-op.c
+++ b/xen/arch/x86/pv/emul-inv-op.c
@@ -8,6 +8,7 @@
  */
 
 #include <asm/pv/trace.h>
+#include <asm/pv/traps.h>
 
 #include "emulate.h"
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 1d9e57ad2763..a3c1fd12621d 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -21,6 +21,7 @@
 #include <asm/mc146818rtc.h>
 #include <asm/pv/domain.h>
 #include <asm/pv/trace.h>
+#include <asm/pv/traps.h>
 #include <asm/shared.h>
 #include <asm/stubs.h>
 
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index 0022e0f55e30..a00d1c6c82eb 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -10,6 +10,7 @@
 #include <xen/guest_access.h>
 
 #include <asm/debugreg.h>
+#include <asm/pv/domain.h>
 
 #include "emulate.h"
 
diff --git a/xen/arch/x86/pv/grant_table.c b/xen/arch/x86/pv/grant_table.c
index 247436a0156a..1df68440a24a 100644
--- a/xen/arch/x86/pv/grant_table.c
+++ b/xen/arch/x86/pv/grant_table.c
@@ -12,6 +12,7 @@
 #include <public/grant_table.h>
 
 #include <asm/p2m.h>
+#include <asm/pv/grant_table.h>
 #include <asm/pv/mm.h>
 
 #include "mm.h"
diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 187f5f6a3e8c..3f2e9dedcde3 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -12,6 +12,7 @@
 
 #include <asm/current.h>
 #include <asm/p2m.h>
+#include <asm/pv/mm.h>
 
 #include "mm.h"
 
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 9c6f66884675..d89306d34fc6 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2004 Christian Limpach
  */
 
+#include <asm/pv/mm.h>
 #include <asm/pv/trace.h>
 #include <asm/shadow.h>
 
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 26a468108a77..b0395b99145a 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -16,6 +16,7 @@
 #include <asm/idt.h>
 #include <asm/irq-vectors.h>
 #include <asm/pv/trace.h>
+#include <asm/pv/traps.h>
 #include <asm/shared.h>
 #include <asm/traps.h>
 
diff --git a/xen/arch/x86/x86_64/machine_kexec.c b/xen/arch/x86/x86_64/machine_kexec.c
index f4a005cd0c2f..f9e54d86fb53 100644
--- a/xen/arch/x86/x86_64/machine_kexec.c
+++ b/xen/arch/x86/x86_64/machine_kexec.c
@@ -6,8 +6,9 @@
  * - Magnus Damm <magnus@valinux.co.jp>
  */
 
-#include <xen/types.h>
 #include <xen/kernel.h>
+#include <xen/kexec.h>
+
 #include <asm/page.h>
 #include <public/kexec.h>
 
diff --git a/xen/common/stack-protector.c b/xen/common/stack-protector.c
index 2115912c3bd0..05e57d4509e2 100644
--- a/xen/common/stack-protector.c
+++ b/xen/common/stack-protector.c
@@ -2,6 +2,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/random.h>
+#include <xen/stack-protector.h>
 #include <xen/time.h>
 
 /*
diff --git a/xen/include/xen/stack-protector.h b/xen/include/xen/stack-protector.h
index 931affd919be..65488bdabced 100644
--- a/xen/include/xen/stack-protector.h
+++ b/xen/include/xen/stack-protector.h
@@ -1,6 +1,8 @@
 #ifndef __XEN_STACK_PROTECTOR_H__
 #define __XEN_STACK_PROTECTOR_H__
 
+#include <xen/time.h>
+
 extern unsigned long __stack_chk_guard;
 
 /*
-- 
2.39.5


