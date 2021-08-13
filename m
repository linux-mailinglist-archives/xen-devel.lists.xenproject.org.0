Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF73EBEC3
	for <lists+xen-devel@lfdr.de>; Sat, 14 Aug 2021 01:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166934.304721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEgbj-0001ez-8s; Fri, 13 Aug 2021 23:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166934.304721; Fri, 13 Aug 2021 23:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEgbj-0001br-5K; Fri, 13 Aug 2021 23:28:59 +0000
Received: by outflank-mailman (input) for mailman id 166934;
 Fri, 13 Aug 2021 23:28:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Iem=NE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mEgbh-0001bl-0t
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 23:28:57 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 128c0fae-e929-4917-adeb-e41488eda545;
 Fri, 13 Aug 2021 23:28:55 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id m17so14200682ljp.7
 for <xen-devel@lists.xenproject.org>; Fri, 13 Aug 2021 16:28:55 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o10sm272915lfl.129.2021.08.13.16.28.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Aug 2021 16:28:53 -0700 (PDT)
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
X-Inumbo-ID: 128c0fae-e929-4917-adeb-e41488eda545
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IzbPSa3YJJJXFN8JtH2LLjIoe7AguUHWgJC9L1kFdHw=;
        b=gJuI/2v0hop2Hjw7c7d/WPe8lwO0vgn4bTACwms2J+XkTtZHRh7RKI8xFnSuASH34M
         y/xsdPDyC5QGK6ObH/nEBaJTGXL9AK6YdV6xce641j624tsOObcg/UdfX7OxERKt4Z5F
         blSUAR/0NGy+P9Ebsyj3oMDX/dgW2heHeu4ROXKIEYszp+tPVX+TWwAIPxjwBBScdjgh
         NPEVWS/+9JBsOzIn8gKKF72Ytp8MoVjx6GRw6XLRW3j0AzTPHVLhX0bI7jDMQFCrVWvc
         f4B8giIcGah0UGgqfbS3SsBDEUanSq4RkXxY28/l2TxSfvi7F8gsZkAFBL2vZPxfhToc
         Xpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IzbPSa3YJJJXFN8JtH2LLjIoe7AguUHWgJC9L1kFdHw=;
        b=CAGn9BHtZPguf/V5UiIKGTWklAzJGmklMmxPE8ZTmKbmPhYJ5asFA6WvBais058851
         f03yv1/7cVGiTV3IpzpcV8YdqEogRY453Oy/dz4dNBUCjOSG4fh+tdEZzJjWG6zgaV5c
         OEVpfsxBOvh8L/EvCKn0LxLSS9tDZf2xP+7WnuRO3hIhVaeoy5UQrqniwdhULRNA/YZ7
         g4/jceh5EzLcMBkniRh3gF/FQPw8IJvdB7cYMU+Mt7R8q7HET5MkFS+iexXFi+3tf10C
         qjabb3DgGgIU4CopUtKiEJtHqdMYbHKGU6EBipM5R6lBawOYbtH+acbBe9K+/Dg68arY
         MtFA==
X-Gm-Message-State: AOAM532AESDGka//jT2vPDxcmlVZAdZpyUNhbDQiMAztcyUFxWFRjAJe
	u5H4HpmYvS40WVKzWfHpbeqE6L+ZDbE=
X-Google-Smtp-Source: ABdhPJwoNbfRzlJZI1FIT5kDT+z8XUWxTgf3Y5iUj2HZWkf4/M+gnWpmEmZ+k6nuMIxpWfjhNrurtg==
X-Received: by 2002:a05:651c:1184:: with SMTP id w4mr3487382ljo.126.1628897333935;
        Fri, 13 Aug 2021 16:28:53 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH] xen: Introduce arch specific field to XEN_SYSCTL_physinfo
Date: Sat, 14 Aug 2021 02:28:24 +0300
Message-Id: <1628897304-20793-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

We need to pass info about maximum supported address space size
to the toolstack on Arm in order to properly calculate the base
and size of the safe range for the guest. Use p2m_ipa_bits variable
which purpose is to hold the bit size of IPAs in P2M tables.

As we change the size of structure bump the interface version.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
You can find the discussion at:
https://lore.kernel.org/xen-devel/cb1c8fd4-a4c5-c18e-c8db-f8e317d95526@xen.org/

