Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC27C888B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616665.958864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK28-0003sN-1v; Fri, 13 Oct 2023 15:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616665.958864; Fri, 13 Oct 2023 15:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK27-0003q6-Sd; Fri, 13 Oct 2023 15:24:59 +0000
Received: by outflank-mailman (input) for mailman id 616665;
 Fri, 13 Oct 2023 15:24:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cw9=F3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qrK26-0002kj-Ek
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:24:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa679a67-69dc-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 17:24:56 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.222.93])
 by support.bugseng.com (Postfix) with ESMTPSA id 911BB4EE0746;
 Fri, 13 Oct 2023 17:24:55 +0200 (CEST)
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
X-Inumbo-ID: aa679a67-69dc-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 04/10] arm/setup: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 13 Oct 2023 17:24:34 +0200
Message-Id: <b71d8ef87be08e84360efebd7c5644521b3a6661.1697207038.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207038.git.federico.serafini@bugseng.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names, no functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/include/asm/setup.h | 5 +++--
 xen/arch/arm/setup.c             | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index b8866c20f4..98af6f55f5 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -141,7 +141,8 @@ void alloc_static_evtchn(void);
 
 void discard_initial_modules(void);
 void fw_unreserved_regions(paddr_t s, paddr_t e,
-                           void (*cb)(paddr_t, paddr_t), unsigned int first);
+                           void (*cb)(paddr_t ps, paddr_t pe),
+                           unsigned int first);
 
 size_t boot_fdt_info(const void *fdt, paddr_t paddr);
 const char *boot_fdt_cmdline(const void *fdt);
@@ -189,7 +190,7 @@ extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
 extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];
 
 /* Find where Xen will be residing at runtime and return a PT entry */
-lpae_t pte_of_xenaddr(vaddr_t);
+lpae_t pte_of_xenaddr(vaddr_t va);
 
 extern const char __ro_after_init_start[], __ro_after_init_end[];
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index db748839d3..3f3a45719c 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -207,7 +207,7 @@ static void __init processor_id(void)
 }
 
 static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
-                                         void (*cb)(paddr_t, paddr_t),
+                                         void (*cb)(paddr_t ps, paddr_t pe),
                                          unsigned int first)
 {
     unsigned int i, nr;
@@ -324,7 +324,7 @@ static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
 }
 
 void __init fw_unreserved_regions(paddr_t s, paddr_t e,
-                                  void (*cb)(paddr_t, paddr_t),
+                                  void (*cb)(paddr_t ps, paddr_t pe),
                                   unsigned int first)
 {
     if ( acpi_disabled )
-- 
2.34.1


