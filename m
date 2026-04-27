Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL3bBSGC72nmBwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:34:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BADDF47544C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295028.1571749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNyr-0005OB-3C; Mon, 27 Apr 2026 15:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295028.1571749; Mon, 27 Apr 2026 15:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNyq-0005LF-V5; Mon, 27 Apr 2026 15:34:40 +0000
Received: by outflank-mailman (input) for mailman id 1295028;
 Mon, 27 Apr 2026 15:34:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHNyp-0004sz-IL
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:34:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHNyo-00GEYf-V8
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:34:38 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ef8201-bab6-0a2a0a5309dd-0a2a4506eb28-18
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:34:38 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ef820e-7371-0a2a45060019-d155802ab08e-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:34:38 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-483487335c2so102261365e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 08:34:38 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c0354sm737076355e9.11.2026.04.27.08.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 08:34:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777304078; x=1777908878; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqFH3ZM0YOXaw4rO6uZDoJyrUUgd988+AjZxylZcJqk=;
        b=hG4hcAXjKDtekz+7N3uQKjRhGgPIXx2Q048Huem2LkP5l0nKZmVCLQ/FIym7iOTqc1
         wv1pnBrbikxQdhMTVKFi4wBB7vTvkXacDWiN9jYrFq6SxR4O9bq5Uopx0nR5QkjdPj6W
         8+95iYBVyf1CTDN8qXhLNXgYVySLSCIBPPNTrSHw7WNYg/aCGVTW/faqAqqlB0gO7BSj
         KiIIzZphk5Ednm9IKUjLuInAPdzIf3rmbem8oZQOymWPayTdSsXZ+el6YpVzeC3o6J3M
         4nEjbFuhaUxV8iXn7C4RF72EkPMMUuLszZAz26Ea5O1WKDGzQN/Qa5oGG1cR4uhHugx1
         BUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304078; x=1777908878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqFH3ZM0YOXaw4rO6uZDoJyrUUgd988+AjZxylZcJqk=;
        b=gLlywsGtMp6nyAh7B63xvCHgpvlmlA9sgfsuvreLQDz0fsn0MXCSy3eTsqgNNI09Ut
         /R23XCufL/3lEi8JvotJ0/ejRFZVPT9AA89ZekN2Q5wFnaQnZ6NPnOg7hELFjncpfHKT
         evFENNWIn4G89Ixa+9XVVtYspEfaopfyVNnHWRO53DCAkUvatrvgfmlbiYYFSme75N8n
         DeYLCoK6iH29ZLh6QSemvQLJrzdFEzYdcpKBPfkyWlekZ39Yz22LKwo0dTnNaDv/aNxk
         kWLiiT6ecBu0yji+RGNjMpGUs6C2o2cGomcWczhrqZ9bWjP4RJChl/GytSuak5bCs44m
         ByWQ==
X-Gm-Message-State: AOJu0Yxw92QgSwDA45dnGzV3jLU25Ja084/XuwJnarGdYXC6TfESpV8s
	f2u3YFlQ0p0jAxRnY6bgAKruqL1hwI3fs2O0WkFSE9yJVesJGcnrEgfxlH8H6A==
X-Gm-Gg: AeBDiet9CauMc8E6uxXj5IJlTr1j6Fv45PDDr4HX3XOJu6XkSj4msXjnHkMQLaools9
	yyvUs3ouQlMbRLk/kgfj/wURoOJfrJVHke/IRs8fGXQj+WqECsI05qM6FP6HAD8FTKJOPbbfRr4
	a5tkPWDaVfxZah/CZKhlvN+uUXJLZPB5xJ10htwKDGkgSPZWvw8en7gy60BfZnYStUAWd66MI2m
	8tgzb/AZnuKPUC0AHCgIvBKa3ZrZJwnWBRimuRI8VxcDdu15d/WFPzDeWEuXyHgUSdEhN9J/H/h
	Chto9nAe1DeJ0ymfUVjhSvTvbY54VZ0KfID9PoddI8EO+4N0LMwRCZgavzv7xdqQUOPKefHmlaI
	SuWypz8tlazz+fwgauIOZbTZ9hVL4rAzhgHk9deBNKu6tZ2HYJwhZUPo0dWqT/PMVPOSU6yooom
	Fx32W4WcV3kzZTKcydVGSnTsz9mwabUwHbdtoAolSc5nfy3W6MFXSGpJJL+7d7ntzf3tBK5l5A7
	mMx
