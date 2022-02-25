Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261284C3FCC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:11:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278778.476151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVhU-0006iE-18; Fri, 25 Feb 2022 08:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278778.476151; Fri, 25 Feb 2022 08:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVhT-0006gN-Sa; Fri, 25 Feb 2022 08:11:39 +0000
Received: by outflank-mailman (input) for mailman id 278778;
 Fri, 25 Feb 2022 08:11:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTA2=TI=gmail.com=baijiaju1990@srs-se1.protection.inumbo.net>)
 id 1nNVhS-0006gH-5J
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:11:38 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d40efaf-9612-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 09:11:36 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id d28so3227302wra.4
 for <xen-devel@lists.xenproject.org>; Fri, 25 Feb 2022 00:11:37 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.58])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b0037c00e01771sm5215190wms.34.2022.02.25.00.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 00:11:35 -0800 (PST)
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
X-Inumbo-ID: 8d40efaf-9612-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=UBLS7I7dklf7q80OfnsV44HmdpezS2KIc4AWPPfOP04=;
        b=VmMDQhXZmW4KDOJcfBmlCBg33brjp9/FsvEsQq7AffkbjS1GeappduvSErrFoHJCPH
         4xVqaTIfaNjdXXrn4CqxUSvsL006OkvNj7yqrfLpVd0Z52/JQ9gUjeWYtz6Yc68FhtKG
         jU3N4MsHypNSnstReXP0RnnZO9RTAkFEYromKyn1uYaGYpphZXkwPGdSSNFabKe6EIt8
         HWw6x1CDGsRjItQCpqpsawyGOJTtoQXC/t9q7nIvSAyArxgpm+fJA5mQDoCdHb6QKqG8
         0M5wBFSvZP1A6mkfw5cvFRmDYS2qleDoxRbH7NoIo7DqZs2OKcFLHEKhujpMyzKbT9OI
         zsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UBLS7I7dklf7q80OfnsV44HmdpezS2KIc4AWPPfOP04=;
        b=R8/Z2xc76hAcftCMRU7m1YSvDyPAgEn1uk0d8GB31md2Ks/HM6KGD3RotdBYUtaAa3
         CLDq/kDYRR0ooJzw59CcZmF5YVPxsdRTMqH4Z4TgE+DPw9YknQcIsu0r/7G77uSxfai5
         K9FfhawoHJXXvbsPb1GkZHfxN92/iT9Yluo2wtnjTGtMWqpgwTwASyt37OaoKkj4e8lq
         7TX1Hcgw3t+l2G6LzrvTmAXZGu4SA9dRkr9GcWZK4Zx7v1ObuQd5qiFZiHHTskye81ik
         u2CDiH8k1869e2MY81AsMw1n5aty7WPGKKPZoZzlNosgde6Z6GGZGk5KhiKKzqmV/LqA
         mtFA==
X-Gm-Message-State: AOAM532nT3nmCG5pfiu11Y/D1PwCR3VWLVuB0RZfsMJLfLUpsWXIM/I0
	APq+q8XBmtrGGMtLiY5looc=
X-Google-Smtp-Source: ABdhPJyCDoikK7f54V0mXZagQeuhGKw7xJp/PtqFade8F1gSuFIJPWK8WRRBh+uUcFbVeU632u363Q==
X-Received: by 2002:a5d:6389:0:b0:1ed:bc35:cda4 with SMTP id p9-20020a5d6389000000b001edbc35cda4mr5307355wru.350.1645776696385;
        Fri, 25 Feb 2022 00:11:36 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com
Cc: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] arch: x86: xen: check the return value of kasprintf()
Date: Fri, 25 Feb 2022 00:11:21 -0800
Message-Id: <20220225081121.18803-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1

The function kasprintf() can fail, but there is no check of its return
value. To fix this bug, its return value should be checked with new
error handling code.

Fixes: f87e4cac4f4e ("xen: SMP guest support")
Fixes: 83b96794e0ea ("x86/xen: split off smp_pv.c")
Fixes: d5de8841355a ("x86: split spinlock implementations out into their own files")
Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 arch/x86/xen/smp.c      | 2 ++
 arch/x86/xen/smp_pv.c   | 2 ++
 arch/x86/xen/spinlock.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/x86/xen/smp.c b/arch/x86/xen/smp.c
index c3e1f9a7d43a..91261390f8c0 100644
--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@ -65,6 +65,8 @@ int xen_smp_intr_init(unsigned int cpu)
 	char *resched_name, *callfunc_name, *debug_name;
 
 	resched_name = kasprintf(GFP_KERNEL, "resched%d", cpu);
+	if (!resched_name)
+		return -ENOMEM;
 	rc = bind_ipi_to_irqhandler(XEN_RESCHEDULE_VECTOR,
 				    cpu,
 				    xen_reschedule_interrupt,
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 4a6019238ee7..7d1471fd1267 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -118,6 +118,8 @@ int xen_smp_intr_init_pv(unsigned int cpu)
 	char *callfunc_name, *pmu_name;
 
 	callfunc_name = kasprintf(GFP_KERNEL, "irqwork%d", cpu);
+	if (!callfunc_name)
+		return -ENOMEM;
 	rc = bind_ipi_to_irqhandler(XEN_IRQ_WORK_VECTOR,
 				    cpu,
 				    xen_irq_work_interrupt,
diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 043c73dfd2c9..ccdb9eddd93b 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -75,6 +75,8 @@ void xen_init_lock_cpu(int cpu)
 	     cpu, per_cpu(lock_kicker_irq, cpu));
 
 	name = kasprintf(GFP_KERNEL, "spinlock%d", cpu);
+	if (!name)
+		return;
 	irq = bind_ipi_to_irqhandler(XEN_SPIN_UNLOCK_VECTOR,
 				     cpu,
 				     dummy_handler,
-- 
2.17.1


