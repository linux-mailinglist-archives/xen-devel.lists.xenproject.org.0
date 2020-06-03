Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72C01ED036
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 14:53:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgSsv-0001R3-23; Wed, 03 Jun 2020 12:52:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecxI=7Q=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jgSst-0001Qy-8P
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 12:52:43 +0000
X-Inumbo-ID: 1cd95be2-a599-11ea-8993-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cd95be2-a599-11ea-8993-bc764e2007e4;
 Wed, 03 Jun 2020 12:52:42 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id x202so1659999oix.11
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 05:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TI9bV+LeMVxfdt8lcpN5FNLTi4bVZXWnT3tiy2sCbRI=;
 b=E9GQUJjq8yL4WVda/KAG/4p1XS8/EyBKH+3kntmWoYZleJfi/1S/ulX0WPTx/fnjiA
 OIeCKlHLVMFnZxWwY5pdsHBmCArKjhy2RkuNcCwtcjywWFydtEb7UjQBzGqGY92KDcb/
 ITuRQJpS1FYT9TVvLAGlNSadM++If1X1oyqJcauW0VHVaJuEE6QQ2Yerj+S+sjJ/rXP2
 OAMKv9OTRMtGqChbOooPwf3+OGDIMbAHFGHsxn/VlT3Ofm8SgFJcyG4jnnQ+cqxKqv2A
 bfV1qYoNdEVQsg72PNOvJPoNd93issxs52vgIf1beaIXUu18R7RnLyANwWSNPO7DrUJl
 BMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TI9bV+LeMVxfdt8lcpN5FNLTi4bVZXWnT3tiy2sCbRI=;
 b=Ew8YSg3dKZJJKUE+6ILmtRQT7LdLdLdzk5zmnLdI1i7GZe7mz/1oVlrTbtPf9IYLP4
 xWDV8l1BkNzfY+qbmrcRxA8h0B2Mc7bIqADNWWLiJ5qZCOTT1vXSTTCklucq45vYeTdG
 X08JmiDDdqCE768zoQf8dItUHsicwCa1zWe8Rs27Oz840Vbe/ivUql2hJ0rUk/WWqFDS
 9BEQ9Tanzj3HX457Go+MLHu/ZmvTNcZLJoS4V4s7+bFkxeY9UnxJBY6FfKJTGwRdePiK
 0f7BEzVD7zVzeFX5AnUFpniC6dHQYfeDgndiKI31/JOHSnDgSUgsEBgaz3xxGyjEtHaY
 kZ1w==
X-Gm-Message-State: AOAM531wI1p565KR6Zz7ZI/RqC7+SPpATdRbjz+ukuyBW+9rafhL3QRa
 7OzDbKG6ld3y8dmAFtqHKOOM+LUduVQ=
X-Google-Smtp-Source: ABdhPJx3zN5OBrSLzPMWqgMC1+eM4NK2sJzjVscfJyr+3jaLdle6IneNwN6us47Q/rxyn1/hxoiiSA==
X-Received: by 2002:a54:460f:: with SMTP id p15mr5890733oip.84.1591188761256; 
 Wed, 03 Jun 2020 05:52:41 -0700 (PDT)
Received: from localhost (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id 89sm471962oth.9.2020.06.03.05.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 05:52:40 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
Date: Wed,  3 Jun 2020 06:52:37 -0600
Message-Id: <20200603125237.100041-1-tamas@tklengyel.com>
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
handling and disabling the monitor vm_event interface. The default behavior
regarding emulation of register write events is changed so that they get
postponed until the corresponding vm_event handler decides whether to allow such
write to take place. Unfortunately this can only be implemented by performing the
deny/allow step when the vCPU gets scheduled.

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

Fixes: 96760e2fba10 ('vm_event: deny register writes if refused by vm_event
reply').

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/hvm/hvm.c            | 14 ++++++++------
 xen/arch/x86/hvm/monitor.c        | 13 ++++++++-----
 xen/include/asm-x86/domain.h      |  1 +
 xen/include/asm-x86/hvm/monitor.h |  7 +++----
 xen/include/asm-x86/monitor.h     |  4 ++++
 xen/include/public/domctl.h       |  6 ++++++
 6 files changed, 30 insertions(+), 15 deletions(-)

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
index 8aa14137e2..e4a09964a0 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -53,11 +53,11 @@ bool hvm_monitor_cr(unsigned int index, unsigned long value, unsigned long old)
             .u.write_ctrlreg.old_value = old
         };
 
-        if ( monitor_traps(curr, sync, &req) >= 0 )
-            return 1;
+        return monitor_traps(curr, sync, &req) >= 0 &&
+               curr->domain->arch.monitor.control_register_values;
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
+               curr->domain->arch.monitor.control_register_values;
     }
+
+    return false;
 }
 
 void hvm_monitor_descriptor_access(uint64_t exit_info,
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
diff --git a/xen/include/asm-x86/monitor.h b/xen/include/asm-x86/monitor.h
index 4afb0665e8..01c6d63bb9 100644
--- a/xen/include/asm-x86/monitor.h
+++ b/xen/include/asm-x86/monitor.h
@@ -59,6 +59,10 @@ int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
         domain_unpause(d);
         break;
 
+    case XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS:
+        d->arch.monitor.control_register_values = true;
+        break;
+
     default:
         rc = -EOPNOTSUPP;
     }
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 1ad34c35eb..59bdc28c89 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1025,6 +1025,12 @@ struct xen_domctl_psr_cmt_op {
 #define XEN_DOMCTL_MONITOR_OP_DISABLE           1
 #define XEN_DOMCTL_MONITOR_OP_GET_CAPABILITIES  2
 #define XEN_DOMCTL_MONITOR_OP_EMULATE_EACH_REP  3
+/*
+ * Control register feature can result in guest-crashes when the monitor
+ * subsystem is being turned off. User has to take special precautions
+ * to ensure all vCPUs have resumed before it is safe to turn it off.
+ */
+#define XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS 4
 
 #define XEN_DOMCTL_MONITOR_EVENT_WRITE_CTRLREG         0
 #define XEN_DOMCTL_MONITOR_EVENT_MOV_TO_MSR            1
-- 
2.25.1


