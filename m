Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787CCAB881D
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985568.1371539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYkW-0004kM-MM; Thu, 15 May 2025 13:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985568.1371539; Thu, 15 May 2025 13:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYkW-0004i4-J1; Thu, 15 May 2025 13:35:48 +0000
Received: by outflank-mailman (input) for mailman id 985568;
 Thu, 15 May 2025 13:35:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYZ7-0006hT-Bs
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:24:01 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dba7a068-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:23:59 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315209798429.1071845469214;
 Thu, 15 May 2025 06:20:09 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: dba7a068-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315212; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KGwhecJPrAyzXiI+rPL2Hgkpv+VCL4N7U/F9kNGD4XivV/Jx7sZYZj4YtGg4l2z8h9FHtF58kP9UDLHVNQp3oAwWJkqY1wO+DQ9yl5Ahi4kGdKKVPwoa9QMBEctDTEcbSxiBMEGmB9Ni6VOk1MtTYu4Srg4gajbTxIKbGyXdf2w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315212; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3Eyu8lLx+Tyc3aIxfZMaVPXRhgaSBDm19yKWfpBW1Pg=; 
	b=OfwDoneWbh6SnJgV24/faAS/UD9KBKwHL1WtU7L9Vqsw4KEEHBUSiALnlX52FxotTPeM8Ocbq3wH1J3xOztIQO3ono8ZW5XyzTjPZg1psAw7p3hvGGemvWi2j7P7kBwEN0nwogGI+Y/zG3yYMzHr7P+N7Qp+nngnd1tcBqAIZ3Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315212;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=3Eyu8lLx+Tyc3aIxfZMaVPXRhgaSBDm19yKWfpBW1Pg=;
	b=o0hySsnKfpvfqvjO0PDYx4W2AlUosmI0Vjd3/GZ730ciPyc6P8wPxjKWPk4g2Ikb
	w+fhj5DZIU8svle3EucU6wzMZtVRKeNz6NYD/tzR3S5sg9t8B286mRXsbus2yGY1eea
	dbSF/kxd+/0tkAWtOa1WqxE59wWBP+1aZd/YMiuo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [RFCv2 36/38] x86/hyperlaunch: enable unpausing mulitple domains
Date: Thu, 15 May 2025 09:19:48 -0400
Message-Id: <20250515131951.5594-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131951.5594-1-dpsmith@apertussolutions.com>
References: <20250515131951.5594-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit enables the domain builder to unpause all domains
that have been flagged to start on boot.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/core.c     | 20 ++++++++++++++++++++
 xen/arch/x86/include/asm/boot-domain.h |  8 +++++---
 xen/arch/x86/setup.c                   |  8 +++++++-
 xen/include/xen/domain-builder.h       |  1 +
 4 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index 367c0de33cfb..dbe547ff0a87 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -7,6 +7,7 @@
 #include <xen/domain-builder.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 
 #include <asm/bootinfo.h>
 #include <asm/pv/shim.h>
@@ -109,6 +110,25 @@ unsigned int __init builder_create_domains(struct boot_info *bi)
     return build_count;
 }
 
+int __init builder_unpause_domains(struct boot_info *bi)
+{
+    int i, count = 0;
+
+    for ( i = 0; i < bi->nr_domains; i++ )
+    {
+        struct boot_domain *bd = &bi->domains[i];
+
+        if ( bd->capabilities & DOMAIN_CAPS_HARDWARE ||
+             bd->mode & BUILD_MODE_START_ON_BOOT )
+        {
+            domain_unpause_by_systemcontroller(bd->d);
+            count++;
+        }
+    }
+
+    return count;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index 41246f31acce..b04d48010799 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -18,9 +18,11 @@ struct boot_domain {
     /* Bitmap. See DOMAIN_CAPS_MASK for a list */
     uint32_t capabilities;
 
-                                          /* On     | Off    */
-#define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
-#define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
+                                          /* On       | Off     */
+#define BUILD_MODE_PARAVIRT      (1 << 0) /* PV       | PVH/HVM */
+#define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM      | PVH     */
+#define BUILD_MODE_LONG          (1 << 2) /* 64 BIT   | 32 BIT  */
+#define BUILD_MODE_START_ON_BOOT (1 << 3) /* UNPAUSED | PAUSED  */
     uint32_t mode;
 
     unsigned long mem_pages;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 422fef7ce02a..b55a1da9db91 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -790,6 +790,7 @@ static inline bool using_2M_mapping(void)
 
 static void noreturn init_done(void)
 {
+    struct boot_info *bi = &xen_boot_info;
     void *va;
     unsigned long start, end;
     int err;
@@ -803,7 +804,12 @@ static void noreturn init_done(void)
     if ( IS_ENABLED(CONFIG_SELF_TESTS) && cpu_has_xen_shstk )
         stub_selftest();
 
-    domain_unpause_by_systemcontroller(dom0);
+    err = builder_unpause_domains(bi);
+    if ( err == 0 )
+        panic("domain builder: failed to schedule any domain to start\n");
+    else
+        printk("domain builder: unpaused %d of %d domains at boot\n", err,
+               bi->nr_domains);
 
     /* MUST be done prior to removing .init data. */
     unregister_init_virtual_region();
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index ca9d9032b35b..eb8f5773b17e 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -46,5 +46,6 @@ struct domain *arch_create_dom(
 int arch_builder_finalize(struct boot_info *bi);
 
 unsigned int builder_create_domains(struct boot_info *bi);
+int builder_unpause_domains(struct boot_info *bi);
 
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
-- 
2.30.2


