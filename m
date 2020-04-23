Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0A71B58FD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:20:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRYyD-0000DC-J4; Thu, 23 Apr 2020 10:20:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19NY=6H=amazon.de=prvs=375504273=wipawel@srs-us1.protection.inumbo.net>)
 id 1jRYyC-0000Cf-97
 for xen-devel@lists.xen.org; Thu, 23 Apr 2020 10:20:36 +0000
X-Inumbo-ID: 121e585a-854c-11ea-933f-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 121e585a-854c-11ea-933f-12813bfff9fa;
 Thu, 23 Apr 2020 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587637236; x=1619173236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=UEPw6O3BljFwct47izeBxnxQHVPFN3vhQxafqb4+2o0=;
 b=TUB8DkG4tjLKAkHS0Yxn/ZQGIfJRRKv+Nfn0OQ1+6mYGIoC0CrPkCNlt
 fIMzIjj2xSbEIQ1utjNHMEoK2IoQAJo9PEXM7kIVgAEaQ/+DOWP2/4gL7
 mxLMpjyZowBMnG+6JVKbpbZknXNmS8nxXKzAnm9HSzRKaviYj5+iLoGON U=;
IronPort-SDR: pE/Vkb8G3n4UPrsL4P+p6sU4qAL/VOKEtuXsUVsH+a21YJdftrc4H6v2Z69Z4vKp41Icb2c8yc
 ap/6DAKwgfyg==
X-IronPort-AV: E=Sophos;i="5.73,306,1583193600"; d="scan'208";a="39000814"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 23 Apr 2020 10:20:35 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id F003F1A096C; Thu, 23 Apr 2020 10:20:34 +0000 (UTC)
Received: from EX13D05EUC001.ant.amazon.com (10.43.164.118) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:20:03 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05EUC001.ant.amazon.com (10.43.164.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:20:02 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 23 Apr 2020 10:20:01 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF v2 v2 1/4] lib: Add XEN_MAJOR() and XEN_MINOR() macros
Date: Thu, 23 Apr 2020 10:19:52 +0000
Message-ID: <20200423101955.13761-2-wipawel@amazon.de>
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

These are just a simple macros obtaining major, minor values as
returned by xen_version hypercall.

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
---
 include/xtf/lib.h    | 3 +++
 tests/xsa-213/main.c | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/xtf/lib.h b/include/xtf/lib.h
index 3348464..40e5731 100644
--- a/include/xtf/lib.h
+++ b/include/xtf/lib.h
@@ -20,6 +20,9 @@
 
 #define ACCESS_ONCE(x)   (*(volatile typeof(x) *)&(x))
 
+#define XEN_MAJOR(v) (((v) >> 16) & 0xFFFF)
+#define XEN_MINOR(v) ((v) & 0xFFFF)
+
 void __noreturn panic(const char *fmt, ...) __printf(1, 2);
 
 #define ASSERT(cond)                                    \
diff --git a/tests/xsa-213/main.c b/tests/xsa-213/main.c
index 64e7065..0353168 100644
--- a/tests/xsa-213/main.c
+++ b/tests/xsa-213/main.c
@@ -121,8 +121,8 @@ void test_main(void)
 {
     long rc, xen_version = hypercall_xen_version(XENVER_version, NULL);
 
-    printk("Found Xen %ld.%ld\n",
-           (xen_version >> 16) & 0xffff, xen_version & 0xffff);
+    printk("Found Xen %ld.%ld\n", XEN_MAJOR(xen_version),
+           XEN_MINOR(xen_version));
 
     xtf_set_idte(X86_VEC_AVAIL, &idte);
 
-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




