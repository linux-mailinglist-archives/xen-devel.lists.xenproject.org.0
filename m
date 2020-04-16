Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083EA1ABD0B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 11:42:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP12P-0005bV-99; Thu, 16 Apr 2020 09:42:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xq2g=6A=amazon.de=prvs=368a07d89=wipawel@srs-us1.protection.inumbo.net>)
 id 1jP12N-0005b4-Nc
 for xen-devel@lists.xen.org; Thu, 16 Apr 2020 09:42:23 +0000
X-Inumbo-ID: 92e334f0-7fc6-11ea-b4f4-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92e334f0-7fc6-11ea-b4f4-bc764e2007e4;
 Thu, 16 Apr 2020 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587030143; x=1618566143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=nBLsA1bQLNUw4cSYjqTUKz4JCf9EJCqVCkOxhJf9Dao=;
 b=P8rwHFgI9voH3xn9bkvFzTgoq3N7neS5PrOa578RUxO8bwQYjULs5mEB
 BC6+cc0QCqqKcc0M207mDxY+865owtaJv8thOZC7SJWjg5T6hK3taHTpb
 Jd04KeLaRGI5bmJlQZkY9kdNeB2iAeA664Pc9DKskoJ8N6PGPgdzHjTEN Y=;
IronPort-SDR: 4zeGHXNkwwvCfr19HUt8zMUCSA+sE035/1CEAJo8lWjqG6csKOEBfXySD8LDoRI47c78qCl2XV
 GJ6xWD94TUFA==
X-IronPort-AV: E=Sophos;i="5.72,390,1580774400"; d="scan'208";a="27162069"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 16 Apr 2020 09:42:22 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9F2B2A2E2B; Thu, 16 Apr 2020 09:42:21 +0000 (UTC)
Received: from EX13D02EUB003.ant.amazon.com (10.43.166.172) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 09:42:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D02EUB003.ant.amazon.com (10.43.166.172) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 09:42:01 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Apr 2020 09:41:59 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 4/4] setup: Setup PV console for HVM guests on xen >4.2
Date: Thu, 16 Apr 2020 09:41:41 +0000
Message-ID: <20200416094141.65120-5-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200416094141.65120-1-wipawel@amazon.de>
References: <20200416094141.65120-1-wipawel@amazon.de>
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
Cc: Paul Semel <phentex@amazon.de>, julien@xen.org, paul@xen.org,
 semelpaul@gmail.com, andrew.cooper3@citrix.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, nmanthey@amazon.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Semel <phentex@amazon.de>

Xen 4.2 requires a workaround that does not setup PV console
for HVM guests. However, newer Xen versions do not have that
limitation and should always have the PV console setup.

In arch_setup() detects Xen version by issuing xen_version hypercall
and optionally passes the version to main_xtf().

Signed-off-by: Paul Semel <phentex@amazon.de>
Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 arch/x86/setup.c        | 20 ++++++++++++++++++--
 common/setup.c          |  6 +++++-
 include/xtf/framework.h |  2 +-
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index f6fa4df..e3f74e6 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -250,8 +250,10 @@ static void xen_console_write(const char *buf, size_t len)
     hypercall_console_write(buf, len);
 }
 
-void arch_setup(void)
+void arch_setup(int *version)
 {
+    int xen_version;
+
     if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
     {
         register_console_callback(qemu_console_write);
@@ -272,9 +274,23 @@ void arch_setup(void)
 
     init_hypercalls();
 
-    if ( !is_initdomain() )
+    xen_version = hypercall_xen_version(XENVER_version, NULL);
+    if ( version )
+        *version = xen_version;
+
+    /*
+     * The setup_pv_console function registers a writing function
+     * that makes hvm guests crash on Xen 4.2
+     */
+    if ( (!IS_DEFINED(CONFIG_HVM) ||
+         (XEN_MAJOR(xen_version) >= 4 && XEN_MINOR(xen_version) > 2)) &&
+         !is_initdomain() )
     {
         setup_pv_console();
+    }
+
+    if ( !is_initdomain() )
+    {
         setup_xenbus();
     }
 
diff --git a/common/setup.c b/common/setup.c
index 932fc09..1d3da15 100644
--- a/common/setup.c
+++ b/common/setup.c
@@ -19,9 +19,13 @@
  */
 void __noreturn xtf_main(void)
 {
-    arch_setup();
+    int xen_version;
+
+    arch_setup(&xen_version);
 
     printk("--- Xen Test Framework ---\n");
+    printk("Found Xen: %d.%d\n", XEN_MAJOR(xen_version),
+           XEN_MINOR(xen_version));
     printk("Environment: %s\n", environment_description);
     printk("%s\n", test_title);
 
diff --git a/include/xtf/framework.h b/include/xtf/framework.h
index a71bf39..6664733 100644
--- a/include/xtf/framework.h
+++ b/include/xtf/framework.h
@@ -2,7 +2,7 @@
 #define XTF_FRAMEWORK_H
 
 /* To be implemented by each arch */
-void arch_setup(void);
+void arch_setup(int *);
 void test_setup(void);
 
 /* Single line summary of execution environment. */
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




