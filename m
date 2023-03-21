Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A996C3809
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512902.793283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefcG-0006nz-Tm; Tue, 21 Mar 2023 17:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512902.793283; Tue, 21 Mar 2023 17:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefcG-0006mB-Q6; Tue, 21 Mar 2023 17:17:44 +0000
Received: by outflank-mailman (input) for mailman id 512902;
 Tue, 21 Mar 2023 17:17:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pefcE-0006m5-HI
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:17:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefcE-0002o1-3m; Tue, 21 Mar 2023 17:17:42 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefcD-0005KL-RD; Tue, 21 Mar 2023 17:17:42 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=lg7n5v5ou7uw1fzn2Vt3F7Zl0Qr0cNq1qteLi9rcgOg=; b=3FbC+a
	tuJjMnWqmou6r2wlh/zGMYhMOpFJPdaPuysf4zilRmhMpt8ogqFxoOGHjK+ogR3qYJ5CxfKTFWmfL
	+BL9N8WENez8Pr4GfEpFDGYf0IpYdNnJZ+dch9stFemA3vuMjehXdqqX5fp3VVNdU7iSS4NMAhY5b
	OcYdb6CeodI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: andrei.cherechesu@oss.nxp.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: irq: Constify the first parameter of platform_get_irq_byname()
Date: Tue, 21 Mar 2023 17:17:21 +0000
Message-Id: <20230321171721.2502-1-julien@xen.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

platform_get_irq_byname() is not meant to modify the parameter 'np'. So
constify it.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/include/asm/irq.h | 2 +-
 xen/arch/arm/irq.c             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
index af94f41994f1..11bc85d1110c 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -89,7 +89,7 @@ int irq_set_type(unsigned int irq, unsigned int type);
 
 int platform_get_irq(const struct dt_device_node *device, int index);
 
-int platform_get_irq_byname(struct dt_device_node *np, const char *name);
+int platform_get_irq_byname(const struct dt_device_node *np, const char *name);
 
 void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask);
 
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index ded495792b7c..16e56f8945a8 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -718,7 +718,7 @@ int platform_get_irq(const struct dt_device_node *device, int index)
     return irq;
 }
 
-int platform_get_irq_byname(struct dt_device_node *np, const char *name)
+int platform_get_irq_byname(const struct dt_device_node *np, const char *name)
 {
 	int index;
 
-- 
2.39.2


