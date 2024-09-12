Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9389769A0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 14:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797447.1207403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojIo-0003zL-1O; Thu, 12 Sep 2024 12:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797447.1207403; Thu, 12 Sep 2024 12:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojIn-0003wv-Uz; Thu, 12 Sep 2024 12:52:01 +0000
Received: by outflank-mailman (input) for mailman id 797447;
 Thu, 12 Sep 2024 12:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDyH=QK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sojIm-0003wp-Pk
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 12:52:00 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc39bbdd-7105-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 14:51:58 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso112327366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 05:51:58 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c72e49sm743329566b.127.2024.09.12.05.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 05:51:57 -0700 (PDT)
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
X-Inumbo-ID: cc39bbdd-7105-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726145518; x=1726750318; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8YEkouAvvU/30llpDDU3qJxEwFSco4VI7IUeqcZ2LMs=;
        b=FFsm3JOVDeFs7Bc8Kh73sUo5nwG6tKDONnURJbLsgEHZr2aG+ZTCiGA4gMHHfXxPMJ
         fdvrgn4WNUdd3ET2URKZXBSEVoCNw+7RBCBToNHOhasB2qWijPG8VWzwEpOi4XNBfoWN
         nVw4xEzVWCGneOQ/rKw3H+ekZO2LN2Pao3zLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726145518; x=1726750318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YEkouAvvU/30llpDDU3qJxEwFSco4VI7IUeqcZ2LMs=;
        b=IYzxTSDD5xNwWRDT20r0f0r204Y+EXIZy+2FEU9gMrDFej1wP+910mFOR60s0M3HCU
         L8gkO2MGw8Tlk3np9ZMckYCVsFGWl4oZUJqrCuE+t6LsWGEvmr/gx2BayFteBxtF16j3
         pAROSYmqNAoQp6zxq/GoxymbnP0DfQS4CycqhqeyVQXLsFfC7H37FdasfAnSmuFl+cKX
         Q6SLKP6uJ0TTM5qpN5f9YK9EMMqTQ0u/I1Lto9yekLcdQmhYQE3QDGUGEte6WEIa7Its
         PBjiW5iPCJChH+cPLQAdtA5AqVK64bRJTcnzfLwAWHSnxCx6u7emavw72rKkg0A9tHMx
         9LmA==
X-Gm-Message-State: AOJu0YwLiTJk5TTys78FSXzdtBDCbA+ce1TGPpx4GJjKT0tEJne0mFqC
	vBrTPMxX1D77EGtDXaqYD0Ai/uePTmizhGVoJphScV1yLK6yoX893hpx+OJjfebYcVD97cSp2q4
	N
X-Google-Smtp-Source: AGHT+IGyh4rM/X86rR3hP6k0lhV214aDI8xNxcS5KWLOY0aW8kfkgp5eSpfw//8t6AvIs5K7T6mI2g==
X-Received: by 2002:a17:907:9404:b0:a8d:592d:f76 with SMTP id a640c23a62f3a-a90296eab6amr267238166b.48.1726145517539;
        Thu, 12 Sep 2024 05:51:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH] xen/keyhandler: Move key_table[] into __ro_after_init
Date: Thu, 12 Sep 2024 13:51:54 +0100
Message-Id: <20240912125154.1708025-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All registration is done at boot.  Almost...

iommu_dump_page_tables() is registered in iommu_hwdom_init(), which is called
twice when LATE_HWDOM is in use.

register_irq_keyhandler() has an ASSERT() guarding againt multiple
registration attempts, and the absence of bug reports hints at how many
configurations use LATE_HWDOM in practice.

Move the registration into iommu_setup() just after printing the overall
status of the IOMMU.  For starters, the hardware domain is specifically
excluded by iommu_dump_page_tables().

ept_dump_p2m_table is registered in setup_ept_dump() which is non-__init, but
whose sole caller, start_vmx(), is __init.  Move setup_ept_dump() to match.

With these two tweeks, all keyhandler reigstration is from __init functions,
so register_{,irq_}keyhandler() can move, and key_table[] can become
__ro_after_init.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Jason Andryuk <jandryuk@gmail.com>

CC'ing some OpenXT folks just FYI.
---
 xen/arch/x86/mm/p2m-ept.c       |  2 +-
 xen/common/keyhandler.c         | 10 +++++-----
 xen/drivers/passthrough/iommu.c |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 2ea574ca6aef..21728397f9ac 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1497,7 +1497,7 @@ static void cf_check ept_dump_p2m_table(unsigned char key)
     rcu_read_unlock(&domlist_read_lock);
 }
 
-void setup_ept_dump(void)
+void __init setup_ept_dump(void)
 {
     register_keyhandler('D', ept_dump_p2m_table, "dump VT-x EPT tables", 0);
 }
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 674e7be39e9d..6da291b34ebc 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -40,7 +40,7 @@ static struct keyhandler {
     const char *desc;    /* Description for help message.                 */
     bool irq_callback,   /* Call in irq context? if not, tasklet context. */
         diagnostic;      /* Include in 'dump all' handler.                */
-} key_table[128] __read_mostly =
+} key_table[128] __ro_after_init =
 {
 #define KEYHANDLER(k, f, desc, diag)            \
     [k] = { { .fn = (f) }, desc, 0, diag }
@@ -99,8 +99,8 @@ void handle_keypress(unsigned char key, bool need_context)
     }
 }
 
-void register_keyhandler(unsigned char key, keyhandler_fn_t *fn,
-                         const char *desc, bool diagnostic)
+void __init register_keyhandler(unsigned char key, keyhandler_fn_t *fn,
+                                const char *desc, bool diagnostic)
 {
     BUG_ON(key >= ARRAY_SIZE(key_table)); /* Key in range? */
     ASSERT(!key_table[key].fn);           /* Clobbering something else? */
@@ -111,8 +111,8 @@ void register_keyhandler(unsigned char key, keyhandler_fn_t *fn,
     key_table[key].diagnostic = diagnostic;
 }
 
-void register_irq_keyhandler(unsigned char key, irq_keyhandler_fn_t *fn,
-                             const char *desc, bool diagnostic)
+void __init register_irq_keyhandler(unsigned char key, irq_keyhandler_fn_t *fn,
+                                    const char *desc, bool diagnostic)
 {
     BUG_ON(key >= ARRAY_SIZE(key_table)); /* Key in range? */
     ASSERT(!key_table[key].irq_fn);       /* Clobbering something else? */
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 50bfd62553ae..1c567d441cd5 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -271,8 +271,6 @@ void __hwdom_init iommu_hwdom_init(struct domain *d)
     if ( !is_iommu_enabled(d) )
         return;
 
-    register_keyhandler('o', &iommu_dump_page_tables, "dump iommu page tables", 0);
-
     iommu_vcall(hd->platform_ops, hwdom_init, d);
 }
 
@@ -596,6 +594,8 @@ int __init iommu_setup(void)
     }
     else
     {
+        register_keyhandler('o', &iommu_dump_page_tables, "dump iommu page tables", 0);
+
         if ( iommu_quarantine_init() )
             panic("Could not set up quarantine\n");
 

base-commit: 221f2748e8dabe8361b8cdfcffbeab9102c4c899
-- 
2.39.2


