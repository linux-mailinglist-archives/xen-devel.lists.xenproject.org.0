Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HlwFmbw4Gl4ngAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:21:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C73640F803
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283531.1565751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNam-0005ZM-76; Thu, 16 Apr 2026 14:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283531.1565751; Thu, 16 Apr 2026 14:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNam-0005Y8-2q; Thu, 16 Apr 2026 14:21:16 +0000
Received: by outflank-mailman (input) for mailman id 1283531;
 Thu, 16 Apr 2026 14:21:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDNak-0005Iy-K6
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:21:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDNak-00GoVN-0I
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:21:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e0f053-bab6-0a2a0a5309dd-0a2a450b9f54-24
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:21:13 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e0f059-212f-0a2a450b0019-d1558036e46a-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:21:13 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488ad135063so77998165e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 07:21:13 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f096d110sm59803515e9.11.2026.04.16.07.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 07:21:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349273; x=1776954073; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlLqvIvTkFRs8hkQkfaNXDqEZXGwCjef7xkJAk72j/M=;
        b=oETgS9gbScgugEcQwyFfwNnN5WAfaaEyIsu8B+SdEfdI9cuKmqU5P9onAs7alfgQ13
         MPPAdjlZB4JKHct64LQcFkCZjGs00n+HsIHx0gZAdlxLltweVY174lAJB/nbktH0b2H+
         3MPLjMY6FOWv///ky3M+2R5qEN+d860rg+HCBL6yj43Y19kHsO5OgKnaO+n69f+PS2TF
         6GHOdFEpihK63T+jwKSeL+CAMo4hQOQGGtZV2Nx1v5TNRwptMU+9nvWLG/JpllKu4VFS
         AxQbvUARaA73grIagj//7vyBErupjbNSkVkxibbAb4+S3m1n+Yz3LvCVLVhqaQn7LLMa
         tUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349273; x=1776954073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OlLqvIvTkFRs8hkQkfaNXDqEZXGwCjef7xkJAk72j/M=;
        b=HZlsEoJjoQagRmbVNuiM6VZzAb4C1q+MvkOacgZz0z9qDq/3xN9g062Wp9Eys9ko4t
         mpOZl/M+6k2tqbsU+lL7EFdAig20ocD7X6+ZqOnXCZfiIs+smKeeB2XjjXKKwsd4xYlS
         BjZ6kmM8dD8ZXtK4TY1RAM2T0Kxg2vF3P7gg5kK7zCk5QF7j9cLuGz5iLI809ZHq8CxD
         +MwY6Q6O9qvloNhKqryjF19j1hfr3JISHzJoGEXZIvEd+MS1YNmNyATUyXAM3jYxbCuA
         BEeJXpoeXmaNjXIQw7BUKXOoTaMLuSIBfWpeSiukReSJnBZnZpuesJW/UngaXW2rd+GB
         nDSw==
X-Gm-Message-State: AOJu0Yya36pDGKnJ1fMoZPVfyOpx65SumsN8gZ+0xDYnyytrmF+vAIJB
	yiBCKBBkBx/t6xcIfcnSua7CXO28VXe9QxuufXRHOPT1l1YBwNYqXPuJb9RHVA==
X-Gm-Gg: AeBDiesU98CBWRI0bJ7JkcxZdgWKcOqzM+yQDHehCqmmQX43e18g8/TzxeLv/weo5/I
	HyplA1oK14Ck3vvLh30LYQSIDTnudI2JZlb3UcIZpRhrCVM99vlwSN7JQbkJoq2pM3ouqcw5xp6
	dvhTH3zjfP5IlcJHOs37eXb8PSiYLBRzyBMp4gFElr+plkgKsn9p2jRbeHu1zE504oGT+P8Lmak
	3al0Oecy/BiAW0WZpAV19bn3Y5tRbqJaeh76kI6wDj3raXw3o3kKJf18OqFdKKz/KNWrjjs+eoQ
	KxPh9ogG+PGdQUNT/6gNH4bg3m6FdKOPm8XM2TKF5CjkIHtDZp9dTsXe63KzLEDhog47GYGyWOl
	DnBQpyptVxxycJFGLaR4S5gYU9qAfFS/vJwZn5MsX0HwqcFcp0peuIMv5avlhGU7GWIFJmbfHKH
	3kHuAjpywB+yjcFnUiODq51UQyr3RLr5TsDNX7HvhAQ3CK9UIL7gkNkCrdn0FQnCAmSKbm/+BL7
	Lqz
X-Received: by 2002:a05:600c:3f0a:b0:488:afb5:6a21 with SMTP id 5b1f17b1804b1-488d68764b0mr362614505e9.15.1776349272848;
        Thu, 16 Apr 2026 07:21:12 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
