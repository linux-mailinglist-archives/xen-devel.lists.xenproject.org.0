Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB5FB3F0D9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105402.1456371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjQ-0006MN-QI; Mon, 01 Sep 2025 22:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105402.1456371; Mon, 01 Sep 2025 22:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjQ-0006Jl-LE; Mon, 01 Sep 2025 22:10:32 +0000
Received: by outflank-mailman (input) for mailman id 1105402;
 Mon, 01 Sep 2025 22:10:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjP-00055o-5I
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:31 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 787b9eec-8780-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 00:10:29 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-55f720ffe34so2422009e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:29 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:27 -0700 (PDT)
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
X-Inumbo-ID: 787b9eec-8780-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764629; x=1757369429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+LNbMBKwYezbM5EFVtZ7DgCmMZXO6MyvOXCUpxJxe0=;
        b=bCJownRWF8EZOLTdvoJVuxGdEXwx3yuoi+/VNSQxmVMKJfJrmeNXqFU7OYEolzIZRX
         EQwvlwdu0UBku8xSb63HPpD5hrl77TKs63OHnZDjBI0WvbALfM4IYOBNALZOc1YVCdxu
         fXG+zl/fMhEDyYel4+d8E09S0V0nvFekHkgKvfWguEI1v2GXXHaNGrkKkt3fUyEZzHmb
         fL48eTzwjAIK384Bu0v6ej5uE4nZlk5nsCSICqtbAu4hc7QUd2ZR839EUiLtnKjv7SKM
         5v5uLtqpRUCL8y1+WS5P3REYHoEeq8isE5wfKhalXk8tteGwKmU3mMrccfc+Ire3UP+v
         BEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764629; x=1757369429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+LNbMBKwYezbM5EFVtZ7DgCmMZXO6MyvOXCUpxJxe0=;
        b=YYDUWaKos6KSJJMqtP7ktLNif3UiDsHeMQMCC15zBJ9znowBZSXQYtKovCwHJgPpfe
         d2jVLDTU3p2oNSwg6kx1ugc9tIcpSpODKhO9L8TwBym5K3yuV2MMRYbREdM0gmeCIyRN
         BOYg0AlTt3969JgzmbSgrHc4U7TcyBRRpo1l12utrdoJxvwy6Jmi7xC8fuCwnhPrO0KB
         yEBTvIVs+wxJW6SdgonjfMu6i1pU7jCRS/t3j2cTRGQBwXODKXN9UeHH1kmpVHiG91Vp
         JWNpsWFOj70g02qCHHQc6Ulc7EqwwVAAvGqC4AjyrCpcbEy04ihhN7RgleauDWESeemv
         HjDA==
X-Gm-Message-State: AOJu0YzyNsbX4ZFM0X1y7xdZpYBxsZi0wfJLe0pW/ELoM45zG/0yW3RN
	DSHvpFv0OtOhyQnk0V4KY3X8PlgwtS/MAs9lx0qI86dym0c/yXSp4d0nZ6PGFGPF
X-Gm-Gg: ASbGnctnHwkRWqsMmslDb1PCSHDiUBY+yn31zweN4qCkBeAfsmN27RbplFwfmbPnZaQ
	1IPlJukAKC9nB8DLY2HiA+G5tiVEC4BfK0mT6JPPRGdY0tZG4C8r9bxnEEbsHcTxutZb/cnybNx
	3ghrR5SLK9C/LTnpGdafWf99Q1ojccX/LSaef3GItazVHpL5OHCKqzwd21xghCdfrM2Ca7z83/R
	GwWFqp/RHC8uCCsf5BL1BP6aQ3Xljh9lWiNBH6yYry8Y8K6OAeaqzInPI1JtRXC3LCHLI8Fl/6E
	VXmZ0gKUggoKSQ70BJId0TETYYyaVOWUkh0tiDHL2Kg3nqsZ/TI2NNYw0VL7JyuvtTJEqX7oHeW
	JnYhHh/IQ9Vdbf0QSGMDDd87LH3mS6KeTjIMSMLI2vp4PJCEkyEHy00jJrPDH/cxH7+6L1SbXd1
	fs7zvq3Bc=
X-Google-Smtp-Source: AGHT+IEa5RjJ2GSGquDO+Z4AQEB5nVu4GpDaAJNmK102svb69HNEnk3KnmcyEzQrF2S0OM2mun/7QA==
X-Received: by 2002:ac2:58e9:0:b0:55f:67c6:be48 with SMTP id 2adb3069b0e04-55f6f6ab662mr1948372e87.1.1756764628474;
        Mon, 01 Sep 2025 15:10:28 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 06/13] xen/arm: irq: Restore state of local IRQs during system resume
Date: Tue,  2 Sep 2025 01:10:10 +0300
Message-ID: <18c51957660441c945d51b02be965fbcc19c7c2b.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
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
Changes in V6:
- Call handler->disable() instead of just setting the _IRQ_DISABLED flag
- Move the system state check outside of restore_local_irqs_on_resume()
---
 xen/arch/arm/irq.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 6c899347ca..ddd2940554 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -116,6 +116,41 @@ static int init_local_irq_data(unsigned int cpu)
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
+        /* Disable the IRQ to avoid assertions in the following calls */
+        desc->handler->disable(desc);
+        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
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
@@ -134,6 +169,10 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
                    cpu);
         break;
+    case CPU_STARTING:
+        if ( system_state == SYS_STATE_resume )
+            restore_local_irqs_on_resume();
+        break;
     }
 
     return notifier_from_errno(rc);
-- 
2.48.1