X-Received: by 2002:a05:600c:c177:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-488fb78129emr551476665e9.20.1777304077912;
        Mon, 27 Apr 2026 08:34:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
Date: Mon, 27 Apr 2026 17:34:25 +0200
Message-ID: <7c91e1a705e1046be4af1c5671a8d91cf3557013.1777296786.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777296786.git.oleksii.kurochko@gmail.com>
References: <cover.1777296786.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1777304078-5156ED75-0A6DE078/10/73395122804
X-purgate-type: spam
X-purgate-size: 11569
X-Rspamd-Queue-Id: BADDF47544C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v4:
 - Drop enum domain_type type; from Arm's struct arch_domain.
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
---
Changes in v3:
 - Sort properly HAS_DOMAIN_TYPE in xen/common/Kconfig.
 - Update the comment above is_*bit_domain() macros.
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
 xen/arch/arm/include/asm/domain.h  | 16 ----------------
 xen/arch/arm/include/asm/kernel.h  |  4 ----
 xen/arch/arm/kernel.c              | 16 ++++++++--------
 xen/common/Kconfig                 |  3 +++
 xen/include/xen/dom0less-build.h   |  2 --
 xen/include/xen/domain.h           | 13 +++++++++++++
 xen/include/xen/fdt-domain-build.h |  9 +++++++++
 xen/include/xen/fdt-kernel.h       |  5 +++++
 xen/include/xen/sched.h            |  4 ++++
 13 files changed, 50 insertions(+), 53 deletions(-)

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
index a3ff70102376..ad665cd3c045 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1771,15 +1771,15 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
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
@@ -1893,10 +1893,8 @@ int __init construct_hwdom(struct kernel_info *kinfo,
 
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
index ffe5d0d9f0a6..b24f02d269be 100644
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
 /*
  * Is the domain using the host memory layout?
  *
@@ -62,10 +50,6 @@ struct paging_domain {
 
 struct arch_domain
 {
-#ifdef CONFIG_ARM_64
-    enum domain_type type;
-#endif
-
 #ifdef CONFIG_ARM64_SVE
     /* max SVE encoded vector length */
     uint8_t sve_vl;
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
index 7544fd50a20f..9395b5af8745 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -100,8 +100,8 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     const struct membanks *mem = kernel_info_get_mem(info);
     paddr_t load_addr;
 
-#ifdef CONFIG_ARM_64
-    if ( (info->arch.type == DOMAIN_64BIT) && (info->zimage.start == 0) )
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
         return mem->bank[0].start + info->zimage.text_offset;
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
index 0a20aa0a1249..5ff71480eebe 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -128,6 +128,9 @@ config HAS_DEVICE_TREE_DISCOVERY
 config HAS_DOM0LESS
 	bool
 
+config HAS_DOMAIN_TYPE
+	bool
+
 config HAS_DIT # Data Independent Timing
 	bool
 
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
index 93c0fd00c1d7..8c898afe74fc 100644
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
+/* At the moment on 32-bit-only platforms all domains are 32-bit. */
+#define is_32bit_domain(d) (true)
+#define is_64bit_domain(d) (false)
+#endif
+
 #include <asm/domain.h>
 
 typedef union {
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 0d40d8cfa105..bc7744270c8f 100644
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
index 4d0467bb396a..86a37a13048b 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -9,6 +9,7 @@
 
 #include <xen/bootinfo.h>
 #include <xen/device_tree.h>
+#include <xen/domain.h>
 #include <xen/types.h>
 
 #if __has_include(<asm/kernel.h>)
@@ -65,6 +66,10 @@ struct kernel_info {
         } zimage;
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


