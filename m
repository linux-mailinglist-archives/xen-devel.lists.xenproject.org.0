Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2542960E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 19:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206421.361999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzQK-0002G9-0k; Mon, 11 Oct 2021 17:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206421.361999; Mon, 11 Oct 2021 17:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzQJ-0002Ch-Sw; Mon, 11 Oct 2021 17:49:15 +0000
Received: by outflank-mailman (input) for mailman id 206421;
 Mon, 11 Oct 2021 17:49:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=obo4=O7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mZzQI-0001vo-Gw
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 17:49:14 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4eb6c7fa-a285-46ca-b287-31a54aa77a6d;
 Mon, 11 Oct 2021 17:49:09 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id j5so77000175lfg.8
 for <xen-devel@lists.xenproject.org>; Mon, 11 Oct 2021 10:49:08 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h4sm789688lfk.193.2021.10.11.10.49.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Oct 2021 10:49:07 -0700 (PDT)
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
X-Inumbo-ID: 4eb6c7fa-a285-46ca-b287-31a54aa77a6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=L+Vz4g8mPdTUD6U0yWxfJ59oXSdq+i7jG1ZWATUEews=;
        b=Kikq9z9xIVPwRfqXxyfjVyqc7Z/XIn+fsI9o3ya2bgHJl+aduFHx8oj8ZIOXMtuq3z
         cI0tb0EN1WIR3eB+ppRpjsJWhLpIipX6k/EzYutfv2+bOVaebXnXFZvhKcubshAF5lNK
         7LFRf8Pa3l7lohNLmMR6vJQoKFkjCNHmBau2oKYQkuGx0KreHzxbbEg1MDp7xgnWa9eE
         DNAl9ALaMckrA5NRn0rgCk+cywQgBdkU2Q4NJsnN4RSt5vTILejnFunPYHvViOp9KAgH
         Ct91bk284aSWgqp8q1efwqwzKO8lna8+wF/NtZQ+xamu0D/U6ALk5r4NHdgi2LrI7tAj
         Vo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=L+Vz4g8mPdTUD6U0yWxfJ59oXSdq+i7jG1ZWATUEews=;
        b=GedLVwo0Q03iRk+gGQX0hutjDhQ02aHt34MSK+f7Zw6mbLhk02L+jag0sfdcpKb/nd
         zZfin2LG4WizmhNgwE7XZG/rF7BGxtd6KpuS5+FK9pya5mo61tutztj5+iKUVKCQUR7R
         Aiu3kE9bpVPqpGDyMqBe89hSZW/x9ViF3t2mMObJFSWhQIQ0hDDD2mbfysSa+yk5Sz0b
         pqMw+vfkHwvg/PeTMniDSU5oD7l15EZThze1PRh37aP+tNuSetWqjshTwU4nMjRXdCn+
         2Ggm48rdGJwhH3kJkemP0LwDwRQ9ngZiH0nj3oIsjxaFXObUJ7k13Vm/olcl9bVKruSW
         C3qg==
X-Gm-Message-State: AOAM530eWKmKC4ti+6zcjYkuGs0Jp4o6MJC0u2y1kT8h+nqYAWL3cr/z
	tzQoba3Dpoio2OnXFJ+i2WM4M3D58p0=
X-Google-Smtp-Source: ABdhPJwJtJrvRFK/aU40SBxwZDoY17MYen4S/0b4K+26XC1I82rmcqf7XK7YSqcAmQ/PvF2x4MYGRg==
X-Received: by 2002:a05:6512:22c2:: with SMTP id g2mr28212682lfu.577.1633974547815;
        Mon, 11 Oct 2021 10:49:07 -0700 (PDT)
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
Subject: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo
Date: Mon, 11 Oct 2021 20:48:58 +0300
Message-Id: <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

We need to pass info about maximum supported guest physical
address space size to the toolstack on Arm in order to properly
calculate the base and size of the extended region (safe range)
for the guest. The extended region is unused address space which
could be safely used by domain for foreign/grant mappings on Arm.
The extended region itself will be handled by the subsequent
patch.

Currently the same guest physical address space size is used
for all guests (p2m_ipa_bits variable on Arm, the x86 equivalent
is hap_paddr_bits).

As we add new field to the structure bump the interface version.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes RFC -> V2:
   - update patch subject/description
   - replace arch-specific sub-struct with common gpaddr_bits
     field and update code to reflect that

Changes V2 -> V3:
   - make the field uint8_t and add uint8_t pad[7] after
   - remove leading blanks in libxl.h

Changes V3 -> V4:
   - also print gpaddr_bits from output_physinfo()
   - add Michal's R-b

