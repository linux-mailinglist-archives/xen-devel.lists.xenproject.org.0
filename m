Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD0B309570
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 14:38:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78873.143591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5qRb-00039E-9Q; Sat, 30 Jan 2021 13:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78873.143591; Sat, 30 Jan 2021 13:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5qRb-00038t-6G; Sat, 30 Jan 2021 13:37:43 +0000
Received: by outflank-mailman (input) for mailman id 78873;
 Sat, 30 Jan 2021 13:37:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkB/=HB=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1l5qRZ-00038o-6X
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 13:37:41 +0000
Received: from MTA-13-3.privateemail.com (unknown [198.54.118.204])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 612bfe72-8862-406d-b4b6-299f5f318828;
 Sat, 30 Jan 2021 13:37:38 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 6694B800A4;
 Sat, 30 Jan 2021 08:37:37 -0500 (EST)
Received: from drt-xps-ubuntu.lan (unknown [10.20.151.200])
 by mta-13.privateemail.com (Postfix) with ESMTPA id E25FD80099;
 Sat, 30 Jan 2021 13:37:35 +0000 (UTC)
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
X-Inumbo-ID: 612bfe72-8862-406d-b4b6-299f5f318828
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 17/16] x86/vm_event: add response flag to reset vmtrace buffer
Date: Sat, 30 Jan 2021 08:36:37 -0500
Message-Id: <ee100113466955e7f6ecdda084ab87861c1626c4.1612013451.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

From: Tamas K Lengyel <tamas.lengyel@intel.com>

Allow resetting the vmtrace buffer in response to a vm_event. This can be used
to optimize a use-case where detecting a looped vmtrace buffer is important.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
This is a last minute addition to the series "acquire_resource size and
external IPT monitoring" posted by Andrew, new in v8.
---
 xen/arch/x86/vm_event.c        | 7 +++++++
 xen/common/vm_event.c          | 3 +++
 xen/include/asm-arm/vm_event.h | 6 ++++++
 xen/include/asm-x86/vm_event.h | 2 ++
 xen/include/public/vm_event.h  | 4 ++++
 5 files changed, 22 insertions(+)

diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index 36272e9316..8f73a73e2e 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -300,6 +300,13 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
     };
 }
 
+void vm_event_reset_vmtrace(struct vcpu *v)
+{
+#ifdef CONFIG_HVM
+    hvm_vmtrace_reset(v);
+#endif
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 127f2d58f1..44d542f23e 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -424,6 +424,9 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
             if ( rsp.flags & VM_EVENT_FLAG_GET_NEXT_INTERRUPT )
                 vm_event_monitor_next_interrupt(v);
 
+            if ( rsp.flags & VM_EVENT_FLAG_RESET_VMTRACE )
+                vm_event_reset_vmtrace(v);
+
             if ( rsp.flags & VM_EVENT_FLAG_VCPU_PAUSED )
                 vm_event_vcpu_unpause(v);
         }
diff --git a/xen/include/asm-arm/vm_event.h b/xen/include/asm-arm/vm_event.h
index 14d1d341cc..abe7db1970 100644
--- a/xen/include/asm-arm/vm_event.h
+++ b/xen/include/asm-arm/vm_event.h
@@ -58,4 +58,10 @@ void vm_event_sync_event(struct vcpu *v, bool value)
     /* Not supported on ARM. */
 }
 
+static inline
+void vm_event_reset_vmtrace(struct vcpu *v)
+{
+    /* Not supported on ARM. */
+}
+
 #endif /* __ASM_ARM_VM_EVENT_H__ */
diff --git a/xen/include/asm-x86/vm_event.h b/xen/include/asm-x86/vm_event.h
index 785e741fba..0756124075 100644
--- a/xen/include/asm-x86/vm_event.h
+++ b/xen/include/asm-x86/vm_event.h
@@ -54,4 +54,6 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp);
 
 void vm_event_sync_event(struct vcpu *v, bool value);
 
+void vm_event_reset_vmtrace(struct vcpu *v);
+
 #endif /* __ASM_X86_VM_EVENT_H__ */
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index 147dc3ea73..36135ba4f1 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -123,6 +123,10 @@
  * Set if the event comes from a nested VM and thus npt_base is valid.
  */
 #define VM_EVENT_FLAG_NESTED_P2M         (1 << 12)
+/*
+ * Reset the vmtrace buffer (if vmtrace is enabled)
+ */
+#define VM_EVENT_FLAG_RESET_VMTRACE      (1 << 13)
 
 /*
  * Reasons for the vm event request
-- 
2.27.0


