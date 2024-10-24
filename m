Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E319AEB5F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 18:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825473.1239699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t40JR-0002Ij-Rf; Thu, 24 Oct 2024 16:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825473.1239699; Thu, 24 Oct 2024 16:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t40JR-0002H7-Og; Thu, 24 Oct 2024 16:03:49 +0000
Received: by outflank-mailman (input) for mailman id 825473;
 Thu, 24 Oct 2024 16:03:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t40JQ-0002H1-I9
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 16:03:48 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ca395d4-9221-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 18:03:46 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c948c41edeso1262634a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 09:03:46 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b556sm5798272a12.63.2024.10.24.09.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 09:03:43 -0700 (PDT)
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
X-Inumbo-ID: 8ca395d4-9221-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729785825; x=1730390625; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuxl7jxCk5QM8CKCwRksMZpOaH7+YC5gUlRNgdUxg10=;
        b=goiecl08eEjVOCCWMQpPXfLAXN88RagxW8JDTRdUGisvZHi3qu6Lq38y3JrZyOJQbN
         cKObCGsMNrSmdAdasaZFhjjObcMBGZU4iA+NtckvLXsp04lr2yE+sdixryAFX712EKrI
         KymOmNtPotYacQ5x2AIgc/PIjJ83Ix18T7Mws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729785825; x=1730390625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuxl7jxCk5QM8CKCwRksMZpOaH7+YC5gUlRNgdUxg10=;
        b=I+tyA+Eu66Xt2QWypHarDkWTXu5XdnFG+PcB3CDKyLr/D25vL18vKPbH111CNfIH2j
         3OPppLytYLY4ii9BwiExexrob5cvQ4hj5R2eorB0HGXGBQvjzpljl2Ur4hglsFWUHXVp
         1WirMRF/jK6l1+WTv+uci2rSyfCJRlJhHtbQdY7ZWEGmrBKLKJPrVbBQ6ygFOBi+kU0S
         h39uTKTHFVVycl3E+X19qsuoMaSgseG0LAuT9MSieyIzc9hH8+SlGTfdiD0BUH6J4l5/
         peiwUBOd3PpHGQMlxwxPifRESDItsWxz/NVweJQUHj4fXwHTNc1Gx2N2JZDVGGePdT+c
         aUOg==
X-Gm-Message-State: AOJu0YxzcQCqOIPCCkvIgOMmtETCklnylgJrleBeUjdeUbfnW5GVqgNh
	VMqkQ1XRJq7iAo5gMyk8NKYS6my1eo+JDoiiVw4yDhUBIkLRFNQ+TipaV57pBA+FAUDA5UP2ZR8
	c
X-Google-Smtp-Source: AGHT+IHCgF/nPE9D7yDs0f7pz8AQrQVLrHgM/Yne//sILKSy2RO44NSGqrrG19IS9W49sS9ETwqyNA==
X-Received: by 2002:a05:6402:5191:b0:5c9:5584:ddb8 with SMTP id 4fb4d7f45d1cf-5cb8ac6e363mr5620883a12.12.1729785823836;
        Thu, 24 Oct 2024 09:03:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH v2] x86/boot: Explain how discard_initial_images() works
Date: Thu, 24 Oct 2024 17:03:40 +0100
Message-Id: <20241024160340.1012474-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

discard_initial_images() only works because init_domheap_pages() with ps==pe
is a no-op.

In dom0_construct(), explaining the significance of setting the initrd length
to 0, and put an explicit check in discard_initial_images().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel Smith <dpsmith@apertussolutions.com>

v2:
 * Strip down to just the explanation, and merge into HL series.
---
 xen/arch/x86/pv/dom0_build.c |  9 +++++++++
 xen/arch/x86/setup.c         | 13 ++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index cdae17b27654..cc882bee61c3 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -641,6 +641,15 @@ static int __init dom0_construct(struct domain *d,
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
         }
+
+        /*
+         * We have either:
+         * - Mapped the initrd directly into dom0, or
+         * - Copied it and freed the module.
+         *
+         * Either way, tell discard_initial_images() to not free it a second
+         * time.
+         */
         initrd->mod_end = 0;
 
         iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 511cf5b97909..177f4024abca 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -340,7 +340,7 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
     return nr;
 }
 
-void __init discard_initial_images(void)
+void __init discard_initial_images(void) /* a.k.a. Free boot modules */
 {
     struct boot_info *bi = &xen_boot_info;
     unsigned int i;
@@ -348,9 +348,16 @@ void __init discard_initial_images(void)
     for ( i = 0; i < bi->nr_modules; ++i )
     {
         uint64_t start = pfn_to_paddr(bi->mods[i].mod->mod_start);
+        uint64_t size  = bi->mods[i].mod->mod_end;
 
-        init_domheap_pages(start,
-                           start + PAGE_ALIGN(bi->mods[i].mod->mod_end));
+        /*
+         * Sometimes the initrd is mapped, rather than copied, into dom0.
+         * Size being 0 is how we're instructed to leave the module alone.
+         */
+        if ( size == 0 )
+            continue;
+
+        init_domheap_pages(start, start + PAGE_ALIGN(size));
     }
 
     bi->nr_modules = 0;
-- 
2.39.5


