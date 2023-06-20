Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A3A736A26
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551540.861164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ72-0008UB-Mo; Tue, 20 Jun 2023 11:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551540.861164; Tue, 20 Jun 2023 11:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ72-0008OD-Ew; Tue, 20 Jun 2023 11:01:28 +0000
Received: by outflank-mailman (input) for mailman id 551540;
 Tue, 20 Jun 2023 10:35:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovpU=CI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBYho-0004Pq-5h
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:35:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 294fe34c-0f56-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 12:35:23 +0200 (CEST)
Received: from beta.bugseng.com (93-40-74-174.ip37.fastwebnet.it
 [93.40.74.174])
 by support.bugseng.com (Postfix) with ESMTPSA id 8DF784EE0755;
 Tue, 20 Jun 2023 12:35:21 +0200 (CEST)
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
X-Inumbo-ID: 294fe34c-0f56-11ee-b234-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 03/13] xen/x86: fixed violations of MISRA C:2012 Rule 7.2
Date: Tue, 20 Jun 2023 12:34:55 +0200
Message-Id: <397206cfac500d171be31dcd3503d9f61e531a97.1687250177.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687250177.git.gianluca.luparini@bugseng.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
"A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".

I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/hvm/svm/asid.c | 2 +-
 xen/arch/x86/hvm/svm/svm.c  | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 09f8c23fd9..56306d1a16 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -16,7 +16,7 @@ void svm_asid_init(const struct cpuinfo_x86 *c)
 
     /* Check for erratum #170, and leave ASIDs disabled if it's present. */
     if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
-        nasids = cpuid_ebx(0x8000000A);
+        nasids = cpuid_ebx(0x8000000AU);
 
     hvm_asid_init(nasids);
 }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 59a6e88dff..56cb2f61bb 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -269,9 +269,9 @@ svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
      */
     if ( msr <= 0x1fff )
         msr_bit = msr_bitmap + 0x0000 / BYTES_PER_LONG;
-    else if ( (msr >= 0xc0000000) && (msr <= 0xc0001fff) )
+    else if ( (msr >= 0xc0000000U) && (msr <= 0xc0001fffU) )
         msr_bit = msr_bitmap + 0x0800 / BYTES_PER_LONG;
-    else if ( (msr >= 0xc0010000) && (msr <= 0xc0011fff) )
+    else if ( (msr >= 0xc0010000U) && (msr <= 0xc0011fffU) )
         msr_bit = msr_bitmap + 0x1000 / BYTES_PER_LONG;
 
     return msr_bit;
@@ -2539,8 +2539,8 @@ const struct hvm_function_table * __init start_svm(void)
 
     setup_vmcb_dump();
 
-    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000a )
-        svm_feature_flags = cpuid_edx(0x8000000a);
+    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000aU )
+        svm_feature_flags = cpuid_edx(0x8000000aU);
 
     printk("SVM: Supported advanced features:\n");
 
-- 
2.41.0