Date: Thu, 16 Apr 2026 16:21:00 +0200
Message-ID: <e5ffcdecb0ca3c87b46965449601ff20116fecc0.1776340422.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776340422.git.oleksii.kurochko@gmail.com>
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776349273-06573F3B-97F78B3A/10/73395122804
X-purgate-type: spam
X-purgate-size: 10470
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,arm.com,epam.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.911];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0C73640F803
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As domain type is part of common code now there is no any reason
to have architecture-specific set_domain_type() functions so
it is dropped.

The CONFIG_ARM_64 guard in xen/arch/arm/domain_build.c is intentionally
left unchanged: it is ARM-specific code, and ARM_64 selects
HAS_DOMAIN_TYPE, so the semantics are identical.

x86 with CONFIG_64BIT=y shouldn't use is_{32,64}bit_domain() as
x86 doesn't have support of CONFIG_HAS_DOMAIN_TYPE. For x86_32
it is fine to follow generic is_{32,64}_bit_domain() implementations.

Generally it probably would be better to introduce CONFIG_32BIT
and use it to define is_{32,64}bit_domain() as if one day
CONFIG_128BIT will be introduced is_{32,64}bit_domain() will be
defined incorrectly but considering that CONFIG_64BIT is maximum
supported bitness it is fine to define in this way.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/Kconfig                        |  3 +++
 xen/arch/arm/Kconfig                    |  1 +
 xen/arch/arm/arm64/domctl.c             |  4 ++--
 xen/arch/arm/dom0less-build.c           | 14 --------------
 xen/arch/arm/domain_build.c             |  8 ++++----
 xen/arch/arm/include/asm/domain.h       | 12 ------------
 xen/arch/arm/include/asm/kernel.h       |  4 ----
 xen/arch/arm/kernel.c                   | 10 +++++-----
 xen/common/device-tree/dom0less-build.c |  5 ++++-
 xen/include/xen/dom0less-build.h        |  2 --
 xen/include/xen/domain.h                | 13 +++++++++++++
 xen/include/xen/fdt-kernel.h            |  5 +++++
 xen/include/xen/sched.h                 |  4 ++++
 13 files changed, 41 insertions(+), 44 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f9230bfaf872..6c53149f7ee1 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -1,6 +1,9 @@
 config 64BIT
 	bool
 
+config HAS_DOMAIN_TYPE
+	bool
+
 config PHYS_ADDR_T_32
 	bool
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2f2b501fdac4..79622b46a10d 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -7,6 +7,7 @@ config ARM_64
 	def_bool y
 	depends on !ARM_32
 	select 64BIT
+	select HAS_DOMAIN_TYPE
 	select HAS_FAST_MULTIPLY
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
 
diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
index 8720d126c97d..9e9a29eb1e78 100644
--- a/xen/arch/arm/arm64/domctl.c
+++ b/xen/arch/arm/arm64/domctl.c
@@ -21,10 +21,10 @@ static long switch_mode(struct domain *d, enum domain_type type)
         return -EINVAL;
     if ( domain_tot_pages(d) != 0 )
         return -EBUSY;
-    if ( d->arch.type == type )
+    if ( d->type == type )
         return 0;
 
-    d->arch.type = type;
+    d->type = type;
 
     if ( is_64bit_domain(d) )
         for_each_vcpu(d, v)
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4181c105389a..6f73c65e5151 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -237,20 +237,6 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
     return 0;
 }
 
