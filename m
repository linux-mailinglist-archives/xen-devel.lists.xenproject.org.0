Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C588C61C1
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 09:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721957.1125709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s799t-0005F0-G7; Wed, 15 May 2024 07:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721957.1125709; Wed, 15 May 2024 07:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s799t-00059G-9F; Wed, 15 May 2024 07:34:41 +0000
Received: by outflank-mailman (input) for mailman id 721957;
 Wed, 15 May 2024 07:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opSn=MS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s799r-0004ka-Uk
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 07:34:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9548029b-128d-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 09:34:37 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id DAE474EE0739;
 Wed, 15 May 2024 09:34:36 +0200 (CEST)
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
X-Inumbo-ID: 9548029b-128d-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 2/4] x86/hvm: address violations of MISRA C Rule 20.7
Date: Wed, 15 May 2024 09:34:31 +0200
Message-Id: <6d14b3283005cf1a30c4fa24f9841586a41e2b1b.1715757982.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715757982.git.nicola.vetrini@bugseng.com>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/mtrr.c             | 2 +-
 xen/arch/x86/hvm/rtc.c              | 2 +-
 xen/arch/x86/include/asm/hvm/save.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 32f74c1db03b..1079851f70ed 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -16,7 +16,7 @@
 #include <public/hvm/e820.h>
 
 /* Get page attribute fields (PAn) from PAT MSR. */
-#define pat_cr_2_paf(pat_cr,n)  ((((uint64_t)pat_cr) >> ((n)<<3)) & 0xff)
+#define pat_cr_2_paf(pat_cr, n)  ((((uint64_t)(pat_cr)) >> ((n) << 3)) & 0xff)
 
 /* Effective mm type lookup table, according to MTRR and PAT. */
 static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][X86_NUM_MT] = {
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 4bb1c7505534..72c7bdbfcd02 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -45,7 +45,7 @@
 #define vrtc_domain(x) (container_of(x, struct pl_time, vrtc)->domain)
 #define vrtc_vcpu(x)   (pt_global_vcpu_target(vrtc_domain(x)))
 #define epoch_year     1900
-#define get_year(x)    (x + epoch_year)
+#define get_year(x)    ((x) + epoch_year)
 
 enum rtc_mode {
    rtc_mode_no_ack,
diff --git a/xen/arch/x86/include/asm/hvm/save.h b/xen/arch/x86/include/asm/hvm/save.h
index 8149aa113cb4..ec8de029319d 100644
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -50,7 +50,7 @@ int _hvm_check_entry(struct hvm_domain_context *h,
                           HVM_SAVE_LENGTH(x), true) == 0 )      \
     {                                                           \
         ptr = &(h)->data[(h)->cur];                             \
-        h->cur += HVM_SAVE_LENGTH(x);                           \
+        (h)->cur += HVM_SAVE_LENGTH(x);                         \
     }                                                           \
     ptr; })
 
-- 
2.34.1

