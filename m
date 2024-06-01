Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD48D6F56
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 12:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734112.1140328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDLnR-0006YU-KL; Sat, 01 Jun 2024 10:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734112.1140328; Sat, 01 Jun 2024 10:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDLnR-0006VA-DD; Sat, 01 Jun 2024 10:17:09 +0000
Received: by outflank-mailman (input) for mailman id 734112;
 Sat, 01 Jun 2024 10:17:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmUY=ND=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sDLnQ-0006UI-3u
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 10:17:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 184c05ed-2000-11ef-b4bb-af5377834399;
 Sat, 01 Jun 2024 12:17:05 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id D7E144EE074A;
 Sat,  1 Jun 2024 12:17:03 +0200 (CEST)
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
X-Inumbo-ID: 184c05ed-2000-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 3/5] x86: deviate violation of MISRA C Rule 20.12
Date: Sat,  1 Jun 2024 12:16:54 +0200
Message-Id: <475daa82f5be77644b1f32ecd3f6e66ccd9ac904.1717236930.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717236930.git.nicola.vetrini@bugseng.com>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.12 states: "A macro parameter used as an operand to
the # or ## operators, which is itself subject to further macro replacement,
shall only be used as an operand to these operators".

When the second parameter of GET_SET_SHARED is a macro and is used as both
a regular parameter and for token pasting the rule deliberately violated.
A SAF-x-safe comment is used to deviate the usage.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/include/asm/shared.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/include/asm/shared.h b/xen/arch/x86/include/asm/shared.h
index 60b67fa4b427..c26d4b2b3f0f 100644
--- a/xen/arch/x86/include/asm/shared.h
+++ b/xen/arch/x86/include/asm/shared.h
@@ -76,6 +76,7 @@ static inline void arch_set_##field(struct vcpu *v,         \
 
 GET_SET_SHARED(unsigned long, max_pfn)
 GET_SET_SHARED(xen_pfn_t, pfn_to_mfn_frame_list_list)
+/* SAF-6-safe Rule 20.12: expansion of macro nmi_reason */
 GET_SET_SHARED(unsigned long, nmi_reason)
 
 GET_SET_VCPU(unsigned long, cr2)
-- 
2.34.1


