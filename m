Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE9C2F3871
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65886.116874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGR-0005Vo-Kx; Tue, 12 Jan 2021 18:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65886.116874; Tue, 12 Jan 2021 18:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGR-0005UT-AP; Tue, 12 Jan 2021 18:19:31 +0000
Received: by outflank-mailman (input) for mailman id 65886;
 Tue, 12 Jan 2021 18:19:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOCt-0003Yo-24
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:15:51 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6adbe6f-995c-450a-bd66-5c9d8a11a252;
 Tue, 12 Jan 2021 18:14:09 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIE8qP002628;
 Tue, 12 Jan 2021 19:14:08 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDpjf019847;
 Tue, 12 Jan 2021 19:13:51 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 3259C7218; Tue, 12 Jan 2021 19:13:51 +0100 (MET)
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
X-Inumbo-ID: d6adbe6f-995c-450a-bd66-5c9d8a11a252
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] libs/store: make build without PTHREAD_STACK_MIN
Date: Tue, 12 Jan 2021 19:12:38 +0100
Message-Id: <20210112181242.1570-18-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:14:08 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

On NetBSD, PTHREAD_STACK_MIN is not available.
Just use DEFAULT_THREAD_STACKSIZE if PTHREAD_STACK_MIN is not available.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/libs/store/xs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 4ac73ec317..8e646b98d6 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -811,9 +811,13 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
 
 #ifdef USE_PTHREAD
 #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
+#ifndef PTHREAD_STACK_MIN
+#define READ_THREAD_STACKSIZE DEFAULT_THREAD_STACKSIZE
+#else
 #define READ_THREAD_STACKSIZE 					\
 	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
 	PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
+#endif
 
 	/* We dynamically create a reader thread on demand. */
 	mutex_lock(&h->request_mutex);
-- 
2.29.2