Another possible option could be to introduce new Arm specific SYSCTL
to pass such info. But, it was initially decided to not expand the SYSCTL
range and reuse existing which context would fit.
---
 tools/include/libxl.h             | 7 +++++++
 tools/libs/light/libxl.c          | 3 +++
 tools/libs/light/libxl_arch.h     | 5 +++++
 tools/libs/light/libxl_arm.c      | 7 +++++++
 tools/libs/light/libxl_types.idl  | 5 +++++
 tools/libs/light/libxl_x86.c      | 6 ++++++
 xen/arch/arm/sysctl.c             | 1 +
 xen/include/public/arch-arm.h     | 5 +++++
 xen/include/public/arch-x86/xen.h | 2 ++
 xen/include/public/sysctl.h       | 3 ++-
 10 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d..fabd7fb 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -855,6 +855,13 @@ typedef struct libxl__ctx libxl_ctx;
  */
 #define LIBXL_HAVE_PHYSINFO_MAX_POSSIBLE_MFN 1
 
+ /*
+  * LIBXL_HAVE_PHYSINFO_ARCH
+  *
+  * If this is defined, libxl_physinfo has a "arch" field.
+  */
+ #define LIBXL_HAVE_PHYSINFO_ARCH 1
+
 /*
  * LIBXL_HAVE_DOMINFO_OUTSTANDING_MEMKB 1
  *
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 204eb0b..5387d50 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -15,6 +15,7 @@
 #include "libxl_osdeps.h"
 
 #include "libxl_internal.h"
+#include "libxl_arch.h"
 
 int libxl_ctx_alloc(libxl_ctx **pctx, int version,
                     unsigned flags, xentoollog_logger * lg)
@@ -405,6 +406,8 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
     physinfo->cap_vmtrace =
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_vmtrace);
 
+    libxl__arch_get_physinfo(gc, physinfo, &xcphysinfo);
+
     GC_FREE;
     return 0;
 }
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index 8527fc5..f3c6e75 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -90,6 +90,11 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
                                       libxl_domain_config *dst,
                                       const libxl_domain_config *src);
 
+_hidden
+void libxl__arch_get_physinfo(libxl__gc *gc,
+                              libxl_physinfo *to,
+                              xc_physinfo_t *from);
+
 #if defined(__i386__) || defined(__x86_64__)
 
 #define LAPIC_BASE_ADDRESS  0xfee00000
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e3140a6..7304e25 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1236,6 +1236,13 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
 {
 }
 
+void libxl__arch_get_physinfo(libxl__gc *gc,
+                              libxl_physinfo *to,
+                              xc_physinfo_t *from)
+{
+    to->arch_arm.p2m_ipa_bits = from->arch.p2m_ipa_bits;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 3f9fff6..519e787 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1061,6 +1061,11 @@ libxl_physinfo = Struct("physinfo", [
     ("cap_shadow", bool),
     ("cap_iommu_hap_pt_share", bool),
     ("cap_vmtrace", bool),
+
+    ("arch_arm", Struct(None, [("p2m_ipa_bits", uint32),
+                              ])),
+    ("arch_x86", Struct(None, [
+                              ])),
     ], dir=DIR_OUT)
 
 libxl_connectorinfo = Struct("connectorinfo", [
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 18c3c77..0fb13ee 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -882,6 +882,12 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
                     libxl_defbool_val(src->b_info.arch_x86.msr_relaxed));
 }
 
+void libxl__arch_get_physinfo(libxl__gc *gc,
+                              libxl_physinfo *to,
+                              xc_physinfo_t *from)
+{
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index f87944e..4e7e209 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,6 +15,7 @@
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
+    pi->arch.p2m_ipa_bits = p2m_ipa_bits;
 }
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 64a2ca3..36b1eef 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -332,6 +332,11 @@ struct xen_arch_domainconfig {
      */
     uint32_t clock_frequency;
 };
+
+struct arch_physinfo {
+    /* Holds the bit size of IPAs in p2m tables. */
+    uint32_t p2m_ipa_bits;
+};
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
 struct arch_vcpu_info {
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 7acd94c..8d2c05e 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -346,6 +346,8 @@ typedef struct xen_msr_entry {
 } xen_msr_entry_t;
 DEFINE_XEN_GUEST_HANDLE(xen_msr_entry_t);
 
+struct arch_physinfo {
+};
 #endif /* !__ASSEMBLY__ */
 
 /*
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 039ccf8..2727f21 100644
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
+    struct arch_physinfo arch;
 };
 
 /*
-- 
2.7.4