-/* TODO: make arch.type generic ? */
-#ifdef CONFIG_ARM_64
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
-{
-    /* type must be set before allocate memory */
-    d->arch.type = kinfo->arch.type;
-}
-#else
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
-{
-    /* Nothing to do */
-}
-#endif
-
 int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
                       const struct dt_device_node *node)
 {
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6740da3d324b..2fd89b3a1345 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1178,7 +1178,7 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
     /* Keep the compiler happy with -Og */
     bool clock_valid = false;
     uint64_t mpidr_aff;
-    void *fdt = kinfo;
+    void *fdt = kinfo->fdt;
 
     dt_dprintk("Create cpus node\n");
 
@@ -1774,13 +1774,13 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 
 #ifdef CONFIG_ARM_64
     /* if aarch32 mode is not supported at EL1 do not allow 32-bit domain */
-    if ( !(cpu_has_el1_32) && kinfo->arch.type == DOMAIN_32BIT )
+    if ( !(cpu_has_el1_32) && kinfo->type == DOMAIN_32BIT )
     {
         printk("Platform does not support 32-bit domain\n");
         return -EINVAL;
     }
 
-    if ( is_sve_domain(d) && (kinfo->arch.type == DOMAIN_32BIT) )
+    if ( is_sve_domain(d) && (kinfo->type == DOMAIN_32BIT) )
     {
         printk("SVE is not available for 32-bit domain\n");
         return -EINVAL;
@@ -1896,7 +1896,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
 
 #ifdef CONFIG_ARM_64
     /* type must be set before allocate_memory */
-    d->arch.type = kinfo->arch.type;
+    d->type = kinfo->type;
 #endif
     find_gnttab_region(d, kinfo);
     if ( is_domain_direct_mapped(d) )
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index f95ad1285e6e..2d4c1bdecb66 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -18,18 +18,6 @@ struct hvm_domain
     uint64_t              params[HVM_NR_PARAMS];
 };
 
-#ifdef CONFIG_ARM_64
-enum domain_type {
-    DOMAIN_32BIT,
-    DOMAIN_64BIT,
-};
-#define is_32bit_domain(d) ((d)->arch.type == DOMAIN_32BIT)
-#define is_64bit_domain(d) ((d)->arch.type == DOMAIN_64BIT)
-#else
-#define is_32bit_domain(d) (1)
-#define is_64bit_domain(d) (0)
-#endif
-
 struct vtimer {
     struct vcpu *v;
     int irq;
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 7c3b7fde5b64..21f4273fa1b5 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -10,10 +10,6 @@
 
 struct arch_kernel_info
 {
-#ifdef CONFIG_ARM_64
-    enum domain_type type;
-#endif
-
     /* Enable pl011 emulation */
     bool vpl011;
 };
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 3c613cdb233f..bc9aad3f5f45 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -101,7 +101,7 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     paddr_t load_addr;
 
 #ifdef CONFIG_ARM_64
-    if ( (info->arch.type == DOMAIN_64BIT) && (info->image.start == 0) )
+    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
         return mem->bank[0].start + info->image.text_offset;
 #endif
 
@@ -272,10 +272,10 @@ int __init kernel_uimage_probe(struct kernel_info *info,
     switch ( uimage.arch )
     {
     case IH_ARCH_ARM:
-        info->arch.type = DOMAIN_32BIT;
+        info->type = DOMAIN_32BIT;
         break;
     case IH_ARCH_ARM64:
-        info->arch.type = DOMAIN_64BIT;
+        info->type = DOMAIN_64BIT;
         break;
     default:
         printk(XENLOG_ERR "Unsupported uImage arch type %d\n", uimage.arch);
@@ -345,7 +345,7 @@ static int __init kernel_zimage64_probe(struct kernel_info *info,
 
     info->load = kernel_zimage_load;
 
-    info->arch.type = DOMAIN_64BIT;
+    info->type = DOMAIN_64BIT;
 
     return 0;
 }
@@ -397,7 +397,7 @@ static int __init kernel_zimage32_probe(struct kernel_info *info,
     info->load = kernel_zimage_load;
 
 #ifdef CONFIG_ARM_64
-    info->arch.type = DOMAIN_32BIT;
+    info->type = DOMAIN_32BIT;
 #endif
 
     return 0;
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 64b12d6aec62..418282a6a549 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -809,7 +809,10 @@ static int __init construct_domU(struct kernel_info *kinfo,
     if ( rc < 0 )
         return rc;
 
-    set_domain_type(d, kinfo);
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+    /* type must be set before allocate memory */
+    d->type = kinfo->type;
+#endif
 
     if ( is_hardware_domain(d) )
     {
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-build.h
index faaf660424b2..4118dec76c0a 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -57,8 +57,6 @@ int init_vuart(struct domain *d, struct kernel_info *kinfo,
 int make_intc_domU_node(struct kernel_info *kinfo);
 int make_arch_nodes(struct kernel_info *kinfo);
 
-void set_domain_type(struct domain *d, struct kernel_info *kinfo);
-
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
                       const int node_next, const void *pfdt);
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 93c0fd00c1d7..5951e7e6928f 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -13,6 +13,19 @@ struct guest_area {
     void *map;
 };
 
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+enum domain_type {
+    DOMAIN_32BIT,
+    DOMAIN_64BIT,
+};
+#define is_32bit_domain(d) ((d)->type == DOMAIN_32BIT)
+#define is_64bit_domain(d) ((d)->type == DOMAIN_64BIT)
+#elif !defined(CONFIG_64BIT)
+/* On 32-bit-only platforms all domains are 32-bit. */
+#define is_32bit_domain(d) (true)
+#define is_64bit_domain(d) (false)
+#endif
+
 #include <asm/domain.h>
 
 typedef union {
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 3527934b2a00..2c9bf4d4ef4f 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -9,6 +9,7 @@
 
 #include <xen/bootinfo.h>
 #include <xen/device_tree.h>
+#include <xen/domain.h>
 #include <xen/types.h>
 
 #if __has_include(<asm/kernel.h>)
@@ -69,6 +70,10 @@ struct kernel_info {
         } image;
     };
 
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+    enum domain_type type;
+#endif
+
 #if __has_include(<asm/kernel.h>)
     struct arch_kernel_info arch;
 #endif
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 212c7d765c3e..4314bd195457 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -668,6 +668,10 @@ struct domain
     struct page_info *pending_scrub;
     unsigned int pending_scrub_order;
     unsigned int pending_scrub_index;
+
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+    enum domain_type type;
+#endif
 } __aligned(PAGE_SIZE);
 
 static inline struct page_list_head *page_to_list(
-- 
2.53.0


