Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B23B35136C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 12:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104348.199513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuXq-0003fT-Ey; Thu, 01 Apr 2021 10:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104348.199513; Thu, 01 Apr 2021 10:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRuXq-0003f3-Bd; Thu, 01 Apr 2021 10:27:22 +0000
Received: by outflank-mailman (input) for mailman id 104348;
 Thu, 01 Apr 2021 10:27:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRuXo-0003es-OI
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 10:27:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a81a439-b431-45db-9751-ccc66b09c34a;
 Thu, 01 Apr 2021 10:27:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6FD4AED7;
 Thu,  1 Apr 2021 10:27:18 +0000 (UTC)
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
X-Inumbo-ID: 1a81a439-b431-45db-9751-ccc66b09c34a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617272839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SjGtm5W7+Y86JR8RySHNQ6b5vRhziaOW7hdEkR5iKDg=;
	b=Jc31pHl8aesvIsWE6/VcRkjFdPLqtXGbS6KUplq9842osHVXpo22OVq/8laWFTKEJxRqGT
	TsqCP1bXFaz4fE3GfJODgxgMi/mCMui0kaDFWwUb1qOvnBIaj/AZo5WAyNwNkWUYgYTScm
	bAMHYSLcWkRl5Ebb4eis+/PhYSFrmW4=
