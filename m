Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BB4917C77
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748587.1156380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwt-0005pH-0p; Wed, 26 Jun 2024 09:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748587.1156380; Wed, 26 Jun 2024 09:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOws-0005jX-RA; Wed, 26 Jun 2024 09:28:18 +0000
Received: by outflank-mailman (input) for mailman id 748587;
 Wed, 26 Jun 2024 09:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P08s=N4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sMOwq-0004l5-Sp
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:28:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a4dbec0-339e-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 11:28:15 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.209.199.41])
 by support.bugseng.com (Postfix) with ESMTPSA id B95384EE0757;
 Wed, 26 Jun 2024 11:28:14 +0200 (CEST)
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
X-Inumbo-ID: 6a4dbec0-339e-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3 04/12] x86/vpmu: address violations of MISRA C Rule 16.3
Date: Wed, 26 Jun 2024 11:27:57 +0200
Message-Id: <b42004216d547e24f6537450a1c98176a821f704.1719383180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719383180.git.federico.serafini@bugseng.com>
References: <cover.1719383180.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statements to address violations of MISRA C Rule
16.3: "An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v3:
- addressed all violations of R16.3 in vpmu_intel.c
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


