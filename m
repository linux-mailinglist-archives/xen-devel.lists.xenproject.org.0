Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7B1EBD57
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 15:49:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg7I8-0008J0-FJ; Tue, 02 Jun 2020 13:49:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr0K=7P=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jg7I7-0008Is-3p
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:49:19 +0000
X-Inumbo-ID: daa80b86-a4d7-11ea-9dbe-bc764e2007e4
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id daa80b86-a4d7-11ea-9dbe-bc764e2007e4;
 Tue, 02 Jun 2020 13:49:18 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id d5so10860620ios.9
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oF/8KhHOgHMbkhjKw/xnVx3BTmm6D4iMvttQzgguYhI=;
 b=cQbZA+A50U1m+HC9Bi1/XuXXEqmsW1/7H4TCBvrJEteQlJMkUMY+cf/Cbi2XUYSv+I
 XSl/aMSo6Tk/Sgrumi/R8cYcbN/+gBz2+RzbXHiPlBD5WVAskoMetsya45vstrLoD8ZL
 B03qJiuZi3c7ITheHnmgfoghmhOEQS/3MzMlk1/GRZfhUkveQJMMAHaC1SIFWcG8VocQ
 APMUW/9SzrXPgYWn1yV2cHuNvCp8kIBMiuI5RKcWXniu7jFhfinIU5wLylZRpHKYr9CA
 MjKMGIyDHU3zIU4mFbFe2iFgO7kdFezvlirlmf7ZM0uvrN/0un/q9IymxaTV6NwjqEry
 qS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oF/8KhHOgHMbkhjKw/xnVx3BTmm6D4iMvttQzgguYhI=;
 b=SwKPkRKvWNEXJnylbujU6ajEOkESjEl3lk25rDagk0YjAqeRV9M6GlDcarBdz9l+pc
 f2/hXa3XVFdrfAG9mjF114A18Y2IVlMHs9jQcgREVD1BzP3IsXluVwyicuFRvXGWTicA
 6paiPXOecYjAovaNkyHtzsq5t+GEyPHZzDFLsxs+3DBGnxcr6npYiK6qTkG1gRZK/hKk
 ryB3hIqYYQLcoTKz+iCT0vTpSEeHlKqgrIQ+oyaIlh/Mg9BEABMMJV3WMDnMGYMXF9kI
 JnSsFfIg7pmANttj0RkdZZ1sdSnvHiwfanb54QiU1k+WX11cF+x9h4KuMrn/EneLFSUu
 i2jg==
X-Gm-Message-State: AOAM532wl6DKAmoG4AQZvzKWGL2apNZjRAYc7g+DBF+IXEg4BVdUprab
 /OeTjaozhMOls/8xnU3DHHtDuI8V3Po=
X-Google-Smtp-Source: ABdhPJx7ehSiQv4rgi7EvcxJkehaVspEalVhjAQC3QEvm30PjluqVTm0qwpP3xrPsodvXva/9GXfKQ==
X-Received: by 2002:a02:ac0a:: with SMTP id a10mr25417901jao.97.1591105754364; 
 Tue, 02 Jun 2020 06:49:14 -0700 (PDT)
Received: from localhost (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id p5sm1335943ilg.88.2020.06.02.06.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 06:49:12 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
Date: Tue,  2 Jun 2020 07:49:09 -0600
Message-Id: <20200602134909.66581-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.25.1
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

For the last couple years we have received numerous reports from users of
monitor vm_events of spurious guest crashes when using events. In particular,
it has observed that the problem occurs when vm_events are being disabled. The
nature of the guest crash varied widely and has only occured occasionally. This
made debugging the issue particularly hard. We had discussions about this issue
even here on the xen-devel mailinglist with no luck figuring it out.

The bug has now been identified as a race-condition between register event
handling and disabling the monitor vm_event interface.

Patch 96760e2fba100d694300a81baddb5740e0f8c0ee, "vm_event: deny register writes
if refused by  vm_event reply" is the patch that introduced the error. In this
patch the default behavior regarding emulation of register write events is
changed so that they get postponed until the corresponding vm_event handler
decides whether to allow such write to take place. Unfortunately this can only
be implemented by performing the deny/allow step when the vCPU gets scheduled.
Due to that postponed emulation of the event if the user decides to pause the
VM in the vm_event handler and then disable events, the entire emulation step
is skipped the next time the vCPU is resumed. Even if the user doesn't pause
during the vm_event handling but exits immediately and disables vm_event, the
situation becomes racey as disabling vm_event may succeed before the guest's
vCPUs get scheduled with the pending emulation task. This has been particularly
the case with VMS that have several vCPUs as after the VM is unpaused it may
actually take a long time before all vCPUs get scheduled.

In this patch we are reverting the default behavior to always perform emulation
of register write events when the event occurs. To postpone them can be turned
on as an option. In that case the user of the interface still has to take care
of only disabling the interface when its safe as it remains buggy.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/hvm/hvm.c            | 14 ++++++++------
 xen/arch/x86/hvm/monitor.c        | 13 ++++++++-----
 xen/arch/x86/monitor.c            | 10 +++++++++-
 xen/include/asm-x86/domain.h      |  1 +
 xen/include/asm-x86/hvm/monitor.h |  7 +++----
 xen/include/public/domctl.h       |  1 +
 6 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 74c9f84462..5bb47583b3 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3601,13 +3601,15 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
 
         ASSERT(v->arch.vm_event);
 
-        /* The actual write will occur in hvm_do_resume() (if permitted). */
-        v->arch.vm_event->write_data.do_write.msr = 1;
-        v->arch.vm_event->write_data.msr = msr;
-        v->arch.vm_event->write_data.value = msr_content;
+        if ( hvm_monitor_msr(msr, msr_content, msr_old_content) )
+        {
+            /* The actual write will occur in hvm_do_resume(), if permitted. */
+            v->arch.vm_event->write_data.do_write.msr = 1;
+            v->arch.vm_event->write_data.msr = msr;
+            v->arch.vm_event->write_data.value = msr_content;
 
-        hvm_monitor_msr(msr, msr_content, msr_old_content);
-        return X86EMUL_OKAY;
+            return X86EMUL_OKAY;
+        }
     }
 
     if ( (ret = guest_wrmsr(v, msr, msr_content)) != X86EMUL_UNHANDLEABLE )
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index 8aa14137e2..36894b33a4 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -53,11 +53,11 @@ bool hvm_monitor_cr(unsigned int index, unsigned long value, unsigned long old)
             .u.write_ctrlreg.old_value = old
         };
 
