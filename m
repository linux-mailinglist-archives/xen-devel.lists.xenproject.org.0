Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F109E23E4CF
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 01:50:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3pdz-0004Sp-HI; Thu, 06 Aug 2020 23:49:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3pdx-0004FE-Mw
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 23:49:53 +0000
X-Inumbo-ID: 65196a16-6859-4420-b545-0fc5d466942c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65196a16-6859-4420-b545-0fc5d466942c;
 Thu, 06 Aug 2020 23:49:41 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 247E3221E2;
 Thu,  6 Aug 2020 23:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596757781;
 bh=fI8sUwAia9oJeCWiNXgbqAhwYFTIQGUCuTFqxFs8WNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LW3TnvpD+CyGwfYRt8OjItPvI8tVr0URGSRNUGwRNk6Cc3Y9/KJFUZ0JICZnPoG3g
 t3HiKoftepNBqtWOFUQ9XtnBmA3+Y+rXwErRidWFIxdf0LbV0JD/YYjnLxG4TBudZa
 DxQ7KWE+SiblsFcKVJuIyRAJJmSEJ22gznSkYpag=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 09/14] kernel-doc: public/sched.h
Date: Thu,  6 Aug 2020 16:49:28 -0700
Message-Id: <20200806234933.16448-9-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jbeulich@suse.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/sched.h | 129 ++++++++++++++++++++++++++-----------
 1 file changed, 92 insertions(+), 37 deletions(-)

diff --git a/xen/include/public/sched.h b/xen/include/public/sched.h
index 811bd87c82..6f36c3748a 100644
--- a/xen/include/public/sched.h
+++ b/xen/include/public/sched.h
@@ -29,41 +29,50 @@
 
 #include "event_channel.h"
 
-/*
- * `incontents 150 sched Guest Scheduler Operations
+/**
+ * DOC: Guest Scheduler Operations
  *
  * The SCHEDOP interface provides mechanisms for a guest to interact
  * with the scheduler, including yield, blocking and shutting itself
  * down.
  */
 
-/*
+/**
+ * DOC: HYPERVISOR_sched_op
+ *
  * The prototype for this hypercall is:
- * ` long HYPERVISOR_sched_op(enum sched_op cmd, void *arg, ...)
  *
- * @cmd == SCHEDOP_??? (scheduler operation).
- * @arg == Operation-specific extra argument(s), as described below.
- * ...  == Additional Operation-specific extra arguments, described below.
+ * long HYPERVISOR_sched_op(enum sched_op cmd, void *arg, ...)
+ *
+ * - @cmd == SCHEDOP_??? (scheduler operation).
+ * - @arg == Operation-specific extra argument(s), as described below.
+ * - ...  == Additional Operation-specific extra arguments, described below.
  *
  * Versions of Xen prior to 3.0.2 provided only the following legacy version
  * of this hypercall, supporting only the commands yield, block and shutdown:
+ *
  *  long sched_op(int cmd, unsigned long arg)
- * @cmd == SCHEDOP_??? (scheduler operation).
- * @arg == 0               (SCHEDOP_yield and SCHEDOP_block)
- *      == SHUTDOWN_* code (SCHEDOP_shutdown)
+ *
+ * - @cmd == SCHEDOP_??? (scheduler operation).
+ * - @arg == 0               (SCHEDOP_yield and SCHEDOP_block)
+ * -      == SHUTDOWN_* code (SCHEDOP_shutdown)
  *
  * This legacy version is available to new guests as:
- * ` long HYPERVISOR_sched_op_compat(enum sched_op cmd, unsigned long arg)
+ *
+ * long HYPERVISOR_sched_op_compat(enum sched_op cmd, unsigned long arg)
  */
 
 /* ` enum sched_op { // SCHEDOP_* => struct sched_* */
-/*
- * Voluntarily yield the CPU.
- * @arg == NULL.
+
+/**
+ * DOC: SCHEDOP_yield
+ * Voluntarily yield the CPU. @arg == NULL.
  */
 #define SCHEDOP_yield       0
 
-/*
+/**
+ * DOC: SCHEDOP_block
+ *
  * Block execution of this VCPU until an event is received for processing.
  * If called with event upcalls masked, this operation will atomically
  * reenable event delivery and check for pending events before blocking the
@@ -72,7 +81,9 @@
  */
 #define SCHEDOP_block       1
 
-/*
+/**
+ * DOC: SCHEDOP_shutdown
+ *
  * Halt execution of this domain (all VCPUs) and notify the system controller.
  * @arg == pointer to sched_shutdown_t structure.
  *
@@ -87,14 +98,18 @@
  */
 #define SCHEDOP_shutdown    2
 
-/*
+/**
+ * DOC: SCHEDOP_poll
+ *
  * Poll a set of event-channel ports. Return when one or more are pending. An
  * optional timeout may be specified.
  * @arg == pointer to sched_poll_t structure.
  */
 #define SCHEDOP_poll        3
 
-/*
+/**
+ * DOC: SCHEDOP_remote_shutdown
+ *
  * Declare a shutdown for another domain. The main use of this function is
  * in interpreting shutdown requests and reasons for fully-virtualized
  * domains.  A para-virtualized domain may use SCHEDOP_shutdown directly.
@@ -102,14 +117,18 @@
  */
 #define SCHEDOP_remote_shutdown        4
 
