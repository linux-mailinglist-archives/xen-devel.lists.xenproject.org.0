Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF9C8C61C0
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 09:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721955.1125699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s799s-000556-QN; Wed, 15 May 2024 07:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721955.1125699; Wed, 15 May 2024 07:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s799s-00052m-NF; Wed, 15 May 2024 07:34:40 +0000
Received: by outflank-mailman (input) for mailman id 721955;
 Wed, 15 May 2024 07:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opSn=MS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s799q-0004ka-US
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 07:34:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94e67609-128d-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 09:34:37 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id 3FC664EE0745;
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
X-Inumbo-ID: 94e67609-128d-11ef-b4bb-af5377834399
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
Subject: [XEN PATCH 1/4] x86/vpmu: address violations of MISRA C Rule 20.7
Date: Wed, 15 May 2024 09:34:30 +0200
Message-Id: <ecba64bb8295fa27f0ddbb0905b0983a3572b1ae.1715757982.git.nicola.vetrini@bugseng.com>
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
 xen/arch/x86/cpu/vpmu_amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index db2fa420e14a..97e6315bd9f7 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -25,8 +25,8 @@
 
 #define is_guest_mode(msr) ((msr) & (1ULL << MSR_F10H_EVNTSEL_GO_SHIFT))
 #define is_pmu_enabled(msr) ((msr) & (1ULL << MSR_F10H_EVNTSEL_EN_SHIFT))
-#define set_guest_mode(msr) (msr |= (1ULL << MSR_F10H_EVNTSEL_GO_SHIFT))
-#define is_overflowed(msr) (!((msr) & (1ULL << (MSR_F10H_COUNTER_LENGTH-1))))
+#define set_guest_mode(msr) ((msr) |= (1ULL << MSR_F10H_EVNTSEL_GO_SHIFT))
+#define is_overflowed(msr) (!((msr) & (1ULL << (MSR_F10H_COUNTER_LENGTH - 1))))
 
 static unsigned int __read_mostly num_counters;
 static const u32 __read_mostly *counters;
-- 
2.34.1


