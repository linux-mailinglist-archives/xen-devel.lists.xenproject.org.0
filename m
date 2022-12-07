Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7095E6464F9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 00:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456716.714509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p33mC-0004NN-7K; Wed, 07 Dec 2022 23:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456716.714509; Wed, 07 Dec 2022 23:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p33mC-0004KV-4e; Wed, 07 Dec 2022 23:24:32 +0000
Received: by outflank-mailman (input) for mailman id 456716;
 Wed, 07 Dec 2022 23:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKq1=4F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p33mA-0004KP-La
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 23:24:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b2a8b5d-7686-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 00:24:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5700761CE0;
 Wed,  7 Dec 2022 23:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05975C433D6;
 Wed,  7 Dec 2022 23:24:25 +0000 (UTC)
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
X-Inumbo-ID: 4b2a8b5d-7686-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670455466;
	bh=WAqWB3t5CnIwaEbiZi19UdDQY/tdq/ds7+fkA0hfB9M=;
	h=Date:From:To:cc:Subject:From;
	b=olqwGsYJgdpy5HjTu8W8cL2qlr8tYSho7a8aU1EXQrMxa2sJ2+/D94hiTg618Eyw+
	 p0HtGXh5KC+ZQ4VpKD7GDGMrP2Z2AR7F9F9JlA2MltqsU6iAqfPfE8jw2rboe3bQ3g
	 k+eWrK/r+l49c3T21SR6eXUgivuIuclt5Nu1jU6ud7p9HbKzxZhWVm3OV47lVprMCD
	 s/tH6RkXJy1F3xQD5YEUsYJaBu/nznBFNXfhO0iadfinH3G99BFHqUsZbJWKahmK0a
	 56K/wNUm2aKEpY6bQrZt7YbdALVTP34+E0fnW/muhY+bC50T+4H6r/evEwHyG2czrO
	 FvOiN90bv8FHw==
Date: Wed, 7 Dec 2022 15:24:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, dpsmith@apertussolutions.com, jbeulich@suse.com, 
    michal.orzel@amd.com
Subject: [PATCH v2] xsm/flask: misra rule 8.4 fix
Message-ID: <alpine.DEB.2.22.394.2212071519340.4039@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Fix several MISRA Issues Rule 8.4 ("A compatible declaration shall be
visible when an object or function with external linkage is defined")
found by cppcheck affecting xen/xsm/flask.

- policydb_loaded_version is not declared; removed it because it is
  unused
- move ss_initialized declaration to xen/xsm/flask/include/conditional.h
- #include <conditional.h> (which is
  xen/xsm/flask/include/conditional.h) in xen/xsm/flask/ss/policydb.c so
  that policydb.c also gets the declaration of ss_initialized
- #include <conditional.h> in xen/xsm/flask/ss/services.c to declare
  security_*_bools functions that services.c is defining and using

This patch solves all the Rule 8.4 violations found by cppcheck on xsm/

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
diff --git a/xen/xsm/flask/include/conditional.h b/xen/xsm/flask/include/conditional.h
index 90553405b0..879d40e147 100644
--- a/xen/xsm/flask/include/conditional.h
+++ b/xen/xsm/flask/include/conditional.h
@@ -24,4 +24,6 @@ int security_find_bool(const char *name);
 char *security_get_bool_name(unsigned int b);
 int security_get_bool_value(unsigned int b);
 
+extern int ss_initialized;
+
 #endif
diff --git a/xen/xsm/flask/ss/policydb.c b/xen/xsm/flask/ss/policydb.c
index 162470bbbd..7f232f92fa 100644
--- a/xen/xsm/flask/ss/policydb.c
+++ b/xen/xsm/flask/ss/policydb.c
@@ -28,6 +28,7 @@
 #include <xen/xmalloc.h>
 #include <xen/string.h>
 #include <xen/errno.h>
+#include <conditional.h>
 #include "security.h"
 
 #include "policydb.h"
@@ -1730,8 +1731,6 @@ static int policydb_bounds_sanity_check(struct policydb *p)
     return 0;
 }
 
-extern int ss_initialized;
-
 /*
  * Read the configuration data from a policy database binary
  * representation file into a policy database structure.
diff --git a/xen/xsm/flask/ss/services.c b/xen/xsm/flask/ss/services.c
index dab07b5f60..35ad1034ca 100644
--- a/xen/xsm/flask/ss/services.c
+++ b/xen/xsm/flask/ss/services.c
@@ -42,6 +42,7 @@
 #include <xen/spinlock.h>
 #include <xen/rwlock.h>
 #include <xen/errno.h>
+#include <conditional.h>
 #include "flask.h"
 #include "avc.h"
 #include "avc_ss.h"
@@ -53,8 +54,6 @@
 #include "conditional.h"
 #include "mls.h"
 
-unsigned int policydb_loaded_version;
-
 static DEFINE_RWLOCK(policy_rwlock);
 #define POLICY_RDLOCK read_lock(&policy_rwlock)
 #define POLICY_WRLOCK write_lock(&policy_rwlock)
@@ -1388,7 +1387,6 @@ int security_load_policy(const void *data, size_t len)
             policydb_destroy(&policydb);
             return -EINVAL;
         }
-        policydb_loaded_version = policydb.policyvers;
         ss_initialized = 1;
         seqno = ++latest_granting;
         LOAD_UNLOCK;
@@ -1447,7 +1445,6 @@ int security_load_policy(const void *data, size_t len)
     memcpy(&policydb, &newpolicydb, sizeof policydb);
     sidtab_set(&sidtab, &newsidtab);
     seqno = ++latest_granting;
-    policydb_loaded_version = policydb.policyvers;
     POLICY_WRUNLOCK;
     LOAD_UNLOCK;
 

