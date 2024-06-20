Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1318B9106CC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 15:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744509.1151585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKICm-0000eX-LI; Thu, 20 Jun 2024 13:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744509.1151585; Thu, 20 Jun 2024 13:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKICm-0000Zq-GN; Thu, 20 Jun 2024 13:52:00 +0000
Received: by outflank-mailman (input) for mailman id 744509;
 Thu, 20 Jun 2024 13:51:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKICk-0008AK-Ry
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 13:51:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41d3483f-2f0c-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 15:51:56 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id C30204EE0754;
 Thu, 20 Jun 2024 15:51:55 +0200 (CEST)
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
X-Inumbo-ID: 41d3483f-2f0c-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>
Subject: [XEN PATCH 04/13] x86/vpmu: address violations of MISRA C Rule 16.3
Date: Thu, 20 Jun 2024 15:51:38 +0200
Message-Id: <2b08ef10fb4907255688d5fb38b5928e972407e9.1718890095.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718890095.git.federico.serafini@bugseng.com>
References: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718890095.git.federico.serafini@bugseng.com>
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


