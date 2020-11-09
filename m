Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742FB2AB897
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 13:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22472.48833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dT-0004F0-NF; Mon, 09 Nov 2020 12:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22472.48833; Mon, 09 Nov 2020 12:51:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dT-0004EC-JV; Mon, 09 Nov 2020 12:51:03 +0000
Received: by outflank-mailman (input) for mailman id 22472;
 Mon, 09 Nov 2020 12:51:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc6dR-0003tf-Gi
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:01 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8ab388e-186e-4278-85b1-ae6cd3f5dd61;
 Mon, 09 Nov 2020 12:50:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v18so10142740ljc.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:40 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 04:50:39 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc6dR-0003tf-Gi
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:01 +0000
X-Inumbo-ID: c8ab388e-186e-4278-85b1-ae6cd3f5dd61
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c8ab388e-186e-4278-85b1-ae6cd3f5dd61;
	Mon, 09 Nov 2020 12:50:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v18so10142740ljc.3
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=elscKxOwLIVI2A3WOH0c4hFjfpu+AwWsnBd8zoJ5TOA=;
        b=tcBYbtRH2U39Q1/VskmmFKup9IujI+FTY0QpLU5U/Yh07iYlW+oqc2viPjbmGpZahi
         r4yzVmyJBqSCQ+G+mjsVmM2o/9WqseNIo20QzBFJkj8ETEKmLQSec4Eg10kgzjaocY87
         VAMGGUMrPrqy4LUCnoKGM1v48QgSrYcgvBWeokYCMJdJ1Xz+8zZKiECPhs/pZ3yMOXml
         AWUkDBaLJfnEHcWrFdm7+I6bMTbFfT5bkxReyUDS7yITWvsiD55px+35Z1vjh4IqlHzV
         DiFLMCqIZ+tAtySx9n8FN3jVRl3oqVn8QU/xXFlvQKTlngXL9YOvCP8KE1lgMCyVk9jA
         tUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=elscKxOwLIVI2A3WOH0c4hFjfpu+AwWsnBd8zoJ5TOA=;
        b=g4kfgPFmAUOCQoi3Dk1Apr6uFRSLccSFgV9WyC08IRRaCKCRsLsJX0SgMJgeYvMkPu
         xVfTFOr4DQzywa8PX4hisQZ7uy2FriZ8KMrwnqgIH+cEmbDZidukk134AZvdm/6Li7+g
         nS6fflZbG8U/sFABCPBr86e/uFs8NLmhdVLcn/ydFpcjeJZgO4UFEPgdj04xsQIfgJsY
         QGsEwScVLUJFLmsXTd1luNydk1SBfLW5LX9fcC118qu0e0u77Jf+r7jKmgIC7kM/mphQ
         9FsXSRmv7RqUWowWmgQ6boAjoVhuGlKMCgOB/7sEl/ZshlHoCK1xY2gFWqQi158wKsB/
         dotA==
X-Gm-Message-State: AOAM532s+JcMK00HURZdCAghgQVG1rjJPFgrKGkACMRPxXWTeVuOxKsp
	q2HxWrQnbING5VmRiVy2TOo=
X-Google-Smtp-Source: ABdhPJx5rXKcbnC2dQR2fqaqdXLLpOHbJpRTETelBk1X2W2GGtWTbGTJqdBYK60sg1nIaSGbU2Z2TA==
X-Received: by 2002:a2e:5d4:: with SMTP id 203mr6214273ljf.137.1604926239612;
        Mon, 09 Nov 2020 04:50:39 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:50:39 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Rahul.Singh@arm.com,
	Bertrand.Marquis@arm.com,
	julien.grall@arm.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	wl@xen.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 05/10] xen/arm: Process pending vPCI map/unmap operations
Date: Mon,  9 Nov 2020 14:50:26 +0200
Message-Id: <20201109125031.26409-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109125031.26409-1-andr2000@gmail.com>
References: <20201109125031.26409-1-andr2000@gmail.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

vPCI may map and unmap PCI device memory (BARs) being passed through which
may take a lot of time. For this those operations may be deferred to be
performed later, so that they can be safely preempted.
Run the corresponding vPCI code while switching a vCPU.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/traps.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 8f40d0e0b6b1..1c54dc0cdd51 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -33,6 +33,7 @@
 #include <xen/symbols.h>
 #include <xen/version.h>
 #include <xen/virtual_region.h>
+#include <xen/vpci.h>
 
 #include <public/sched.h>
 #include <public/xen.h>
@@ -2253,6 +2254,11 @@ static void check_for_vcpu_work(void)
 {
     struct vcpu *v = current;
 
+    local_irq_enable();
+    if ( has_vpci(v->domain) && vpci_process_pending(v) )
+        raise_softirq(SCHEDULE_SOFTIRQ);
+    local_irq_disable();
+
     if ( likely(!v->arch.need_flush_to_ram) )
         return;
 
-- 
2.17.1


