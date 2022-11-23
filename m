Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E2D636533
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 17:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447669.704166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxsCQ-0007Op-H3; Wed, 23 Nov 2022 16:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447669.704166; Wed, 23 Nov 2022 16:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxsCQ-0007N0-Ch; Wed, 23 Nov 2022 16:02:10 +0000
Received: by outflank-mailman (input) for mailman id 447669;
 Wed, 23 Nov 2022 16:02:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFfC=3X=huawei.com=xiujianfeng@srs-se1.protection.inumbo.net>)
 id 1oxsCP-0007Mi-GZ
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 16:02:09 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cbd76ff-6b48-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 17:02:07 +0100 (CET)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NHQq14xjjzRpDj;
 Thu, 24 Nov 2022 00:01:33 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 00:02:03 +0800
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
X-Inumbo-ID: 2cbd76ff-6b48-11ed-91b6-6bf2151ebd3b
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <jgross@suse.com>, <boris.ostrovsky@oracle.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <jeremy@goop.org>
CC: <x86@kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] x86/xen: Fix memory leak in xen_init_lock_cpu()
Date: Wed, 23 Nov 2022 23:58:58 +0800
Message-ID: <20221123155858.11382-3-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221123155858.11382-1-xiujianfeng@huawei.com>
References: <20221123155858.11382-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected

In xen_init_lock_cpu(), the @name has allocated new string by kasprintf(),
if bind_ipi_to_irqhandler() fails, it should be freed, otherwise may lead
to a memory leak issue, fix it.

Fixes: 2d9e1e2f58b5 ("xen: implement Xen-specific spinlocks")
Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 arch/x86/xen/spinlock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 043c73dfd2c9..5c6fc16e4b92 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -75,6 +75,7 @@ void xen_init_lock_cpu(int cpu)
 	     cpu, per_cpu(lock_kicker_irq, cpu));
 
 	name = kasprintf(GFP_KERNEL, "spinlock%d", cpu);
+	per_cpu(irq_name, cpu) = name;
 	irq = bind_ipi_to_irqhandler(XEN_SPIN_UNLOCK_VECTOR,
 				     cpu,
 				     dummy_handler,
@@ -85,7 +86,6 @@ void xen_init_lock_cpu(int cpu)
 	if (irq >= 0) {
 		disable_irq(irq); /* make sure it's never delivered */
 		per_cpu(lock_kicker_irq, cpu) = irq;
-		per_cpu(irq_name, cpu) = name;
 	}
 
 	printk("cpu %d spinlock event irq %d\n", cpu, irq);
@@ -98,6 +98,8 @@ void xen_uninit_lock_cpu(int cpu)
 	if (!xen_pvspin)
 		return;
 
+	kfree(per_cpu(irq_name, cpu));
+	per_cpu(irq_name, cpu) = NULL;
 	/*
 	 * When booting the kernel with 'mitigations=auto,nosmt', the secondary
 	 * CPUs are not activated, and lock_kicker_irq is not initialized.
@@ -108,8 +110,6 @@ void xen_uninit_lock_cpu(int cpu)
 
 	unbind_from_irqhandler(irq, NULL);
 	per_cpu(lock_kicker_irq, cpu) = -1;
-	kfree(per_cpu(irq_name, cpu));
-	per_cpu(irq_name, cpu) = NULL;
 }
 
 PV_CALLEE_SAVE_REGS_THUNK(xen_vcpu_stolen);
-- 
2.17.1


