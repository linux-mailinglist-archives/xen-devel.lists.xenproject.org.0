Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078101DC538
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 04:32:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbb09-0000Fl-8n; Thu, 21 May 2020 02:32:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsrW=7D=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jbb08-0000Ff-05
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 02:32:04 +0000
X-Inumbo-ID: 41046766-9b0b-11ea-b9cf-bc764e2007e4
Received: from mail-ot1-f49.google.com (unknown [209.85.210.49])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41046766-9b0b-11ea-b9cf-bc764e2007e4;
 Thu, 21 May 2020 02:32:02 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id c3so4341408otr.12
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 19:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ivGMi/gUy4Fl/JUt0Ag3q+pDqnqpG1RucRU6tciEaHo=;
 b=rPOmcE/IfRmDjyKkPhDsSgcycA3HomMbHx8ZRysVJQQ8F0J3hTJQruK0O2dm1qqdeb
 fZonUdNct1xrsVMqWX6/1Ls5iwFNrYAE65l2W2GUKmBe6hH+LWBtigWZGxoM9I5oHyYB
 j9dwO86SOQ5CGk56PG6idRXe+V9ie9K543pdfRTFuOtkwhUNaWmWfbSUSJlD4agD5yMT
 +5HdHRQ8KrOC2xQA3diPtYGcg8O0obolw/PXO4MspNO/Z3em3MPiOiVbrC8CJEdAr0To
 AacrqpvnJQK5txTe//3xLmnxjqJjW1F2D6jIFObP52SQe9orMOfK3GD42MmwZa+BCIFT
 tglA==
X-Gm-Message-State: AOAM532zDz8ysJsE/EwZN18MtLKEEAYosynP/CQzSC67G0/gBxU8YmdY
 DuK88X65Fv0/NLCO23oRVtC3dHBHsj0=
X-Google-Smtp-Source: ABdhPJxUduLr0BaPkbikFoD30T7EOE8KTQA1pOoCB/sAKmae1i5hjytRziYvUc3qzyOGZQnpsRZe+A==
X-Received: by 2002:a9d:6e3:: with SMTP id 90mr5703777otx.261.1590028321780;
 Wed, 20 May 2020 19:32:01 -0700 (PDT)
Received: from t0.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.googlemail.com with ESMTPSA id r17sm1312480ooq.2.2020.05.20.19.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 19:32:01 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 for-4.14 3/3] xen/vm_event: Add safe to disable vm_event
Date: Wed, 20 May 2020 20:31:54 -0600
Message-Id: <682dde916f982e2889b2be2263418e9506a82c1e.1590028160.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <cover.1590028160.git.tamas@tklengyel.com>
References: <cover.1590028160.git.tamas@tklengyel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Instead of having to repeatedly try to disable vm_events, request a specific
vm_event to be sent when the domain is safe to continue with shutting down
the vm_event interface.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/hvm/hvm.c            | 38 ++++++++++++++++++++++++++-----
 xen/arch/x86/hvm/monitor.c        | 14 ++++++++++++
 xen/arch/x86/monitor.c            | 13 +++++++++++
 xen/include/asm-x86/domain.h      |  1 +
 xen/include/asm-x86/hvm/monitor.h |  1 +
 xen/include/public/domctl.h       |  2 ++
 xen/include/public/vm_event.h     |  8 +++++++
 7 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e6780c685b..fc7e1e2b22 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -563,15 +563,41 @@ void hvm_do_resume(struct vcpu *v)
         v->arch.hvm.inject_event.vector = HVM_EVENT_VECTOR_UNSET;
     }
 
