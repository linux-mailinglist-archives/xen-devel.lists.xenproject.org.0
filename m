Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517B0A0595D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 12:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867136.1278598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU01-0002AI-UE; Wed, 08 Jan 2025 11:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867136.1278598; Wed, 08 Jan 2025 11:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU01-00028F-Qv; Wed, 08 Jan 2025 11:13:21 +0000
Received: by outflank-mailman (input) for mailman id 867136;
 Wed, 08 Jan 2025 11:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoWX=UA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVU01-0001BZ-5j
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 11:13:21 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 917c0209-cdb1-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 12:13:20 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3035046d4bfso149705381fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 03:13:20 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d11sm67292171fa.33.2025.01.08.03.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 03:13:19 -0800 (PST)
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
X-Inumbo-ID: 917c0209-cdb1-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736334800; x=1736939600; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjG9qId5djE3f1micVajTt9P6Qgh0I5fxUYbZTHiv9Q=;
        b=EP9OCOuGshgHmlld/dgJN6uhHb/oW/6akMqbSjJrRhIJihGQrkVIldLiZcBxmS/Zf4
         zUKA9JPxNgYwRk9IMejZPpGu96ZdnvKvGSUi0C+s+OqsnP68ktDuIGITKnwRkoTX1ixl
         +Za5Hy9BcOU9gJB4B258pEH6OZy8c2ivXR732is2IM3w6h6gFspJWFSEwRhZLcjEuhNJ
         eosfwpe2EJKrHxqXDGPOsNO91pchxRB+0WOabp/kqfPypSO9iy8WsCob7S+7XJ/mZwTN
         ONmWgO4ccF1MBob4T5yMqFms5JFt/ImnLOOfI9hCoBAbjiBjYwPEDfsOWw51uQDDSPU/
         NWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736334800; x=1736939600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjG9qId5djE3f1micVajTt9P6Qgh0I5fxUYbZTHiv9Q=;
        b=nTIVU9w+Wz8BKZ6ogpTovIjWELRf1LDjhQL+vEANv0JxIhnEK8KDOoxwDh/j8Q024R
         fKvpAnqy5iALxahYgR4K1yl4Cd7Iwg+Zlm/gEPXlSmmgBYaFH5Ty1zFohvHh82bUK4OW
         qqHKwWsOSTDUv9MtM7nlPkda/VJakmmsj0pebC8YlEIEWI5Jb98Xl/6UnPD51WpUsZ/I
         MYISpDW0tn3Jlwyvf6tyEtZeYOK2gI7sMdFVGRWywxQi81WzfykSYjvHNA2B/EZCTLu6
         IBpSWO0mLb2qhqnCgU4hqnzzbY+QaUaSW7YSbxWWNc5ClF69eOLfqK1RVf30pBvIqF+V
         I6Nw==
X-Gm-Message-State: AOJu0Yynp0O7qwuihnQrVco+7WbFiIRGQfmGIHvZ86GKzrYLN3qlaQwm
	R+eg/OB4pZhx1ALovcZcoJG71xA0LifXZSCu9RrgSAWqQuF3ud/y08VbG/om
X-Gm-Gg: ASbGncu2bi9gz54ThRfcWBFhP/MM2sPmSnR0gYNRilDCeQX7+oH8jYWtWHlAlzovujv
	wxOEVzXkFGpGVbh1CgSebDWGzjYlvoUDjosdY9NbCrxY7rtk8gvsJf8SYEwqZOo38f3z5eoskrX
	wBpCBNdWRMUW+h06WevRjPSV6QcJXeLECDKO2QFnxL9G1yqagSJzQ4AHt50YswwnS8+DYSy9mh3
	DBmuhowhmOrd1z4WzuFCM3AuIRdfnBT7Ljc9THNgllvOQBFOJEt2SmJXw==
X-Google-Smtp-Source: AGHT+IGWZrRhrHrT3ZUdadlaUlf3iZdqOIAZklSUrdQWysRk2Agd0ISiTq6rO/0UhBn0Dzv/8rhd6w==
X-Received: by 2002:a2e:a9a8:0:b0:300:324e:3506 with SMTP id 38308e7fff4ca-305f4575d06mr5892931fa.13.1736334799722;
        Wed, 08 Jan 2025 03:13:19 -0800 (PST)
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
Subject: [PATCH v1 6/9] asm-generic: move some parts of Arm's domain_build.h to asm-generic header
Date: Wed,  8 Jan 2025 12:13:08 +0100
Message-ID: <ba3cde730ae072ba1088e396dd7d03482e4c4011.1736334615.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736334615.git.oleksii.kurochko@gmail.com>
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing changed. Only some functions declaration are moved to asm-generic
header as they are expected to be used by common code of domain builing or
dom0less.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/include/asm/domain_build.h | 19 ++----------
 xen/include/asm-generic/domain-build.h  | 41 +++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 17 deletions(-)
 create mode 100644 xen/include/asm-generic/domain-build.h

diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 5d77af2e8b..ad5a3ddc37 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -4,28 +4,13 @@
 #include <xen/sched.h>
 #include <asm/kernel.h>
 
+#include <asm-generic/domain-build.h>
+
 typedef __be32 gic_interrupt_t[3];
-typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
-                                     unsigned int order, void *extra);
-bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
-                             alloc_domheap_mem_cb cb, void *extra);
-bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
-                          paddr_t tot_size);
-void allocate_memory(struct domain *d, struct kernel_info *kinfo);
-int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
-int make_chosen_node(const struct kernel_info *kinfo);
-int make_cpus_node(const struct domain *d, void *fdt);
-int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
-                         int addrcells, int sizecells);
-int make_memory_node(const struct kernel_info *kinfo, int addrcells,
-                     int sizecells, const struct membanks *mem);
 int make_psci_node(void *fdt);
-int make_timer_node(const struct kernel_info *kinfo);
 void evtchn_allocate(struct domain *d);
 
-unsigned int get_allocation_size(paddr_t size);
-
 /*
  * handle_device_interrupts retrieves the interrupts configuration from
  * a device tree node and maps those interrupts to the target domain.
diff --git a/xen/include/asm-generic/domain-build.h b/xen/include/asm-generic/domain-build.h
new file mode 100644
index 0000000000..237f94d0c3
--- /dev/null
+++ b/xen/include/asm-generic/domain-build.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DOMAIN_BUILD_H__
+#define __ASM_GENERIC_DOMAIN_BUILD_H__
+
+#include <xen/types.h>
+
+struct domain;
+struct page_info;
+struct kernel_info;
+struct membanks;
+
+typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
+                                     unsigned int order, void *extra);
+bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
+                             alloc_domheap_mem_cb cb, void *extra);
+
+bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
+                          paddr_t tot_size);
+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
+int construct_domain(struct domain *d, struct kernel_info *kinfo);
+int make_chosen_node(const struct kernel_info *kinfo);
+int make_cpus_node(const struct domain *d, void *fdt);
+int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
+                         int addrcells, int sizecells);
+int make_memory_node(const struct kernel_info *kinfo, int addrcells,
+                     int sizecells, const struct membanks *mem);
+int make_timer_node(const struct kernel_info *kinfo);
+
+unsigned int get_allocation_size(paddr_t size);
+
+
+#endif /* __ASM_GENERIC_DOMAIN_BUILD_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.47.1


