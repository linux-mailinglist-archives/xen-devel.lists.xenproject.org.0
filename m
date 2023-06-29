Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351C8742A07
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556957.869896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzq-0001Fj-CW; Thu, 29 Jun 2023 15:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556957.869896; Thu, 29 Jun 2023 15:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzq-00017U-80; Thu, 29 Jun 2023 15:55:50 +0000
Received: by outflank-mailman (input) for mailman id 556957;
 Thu, 29 Jun 2023 15:55:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6tI=CR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qEtzo-0000zX-Py
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:55:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69584591-1695-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 17:55:47 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.192.186])
 by support.bugseng.com (Postfix) with ESMTPSA id B88994EE073A;
 Thu, 29 Jun 2023 17:55:45 +0200 (CEST)
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
X-Inumbo-ID: 69584591-1695-11ee-8611-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH 1/5] x86: swap parameter names of hvm_copy_context_and_params() declaration
Date: Thu, 29 Jun 2023 17:55:29 +0200
Message-Id: <441ddc3eb422c009d68db090166cfbc863d6c0b7.1688049495.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688049494.git.federico.serafini@bugseng.com>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Swap parameter names 'src' and 'dst' of hvm_copy_context_and_params()
declaration for consistency with the corresponding definition and the
uses of such function.
Also, this fixes a violation of MISRA C:2012 Rule 8.3.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/hvm/hvm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 04cbd4ff24..9555b4c41f 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -366,7 +366,7 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
                            signed int cr0_pg);
 unsigned long hvm_cr4_guest_valid_bits(const struct domain *d);
 
-int hvm_copy_context_and_params(struct domain *src, struct domain *dst);
+int hvm_copy_context_and_params(struct domain *dst, struct domain *src);
 
 int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
 
-- 
2.34.1


