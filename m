Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD451EE663
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 16:14:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgqc1-0006By-Uj; Thu, 04 Jun 2020 14:12:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfFn=7R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jgqc1-0006Bt-1l
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 14:12:53 +0000
X-Inumbo-ID: 799c51c0-a66d-11ea-8993-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 799c51c0-a66d-11ea-8993-bc764e2007e4;
 Thu, 04 Jun 2020 14:12:51 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: r7lOM1xHIpM87SQ0kT3E1TYuTair+lwl4sJwUNQoAHk1W+k5+iTppNTfEMAPNN+EAw9DZgyUlw
 ZJD9zwmCSVS8KEVaWvhwIhuj/iEwwrndr79c5SNqaraplltwwCrWiA9GuXtSGMkT3kwRujXOia
 2UtlxMW5TG2t6BGqkb/nfyvGydSFXLEsx05SzAv9qoDjYEAdbNufJk5/bKOYa518Gz5ImvYPHo
 CWr17MqI4pJDUojKIudlgrLH3OdE9ByeOwHX9u16IKUl7bigdaGf3Bm5f5pRY34S1F6+/cKRhY
 qCo=
X-SBRS: 2.7
X-MesageID: 19251302
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,472,1583211600"; d="scan'208";a="19251302"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH XTF] vsnprintf: Expand \n to \r\n for console output
Date: Thu, 4 Jun 2020 15:12:23 +0100
Message-ID: <20200604141223.14153-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

xenconsoled doesn't automatically convert \n into \r\n, which causes test
output appear like this in a terminal:

  [root@host ~]# xl create -c tests/selftest/test-pv64-selftest.cfg
  Parsing config from tests/selftest/test-pv64-selftest.cfg
  --- Xen Test Framework ---
                            Environment: PV 64bit (Long mode 4 levels)
                                                                      XTF Selftests

There are a number of ways to do this, but by far the most efficient way is to
have vsnprintf() expand \n's in the output buffer.

This however is non-standard behaviour for vsnprintf().  Rename it to
vsnprintf_internal() and take extra flags, and have vprintk() use the new
LF_TO_CRLF control flag.

Inside vsnprintf_internal(), rearrange the non-format and %c logic to share
the expansion logic, as well as extending the logic to fmt_string().

Extend the selftests to confirm correct behaviour in both modes, for all ways
of being able to pass newline characters into a format operation.

Reported-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Pawel: Does this fix the issues you were seeing?
---
 common/console.c        |  2 +-
 common/libc/vsnprintf.c | 23 +++++++++++++++--------
 include/xtf/libc.h      | 15 ++++++++++++++-
 tests/selftest/main.c   | 38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/common/console.c b/common/console.c
index 0724fc9f..b3e89473 100644
--- a/common/console.c
+++ b/common/console.c
@@ -122,7 +122,7 @@ void vprintk(const char *fmt, va_list args)
     unsigned int i;
     int rc;
 
-    rc = vsnprintf(buf, sizeof(buf), fmt, args);
+    rc = vsnprintf_internal(buf, sizeof(buf), fmt, args, LF_TO_CRLF);
 
     if ( rc > (int)sizeof(buf) )
         panic("vprintk() buffer overflow\n");
diff --git a/common/libc/vsnprintf.c b/common/libc/vsnprintf.c
index a49fd308..c907d42b 100644
--- a/common/libc/vsnprintf.c
+++ b/common/libc/vsnprintf.c
@@ -47,6 +47,7 @@ static int isdigit(int c)
 /* Conversions */
 #define UPPER     (1u << 5)
 #define SIGNED    (1u << 6)
+/* Careful not to overlap with vsnprintf_internal() flags. */
 
 /* Shorthand for ensuring str moves forwards, but not overruning the buffer. */
 #define PUT(c)                                  \
@@ -185,7 +186,11 @@ char *fmt_string(char *str, char *end, const char *val,
             PUT(' ');
 
     for ( i = 0; i < len; ++i )
+    {
+        if ( (flags & LF_TO_CRLF) && val[i] == '\n' )
+            PUT('\r');
         PUT(val[i]);
+    }
 
     while ( len < width-- )
         PUT(' ');
@@ -268,7 +273,8 @@ static char *pointer(
                       width, precision, flags);
 }
 
