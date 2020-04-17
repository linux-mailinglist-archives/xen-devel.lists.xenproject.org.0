Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C821AD6E0
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 09:06:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPL4j-0001iU-8T; Fri, 17 Apr 2020 07:06:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sm3=6B=amazon.de=prvs=369b905e4=wipawel@srs-us1.protection.inumbo.net>)
 id 1jPL4i-0001iJ-LZ
 for xen-devel@lists.xen.org; Fri, 17 Apr 2020 07:06:08 +0000
X-Inumbo-ID: e6d588fd-8079-11ea-8c80-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6d588fd-8079-11ea-8c80-12813bfff9fa;
 Fri, 17 Apr 2020 07:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587107165; x=1618643165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=493GNuIf5KbW+Y/729Kw1IKQ8Uqsew/NWiY7HpkG1hg=;
 b=IHlDk+s/fHSacLfqJM1ZyUhysyyzv1zhiljbsKiX5C+T2+uj7ZiuIcX5
 yxeXjz8iSBpDQ8fSLqfmzhOB4LA/ZsYxkVFbhKY6VAu3DDi2GTIgQ+yEH
 DPt7St+azVfn42SSIKa+jI8awMzMSBhoQf+cJgd6uxycHhsb6Jv/gGGp3 c=;
IronPort-SDR: bB/uFZXPLRh/pPukLbf1/QJKMR4TloS6qG2sZfxHgYCMOuZ1ys2ILsDEwcKqcvWmqOjiZ+9jNp
 Mmn+b03wsatw==
X-IronPort-AV: E=Sophos;i="5.72,394,1580774400"; d="scan'208";a="26002075"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 17 Apr 2020 07:05:47 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 32E3AA24C6; Fri, 17 Apr 2020 07:05:46 +0000 (UTC)
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:45 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:44 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 17 Apr 2020 07:05:43 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 3/6] time: add gettimeofday() function to time managment
Date: Fri, 17 Apr 2020 07:05:25 +0000
Message-ID: <20200417070528.48329-4-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200417070528.48329-1-wipawel@amazon.de>
References: <20200417070528.48329-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
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

Signed-off-by: Paul Semel <phentex@amazon.de>
---
 common/time.c      | 14 ++++++++++++++
 include/xtf/time.h | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/common/time.c b/common/time.c
index 7decd07..fffae1c 100644
--- a/common/time.c
+++ b/common/time.c
@@ -90,6 +90,20 @@ uint64_t current_time(void)
     return seconds + (since_boot_time() / 1000000000);
 }
 
+/* The POSIX gettimeofday syscall normally takes a second argument, which is
+ * the timezone (struct timezone). However, it sould be NULL because linux
+ * doesn't use it anymore. So we need for us to add it in this function
+ */
+int gettimeofday(struct timeval *tp)
+{
+    if (!tp)
+        return -1;
+
+    tp->sec = current_time();
+    tp->nsec = shared_info.wc_nsec + (since_boot_time() % 1000000000);
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/include/xtf/time.h b/include/xtf/time.h
index 52da27a..e312465 100644
--- a/include/xtf/time.h
+++ b/include/xtf/time.h
@@ -8,6 +8,16 @@
 
 #include <xtf/types.h>
 
+struct timeval {
+#if !defined(__i386__)
+    uint64_t sec;
+    uint64_t nsec;
+#else
+    uint32_t sec;
+    uint32_t nsec;
+#endif
+};
+
 #if defined(__i386__)
 /* Time from boot in nanoseconds */
 uint32_t since_boot_time(void);
@@ -19,6 +29,8 @@ uint64_t since_boot_time(void);
 uint64_t current_time(void);
 #endif
 
+int gettimeofday(struct timeval *tp);
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




