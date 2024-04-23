Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17AD8AEA59
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710794.1110302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpi-0006uq-VQ; Tue, 23 Apr 2024 15:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710794.1110302; Tue, 23 Apr 2024 15:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpi-0006sI-QG; Tue, 23 Apr 2024 15:13:22 +0000
Received: by outflank-mailman (input) for mailman id 710794;
 Tue, 23 Apr 2024 15:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5BF=L4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzHph-0004ry-6g
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:13:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 052aa59f-0184-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:13:20 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id ED6784EE0742;
 Tue, 23 Apr 2024 17:13:17 +0200 (CEST)
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
X-Inumbo-ID: 052aa59f-0184-11ef-909a-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 06/10] x86/pci: address violation of MISRA C Rule 20.7
Date: Tue, 23 Apr 2024 17:12:48 +0200
Message-Id: <6c8bb550a4e263c8052ac10433070d2fcc7f56ad.1713885065.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713885065.git.nicola.vetrini@bugseng.com>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
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
 xen/arch/x86/include/asm/pci.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index 6bfe87e2780b..fd5480d67d43 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -8,10 +8,10 @@
 #define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000U) >> 16)
 #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000U))
 
-#define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
-                        || id == 0x01268086 || id == 0x01028086 \
-                        || id == 0x01128086 || id == 0x01228086 \
-                        || id == 0x010A8086 )
+#define IS_SNB_GFX(id) ((id) == 0x01068086 || (id) == 0x01168086 \
+                        || (id) == 0x01268086 || (id) == 0x01028086 \
+                        || (id) == 0x01128086 || (id) == 0x01228086 \
+                        || (id) == 0x010A8086 )
 
 struct arch_pci_dev {
     vmask_t used_vectors;
-- 
2.34.1


