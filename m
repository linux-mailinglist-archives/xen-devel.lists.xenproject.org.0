Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HmaHSWe6GlNNQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:08:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F14446F6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:08:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290141.1569839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFU8K-00064t-62; Wed, 22 Apr 2026 09:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290141.1569839; Wed, 22 Apr 2026 09:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFU8K-00062U-2G; Wed, 22 Apr 2026 09:44:36 +0000
Received: by outflank-mailman (input) for mailman id 1290141;
 Wed, 22 Apr 2026 09:44:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFU8J-0005rJ-86
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:44:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFU8I-00E82D-LI
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:44:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e89880-5cb7-0a2a0a5109dd-0a2a4502b5ae-12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:44:34 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e89882-af86-0a2a45020019-d155d0b2a8a6-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:44:34 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-38dd9f0fdc6so65609271fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 02:44:34 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a41cc7f832sm3494193e87.28.2026.04.22.02.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 02:44:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776851073; x=1777455873; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdrnKw1Nlrntb+VNA/letozKDP4oOCl6jEuvPSlVYk8=;
        b=Y3sMvdCND6IDq5Mj7XAiwD5w7VzHeVcDKyVMsNbALvrTbAi8o+cb3EI18sCodetykM
         LLSplgYQD8pnnFmsC75sSbBo2L2oeAYoI7DHSg1rPTt9U9GENoi4uPJacPwjTHZBpPrq
         r3hA1dz5/+w/SH28OpFSA31/Z17Chefbb801AFRLu5PiLpgrD+UUu8KxiHuEtoj+BW7f
         cfLsDdbCdIFr7avCRMHM5a+VjvQVkB+BlEpbNUw+pwdGyX8xpqhG2ZcPUU5iCU52lytm
         u30k8Iy8oamREKBgW+87EOynqLlHLdEFVMr42FkW0Z1iGANGJ8V3XoL4Zc2p5vmLMCPh
         n0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851073; x=1777455873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QdrnKw1Nlrntb+VNA/letozKDP4oOCl6jEuvPSlVYk8=;
        b=TRlnUruI8NcAVLndQbR+r0BOHRI7TwmOqNOytqJIkh4PN7hlZsA6XxmQWKSCqWtci4
         BxV+aHri6DTqy/Wk/UatlkODMl2ZUTu9iEAZT9EDisJGFIJg1NM9XnuqtSQpdugGouaT
         nkXnon8h7ZYt7iJcQX0ztFzWkRVXJmK/w4tk4WhFHRynZZDaU/wElaessicIDmT3vcy4
         rNBHAnWFlxIgSyjhewy6D3pfZMJum2sKimnl2T3oSRK46EhBJ9QK7hz6Bt710EjKC0FP
         KEGf2NxI+a81ZIiwO0uzNvMpBiyFRa+CIUn5lNooa7vSCMe5eJsYxbIORA7IqK2SPZWQ
         5ZoQ==
X-Gm-Message-State: AOJu0Yzz9e2MxL1jJEPGeJEZ75VxHHZy+O5IRwUPOHZFq1GCTHBUyE24
	uSSPUi+4NZSETkuCAiZYY6MgNljljkdSpvsdXFIjyC7V9lXw1ZXTY7CZ0pXRwQ==
X-Gm-Gg: AeBDiesWLOaPsufrk5eoUM7QlgnDI6NtWI4AsX7WxtZE4SlHjwavGxhI5gr/+XGeuGB
	FNooakBYLJSW4FXGDtyfkJwEqQYJYMm5wvAMJXRtCBDZvYTU1TPtw0r6YK+kcVLrWPyGk9SRAJ1
	aEncwBbXTOTvPUjD4/QLqxMSrQWgP2Z6S5DbnuRSXHFctCF4Pv0dQCQgH9HY7taSaK5hjWiqm6j
	V7zPaBJdMFcK8RcY0F21DjmE1EvcevPkcjwqiF/wztsayc9QwiEWcvMYRPqXCMnXVijWeVwMFzW
	135bGOR/lqm+/RbXKp0i+d9xxpbUH085P2YQ4K7+VLIVsY7Y20ygvBSf6WTKJ2OY/JlDaTu8F8Z
	2rFHU1x6BCc14JLwmGouCiRJ/enUjwf0DbOOhGFeMdmyAp+zWfYHzOvHXCgmNomv9Pc1D0v7mHL
	rf7oKPIEMvL9vH2d9P8uBevR1pd6EW4lClm8rFIuHv4dz8Ngm+cA8X2x7gEyntpT4odEYVM0qcE
	6zY
X-Received: by 2002:a05:6512:31d3:b0:5a4:156:aea3 with SMTP id 2adb3069b0e04-5a417174a77mr6977256e87.7.1776851073183;
        Wed, 22 Apr 2026 02:44:33 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
Date: Wed, 22 Apr 2026 11:44:19 +0200
Message-ID: <61c33c15d046110b5c99490f54191facf18068e1.1776780944.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776780944.git.oleksii.kurochko@gmail.com>
References: <cover.1776780944.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1776851074-898C3161-DB3835E2/10/73395122804
X-purgate-type: spam
X-purgate-size: 11008
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.965];
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
X-Rspamd-Queue-Id: DE3F14446F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As domain type is part of common code now there is no any reason
to have architecture-specific set_domain_type() functions so
it is dropped.

Change the guard around access of kinfo->type to CONFIG_HAS_DOMAIN_TYPE
for consistency. Also, drop and add some parentheses to be aligned
with the similar if() below.

