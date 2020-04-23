Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5D51B58F7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:20:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRYxo-0008Vm-S7; Thu, 23 Apr 2020 10:20:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19NY=6H=amazon.de=prvs=375504273=wipawel@srs-us1.protection.inumbo.net>)
 id 1jRYxn-0008VN-91
 for xen-devel@lists.xen.org; Thu, 23 Apr 2020 10:20:11 +0000
X-Inumbo-ID: 034d961a-854c-11ea-83d8-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 034d961a-854c-11ea-83d8-bc764e2007e4;
 Thu, 23 Apr 2020 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587637211; x=1619173211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=aBOG/6W6YvsGazAUBqvfFvgqMcAkzkVroszf6yNe9L8=;
 b=kuMJ4xYfeMFjNAdFAznC3Tr/cN2iHgkRR3/hTHI6ej+oVpT8zXVHLE4/
 EjbsU9LOJOh5QCM630+kXwv5PMaTdbJwrw+tj94AuLUiOpyKCt0SZLnVn
 x6N7uPQ4u0IRlbo2SsO9V4DR5T5fx2o70pryrH6tTz2BdxRyhRLn31GKy c=;
IronPort-SDR: TKykPitZHv6+bNPeNmKtlVtViLcZQbXOJCXY+qrfV0dNcNdOJ+/MgtTvRKy0kJx+19vEbMG38x
 RTKoKA7hPdig==
X-IronPort-AV: E=Sophos;i="5.73,306,1583193600"; d="scan'208";a="28374691"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 23 Apr 2020 10:19:58 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3BC25A2454; Thu, 23 Apr 2020 10:19:57 +0000 (UTC)
Received: from EX13D05EUC001.ant.amazon.com (10.43.164.118) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:19:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05EUC001.ant.amazon.com (10.43.164.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:19:32 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 23 Apr 2020 10:19:30 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 3/4] libc, strtol: Add FreeBSD libc implementation of strtoul()
Date: Thu, 23 Apr 2020 10:19:17 +0000
Message-ID: <20200423101918.13566-4-wipawel@amazon.de>
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

The function was derived from:
https://github.com/freebsd/freebsd/blob/master/lib/libc/stdlib/strtoul.c

Sligthly modified to use ctypes helpers and ignore locale.

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 common/libc/strtol.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/xtf/libc.h   |  1 +
 2 files changed, 70 insertions(+)

diff --git a/common/libc/strtol.c b/common/libc/strtol.c
index f85ac7a..66ba787 100644
--- a/common/libc/strtol.c
+++ b/common/libc/strtol.c
@@ -130,3 +130,72 @@ long strtol(const char *nptr, char **endptr, int base)
         *endptr = (char *)(any ? s - 1 : nptr);
     return (acc);
 }
+
+/*
+ * Convert a string to an unsigned long integer.
+ *
+ * Ignores `locale' stuff. Assumes that the upper and lower case
+ * alphabets and digits are each contiguous.
+ */
+unsigned long strtoul(const char *nptr, char **endptr, int base)
+{
+    const char *s = nptr;
+    unsigned long acc;
+    unsigned char c;
+    unsigned long cutoff;
+    int neg = 0, any, cutlim;
+
+    /*
+     * See strtol for comments as to the logic used.
+     */
+    do {
+        c = *s++;
+    } while (isspace(c));
+    if (c == '-') {
+        neg = 1;
+        c = *s++;
+    } else if (c == '+')
+        c = *s++;
+    if ((base == 0 || base == 16) &&
+            c == '0' && (*s == 'x' || *s == 'X') && isxdigit(s[1])) {
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
+    cutoff = (unsigned long)ULONG_MAX / (unsigned long)base;
+    cutlim = (unsigned long)ULONG_MAX % (unsigned long)base;
+    for ( ; ; c = *s++) {
+        if (isdigit(c))
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
+        acc = ULONG_MAX;
+    } else if (!any) {
+noconv: ;
+    } else if (neg)
+        acc = -acc;
+    if (endptr != NULL)
+        *endptr = (char *)(any ? s - 1 : nptr);
+    return (acc);
+}
diff --git a/include/xtf/libc.h b/include/xtf/libc.h
index 0caa7d3..75f193b 100644
--- a/include/xtf/libc.h
+++ b/include/xtf/libc.h
@@ -36,6 +36,7 @@ int memcmp(const void *s1, const void *s2, size_t n);
 #define memcmp(s1, s2, n)           __builtin_memcmp(s1, s2, n)
 
 long strtol(const char *nptr, char **endptr, int base);
+unsigned long strtoul(const char *nptr, char **endptr, int base);
 
 size_t strnlen(const char *str, size_t max);
 
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




