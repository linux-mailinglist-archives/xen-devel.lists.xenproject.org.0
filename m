Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B627F7FDB26
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643990.1004561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQi-0001RH-9L; Wed, 29 Nov 2023 15:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643990.1004561; Wed, 29 Nov 2023 15:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQi-0001Pp-6S; Wed, 29 Nov 2023 15:24:48 +0000
Received: by outflank-mailman (input) for mailman id 643990;
 Wed, 29 Nov 2023 15:24:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQo/=HK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8MQg-0001PY-Ft
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 15:24:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cd696df-8ecb-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 16:24:45 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.152])
 by support.bugseng.com (Postfix) with ESMTPSA id 675114EE073E;
 Wed, 29 Nov 2023 16:24:44 +0100 (CET)
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
X-Inumbo-ID: 6cd696df-8ecb-11ee-98e3-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 1/7] xen/arm: mmu: add headers for missing declarations
Date: Wed, 29 Nov 2023 16:24:19 +0100
Message-Id: <7032dd53fa025ad19ce53171b80e51db9d332b83.1701270983.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701270983.git.nicola.vetrini@bugseng.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definitions needing the inclusion of asm/setup.h are
boot_{first,second,third}(_id)?, whereas vmap.h is needed by arch_vmap_virt_end.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/mmu/setup.c   | 1 +
 xen/arch/arm/mmu/smpboot.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index a5a9b538ff13..d5264e51bc44 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -8,6 +8,7 @@
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sizes.h>
+#include <xen/vmap.h>
 
 #include <asm/fixmap.h>
 
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index 12f1a5d761e7..b6fc0aae07f1 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -7,6 +7,8 @@
 
 #include <xen/domain_page.h>
 
+#include <asm/setup.h>
+
 /*
  * Static start-of-day pagetables that we use before the allocators
  * are up. These are used by all CPUs during bringup before switching
-- 
2.34.1

