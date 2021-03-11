Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3D433756B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96575.182853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMDr-0003gz-HU; Thu, 11 Mar 2021 14:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96575.182853; Thu, 11 Mar 2021 14:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMDr-0003g9-Bo; Thu, 11 Mar 2021 14:23:31 +0000
Received: by outflank-mailman (input) for mailman id 96575;
 Thu, 11 Mar 2021 14:23:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+5TX=IJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lKMDp-0003YK-OQ
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:23:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9b36932-40de-42df-acc1-6faa5f5b808e;
 Thu, 11 Mar 2021 14:23:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D408AD72;
 Thu, 11 Mar 2021 14:23:23 +0000 (UTC)
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
X-Inumbo-ID: f9b36932-40de-42df-acc1-6faa5f5b808e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615472603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUUExa3MttAImINlrgzpHFxRG0q5LayeW3GQCnY3KsA=;
	b=ZAJxz53QZ7oat6o13Y5McdL+0NLo0AOUsKeLSZhrjUJm9UE7qukAPTgq1bHXLBoIrMcD+3
	pmO7slOuYsC9MUCYrNLiHLu0R/fXSGRJuTK+bZttZep1uutL90lHPnmqwjUO+iVDqIgcDP
	Q+cCc9dkb9LQXbNvC9wls1PJDHWBLKM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v7 03/14] static_call: add function to query current function
Date: Thu, 11 Mar 2021 15:23:08 +0100
Message-Id: <20210311142319.4723-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311142319.4723-1-jgross@suse.com>
References: <20210311142319.4723-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some users of paravirtualized functions need to query which function
has been specified in a pv_ops vector element. In order to be able to
switch such paravirtualized functions to static_calls instead, there
needs to be a function to query the function which will be called via
static_call().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V7:
- new patch
---
 include/linux/static_call.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/static_call.h b/include/linux/static_call.h
index 76b881259144..e01b61ab86b1 100644
--- a/include/linux/static_call.h
+++ b/include/linux/static_call.h
@@ -20,6 +20,7 @@
  *   static_call(name)(args...);
  *   static_call_cond(name)(args...);
  *   static_call_update(name, func);
+ *   static_call_query(name);
  *
  * Usage example:
  *
@@ -91,6 +92,10 @@
  *
  *   which will include the required value tests to avoid NULL-pointer
  *   dereferences.
+ *
+ *   To query which function is currently set to be called, use:
+ *
+ *   func = static_call_query(name);
  */
 
 #include <linux/types.h>
@@ -118,6 +123,8 @@ extern void arch_static_call_transform(void *site, void *tramp, void *func, bool
 			     STATIC_CALL_TRAMP_ADDR(name), func);	\
 })
 
+#define static_call_query(name) (READ_ONCE(STATIC_CALL_KEY(name).func))
+
 #ifdef CONFIG_HAVE_STATIC_CALL_INLINE
 
 extern int __init static_call_init(void);
@@ -191,6 +198,7 @@ static inline int static_call_init(void) { return 0; }
 	};								\
 	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
 
+
 #define static_call_cond(name)	(void)__static_call(name)
 
 static inline
-- 
2.26.2


