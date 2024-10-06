Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8299921DE
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811388.1224119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFI-0000Hl-Gu; Sun, 06 Oct 2024 21:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811388.1224119; Sun, 06 Oct 2024 21:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFI-0000EM-Cu; Sun, 06 Oct 2024 21:56:56 +0000
Received: by outflank-mailman (input) for mailman id 811388;
 Sun, 06 Oct 2024 21:56:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZDu-0007Zk-Pc
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:55:30 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2fff737-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:55:29 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251451864396.89237154171735;
 Sun, 6 Oct 2024 14:50:51 -0700 (PDT)
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
X-Inumbo-ID: b2fff737-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251453; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gUr1ufUEBitU+nDM0BWSLW+Xx/Hmfr4uUJ7xlx+234sllpYdyGknA5gSMWCbMau/MquWwq5RD4ijUNdSSaoBEBdSgBtoy8PEggI+4xEzhoLp7uArk1S8GaOPno/D7z+lKTfS0gMznOXRVjkw7dlLVd6H9e1oY15Bnn8G/9ErF58=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251453; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lUf8dRXsSe31nIQ8ru6siZ++csVBXQ/vKqr++5VfORM=; 
	b=hScijmFEh7BrkJmujyCZTUJJAkAs2+95VGStCtgi8B8kR9cEHpkjAW+yj0P3AffqXOFmo7BXqn1e41v4L+pnkx+O3S3mFdtj3XqDZ7erSwQtPbZ0j3smOidZuj1UWb8nCeMz+LQiflcVkO1a68NssK+I2Fj01LF4EAqcWcw+nPQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251453;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=lUf8dRXsSe31nIQ8ru6siZ++csVBXQ/vKqr++5VfORM=;
	b=AgfTJL4QRtO6aQOjgJCvE70ZYtT2E7QXd8EQrvu+iy4V1bNFe8HdsAeQv3razu2I
	3HSiC/o56QZbRySI9kZNljZaqWp/9legmkv3yVR+jgYozRKL0m+Ui1Iya8RMN7QxsnA
	tj8cTyYW/deTCRBhwznDeieOp2fFJ0vkEwR4Iko0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 41/44] x86/boot: add struct domain to struct boot_domain
Date: Sun,  6 Oct 2024 17:49:52 -0400
Message-Id: <20241006214956.24339-42-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Store a reference to the created domain in struct boot_domain.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootdomain.h |  3 +++
 xen/arch/x86/setup.c                  | 15 +++++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 00f7d9267965..2322c459e36a 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -10,6 +10,7 @@
 
 #include <public/xen.h>
 
+struct domain;
 struct boot_module;
 
 struct boot_domain {
@@ -19,6 +20,8 @@ struct boot_domain {
 
     struct boot_module *kernel;
     struct boot_module *ramdisk;
+
+    struct domain *d;
 };
 
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f250638edf09..e6a231bd2d42 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -959,7 +959,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         },
     };
     struct boot_domain *bd = &bi->domains[0];
-    struct domain *d;
 
     if ( opt_dom0_pvh )
     {
@@ -976,13 +975,13 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     /* Create initial domain.  Not d0 for pvshim. */
     bd->domid = get_initial_domain_id();
-    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
-    if ( IS_ERR(d) )
-        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
+    bd->d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    if ( IS_ERR(bd->d) )
+        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(bd->d));
 
-    init_dom0_cpuid_policy(d);
+    init_dom0_cpuid_policy(bd->d);
 
-    if ( alloc_dom0_vcpu0(d) == NULL )
+    if ( alloc_dom0_vcpu0(bd->d) == NULL )
         panic("Error creating d%uv0\n", bd->domid);
 
     /* Grab the DOM0 command line. */
@@ -1014,10 +1013,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         }
     }
 
-    if ( construct_dom0(d, bd->kernel, bd->ramdisk, bd->cmdline) != 0 )
+    if ( construct_dom0(bd->d, bd->kernel, bd->ramdisk, bd->cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
-    return d;
+    return bd->d;
 }
 
 /* How much of the directmap is prebuilt at compile time. */
-- 
2.30.2


