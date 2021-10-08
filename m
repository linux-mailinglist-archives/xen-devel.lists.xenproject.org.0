Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A223742645F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 07:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204382.359573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYisv-0005Cu-Qo; Fri, 08 Oct 2021 05:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204382.359573; Fri, 08 Oct 2021 05:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYisv-0005A2-N7; Fri, 08 Oct 2021 05:57:33 +0000
Received: by outflank-mailman (input) for mailman id 204382;
 Fri, 08 Oct 2021 05:57:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipo1=O4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mYirz-0007cA-LU
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 05:56:35 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1a5985e-d9d4-4899-ba40-1f09609fc514;
 Fri, 08 Oct 2021 05:55:51 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id x27so34444531lfa.9
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 22:55:51 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f8sm151147lfq.168.2021.10.07.22.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 22:55:49 -0700 (PDT)
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
X-Inumbo-ID: e1a5985e-d9d4-4899-ba40-1f09609fc514
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QzbdatLhIl735gEkyVNBitnIXpDdRUzSTDD+uCEX6MU=;
        b=delfA489Q6cYlsvzBgsyUqfs6iLyZQojMZXOZNSwi//ru9d8tTsLGXpsmknxxB7Jsf
         ZUbfObRS5KNvOd0qpW50+0TYPDWbbXEkauxVwusgL44a1sXP3EZlokGC61Psf69fHkxI
         39zJKW1KlmMq4vHyErctSXOFuIlT7QNFKk+R5UEd9UvzB3L98tGOi6BcpGi2kORktaV7
         y0Mx8B7/9qD8/kkLtxr2O1PoKrhMHPt7xRghBTTQKocHOX/cNsQfaVD/mfz029w3OJLM
         ZjvEU0ieFo+XXapzq2iTxW9nOs1E3nddcNmGPs0TERFn/Ile/6ay43Rc+JAGrIo3jNG/
         XqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QzbdatLhIl735gEkyVNBitnIXpDdRUzSTDD+uCEX6MU=;
        b=wFLPl5hpKafF3mI+jT7U61Lvn+2Wnt4tEnEZbJrHdn+XgBgZ5XSzd/N7o/4NuD6/4Z
         cMONh+NJJpsw1PPf8rhN/FjXJhMi4IETC8mYUPNvpGA0gILPNMDNFn1S5tAMBtYMroLh
         CLwqZ/Nurl8yD+3i52mJvo9fr5MD5hxBozrIano8cboZjsm1O4Oo6aU156IITclu7zJR
         rALpPPnZQLRI26VozeUB2S5XxFSppIxKY+BxY34z0AOM89pCeuFy2s6NUDx5DALehnyy
         MkXbKkFuCXgW0R2aVpTNvsBHluFXKRlhGDxTmU68WQ02VKP5yxlrvFe5g5v7YDlpPExf
         41+Q==
X-Gm-Message-State: AOAM530arnUNA4HC2NVQTEJwlPtFg7sLOOe8Hl54rDX0Tj8HbhtdWVTy
	WYkyOx30ITbwvCVKgyQUz9cOR9V5UYc=
X-Google-Smtp-Source: ABdhPJywjRTSBxfY5U+W2M3mS/L+w/EHBGcH55u4Oms0eFyTgaDV5BEqEg7Hc9R8uhCncZW9thfM2w==
X-Received: by 2002:ac2:5506:: with SMTP id j6mr8519664lfk.91.1633672549926;
        Thu, 07 Oct 2021 22:55:49 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v5 10/10] xen/arm: Process pending vPCI map/unmap operations
Date: Fri,  8 Oct 2021 08:55:35 +0300
Message-Id: <20211008055535.337436-11-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008055535.337436-1-andr2000@gmail.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
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
[x86 changes]
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>

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
index aa418a3ca1b7..c491242e4b8b 100644
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


