Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9238B445FB5
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222025.384068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misnE-0002KU-1b; Fri, 05 Nov 2021 06:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222025.384068; Fri, 05 Nov 2021 06:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misnD-0002E9-OI; Fri, 05 Nov 2021 06:33:39 +0000
Received: by outflank-mailman (input) for mailman id 222025;
 Fri, 05 Nov 2021 06:33:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1misnC-0000uf-BP
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:33:38 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ed02a88-3e02-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:33:37 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id r4so28862671edi.5
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:33:37 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id e12sm3599870ejs.86.2021.11.04.23.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:33:36 -0700 (PDT)
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
X-Inumbo-ID: 4ed02a88-3e02-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sGK8Pm6RypWgXJkvMD4+e3RPRWZCdgGUZOOGFT2QhCc=;
        b=i7ywQryvHdyLIfZJGgicojKb9SnEXWuT1Bj9bVk6hTWVxo91p52uTyU0HR4FNKFYZi
         dzeslv82jS4cHhWqhsCvXNG2exjYcpMtDAUG34M7SW1HF0uO+8xJHz2QGPMgtRiDKXxB
         2vLLz098HV7e4qaeu21VvmDtBjsxw4gUaTAbAJra8dzuPQ+YQxw3P/WlRDwtPvmaDC2Q
         vPwdfNV1vYMzdN35G97zbyD2CMph+IHMZXd1rQA5JCUKRrHbw8ykvIbB/EjAcDM8SEJq
         p+V2alnGb9FUbkYler+gX0VXQssM37lXJu13di3G0eGc2Lg1D2o5TAW2/uI65DBUpkei
         D3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sGK8Pm6RypWgXJkvMD4+e3RPRWZCdgGUZOOGFT2QhCc=;
        b=hAbZUx9ZPAKocGyZ+cvNcgaxAHdFZ+2ahqlMA3MnWmhde4M5bg2RAZQlzphb8SCVLN
         MQUvHbQimbCf1v99jBesJ6Iefz/61wZpBS1NuEWCMgze6lSkpuEoWbywyVU3XioP7E+y
         XIz6+25k+zyTB9f1T5cBcxSUlBaGCGMBFaKd3RnEhTR4mWpyok2aLs61H4QQd3LYuo0x
         a7aBB5EWGK8WBZPZy2/iGnjdQ/VUAjtnc98Moy++/4wsoOCEFo/USX9kmy0tTTSBaZX1
         aABW3bpND5bb7QUYpNG5U1dArUInoWJ9hdDhgEA9cdzlWCjvpF7xSakJFZpN1DTJvkQT
         itJA==
X-Gm-Message-State: AOAM530AMHmToPNvFqJ/LQvhoOyABCNT2s+Iyg859Iesj6s25fjWgS9I
	vJw/n/zwxTHhXy5PP4V2+gIvCwsx8dqS3g==
X-Google-Smtp-Source: ABdhPJxj576TShH4DBFMpmVbDp7CpVwPbsc9NWydnsmtIkF+CjmzVn+aOPMN4Hce10ZKTtAbYmEdww==
X-Received: by 2002:a17:906:c187:: with SMTP id g7mr67130837ejz.534.1636094016970;
        Thu, 04 Nov 2021 23:33:36 -0700 (PDT)
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
Subject: [PATCH v6 6/7] xen/arm: process pending vPCI map/unmap operations
Date: Fri,  5 Nov 2021 08:33:25 +0200
Message-Id: <20211105063326.939843-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105063326.939843-1-andr2000@gmail.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>

Since v5:
 - check_for_vcpu_work: vPCI addition is moved before the
   vcpu_ioreq__handle_completion(v). This is to avoid differences
   with the x86 version. (Julien)
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
index 219ab3c3fbde..8757210a798b 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -34,6 +34,7 @@
 #include <xen/symbols.h>
 #include <xen/version.h>
 #include <xen/virtual_region.h>
+#include <xen/vpci.h>
 
 #include <public/sched.h>
 #include <public/xen.h>
@@ -2290,6 +2291,18 @@ static bool check_for_vcpu_work(void)
 {
     struct vcpu *v = current;
 
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
 #ifdef CONFIG_IOREQ_SERVER
     if ( domain_has_ioreq_server(v->domain) )
     {
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index eee365711d63..096a61b7ea02 100644
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


