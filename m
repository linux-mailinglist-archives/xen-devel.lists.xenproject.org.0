Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AB9966BA4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786761.1196544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bW-0003tf-V7; Fri, 30 Aug 2024 21:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786761.1196544; Fri, 30 Aug 2024 21:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bW-0003ky-Pc; Fri, 30 Aug 2024 21:56:26 +0000
Received: by outflank-mailman (input) for mailman id 786761;
 Fri, 30 Aug 2024 21:56:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9XN-0000Zf-48
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:52:09 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18fa953c-671a-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:52:07 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054497909399.3572608288832;
 Fri, 30 Aug 2024 14:48:17 -0700 (PDT)
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
X-Inumbo-ID: 18fa953c-671a-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054499; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m7eOzt8e/yus21ggPibpZzLMVSol6XKNBAqGEyVU1ABNF0K5G9G4lBcnEogjFP14uw0yjxqrzoIihXX0KCh6ANS/wdwQN+2myufcSVASeuwdDTYzFGRN9WsNYSGLgC25XXSKOGFbxMjSuXFkIlvvc+PNCQfu+Cg1Ig4HNWiRubc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054499; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ngbbLEQwLIwlBq1EHKDN2ggSsuXtMR1Wvlwl95KPSyQ=; 
	b=XKV/qK1n4YfpLRcHQzZYUkTt5NaWQZcBqEzuZuKQ6WVZOI/c1C2xDrbZRFFa+tga0jnKwSLlDcobePPXggqY0UwWFh2J6swvAeJqQORz7Eb2P87c3qpVphDOAJIf70ZhI50vtibv0N9i8OvurNTc8755ui8oVJiu6X5dr3DNkD8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054499;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ngbbLEQwLIwlBq1EHKDN2ggSsuXtMR1Wvlwl95KPSyQ=;
	b=NfDR64LYuwiTPYpAKJN0PClsPjMmpP07k/DIX03CUM/rZHxpk4WobGSqVAmK/dxI
	U2TruI3vHDcvGmlGo10h0lFlqe2CCb6LlpjAkEEtdPxCLyylnl8qXOiTspmMQ+ZNIrc
	wfA0C1dpD98odlW4In2Xbod84kEq+SdPk/VwdWUo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 35/44] x86/boot: remove usage of mod_end by discard_initial_images
Date: Fri, 30 Aug 2024 17:47:20 -0400
Message-Id: <20240830214730.1621-36-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This eliminates usage of early_mod by discard_initial_images

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/pv/dom0_build.c | 2 +-
 xen/arch/x86/setup.c         | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index dce62d76e41e..a403e23b2f93 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -641,7 +641,7 @@ int __init dom0_construct_pv(struct domain *d,
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
         }
-        initrd->size = initrd->early_mod->mod_end = 0;
+        initrd->size = 0;
 
         iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
                            PFN_UP(initrd_len), &flush_flags);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 977b68098694..81610405a53c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -353,12 +353,10 @@ void __init discard_initial_images(void)
 
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-        uint64_t start =
-            (uint64_t)boot_info->mods[i].early_mod->mod_start << PAGE_SHIFT;
+        uint64_t start = boot_info->mods[i].start;
 
         init_domheap_pages(start,
-                           start +
-                           PAGE_ALIGN(boot_info->mods[i].early_mod->mod_end));
+                           start + PAGE_ALIGN(boot_info->mods[i].size));
     }
 
     boot_info->nr_mods = 0;
-- 
2.30.2


