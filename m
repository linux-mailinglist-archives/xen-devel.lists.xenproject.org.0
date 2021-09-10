Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268A34070D5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 20:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184709.333428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOl7b-0003TY-Nu; Fri, 10 Sep 2021 18:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184709.333428; Fri, 10 Sep 2021 18:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOl7b-0003Qh-Kh; Fri, 10 Sep 2021 18:19:31 +0000
Received: by outflank-mailman (input) for mailman id 184709;
 Fri, 10 Sep 2021 18:19:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ConJ=OA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mOl7a-0003AT-Vv
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 18:19:31 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a408877b-c702-4904-a009-8007a6c3139b;
 Fri, 10 Sep 2021 18:19:25 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id t19so5738077lfe.13
 for <xen-devel@lists.xenproject.org>; Fri, 10 Sep 2021 11:19:25 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a7sm625045lfi.15.2021.09.10.11.19.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Sep 2021 11:19:24 -0700 (PDT)
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
X-Inumbo-ID: a408877b-c702-4904-a009-8007a6c3139b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Pi6yuMUH/Hje2P5MmRyjScNmoovfYd7eFi3wUXINX8Y=;
        b=JyXhznYvxdb0bvxR3UsrKgnKsipi87KCT1G6tVcKV02z0YOthdqcv3HpPjSOuUnEJ7
         h861M2f6pupojWC4neHnTfdHkXJK3Afm/m4NHlW25yD7bg1X6m5gl6mJfzS9Z5LdPdpz
         G3gF06YS+2QzNmvH37P6ZUxt2GDpXN3KrATRRkGhI4rUUbWLkrlDAVdCb4oW1EBZTbvo
         YOBCePVzygHtTfzrn6USJJ5ZogaLeG+nOQdvzotaSwMm/Nd9THm6PrVxRcQ407EJNiBO
         RaWVGHqLUV8AOJha3ij2fChrDqAtZpC1PLV5bT5ewLYepus1Ku1NbFBYAWUg5YVTI6wE
         jzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Pi6yuMUH/Hje2P5MmRyjScNmoovfYd7eFi3wUXINX8Y=;
        b=XG+n3NJ//tePK0nQ9Vm0gkZD50quHIjYOjGLh/P3BlOUQSYrO6FNcNKOtazO6pG36x
         sHr8YcYcw3z7CMcxMoq6KueHMbRaG8BKGC8SwMzx1rgETa5gd/aSlQsGSELWnT4D/+ls
         H4d493RPVIMEmMeldfILT2++xvOSxwRp9kps47+47mcERF0g+maJJwRMnbTLJJdPR4Wk
         aRMoCJlrrXwqU02ErZyXDjW4dZKU6o2I+cJ6rc8Jbpi02HfyM2huyqjucMStv6LhQvO8
         3EQtKoeoA8Cm0VbRAmYPgw5rVl5msZ848oDzUXXmJL0O/SmG2HKJPa/1g/Wk0yDpXMKJ
         i9+A==
X-Gm-Message-State: AOAM533Ncr4//lIW/sCJYsj2Fp4fNstH/4tWgIrxDJLa0KEE9AEqwFLj
	s67jGAO95ywcFJ/EdfIVhHRseyRnzYg=
X-Google-Smtp-Source: ABdhPJzNQCIIRu+uqLkS0O2ZDBsx9oexcKKbmKXJ78NwnvHvyco3jTOxEc+D9ChSiOnM07fIgLxwwQ==
X-Received: by 2002:a19:c753:: with SMTP id x80mr1170968lff.267.1631297964434;
        Fri, 10 Sep 2021 11:19:24 -0700 (PDT)
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
	Henry Wang <Henry.Wang@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: [PATCH V2 1/3] xen: Introduce "gpaddr_bits" field to XEN_SYSCTL_physinfo
Date: Fri, 10 Sep 2021 21:18:42 +0300
Message-Id: <1631297924-8658-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>

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
Please note, that recent review comments [1] haven't been addressed yet.
It is not forgotten, some clarification is needed. It will be addressed for the next version.

[1] https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/

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


