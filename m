Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A7C871EAB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 13:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688771.1073352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhTdt-00086R-4N; Tue, 05 Mar 2024 12:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688771.1073352; Tue, 05 Mar 2024 12:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhTdt-00084F-1Q; Tue, 05 Mar 2024 12:11:33 +0000
Received: by outflank-mailman (input) for mailman id 688771;
 Tue, 05 Mar 2024 12:11:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mb5t=KL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhTdr-0007LZ-06
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 12:11:31 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f3db319-dae9-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 13:11:29 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a456ab934eeso256224266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 04:11:29 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gg4-20020a170906e28400b00a45b1194dacsm11429ejb.126.2024.03.05.04.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:11:26 -0800 (PST)
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
X-Inumbo-ID: 7f3db319-dae9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709640688; x=1710245488; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWpJEehPtMQOOKNL57tqrOWjao0ovLuzVCpvgDqElsg=;
        b=EITX2FJVa2gnDq/9ajeQv79PjPFUeL4L0KCgcKQkGPZeF6nL3CJs/fd0twmNI8WO/o
         Q89YpwUN+0j3GbwOTE+1CNBzn8RJursVj50gSR/ckv0V9XQZhirLCHldrSIHtibs+Uqy
         2zM+QP3PghllzrNu0JJpbkqJWzbeWjQsDZQVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640688; x=1710245488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWpJEehPtMQOOKNL57tqrOWjao0ovLuzVCpvgDqElsg=;
        b=Ggk6bNaoRX2jl+A5wmF0qcs2eerD/MhNCyCeQziRiQLEz9ws410Z0RxvRHdLibLAhZ
         KVWu5AlnsdByejCXi0jW1PD3jH9A73eP2SBtXd3ZePuOt2sU36SlBeO90M6JqTSsqMRf
         J9F4M75pXwwjX8VccstAhpJV18TVB4TItYUs3RCgq69ky+OE2cvwwX5ykMQ6SjmHYxY5
         FR44ZfTPBNBbCKpOo218BChNh2D75ZxJ78CAIZiet6YiFztghlYkDK05Uwq3rl+biJEb
         y4B0ELwodTSgyG53Woe9aT48wWQviBBJp7LUMhvBCSxKUti/EGYUQDNvkXCEEghIuoSE
         7bxA==
X-Gm-Message-State: AOJu0Yw1KuKw0JNX9a1fDocWo/wLKmZYqZVCUQavX42pKzpzTb3b9bvt
	Gvzu7EnGuBCn2y4zGR7bBCKrPgxIXWZo4mMcEPhkmkcFK3GqXdcJk8ehWsZ1B6XUjHmAaNaOxq+
	i
X-Google-Smtp-Source: AGHT+IGZeAV7JmDHAFpT5RByDKtjLsj2hMKVaMz3gNdeOh4RUIz2opvOrxF9jr5pTaYTgsS3wc4Zdg==
X-Received: by 2002:a17:906:6bd7:b0:a45:aefb:2145 with SMTP id t23-20020a1709066bd700b00a45aefb2145mr322620ejs.29.1709640687910;
        Tue, 05 Mar 2024 04:11:27 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/livepatch: Relax permissions on rodata too
Date: Tue,  5 Mar 2024 12:11:21 +0000
Message-Id: <20240305121121.3527944-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reinstates the capability to patch .rodata in load/unload hooks, which
was lost when we stopped using CR0.WP=0 to patch.

This turns out to be rather less of a large TODO than I thought at the time.

Fixes: 8676092a0f16 ("x86/livepatch: Fix livepatch application when CET is active")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/livepatch.c    |  4 ++--
 xen/common/virtual_region.c | 12 ++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index ee539f001b73..4f76127e1f77 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -62,7 +62,7 @@ int arch_livepatch_safety_check(void)
 int noinline arch_livepatch_quiesce(void)
 {
     /*
-     * Relax perms on .text to be RWX, so we can modify them.
+     * Relax perms on .text/.rodata, so we can modify them.
      *
      * This relaxes perms globally, but all other CPUs are waiting on us.
      */
@@ -75,7 +75,7 @@ int noinline arch_livepatch_quiesce(void)
 void noinline arch_livepatch_revive(void)
 {
     /*
-     * Reinstate perms on .text to be RX.  This also cleans out the dirty
+     * Reinstate perms on .text/.rodata.  This also cleans out the dirty
      * bits, which matters when CET Shstk is active.
      *
      * The other CPUs waiting for us could in principle have re-walked while
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index d2efe9e11492..f45812483b8e 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -91,9 +91,15 @@ void relax_virtual_region_perms(void)
 
     rcu_read_lock(&rcu_virtual_region_lock);
     list_for_each_entry_rcu( region, &virtual_region_list, list )
+    {
         modify_xen_mappings_lite((unsigned long)region->text_start,
                                  PAGE_ALIGN((unsigned long)region->text_end),
                                  PAGE_HYPERVISOR_RWX);
+        if ( region->rodata_start )
+            modify_xen_mappings_lite((unsigned long)region->rodata_start,
+                                     ROUNDUP((unsigned long)region->rodata_end, PAGE_SIZE),
+                                     PAGE_HYPERVISOR_RW);
+    }
     rcu_read_unlock(&rcu_virtual_region_lock);
 }
 
@@ -103,9 +109,15 @@ void tighten_virtual_region_perms(void)
 
     rcu_read_lock(&rcu_virtual_region_lock);
     list_for_each_entry_rcu( region, &virtual_region_list, list )
+    {
         modify_xen_mappings_lite((unsigned long)region->text_start,
                                  PAGE_ALIGN((unsigned long)region->text_end),
                                  PAGE_HYPERVISOR_RX);
+        if ( region->rodata_start )
+            modify_xen_mappings_lite((unsigned long)region->rodata_start,
+                                     ROUNDUP((unsigned long)region->rodata_end, PAGE_SIZE),
+                                     PAGE_HYPERVISOR_RO);
+    }
     rcu_read_unlock(&rcu_virtual_region_lock);
 }
 #endif /* CONFIG_X86 */
-- 
2.30.2


