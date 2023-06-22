Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072573A781
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 19:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553875.864703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOK9-0007LI-VE; Thu, 22 Jun 2023 17:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553875.864703; Thu, 22 Jun 2023 17:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOK9-0007IT-Rf; Thu, 22 Jun 2023 17:42:25 +0000
Received: by outflank-mailman (input) for mailman id 553875;
 Thu, 22 Jun 2023 17:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCOK8-00072l-Ek
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 17:42:24 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2548ad0f-1124-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 19:42:23 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-307d20548adso6348479f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 10:42:23 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d604b000000b003078681a1e8sm7558457wrt.54.2023.06.22.10.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 10:42:22 -0700 (PDT)
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
X-Inumbo-ID: 2548ad0f-1124-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687455743; x=1690047743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkkmq00OFGsE60gXctG98JB3mmGeBi1VSc4bej5kz7o=;
        b=SYIU4owM3SR9BFkuXcklRuHcM6yy0X53esCPYKr5HN2sBBpYcKdbuOcEC4kApl3KIu
         O1XmCAz9gIs4K1bero5qKLgEaPK3nQeM82lclM1VZU4+Ta0akWAt7uNu9maq5YDJA/4x
         ij3+GOMrPq5X9qidTCr2idNfQyzBPnluGVCpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687455743; x=1690047743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkkmq00OFGsE60gXctG98JB3mmGeBi1VSc4bej5kz7o=;
        b=BN8oQraax3OPdpkkMlODV7PFRo0enXamx6FVpqo5koPe0TzK/tnAtoyNZBPAfzRE1N
         w8OPZm3s2Pc37tqDV2+XX7YtYmB334Ge9omWEXB1bSErpp2evwgtPRonJDWYgNp3VU0M
         vOKdRV8NzRghS3OLQV64iWZjCKAATQ5uV6QTNmeUJ/66vAbjEH/TG1ZFNJxox+S1uXYw
         XvQkF50OLyurNWOLnNj7boUHu2eGdnEzjJTqt7k8VQ7FKHuwFgGbHkmR3XwHdFGAp4pO
         x5/B6toNACCkJN9P0ObLJgXRPBWrgoDj4lhMjK8L5uKZrd0LAA5ayPASQNkPxUho5X9T
         e7Gw==
X-Gm-Message-State: AC+VfDyvMSRl9BzNP7kGX8wk7hsgiTqqoi9aTWyT2bnJdtuB8/9ri5vv
	jE5Vwoi0CfchhENjVuYe2o3ambk7/pKYdE+KDcQ=
X-Google-Smtp-Source: ACHHUZ7QnABFgORslLflbptc8JTw1xN8d3pEu14yhYK6EeBJJoY8AzfePjTB9WDlgfabv/EVrTrmIw==
X-Received: by 2002:a5d:570b:0:b0:309:53f3:6e3e with SMTP id a11-20020a5d570b000000b0030953f36e3emr11841512wrv.69.1687455743304;
        Thu, 22 Jun 2023 10:42:23 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 3/4] x86: Read MSR_ARCH_CAPS immediately after early_microcode_init()
Date: Thu, 22 Jun 2023 18:42:18 +0100
Message-Id: <20230622174219.8871-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
References: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move MSR_ARCH_CAPS read code from tsx_init() to early_cpu_init(). Because
microcode updates might make them that MSR to appear/have different values
we also must reload it after a microcode update in early_microcode_init().

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4:
  * Read MSR_ARCH_CAPS in early_cpu_init(). Otherwise tsx_init() doesn't
    have current values in the case where microcode wasn't updated (Jan)
---
 xen/arch/x86/cpu/common.c         |  5 +++++
 xen/arch/x86/cpu/microcode/core.c | 13 +++++++++++++
 xen/arch/x86/tsx.c                | 16 ++++------------
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index cfcdaace12..2f895e7c7c 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -352,6 +352,11 @@ void __init early_cpu_init(void)
 			    &c->x86_capability[FEATURESET_7c0],
 			    &c->x86_capability[FEATURESET_7d0]);
 
+		if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
+			rdmsr(MSR_ARCH_CAPABILITIES,
+			      c->x86_capability[FEATURESET_m10Al],
+			      c->x86_capability[FEATURESET_m10Ah]);
+
 		if (max_subleaf >= 1)
 			cpuid_count(7, 1, &eax, &ebx, &ecx,
 				    &c->x86_capability[FEATURESET_7d1]);
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index e67d143c97..dda6f03f7d 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -885,5 +885,18 @@ int __init early_microcode_init(unsigned long *module_map,
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
+    /*
+     * MSR_ARCH_CAPS may have appeared after the microcode update.
+     * Reload relevant fields in boot_cpu_data if so because they are
+     * needed in tsx_init().
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
index 80c6f4cedd..50d8059f23 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -39,9 +39,10 @@ void tsx_init(void)
     static bool __read_mostly once;
 
     /*
-     * This function is first called between microcode being loaded, and CPUID
-     * being scanned generally.  Read into boot_cpu_data.x86_capability[] for
-     * the cpu_has_* bits we care about using here.
+     * This function is first called between microcode being loaded, and
+     * CPUID being scanned generally. early_cpu_init() has already prepared
+     * the feature bits needed here. And early_microcode_init() has ensured
+     * they are not stale after the microcode update.
      */
     if ( unlikely(!once) )
     {
@@ -49,15 +50,6 @@ void tsx_init(void)
 
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


