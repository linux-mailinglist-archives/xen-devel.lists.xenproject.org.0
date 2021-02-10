Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E881316C12
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 18:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83673.156331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9sxJ-0003Iy-UK; Wed, 10 Feb 2021 17:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83673.156331; Wed, 10 Feb 2021 17:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9sxJ-0003Ib-Qw; Wed, 10 Feb 2021 17:07:09 +0000
Received: by outflank-mailman (input) for mailman id 83673;
 Wed, 10 Feb 2021 17:07:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9sxI-0003IW-Dw
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:07:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9sxG-0005zz-7g; Wed, 10 Feb 2021 17:07:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9sxF-0005yO-TC; Wed, 10 Feb 2021 17:07:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=27tFXUPh2xwWKtj+Y8n/9TGsuBnMFwQ1a1Ih2Y26U+I=; b=fxliF5bvuBMImMNM6eZaNooTt8
	2vwxq2gJbxz/Pc/zCihJ1UZK7T2Shlu8Whq/Pes7HFXf08uwo8Et8gwOW7oBNvFS+GiGyQ3cI6k7t
	1AaYoc+L/QvJW56s1mgNL2/TzAXAgQSIpHAdO6xSm7X+0om72KBQH4/32drUmKpHScR4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	dwmw@amazon.co.uk
Subject: [PATCH] arm/xen: Don't probe xenbus as part of an early initcall
Date: Wed, 10 Feb 2021 17:06:54 +0000
Message-Id: <20210210170654.5377-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

After Commit 3499ba8198cad ("xen: Fix event channel callback via
INTX/GSI"), xenbus_probe() will be called too early on Arm. This will
recent to a guest hang during boot.

If there hang wasn't there, we would have ended up to call
xenbus_probe() twice (the second time is in xenbus_probe_initcall()).

We don't need to initialize xenbus_probe() early for Arm guest.
Therefore, the call in xen_guest_init() is now removed.

After this change, there is no more external caller for xenbus_probe().
So the function is turned to a static one. Interestingly there were two
prototypes for it.

Fixes: 3499ba8198cad ("xen: Fix event channel callback via INTX/GSI")
Reported-by: Ian Jackson <iwj@xenproject.org>
Signed-off-by: Julien Grall <jgrall@amazon.com>

CC: dwmw@amazon.co.uk

---

The offending commit unfortunately got backport to stable trees. So
this will need to be backported as well.
---
 arch/arm/xen/enlighten.c          | 2 --
 drivers/xen/xenbus/xenbus.h       | 1 -
 drivers/xen/xenbus/xenbus_probe.c | 2 +-
 include/xen/xenbus.h              | 2 --
 4 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 5a957a9a0984..8ad576ecd0f1 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -370,8 +370,6 @@ static int __init xen_guest_init(void)
 		return -ENOMEM;
 	}
 	gnttab_init();
-	if (!xen_initial_domain())
-		xenbus_probe();
 
 	/*
 	 * Making sure board specific code will not set up ops for
diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
index dc1537335414..2a93b7c9c159 100644
--- a/drivers/xen/xenbus/xenbus.h
+++ b/drivers/xen/xenbus/xenbus.h
@@ -115,7 +115,6 @@ int xenbus_probe_node(struct xen_bus_type *bus,
 		      const char *type,
 		      const char *nodename);
 int xenbus_probe_devices(struct xen_bus_type *bus);
-void xenbus_probe(void);
 
 void xenbus_dev_changed(const char *node, struct xen_bus_type *bus);
 
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 18ffd0551b54..8a75092bb148 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -683,7 +683,7 @@ void unregister_xenstore_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(unregister_xenstore_notifier);
 
-void xenbus_probe(void)
+static void xenbus_probe(void)
 {
 	xenstored_ready = 1;
 
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 2c43b0ef1e4d..bf3cfc7c35d0 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -192,8 +192,6 @@ void xs_suspend_cancel(void);
 
 struct work_struct;
 
-void xenbus_probe(void);
-
 #define XENBUS_IS_ERR_READ(str) ({			\
 	if (!IS_ERR(str) && strlen(str) == 0) {		\
 		kfree(str);				\
-- 
2.17.1


