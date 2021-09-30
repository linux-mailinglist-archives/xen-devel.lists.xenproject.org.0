Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017BD41D456
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199438.353529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqJc-0001dA-3V; Thu, 30 Sep 2021 07:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199438.353529; Thu, 30 Sep 2021 07:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqJb-0001b1-W5; Thu, 30 Sep 2021 07:17:11 +0000
Received: by outflank-mailman (input) for mailman id 199438;
 Thu, 30 Sep 2021 07:17:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqH0-0004B3-BD
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:14:30 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93ee8183-6f97-4d4d-abc4-45984e718a69;
 Thu, 30 Sep 2021 07:13:39 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x27so21403290lfu.5
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:13:39 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y3sm267835lfh.132.2021.09.30.00.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:13:38 -0700 (PDT)
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
X-Inumbo-ID: 93ee8183-6f97-4d4d-abc4-45984e718a69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kkjiAREPfgf5h7Wy+LaOiO2DkflhH8+fOSmHBO3xXoo=;
        b=n1p4J0xc5EcdU1E6lwrvdv3FPUzNKkurjTyMdCLcMChhvN3HWpV6H/wS+bys/5fzrD
         m8dZmv640qhzH1JBFUK/WGgaMIckyYxAD+g3zIu2xKQyrQ6pCqT6W8ih3CoiSrboZz0b
         BuiGlhmHlYc6MC2nXi8UUQAgUduMgeCQ7FjpbcBWUpb/pwp/tUl2PUg69rXnunj/9w42
         a6TNcmIiSyeRw/3L8y+Fh3+DLPAuybhQxQFk4HprAGlLnzluUf+IIZ834a80OyD2AljH
         w1zmf87nMP4V4oflrC0O5vhbSKyhkasge0M1y838mvE1dTQIL00//cZaMAdbPoRAiiDu
         tOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kkjiAREPfgf5h7Wy+LaOiO2DkflhH8+fOSmHBO3xXoo=;
        b=Nj7IImJ7D5XRQgjdxfW7tORkBzP9oDr+ruaPtC+orOn0T4LVLFRpU5BkD3drI8Sg9z
         +91rJC8DG4RcZIqc/F1v1F4P2CCamv6pKFpWJAccXJBgisJ043LthFrfIuiJaeq6qTDS
         YZF7mWxJi3IR7KiIr+mnqk2IgK0hvYTNSOr33RU9vj5Pbg35wW5qsUv69EQSnrQDune/
         ctbuhuX5JXurXRDwXYkZJHllxfrVnvrWpQV026ZzZC742ClZSay3HY5PHHsSR9Gr6xqq
         JlbHVVgS8i9J8ncWkLHn2UZJ3txfTweAjTHnbfeTSZldMMuwvBFJxhkTTdpK/k4sHNX6
         GyEg==
X-Gm-Message-State: AOAM532cerGvYL4CiOxxMSdXWz2TTt+2zd9eklDsPrWOjnJSNY5ZULnA
	5KEorH1gCMClr5B7je85vhoWjNTtkqo=
X-Google-Smtp-Source: ABdhPJyLQMp8dJHYSa+Pdww4/1nbcTrHpwgOpkBAqfeXXjEnwv9CdhpTtc4T4AAV0iwYluKZM/Jtlg==
X-Received: by 2002:a2e:8e90:: with SMTP id z16mr4165430ljk.513.1632986018612;
        Thu, 30 Sep 2021 00:13:38 -0700 (PDT)
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
Subject: [PATCH v3 11/11] xen/arm: Process pending vPCI map/unmap operations
Date: Thu, 30 Sep 2021 10:13:26 +0300
Message-Id: <20210930071326.857390-12-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930071326.857390-1-andr2000@gmail.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

vPCI may map and unmap PCI device memory (BARs) being passed through which
may take a lot of time. For this those operations may be deferred to be
performed later, so that they can be safely preempted.

Currently this deferred processing is happening in common IOREQ code
which doesn't seem to be the right place for x86 and is even more
doubtful because IOREQ may not be enabled for Arm at all.
So, for Arm the pending vPCI work may have no chance to be executed
if the processing is left as is in the common IOREQ code only.
For that reason make vPCI processing happen in arch specific code.

Please be aware that there are a few outstanding TODOs affecting this
code path, see xen/drivers/vpci/header.c:map_range and
xen/drivers/vpci/header.c:vpci_process_pending.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v2:
 - update commit message with more insight on x86, IOREQ and Arm
 - restored order of invocation for IOREQ and vPCI processing (Jan)
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
index 7b48a1b925bb..38bf697c5b04 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -546,6 +546,12 @@ void hvm_do_resume(struct vcpu *v)
 
     pt_restore_timer(v);
 
+    if ( has_vpci(v->domain) && vpci_process_pending(v) )
+    {
+        raise_softirq(SCHEDULE_SOFTIRQ);
+        return;
+    }
+
     if ( !vcpu_ioreq_handle_completion(v) )
         return;
 
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


