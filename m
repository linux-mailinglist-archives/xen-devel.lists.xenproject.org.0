Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774BD42D859
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 13:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209271.365686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maz6b-0004C2-Ro; Thu, 14 Oct 2021 11:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209271.365686; Thu, 14 Oct 2021 11:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maz6b-00049q-NG; Thu, 14 Oct 2021 11:41:01 +0000
Received: by outflank-mailman (input) for mailman id 209271;
 Thu, 14 Oct 2021 11:41:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gDO=PC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maz6a-0003sA-DB
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 11:41:00 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2b3fd70-c0e9-40c5-a209-0f42a45a465b;
 Thu, 14 Oct 2021 11:40:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m22so18673363wrb.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Oct 2021 04:40:55 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g16sm2151359wrs.90.2021.10.14.04.40.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Oct 2021 04:40:54 -0700 (PDT)
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
X-Inumbo-ID: c2b3fd70-c0e9-40c5-a209-0f42a45a465b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Svlz/0Yb6tw+86OBsJrg6OP0a5Eri0NBAH2C09SaqC0=;
        b=oks9Er860d2+4A7aHFIIpKoQz6/W3vEn4gWpxVqBsled2mJXaMGLG4/cpos2vs8LuX
         s7n5LfDcHswweI048uQqdOCwVNy6ULv1bwQSmMsLMJLXuMWTmdj2XcyUTjRcOdQdSauC
         jCeSd6zprrJSnA+DCaLD0Vgm5FD8iRiNtIb2w9aI2mSM73QpSAzcohh91p11jl9h9MAE
         Rpn550vwH5Xifis/YiSJWo5y0rCNg3eigNwahC2MqpnklA7xLMKbKx7H7QhIIcEmMJyT
         ZNharcrl+9K2m2b99f6zwBG/je9ILVl/QclBVXYU/H8Z0RZwQvzl7DEo1GMP3Iitr0Nc
         ic+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Svlz/0Yb6tw+86OBsJrg6OP0a5Eri0NBAH2C09SaqC0=;
        b=FrhttsaXQ24oeRhM0F3WEZUOEDlcQDJ0lcMaiVAqgSQNdvmWeZCOS7JblqVRvFnKh3
         V6nw0/sNomdCTJ7SbHXJZQ6q/sCGjXu7NHtJ9mfuY/+Tt2yauVC1Ws5pUA4ZRVv3oRB9
         0kw1hD2vkRobPrY7VIV1OLpJLePajaPaEyDufhfvsQFJoJtv1bzBrV/fvMBM1zJqRqCp
         BiAXXPLlYwyamcfgb16IwxMt9hzFYaNdu+rlpObkv+FLoGSNfXM0K1AyKlQ0GwxQnjjW
         4aPARiYn9orLDqPG27i/GHVmerotb+bBakKtYS81BCE9rkwZ2zH5ntAfbo/g5WLlWa3r
         3BWQ==
X-Gm-Message-State: AOAM5331aJ6pPrN7aKil1EZ/dGS2PnXYMvIohIKnEVQgV8Bu1GFd4F6p
	bwVz8NpjYFOPnA7+xmvEA0X9SUBZG6M=
X-Google-Smtp-Source: ABdhPJxOvDsNjqWp7O21x29E+3d1JC4DGADWgcqQD2Bl4wukSFbOY+TyQMwDmj7pFg3awbER7g/RUw==
X-Received: by 2002:adf:a34c:: with SMTP id d12mr6211652wrb.267.1634211654333;
        Thu, 14 Oct 2021 04:40:54 -0700 (PDT)
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
Subject: [PATCH V7 1/2] xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo
Date: Thu, 14 Oct 2021 14:40:44 +0300
Message-Id: <1634211645-26912-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>
References: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>

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

Add an explicit padding after "gpaddr_bits" field and also
(while at it) after "domain" field.

Also make sure that full structure is cleared in all cases by
moving the clearing into getdomaininfo(). Currently it is only
cleared by the sysctl caller (and only once).

Please note, we do not need to bump XEN_DOMCTL_INTERFACE_VERSION
as a bump has already occurred in this release cycle. But we do
need to bump XEN_SYSCTL_INTERFACE_VERSION as the structure is
re-used in a sysctl.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Ian Jackson <iwj@xenproject.org>
[hypervisor parts]
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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

Changes V6 -> V7:
   - update patch description
   - do not bump XEN_DOMCTL_INTERFACE_VERSION
   - bump XEN_SYSCTL_INTERFACE_VERSION
   - add explicit paddings
   - clear the full structure in getdomaininfo()

Changes V7 -> V7.1:
   - add Jan's R-b
   - drop non-useful change (info->flags |= ...) in getdomaininfo()
---
 tools/include/libxl.h            | 8 ++++++++
 tools/include/xenctrl.h          | 1 +
 tools/libs/ctrl/xc_domain.c      | 1 +
 tools/libs/light/libxl_domain.c  | 1 +
 tools/libs/light/libxl_types.idl | 1 +
 xen/arch/arm/domctl.c            | 2 ++
 xen/arch/x86/domctl.c            | 1 +
 xen/common/domctl.c              | 4 ++--
 xen/common/sysctl.c              | 2 +-
 xen/include/public/domctl.h      | 3 +++
 xen/include/public/sysctl.h      | 2 +-
 11 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ee73eb0..2e8679d 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -886,6 +886,14 @@ typedef struct libxl__ctx libxl_ctx;
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
index b96fb5c..608d55a 100644
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
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 12d6144..271862a 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -69,10 +69,10 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
     int flags = XEN_DOMINF_blocked;
     struct vcpu_runstate_info runstate;
 
+    memset(info, 0, sizeof(*info));
+
     info->domain = d->domain_id;
     info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
-    info->nr_online_vcpus = 0;
-    info->ssidref = 0;
 
     /*
      * - domain is marked as blocked only if all its vcpus are blocked
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 6e7189b..f2dab72 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -76,7 +76,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     case XEN_SYSCTL_getdomaininfolist:
     { 
         struct domain *d;
-        struct xen_domctl_getdomaininfo info = { 0 };
+        struct xen_domctl_getdomaininfo info;
         u32 num_domains = 0;
 
         rcu_read_lock(&domlist_read_lock);
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a53cbd1..9099dc1 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -108,6 +108,7 @@ struct xen_domctl_createdomain {
 struct xen_domctl_getdomaininfo {
     /* OUT variables. */
     domid_t  domain;              /* Also echoed in domctl.domain */
+    uint16_t pad1;
  /* Domain is scheduled to die. */
 #define _XEN_DOMINF_dying     0
 #define XEN_DOMINF_dying      (1U<<_XEN_DOMINF_dying)
@@ -152,6 +153,8 @@ struct xen_domctl_getdomaininfo {
     uint32_t ssidref;
     xen_domain_handle_t handle;
     uint32_t cpupool;
+    uint8_t gpaddr_bits; /* Guest physical address space size. */
+    uint8_t pad2[7];
     struct xen_arch_domainconfig arch_config;
 };
 typedef struct xen_domctl_getdomaininfo xen_domctl_getdomaininfo_t;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index fead0e5..3e53681 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -35,7 +35,7 @@
 #include "domctl.h"
 #include "physdev.h"
 
-#define XEN_SYSCTL_INTERFACE_VERSION 0x00000013
+#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
 
 /*
  * Read console content from Xen buffer ring.
-- 
2.7.4


