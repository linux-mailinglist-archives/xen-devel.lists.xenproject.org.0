Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A384731CFE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:48:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549718.858435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDI-0007Dk-RM; Thu, 15 Jun 2023 15:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549718.858435; Thu, 15 Jun 2023 15:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDI-00077B-Kd; Thu, 15 Jun 2023 15:48:44 +0000
Received: by outflank-mailman (input) for mailman id 549718;
 Thu, 15 Jun 2023 15:48:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrMH=CD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q9pDG-0006RS-HC
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:48:42 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a3a6748-0b94-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 17:48:41 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f8d176396bso19742675e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:48:41 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e10-20020a056000194a00b0030497b3224bsm21374699wry.64.2023.06.15.08.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 08:48:40 -0700 (PDT)
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
X-Inumbo-ID: 1a3a6748-0b94-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686844121; x=1689436121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PygkzDMarvKkBrBEGn4BWQS9IKMe1k1LLgAi19GYhP8=;
        b=HPzd4Zyex9as+U9ydNDI3tGQtwRCTB7c7d5MjHU1IH8Z7jJhGrRWMjIL7+bYYRmPZi
         2/FVV3+PCcnsuD4nA9pUUZsazPWwBkfMA/NyyuLkbZLgWUjkwPp2kJke7eW5lmbkBPvr
         9KVvJBUONVVNh0pyhy8zuMWPCpTfUYh2u/Ubk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686844121; x=1689436121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PygkzDMarvKkBrBEGn4BWQS9IKMe1k1LLgAi19GYhP8=;
        b=X/Krc+wz3zqFs9MHSjFlwCKPF5DQ0pGE45nsl7nBR1+R8T8QsSuN1zuyrkVlZmP2ZA
         r6AE6PrxpbSoX6E6Bh5pTBTvTsL4fOXvEXF9kcJ4I5HC6CoBM49FS3aObEZnnecNeIkq
         qw2RR9M4J1bCAU/sqNzRQIqQZhPq2zlhCN5BUxbx0EbVV71Wj0FkyPMZ3Mdh66mzd/mB
         YdQuLPVf6ZEbuq/29G+zCd86+sVODiOIiFwBc/GExDBUvqPtlU/BGekpqMho0/c5irHb
         m2HNhvx/eNIcuLfap0KIfi/ZBEZ6i58sucGO037LlzRamF6eqiRWCmd0Htm7DHkD9U7V
         e8Uw==
X-Gm-Message-State: AC+VfDxaGYxmAhKomM9SgnlLQ8rMBNqNtKDprWU0DVomBWPBfshKZvB/
	K5Y0633ZclIfaqlebGIwWwPo0jBv5EIv5jcs/AM=
X-Google-Smtp-Source: ACHHUZ7u+G2JRXo+ew0FlGXSbGfZJGVxMwXLRreh9PhyU0vbxEMYOMEJcEb2FgtgArGvvYTQMrt1/w==
X-Received: by 2002:a5d:6b0f:0:b0:311:17ae:ddbf with SMTP id v15-20020a5d6b0f000000b0031117aeddbfmr1615595wrw.51.1686844121294;
        Thu, 15 Jun 2023 08:48:41 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 4/5] x86: Read MSR_ARCH_CAPS immediately after early_microcode_init()
Date: Thu, 15 Jun 2023 16:48:33 +0100
Message-Id: <20230615154834.959-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615154834.959-1-alejandro.vallejo@cloud.com>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move MSR_ARCH_CAPS read code from tsx_init() to immediately after the
early microcode update. This helps keep the reload closer to its cause
and is the earliest point we can read it, as it might be exposed only after
a microcode update.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
  * Replaces v2/patch2. Moved after the "rev == ~0" check (Andrew)
---
 xen/arch/x86/cpu/microcode/core.c | 13 +++++++++++++
 xen/arch/x86/tsx.c                | 15 +++------------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 1554fa38eb..ef3c94018c 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -879,5 +879,18 @@ int __init early_microcode_init(unsigned long *module_map,
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
+    /*
+     * We might have exposed MSR_ARCH_CAPS after the microcode update.
+     * Reload relevant fields in boot_cpu_data if so because they are
+     * needed in tsx_init()
+     */
+    if ( boot_cpu_data.cpuid_level >= 7 )
+        boot_cpu_data.x86_capability[FEATURESET_7d0]
+            = cpuid_count_edx(7, 0);
+    if ( cpu_has_arch_caps )
+        rdmsr(MSR_ARCH_CAPABILITIES,
+              boot_cpu_data.x86_capability[FEATURESET_m10Al],
+              boot_cpu_data.x86_capability[FEATURESET_m10Ah]);
+
     return rc;
 }
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 80c6f4cedd..11e9471180 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -39,9 +39,9 @@ void tsx_init(void)
     static bool __read_mostly once;
 
     /*
-     * This function is first called between microcode being loaded, and CPUID
-     * being scanned generally.  Read into boot_cpu_data.x86_capability[] for
-     * the cpu_has_* bits we care about using here.
+     * This function is first called between microcode being loaded, and
+     * CPUID being scanned generally. early_microcode_init() has already
+     * prepared the feature bits needed here after the microcode update.
      */
     if ( unlikely(!once) )
     {
@@ -49,15 +49,6 @@ void tsx_init(void)
 
         once = true;
 
-        if ( boot_cpu_data.cpuid_level >= 7 )
-            boot_cpu_data.x86_capability[FEATURESET_7d0]
-                = cpuid_count_edx(7, 0);
-
-        if ( cpu_has_arch_caps )
-            rdmsr(MSR_ARCH_CAPABILITIES,
-                  boot_cpu_data.x86_capability[FEATURESET_m10Al],
-                  boot_cpu_data.x86_capability[FEATURESET_m10Ah]);
-
         has_rtm_always_abort = cpu_has_rtm_always_abort;
 
         if ( cpu_has_tsx_ctrl && cpu_has_srbds_ctrl )
-- 
2.34.1


