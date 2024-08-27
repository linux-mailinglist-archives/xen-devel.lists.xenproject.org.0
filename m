Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63257960AAC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 14:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783938.1193269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivUZ-0003u8-Ns; Tue, 27 Aug 2024 12:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783938.1193269; Tue, 27 Aug 2024 12:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivUZ-0003rY-Kt; Tue, 27 Aug 2024 12:40:11 +0000
Received: by outflank-mailman (input) for mailman id 783938;
 Tue, 27 Aug 2024 12:40:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYmO=P2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sivUX-0003rS-UL
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 12:40:09 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d9d96bf-6471-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 14:40:08 +0200 (CEST)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-454b3d8999aso30664431cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 05:40:07 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454fdfc9cbesm52330891cf.14.2024.08.27.05.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 05:40:05 -0700 (PDT)
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
X-Inumbo-ID: 7d9d96bf-6471-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724762406; x=1725367206; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EHxNDs3WvLLt5whh017HBp6YdKWqcf6qJVXiZj5BDTo=;
        b=h0c6IpPQpi6J7wI9kVqKwAqDyziQQ35H4hnX42cXy8HCW7y72Y2medg5D9PqMVAei3
         eSdfmGSqsHxEKLpMSiNxZo9Jecs4zdKx7sjRyZsXainOON3m0QjKD/voYIjV9QHQTCVX
         QxF+O2KLDLtvFNIYWIa2sQCdysVoEBt5OBCWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724762406; x=1725367206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHxNDs3WvLLt5whh017HBp6YdKWqcf6qJVXiZj5BDTo=;
        b=mtuMDLVsCn40MZ4efmdgYRD1OUggmbCQeZUFDaw495N2Ha9vwRKzoNceKxkU/UYv9L
         dkqIobR7pObzhuwkWqUmXa8qd49XZ1/ivP3oqaelkc8sKxqwVzjEUMBZV7q8hzXG3Mwv
         c2rtafRWt6Kz7dbtSzeHmPFxp2WMWlbGB3zQzZcOWI5RAJ4iZsCg71ldDRWRTQXeBFD6
         QYOqNbSt/iSzdLwD8XqucOX0vjMWlzMeMCrbnujGJXTxqDY9xCFPvibKrAN1Zz/CfQ3W
         EZiW3+zfql19gG+MQ1cayu94grVCPyzVQCgH56rE6uaM+f8Uzj/+ffas5b+Qh6dItCFT
         5k+A==
X-Gm-Message-State: AOJu0YxlMpMrLDx1LMWDDv96gKv5yCZgap5wkWHP5CVzrS6N/9QGbpSt
	QalGoYAwCjyVlV4qgbLqerTe2urGO3LqNbgxI3AsOrv+WZ5DIdmoO8abaI1dfhrE7Yjsi3A2Wtt
	Q
X-Google-Smtp-Source: AGHT+IGdQrAqoNNRtXtt0cqdwYjv3qar3XQO4WfWPub0I2PK0xcChcMgwA0H9GunuoS/luxm9WUA0w==
X-Received: by 2002:ac8:690e:0:b0:453:14c2:d503 with SMTP id d75a77b69052e-45509c1baf5mr162615451cf.24.1724762406202;
        Tue, 27 Aug 2024 05:40:06 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5] x86/dom0: disable SMAP for PV domain building only
Date: Tue, 27 Aug 2024 14:39:49 +0200
Message-ID: <20240827123949.24400-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the logic that disables SMAP so it's only performed when building a PV
dom0, PVH dom0 builder doesn't require disabling SMAP.

The fixes tag is to account for the wrong usage of cpu_has_smap in
create_dom0(), it should instead have used
boot_cpu_has(X86_FEATURE_XEN_SMAP).  Fix while moving the logic to apply to PV
only.

While there also make cr4_pv32_mask __ro_after_init.

Fixes: 493ab190e5b1 ('xen/sm{e, a}p: allow disabling sm{e, a}p for Xen itself')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - New approach, move the current logic so it's only applied when creating a PV
   dom0.
---
 xen/arch/x86/dom0_build.c        | 17 +++++++++++++++++
 xen/arch/x86/include/asm/setup.h |  2 ++
 xen/arch/x86/setup.c             | 19 +------------------
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 8d56705a0861..31c94b14bb06 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -612,7 +612,24 @@ int __init construct_dom0(struct domain *d, const module_t *image,
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
     else if ( is_pv_domain(d) )
+    {
+        /*
+         * Temporarily clear SMAP in CR4 to allow user-accesses in
+         * construct_dom0().  This saves a large number of corner cases
+         * interactions with copy_from_user().
+         */
+        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
+        {
+            cr4_pv32_mask &= ~X86_CR4_SMAP;
+            write_cr4(read_cr4() & ~X86_CR4_SMAP);
+        }
         rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
+        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
+        {
+            write_cr4(read_cr4() | X86_CR4_SMAP);
+            cr4_pv32_mask |= X86_CR4_SMAP;
+        }
+    }
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index d75589178b91..8f7dfefb4dcf 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -64,6 +64,8 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
 
+extern unsigned long cr4_pv32_mask;
+
 #define max_init_domid (0)
 
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eee20bb1753c..eb0fcb6c8767 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -80,7 +80,7 @@ int8_t __initdata opt_probe_port_aliases = -1;
 boolean_param("probe-port-aliases", opt_probe_port_aliases);
 
 /* Only used in asm code and within this source file */
-unsigned long asmlinkage __read_mostly cr4_pv32_mask;
+unsigned long asmlinkage __ro_after_init cr4_pv32_mask;
 
 /* **** Linux config option: propagated to domain0. */
 /* "acpi=off":    Sisables both ACPI table parsing and interpreter. */
@@ -955,26 +955,9 @@ static struct domain *__init create_dom0(const module_t *image,
         }
     }
 
-    /*
-     * Temporarily clear SMAP in CR4 to allow user-accesses in construct_dom0().
-     * This saves a large number of corner cases interactions with
-     * copy_from_user().
-     */
-    if ( cpu_has_smap )
-    {
-        cr4_pv32_mask &= ~X86_CR4_SMAP;
-        write_cr4(read_cr4() & ~X86_CR4_SMAP);
-    }
-
     if ( construct_dom0(d, image, headroom, initrd, cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
-    if ( cpu_has_smap )
-    {
-        write_cr4(read_cr4() | X86_CR4_SMAP);
-        cr4_pv32_mask |= X86_CR4_SMAP;
-    }
-
     return d;
 }
 
-- 
2.46.0


