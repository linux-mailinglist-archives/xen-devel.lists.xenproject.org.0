Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4726B216C7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077950.1439004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS1-00073P-PL; Mon, 11 Aug 2025 20:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077950.1439004; Mon, 11 Aug 2025 20:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS1-00070H-Ie; Mon, 11 Aug 2025 20:49:01 +0000
Received: by outflank-mailman (input) for mailman id 1077950;
 Mon, 11 Aug 2025 20:49:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZS0-00063z-H7
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:49:00 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a5429d9-76f4-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 22:48:58 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ae0bde4d5c9so907144566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:48:58 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:48:56 -0700 (PDT)
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
X-Inumbo-ID: 9a5429d9-76f4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945337; x=1755550137; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2qe+4To2d8/snjQhUCMC9AqGLOoTxivgLe2IekgTVE=;
        b=jQejmo/yC4pihO7Ag8Fsjgj6EbaWTt8Sr6ami7kPJBsBBwB+ebKFLSHtW5hUIVuROh
         aqNIc1lYkQntdVqwB10pIVjsxwafjbadTpdqjhid5Xxwv1KDaTj6q/L5qXByRD6btf8R
         batDYLAReobfrAPW7QWHQh+9myXFYwsDl0tB44FDeHhIf6dzXNCDkGbbSz+IjnGV8Xcg
         tOQ75CNO9LcaO4EN3GeRbSuv5//+VdSgcOejGEHXUV4lPgDSM4sg/X3JCKQKy3rbmHgO
         tbadLq2pBSfm9NOijkk2DB6g+a+Y1hR+bTu3h6CVc7T2B1DF93Z3+i4XCpEi/PmzDUCf
         9ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945337; x=1755550137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2qe+4To2d8/snjQhUCMC9AqGLOoTxivgLe2IekgTVE=;
        b=rGUWrlru8UPN0Mct1LSyg1D1+JNJT+j4WJXRpYockoxaVwViMg5QLu9BaFJZEsE5y8
         0Jo3FQCYFjX7svfhIVtxt9IJLuxjel7iSMYuaGL5P2b3mIGbnNe+XwTx5D5cXR2skX38
         DQLVQoJ1jsqWDAYmF9zm6cVvbMXjBsI6GQnRbpRawBlONEP8UKHkxZ3zE/SqgU7H/UO3
         3AjAi6PhK7MvnGo1yhLIGr3xWfCglAwi34GyHzHFV8wY9E0fJas+xXTCTSeDcYakorf3
         6SQwVQPrBeKqLIvIMtacBfJbTniYPYrYZQ+zmE0H8ADfeMoFmUqk9dfROx7GL1VMwMD/
         S6YQ==
X-Gm-Message-State: AOJu0YygocUMG7P2N44Bpi6A/6laG1PYY7/3GFuVyIm+EtKQ9ulorEz2
	D/tb2o8TooSxSGbt8lHorRj4YW2zs6ZQGyTrk4AbhWn0S1W8es7ncTLw38Xwkg==
X-Gm-Gg: ASbGncsQecLd4ZPkEGmy1z0dU1m28+xUBPgKH/dId39BEcQIoxigwhOPTqaAD6eaQBw
	9XN+bX3qBQd68XJLzF/YyGLT72dutEhf6WV6MjzjM2pRaTLkf+dmgXTuQcwOP9BI+Eq3fK0bbOg
	syBDEDH9nq4I+qC2B3AevWNsvaiOpcJWFDRXbFSZJE9K5KYzRgHjcTLSSyxEjZwJYxOg7UAe5PI
	QjktrgSsYexGn7WEpbB7VBnyxdGEpWGuAZNtAGDIeKldGxndAW8wHJ3QMWrgaFLi4LNNqC2+sT+
	ICF3V77WrUxw/XkFc4q/dkKGDoEz15CjXwXn7upM2xn6U2yDNbK1S7baIAr8oKiY78AwkP+bj8U
	YWA2zw5KgWt+iQHnX5amSoCQPDu6NuhMfSPdzWoY6nlb134jA2QOQ3T+ZosYOxtWv3C4=
X-Google-Smtp-Source: AGHT+IHdCavzk8aGLAAEau1dbT80tWOU/vCYdkrblwV5rQHlaJaQKN+3lli5Az81ynaQ9zYS83kj3g==
X-Received: by 2002:a17:906:f59f:b0:ad5:2e5b:d16b with SMTP id a640c23a62f3a-afa1e0290bcmr80256266b.27.1754945337329;
        Mon, 11 Aug 2025 13:48:57 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 06/12] xen/arm: irq: Restore state of local IRQs during system resume
Date: Mon, 11 Aug 2025 23:48:02 +0300
Message-ID: <779a90853f249f8d8c4973874baeee1f787e92e0.1754943875.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

On ARM, the first 32 interrupts (SGIs and PPIs) are banked per-CPU
and not restored by gic_resume (for secondary cpus).

This patch introduces restore_local_irqs_on_resume, a function that
restores the state of local interrupts on the target CPU during
system resume.

It iterates over all local IRQs and re-enables those that were not
disabled, reprogramming their routing and affinity accordingly.

The function is invoked from start_secondary, ensuring that local IRQ
state is restored early during CPU bring-up after suspend.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/irq.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 148f184f8b..b3ff38dc27 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -113,6 +113,47 @@ static int init_local_irq_data(unsigned int cpu)
     return 0;
 }
 
+/*
+ * The first 32 interrupts (PPIs and SGIs) are per-CPU,
+ * so call this function on the target CPU to restore them.
+ *
+ * SPIs are restored via gic_resume.
+ */
+static void restore_local_irqs_on_resume(void)
+{
+    int irq;
+
+    if ( system_state != SYS_STATE_resume )
+        return;
+
+    spin_lock(&local_irqs_type_lock);
+
+    for ( irq = 0; irq < NR_LOCAL_IRQS; irq++ )
+    {
+        struct irq_desc *desc = irq_to_desc(irq);
+
+        spin_lock(&desc->lock);
+
+        if ( test_bit(_IRQ_DISABLED, &desc->status) )
+        {
+            spin_unlock(&desc->lock);
+            continue;
+        }
+
+        /* it is needed to avoid asserts in below calls */
+        set_bit(_IRQ_DISABLED, &desc->status);
+
+        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
+
+        /* _IRQ_DISABLED is cleared by below call */
+        desc->handler->startup(desc);
+
+        spin_unlock(&desc->lock);
+    }
+
+    spin_unlock(&local_irqs_type_lock);
+}
+
 static int cpu_callback(struct notifier_block *nfb, unsigned long action,
                         void *hcpu)
 {
@@ -131,6 +172,9 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
                    cpu);
         break;
+    case CPU_STARTING:
+        restore_local_irqs_on_resume();
+        break;
     }
 
     return notifier_from_errno(rc);
-- 
2.48.1


