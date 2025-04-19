Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFFDA945C6
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960273.1352386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZ7-0006ox-D9; Sat, 19 Apr 2025 22:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960273.1352386; Sat, 19 Apr 2025 22:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZ7-0006iW-5L; Sat, 19 Apr 2025 22:21:37 +0000
Received: by outflank-mailman (input) for mailman id 960273;
 Sat, 19 Apr 2025 22:21:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GRp-0004yY-7a
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:14:05 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99dcf2b1-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:14:04 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 17451005681919.729422362614287;
 Sat, 19 Apr 2025 15:09:28 -0700 (PDT)
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
X-Inumbo-ID: 99dcf2b1-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100571; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IeC677nf98P/AOhN210mWuPZjzW3XkZvyeBoTAPX42mwIDr/DA4h+bWDvezCNyORG3dsCnW2kOhzVA/TXgjehU3dJ8PwpeYXjQJOeFWOi2D0uNUf+hcAOpVN2ts93iE90mwyRkC+aEhpn4GvN9cl2XHo/HxSH4QlS0a4FVYYF24=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100571; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lqmxREyAE0WjRdlDATtWmFP941B+/fkRIhZO5eZCnWA=; 
	b=FPWgwbab7TgW70DOAImMDgvCzOT30qSfqfAFyE1HzGjTgdajGdUZwnKhq5eGFSBD+IZfVHMkdME77Ofql2gd9KyBU8Z27lP7E+c+g+AnT2FeDDJ39e2Ke5TzoMldaasVWMo1SLAqBkD8aSAJXnhhgmn49nLGRL4Ig7izl44Obic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100571;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=lqmxREyAE0WjRdlDATtWmFP941B+/fkRIhZO5eZCnWA=;
	b=P3kEEki7Aklx1SZji5YoSDUrUiCWXt2CK/dZ/nV2NgfvkcUDPeRe9MdlJE9T45qc
	Lc8ywD+kPmMOwmV/b69mRRLCR5K/yR9taaSrCw3NqNcTImZyYIw4KL+j/F4b09u6vYm
	5OHY1hv4vcUVR3/8S1tLmH+cmf649GKyHCVlg8Rc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 36/38] x86/hyperlaunch: enable unpausing mulitple domains
Date: Sat, 19 Apr 2025 18:08:18 -0400
Message-Id: <20250419220820.4234-37-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit enables the domain builder to unpause all domains
that have been flagged to start on boot.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/core.c        | 20 ++++++++++++++++++++
 xen/arch/x86/include/asm/boot-domain.h    |  8 +++++---
 xen/arch/x86/include/asm/domain-builder.h |  1 +
 xen/arch/x86/setup.c                      |  8 +++++++-
 4 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index 2712703e17e6..fa01b8390a23 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -6,6 +6,7 @@
 #include <xen/init.h>
 #include <xen/kconfig.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 
 #include <asm/bootinfo.h>
 #include <asm/domain-builder.h>
@@ -206,6 +207,25 @@ unsigned int __init builder_create_domains(struct boot_info *bi)
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
+        if ( bd->capabilities & BUILD_CAPS_HARDWARE ||
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
index a574f4941ed3..b592aef84b27 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -22,9 +22,11 @@ struct boot_domain {
 #define BUILD_CAPS_XENSTORE      (1 << 2)
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
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index 5dc5661bec07..df55cf52460c 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -9,6 +9,7 @@ int __init builder_get_cmdline(
 
 void builder_init(struct boot_info *bi);
 unsigned int builder_create_domains(struct boot_info *bi);
+int builder_unpause_domains(struct boot_info *bi);
 
 struct domain *arch_create_dom(
     struct boot_info *bi, struct boot_domain *bd);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 09b1fc94426d..ba0dd427c81b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -787,6 +787,7 @@ static inline bool using_2M_mapping(void)
 
 static void noreturn init_done(void)
 {
+    struct boot_info *bi = &xen_boot_info;
     void *va;
     unsigned long start, end;
     int err;
@@ -800,7 +801,12 @@ static void noreturn init_done(void)
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
-- 
2.30.2