Changes V4 -> V5:
   - update patch subject and description
   - drop Michal's R-b
   - pass gpaddr_bits via createdomain domctl
     (struct xen_arch_domainconfig)

Changes V5 -> V6:
   - update patch subject and description
   - pass gpaddr_bits via getdomaininfo domctl
     (struct xen_domctl_getdomaininfo)
---
 tools/include/libxl.h            | 8 ++++++++
 tools/include/xenctrl.h          | 1 +
 tools/libs/ctrl/xc_domain.c      | 1 +
 tools/libs/light/libxl_domain.c  | 1 +
 tools/libs/light/libxl_types.idl | 1 +
 xen/arch/arm/domctl.c            | 2 ++
 xen/arch/x86/domctl.c            | 1 +
 xen/include/public/domctl.h      | 3 ++-
 8 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d..deb5022 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -874,6 +874,14 @@ typedef struct libxl__ctx libxl_ctx;
 #define LIBXL_HAVE_DOMINFO_NEVER_STOP 1
 
 /*
+ * LIBXL_HAVE_DOMINFO_GPADDR_BITS
+ *
+ * If this is defined, libxl_dominfo will contain an uint8 field called
+ * gpaddr_bits, containing the guest physical address space size.
+ */
+#define LIBXL_HAVE_DOMINFO_GPADDR_BITS 1
+
+/*
  * LIBXL_HAVE_QXL
  *
  * If defined, then the libxl_vga_interface_type will contain another value:
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index a306399..07b96e6 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -462,6 +462,7 @@ typedef struct xc_dominfo {
     unsigned int  max_vcpu_id;
     xen_domain_handle_t handle;
     unsigned int  cpupool;
+    uint8_t       gpaddr_bits;
     struct xen_arch_domainconfig arch_config;
 } xc_dominfo_t;
 
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 23322b7..b155d6a 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -396,6 +396,7 @@ int xc_domain_getinfo(xc_interface *xch,
         info->nr_online_vcpus = domctl.u.getdomaininfo.nr_online_vcpus;
         info->max_vcpu_id = domctl.u.getdomaininfo.max_vcpu_id;
         info->cpupool = domctl.u.getdomaininfo.cpupool;
+        info->gpaddr_bits = domctl.u.getdomaininfo.gpaddr_bits;
         info->arch_config = domctl.u.getdomaininfo.arch_config;
 
         memcpy(info->handle, domctl.u.getdomaininfo.handle,
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 51a6127..544a9bf 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -306,6 +306,7 @@ void libxl__xcinfo2xlinfo(libxl_ctx *ctx,
     xlinfo->vcpu_max_id = xcinfo->max_vcpu_id;
     xlinfo->vcpu_online = xcinfo->nr_online_vcpus;
     xlinfo->cpupool = xcinfo->cpupool;
+    xlinfo->gpaddr_bits = xcinfo->gpaddr_bits;
     xlinfo->domain_type = (xcinfo->flags & XEN_DOMINF_hvm_guest) ?
         LIBXL_DOMAIN_TYPE_HVM : LIBXL_DOMAIN_TYPE_PV;
 }
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 3f9fff6..2df7258 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -357,6 +357,7 @@ libxl_dominfo = Struct("dominfo",[
     ("vcpu_max_id", uint32),
     ("vcpu_online", uint32),
     ("cpupool",     uint32),
+    ("gpaddr_bits", uint8),
     ("domain_type", libxl_domain_type),
     ], dir=DIR_OUT)
 
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index b7d27f3..6245af6 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -20,6 +20,8 @@ void arch_get_domain_info(const struct domain *d,
 {
     /* All ARM domains use hardware assisted paging. */
     info->flags |= XEN_DOMINF_hap;
+
+    info->gpaddr_bits = p2m_ipa_bits;
 }
 
 static int handle_vuart_init(struct domain *d, 
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 26a76d2..7d102e0 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -151,6 +151,7 @@ void arch_get_domain_info(const struct domain *d,
         info->flags |= XEN_DOMINF_hap;
 
     info->arch_config.emulation_flags = d->arch.emulation_flags;
+    info->gpaddr_bits = hap_paddr_bits;
 }
 
 static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *op,
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 4cb3f66..b93f776 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -38,7 +38,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
@@ -150,6 +150,7 @@ struct xen_domctl_getdomaininfo {
     uint32_t ssidref;
     xen_domain_handle_t handle;
     uint32_t cpupool;
+    uint8_t gpaddr_bits; /* Guest physical address space size. */
     struct xen_arch_domainconfig arch_config;
 };
 typedef struct xen_domctl_getdomaininfo xen_domctl_getdomaininfo_t;
-- 
2.7.4


