Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DB853886D
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 23:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338747.563585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmV7-0007vM-8P; Mon, 30 May 2022 21:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338747.563585; Mon, 30 May 2022 21:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmV6-0007kO-Vu; Mon, 30 May 2022 21:00:32 +0000
Received: by outflank-mailman (input) for mailman id 338747;
 Mon, 30 May 2022 21:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pxv1=WG=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nvmV5-0007Kr-Bt
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 21:00:31 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a11f7ee-e05b-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 23:00:30 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id y32so18499569lfa.6
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 14:00:30 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a2ea275000000b0025550e2693asm581541ljm.38.2022.05.30.14.00.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 May 2022 14:00:29 -0700 (PDT)
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
X-Inumbo-ID: 8a11f7ee-e05b-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lW0Pzr6bA3fYtV1xJl8AeDQlMEnR60yW2//eH29vCxE=;
        b=dYVzMiNPLwEXkptKECpn5hcp6De3x3lUTo4ciWbKYGPqQkIveiVsSkLh+lm9XNk8OO
         yAr8NmkDNELrM/63UlINwvrxPLx+QCa8OxL10AORjrhke2k4eDiY7gC3JYaMgp0wo+sO
         /AFN96MvSkkvfDQ0gZ1vrbdJqZ0qSnbL9PmHpuugdoiwPHT+0SUItW/CwiKf2KGqM069
         /DcWc96cbRY1d7tl+GgQ9Dn/NQuhq6hzc0idRTFkuI2ktSQUrk/qbsY6FglCgvJw1aY6
         PhLVWMRL9Be3A/jl8PKTry4t7RUU8EE1LoMZWkD1cvciSdy6l4nUZyucDoho0BczJ802
         0Vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lW0Pzr6bA3fYtV1xJl8AeDQlMEnR60yW2//eH29vCxE=;
        b=yA0cqf8Zg4eeRjJK8ZVORnDBF0dm1sn2rE/TdfCj6J/N4oRL6IVfpCDuTfctp0N0wx
         reFiC0GNqrBcJ7xepTcBVjU0VbM7TsRxiNqrO2NXMsl9SzsYrAc5mdVFvdzCIhIm5OY3
         jj6roKTnP0NsO3rFA+ssaEe5U1zZE2HWYNeYpjr7pCffXZos55PrjW8FaKLdHLrj8Hxt
         CBoFN1sRCvDfphrK5hBiUvEiX/zt1UWNyiaO7rejU3pBInCJAjsLyzIL+CUtksd2hxWJ
         PbXexjhR19qX8B5Jn8x2bxmHA5bEGkrh4y5G9xE0mgRHcOSh1BiZAQKLJ0oadn3cVqjb
         25mQ==
X-Gm-Message-State: AOAM5301dzKbn8bE4EO0rfnNKeMntJkGyFAGaOmIGAgdPETAm+UdcQqw
	2t2JSFSF8mf0o6c67gLDPq8he00TA9A=
X-Google-Smtp-Source: ABdhPJxBfcqMRHWX1lLOCfyubtXqqMjUSE+CHfX2MUUOYQPe/E98Wa9P4vwWYUQD0/M3EcTqNr0EBQ==
X-Received: by 2002:a05:6512:2520:b0:478:7f50:b011 with SMTP id be32-20020a056512252000b004787f50b011mr27488605lfb.72.1653944429968;
        Mon, 30 May 2022 14:00:29 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Julien Grall <julien@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: [PATCH V3 4/8] xen/virtio: Enable restricted memory access using Xen grant mappings
Date: Tue, 31 May 2022 00:00:13 +0300
Message-Id: <1653944417-17168-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>
References: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>

From: Juergen Gross <jgross@suse.com>

In order to support virtio in Xen guests add a config option XEN_VIRTIO
enabling the user to specify whether in all Xen guests virtio should
be able to access memory via Xen grant mappings only on the host side.

Also set PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS feature from the guest
initialization code on Arm and x86 if CONFIG_XEN_VIRTIO is enabled.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes V1 -> V2:
   - new patch, split required changes from commit:
    "[PATCH V1 3/6] xen/virtio: Add option to restrict memory access under Xen"
   - rework according to new platform_has() infrastructure

Changes V2 -> V3:
   - add Stefano's R-b
---
 arch/arm/xen/enlighten.c     |  2 ++
 arch/x86/xen/enlighten_hvm.c |  2 ++
 arch/x86/xen/enlighten_pv.c  |  2 ++
 drivers/xen/Kconfig          | 11 +++++++++++
 include/xen/xen.h            |  8 ++++++++
 5 files changed, 25 insertions(+)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 07eb69f..1f9c3ba 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -443,6 +443,8 @@ static int __init xen_guest_init(void)
 	if (!xen_domain())
 		return 0;
 
+	xen_set_restricted_virtio_memory_access();
+
 	if (!acpi_disabled)
 		xen_acpi_guest_init();
 	else
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 517a9d8..8b71b1d 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -195,6 +195,8 @@ static void __init xen_hvm_guest_init(void)
 	if (xen_pv_domain())
 		return;
 
+	xen_set_restricted_virtio_memory_access();
+
 	init_hvm_pv_info();
 
 	reserve_shared_info();
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index ca85d14..30d24fe 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -108,6 +108,8 @@ static DEFINE_PER_CPU(struct tls_descs, shadow_tls_desc);
 
 static void __init xen_pv_init_platform(void)
 {
+	xen_set_restricted_virtio_memory_access();
+
 	populate_extra_pte(fix_to_virt(FIX_PARAVIRT_BOOTMAP));
 
 	set_fixmap(FIX_PARAVIRT_BOOTMAP, xen_start_info->shared_info);
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 313a9127..a7bd8ce 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -339,4 +339,15 @@ config XEN_GRANT_DMA_OPS
 	bool
 	select DMA_OPS
 
+config XEN_VIRTIO
+	bool "Xen virtio support"
+	depends on VIRTIO
+	select XEN_GRANT_DMA_OPS
+	help
+	  Enable virtio support for running as Xen guest. Depending on the
+	  guest type this will require special support on the backend side
+	  (qemu or kernel, depending on the virtio device types used).
+
+	  If in doubt, say n.
+
 endmenu
diff --git a/include/xen/xen.h b/include/xen/xen.h
index a99bab8..0780a81 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -52,6 +52,14 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
 extern u64 xen_saved_max_mem_size;
 #endif
 
+#include <linux/platform-feature.h>
+
+static inline void xen_set_restricted_virtio_memory_access(void)
+{
+	if (IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain())
+		platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
+}
+
 #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
 int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
 void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
-- 
2.7.4


