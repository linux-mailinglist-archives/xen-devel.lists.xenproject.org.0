Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEB073DBD3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 11:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555382.867124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDitq-0000xq-Nx; Mon, 26 Jun 2023 09:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555382.867124; Mon, 26 Jun 2023 09:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDitq-0000w6-JR; Mon, 26 Jun 2023 09:52:46 +0000
Received: by outflank-mailman (input) for mailman id 555382;
 Mon, 26 Jun 2023 09:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDFh=CO=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qDitp-0000fc-1A
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 09:52:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31f811af-1407-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 11:52:43 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.27.55])
 by support.bugseng.com (Postfix) with ESMTPSA id 1F0A24EE073D;
 Mon, 26 Jun 2023 11:52:41 +0200 (CEST)
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
X-Inumbo-ID: 31f811af-1407-11ee-b237-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH v3 2/6] xen/arm: change parameter name 'vcpu' in domain() function definition.
Date: Mon, 26 Jun 2023 11:52:14 +0200
Message-Id: <e765493f0c0a9bc592197b5b0c102327db5eaf90.1687771796.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687771796.git.federico.serafini@bugseng.com>
References: <cover.1687771796.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the current version of domain() function, the declaration
(correctly) uses the parameter name 'v' while the definition uses the
parameter name 'vcpu'.
Since it is common to use 'v' to denote a vCPU, change the parameter
name 'vcpu' of function definition to 'v', thus fixing a violation of
MISRA C:2012 Rule 8.3.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/domain.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index add9929b79..8c18e92079 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1155,15 +1155,15 @@ void vcpu_block_unless_event_pending(struct vcpu *v)
         vcpu_unblock(current);
 }
 
-void vcpu_kick(struct vcpu *vcpu)
+void vcpu_kick(struct vcpu *v)
 {
-    bool running = vcpu->is_running;
+    bool running = v->is_running;
 
-    vcpu_unblock(vcpu);
-    if ( running && vcpu != current )
+    vcpu_unblock(v);
+    if ( running && v != current )
     {
         perfc_incr(vcpu_kick);
-        smp_send_event_check_mask(cpumask_of(vcpu->processor));
+        smp_send_event_check_mask(cpumask_of(v->processor));
     }
 }
 
-- 
2.34.1