-/*
+/**
+ * DOC: SCHEDOP_shutdown_code
+ *
  * Latch a shutdown code, so that when the domain later shuts down it
  * reports this code to the control tools.
  * @arg == sched_shutdown_t, as for SCHEDOP_shutdown.
  */
 #define SCHEDOP_shutdown_code 5
 
-/*
+/**
+ * DOC: SCHEDOP_watchdog
+ *
  * Setup, poke and destroy a domain watchdog timer.
  * @arg == pointer to sched_watchdog_t structure.
  * With id == 0, setup a domain watchdog timer to cause domain shutdown
@@ -119,7 +138,9 @@
  */
 #define SCHEDOP_watchdog    6
 
-/*
+/**
+ * DOC: SCHEDOP_pin_override
+ *
  * Override the current vcpu affinity by pinning it to one physical cpu or
  * undo this override restoring the previous affinity.
  * @arg == pointer to sched_pin_override_t structure.
@@ -132,12 +153,19 @@
 #define SCHEDOP_pin_override 7
 /* ` } */
 
+/**
+ * struct sched_shutdown
+ */
 struct sched_shutdown {
-    unsigned int reason; /* SHUTDOWN_* => enum sched_shutdown_reason */
+    /** @reason: SHUTDOWN_* => enum sched_shutdown_reason */
+    unsigned int reason;
 };
 typedef struct sched_shutdown sched_shutdown_t;
 DEFINE_XEN_GUEST_HANDLE(sched_shutdown_t);
 
+/**
+ * struct sched_poll
+ */
 struct sched_poll {
     XEN_GUEST_HANDLE(evtchn_port_t) ports;
     unsigned int nr_ports;
@@ -146,39 +174,62 @@ struct sched_poll {
 typedef struct sched_poll sched_poll_t;
 DEFINE_XEN_GUEST_HANDLE(sched_poll_t);
 
+/**
+ * struct sched_remote_shutdown
+ */
 struct sched_remote_shutdown {
-    domid_t domain_id;         /* Remote domain ID */
-    unsigned int reason;       /* SHUTDOWN_* => enum sched_shutdown_reason */
+    /** @domain_id: Remote domain ID */
+    domid_t domain_id;
+    /** @reason: SHUTDOWN_* => enum sched_shutdown_reason */
+    unsigned int reason;
 };
 typedef struct sched_remote_shutdown sched_remote_shutdown_t;
 DEFINE_XEN_GUEST_HANDLE(sched_remote_shutdown_t);
 
+/**
+ * struct sched_watchdog
+ */
 struct sched_watchdog {
-    uint32_t id;                /* watchdog ID */
-    uint32_t timeout;           /* timeout */
+    /** @id: watchdog ID */
+    uint32_t id;
+    /** @timeout: timeout */
+    uint32_t timeout;
 };
 typedef struct sched_watchdog sched_watchdog_t;
 DEFINE_XEN_GUEST_HANDLE(sched_watchdog_t);
 
+/**
+ * struct sched_pin_override
+ */
 struct sched_pin_override {
     int32_t pcpu;
 };
 typedef struct sched_pin_override sched_pin_override_t;
 DEFINE_XEN_GUEST_HANDLE(sched_pin_override_t);
 
-/*
- * Reason codes for SCHEDOP_shutdown. These may be interpreted by control
- * software to determine the appropriate action. For the most part, Xen does
- * not care about the shutdown code.
+/**
+ * DOC: Reason codes for SCHEDOP_shutdown
+ *
+ * These may be interpreted by control software to determine the
+ * appropriate action. For the most part, Xen does not care about the
+ * shutdown code.
+ *
+ * - SHUTDOWN_poweroff: Domain exited normally. Clean up and kill.
+ * - SHUTDOWN_reboot:   Clean up, kill, and then restart.
+ * - SHUTDOWN_suspend:  Clean up, save suspend info, kill.
+ * - SHUTDOWN_crash:    Tell controller we've crashed.
+ * - SHUTDOWN_watchdog: Restart because watchdog time expired.
  */
 /* ` enum sched_shutdown_reason { */
-#define SHUTDOWN_poweroff   0  /* Domain exited normally. Clean up and kill. */
-#define SHUTDOWN_reboot     1  /* Clean up, kill, and then restart.          */
-#define SHUTDOWN_suspend    2  /* Clean up, save suspend info, kill.         */
-#define SHUTDOWN_crash      3  /* Tell controller we've crashed.             */
-#define SHUTDOWN_watchdog   4  /* Restart because watchdog time expired.     */
+#define SHUTDOWN_poweroff   0
+#define SHUTDOWN_reboot     1
+#define SHUTDOWN_suspend    2
+#define SHUTDOWN_crash      3
+#define SHUTDOWN_watchdog   4
 
-/*
+/**
+ * DOC: SHUTDOWN_soft_reset
+ *
  * Domain asked to perform 'soft reset' for it. The expected behavior is to
  * reset internal Xen state for the domain returning it to the point where it
  * was created but leaving the domain's memory contents and vCPU contexts
@@ -186,7 +237,11 @@ DEFINE_XEN_GUEST_HANDLE(sched_pin_override_t);
  * interfaces again.
  */
 #define SHUTDOWN_soft_reset 5
-#define SHUTDOWN_MAX        5  /* Maximum valid shutdown reason.             */
+/**
+ * DOC: SHUTDOWN_MAX
+ * Maximum valid shutdown reason
+ */
+#define SHUTDOWN_MAX        5
 /* ` } */
 
 #endif /* __XEN_PUBLIC_SCHED_H__ */
-- 
2.17.1


