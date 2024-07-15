Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD99A9318C6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 18:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759066.1168646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOrU-0007oW-4t; Mon, 15 Jul 2024 16:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759066.1168646; Mon, 15 Jul 2024 16:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOrT-0007iS-St; Mon, 15 Jul 2024 16:47:39 +0000
Received: by outflank-mailman (input) for mailman id 759066;
 Mon, 15 Jul 2024 16:47:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3wo=OP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sTOrS-0006CY-AS
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 16:47:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f08dee2b-42c9-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 18:47:36 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.163.111.28])
 by support.bugseng.com (Postfix) with ESMTPSA id CC67B4EE0742;
 Mon, 15 Jul 2024 18:47:35 +0200 (CEST)
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
X-Inumbo-ID: f08dee2b-42c9-11ef-8776-851b0ebba9a2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v4 4/9] x86/vpmu: address violations of MISRA C Rule 16.3
Date: Mon, 15 Jul 2024 18:47:17 +0200
Message-Id: <67c30f4ef05846f8c3b371eb5fb2de4bd42eb5f1.1721050709.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721050709.git.federico.serafini@bugseng.com>
References: <cover.1721050709.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statements to address violations of MISRA C Rule
16.3: "An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/cpu/vpmu.c       | 3 +++
 xen/arch/x86/cpu/vpmu_intel.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index a7bc0cd1fc..b2ba999412 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -663,6 +663,8 @@ long do_xenpmu_op(
 
         if ( pmu_params.version.maj != XENPMU_VER_MAJ )
             return -EINVAL;
+
+        break;
     }
 
     switch ( op )
@@ -776,6 +778,7 @@ long do_xenpmu_op(
 
     default:
         ret = -EINVAL;
+        break;
     }
 
     return ret;
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index cd414165df..26dd3a9358 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -666,6 +666,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
 
             xen_pmu_cntr_pair[tmp].control = msr_content;
         }
+        break;
     }
 
     if ( type != MSR_TYPE_GLOBAL )
@@ -713,6 +714,7 @@ static int cf_check core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
             break;
         default:
             rdmsrl(msr, *msr_content);
+            break;
         }
     }
     else if ( msr == MSR_IA32_MISC_ENABLE )
-- 
2.34.1


