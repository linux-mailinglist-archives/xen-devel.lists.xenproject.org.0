Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FE21B5901
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:20:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRYyN-0000Kc-PS; Thu, 23 Apr 2020 10:20:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19NY=6H=amazon.de=prvs=375504273=wipawel@srs-us1.protection.inumbo.net>)
 id 1jRYyM-0000Jo-9R
 for xen-devel@lists.xen.org; Thu, 23 Apr 2020 10:20:46 +0000
X-Inumbo-ID: 165d3ce2-854c-11ea-933f-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 165d3ce2-854c-11ea-933f-12813bfff9fa;
 Thu, 23 Apr 2020 10:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587637243; x=1619173243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=CjFqQ+keD3M1wnKEBrWhKs4cY4eZTedQKArYB4JSIjI=;
 b=jahZ6TB8nHqnN8S6uIs8JGd/aYoz8wo2mwnSYi5FmZIxkNxMygSuYdUv
 4vS+DBY074lUvZmmV80tSZwFzIQX2L6K608yD6mcW/C+Z+AmMRu7+d035
 OVs+PF+1l5PtUJ065yDtr40SZI3D04mwDGr0n7xPN0ZOAzXc13T6PIsg8 I=;
IronPort-SDR: /jbhi4Q56Gsl6ZEf5UWIXHnH0gc7bFQXGSzWLpPBXKEuTjzOlH1g7u/iYEjqd2B076yb/8p1qv
 NHYEjCIi1AbQ==
X-IronPort-AV: E=Sophos;i="5.73,306,1583193600"; d="scan'208";a="30669955"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 23 Apr 2020 10:20:42 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id EF32BC693C; Thu, 23 Apr 2020 10:20:41 +0000 (UTC)
Received: from EX13D02EUB002.ant.amazon.com (10.43.166.170) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:20:09 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D02EUB002.ant.amazon.com (10.43.166.170) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:20:08 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 23 Apr 2020 10:20:07 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF v2 v2 4/4] setup: Detect and display Xen version on test startup
Date: Thu, 23 Apr 2020 10:19:55 +0000
Message-ID: <20200423101955.13761-5-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200423101955.13761-1-wipawel@amazon.de>
References: <20200423101955.13761-1-wipawel@amazon.de>
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

In arch_setup() detect Xen version by issuing xen_version hypercall
and optionally pass the version to main_xtf().

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
Changed since v1:
  * Do not limit setup_pv_console() to HVM only. It does not crash.
    It merely panics because the callbacks array wasn't increased.

 arch/x86/setup.c        | 8 +++++++-
 common/setup.c          | 6 +++++-
 include/xtf/framework.h | 2 +-
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index f6fa4df..15ca3bb 100644
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
@@ -272,6 +274,10 @@ void arch_setup(void)
 
     init_hypercalls();
 
+    xen_version = hypercall_xen_version(XENVER_version, NULL);
+    if ( version )
+        *version = xen_version;
+
     if ( !is_initdomain() )
     {
         setup_pv_console();
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




