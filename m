Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E348402D7E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 19:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181247.328330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNebh-00033t-IT; Tue, 07 Sep 2021 17:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181247.328330; Tue, 07 Sep 2021 17:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNebh-000303-Ej; Tue, 07 Sep 2021 17:10:01 +0000
Received: by outflank-mailman (input) for mailman id 181247;
 Tue, 07 Sep 2021 17:10:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjNB=N5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mNebg-0002hx-3O
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 17:10:00 +0000
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28928d9d-15b1-49c5-85cf-f083d39f0e82;
 Tue, 07 Sep 2021 17:09:55 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id s3so17675394ljp.11
 for <xen-devel@lists.xenproject.org>; Tue, 07 Sep 2021 10:09:54 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t20sm1059533lfk.157.2021.09.07.10.09.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Sep 2021 10:09:53 -0700 (PDT)
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
X-Inumbo-ID: 28928d9d-15b1-49c5-85cf-f083d39f0e82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r8OO/kJJTJV6IKHPTsMlElMm0wsP5l7Pgo7wl/ZjD8Y=;
        b=ZXLY3dMPIAwjgvH2Nnqi9I0Lo/ZLY6Y58wMChCZhiAaXZnfyvFIw3Zp5oguMdqXR5D
         RhQLqzfXzZY1vYvMF0pW/JIWOfp0OYQOsERKgVZklfd3uG+wX4bz7zi2Sdt+Y8Yx6dAV
         xAkZDRo1lpVEsdFrUnsb4JeQbNOh3ZtltvmfRHxWfEVR3T1Gcz6Kt7FtOWKeq0z3T8gr
         wd5vtKsCokgIvlg962mBNgh4lNnbCnOM3c0Xoww1pCfvOEuZELf7U4JUsLWZcyxd2/yt
         6EEUpcJ+D1W892JPHWkj/hvIF5eO2DpNx11fMEttxneRNOsS/848n41kgnIJjy8Mhks2
         pbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r8OO/kJJTJV6IKHPTsMlElMm0wsP5l7Pgo7wl/ZjD8Y=;
        b=YDgO4Jfbq++Y6z8hs61UA6PJ+5WsqFbiv4qQSNxeiMHuu4N9jA3LKW4ozqxscVRLjt
         l/deBhZ8gZQPdCN9jkV1PWeCAXI0BAIIaDWLWBg7nLCNHTGvL9eg5IXzFw6RF/QZqp1q
         QkFDfwioL+kGQjLDZZDtTzyBpHk9eIXKWBqGr7ro0PEMz1tKljfv++HJxNRhOBH6VoDy
         n4McCzT9BxYhnYa2pxUVbvqm6farpZICMxLCk2HFXV1Db/tOHpqLfMhkUT03KrEtZsgc
         8VG5t5qhp3JKxEwFy0/I686eGrJJhU+sWJz63mkYzt67abUgWwkylQ6TjETugBU1pkKh
         xGyA==
X-Gm-Message-State: AOAM532e2eUfa8F+TiulsfNUznec7D/pWJGFh/VT16//PuQT9mLLhGqh
	NFCuH3HkQvE1+Op6BTimVw0vemd8vZ8=
X-Google-Smtp-Source: ABdhPJxC8qf79t1ZIF2AN8Zknfh5cN0xbkLmLI52Ll/jKPS4wGQHEL3CESZZSeVt5iwva25PNfeEqQ==
X-Received: by 2002:a05:651c:893:: with SMTP id d19mr8632562ljq.268.1631034593860;
        Tue, 07 Sep 2021 10:09:53 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [RFC PATCH 1/3] xen: Introduce "gpaddr_bits" field to XEN_SYSCTL_physinfo
Date: Tue,  7 Sep 2021 20:09:36 +0300
Message-Id: <1631034578-12598-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631034578-12598-1-git-send-email-olekstysh@gmail.com>
References: <1631034578-12598-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

We need to pass info about maximum supported guest address
space size to the toolstack on Arm in order to properly
calculate the base and size of the extended region (safe range)
for the guest. The extended region is unused address space which
could be safely used by domain for foreign/grant mappings on Arm.
The extended region itself will be handled by the subsequents
patch.

Use p2m_ipa_bits variable on Arm, the x86 equivalent is
hap_paddr_bits.

As we change the size of structure bump the interface version.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes since RFC:
   - update patch subject/description
   - replace arch-specific sub-struct with common gpaddr_bits
     field and update code to reflect that
---
 tools/include/libxl.h            | 7 +++++++
 tools/libs/light/libxl.c         | 2 ++
 tools/libs/light/libxl_types.idl | 2 ++
 xen/arch/arm/sysctl.c            | 2 ++
 xen/arch/x86/sysctl.c            | 2 ++
 xen/include/public/sysctl.h      | 3 ++-
 6 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d..da44944 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -855,6 +855,13 @@ typedef struct libxl__ctx libxl_ctx;
  */
 #define LIBXL_HAVE_PHYSINFO_MAX_POSSIBLE_MFN 1
 
+ /*
+  * LIBXL_HAVE_PHYSINFO_GPADDR_BITS
+  *
+  * If this is defined, libxl_physinfo has a "gpaddr_bits" field.
+  */
+ #define LIBXL_HAVE_PHYSINFO_GPADDR_BITS 1
+
 /*
  * LIBXL_HAVE_DOMINFO_OUTSTANDING_MEMKB 1
  *
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 204eb0b..c86624f 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -405,6 +405,8 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
     physinfo->cap_vmtrace =
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_vmtrace);
 
+    physinfo->gpaddr_bits = xcphysinfo.gpaddr_bits;
+
     GC_FREE;
     return 0;
 }
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 3f9fff6..f7437e4 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1061,6 +1061,8 @@ libxl_physinfo = Struct("physinfo", [
     ("cap_shadow", bool),
     ("cap_iommu_hap_pt_share", bool),
     ("cap_vmtrace", bool),
+
+    ("gpaddr_bits", uint32),
     ], dir=DIR_OUT)
 
 libxl_connectorinfo = Struct("connectorinfo", [
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index f87944e..91dca4f 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,6 +15,8 @@
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
+
+    pi->gpaddr_bits = p2m_ipa_bits;
 }
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index aff52a1..7b14865 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -135,6 +135,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
+
+    pi->gpaddr_bits = hap_paddr_bits;
 }
 
 long arch_do_sysctl(
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 039ccf8..f53b42e 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -35,7 +35,7 @@
 #include "domctl.h"
 #include "physdev.h"
 
-#define XEN_SYSCTL_INTERFACE_VERSION 0x00000013
+#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
 
 /*
  * Read console content from Xen buffer ring.
@@ -120,6 +120,7 @@ struct xen_sysctl_physinfo {
     uint64_aligned_t outstanding_pages;
     uint64_aligned_t max_mfn; /* Largest possible MFN on this host */
     uint32_t hw_cap[8];
+    uint32_t gpaddr_bits;
 };
 
 /*
-- 
2.7.4


