Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE81B58FB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:20:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRYxC-0007kV-QP; Thu, 23 Apr 2020 10:19:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19NY=6H=amazon.de=prvs=375504273=wipawel@srs-us1.protection.inumbo.net>)
 id 1jRYxA-0007kG-SX
 for xen-devel@lists.xen.org; Thu, 23 Apr 2020 10:19:33 +0000
X-Inumbo-ID: ec29acf8-854b-11ea-83d8-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec29acf8-854b-11ea-83d8-bc764e2007e4;
 Thu, 23 Apr 2020 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587637172; x=1619173172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=G/m3KuxGHbfU+DBNHOF/luWPlZ6kzIdxDz0P5fCKYf8=;
 b=naRSXbVcQ9Zu3t0iYaygddzggzsMiGxN2VOYtX/OWbPVNshBlCY6kHwm
 4Z7TZlimzJguuZF171t80TrR2g1O3Z6AL184bCUFniJtd+A/w/iGEm3Sv
 sRAGzxvXiTdxTK82YALBuRqUYEDYsVCSQaKGutYZ2+qyYIg92RHcnbPIf M=;
IronPort-SDR: 9oLJ81RDEQ1LcuYVJhv2NK1JbRjTMXbjVwH6uRndoqSVxsJIbSXoC0NU9h9JPOTe8W87C9e+25
 6BSyfngpzdrg==
X-IronPort-AV: E=Sophos;i="5.73,306,1583193600"; d="scan'208";a="27274836"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 23 Apr 2020 10:19:31 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id 16DC3A07DA; Thu, 23 Apr 2020 10:19:30 +0000 (UTC)
Received: from EX13D05EUC002.ant.amazon.com (10.43.164.231) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:19:29 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05EUC002.ant.amazon.com (10.43.164.231) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:19:28 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 23 Apr 2020 10:19:27 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 1/4] string: add freebds libc implementation of strtol()
Date: Thu, 23 Apr 2020 10:19:15 +0000
Message-ID: <20200423101918.13566-2-wipawel@amazon.de>
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

From: Paul Semel <phentex@amazon.de>

Added freebsd libc implementation of the strtol() function.
Original can be found here :
https://github.com/freebsd/freebsd/blob/master/lib/libc/stdlib/strtol.c

Signed-off-by: Paul Semel <phentex@amazon.de>
---
 build/files.mk       |   1 +
 common/libc/strtol.c | 135 +++++++++++++++++++++++++++++++++++++++++++++++++++
 include/xtf/libc.h   |   2 +
 3 files changed, 138 insertions(+)
 create mode 100644 common/libc/strtol.c

diff --git a/build/files.mk b/build/files.mk
index dfa27e4..ebc36aa 100644
--- a/build/files.mk
+++ b/build/files.mk
@@ -13,6 +13,7 @@ obj-perarch += $(ROOT)/common/lib.o
 obj-perarch += $(ROOT)/common/libc/stdio.o
 obj-perarch += $(ROOT)/common/libc/string.o
 obj-perarch += $(ROOT)/common/libc/vsnprintf.o
+obj-perarch += $(ROOT)/common/libc/strtol.o
 obj-perarch += $(ROOT)/common/report.o
 obj-perarch += $(ROOT)/common/setup.o
 obj-perarch += $(ROOT)/common/xenbus.o
