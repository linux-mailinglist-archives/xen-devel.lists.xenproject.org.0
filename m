Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A23545B614
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 09:00:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230149.397929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC7-0007L8-AB; Wed, 24 Nov 2021 07:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230149.397929; Wed, 24 Nov 2021 07:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC6-0007B5-QF; Wed, 24 Nov 2021 07:59:54 +0000
Received: by outflank-mailman (input) for mailman id 230149;
 Wed, 24 Nov 2021 07:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYi7=QL=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mpnC5-0006a3-0s
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:59:53 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80fc7e82-4cfc-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 08:59:52 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id 207so3571506ljf.10
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 23:59:52 -0800 (PST)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i24sm1750358ljm.135.2021.11.23.23.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:59:51 -0800 (PST)
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
X-Inumbo-ID: 80fc7e82-4cfc-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bjFZpW48zi8kzMV1Qalht/WLcDbP0OlhtteqBSVp5Go=;
        b=o9w9CKOl5vt2YPplpPGhxiD6QtvA0G30Yn3IsLXwoPEBfB2WV9r7Ec8mEVY3vJDMFB
         UUinnnxrNOOZ+baitvt4EWvoHFtqz9KQ3ob8Ak7lRGjpGTQTcvzVJRPSRO2/SwADczE0
         zlLCk+f4el2PplaQ/PvHY6GNm812jti1cwjCd7+P/z6Ifi/9N5IPzP9mRbbKmCxehh30
         IC2061KUkFdYApXcMf0Ffsj0KOEUqnrFHsg/nKsEiNTyQq7zQ7KBnnfV1O4Fx03A6KEc
         5z59SqTLN4YuF/7OOWI0UfohgXgSubDs2Z5Z0kLLxF8zVjFCdvEw1tWHB0gFCMknY77/
         PMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bjFZpW48zi8kzMV1Qalht/WLcDbP0OlhtteqBSVp5Go=;
        b=fa5BdvbFxDFgOoUCnxDMvGbSlRY1Ku7LDHyjI/YHlPUpkXvRhyg6RL87ZmCEO78uhM
         17f71EAxLyaJbAu0CsZufw/i8K349Ca2y7rVFVIjGx3vxDWNB+uAVgxhNeh+4mwfy9vE
         cqdDsyz/SeMmNwLp3ROLr6xrjxiW+PbYjiK1r/6UXzWW+DgJMZvGD068ASBNuysR2aDD
         g7nHt44iLoKUBeQoWV2WvwS/hW791D/EgbdqaAbz+GZTX7+OcPpEK3FLBlg5YdGak37L
         QlAyInPh/0HfMuEyMab+StsIJ9dhXdDtGXPP5grzQWHsKvR8f6gu0R1RI5LnTFkZQT/7
         ZGzg==
X-Gm-Message-State: AOAM5304qVxvSC0TKWLUCby19eoFYbylt2BL+C918houulNJtTwijkpe
	39JI+H3ks/oTDOfY6c/I61NtlR9puQ+elw==
X-Google-Smtp-Source: ABdhPJyX2l/icfyS9QZFeP5bbqeK5COGfFR6aGciFju2+RQ8jtec3iR+467q9jAbwxflHePDSqKNJQ==
X-Received: by 2002:a2e:870b:: with SMTP id m11mr12691327lji.20.1637740791614;
        Tue, 23 Nov 2021 23:59:51 -0800 (PST)
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 6/7] xen/arm: process pending vPCI map/unmap operations
Date: Wed, 24 Nov 2021 09:59:41 +0200
Message-Id: <20211124075942.2645445-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124075942.2645445-1-andr2000@gmail.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
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
[x86 part]
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
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


