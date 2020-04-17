Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6171AD6E4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 09:06:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPL4o-0001kI-IB; Fri, 17 Apr 2020 07:06:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sm3=6B=amazon.de=prvs=369b905e4=wipawel@srs-us1.protection.inumbo.net>)
 id 1jPL4n-0001k1-Lv
 for xen-devel@lists.xen.org; Fri, 17 Apr 2020 07:06:13 +0000
X-Inumbo-ID: ec349702-8079-11ea-8c80-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec349702-8079-11ea-8c80-12813bfff9fa;
 Fri, 17 Apr 2020 07:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587107173; x=1618643173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=7z65Bh4Xe0Ehypmwl+K1UUIrCedT+0ZwsHnvKnpUKuo=;
 b=jdNkq8/P4tIwHc5HqNoq+VfI1uWhFxRffAs6Ba7AhvzPK1ytQe+yBWgi
 ICbexPFXPs9z3GE8NnLehUerGuXb+G4el+d8/sPIkexqyJPm+VnAZBUAZ
 +pXl2V2wcaEZ63EgbJEgrKhNvZjPo71nPyFvDEGDaCP432F6wsw5IQ22X I=;
IronPort-SDR: ipOWzI3Pz3DD/dajzMiIsbaMbBaQAyA9/mhsuH+7SPxo01uOIPjsRIZkiZbCQteofQXlvabn86
 jdhLw+mSKaPw==
X-IronPort-AV: E=Sophos;i="5.72,394,1580774400"; d="scan'208";a="27348926"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 17 Apr 2020 07:06:13 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id B58B1A056D; Fri, 17 Apr 2020 07:06:11 +0000 (UTC)
Received: from EX13D02EUC004.ant.amazon.com (10.43.164.117) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:47 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D02EUC004.ant.amazon.com (10.43.164.117) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:46 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 17 Apr 2020 07:05:45 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 4/6] time: Add helper functions and macros to time management
Date: Fri, 17 Apr 2020 07:05:26 +0000
Message-ID: <20200417070528.48329-5-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200417070528.48329-1-wipawel@amazon.de>
References: <20200417070528.48329-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: semelpaul@gmail.com, andrew.cooper3@citrix.com, julien@xen.org,
 nmanthey@amazon.de, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Semel <phentex@amazon.de>

Add the following helper functions:
  - nspin_sleep()
  - spin_sleep()
  - mspin_sleep()

Add the following helper macros:
  - sleep()
  - msleep()
  - NOW()

Signed-off-by: Paul Semel <phentex@amazon.de>
---
 common/time.c      | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/xtf/time.h | 16 +++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/common/time.c b/common/time.c
index fffae1c..3db1f8f 100644
--- a/common/time.c
+++ b/common/time.c
@@ -104,6 +104,64 @@ int gettimeofday(struct timeval *tp)
     return 0;
 }
 
+#if defined(__i386__)
+static inline void nspin_sleep(uint32_t t)
+#else
+static inline void nspin_sleep(uint64_t t)
+#endif
+{
+    unsigned long end = since_boot_time() + t;
+
+    while ( since_boot_time() < end )
+        asm volatile ( "pause" );
+}
+
+#if defined(__i386__)
+static inline void spin_sleep(uint32_t t)
+#else
+static inline void spin_sleep(uint64_t t)
+#endif
+{
+#if defined(__i386__)
+    uint32_t nsec = t * 1000000000;
+#else
+    uint64_t nsec = t * 1000000000ul;
+#endif
+    nspin_sleep(nsec);
+}
+
+#if defined(__i386__)
+static inline void mspin_sleep(uint32_t t)
+#else
+static inline void mspin_sleep(uint64_t t)
+#endif
+{
+#if defined(__i386__)
+    uint32_t nsec = t * 1000000;
+#else
+    uint64_t nsec = t * 1000000ul;
+#endif
+    nspin_sleep(nsec);
+}
+
+#if defined(__i386__)
+void sleep(uint32_t t)
+#else
+void sleep(uint64_t t)
+#endif
+{
+    spin_sleep(t);
+}
+
+#if defined(__i386__)
+void msleep(uint32_t t)
+#else
+void msleep(uint64_t t)
+#endif
+{
+    mspin_sleep(t);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/include/xtf/time.h b/include/xtf/time.h
index e312465..07fcae5 100644
--- a/include/xtf/time.h
+++ b/include/xtf/time.h
@@ -23,14 +23,30 @@ struct timeval {
 uint32_t since_boot_time(void);
 
 uint32_t current_time(void);
+
+/* This function takes seconds in parameter */
+void sleep(uint32_t f);
+
+/* Be careful, this function takes milliseconds in parameter,
+ * not microseconds !
+ */
+void msleep(uint32_t f);
 #else
 uint64_t since_boot_time(void);
 
 uint64_t current_time(void);
+
+void sleep(uint64_t f);
+
+void msleep(uint64_t f);
 #endif
 
 int gettimeofday(struct timeval *tp);
 
+
+/* This returns the current epoch time */
+#define NOW() current_time()
+
 #endif /* XTF_TIME_H */
 
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




