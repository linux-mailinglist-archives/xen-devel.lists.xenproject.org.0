Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3637E7A46
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 09:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629974.982565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NDe-000678-DT; Fri, 10 Nov 2023 08:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629974.982565; Fri, 10 Nov 2023 08:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1NDe-00065S-Ad; Fri, 10 Nov 2023 08:50:26 +0000
Received: by outflank-mailman (input) for mailman id 629974;
 Fri, 10 Nov 2023 08:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc0j=GX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r1NDc-000648-UQ
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 08:50:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fa19f17-7fa6-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 09:50:23 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.162.20.198])
 by support.bugseng.com (Postfix) with ESMTPSA id 47CFB4EE0744;
 Fri, 10 Nov 2023 09:50:22 +0100 (CET)
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
X-Inumbo-ID: 2fa19f17-7fa6-11ee-98da-6d05b1d4d9a1
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
Subject: [XEN PATCH v4] xen/string: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Fri, 10 Nov 2023 09:50:13 +0100
Message-Id: <3e9b167738ade3f5249700d61591af95053ae6bc.1699605505.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names to address violations of
MISRA C:2012 Rule 8.2.

Resolve mismatches between parameter name "count" used in
"xen/lib/mem{cpy,move,set}.c" and parameter name "n" used in
"xen/arch/x86/string.c" to address violations of MISRA C:2012 Rule 8.3.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v4:
  - description improved.
---
Changes in v3:
  - applied changes discussed in the following thread
    https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg00318.html
Changes in v2:
  - memset() adjusted.
---
 xen/include/xen/string.h | 42 ++++++++++++++++++++--------------------
 xen/lib/memcpy.c         |  6 +++---
 xen/lib/memmove.c        | 12 ++++++------
 xen/lib/memset.c         |  6 +++---
 4 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
index b4d2217a96..bd4a8f48e9 100644
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
+char *strpbrk(const char *cs,const char *ct);
+char *strsep(char **s, const char *ct);
+size_t strspn(const char *s, const char *accept);
+
+void *memset(void *s, int c, size_t n);
+void *memcpy(void *dest, const void *src, size_t n);
+void *memmove(void *dest, const void *src, size_t n);
+int memcmp(const void *cs, const void *ct, size_t count);
+void *memchr(const void *s, int c, size_t n);
+void *memchr_inv(const void *s, int c, size_t n);
 
 #include <asm/string.h>
 
diff --git a/xen/lib/memcpy.c b/xen/lib/memcpy.c
index afb322797d..5476121c0d 100644
--- a/xen/lib/memcpy.c
+++ b/xen/lib/memcpy.c
@@ -8,16 +8,16 @@
  * memcpy - Copy one area of memory to another
  * @dest: Where to copy to
  * @src: Where to copy from
- * @count: The size of the area.
+ * @n: The size of the area.
  *
  * You should not use this function to access IO space, use memcpy_toio()
  * or memcpy_fromio() instead.
  */
-void *(memcpy)(void *dest, const void *src, size_t count)
+void *(memcpy)(void *dest, const void *src, size_t n)
 {
 	char *tmp = (char *) dest, *s = (char *) src;
 
-	while (count--)
+	while (n--)
 		*tmp++ = *s++;
 
 	return dest;
diff --git a/xen/lib/memmove.c b/xen/lib/memmove.c
index 1ab79dfb28..99804352e6 100644
--- a/xen/lib/memmove.c
+++ b/xen/lib/memmove.c
@@ -8,23 +8,23 @@
  * memmove - Copy one area of memory to another
  * @dest: Where to copy to
  * @src: Where to copy from
- * @count: The size of the area.
+ * @n: The size of the area.
  *
  * Unlike memcpy(), memmove() copes with overlapping areas.
  */
-void *(memmove)(void *dest, const void *src, size_t count)
+void *(memmove)(void *dest, const void *src, size_t n)
 {
 	char *tmp, *s;
 
 	if (dest <= src) {
 		tmp = (char *) dest;
 		s = (char *) src;
-		while (count--)
+		while (n--)
 			*tmp++ = *s++;
 	} else {
-		tmp = (char *) dest + count;
-		s = (char *) src + count;
-		while (count--)
+		tmp = (char *) dest + n;
+		s = (char *) src + n;
+		while (n--)
 			*--tmp = *--s;
 	}
 
diff --git a/xen/lib/memset.c b/xen/lib/memset.c
index e86afafd02..48a072cb51 100644
--- a/xen/lib/memset.c
+++ b/xen/lib/memset.c
@@ -8,15 +8,15 @@
  * memset - Fill a region of memory with the given value
  * @s: Pointer to the start of the area.
  * @c: The byte to fill the area with
- * @count: The size of the area.
+ * @n: The size of the area.
  *
  * Do not use memset() to access IO space, use memset_io() instead.
  */
-void *(memset)(void *s, int c, size_t count)
+void *(memset)(void *s, int c, size_t n)
 {
 	char *xs = (char *) s;
 
-	while (count--)
+	while (n--)
 		*xs++ = c;
 
 	return s;
-- 
2.34.1


