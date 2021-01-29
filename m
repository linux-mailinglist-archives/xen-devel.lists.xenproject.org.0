Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5FD30837B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77625.140732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J3y-0006sB-UB; Fri, 29 Jan 2021 01:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77625.140732; Fri, 29 Jan 2021 01:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J3y-0006rB-ON; Fri, 29 Jan 2021 01:59:06 +0000
Received: by outflank-mailman (input) for mailman id 77625;
 Fri, 29 Jan 2021 01:59:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5IvW-0004da-Lj
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:50:22 +0000
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bedd6eb8-f922-434f-9d06-20c2c723c811;
 Fri, 29 Jan 2021 01:49:22 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id f19so8727026ljn.5
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:22 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:20 -0800 (PST)
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
X-Inumbo-ID: bedd6eb8-f922-434f-9d06-20c2c723c811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J8Q+NbbfOYPSxHuBJx+zfYkWiARdAR8S5Uvx+xX0BfA=;
        b=Jjep4zr3UhqrSeIHdGssd6JksZpaqYeuPw9KyUEeBCN7elRBbF0moB865viv3iHgSo
         +JGDIbFDCHf+RNOUUFkmZGVWvil8uiUKuCXXE9yURSa+Ft/2MlgI4H4YM9SXsWfNexz9
         ssF9caR+lwPVQq30Ayns6EOYhDnKygKeO2dy9mH3u2OMyRncBnve2fA0Gwr+s16ljMLK
         vyTYbfwdFo1KOKE6CkN8BqAwOhhgH/pfsXmzEipqV4nmnz9fCAdvM8n9IlgX4QnbmrfX
         +YviyhQ5WNv+RQQWL3VB1cHeCIby7BsxXNAotJcfTPrrUq6FzhDw8hlcnqe0sqZ8bTJy
         xSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J8Q+NbbfOYPSxHuBJx+zfYkWiARdAR8S5Uvx+xX0BfA=;
        b=sylojfWhdZVgno7JNnrXKyCPtZ096evPCjB4ZEDJvkth3EVY8psoBCsXBrFRrv58Tp
         IsZY0M8EBMpFsY+X/sl6750J+9qJ+3uWjKvQDlKfPzmJjYgZ+chrA/0kmGwZw/ckH7or
         8wavSQBiZvmm414UEz6+7OPSWoQH5KtaezahVCRaa1azrWnte6fyLDbh+YgscVMXSQsZ
         cJ1+0p+T+hxICr4sj6Bj4VbT6t5V7bRZYi4kc1cYQmOlnhrgolzCCUUEJ41s2ME0n2S8
         i4ZKblTNOd3nFAOKdoTk5md78ideO2csPEaB50NWiugSB6vWssmS1O5hs+e8ZQ5UbYOa
         bhIw==
X-Gm-Message-State: AOAM530i2xRo41b+fZ3/raNvwMApw5h8KXHXM+nf83R4d12/yeeQkg2d
	dMTq/qklNLCg1UafP6vDSLV7yAdLiusvlA==
X-Google-Smtp-Source: ABdhPJzEBOBx24c+tcYLLrrcPo5wbVjdcfZT3+cHR9T25pn+6+yxuJkL9xX8SKTw6mYHmAU22DMeVA==
X-Received: by 2002:a2e:9c88:: with SMTP id x8mr1166570lji.409.1611884961181;
        Thu, 28 Jan 2021 17:49:21 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V6 15/24] xen/arm: Call vcpu_ioreq_handle_completion() in check_for_vcpu_work()
Date: Fri, 29 Jan 2021 03:48:43 +0200
Message-Id: <1611884932-1851-16-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds remaining bits needed for the IOREQ support on Arm.
Besides just calling vcpu_ioreq_handle_completion() we need to handle
it's return value to make sure that all the vCPU works are done before
we return to the guest (the vcpu_ioreq_handle_completion() may return
false if there is vCPU work to do or IOREQ state is invalid).
For that reason we use an unbounded loop in leave_hypervisor_to_guest().

The worse that can happen here if the vCPU will never run again
(the I/O will never complete). But, in Xen case, if the I/O never
completes then it most likely means that something went horribly
wrong with the Device Emulator. And it is most likely not safe
to continue. So letting the vCPU to spin forever if the I/O never
completes is a safer action than letting it continue and leaving
the guest in unclear state and is the best what we can do for now.

Please note, using this loop we will not spin forever on a pCPU,
preventing any other vCPUs from being scheduled. At every loop
we will call check_for_pcpu_work() that will process pending
softirqs. In case of failure, the guest will crash and the vCPU
will be unscheduled. In normal case, if the rescheduling is necessary
the vCPU will be rescheduled to give place to someone else.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Julien Grall <jgrall@amazon.com>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch, changes were derived from (+ new explanation):
     arm/ioreq: Introduce arch specific bits for IOREQ/DM features

Changes V2 -> V3:
   - update patch description

Changes V3 -> V4:
   - update patch description and comment in code

Changes V4 -> V5:
   - add Stefano's R-b
   - update patch subject/description and comment in code,
     was "xen/arm: Stick around in leave_hypervisor_to_guest until I/O has completed"
   - change loop logic a bit
   - squash with changes to check_for_vcpu_work() from patch #14

Changes V5 -> V6:
   - add Julien's A-b

---
---
 xen/arch/arm/traps.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 8848764..cb37a45 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -21,6 +21,7 @@
 #include <xen/hypercall.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
+#include <xen/ioreq.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
 #include <xen/mem_access.h>
@@ -2269,12 +2270,23 @@ static void check_for_pcpu_work(void)
  * Process pending work for the vCPU. Any call should be fast or
  * implement preemption.
  */
-static void check_for_vcpu_work(void)
+static bool check_for_vcpu_work(void)
 {
     struct vcpu *v = current;
 
+#ifdef CONFIG_IOREQ_SERVER
+    bool handled;
+
+    local_irq_enable();
+    handled = vcpu_ioreq_handle_completion(v);
+    local_irq_disable();
+
+    if ( !handled )
+        return true;
+#endif
+
     if ( likely(!v->arch.need_flush_to_ram) )
-        return;
+        return false;
 
     /*
      * Give a chance for the pCPU to process work before handling the vCPU
@@ -2285,6 +2297,8 @@ static void check_for_vcpu_work(void)
     local_irq_enable();
     p2m_flush_vm(v);
     local_irq_disable();
+
+    return false;
 }
 
 /*
@@ -2297,7 +2311,13 @@ void leave_hypervisor_to_guest(void)
 {
     local_irq_disable();
 
-    check_for_vcpu_work();
+    /*
+     * check_for_vcpu_work() may return true if there are more work to before
+     * the vCPU can safely resume. This gives us an opportunity to deschedule
+     * the vCPU if needed.
+     */
+    while ( check_for_vcpu_work() )
+        check_for_pcpu_work();
     check_for_pcpu_work();
 
     vgic_sync_to_lrs();
-- 
2.7.4