diff --git a/common/libc/strtol.c b/common/libc/strtol.c
new file mode 100644
index 0000000..64ce621
--- /dev/null
+++ b/common/libc/strtol.c
@@ -0,0 +1,135 @@
+/*-
+ * Copyright (c) 1990, 1993
+ *  The Regents of the University of California.  All rights reserved.
+ *
+ * Copyright (c) 2011 The FreeBSD Foundation
+ * All rights reserved.
+ * Portions of this software were developed by David Chisnall
+ * under sponsorship from the FreeBSD Foundation.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. Neither the name of the University nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
+ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ */
+
+/*
+ * Convert a string to a long integer.
+ *
+ * Assumes that the upper and lower case
+ * alphabets and digits are each contiguous.
+ */
+
+#include <xtf/libc.h>
+
+long strtol(const char *nptr, char **endptr, int base)
+{
+    const char *s;
+    unsigned long acc;
+    char c;
+    unsigned long cutoff;
+    int neg, any, cutlim;
+
+    /*
+     * Skip white space and pick up leading +/- sign if any.
+     * If base is 0, allow 0x for hex and 0 for octal, else
+     * assume decimal; if base is already 16, allow 0x.
+     */
+    s = nptr;
+    do {
+        c = *s++;
+    } while ( c == ' ' );
+    if (c == '-') {
+        neg = 1;
+        c = *s++;
+    } else {
+        neg = 0;
+        if (c == '+')
+            c = *s++;
+    }
+    if ((base == 0 || base == 16) &&
+            c == '0' && (*s == 'x' || *s == 'X') &&
+            ((s[1] >= '0' && s[1] <= '9') ||
+             (s[1] >= 'A' && s[1] <= 'F') ||
+             (s[1] >= 'a' && s[1] <= 'f'))) {
+        c = s[1];
+        s += 2;
+        base = 16;
+    }
+    if (base == 0)
+        base = c == '0' ? 8 : 10;
+    acc = any = 0;
+    if (base < 2 || base > 36)
+        goto noconv;
+
+    /*
+     * Compute the cutoff value between legal numbers and illegal
+     * numbers.  That is the largest legal value, divided by the
+     * base.  An input number that is greater than this value, if
+     * followed by a legal input character, is too big.  One that
+     * is equal to this value may be valid or not; the limit
+     * between valid and invalid numbers is then based on the last
+     * digit.  For instance, if the range for longs is
+     * [-2147483648..2147483647] and the input base is 10,
+     * cutoff will be set to 214748364 and cutlim to either
+     * 7 (neg==0) or 8 (neg==1), meaning that if we have accumulated
+     * a value > 214748364, or equal but the next digit is > 7 (or 8),
+     * the number is too big, and we will return a range error.
+     *
+     * Set 'any' if any `digits' consumed; make it negative to indicate
+     * overflow.
+     */
+
+    cutoff = neg ? (unsigned long)-(LONG_MIN + LONG_MAX) + LONG_MAX
+        : LONG_MAX;
+    cutlim = cutoff % base;
+    cutoff /= base;
+    for ( ; ; c = *s++) {
+        if (c >= '0' && c <= '9')
+            c -= '0';
+        else if (c >= 'A' && c <= 'Z')
+            c -= 'A' - 10;
+        else if (c >= 'a' && c <= 'z')
+            c -= 'a' - 10;
+        else
+            break;
+        if (c >= base)
+            break;
+        if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
+            any = -1;
+        else {
+            any = 1;
+            acc *= base;
+            acc += c;
+        }
+    }
+    if (any < 0) {
+        acc = neg ? LONG_MIN : LONG_MAX;
+    } else if (!any) {
+noconv:
+        ;
+    } else if (neg)
+        acc = -acc;
+    if (endptr != NULL)
+        *endptr = (char *)(any ? s - 1 : nptr);
+    return (acc);
+}
diff --git a/include/xtf/libc.h b/include/xtf/libc.h
index 66f834b..f352f7f 100644
--- a/include/xtf/libc.h
+++ b/include/xtf/libc.h
@@ -35,6 +35,8 @@ void *memcpy(void *dst, const void *src, size_t n);
 int memcmp(const void *s1, const void *s2, size_t n);
 #define memcmp(s1, s2, n)           __builtin_memcmp(s1, s2, n)
 
+long strtol(const char *nptr, char **endptr, int base);
+
 size_t strnlen(const char *str, size_t max);
 
 int __printf(3, 0)
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




