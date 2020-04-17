Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF82D1AD6DF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 09:06:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPL4f-0001hG-VQ; Fri, 17 Apr 2020 07:06:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sm3=6B=amazon.de=prvs=369b905e4=wipawel@srs-us1.protection.inumbo.net>)
 id 1jPL4d-0001gm-LW
 for xen-devel@lists.xen.org; Fri, 17 Apr 2020 07:06:03 +0000
X-Inumbo-ID: e5f79132-8079-11ea-8c80-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5f79132-8079-11ea-8c80-12813bfff9fa;
 Fri, 17 Apr 2020 07:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587107163; x=1618643163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=UuhJUamVQd+VEFaxWjDQUrzLutylPKzCdCKci7sTFY8=;
 b=RVeUGLlLP/pEJaD+6PIWi9VAiqzAIz51ndh15kpZWTZhAx4WPy4OgyUd
 pIdzHyjqqIksfm6Fq/VNl6o87ppQwPX95c7Nc+tCSIoncgYmL0WdLG+lM
 69oBytPRP6BbDccQCZsFOz4gtXBc2DfWL7cWT0A8HXBBEyrKoGcJEFgLB o=;
IronPort-SDR: HZXgY8bJmz2svV7iz58h+viVh4a+y8Y07WG7YaoCHAnuPRqDVveBIiijfZOwfer/Kr6DcblnPV
 uVcoYzSMTUfQ==
X-IronPort-AV: E=Sophos;i="5.72,394,1580774400"; d="scan'208";a="27348876"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 17 Apr 2020 07:05:45 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6C582A24B7; Fri, 17 Apr 2020 07:05:44 +0000 (UTC)
Received: from EX13D02EUB002.ant.amazon.com (10.43.166.170) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:44 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D02EUB002.ant.amazon.com (10.43.166.170) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 07:05:43 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 17 Apr 2020 07:05:41 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 2/6] time: add current_time() function to time management
Date: Fri, 17 Apr 2020 07:05:24 +0000
Message-ID: <20200417070528.48329-3-wipawel@amazon.de>
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

This function returns the "epoch" time.

Signed-off-by: Paul Semel <phentex@amazon.de>
---
 common/time.c      | 16 ++++++++++++++++
 include/xtf/time.h |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/common/time.c b/common/time.c
index b9a6531..7decd07 100644
--- a/common/time.c
+++ b/common/time.c
@@ -74,6 +74,22 @@ uint64_t since_boot_time(void)
     return system_time;
 }
 
+/* This function return the epoch time (number of seconds elapsed
+ * since Juanary 1, 1970) */
+#if defined(__i386__)
+uint32_t current_time(void)
+#else
+uint64_t current_time(void)
+#endif
+{
+#if defined(__i386__)
+    uint32_t seconds = shared_info.wc_sec;
+#else
+    uint64_t seconds = ((uint64_t)shared_info.wc_sec_hi << 32) | shared_info.wc_sec;
+#endif
+    return seconds + (since_boot_time() / 1000000000);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/include/xtf/time.h b/include/xtf/time.h
index e30d109..52da27a 100644
--- a/include/xtf/time.h
+++ b/include/xtf/time.h
@@ -11,8 +11,12 @@
 #if defined(__i386__)
 /* Time from boot in nanoseconds */
 uint32_t since_boot_time(void);
+
+uint32_t current_time(void);
 #else
 uint64_t since_boot_time(void);
+
+uint64_t current_time(void);
 #endif
 
 #endif /* XTF_TIME_H */
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




