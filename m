Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1076451CD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 03:13:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455767.713329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2juw-0004GM-8F; Wed, 07 Dec 2022 02:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455767.713329; Wed, 07 Dec 2022 02:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2juw-0004Dr-4o; Wed, 07 Dec 2022 02:12:14 +0000
Received: by outflank-mailman (input) for mailman id 455767;
 Wed, 07 Dec 2022 02:12:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKq1=4F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p2jut-0004Dl-TD
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 02:12:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e5bb331-75d4-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 03:12:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28DD1B81BED;
 Wed,  7 Dec 2022 02:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8454C433C1;
 Wed,  7 Dec 2022 02:12:06 +0000 (UTC)
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
X-Inumbo-ID: 8e5bb331-75d4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670379127;
	bh=KaNQjCOoCnKyAJXKABah3u2RfjuN2EZvKuzl4FDxLmA=;
	h=Date:From:To:cc:Subject:From;
	b=ogJPSAMWgZNaESRZQ42WPHirTudk3dZdnzreyQ0m5aba3FjZy+Is7ahOljqNx9tYy
	 atAqutulgJ2u40VV4c2iHTUjwcy54+uLGHkXP3GOP6wguf9Fu0WxuSD3cG4TgKXEtO
	 uQIBzVAAwVhMOkulQtxWls4QBmBtLk7JQS5dozx1Ansp0CGGdU34ecEsJZAjXaiOnO
	 u9UR3vLukaGinh5+dNiRoCKAmor98hZR8SVd6PfnEY6veVGxwtKYI9auj0XHG04xJt
	 ASevjSGcBwEEol0KT9F1CIz6hjx5lI6S93ryL2YxbaxjFN9g6s+8P4TToo25SYHcld
	 /HUb0D2d9Xjgw==
Date: Tue, 6 Dec 2022 18:12:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, dpsmith@apertussolutions.com
Subject: [PATCH] xsm: misra rule 8.4 fix
Message-ID: <alpine.DEB.2.22.394.2212061808570.4039@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Fix two MISRA Issues Rule 8.4 ("A compatible declaration shall be
visible when an object or function with external linkage is defined")
found by cppcheck affecting xen/xsm/flask/ss/services.c.

Fix the first issue by making policydb_loaded_version static and the
second issue by declaring ss_initialized in a proper header.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index d319466c6b..b866e8d05f 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -56,8 +56,6 @@ static int bool_num = 0;
 static int *bool_pending_values = NULL;
 static int flask_security_make_bools(void);
 
-extern int ss_initialized;
-
 static int __init cf_check parse_flask_param(const char *s)
 {
     if ( !strcmp(s, "enforcing") )
diff --git a/xen/xsm/flask/private.h b/xen/xsm/flask/private.h
index 429f213cce..2e0e65489c 100644
--- a/xen/xsm/flask/private.h
+++ b/xen/xsm/flask/private.h
@@ -6,4 +6,6 @@
 long cf_check do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
 int cf_check compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
 
+extern int ss_initialized;
+
 #endif /* XSM_FLASK_PRIVATE */
diff --git a/xen/xsm/flask/ss/services.c b/xen/xsm/flask/ss/services.c
index dab07b5f60..4665f3b007 100644
--- a/xen/xsm/flask/ss/services.c
+++ b/xen/xsm/flask/ss/services.c
@@ -53,7 +53,7 @@
 #include "conditional.h"
 #include "mls.h"
 
-unsigned int policydb_loaded_version;
+static unsigned int policydb_loaded_version;
 
 static DEFINE_RWLOCK(policy_rwlock);
 #define POLICY_RDLOCK read_lock(&policy_rwlock)