x86 with CONFIG_64BIT=y shouldn't use is_{32,64}bit_domain() as
x86 doesn't have support of CONFIG_HAS_DOMAIN_TYPE. Since x86_32 Xen no
longer builds, the fallback is currently only relevant for arm32.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Update the commit message.
 - Move HAS_DOMAIN_TYPE to xen/common/Kconfig.
 - Return set_domain_type(), move it to xen/fdt-domain-build.h and make it
   static inline.
 - s/CONFIG_ARM_64/CONFIG_HAS_DOMAIN for the places where kinfo->type is used.
 - Drop parantethes around cpu_has_el1_32 in if() and add around
   (kinfo->type == DOMAIN_32BIT) to be consistent with the similar check below.
 - Fix comment code style.
 - Add __packed to definition of enum domain_type
---
 xen/arch/arm/Kconfig               |  1 +
 xen/arch/arm/arm64/domctl.c        |  4 ++--
 xen/arch/arm/dom0less-build.c      | 14 --------------
 xen/arch/arm/domain_build.c        | 12 +++++-------
 xen/arch/arm/include/asm/domain.h  | 12 ------------
 xen/arch/arm/include/asm/kernel.h  |  4 ----
 xen/arch/arm/kernel.c              | 16 ++++++++--------
 xen/common/Kconfig                 |  3 +++
 xen/include/xen/dom0less-build.h   |  2 --
 xen/include/xen/domain.h           | 13 +++++++++++++
 xen/include/xen/fdt-domain-build.h |  9 +++++++++
 xen/include/xen/fdt-kernel.h       |  5 +++++
 xen/include/xen/sched.h            |  4 ++++
 13 files changed, 50 insertions(+), 49 deletions(-)

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
index 98f5dab35e83..1efddc60ef0a 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1772,15 +1772,15 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
     BUG_ON(d->vcpu[0] == NULL);
     BUG_ON(v->is_initialised);
 
-#ifdef CONFIG_ARM_64
+#ifdef CONFIG_HAS_DOMAIN_TYPE
     /* if aarch32 mode is not supported at EL1 do not allow 32-bit domain */
-    if ( !(cpu_has_el1_32) && kinfo->arch.type == DOMAIN_32BIT )
+    if ( !cpu_has_el1_32 && (kinfo->type == DOMAIN_32BIT) )
     {
         printk("Platform does not support 32-bit domain\n");
         return -EINVAL;
     }
 
-    if ( is_sve_domain(d) && (kinfo->arch.type == DOMAIN_32BIT) )
+    if ( is_sve_domain(d) && (kinfo->type == DOMAIN_32BIT) )
     {
         printk("SVE is not available for 32-bit domain\n");
         return -EINVAL;
@@ -1894,10 +1894,8 @@ int __init construct_hwdom(struct kernel_info *kinfo,
 
     iommu_hwdom_init(d);
 
-#ifdef CONFIG_ARM_64
-    /* type must be set before allocate_memory */
-    d->arch.type = kinfo->arch.type;
-#endif
+    set_domain_type(d, kinfo);
+
     find_gnttab_region(d, kinfo);
     if ( is_domain_direct_mapped(d) )
         allocate_memory_11(d, kinfo);
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
index 3c613cdb233f..a5554714cd7b 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -100,8 +100,8 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     const struct membanks *mem = kernel_info_get_mem(info);
     paddr_t load_addr;
 
-#ifdef CONFIG_ARM_64
-    if ( (info->arch.type == DOMAIN_64BIT) && (info->image.start == 0) )
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
         return mem->bank[0].start + info->image.text_offset;
 #endif
 
@@ -268,14 +268,14 @@ int __init kernel_uimage_probe(struct kernel_info *info,
 
     info->load = kernel_zimage_load;
 
-#ifdef CONFIG_ARM_64
+#ifdef CONFIG_HAS_DOMAIN_TYPE
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
@@ -396,8 +396,8 @@ static int __init kernel_zimage32_probe(struct kernel_info *info,
 
     info->load = kernel_zimage_load;
 
-#ifdef CONFIG_ARM_64
-    info->arch.type = DOMAIN_32BIT;
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+    info->type = DOMAIN_32BIT;
 #endif
 
     return 0;
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0a20aa0a1249..ab62e9b07546 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -29,6 +29,9 @@ config DOM0LESS_BOOT
 config DOMAIN_BUILD_HELPERS
 	bool
 
+config HAS_DOMAIN_TYPE
+	bool
+
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y
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
index 93c0fd00c1d7..fcb6dc136517 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -13,6 +13,19 @@ struct guest_area {
     void *map;
 };
 
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+enum __packed domain_type {
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
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index b7f6b1fc36a9..6ad9e8fd1642 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -7,6 +7,7 @@
 #include <xen/device_tree.h>
 #include <xen/fdt-kernel.h>
 #include <xen/mm.h>
+#include <xen/sched.h>
 #include <xen/types.h>
 
 struct domain;
@@ -69,6 +70,14 @@ static inline uint32_t alloc_phandle(struct kernel_info *kinfo)
     return kinfo->next_phandle >= GUEST_PHANDLE_GIC ? 0 : kinfo->next_phandle++;
 }
 
+static inline void set_domain_type(struct domain *d, struct kernel_info *kinfo)
+{
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+    /* Type must be set before allocate memory */
+    d->type = kinfo->type;
+#endif
+}
+
 #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
 
 /*
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 438adfe3855b..8bcc9471814b 100644
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
index 212c7d765c3e..00db1da12f21 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -386,6 +386,10 @@ struct domain
 {
     domid_t          domain_id;
 
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+    enum domain_type type;
+#endif
+
     unsigned int     max_vcpus;
 
     uint64_t         unique_id;       /* Unique domain identifier */
-- 
2.53.0


