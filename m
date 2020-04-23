Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098D91B58F6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:20:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRYxH-0007kl-32; Thu, 23 Apr 2020 10:19:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19NY=6H=amazon.de=prvs=375504273=wipawel@srs-us1.protection.inumbo.net>)
 id 1jRYxF-0007kb-IB
 for xen-devel@lists.xen.org; Thu, 23 Apr 2020 10:19:37 +0000
X-Inumbo-ID: ecef6164-854b-11ea-83d8-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecef6164-854b-11ea-83d8-bc764e2007e4;
 Thu, 23 Apr 2020 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587637173; x=1619173173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SdYPm/GFznwSuKyPDcCLKFoxWBcmizZriwQogmFgpi8=;
 b=pleixGnI5HRxdeecvKVYZgoo1Bog9CdpDQ+e+oqH44PnslUIBfVqW9yo
 Q1B63Xh2A4Zztg0MBI6KbVPiOZqiB3cgQeFBDNSbBNZ54NzIPDPaTlhgs
 Wu1M2ciUnUTK9dsVA3qldCAxVOdtw/vSQDVFTQWoThrFaMctXCci5ULH7 Y=;
IronPort-SDR: RruP8HKAKWseFm5VDZjhpfrDlg8mcIt3nPX+ND5I+CUaUk0Jpj/iP3XZhP277X3mSlTasC3b6n
 ampsfH6nx8rA==
X-IronPort-AV: E=Sophos;i="5.73,306,1583193600"; d="scan'208";a="27274840"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 23 Apr 2020 10:19:33 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id DA2B2A06E6; Thu, 23 Apr 2020 10:19:31 +0000 (UTC)
Received: from EX13D02EUC003.ant.amazon.com (10.43.164.10) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:19:31 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D02EUC003.ant.amazon.com (10.43.164.10) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:19:30 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 23 Apr 2020 10:19:29 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 2/4] libc, strtol: Add isspace(), isdigit(), isxdigit(),
 isascii()
Date: Thu, 23 Apr 2020 10:19:16 +0000
Message-ID: <20200423101918.13566-3-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200423101918.13566-1-wipawel@amazon.de>
References: <20200423101918.13566-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, wipawel@xen.org, paul@xen.org, semelpaul@gmail.com,
 andrew.cooper3@citrix.com, wipawel@amazon.de, nmanthey@amazon.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These ctype.h derived helper functions simplify strtol() code and will
help simplify strtoul().

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 common/lib.c            |  8 --------
 common/libc/strtol.c    |  9 +++------
 common/libc/vsnprintf.c |  8 --------
 include/xtf/libc.h      | 29 +++++++++++++++++++++++++++++
 4 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/common/lib.c b/common/lib.c
index acf4da1..7381a3a 100644
--- a/common/lib.c
+++ b/common/lib.c
@@ -3,14 +3,6 @@
 #include <xtf/hypercall.h>
 #include <xtf/xenstore.h>
 
-#ifndef isdigit
-/* Avoid pulling in all of ctypes just for this. */
-static int isdigit(int c)
-{
-    return c >= '0' && c <= '9';
-}
-#endif
-
 void __noreturn panic(const char *fmt, ...)
 {
     va_list args;
diff --git a/common/libc/strtol.c b/common/libc/strtol.c
index 64ce621..f85ac7a 100644
--- a/common/libc/strtol.c
+++ b/common/libc/strtol.c
@@ -57,7 +57,7 @@ long strtol(const char *nptr, char **endptr, int base)
     s = nptr;
     do {
         c = *s++;
-    } while ( c == ' ' );
+    } while ( isspace(c) );
     if (c == '-') {
         neg = 1;
         c = *s++;
@@ -67,10 +67,7 @@ long strtol(const char *nptr, char **endptr, int base)
             c = *s++;
     }
     if ((base == 0 || base == 16) &&
-            c == '0' && (*s == 'x' || *s == 'X') &&
-            ((s[1] >= '0' && s[1] <= '9') ||
-             (s[1] >= 'A' && s[1] <= 'F') ||
-             (s[1] >= 'a' && s[1] <= 'f'))) {
+            c == '0' && (*s == 'x' || *s == 'X') && isxdigit(s[1])) {
         c = s[1];
         s += 2;
         base = 16;
@@ -104,7 +101,7 @@ long strtol(const char *nptr, char **endptr, int base)
     cutlim = cutoff % base;
     cutoff /= base;
     for ( ; ; c = *s++) {
-        if (c >= '0' && c <= '9')
+        if (isdigit(c))
             c -= '0';
         else if (c >= 'A' && c <= 'Z')
             c -= 'A' - 10;
diff --git a/common/libc/vsnprintf.c b/common/libc/vsnprintf.c
index a49fd30..495c0a5 100644
--- a/common/libc/vsnprintf.c
+++ b/common/libc/vsnprintf.c
@@ -2,14 +2,6 @@
 #include <xtf/libc.h>
 #include <xtf/compiler.h>
 
-#ifndef isdigit
-/* Avoid pulling in all of ctypes just for this. */
-static int isdigit(int c)
-{
-    return c >= '0' && c <= '9';
-}
-#endif
-
 /*
  * The subset of formatting supported:
  *
diff --git a/include/xtf/libc.h b/include/xtf/libc.h
index f352f7f..0caa7d3 100644
--- a/include/xtf/libc.h
+++ b/include/xtf/libc.h
@@ -56,6 +56,35 @@ bool arch_fmt_pointer(
     char **str, char *end, const char **fmt_ptr, const void *arg,
     int width, int precision, unsigned int flags);
 
+#ifndef isspace
+static inline int isspace(int c)
+{
+    return c == ' ' || c == '\t';
+}
+#endif
+
+#ifndef isdigit
+static inline int isdigit(int c)
+{
+    return c >= '0' && c <= '9';
+}
+#endif
+
+#ifndef isxdigit
+static inline int isxdigit(int c)
+{
+    return (isdigit(c) || (c >= 'A' && c <= 'F') ||
+           (c >= 'a' && c <= 'f'));
+}
+#endif
+
+#ifndef isascii
+static inline int isascii(int c)
+{
+    return c >= 0 && c <= 127;
+}
+#endif
+
 #endif /* XTF_LIBC_H */
 
 /*
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




