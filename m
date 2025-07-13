Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B3EB0311D
	for <lists+xen-devel@lfdr.de>; Sun, 13 Jul 2025 15:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042295.1412491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uawiv-0001qG-7R; Sun, 13 Jul 2025 13:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042295.1412491; Sun, 13 Jul 2025 13:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uawiv-0001o4-1K; Sun, 13 Jul 2025 13:26:33 +0000
Received: by outflank-mailman (input) for mailman id 1042295;
 Sun, 13 Jul 2025 13:26:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XyrY=Z2=treblig.org=linux@srs-se1.protection.inumbo.net>)
 id 1uawit-0001ny-Rf
 for xen-devel@lists.xenproject.org; Sun, 13 Jul 2025 13:26:32 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbfa63d4-5fec-11f0-a318-13f23c93f187;
 Sun, 13 Jul 2025 15:26:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1uawio-00FmoE-0U;
 Sun, 13 Jul 2025 13:26:26 +0000
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
X-Inumbo-ID: fbfa63d4-5fec-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=tyQ6k5Ss2924537Ojv5G13P3wvbpMJP65PFFZ7UTjqI=; b=NMpTYI+hJ4yDSMkO
	SyZdnfO3NXiLSPmeOMOy3Xbum5zLpaG9aQ6auABmbFcjteIMlMilx+ziPntx3ecC6TcKsH5zyDLqh
	xDjHWkV0Sh1YkZO2S38UklUyK5LgwDznzI5PyI+6xXZhFIR47AUCAwoRiRZ8tlSyF5F8oEunjI0XL
	bd+vSl5fFY3ewlftCnBTx2t5VZsgcy9re0FLSxHqBmwa8fjLtItyHsHO7hW/T5mV4C1g0ILo4Oj4W
	XIvmhh++ePIf535kolXZ9Tw8WlkEEff7jBypFLTibDtlX9QUfp0dIbHGeVWuE/Op8UHzPYCkicBHE
	RexwN/7VdK3QOPzsAA==;
From: linux@treblig.org
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] xen: Remove some deadcode (x)
Date: Sun, 13 Jul 2025 14:26:25 +0100
Message-ID: <20250713132625.164728-1-linux@treblig.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Remove three uncalled functions:

  xenbus_mkdir() was added in 2007 by
commit 4bac07c993d0 ("xen: add the Xenbus sysfs and virtual device hotplug
driver")
but has remained unused.

  xen_get_runstate_snapshot() last use was removed in 2016 by
commit 6ba286ad8457 ("xen: support runqueue steal time on xen")
which replaces the use by the _cpu version.

  xen_resume_notifier_unregister() last use was removed in 2017 by
commit 1914f0cd203c ("xen/acpi: upload PM state from init-domain to Xen")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/xen/manage.c           |  6 ------
 drivers/xen/time.c             |  8 --------
 drivers/xen/xenbus/xenbus_xs.c | 17 -----------------
 include/xen/xen-ops.h          |  2 --
 include/xen/xenbus.h           |  2 --
 5 files changed, 35 deletions(-)

diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
index b4b4ebed68da..841afa4933c7 100644
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@ -52,12 +52,6 @@ void xen_resume_notifier_register(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(xen_resume_notifier_register);
 
-void xen_resume_notifier_unregister(struct notifier_block *nb)
-{
-	raw_notifier_chain_unregister(&xen_resume_notifier, nb);
-}
-EXPORT_SYMBOL_GPL(xen_resume_notifier_unregister);
-
 #ifdef CONFIG_HIBERNATE_CALLBACKS
 static int xen_suspend(void *data)
 {
diff --git a/drivers/xen/time.c b/drivers/xen/time.c
index 152dd33bb223..5683383d2305 100644
--- a/drivers/xen/time.c
+++ b/drivers/xen/time.c
@@ -136,14 +136,6 @@ void xen_manage_runstate_time(int action)
 	}
 }
 
-/*
- * Runstate accounting
- */
-void xen_get_runstate_snapshot(struct vcpu_runstate_info *res)
-{
-	xen_get_runstate_snapshot_cpu(res, smp_processor_id());
-}
-
 /* return true when a vcpu could run but has no real cpu to run on */
 bool xen_vcpu_stolen(int vcpu)
 {
diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index dcf9182c8451..3c9da446b85d 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -512,23 +512,6 @@ int xenbus_write(struct xenbus_transaction t,
 }
 EXPORT_SYMBOL_GPL(xenbus_write);
 
-/* Create a new directory. */
-int xenbus_mkdir(struct xenbus_transaction t,
-		 const char *dir, const char *node)
-{
-	char *path;
-	int ret;
-
-	path = join(dir, node);
-	if (IS_ERR(path))
-		return PTR_ERR(path);
-
-	ret = xs_error(xs_single(t, XS_MKDIR, path, NULL));
-	kfree(path);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(xenbus_mkdir);
-
 /* Destroy a file or directory (directories must be empty). */
 int xenbus_rm(struct xenbus_transaction t, const char *dir, const char *node)
 {
diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
index 47f11bec5e90..9e2a769b0d96 100644
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -30,13 +30,11 @@ void xen_arch_suspend(void);
 void xen_reboot(int reason);
 
 void xen_resume_notifier_register(struct notifier_block *nb);
-void xen_resume_notifier_unregister(struct notifier_block *nb);
 
 bool xen_vcpu_stolen(int vcpu);
 void xen_setup_runstate_info(int cpu);
 void xen_time_setup_guest(void);
 void xen_manage_runstate_time(int action);
-void xen_get_runstate_snapshot(struct vcpu_runstate_info *res);
 u64 xen_steal_clock(int cpu);
 
 int xen_setup_shutdown_event(void);
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 3f90bdd387b6..1c23e6387f13 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -154,8 +154,6 @@ void *xenbus_read(struct xenbus_transaction t,
 		  const char *dir, const char *node, unsigned int *len);
 int xenbus_write(struct xenbus_transaction t,
 		 const char *dir, const char *node, const char *string);
-int xenbus_mkdir(struct xenbus_transaction t,
-		 const char *dir, const char *node);
 int xenbus_exists(struct xenbus_transaction t,
 		  const char *dir, const char *node);
 int xenbus_rm(struct xenbus_transaction t, const char *dir, const char *node);
-- 
2.50.1


