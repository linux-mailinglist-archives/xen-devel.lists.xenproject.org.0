Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939D945D09
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 13:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771006.1181589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZqE1-0007ZD-Ao; Fri, 02 Aug 2024 11:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771006.1181589; Fri, 02 Aug 2024 11:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZqE1-0007X2-7U; Fri, 02 Aug 2024 11:13:33 +0000
Received: by outflank-mailman (input) for mailman id 771006;
 Fri, 02 Aug 2024 11:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAnW=PB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZqE0-0007Ww-E9
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 11:13:32 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ff10ee1-50c0-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 13:13:31 +0200 (CEST)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6b7acf213a3so39772676d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 04:13:31 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c79b2aasm6010206d6.54.2024.08.02.04.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 04:13:28 -0700 (PDT)
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
X-Inumbo-ID: 3ff10ee1-50c0-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722597209; x=1723202009; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wu3re5EYOLVVxiZpi2T1eeKPM9el+p/H8hrjUeOaywU=;
        b=nDYwuFKGvpSX3IAc0tkKddW4IN/Xzaa84oX7nf3f2F0GjCKnLPxOCQ6Pd6qjVz6cOR
         JlwS9j6BMQHW3MzMAP65GwltMnj/mkKlnI3aiOZkCArm/G7qpM3mNrB3/Q8+T73uEva5
         cVcmfh9Lds5cTPEm9Ib+HayjCw9aexFCckTxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722597209; x=1723202009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wu3re5EYOLVVxiZpi2T1eeKPM9el+p/H8hrjUeOaywU=;
        b=CpxPZGvmYhkg4Hep2goXEzGzEJ6AILtGBZ/M3JVvAyxCQ7kjUrRIKVsy0h0hLbHoho
         fjkjfEJ/odMMCs8EC9mSqRW48uLNopPRofouhqKS7OpK55s91FRiUzA8pLlciT9/f+BC
         zkm6Z82nh2eraFG7ZuuCPMamAshq2gkgwJkp2m/EvxQm57pDwcuFC0yOKGQmcKUhZ5y3
         bSLe1nITZzTIQYLX8eUwEp2L3sb59rTJ0A4std3BNG2sqefBZermZ2NOVG9LlfG+1G8z
         54di+AgjqDtOI+Slc7TP9f5NiN5hC+ZnDu2SM8bb6ZZ1rUWTnIM3benYbXqBWkeizIBe
         PeRg==
X-Gm-Message-State: AOJu0Yx2YpbhVady/NK4mHvh0OcOxYPpoXswyJ4FybT4Q/C6OyD4R+c/
	cIZBa7URTJMSIFfyS2a6juSSlLzHf0dZeWZprpATLVNqSE773//ZVd2s0j+vm1y7pfiZAXJGTml
	I
X-Google-Smtp-Source: AGHT+IGGnws1a2RFzBi9opY3XhC8YzmES+GIQyL3u0H49d5ReFGS6J7wM1QJvA14FFQFtdhy0yH9kA==
X-Received: by 2002:a05:6214:3b83:b0:6b5:65bd:123b with SMTP id 6a1803df08f44-6bb98261be8mr42243386d6.0.1722597209159;
        Fri, 02 Aug 2024 04:13:29 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4] x86/dom0: delay setting SMAP after dom0 build is done
Date: Fri,  2 Aug 2024 13:12:44 +0200
Message-ID: <20240802111244.99340-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Delay setting X86_CR4_SMAP on the BSP until the domain building is done, so
that there's no need to disable SMAP.  Note however that SMAP is enabled for
the APs on bringup, as domain builder code strictly run on the BSP.  Delaying
the setting for the APs would mean having to do a callfunc IPI later in order
to set it on all the APs.

The fixes tag is to account for the wrong usage of cpu_has_smap in
create_dom0(), it should instead have used
boot_cpu_has(X86_FEATURE_XEN_SMAP).

While there also make cr4_pv32_mask __ro_after_init.

Fixes: 493ab190e5b1 ('xen/sm{e, a}p: allow disabling sm{e, a}p for Xen itself')
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Be more selective when setting cr4_pv32_mask.

Changes since v2:
 - Change approach.
 - Add fixes tag.
---
 xen/arch/x86/setup.c | 48 +++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eee20bb1753c..a7a85e94e3c8 100644
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
 
@@ -1907,16 +1890,26 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     if ( cpu_has_smep && opt_smep != SMEP_HVM_ONLY )
         setup_force_cpu_cap(X86_FEATURE_XEN_SMEP);
     if ( boot_cpu_has(X86_FEATURE_XEN_SMEP) )
+    {
         set_in_cr4(X86_CR4_SMEP);
+        BUILD_BUG_ON(!(X86_CR4_SMEP & XEN_CR4_PV32_BITS));
+        cr4_pv32_mask |= X86_CR4_SMEP;
+    }
 
     if ( !opt_smap )
         setup_clear_cpu_cap(X86_FEATURE_SMAP);
     if ( cpu_has_smap && opt_smap != SMAP_HVM_ONLY )
         setup_force_cpu_cap(X86_FEATURE_XEN_SMAP);
     if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
-        set_in_cr4(X86_CR4_SMAP);
-
-    cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
+        /*
+         * Set SMAP on the %cr4 mask so that it's set for APs on bringup, but
+         * don't set for the BSP until domain building is done.
+         *
+         * Don't set it in cr4_pv32_mask either, until it's also set on the
+         * BSP.  Otherwise the BUG in cr4_pv32_restore would trigger for events
+         * received on the BSP.
+         */
+        mmu_cr4_features |= X86_CR4_SMAP;
 
     if ( boot_cpu_has(X86_FEATURE_FSGSBASE) )
         set_in_cr4(X86_CR4_FSGSBASE);
@@ -2048,6 +2041,19 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
+    /*
+     * Enable SMAP only after being done with the domain building phase, as the
+     * PV builder switches to the domain page-tables and must be run with SMAP
+     * disabled.
+     */
+    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
+    {
+        ASSERT(mmu_cr4_features & X86_CR4_SMAP);
+        write_cr4(read_cr4() | X86_CR4_SMAP);
+        BUILD_BUG_ON(!(X86_CR4_SMAP & XEN_CR4_PV32_BITS));
+        cr4_pv32_mask |= X86_CR4_SMAP;
+    }
+
     heap_init_late();
 
     init_trace_bufs();
-- 
2.45.2


