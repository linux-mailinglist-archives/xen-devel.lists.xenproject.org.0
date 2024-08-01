Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5349448D5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 11:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769511.1180411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZSTo-0007Qu-No; Thu, 01 Aug 2024 09:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769511.1180411; Thu, 01 Aug 2024 09:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZSTo-0007Or-Kl; Thu, 01 Aug 2024 09:52:16 +0000
Received: by outflank-mailman (input) for mailman id 769511;
 Thu, 01 Aug 2024 09:52:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8r7L=PA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZSTm-0007Ok-Kj
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 09:52:14 +0000
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [2607:f8b0:4864:20::a34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9d38029-4feb-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 11:52:13 +0200 (CEST)
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-4ef33a09a3aso1903529e0c.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 02:52:13 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1f89bf270sm364034485a.92.2024.08.01.02.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 02:52:11 -0700 (PDT)
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
X-Inumbo-ID: b9d38029-4feb-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722505931; x=1723110731; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vv24Nkq+CALwNaNI0CiPnEvsAwhncXufp7Aqqd0cSX0=;
        b=SfP0VuEtms+JyyMj4rvFFrD9mX0MONyeercp2vj53uM6Ac2fRjv4P4C6DIC4pqyNtV
         1Xx+9JJs5r7L+wjdO87EguvQR6S/7YhyAOcfPjdGjDnCHaI+Hx0bRKNgzgEsu/7KmoWL
         xLOnlwNrLFugEoPYKCgOYEC0O3uF+338ptSsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722505931; x=1723110731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vv24Nkq+CALwNaNI0CiPnEvsAwhncXufp7Aqqd0cSX0=;
        b=qzPCw7Z88LOngrQksvlWyWbZWzaiACyohkN6BEPuxXE3NkHyiM290OioopTVrUKbQ9
         +R/iiKO8TlJeBieqPxFz6msfd7g5dQzC/bjfuV/KdSVuIUtn6+A+99doqEiXmG3une0v
         r9BEbwJjjR0bu/ZFylfWIki7DW0jpx1+ttTox2o7Zc+QWYo3go7nvV5EdCefza00Fpp2
         Q4n9hawSYhpZGfs0zO32vRrXBpJp/pUiFLCfOToDNt+igDtfSmPq+oeWgATi6glIO/1U
         oKs71sxuBLyc4kBM6sS4aFeSfhejdnXwzKQBfYehyFPOf6FjsJufDcSb1vG4Nm3NsQZn
         j5Yw==
X-Gm-Message-State: AOJu0YzWlRTS6qM7JBIqIsrLr9j9muqJ41mB1DYO55fdXVjkzFdSVv9v
	Ckd6SxO6t8uq5/r5e9kbjqZggYT6ue0WqLcqhbViz44M/8uDnxVqck+Xrj0WRWr0yG+c89nVDTg
	a
X-Google-Smtp-Source: AGHT+IHXI+mEjXXBuGLLrbcpkku3LlHnHtNWcXP1kh0pZb4qC5TXgctR+aeEYo0vztgtpegj0VLVvw==
X-Received: by 2002:a05:6102:1629:b0:48f:db56:f038 with SMTP id ada2fe7eead31-494506d279amr2427846137.7.1722505931423;
        Thu, 01 Aug 2024 02:52:11 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3] x86/dom0: delay setting SMAP after dom0 build is done
Date: Thu,  1 Aug 2024 11:52:01 +0200
Message-ID: <20240801095201.91180-1-roger.pau@citrix.com>
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
---
Changes since v2:
 - Change approach.
 - Add fixes tag.
---
 xen/arch/x86/setup.c | 46 ++++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eee20bb1753c..3f792a7a8f39 100644
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
 
@@ -1907,16 +1890,25 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     if ( cpu_has_smep && opt_smep != SMEP_HVM_ONLY )
         setup_force_cpu_cap(X86_FEATURE_XEN_SMEP);
     if ( boot_cpu_has(X86_FEATURE_XEN_SMEP) )
+    {
         set_in_cr4(X86_CR4_SMEP);
+        cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
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
@@ -2048,6 +2040,18 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
+        cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
+    }
+
     heap_init_late();
 
     init_trace_bufs();
-- 
2.45.2


