Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FFD32EA8D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 13:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93654.176647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9kb-0001WJ-Bc; Fri, 05 Mar 2021 12:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93654.176647; Fri, 05 Mar 2021 12:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9kb-0001Vt-7l; Fri, 05 Mar 2021 12:40:13 +0000
Received: by outflank-mailman (input) for mailman id 93654;
 Fri, 05 Mar 2021 12:40:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lI9kZ-0001Ur-A5
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 12:40:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lI9kY-0005oV-0x; Fri, 05 Mar 2021 12:40:10 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lI9kX-0007BR-MZ; Fri, 05 Mar 2021 12:40:09 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=1fsPk6D4wrcBPoTOXONkzXRSuL3h5zuch3BSAYZOrp8=; b=ApSrvFI9sufdhxLqbxGeZuvSQ
	BMymlkbopaVI45dmFQqE+tEEdfPSYXsGsEQhaNXdv3wLAsqrdYgbC+mdcYJcOBGvlPgokuF2X8dzF
	c3gCIIbykQJjYGHl16iEgyyx8dOH0CW+t5r9TMwIdNqXsahgKuGejZewaDIz0qFYiRrVE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 1/2] tools/xenstore: Consolidate PRINTF_ATTRIBUTE() in utils.h
Date: Fri,  5 Mar 2021 12:40:02 +0000
Message-Id: <20210305124003.13582-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210305124003.13582-1-julien@xen.org>
References: <20210305124003.13582-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

At the moment PRINTF_ATTRIBUTE() is defined in two places:
    - tdb.h: Defined as a NOP
    - talloc.h: Defined as a NOP for GCC older than 3.0 otherwise will
    add the attribute to check the printf format

Xen requires to build with minimum GCC 4.1 and we want to check the
printf format for all the printf-like functions.

Only implement PRINTF_ATTRIBUTE() once in utils.h and drop the
conditional check for GCC < 3.0.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/talloc.h | 15 ++-------------
 tools/xenstore/tdb.h    |  6 ++----
 tools/xenstore/utils.h  |  2 ++
 3 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/tools/xenstore/talloc.h b/tools/xenstore/talloc.h
index 71a36e7be06b..a0f4bff25788 100644
--- a/tools/xenstore/talloc.h
+++ b/tools/xenstore/talloc.h
@@ -26,6 +26,8 @@
 
 #include <sys/types.h>
 
+#include "utils.h"
+
 /* this is only needed for compatibility with the old talloc */
 typedef void TALLOC_CTX;
 
@@ -84,19 +86,6 @@ typedef void TALLOC_CTX;
 #define talloc_destroy(ctx) talloc_free(ctx)
 #endif
 
-#ifndef PRINTF_ATTRIBUTE
-#if (__GNUC__ >= 3)
-/** Use gcc attribute to check printf fns.  a1 is the 1-based index of
- * the parameter containing the format, and a2 the index of the first
- * argument. Note that some gcc 2.x versions don't handle this
- * properly **/
-#define PRINTF_ATTRIBUTE(a1, a2) __attribute__ ((format (__printf__, a1, a2)))
-#else
-#define PRINTF_ATTRIBUTE(a1, a2)
-#endif
-#endif
-
-
 /* The following definitions come from talloc.c  */
 void *_talloc(const void *context, size_t size);
 void talloc_set_destructor(const void *ptr, int (*destructor)(void *));
diff --git a/tools/xenstore/tdb.h b/tools/xenstore/tdb.h
index 557cf727b869..ce3c7339f884 100644
--- a/tools/xenstore/tdb.h
+++ b/tools/xenstore/tdb.h
@@ -1,6 +1,8 @@
 #ifndef __TDB_H__
 #define __TDB_H__
 
+#include "utils.h"
+
 /* 
    Unix SMB/CIFS implementation.
 
@@ -84,10 +86,6 @@ struct tdb_traverse_lock {
 	uint32_t hash;
 };
 
-#ifndef PRINTF_ATTRIBUTE
-#define PRINTF_ATTRIBUTE(a,b)
-#endif
-
 /* this is the context structure that is returned from a db open */
 typedef struct tdb_context {
 	char *name; /* the name of the database */
diff --git a/tools/xenstore/utils.h b/tools/xenstore/utils.h
index df1cb9a3bac6..3dfb96b556dd 100644
--- a/tools/xenstore/utils.h
+++ b/tools/xenstore/utils.h
@@ -27,6 +27,8 @@ static inline bool strends(const char *a, const char *b)
  */
 const char *dump_state_align(FILE *fp);
 
+#define PRINTF_ATTRIBUTE(a1, a2) __attribute__((format (printf, a1, a2)))
+
 void barf(const char *fmt, ...) __attribute__((noreturn));
 void barf_perror(const char *fmt, ...) __attribute__((noreturn));
 
-- 
2.17.1


