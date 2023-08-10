Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF9777323
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581926.911431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DL-0006Pd-Ej; Thu, 10 Aug 2023 08:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581926.911431; Thu, 10 Aug 2023 08:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DL-0006Nx-4c; Thu, 10 Aug 2023 08:40:15 +0000
Received: by outflank-mailman (input) for mailman id 581926;
 Thu, 10 Aug 2023 08:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZIv=D3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qU1DJ-0005Mc-0J
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:40:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e89fe20-3759-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 10:40:01 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 97BB84EE0744;
 Thu, 10 Aug 2023 10:40:10 +0200 (CEST)
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
X-Inumbo-ID: 7e89fe20-3759-11ee-8613-37d641c3527e
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 4/7] xen/arm: make declarations visible before function definitions
Date: Thu, 10 Aug 2023 10:39:44 +0200
Message-Id: <05f4dd673312ddd52dcbc8a3b7bcf0ee84993d6e.1691655814.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691655814.git.nicola.vetrini@bugseng.com>
References: <cover.1691655814.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'xen/hypercall.h' is included in 'xen/arch/arm/setup.c' to allow
the declaration of 'arch_get_xen_caps' to be visible when
defining the function.

The header 'xen/delay.h' is included in 'xen/arch/arm/time.c'
to allow the declaration of 'udelay' to be visible.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: 7cfc339cbc2f ("arm: Implement arch_get_xen_caps")
Fixes: 335ba242c55c ("arm: implement udelay()")
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- Revised commit message
- Split patch
---
 xen/arch/arm/setup.c | 1 +
 xen/arch/arm/time.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index bbf72b69aae6..44ccea03ca14 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -32,6 +32,7 @@
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/acpi.h>
 #include <xen/warning.h>
+#include <xen/hypercall.h>
 #include <asm/alternative.h>
 #include <asm/page.h>
 #include <asm/current.h>
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 0b482d7db30c..3535bd8ac7c7 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -17,6 +17,7 @@
 #include <xen/softirq.h>
 #include <xen/sched.h>
 #include <xen/time.h>
+#include <xen/delay.h>
 #include <xen/sched.h>
 #include <xen/event.h>
 #include <xen/acpi.h>
-- 
2.34.1


