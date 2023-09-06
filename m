Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93E793788
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596372.930253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoMC-0000A4-8h; Wed, 06 Sep 2023 08:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596372.930253; Wed, 06 Sep 2023 08:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoMC-00005M-2z; Wed, 06 Sep 2023 08:57:52 +0000
Received: by outflank-mailman (input) for mailman id 596372;
 Wed, 06 Sep 2023 08:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5kCQ=EW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qdoMA-0008TQ-BH
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:57:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73ecc2ff-4c93-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 10:57:48 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-6-207-235.retail.telecomitalia.it [87.6.207.235])
 by support.bugseng.com (Postfix) with ESMTPSA id 02D444EE0739;
 Wed,  6 Sep 2023 10:57:47 +0200 (CEST)
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
X-Inumbo-ID: 73ecc2ff-4c93-11ee-8783-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/4] x86/genapic: address a violation of MISRA C:2012 Rule 8.3
Date: Wed,  6 Sep 2023 10:57:38 +0200
Message-Id: <375af065f072488f74003256aecc325f166d532a.1693990010.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693990010.git.federico.serafini@bugseng.com>
References: <cover.1693990010.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function delcaration consistent with the corresponding definition.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/genapic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index beeaddf19d..970df8ffe0 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -43,7 +43,7 @@ void cf_check send_IPI_self_legacy(uint8_t vector);
 
 void cf_check init_apic_ldr_flat(void);
 unsigned int cf_check cpu_mask_to_apicid_flat(const cpumask_t *cpumask);
-void cf_check send_IPI_mask_flat(const cpumask_t *mask, int vector);
+void cf_check send_IPI_mask_flat(const cpumask_t *cpumask, int vector);
 const cpumask_t *cf_check vector_allocation_cpumask_flat(int cpu);
 #define GENAPIC_FLAT \
 	.int_delivery_mode = dest_LowestPrio, \
-- 
2.34.1


