Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2B82B9B17
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 20:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31364.61720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHk-0005az-JL; Thu, 19 Nov 2020 19:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31364.61720; Thu, 19 Nov 2020 19:08:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHk-0005aN-FO; Thu, 19 Nov 2020 19:08:00 +0000
Received: by outflank-mailman (input) for mailman id 31364;
 Thu, 19 Nov 2020 19:07:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfpHi-0005Y6-3U
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:07:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHh-0003Ss-Qi; Thu, 19 Nov 2020 19:07:57 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHh-0000TE-Ia; Thu, 19 Nov 2020 19:07:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHi-0005Y6-3U
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=OboHhEHEvSZ64fH4mO7AsxamLOG7CeMXAAQmTYLPwD0=; b=nxMldoX8fo6JIFDoFUq3JXAQZ
	IirT47R30UvlFUhhaYsFHvyUpOZfY8QNrNlbch3PqDjSe/IyEhNkZrV6yMbjtarBnjdiPawRBKqL0
	DeqnHdJXGjt3NvT11mgBXw/dw3+S1x2I8oRis0OguvPO90nfTbP60ojmlWm2Psdr8fvFw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHh-0003Ss-Qi; Thu, 19 Nov 2020 19:07:57 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHh-0000TE-Ia; Thu, 19 Nov 2020 19:07:57 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFC 3/6] xen/arm: setup: Call unregister_init_virtual_region() after the last init function
Date: Thu, 19 Nov 2020 19:07:48 +0000
Message-Id: <20201119190751.22345-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119190751.22345-1-julien@xen.org>
References: <20201119190751.22345-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

discard_init_modules() is an init function, if the path contains a
BUG() or WARN() we still want to get the full stack trace.

The init virtual region is now kept after the last init function has
been called.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7fcff9af2a7e..2532ec973913 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -72,10 +72,11 @@ domid_t __read_mostly max_init_domid;
 
 static __used void init_done(void)
 {
+    discard_initial_modules();
+
     /* Must be done past setting system_state. */
     unregister_init_virtual_region();
 
-    discard_initial_modules();
     free_init_memory();
     startup_cpu_idle_loop();
 }
-- 
2.17.1


