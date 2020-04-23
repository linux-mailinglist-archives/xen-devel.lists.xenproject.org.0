Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91D51B5900
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:20:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRYyJ-0000GE-8G; Thu, 23 Apr 2020 10:20:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19NY=6H=amazon.de=prvs=375504273=wipawel@srs-us1.protection.inumbo.net>)
 id 1jRYyH-0000FJ-98
 for xen-devel@lists.xen.org; Thu, 23 Apr 2020 10:20:41 +0000
X-Inumbo-ID: 14fe0462-854c-11ea-933f-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14fe0462-854c-11ea-933f-12813bfff9fa;
 Thu, 23 Apr 2020 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587637241; x=1619173241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HiisovRaNwUVzKLO6bCQTn0qmgMmDEJUOogYX7aiDJQ=;
 b=Iw/V6jbKdwyK5l81Rnpm9Nxg/yUawksT4C3FBkFFEqjiST7JlGgmFZ0o
 +a90y98N/iBC5kA6AwfT4qyTFYWWXEvvMBK9ZvVuWNPujh0XsULSpKt/n
 PZOn3lS5mOkf+VPduWTWfsRHHbK3xdKYQbVJc+Gfqf0jfbTJTbC1W0zar 0=;
IronPort-SDR: zs0Duf4Xub3vFvvZ5PitbdHS78SI57IbNFprip9HCA3wj9U1K0m3dvhPBBKHJFnAhZVAtOGfwo
 PK+s4w8LYcBw==
X-IronPort-AV: E=Sophos;i="5.73,306,1583193600"; d="scan'208";a="39000829"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 23 Apr 2020 10:20:40 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id C6A11A2440; Thu, 23 Apr 2020 10:20:39 +0000 (UTC)
Received: from EX13D02EUB004.ant.amazon.com (10.43.166.221) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:20:07 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D02EUB004.ant.amazon.com (10.43.166.221) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:20:06 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 23 Apr 2020 10:20:05 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF v2 v2 3/4] Enabled serial writing for hvm guests
Date: Thu, 23 Apr 2020 10:19:54 +0000
Message-ID: <20200423101955.13761-4-wipawel@amazon.de>
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

From: Paul Semel <phentex@amazon.de>

setup.c: PV console writing is not working in Xen 4.2 for hvm
guests, so we make xtf write to COM1 serial port to get its output

Signed-off-by: Paul Semel <phentex@amazon.de>
Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
Changed since v1:
  * Increase callbacks array

 arch/x86/setup.c | 14 ++++++++++++++
 common/console.c |  3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index 3c84e96..f6fa4df 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -238,6 +238,13 @@ static void qemu_console_write(const char *buf, size_t len)
                  : "d" (0x12));
 }
 
+static void com1_write(const char *buf, size_t len)
+{
+    asm volatile("rep; outsb"
+                 : "+S" (buf), "+c" (len)
+                 : "d" (0x3f8));
+}
+
 static void xen_console_write(const char *buf, size_t len)
 {
     hypercall_console_write(buf, len);
@@ -246,7 +253,14 @@ static void xen_console_write(const char *buf, size_t len)
 void arch_setup(void)
 {
     if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
+    {
         register_console_callback(qemu_console_write);
+    }
+
+    if ( IS_DEFINED(CONFIG_HVM) )
+    {
+        register_console_callback(com1_write);
+    }
 
     register_console_callback(xen_console_write);
 
diff --git a/common/console.c b/common/console.c
index 0724fc9..00dbbca 100644
--- a/common/console.c
+++ b/common/console.c
@@ -13,8 +13,9 @@
  * - Xen hypervisor console
  * - PV console
  * - Qemu debug console
+ * - COM1 serial console
  */
-static cons_output_cb output_fns[3];
+static cons_output_cb output_fns[4];
 static unsigned int nr_cons_cb;
 
 /* Guest PV console details. */
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




