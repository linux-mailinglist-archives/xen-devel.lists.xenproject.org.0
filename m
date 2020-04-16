Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE71ABD07
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 11:42:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP125-0005UP-Bl; Thu, 16 Apr 2020 09:42:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xq2g=6A=amazon.de=prvs=368a07d89=wipawel@srs-us1.protection.inumbo.net>)
 id 1jP124-0005UF-Jb
 for xen-devel@lists.xen.org; Thu, 16 Apr 2020 09:42:04 +0000
X-Inumbo-ID: 86c7512e-7fc6-11ea-9e09-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86c7512e-7fc6-11ea-9e09-bc764e2007e4;
 Thu, 16 Apr 2020 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587030124; x=1618566124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=79p/4CDiEGJ18qhAhEUHKqQ88FWOgjBQJAWLoAZCclQ=;
 b=IVzJqfanxImuCiJars7ebN0+vxcrTvuVeyAwRcmheUSg/0PbrF5PcMVC
 3w0i3P+HlLHrfKiZVsuwGyo+dBsfvLONl25RVKcHKlJxWW3bOeizM4aL0
 93bBzwhDvv+mAcSl9EG1RcgV/WaVrQsUcg91K1W6PaTePQXfMxCzNICCy k=;
IronPort-SDR: Fy6DzixMvXQkmTCjVVJW3EyoVB9tCVaYJjwpWq+ZmtQkdWygvOGzzv1WJse+ZIwXC66gZpIcoL
 hxKteE0w2Fkg==
X-IronPort-AV: E=Sophos;i="5.72,390,1580774400"; d="scan'208";a="38805096"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 16 Apr 2020 09:42:02 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id F0AF1A1F4D; Thu, 16 Apr 2020 09:42:00 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 09:42:00 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 09:41:59 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Apr 2020 09:41:57 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 3/4] Enabled serial writing for hvm guests
Date: Thu, 16 Apr 2020 09:41:40 +0000
Message-ID: <20200416094141.65120-4-wipawel@amazon.de>
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

setup.c: PV console writing is not working in Xen 4.2 for hvm
guests, so we make xtf write to COM1 serial port to get its output

Signed-off-by: Paul Semel <phentex@amazon.de>
Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 arch/x86/setup.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

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
 
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




