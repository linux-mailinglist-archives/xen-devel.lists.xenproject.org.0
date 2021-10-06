Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90525423C97
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 13:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202814.357847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY50R-00023M-UA; Wed, 06 Oct 2021 11:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202814.357847; Wed, 06 Oct 2021 11:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY50R-00021A-QQ; Wed, 06 Oct 2021 11:22:39 +0000
Received: by outflank-mailman (input) for mailman id 202814;
 Wed, 06 Oct 2021 11:22:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZr5=O2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mY50Q-0001im-Hn
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:22:38 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6fdf512-6641-4e7c-be61-80f567d47e2c;
 Wed, 06 Oct 2021 11:22:33 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id r19so8748166lfe.10
 for <xen-devel@lists.xenproject.org>; Wed, 06 Oct 2021 04:22:33 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l14sm1002101lfe.124.2021.10.06.04.22.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Oct 2021 04:22:32 -0700 (PDT)
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
X-Inumbo-ID: c6fdf512-6641-4e7c-be61-80f567d47e2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CcbmLT6d9wwXQN2hKHL5MK8rkv/Z2/lvlmA1gHA67xo=;
        b=GsAn4INN10u1/v1hz/ZkEhtBJY66i72oHgoG9pe3ZbRPE2J27yqyldBWdhMOpv3gVG
         iLU2hJIZuCKxakfU9cty7zC2sBb0pto0SWlVbsNHVho0cGq2r436F5NMUSEHxhvhWfXt
         u8eB6agjfiLb5PKyMn3vvXYwdHAjwlMHXnn97ZB6Gb99b/zbiI7roSKIhUSMreMZYzx8
         UKyV4v2NhsYGfrOpunafCxU9psnsrHyj4gMj4Dy0MEH6Y6KH/RqZ/BbwCscwpp0RfoGZ
         tfgGgJI0fofdf0iEsOXy2i08gQ+EVlgAwvPPsdrY9tU90edhAg057Pn7yZgmp58buZkD
         HrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CcbmLT6d9wwXQN2hKHL5MK8rkv/Z2/lvlmA1gHA67xo=;
        b=1PR8IQuPet467s+eV0hXEXrgMX5WmU4oU9XlMbGF1EDwoSIt9Vo5gJRbhPopuesQme
         KL43wBKVF7yXmHKzX2NAUlpPMB3wBJI4ktLwAIq2lrKkbgWNpfi/B7ixFPoE5CaxviK4
         EwxCiwyJtP/Nu2kE2Zfw32jhIeidjDSMqGKCO1g08/gH53l1WHIfWKliXHqwdqLxn8QW
         0fskFcbT0V6iWyB+Y7CGKUI0pzawcvVnB+W0WUNwettyoilSRTDni1X0VZKgwKs4KeyB
         QWSyHuv0/fg7aBgsdUyngcjxb/rD5PGABjvV4UdnOs5w9Xkb0gpfUpmnnfxdWqd98gLG
         1LEQ==
X-Gm-Message-State: AOAM533JVsfhlfFMXT+/0U+N46eQRyQf1sL/+uaSJuxpjbif1UqPCeL7
	jwKb8o7VR2Kk8gSbZBxyDfm0KYtp33E=
X-Google-Smtp-Source: ABdhPJyvoQ2Zt//ZO//Id6aWJq18Tx8FMqiKtwk5cBvQZRuoqXRt40eLqf49yP7vRWFg3N9eGblE2Q==
X-Received: by 2002:a05:651c:1b8:: with SMTP id c24mr29426570ljn.520.1633519352266;
        Wed, 06 Oct 2021 04:22:32 -0700 (PDT)
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct xen_arch_domainconfig
Date: Wed,  6 Oct 2021 14:22:24 +0300
Message-Id: <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

We need to pass info about maximum supported guest physical
address space size to the toolstack on Arm in order to properly
calculate the base and size of the extended region (safe range)
for the guest. The extended region is unused address space which
could be safely used by domain for foreign/grant mappings on Arm.
The extended region itself will be handled by the subsequent
patch.

Currently the same guest physical address space size is used
for all guests.

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
---
 tools/include/libxl.h            | 5 +++++
 tools/libs/light/libxl_arm.c     | 2 ++
 tools/libs/light/libxl_types.idl | 1 +
 xen/arch/arm/domain.c            | 6 ++++++
 xen/include/public/arch-arm.h    | 5 +++++
 xen/include/public/domctl.h      | 2 +-
 6 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d..33b4bfb 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -279,6 +279,11 @@
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
 
 /*
+ * libxl_domain_build_info has the gpaddr_bits field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_GPADDR_BITS 1
+
+/*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
  * in enum libxl_shutdown_reason.
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e3140a6..45e0386 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -123,6 +123,8 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
 
     state->clock_frequency = config->arch.clock_frequency;
 
+    d_config->b_info.arch_arm.gpaddr_bits = config->arch.gpaddr_bits;
+
     return 0;
 }
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 3f9fff6..39482db 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -644,6 +644,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
+                               ("gpaddr_bits", uint8),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 19c756a..dfecc45 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -767,6 +767,12 @@ int arch_domain_create(struct domain *d,
     if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
         goto fail;
 
+    /*
+     * Pass maximum IPA bits to the toolstack, currently the same guest
+     * physical address space size is used for all guests.
+     */
+    config->arch.gpaddr_bits = p2m_ipa_bits;
+
     return 0;
 
 fail:
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 6b5a5f8..4a01f8b 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -333,6 +333,11 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /*
+     * OUT
+     * Guest physical address space size
+     */
+    uint8_t gpaddr_bits;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 96696e3..f37586e 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -38,7 +38,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
-- 
2.7.4


