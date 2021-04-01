Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B22351347
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104288.199296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuR3-0001Y8-TR; Thu, 01 Apr 2021 10:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104288.199296; Thu, 01 Apr 2021 10:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuR3-0001Xh-Pq; Thu, 01 Apr 2021 10:20:21 +0000
Received: by outflank-mailman (input) for mailman id 104288;
 Thu, 01 Apr 2021 10:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuR2-0001Xa-CN
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:20:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a2154c3-18a5-4c48-9603-4d3dc9c13d9b;
 Thu, 01 Apr 2021 10:20:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 811A6AE86;
 Thu,  1 Apr 2021 10:20:18 +0000 (UTC)
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
X-Inumbo-ID: 4a2154c3-18a5-4c48-9603-4d3dc9c13d9b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPkeQToxrrrMgDYsF5+OEyCjKJhGCfAdjAB1QD105BY=;
	b=pfFcnH7t3pM/LgBQSszXHdKaTOpO8A45FuPaoYHiidjH6Asav228TrSkkL1WHsKLfaAb7a
	OtU+tsrVNsMAgMIqSHAhk7SubEazHg82ELaucIDsPkQGfd7ZjSFHUiODCMWpdZz+fWfwg3
	rBZzvFL6dFw8K76vw6y1FLMMFB3FuT4=
Subject: [PATCH 03/23] string: drop redundant declarations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <e0915251-b0cc-79ee-feec-08722e1243fb@suse.com>
Date: Thu, 1 Apr 2021 12:20:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These standard functions shouldn't need custom declarations. The only
case where redundancy might be needed is if there were inline functions
there. But we don't have any here (anymore). Prune the per-arch headers
of duplicate declarations while moving the asm/string.h inclusion past
the declarations.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-arm/string.h
+++ b/xen/include/asm-arm/string.h
@@ -8,41 +8,21 @@
  */
 
 #define __HAVE_ARCH_STRRCHR
-char *strrchr(const char *s, int c);
-
 #define __HAVE_ARCH_STRCHR
-char *strchr(const char *s, int c);
-
 #if defined(CONFIG_ARM_64)
 #define __HAVE_ARCH_STRCMP
-int strcmp(const char *, const char *);
-
 #define __HAVE_ARCH_STRNCMP
-int strncmp(const char *, const char *, size_t);
-
 #define __HAVE_ARCH_STRLEN
-size_t strlen(const char *);
-
 #define __HAVE_ARCH_STRNLEN
-size_t strnlen(const char *, size_t);
 #endif
 
 #define __HAVE_ARCH_MEMCPY
-void *memcpy(void *, const void *, size_t);
-
 #if defined(CONFIG_ARM_64)
 #define __HAVE_ARCH_MEMCMP
-int memcmp(const void *, const void *, size_t);
 #endif
-
 #define __HAVE_ARCH_MEMMOVE
-void *memmove(void *dest, const void *src, size_t n);
-
 #define __HAVE_ARCH_MEMSET
-void *memset(void *, int, size_t);
-
 #define __HAVE_ARCH_MEMCHR
-void *memchr(const void *, int, size_t);
 
 #if defined(CONFIG_ARM_32)
 
--- a/xen/include/asm-x86/string.h
+++ b/xen/include/asm-x86/string.h
@@ -2,15 +2,12 @@
 #define __X86_STRING_H__
 
 #define __HAVE_ARCH_MEMCPY
-void *memcpy(void *dest, const void *src, size_t n);
 #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
 
 #define __HAVE_ARCH_MEMMOVE
-void *memmove(void *dest, const void *src, size_t n);
 #define memmove(d, s, n) __builtin_memmove(d, s, n)
 
 #define __HAVE_ARCH_MEMSET
-void *memset(void *dest, int c, size_t n);
 #define memset(s, c, n) __builtin_memset(s, c, n)
 
 #endif /* __X86_STRING_H__ */
--- a/xen/include/xen/string.h
+++ b/xen/include/xen/string.h
@@ -4,11 +4,6 @@
 #include <xen/types.h>	/* for size_t */
 
 /*
- * Include machine specific inline routines
- */
-#include <asm/string.h>
-
-/*
  * These string functions are considered too dangerous for normal use.
  * Use safe_strcpy(), safe_strcat(), strlcpy(), strlcat() as appropriate.
  */
