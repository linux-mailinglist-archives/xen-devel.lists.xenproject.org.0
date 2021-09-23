Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A571E415F07
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194139.345912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOIH-0004hs-Hw; Thu, 23 Sep 2021 12:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194139.345912; Thu, 23 Sep 2021 12:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOIH-0004eP-Br; Thu, 23 Sep 2021 12:57:41 +0000
Received: by outflank-mailman (input) for mailman id 194139;
 Thu, 23 Sep 2021 12:57:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOGS-0004it-4i
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:55:48 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf44b32d-d9fe-4f80-a0a0-a5c01915bd04;
 Thu, 23 Sep 2021 12:54:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i25so26492013lfg.6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:54:54 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l7sm453584lfk.52.2021.09.23.05.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:54:53 -0700 (PDT)
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
X-Inumbo-ID: bf44b32d-d9fe-4f80-a0a0-a5c01915bd04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HNTngv5ONOEO5gpzLyGmdvTGyFjpzr3RFglNf5/7Wm8=;
        b=MQjwcQdvOef1lREXofpeWL8/hQj819MvOexAPoO/+yK43KhOF8+lTN/74YVCe2+PZX
         cLlHsy60bn2dnjMUUiJeS54azNeSD/fAJA1zzqv/xntDTbsGFBNzFU/Rrg1paOYaT5IU
         NMuYaT3azDD9cH9ObvJXcliJQAbvqMHPbaKj/qY8c+KDyIvbDpz2QBwnvpWTbIxWNVwW
         RQltD2fhQ3TObamBbgOjbByRtpB1fZitsEbEPyIz3icTBeF3TUi2pSGhE7+5kiwUktKi
         MGouv5VkY3Db/bu2cOZTzdogcoa8ane8TMtqA7scSmEN6UqIwQ6RLMzxIqE7QgXSEyHf
         q1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HNTngv5ONOEO5gpzLyGmdvTGyFjpzr3RFglNf5/7Wm8=;
        b=qWOewXG0PCc3ox5YtxTTPUHkZ69FuexJaH9vAmMgrpabceVMD5fOnZCThfzj86eKaY
         1vJiIqE5UvbVBMJnVZQMF6kC/uDQ6Hca8BgC+OXs4MoLwfiEclLd1GoO/R9tKU6lGtCB
         yfTLjtIsLxFBLBIZKoG0zqk3+lhtwSd3Rj7CUcFUielj7n/mRDyA474OL/JUyiX/2Tb8
         qcBtlvmYm74m3FUv9yRKsWlJx5ZubVWuljk2I9DX6b+U+I0s9dgwhgYtNjKsZnfXdkvb
         ZtYr5h/qGrXOVrOuc8O0MrOvD8sLzDhBoDLmHSudQpH6kvPvl4RvV6uPlRFmaJODEFgt
         pe8g==
X-Gm-Message-State: AOAM530Hll+bwNI111fplKR7l43D82E+BLlruONj6LPsZkvZEDExGq7Z
	2O6m3O7Br0LWTw/MKqPMVffd6wLqcdQ5uw==
X-Google-Smtp-Source: ABdhPJycKsS0ZD76qSoGLuJUcMkJfAL1kNCC9tMBeWWfrb3lwIIN2AJTC93++bij/sHp820gH1XtOg==
X-Received: by 2002:ac2:442f:: with SMTP id w15mr3929533lfl.491.1632401693567;
        Thu, 23 Sep 2021 05:54:53 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 11/11] xen/arm: Process pending vPCI map/unmap operations
Date: Thu, 23 Sep 2021 15:54:38 +0300
Message-Id: <20210923125438.234162-12-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125438.234162-1-andr2000@gmail.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

vPCI may map and unmap PCI device memory (BARs) being passed through which
may take a lot of time. For this those operations may be deferred to be
performed later, so that they can be safely preempted.
Run the corresponding vPCI code while switching a vCPU.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v1:
 - Moved the check for pending vpci work from the common IOREQ code
   to hvm_do_resume on x86
 - Re-worked the code for Arm to ensure we don't miss pending vPCI work
---
 xen/arch/arm/traps.c   | 13 +++++++++++++
 xen/arch/x86/hvm/hvm.c |  6 ++++++
 xen/common/ioreq.c     |  9 ---------
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 219ab3c3fbde..b246f51086e3 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -34,6 +34,7 @@
 #include <xen/symbols.h>
 #include <xen/version.h>
 #include <xen/virtual_region.h>
+#include <xen/vpci.h>
 
 #include <public/sched.h>
 #include <public/xen.h>
@@ -2304,6 +2305,18 @@ static bool check_for_vcpu_work(void)
     }
 #endif
 
+    if ( has_vpci(v->domain) )
+    {
+        bool pending;
+
+        local_irq_enable();
+        pending = vpci_process_pending(v);
+        local_irq_disable();
+
+        if ( pending )
+            return true;
+    }
+
     if ( likely(!v->arch.need_flush_to_ram) )
         return false;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7b48a1b925bb..d32f5d572941 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -549,6 +549,12 @@ void hvm_do_resume(struct vcpu *v)
     if ( !vcpu_ioreq_handle_completion(v) )
         return;
 
+    if ( has_vpci(v->domain) && vpci_process_pending(v) )
+    {
+        raise_softirq(SCHEDULE_SOFTIRQ);
+        return;
+    }
+
     if ( unlikely(v->arch.vm_event) )
         hvm_vm_event_do_resume(v);
 
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index d732dc045df9..689d256544c8 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -25,9 +25,7 @@
 #include <xen/lib.h>
 #include <xen/paging.h>
 #include <xen/sched.h>
-#include <xen/softirq.h>
 #include <xen/trace.h>
-#include <xen/vpci.h>
 
 #include <asm/guest_atomics.h>
 #include <asm/ioreq.h>
@@ -212,19 +210,12 @@ static bool wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
 
 bool vcpu_ioreq_handle_completion(struct vcpu *v)
 {
-    struct domain *d = v->domain;
     struct vcpu_io *vio = &v->io;
     struct ioreq_server *s;
     struct ioreq_vcpu *sv;
     enum vio_completion completion;
     bool res = true;
 
-    if ( has_vpci(d) && vpci_process_pending(v) )
-    {
-        raise_softirq(SCHEDULE_SOFTIRQ);
-        return false;
-    }
-
     while ( (sv = get_pending_vcpu(v, &s)) != NULL )
         if ( !wait_for_io(sv, get_ioreq(s, v)) )
             return false;
-- 
2.25.1


