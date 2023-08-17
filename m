Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C8377F689
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 14:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585374.916466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcI9-0000Nn-Hh; Thu, 17 Aug 2023 12:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585374.916466; Thu, 17 Aug 2023 12:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcI9-0000KS-Ca; Thu, 17 Aug 2023 12:39:57 +0000
Received: by outflank-mailman (input) for mailman id 585374;
 Thu, 17 Aug 2023 12:39:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0n1I=EC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qWcI7-0000KB-EJ
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 12:39:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a74b0ea-3cfb-11ee-877b-cb3800f73035;
 Thu, 17 Aug 2023 14:39:54 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 2C7E54EE073C;
 Thu, 17 Aug 2023 14:39:53 +0200 (CEST)
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
X-Inumbo-ID: 2a74b0ea-3cfb-11ee-877b-cb3800f73035
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 1/3] vm_event: rework inclusions to use arch-indipendent header
Date: Thu, 17 Aug 2023 14:39:26 +0200
Message-Id: <6ef8207eee081e2c9a3914a14025077fc72b19e6.1692275359.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692275359.git.nicola.vetrini@bugseng.com>
References: <cover.1692275359.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arch-specific header <asm/vm_event.h> should be included by the
common header <xen/vm_event.h>, so that the latter can be included
in the source files.

This also resolves violations of MISRA C:2012 Rule 8.4 that were
caused by declarations for
'vm_event_{fill_regs,set_registers,monitor_next_interrupt}'
in <asm/vm_event.h> not being visible when
defining functions in 'xen/arch/x86/vm_event.c'

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Include the arch-specific header in the common one, and only include
  the latter in source files.

The following functions have been mainly touched by the following commits,
but the present commit does not solve a problem introduced by one of them per se, except perhaps the first one mentioned, which is why I didn't put a Fixes tag in this v2:
- 975efd3baa8d ("introduce VM_EVENT_FLAG_SET_REGISTERS")
- adc75eba8b15 ("x86/vm_event: consolidate hvm_event_fill_regs and p2m_vm_event_fill_regs")
- 9864841914c2 ("x86/vm_event: add support for VM_EVENT_REASON_INTERRUPT")
---
 xen/arch/arm/include/asm/vm_event.h | 1 -
 xen/arch/arm/vm_event.c             | 2 +-
 xen/arch/x86/vm_event.c             | 2 +-
 xen/include/xen/vm_event.h          | 1 +
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/vm_event.h b/xen/arch/arm/include/asm/vm_event.h
index abe7db1970ca..4d861373b38d 100644
--- a/xen/arch/arm/include/asm/vm_event.h
+++ b/xen/arch/arm/include/asm/vm_event.h
@@ -20,7 +20,6 @@
 #define __ASM_ARM_VM_EVENT_H__
 
 #include <xen/sched.h>
-#include <xen/vm_event.h>
 #include <public/domctl.h>
 
 static inline int vm_event_init_domain(struct domain *d)
diff --git a/xen/arch/arm/vm_event.c b/xen/arch/arm/vm_event.c
index ba99f56eb20c..ccfd25bbbca9 100644
--- a/xen/arch/arm/vm_event.c
+++ b/xen/arch/arm/vm_event.c
@@ -8,7 +8,7 @@
  */
 
 #include <xen/sched.h>
-#include <asm/vm_event.h>
+#include <xen/vm_event.h>
 
 void vm_event_fill_regs(vm_event_request_t *req)
 {
diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index 7027c08a926b..e6c7ad5337dd 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -20,7 +20,7 @@
 
 #include <xen/sched.h>
 #include <xen/mem_access.h>
-#include <asm/vm_event.h>
+#include <xen/vm_event.h>
 
 /* Implicitly serialized by the domctl lock. */
 int vm_event_init_domain(struct domain *d)
diff --git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h
index 92811d9110e5..9a86358b42ae 100644
--- a/xen/include/xen/vm_event.h
+++ b/xen/include/xen/vm_event.h
@@ -25,6 +25,7 @@
 
 #include <xen/sched.h>
 #include <public/vm_event.h>
+#include <asm/vm_event.h>
 
 struct vm_event_domain
 {
-- 
2.34.1