@@ -17,97 +12,78 @@
 #define strncpy __xen_has_no_strncpy__
 #define strncat __xen_has_no_strncat__
 
-#ifndef __HAVE_ARCH_STRLCPY
 size_t strlcpy(char *, const char *, size_t);
-#endif
-
-#ifndef __HAVE_ARCH_STRLCAT
 size_t strlcat(char *, const char *, size_t);
-#endif
+int strcmp(const char *, const char *);
+int strncmp(const char *, const char *, size_t);
+int strnicmp(const char *, const char *, size_t);
+int strcasecmp(const char *, const char *);
+char *strchr(const char *, int);
+char *strrchr(const char *, int);
+char *strstr(const char *, const char *);
+size_t strlen(const char *);
+size_t strnlen(const char *, size_t);
+char *strpbrk(const char *, const char *);
+char *strsep(char **, const char *);
+size_t strspn(const char *, const char *);
+
+void *memset(void *, int, size_t);
+void *memcpy(void *, const void *, size_t);
+void *memmove(void *, const void *, size_t);
+int memcmp(const void *, const void *, size_t);
+void *memchr(const void *, int, size_t);
+void *memchr_inv(const void *, int, size_t);
+
+#include <asm/string.h>
 
 #ifndef __HAVE_ARCH_STRCMP
-int strcmp(const char *, const char *);
 #define strcmp(s1, s2) __builtin_strcmp(s1, s2)
 #endif
 
 #ifndef __HAVE_ARCH_STRNCMP
-int strncmp(const char *, const char *, size_t);
 #define strncmp(s1, s2, n) __builtin_strncmp(s1, s2, n)
 #endif
 
-#ifndef __HAVE_ARCH_STRNICMP
-int strnicmp(const char *, const char *, size_t);
-#endif
-
 #ifndef __HAVE_ARCH_STRCASECMP
-int strcasecmp(const char *, const char *);
 #define strcasecmp(s1, s2) __builtin_strcasecmp(s1, s2)
 #endif
 
 #ifndef __HAVE_ARCH_STRCHR
-char *strchr(const char *, int);
 #define strchr(s1, c) __builtin_strchr(s1, c)
 #endif
 
 #ifndef __HAVE_ARCH_STRRCHR
-char *strrchr(const char *, int);
 #define strrchr(s1, c) __builtin_strrchr(s1, c)
 #endif
 
 #ifndef __HAVE_ARCH_STRSTR
-char *strstr(const char *, const char *);
 #define strstr(s1, s2) __builtin_strstr(s1, s2)
 #endif
 
 #ifndef __HAVE_ARCH_STRLEN
-size_t strlen(const char *);
 #define strlen(s1) __builtin_strlen(s1)
 #endif
 
-#ifndef __HAVE_ARCH_STRNLEN
-size_t strnlen(const char *, size_t);
-#endif
-
-#ifndef __HAVE_ARCH_STRPBRK
-char *strpbrk(const char *, const char *);
-#endif
-
-#ifndef __HAVE_ARCH_STRSEP
-char *strsep(char **, const char *);
-#endif
-
-#ifndef __HAVE_ARCH_STRSPN
-size_t strspn(const char *, const char *);
-#endif
-
-
 #ifndef __HAVE_ARCH_MEMSET
-void *memset(void *, int, size_t);
 #define memset(s, c, n) __builtin_memset(s, c, n)
 #endif
 
 #ifndef __HAVE_ARCH_MEMCPY
-void *memcpy(void *, const void *, size_t);
 #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
 #endif
 
 #ifndef __HAVE_ARCH_MEMMOVE
-void *memmove(void *, const void *, size_t);
 #define memmove(d, s, n) __builtin_memmove(d, s, n)
 #endif
 
 #ifndef __HAVE_ARCH_MEMCMP
-int memcmp(const void *, const void *, size_t);
 #define memcmp(s1, s2, n) __builtin_memcmp(s1, s2, n)
 #endif
 
 #ifndef __HAVE_ARCH_MEMCHR
-void *memchr(const void *, int, size_t);
 #define memchr(s, c, n) __builtin_memchr(s, c, n)
 #endif
 
-void *memchr_inv(const void *, int, size_t);
-
 #define is_char_array(x) __builtin_types_compatible_p(typeof(x), char[])
 
 /* safe_xxx always NUL-terminates and returns !=0 if result is truncated. */


