Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB7ACAB25
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002947.1382420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16M-000149-E4; Mon, 02 Jun 2025 09:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002947.1382420; Mon, 02 Jun 2025 09:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16M-0000xn-9U; Mon, 02 Jun 2025 09:05:02 +0000
Received: by outflank-mailman (input) for mailman id 1002947;
 Mon, 02 Jun 2025 09:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM16L-0007kh-6a
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:05:01 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a94a2ed8-3f90-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 11:04:59 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55220699ba8so5134319e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:04:59 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdc3sm1507541e87.176.2025.06.02.02.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:04:58 -0700 (PDT)
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
X-Inumbo-ID: a94a2ed8-3f90-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855099; x=1749459899; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLtZvLmNS5IQ5nQywV+KESH/yusLqzvm5c+C1sq8VQE=;
        b=ZI6qqWrhzS7h7+3frDr+CYM7CAaAxcp4CfwrFfUakAtDva5BHNjlh50FLoTRLHQzMG
         wkyTjMl6cGeMxW1njm/PKcDpProuJEa1FcVX4CKQm77WOOQ0zOiKovwzV/Bn3NfSWYuM
         6VGwUp54NsmO5F00OPe70O6jaN5A5dc3Kui6DKfPhfEHaUe+/8ZEEJDRXcdfAq69GTDs
         am2NkT2GHzQ20nKI/Po+4nwKkjct1dsflb6o1WYG4b5haWuNxkGC2gvArCYTIRYQ11Ny
         ncVhpUFEOabhO5kabtZHggfPR7+CVK/nCk7pI5eIrWe/X73gz8+9Qc0Wnm4DGF2Jb3C4
         eI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855099; x=1749459899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLtZvLmNS5IQ5nQywV+KESH/yusLqzvm5c+C1sq8VQE=;
        b=r8RfCvmE/GB7aO1FXW4s5ErzP5KW47yHxb2kofW8Gy3IHwSv5adWvZRhpXsYT9mRcn
         2uPEeyQhki/gb52g8UMTOtY0fq17TGEmI1iN62C0TTc0hEyEs2ZlSELBwQlir8FwPAv2
         WservR/cXepMdCYw/6shY6Z3+X+r8mGUY3yyg/XievJAoJAfWRDWEOZv0QfrQ4B2sbzE
         RrdMxjIcKbLiZ7ysRK6WCIQ3PNUewSio4XFpLL68wr6XCQ2Akm+mg8oBBoPo0t9oKvf3
         dcG1+AFDtiNAXBPiYPshbg0Fa2vmbihCccW40RI8i3SfoOtAYR6fqmjrb1EjmDLLAcSV
         629Q==
X-Gm-Message-State: AOJu0YwUx+DzBVvTQ6SPf1iAMQ9CrKprQZFgbxXut4IYnIxkIeP4q/9i
	zhuzoY3fzxvn0SS+oKtTW1uYwCzpiHier03NooYrWjj0fhYMMxE6Zye9IZg0ReRw
X-Gm-Gg: ASbGnctnsjJp8ZuBCj3jQ7PgBsT2U6izBiVKLl1BfpXomkDGTHYo8LaYDfKtqAwm3vW
	JY/68jokWsaB2vyiLVVRy0gJEvOAaTHrGk3J3IGyki85N+ftLn5XLrPtnTUF+90jYUotMi5ZWjE
	/jTCe03JwsriFe+f+dIm3A2b+7pFRWh9Knnue1SP3Uovj7Io9UXwRWCrNrLT+o2Tdz7z3/tsOdX
	YP9aSJX0PW4z1FE8KppwxX/EO5bXBvipEL6HvSfDsi23XTUaFNsu2tJSAG0NzkVz48iAjrIZhZI
	uRKjFgffRuqInV7K7FqUJYccdK0829eR2w04PQMI580qyS5nG5rW/6WZOJw/V2I9+DPODgjFFjZ
	sEJThol4GB/s98KPz4HFK+NvBIw==
X-Google-Smtp-Source: AGHT+IEvX585OOmt7ZiEiMyg7i6PA8bef54WnayP0mdDtUFr/dnbjwdOuWJmj0LjXKmXClWMsr03gg==
X-Received: by 2002:a05:6512:3d13:b0:550:e5c4:b0a1 with SMTP id 2adb3069b0e04-5533d13e73dmr2804533e87.11.1748855098750;
        Mon, 02 Jun 2025 02:04:58 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xakep.amatop@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4][PART 2 06/10] xen/arm: irq: Restore state of local IRQs during system resume
Date: Mon,  2 Jun 2025 12:04:17 +0300
Message-ID: <8cbea1b2335ba0f2ea189c653c62bd591882b295.1748848482.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748848482.git.mykola_kvach@epam.com>
References: <cover.1748848482.git.mykola_kvach@epam.com>
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
index 372716a73b..f32f8b56ca 100644
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


