Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B82E1F38
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:06:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58460.102821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6dl-0005O0-D2; Wed, 23 Dec 2020 16:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58460.102821; Wed, 23 Dec 2020 16:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6dl-0005Nb-94; Wed, 23 Dec 2020 16:05:29 +0000
Received: by outflank-mailman (input) for mailman id 58460;
 Wed, 23 Dec 2020 16:05:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks6dj-0005NW-SY
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:05:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63ff16fd-c773-4ebf-b5ce-eb4b6a79d068;
 Wed, 23 Dec 2020 16:05:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1E32ACC6;
 Wed, 23 Dec 2020 16:05:25 +0000 (UTC)
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
X-Inumbo-ID: 63ff16fd-c773-4ebf-b5ce-eb4b6a79d068
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608739525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7+i/+o1/2Ftjswwt7furQ6LnkH0Q746Q6++4dF3IrYI=;
	b=FvpeRJ6R0qRNkLRLa2ooeJ1psr3SpA+kAsYhdGFI3LWg8/Z9iDDORJKwruY2P013484Sd8
	d5xzGVNpSIFiH6QXzRGmXonGhadZE58auc7y9aQX6tHqAaxe3e6Hqpn3gnDaIjK0eeq8hW
	JDoe/hciuVKDEYflvvdV+j3znRGktig=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] lib: drop (replace) debug_build()
Message-ID: <ae31ccf1-7334-cdf9-9b90-edac7ca4e148@suse.com>
Date: Wed, 23 Dec 2020 17:05:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Its expansion shouldn't be tied to NDEBUG - down the road we may want to
allow enabling assertions independently of CONFIG_DEBUG. Replace the few
uses by a new xen_build_info() helper, subsuming gcov_string at the same
time (while replacing the stale CONFIG_GCOV used there) and also adding
CONFIG_UBSAN indication.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Introduce xen_build_info() including also gcov and ubsan info.

--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -175,14 +175,14 @@ static void print_xen_info(void)
 {
     char taint_str[TAINT_STRING_MAX_LEN];
 
-    printk("----[ Xen-%d.%d%s  %s  debug=%c " gcov_string "  %s ]----\n",
+    printk("----[ Xen-%d.%d%s  %s  %s  %s ]----\n",
            xen_major_version(), xen_minor_version(), xen_extra_version(),
 #ifdef CONFIG_ARM_32
            "arm32",
 #else
            "arm64",
 #endif
-           debug_build() ? 'y' : 'n', print_tainted(taint_str));
+           xen_build_info(), print_tainted(taint_str));
 }
 
 #ifdef CONFIG_ARM_32
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -29,9 +29,9 @@ static void print_xen_info(void)
 {
     char taint_str[TAINT_STRING_MAX_LEN];
 
-    printk("----[ Xen-%d.%d%s  x86_64  debug=%c " gcov_string "  %s ]----\n",
+    printk("----[ Xen-%d.%d%s  x86_64  %s  %s ]----\n",
            xen_major_version(), xen_minor_version(), xen_extra_version(),
-           debug_build() ? 'y' : 'n', print_tainted(taint_str));
+           xen_build_info(), print_tainted(taint_str));
 }
 
 enum context { CTXT_hypervisor, CTXT_pv_guest, CTXT_hvm_guest };
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -70,6 +70,30 @@ const char *xen_deny(void)
     return "<denied>";
 }
 
+static const char build_info[] =
+    "debug="
+#ifdef CONFIG_DEBUG
+    "y"
+#else
+    "n"
+#endif
+#ifdef CONFIG_COVERAGE
+# ifdef __clang__
+    " llvmcov=y"
+# else
+    " gcov=y"
+# endif
+#endif
+#ifdef CONFIG_UBSAN
+    " ubsan=y"
+#endif
+    "";
+
+const char *xen_build_info(void)
+{
+    return build_info;
+}
+
 static const void *build_id_p __read_mostly;
 static unsigned int build_id_len __read_mostly;
 
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1002,10 +1002,10 @@ void __init console_init_preirq(void)
     spin_lock(&console_lock);
     __putstr(xen_banner());
     spin_unlock(&console_lock);
-    printk("Xen version %d.%d%s (%s@%s) (%s) debug=%c " gcov_string " %s\n",
+    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
            xen_major_version(), xen_minor_version(), xen_extra_version(),
-           xen_compile_by(), xen_compile_domain(),
-           xen_compiler(), debug_build() ? 'y' : 'n', xen_compile_date());
+           xen_compile_by(), xen_compile_domain(), xen_compiler(),
+           xen_build_info(), xen_compile_date());
     printk("Latest ChangeSet: %s\n", xen_changeset());
 
     /* Locate and print the buildid, if applicable. */
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -48,21 +48,13 @@
 #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
 #endif
 
-#ifdef CONFIG_GCOV
-#define gcov_string "gcov=y"
-#else
-#define gcov_string ""
-#endif
-
 #ifndef NDEBUG
 #define ASSERT(p) \
     do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
 #define ASSERT_UNREACHABLE() assert_failed("unreachable")
-#define debug_build() 1
 #else
 #define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
 #define ASSERT_UNREACHABLE() do { } while (0)
-#define debug_build() 0
 #endif
 
 #define ABS(_x) ({                              \
--- a/xen/include/xen/version.h
+++ b/xen/include/xen/version.h
@@ -16,6 +16,7 @@ const char *xen_extra_version(void);
 const char *xen_changeset(void);
 const char *xen_banner(void);
 const char *xen_deny(void);
+const char *xen_build_info(void);
 int xen_build_id(const void **p, unsigned int *len);
 
 #ifdef BUILD_ID

