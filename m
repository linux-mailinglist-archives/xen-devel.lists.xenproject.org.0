Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57428816ACA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655804.1023621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAgy-0005rF-LN; Mon, 18 Dec 2023 10:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655804.1023621; Mon, 18 Dec 2023 10:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAgy-0005p1-HT; Mon, 18 Dec 2023 10:17:44 +0000
Received: by outflank-mailman (input) for mailman id 655804;
 Mon, 18 Dec 2023 10:17:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mejk=H5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFAgw-00055V-T3
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:17:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id addb1bd8-9d8e-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 11:17:42 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 301BB4EE0C8A;
 Mon, 18 Dec 2023 11:17:41 +0100 (CET)
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
X-Inumbo-ID: addb1bd8-9d8e-11ee-98eb-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 3/7] xen/arm: address MISRA C:2012 Rule 2.1
Date: Mon, 18 Dec 2023 11:17:29 +0100
Message-Id: <06857c133d1db8ab3a2eec5e0363be4358a0ec81.1702891792.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702891792.git.nicola.vetrini@bugseng.com>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no paths that can reach the last return statement
of function 'vgic_v3_its_mmio_write' in 'vcig-v3-its.c' and
'arch_memory_op' in 'arch/arm/mm.c', thus violating
MISRA C:2012 Rule 2.1:
"A project shall not contain unreachable code".

Therefore, an ASSERT_UNREACHABLE() is inserted to remove the unreachable
return statement and protect against possible mistakes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Changed resolution strategy to have an ASSERT_UNREACHABLE() before
  the return.
---
 xen/arch/arm/mm.c          | 1 +
 xen/arch/arm/vgic-v3-its.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index eeb65ca6bb79..b15a18a49412 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -283,6 +283,7 @@ long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
         return -ENOSYS;
     }
 
+    ASSERT_UNREACHABLE();
     return 0;
 }
 
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 05429030b539..70b5aeb82219 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1409,6 +1409,7 @@ static int vgic_v3_its_mmio_write(struct vcpu *v, mmio_info_t *info,
         return 0;
     }
 
+    ASSERT_UNREACHABLE();
     return 1;
 
 write_ignore_64:
-- 
2.34.1