-    if ( unlikely(v->arch.vm_event) && v->arch.monitor.next_interrupt_enabled )
+    if ( unlikely(v->arch.vm_event) )
     {
-        struct x86_event info;
+        struct domain *d = v->domain;
+
+        if ( v->arch.monitor.next_interrupt_enabled )
+        {
+            struct x86_event info;
+
+            if ( hvm_get_pending_event(v, &info) )
+            {
+                hvm_monitor_interrupt(info.vector, info.type, info.error_code,
+                                      info.cr2);
+                v->arch.monitor.next_interrupt_enabled = false;
+            }
+        }
 
-        if ( hvm_get_pending_event(v, &info) )
+        if ( d->arch.monitor.safe_to_disable )
         {
-            hvm_monitor_interrupt(info.vector, info.type, info.error_code,
-                                  info.cr2);
-            v->arch.monitor.next_interrupt_enabled = false;
+            const struct vcpu *check_vcpu;
+            bool pending_op = false;
+
+            for_each_vcpu ( d, check_vcpu )
+            {
+                if ( vm_event_check_pending_op(check_vcpu) )
+                {
+                    pending_op = true;
+                    break;
+                }
+            }
+
+            if ( !pending_op )
+            {
+                hvm_monitor_safe_to_disable();
+                d->arch.monitor.safe_to_disable = false;
+            }
         }
     }
 }
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index f5d89e71d1..75fd1a4b68 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -300,6 +300,20 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
     return monitor_traps(curr, true, &req) >= 0;
 }
 
+void hvm_monitor_safe_to_disable(void)
+{
+    struct vcpu *curr = current;
+    struct arch_domain *ad = &curr->domain->arch;
+    vm_event_request_t req = {};
+
+    if ( !ad->monitor.safe_to_disable )
+        return;
+
+    req.reason = VM_EVENT_REASON_SAFE_TO_DISABLE;
+
+    monitor_traps(curr, 0, &req);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
index 1517a97f50..86e0ba2fbc 100644
--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -339,6 +339,19 @@ int arch_monitor_domctl_event(struct domain *d,
         break;
     }
 
+    case XEN_DOMCTL_MONITOR_EVENT_SAFE_TO_DISABLE:
+    {
+        bool old_status = ad->monitor.safe_to_disable;
+
+        if ( unlikely(old_status == requested_status) )
+            return -EEXIST;
+
+        domain_pause(d);
+        ad->monitor.safe_to_disable = requested_status;
+        domain_unpause(d);
+        break;
+    }
+
     default:
         /*
          * Should not be reached unless arch_monitor_get_capabilities() is
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index d890ab7a22..948b750c71 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -417,6 +417,7 @@ struct arch_domain
          */
         unsigned int inguest_pagefault_disabled                            : 1;
         unsigned int control_register_values                               : 1;
+        unsigned int safe_to_disable                                       : 1;
         struct monitor_msr_bitmap *msr_bitmap;
         uint64_t write_ctrlreg_mask[4];
     } monitor;
diff --git a/xen/include/asm-x86/hvm/monitor.h b/xen/include/asm-x86/hvm/monitor.h
index 66de24cb75..dbc113a635 100644
--- a/xen/include/asm-x86/hvm/monitor.h
+++ b/xen/include/asm-x86/hvm/monitor.h
@@ -52,6 +52,7 @@ bool hvm_monitor_emul_unimplemented(void);
 
 bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
                            uint16_t kind);
+void hvm_monitor_safe_to_disable(void);
 
 #endif /* __ASM_X86_HVM_MONITOR_H__ */
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index cbcd25f12c..247e809a6c 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1040,6 +1040,8 @@ struct xen_domctl_psr_cmt_op {
 #define XEN_DOMCTL_MONITOR_EVENT_EMUL_UNIMPLEMENTED    10
 /* Enabled by default */
 #define XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT     11
+/* Always async, disables automaticaly on first event */
+#define XEN_DOMCTL_MONITOR_EVENT_SAFE_TO_DISABLE       12
 
 struct xen_domctl_monitor_op {
     uint32_t op; /* XEN_DOMCTL_MONITOR_OP_* */
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index fdd3ad8a30..b66d2a8634 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -159,6 +159,14 @@
 #define VM_EVENT_REASON_DESCRIPTOR_ACCESS       13
 /* Current instruction is not implemented by the emulator */
 #define VM_EVENT_REASON_EMUL_UNIMPLEMENTED      14
+/*
+ * When shutting down vm_event it may not be immediately safe to complete the
+ * process as some vCPUs may be pending synchronization. This async event
+ * type can be used to receive a notification when its safe to finish disabling
+ * the vm_event interface. All other event types need to be disabled before
+ * registering to this one.
+ */
+#define VM_EVENT_REASON_SAFE_TO_DISABLE         15
 
 /* Supported values for the vm_event_write_ctrlreg index. */
 #define VM_EVENT_X86_CR0    0
-- 
2.26.1


