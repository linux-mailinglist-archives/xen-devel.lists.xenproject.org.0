Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7949A30B3B5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 00:52:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80221.146630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6izf-00033z-K4; Mon, 01 Feb 2021 23:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80221.146630; Mon, 01 Feb 2021 23:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6izf-00033a-Gi; Mon, 01 Feb 2021 23:52:31 +0000
Received: by outflank-mailman (input) for mailman id 80221;
 Mon, 01 Feb 2021 23:52:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6izd-00033V-UV
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 23:52:29 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c1e5e0b-07ee-49dd-ac0c-ef390b2db081;
 Mon, 01 Feb 2021 23:52:27 +0000 (UTC)
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
X-Inumbo-ID: 7c1e5e0b-07ee-49dd-ac0c-ef390b2db081
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612223547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=E5JUPU1j2pT/veM8SWF/+k6jtm1Vy8PzPBbksm2vA/E=;
  b=O6IMRZtqj7HX/MQqtncNB9oTXGohww3OwNZqSf0m5lT2KpyrCYAFot/H
   U68ResoE33UL6dzR1TEM3rumW2TQaN0bi0LF6IzGq9SQzicsSwCUGzOyz
   f9B09zAV3CqnqSp89MZrnap0VEtwxz6bKPmfEunwjCH9DqVx9BnKkgRgw
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 47SmiOIP1y9uF8049fSXl693rHNEwXfXK3cqeRsTSw1Sgj369cMxOTtxcf4mvOSU3MeW8dhel+
 fpgs/MMEY38E0ReJm8aqZ0TESzIYiNji4o3AJoKTXbRq1I5w4sCnPau4RISHaYRArAyWwUNkj1
 JRf1mZyMPraBr16a8A8Dy91DcYmvcx4YOJyNhmw2Tn7QvWF7V8NVmp9hNP1JcSJtSgKh6vK6f8
 EzMZ8NCs5weUZGuFLHVZo6K58Z5RjFw2MEQ9Y0G08431PB5z3jLKNc3DN6rGdzxn7oEVSXModI
 lDM=
X-SBRS: 5.1
X-MesageID: 36363241
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36363241"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: [PATCH v9 11/11] x86/vm_event: add response flag to reset vmtrace buffer
Date: Mon, 1 Feb 2021 23:27:03 +0000
Message-ID: <20210201232703.29275-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210201232703.29275-1-andrew.cooper3@citrix.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Tamas K Lengyel <tamas.lengyel@intel.com>

Allow resetting the vmtrace buffer in response to a vm_event. This can be used
to optimize a use-case where detecting a looped vmtrace buffer is important.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
2.11.0


