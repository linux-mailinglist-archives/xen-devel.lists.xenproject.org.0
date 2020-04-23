Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0971B58F8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:20:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRYxf-000824-I7; Thu, 23 Apr 2020 10:20:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19NY=6H=amazon.de=prvs=375504273=wipawel@srs-us1.protection.inumbo.net>)
 id 1jRYxe-0007uB-3O
 for xen-devel@lists.xen.org; Thu, 23 Apr 2020 10:20:02 +0000
X-Inumbo-ID: fd8138a4-854b-11ea-933e-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd8138a4-854b-11ea-933e-12813bfff9fa;
 Thu, 23 Apr 2020 10:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587637201; x=1619173201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=iTRlqoQz/hwVOrBz98h6nOzsiS/zGlpC/yEg6ke2u/k=;
 b=XahiXqLR6pxW1mFqorpoJeRQmrymJZqWatRr1jLtCfgGDpbjBj+6Wm29
 dRDH20z5TREZsnnLWi2EvYAbzqXnziyoVrCuex4ylm7xvvKcgYL1M3uwD
 2GrNcqkdATBwDSE4Hc6lhSOhp1Ddly2qH5ynH6LKeLr4olAm2mb1+qKp4 0=;
IronPort-SDR: Ju56CU/S7dcvA7N2sl0BwzWqFa0Ux6JvUZ6bxeZVu7wJYFrDf9IzVvXLSEc9lTadLiyvlJlv9n
 bL3NNzc65E7w==
X-IronPort-AV: E=Sophos;i="5.73,306,1583193600"; d="scan'208";a="39000741"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 23 Apr 2020 10:19:59 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id EA7D0A1DB7; Thu, 23 Apr 2020 10:19:58 +0000 (UTC)
Received: from EX13D02EUC004.ant.amazon.com (10.43.164.117) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:19:35 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D02EUC004.ant.amazon.com (10.43.164.117) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:19:33 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 23 Apr 2020 10:19:32 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 4/4] libc: add strncmp() function
Date: Thu, 23 Apr 2020 10:19:18 +0000
Message-ID: <20200423101918.13566-5-wipawel@amazon.de>
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

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 common/libc/string.c | 11 +++++++++++
 include/xtf/libc.h   |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/common/libc/string.c b/common/libc/string.c
index 5c25e27..d81e324 100644
--- a/common/libc/string.c
+++ b/common/libc/string.c
@@ -56,6 +56,17 @@ int (strcmp)(const char *_s1, const char *_s2)
     return (s1 < s2) ? -1 : (s1 > s2);
 }
 
+int (strncmp)(const char *_s1, const char *_s2, size_t n)
+{
+    size_t ctr;
+    for (ctr = 0; ctr < n; ctr++) {
+        if (_s1[ctr] != _s2[ctr])
+            return (int)(_s1[ctr] - _s2[ctr]);
+    }
+
+    return 0;
+}
+
 void *(memset)(void *s, int c, size_t n)
 {
     char *p = s;
diff --git a/include/xtf/libc.h b/include/xtf/libc.h
index 75f193b..c3783a8 100644
--- a/include/xtf/libc.h
+++ b/include/xtf/libc.h
@@ -26,6 +26,9 @@ char *strncpy(char *dst, const char *src, size_t n);
 int strcmp(const char *s1, const char *s2);
 #define strcmp(s1, s2)              __builtin_strcmp(s1, s2)
 
+int strncmp(const char *s1, const char *s2, size_t n);
+#define strncmp(s1, s2, n)          __builtin_strncmp(s1, s2, n)
+
 void *memset(void *s, int c, size_t n);
 #define memset(d, c, n)             __builtin_memset(d, c, n)
 
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




