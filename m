Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E03776E2FC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576075.901807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTfU-00058m-Hd; Thu, 03 Aug 2023 08:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576075.901807; Thu, 03 Aug 2023 08:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTfU-00056C-E0; Thu, 03 Aug 2023 08:26:48 +0000
Received: by outflank-mailman (input) for mailman id 576075;
 Thu, 03 Aug 2023 08:26:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wv4z=DU=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qRTfT-000566-6f
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:26:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7afaa859-31d7-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 10:26:44 +0200 (CEST)
Received: from Dell.bugseng.com.homenet.telecomitalia.it
 (host-87-5-121-62.retail.telecomitalia.it [87.5.121.62])
 by support.bugseng.com (Postfix) with ESMTPSA id E99034EE0737;
 Thu,  3 Aug 2023 10:26:43 +0200 (CEST)
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
X-Inumbo-ID: 7afaa859-31d7-11ee-8613-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] xen/string: add missing parameter names
Date: Thu,  3 Aug 2023 10:26:34 +0200
Message-Id: <16c5362b740ed66100b55b528881cb26c1430f15.1691050900.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names to address violation of MISRA C:2012
rule 8.2 ("Function types shall be in prototype form with named
parameters").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
  - memset() adjusted.
---
 xen/include/xen/string.h | 42 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
index b4d2217a96..e91e3112e0 100644
--- a/xen/include/xen/string.h
+++ b/xen/include/xen/string.h
@@ -12,27 +12,27 @@
 #define strncpy __xen_has_no_strncpy__
 #define strncat __xen_has_no_strncat__
 
-size_t strlcpy(char *, const char *, size_t);
-size_t strlcat(char *, const char *, size_t);
-int strcmp(const char *, const char *);
-int strncmp(const char *, const char *, size_t);
-int strcasecmp(const char *, const char *);
-int strncasecmp(const char *, const char *, size_t);
-char *strchr(const char *, int);
-char *strrchr(const char *, int);
-char *strstr(const char *, const char *);
-size_t strlen(const char *);
-size_t strnlen(const char *, size_t);
-char *strpbrk(const char *, const char *);
-char *strsep(char **, const char *);
-size_t strspn(const char *, const char *);
-
-void *memset(void *, int, size_t);
-void *memcpy(void *, const void *, size_t);
-void *memmove(void *, const void *, size_t);
-int memcmp(const void *, const void *, size_t);
-void *memchr(const void *, int, size_t);
-void *memchr_inv(const void *, int, size_t);
+size_t strlcpy(char *dest, const char *src, size_t size);
+size_t strlcat(char *dest, const char *src, size_t size);
+int strcmp(const char *cs, const char *ct);
+int strncmp(const char *cs, const char *ct, size_t count);
+int strcasecmp(const char *s1, const char *s2);
+int strncasecmp(const char *s1, const char *s2, size_t len);
+char *strchr(const char *s, int c);
+char *strrchr(const char *s, int c);
+char *strstr(const char *s1, const char *s2);
+size_t strlen(const char *s);
+size_t strnlen(const char *s, size_t count);
+char *strpbrk(const char *cs, const char *ct);
+char *strsep(char **s, const char *ct);
+size_t strspn(const char *s, const char *accept);
+
+void *memset(void *s, int c, size_t count);
+void *memcpy(void *dest, const void *src, size_t count);
+void *memmove(void *dest, const void *src, size_t count);
+int memcmp(const void *cs, const void *ct, size_t count);
+void *memchr(const void *s, int c, size_t n);
+void *memchr_inv(const void *s, int c, size_t n);
 
 #include <asm/string.h>
 
-- 
2.34.1