-int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
+int vsnprintf_internal(char *buf, size_t size, const char *fmt, va_list args,
+                       unsigned int caller_flags)
 {
     char *str = buf, *end = buf + size;
 
@@ -277,15 +283,15 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
         const char *spec_start = fmt; /* For rewinding on error. */
 
         unsigned long long num;
-        unsigned int base, flags = 0;
+        unsigned int base, flags = caller_flags;
         int width = -1, precision = -1;
-        char length_mod = 'i';
+        char c, length_mod = 'i';
 
         /* Put regular characters into the destination. */
         if ( *fmt != '%' )
         {
-            PUT(*fmt);
-            continue;
+            c = *fmt;
+            goto put_char;
         }
 
  next_flag: /* Process any flags. */
@@ -359,20 +365,21 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
             continue;
 
         case 'c': /* Unsigned char. */
-        {
-            unsigned char c = va_arg(args, int);
+            c = va_arg(args, int);
 
             if ( !(flags & LEFT) )
                 while ( --width > 0 )
                     PUT(' ');
 
+        put_char:
+            if ( (flags & LF_TO_CRLF) && c == '\n' )
+                PUT('\r');
             PUT(c);
 
             while ( --width > 0 )
                 PUT(' ');
 
             continue;
-        }
 
         case 's': /* String. */
             str = fmt_string(str, end, va_arg(args, const char *),
diff --git a/include/xtf/libc.h b/include/xtf/libc.h
index 66f834b4..f24a631f 100644
--- a/include/xtf/libc.h
+++ b/include/xtf/libc.h
@@ -37,8 +37,21 @@ int memcmp(const void *s1, const void *s2, size_t n);
 
 size_t strnlen(const char *str, size_t max);
 
+/*
+ * Internal version of vsnprintf(), taking extra control flags.
+ *
+ * LF_TO_CRLF causes "\n" to be expanded to "\r\n" in the output buffer.
+ */
+#define LF_TO_CRLF (1u << 7)
 int __printf(3, 0)
-    vsnprintf(char *buf, size_t size, const char *fmt, va_list args);
+    vsnprintf_internal(char *buf, size_t size, const char *fmt, va_list args,
+                       unsigned int flags);
+
+static inline int __printf(3, 0)
+    vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
+{
+    return vsnprintf_internal(buf, size, fmt, args, 0);
+}
 
 int __printf(3, 4)
     snprintf(char *buf, size_t size, const char *fmt, ...);
diff --git a/tests/selftest/main.c b/tests/selftest/main.c
index c2f6e727..a5c205ba 100644
--- a/tests/selftest/main.c
+++ b/tests/selftest/main.c
@@ -340,6 +340,43 @@ static void test_driver_init(void)
         xtf_failure("Fail: xtf_init_grant_table(2) returned %d\n", rc);
 }
 
+static void test_vsnprintf_crlf_one(const char *fmt, ...)
+{
+    va_list args;
+
+    char buf[4];
+    int rc;
+
+    va_start(args, fmt);
+    rc = vsnprintf(buf, sizeof(buf), fmt, args);
+    va_end(args);
+
+    if ( rc != 1 )
+        return xtf_failure("Fail: '%s', expected length 1, got %d\n", fmt, rc);
+    if ( strcmp(buf, "\n") )
+        return xtf_failure("Fail: '%s', expected \"\\n\", got %*ph\n",
+                           fmt, (int)sizeof(buf), buf);
+
+    va_start(args, fmt);
+    rc = vsnprintf_internal(buf, sizeof(buf), fmt, args, LF_TO_CRLF);
+    va_end(args);
+
+    if ( rc != 2 )
+        return xtf_failure("Fail: '%s', expected length 2, got %d\n", fmt, rc);
+    if ( strcmp(buf, "\r\n") )
+        return xtf_failure("Fail: '%s', expected \"\\r\\n\", got %*ph\n",
+                           fmt, (int)sizeof(buf), buf);
+}
+
+static void test_vsnprintf_crlf(void)
+{
+    printk("Test: vsnprintf() with CRLF expansion\n");
+
+    test_vsnprintf_crlf_one("\n");
+    test_vsnprintf_crlf_one("%c", '\n');
+    test_vsnprintf_crlf_one("%s", "\n");
+}
+
 void test_main(void)
 {
     /*
@@ -368,6 +405,7 @@ void test_main(void)
     test_extable_handler();
     test_custom_idte();
     test_driver_init();
+    test_vsnprintf_crlf();
 
     if ( has_xenstore )
         test_xenstore();
-- 
2.11.0