-        if ( monitor_traps(curr, sync, &req) >= 0 )
-            return 1;
+        return monitor_traps(curr, sync, &req) >= 0 &&
+            curr->domain->arch.monitor.control_register_values;
     }
 
-    return 0;
+    return false;
 }
 
 bool hvm_monitor_emul_unimplemented(void)
@@ -77,7 +77,7 @@ bool hvm_monitor_emul_unimplemented(void)
         monitor_traps(curr, true, &req) == 1;
 }
 
-void hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value)
+bool hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value)
 {
     struct vcpu *curr = current;
 
@@ -92,8 +92,11 @@ void hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value)
             .u.mov_to_msr.old_value = old_value
         };
 
-        monitor_traps(curr, 1, &req);
+        return monitor_traps(curr, 1, &req) >= 0 &&
+            curr->domain->arch.monitor.control_register_values;
     }
+
+    return false;
 }
 
 void hvm_monitor_descriptor_access(uint64_t exit_info,
diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
index bbcb7536c7..1517a97f50 100644
--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -144,7 +144,15 @@ int arch_monitor_domctl_event(struct domain *d,
                               struct xen_domctl_monitor_op *mop)
 {
     struct arch_domain *ad = &d->arch;
-    bool requested_status = (XEN_DOMCTL_MONITOR_OP_ENABLE == mop->op);
+    bool requested_status;
+
+    if ( XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS == mop->op )
+    {
+        ad->monitor.control_register_values = true;
+        return 0;
+    }
+
+    requested_status = (XEN_DOMCTL_MONITOR_OP_ENABLE == mop->op);
 
     switch ( mop->event )
     {
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index e8cee3d5e5..6fd94c2e14 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -418,6 +418,7 @@ struct arch_domain
          * This is used to filter out pagefaults.
          */
         unsigned int inguest_pagefault_disabled                            : 1;
+        unsigned int control_register_values                               : 1;
         struct monitor_msr_bitmap *msr_bitmap;
         uint64_t write_ctrlreg_mask[4];
     } monitor;
diff --git a/xen/include/asm-x86/hvm/monitor.h b/xen/include/asm-x86/hvm/monitor.h
index 66de24cb75..a75cd8545c 100644
--- a/xen/include/asm-x86/hvm/monitor.h
+++ b/xen/include/asm-x86/hvm/monitor.h
@@ -29,15 +29,14 @@ enum hvm_monitor_debug_type
 };
 
 /*
- * Called for current VCPU on crX/MSR changes by guest.
- * The event might not fire if the client has subscribed to it in onchangeonly
- * mode, hence the bool return type for control register write events.
+ * Called for current VCPU on crX/MSR changes by guest. Bool return signals
+ * whether emulation should be postponed.
  */
 bool hvm_monitor_cr(unsigned int index, unsigned long value,
                     unsigned long old);
 #define hvm_monitor_crX(cr, new, old) \
                         hvm_monitor_cr(VM_EVENT_X86_##cr, new, old)
-void hvm_monitor_msr(unsigned int msr, uint64_t value, uint64_t old_value);
+bool hvm_monitor_msr(unsigned int msr, uint64_t value, uint64_t old_value);
 void hvm_monitor_descriptor_access(uint64_t exit_info,
                                    uint64_t vmx_exit_qualification,
                                    uint8_t descriptor, bool is_write);
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 1ad34c35eb..cbcd25f12c 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1025,6 +1025,7 @@ struct xen_domctl_psr_cmt_op {
 #define XEN_DOMCTL_MONITOR_OP_DISABLE           1
 #define XEN_DOMCTL_MONITOR_OP_GET_CAPABILITIES  2
 #define XEN_DOMCTL_MONITOR_OP_EMULATE_EACH_REP  3
+#define XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS 4
 
 #define XEN_DOMCTL_MONITOR_EVENT_WRITE_CTRLREG         0
 #define XEN_DOMCTL_MONITOR_EVENT_MOV_TO_MSR            1
-- 
2.25.1


