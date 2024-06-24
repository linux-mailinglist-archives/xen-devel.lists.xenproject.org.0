Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097059145BD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 11:05:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746323.1153368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfd6-0003pC-C2; Mon, 24 Jun 2024 09:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746323.1153368; Mon, 24 Jun 2024 09:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfd6-0003hU-8K; Mon, 24 Jun 2024 09:04:52 +0000
Received: by outflank-mailman (input) for mailman id 746323;
 Mon, 24 Jun 2024 09:04:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9EP=N2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sLfd4-0002wq-Dg
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 09:04:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf79388b-3208-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 11:04:49 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.160.55.204])
 by support.bugseng.com (Postfix) with ESMTPSA id B98CD4EE0755;
 Mon, 24 Jun 2024 11:04:48 +0200 (CEST)
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
X-Inumbo-ID: cf79388b-3208-11ef-90a3-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 04/13] x86/vpmu: address violations of MISRA C Rule 16.3
Date: Mon, 24 Jun 2024 11:04:28 +0200
Message-Id: <c45b27a08a1608de85e4bbae80763f8429d40ad5.1719218291.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719218291.git.federico.serafini@bugseng.com>
References: <cover.1719218291.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statements to address violations of MISRA C Rule
16.3: "An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpu/vpmu.c       | 3 +++
 xen/arch/x86/cpu/vpmu_intel.c | 1 +
 2 files changed, 4 insertions(+)

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
index cd414165df..46f3ff86e7 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -713,6 +713,7 @@ static int cf_check core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
             break;
         default:
             rdmsrl(msr, *msr_content);
+            break;
         }
     }
     else if ( msr == MSR_IA32_MISC_ENABLE )
-- 
2.34.1


