Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8766941572
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 17:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767917.1178638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYomu-0000v6-W8; Tue, 30 Jul 2024 15:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767917.1178638; Tue, 30 Jul 2024 15:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYomu-0000tE-TX; Tue, 30 Jul 2024 15:29:20 +0000
Received: by outflank-mailman (input) for mailman id 767917;
 Tue, 30 Jul 2024 15:29:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/bP=O6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYomt-0000QI-L7
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 15:29:19 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bff84ab-4e88-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 17:29:18 +0200 (CEST)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-7a1d984ed52so268811985a.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 08:29:18 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d73f02c3sm648548585a.65.2024.07.30.08.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 08:29:16 -0700 (PDT)
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
X-Inumbo-ID: 7bff84ab-4e88-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722353356; x=1722958156; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtQmftLEOdtLH2V6E+Hq3v1vIUbIDceo54pfaSIr49o=;
        b=F2Gti1weZ1dUrZZnD0PqFzeO1jWTtgE70w20IRZe5Me5+jxVWruvukd8qF30xJPC13
         JqP2UeV1EWWRdVuMv3f7yjzz9uz4/5OH6aT/7YuwclyNXd1AR51wSDtWbl7xrskb837V
         QWn+dqtwfS8yMvhzxFYcaLWEVG7+G9VndPl2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722353356; x=1722958156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtQmftLEOdtLH2V6E+Hq3v1vIUbIDceo54pfaSIr49o=;
        b=Re2YMzHBMdJwPmCcmXiRtB/jHQJAc9p+DwdTZ6Px2AVZwaYRtc9a5o0UUpiJZjQkkH
         I17F1x+3409Fm7eHFxUF3Mwj37+QB0fMKznT32TyhJnBEn+5E4QdnSwg3Ar97JV2VOSl
         gPmSD1bwLbEc0+YgElI0+6xF79+VT+HlJemhQsk7wc9Fv2RBoSC1w2t0jbm2NI081H2M
         HZNArrC2cSFSKLREJOfnENlJ66b3g0ms+9pJePxN83GyJ8AolbbFD3JxmBG5iTTgRCKO
         aDb2k+uuQpvb/Tt46O5ScyhP3DWfitZBFFGcJwhN5FsM9bD/qu5egQJzJXknxwI99eSs
         tKZg==
X-Gm-Message-State: AOJu0YxOl9iqlb4Zt+Rj0KT0hD82L4yiJmjN83CIqhOkJe9JeJFShxyT
	6Ybenx3KfH+FJt1U8+e3FyG1cnSolioB9J2JKhpUme8MyMG+0s0UtXPe1B8/f9Sto2buJqDumg9
	H
X-Google-Smtp-Source: AGHT+IF1vhiX0bHt0QDKWOTu8thL174Hy1f8FI3H1gtt+C+j2KvGTzfJI0H2UL7f50u/sWUuLCuM3Q==
X-Received: by 2002:a05:620a:17a0:b0:79f:8a7:eb87 with SMTP id af79cd13be357-7a1e526c191mr1098115585a.42.1722353356332;
        Tue, 30 Jul 2024 08:29:16 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/2] x86/dom0: only disable SMAP for the PV dom0 build
Date: Tue, 30 Jul 2024 17:28:55 +0200
Message-ID: <20240730152855.48745-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730152855.48745-1-roger.pau@citrix.com>
References: <20240730152855.48745-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PVH dom0 builder doesn't switch page tables and has no need to run with
SMAP disabled.

Use stac() and clac(), as that's safe to use even if events would hit in the
middle of the region with SMAP disabled.  Nesting stac() and clac() calls is
not safe, so the stac() call is done strictly after elf_load_binary() because
that uses raw_{copy_to,clear}_guest() accessors which toggle SMAP.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/dom0_build.c | 13 +++++++++++++
 xen/arch/x86/setup.c         | 17 -----------------
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 57e58a02e707..ad804579cb6f 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -830,6 +830,15 @@ int __init dom0_construct_pv(struct domain *d,
         printk("Failed to load the kernel binary\n");
         goto out;
     }
+
+    /*
+     * Disable SMAP to allow user-accesses when running on dom0 page-tables.
+     * Note this must be done after elf_load_binary(), as such helper uses
+     * raw_{copy_to,clear}_guest() helpers which internally call stac()/clac()
+     * and those calls would otherwise nest with the ones here.
+     */
+    stac();
+
     bootstrap_map(NULL);
 
     if ( UNSET_ADDR != parms.virt_hypercall )
@@ -837,6 +846,7 @@ int __init dom0_construct_pv(struct domain *d,
         if ( (parms.virt_hypercall < v_start) ||
              (parms.virt_hypercall >= v_end) )
         {
+            clac();
             mapcache_override_current(NULL);
             switch_cr3_cr4(current->arch.cr3, read_cr4());
             printk("Invalid HYPERCALL_PAGE field in ELF notes.\n");
@@ -978,6 +988,9 @@ int __init dom0_construct_pv(struct domain *d,
                                     : XLAT_start_info_console_dom0);
 #endif
 
+    /* Possibly re-enable SMAP. */
+    clac();
+
     /* Return to idle domain's page tables. */
     mapcache_override_current(NULL);
     switch_cr3_cr4(current->arch.cr3, read_cr4());
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eee20bb1753c..bc387d96b519 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
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
2.45.2