Subject: [PATCH 20/23] lib: move/rename strnicmp() to strncasecmp()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Message-ID: <1db40fc3-df7d-530e-6288-261dbd200e26@suse.com>
Date: Thu, 1 Apr 2021 12:27:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While moving the implementation, also rename it to match strcasecmp(),
allowing the similar use of a compiler builting in this case as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1223,8 +1223,8 @@ static int __init map_range_to_domain(co
      * They are not MMIO and therefore a domain should not be able to
      * manage them via the IOMEM interface.
      */
-    if ( strnicmp(dt_node_full_name(dev), "/reserved-memory/",
-         strlen("/reserved-memory/")) != 0 )
+    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
+                     strlen("/reserved-memory/")) != 0 )
     {
         res = iomem_permit_access(d, paddr_to_pfn(addr),
                 paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
--- a/xen/common/string.c
+++ b/xen/common/string.c
@@ -8,39 +8,6 @@
 #include <xen/string.h>
 #include <xen/ctype.h>
 
-#ifndef __HAVE_ARCH_STRNICMP
-/**
- * strnicmp - Case insensitive, length-limited string comparison
- * @s1: One string
- * @s2: The other string
- * @len: the maximum number of characters to compare
- */
-int strnicmp(const char *s1, const char *s2, size_t len)
-{
-	/* Yes, Virginia, it had better be unsigned */
-	unsigned char c1, c2;
-
-	c1 = 0;	c2 = 0;
-	if (len) {
-		do {
-			c1 = *s1; c2 = *s2;
-			s1++; s2++;
-			if (!c1)
-				break;
-			if (!c2)
-				break;
-			if (c1 == c2)
-				continue;
-			c1 = tolower(c1);
-			c2 = tolower(c2);
-			if (c1 != c2)
-				break;
-		} while (--len);
-	}
-	return (int)c1 - (int)c2;
-}
-#endif
-
 #ifndef __HAVE_ARCH_STRSPN
 /**
  * strspn - Calculate the length of the initial substring of @s which only
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -275,14 +275,14 @@ static int get_cpufreq_para(struct xen_s
         strlcpy(op->u.get_para.scaling_governor, "Unknown", CPUFREQ_NAME_LEN);
 
     /* governor specific para */
-    if ( !strnicmp(op->u.get_para.scaling_governor, 
-                   "userspace", CPUFREQ_NAME_LEN) )
+    if ( !strncasecmp(op->u.get_para.scaling_governor,
+                      "userspace", CPUFREQ_NAME_LEN) )
     {
         op->u.get_para.u.userspace.scaling_setspeed = policy->cur;
     }
 
-    if ( !strnicmp(op->u.get_para.scaling_governor, 
-                   "ondemand", CPUFREQ_NAME_LEN) )
+    if ( !strncasecmp(op->u.get_para.scaling_governor,
+                      "ondemand", CPUFREQ_NAME_LEN) )
     {
         ret = get_cpufreq_ondemand_para(
             &op->u.get_para.u.ondemand.sampling_rate_max,
@@ -350,8 +350,8 @@ static int set_cpufreq_para(struct xen_s
     {
         unsigned int freq =op->u.set_para.ctrl_value;
 
-        if ( !strnicmp(policy->governor->name,
-                       "userspace", CPUFREQ_NAME_LEN) )
+        if ( !strncasecmp(policy->governor->name,
+                          "userspace", CPUFREQ_NAME_LEN) )
             ret = write_userspace_scaling_setspeed(op->cpuid, freq);
         else
             ret = -EINVAL;
@@ -363,8 +363,8 @@ static int set_cpufreq_para(struct xen_s
     {
         unsigned int sampling_rate = op->u.set_para.ctrl_value;
 
-        if ( !strnicmp(policy->governor->name,
-                       "ondemand", CPUFREQ_NAME_LEN) )
+        if ( !strncasecmp(policy->governor->name,
+                          "ondemand", CPUFREQ_NAME_LEN) )
             ret = write_ondemand_sampling_rate(sampling_rate);
         else
             ret = -EINVAL;
@@ -376,8 +376,8 @@ static int set_cpufreq_para(struct xen_s
     {
         unsigned int up_threshold = op->u.set_para.ctrl_value;
 
-        if ( !strnicmp(policy->governor->name,
-                       "ondemand", CPUFREQ_NAME_LEN) )
+        if ( !strncasecmp(policy->governor->name,
+                          "ondemand", CPUFREQ_NAME_LEN) )
             ret = write_ondemand_up_threshold(up_threshold);
         else
             ret = -EINVAL;
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -111,7 +111,7 @@ struct cpufreq_governor *__find_governor
         return NULL;
 
     list_for_each_entry(t, &cpufreq_governor_list, governor_list)
-        if (!strnicmp(governor, t->name, CPUFREQ_NAME_LEN))
+        if (!strncasecmp(governor, t->name, CPUFREQ_NAME_LEN))
             return t;
 
     return NULL;
--- a/xen/include/xen/string.h
+++ b/xen/include/xen/string.h
@@ -16,8 +16,8 @@ size_t strlcpy(char *, const char *, siz
 size_t strlcat(char *, const char *, size_t);
 int strcmp(const char *, const char *);
 int strncmp(const char *, const char *, size_t);
-int strnicmp(const char *, const char *, size_t);
 int strcasecmp(const char *, const char *);
+int strncasecmp(const char *, const char *, size_t);
 char *strchr(const char *, int);
 char *strrchr(const char *, int);
 char *strstr(const char *, const char *);
@@ -48,6 +48,10 @@ void *memchr_inv(const void *, int, size
 #define strcasecmp(s1, s2) __builtin_strcasecmp(s1, s2)
 #endif
 
+#ifndef __HAVE_ARCH_STRCASECMP
+#define strncasecmp(s1, s2, n) __builtin_strncasecmp(s1, s2, n)
+#endif
+
 #ifndef __HAVE_ARCH_STRCHR
 #define strchr(s1, c) __builtin_strchr(s1, c)
 #endif
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -20,6 +20,7 @@ lib-y += strcmp.o
 lib-y += strlcat.o
 lib-y += strlcpy.o
 lib-y += strlen.o
+lib-y += strncasecmp.o
 lib-y += strncmp.o
 lib-y += strnlen.o
 lib-y += strrchr.o
--- /dev/null
+++ b/xen/lib/strncasecmp.c
@@ -0,0 +1,47 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/string.h>
+#include <xen/ctype.h>
+
+/**
+ * strncasecmp - Case insensitive, length-limited string comparison
+ * @s1: One string
+ * @s2: The other string
+ * @len: the maximum number of characters to compare
+ */
+int (strncasecmp)(const char *s1, const char *s2, size_t len)
+{
+	/* Yes, Virginia, it had better be unsigned */
+	unsigned char c1, c2;
+
+	c1 = 0;	c2 = 0;
+	if (len) {
+		do {
+			c1 = *s1; c2 = *s2;
+			s1++; s2++;
+			if (!c1)
+				break;
+			if (!c2)
+				break;
+			if (c1 == c2)
+				continue;
+			c1 = tolower(c1);
+			c2 = tolower(c2);
+			if (c1 != c2)
+				break;
+		} while (--len);
+	}
+	return (int)c1 - (int)c2;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * indent-tabs-mode: t
+ * End:
+ */


