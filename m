Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F4C966B94
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786726.1196437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9YB-0006Ef-Rr; Fri, 30 Aug 2024 21:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786726.1196437; Fri, 30 Aug 2024 21:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9YB-0006Ct-NT; Fri, 30 Aug 2024 21:52:59 +0000
Received: by outflank-mailman (input) for mailman id 786726;
 Fri, 30 Aug 2024 21:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9YA-0005aM-PN
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:52:58 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36efc773-671a-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:52:57 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054505001907.1045928467133;
 Fri, 30 Aug 2024 14:48:25 -0700 (PDT)
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
X-Inumbo-ID: 36efc773-671a-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054506; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XomcCrLeVpW08ad/3v70oAvP5emB5KRDdrW2/JPT5js1srnSkvp5X6aWhc50ZSnK+Dgd9WlAs1rfoIQv4ZcARJCh4HbdQA1TXcmUiSifX8m1+A0u40XkCkqtoR2AaDrWX1T5DcxTor1bB+seMX5fZuVqhQEvJXv1/NXM/G5Nr+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054506; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FMMyV/u+IcJlzna8xPedLWbpzcFdbye2wRnqCcAWCr4=; 
	b=dhIu1CJp6gv0Pj5rDEeAgXcnLINWMqbKLQRH/zJRnMBT+AZVgLlseL1+Xt76s8ZLO+4hq9mIzDsFpLD+B8EOD8cBMx9XlECxWJ0mM/C6aG0Oic/a5HxAS0Oj2K2iXzlTqrBlhL8fM6TmAYWjuOZPxnOKnCQCtfyPxot7mwilYJY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054506;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=FMMyV/u+IcJlzna8xPedLWbpzcFdbye2wRnqCcAWCr4=;
	b=Q9ecpxi+qWrHVcOUKwjYqwtCFh7Q4MQWgNZ2569OoDPGnO24NUa3yN2MWX7hktiJ
	RF1atkVKx107UYLFz36EdEebw7DZdb148q24qP/aamrV1AoNJw9q61mnv56N3FBixyw
	aS8IEBLtWN/3JHJmU8D1NLRTKBbxp4+cZUbLckPQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 41/44] x86/boot: add struct domain to struct boot_domain
Date: Fri, 30 Aug 2024 17:47:26 -0400
Message-Id: <20240830214730.1621-42-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
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
index 2c1aa1475c4e..872d51310628 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -963,7 +963,6 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
         },
     };
     struct boot_domain *bd = &bi->domains[0];
-    struct domain *d;
 
     if ( opt_dom0_pvh )
     {
@@ -980,13 +979,13 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
 
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
@@ -1029,7 +1028,7 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
-    if ( construct_dom0(d, bd->kernel, bd->ramdisk, bd->cmdline) != 0 )
+    if ( construct_dom0(bd->d, bd->kernel, bd->ramdisk, bd->cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
     if ( cpu_has_smap )
@@ -1038,7 +1037,7 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
         cr4_pv32_mask |= X86_CR4_SMAP;
     }
 
-    return d;
+    return bd->d;
 }
 
 /* How much of the directmap is prebuilt at compile time. */
-- 
2.30.2


