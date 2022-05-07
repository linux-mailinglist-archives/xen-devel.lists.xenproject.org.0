Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C8451E929
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 20:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323758.545607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1d-0007TO-9D; Sat, 07 May 2022 18:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323758.545607; Sat, 07 May 2022 18:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1d-0007Kh-2d; Sat, 07 May 2022 18:19:29 +0000
Received: by outflank-mailman (input) for mailman id 323758;
 Sat, 07 May 2022 18:19:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y6lb=VP=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nnP1b-00079i-PL
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 18:19:27 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a2ff787-ce32-11ec-8fc4-03012f2f19d4;
 Sat, 07 May 2022 20:19:26 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 125-20020a1c1983000000b003941f354c62so6139733wmz.0
 for <xen-devel@lists.xenproject.org>; Sat, 07 May 2022 11:19:26 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4d8a000000b0020c5253d8f3sm8198457wru.63.2022.05.07.11.19.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 May 2022 11:19:24 -0700 (PDT)
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
X-Inumbo-ID: 3a2ff787-ce32-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7ptoks8wk67ER3ivOLNGqLnlrp2ieijG6XsCJH8U+xs=;
        b=d0kYK2iQ+DUSxY8TIV5wRNyHPklomH/v8OiDA4avtHKXjmkp4Zp1juytfZVUe5R9jw
         6iI1z703N161/p94YTEgZzBvV9tNZtwPoy1WZ99vf+cAGadEz6RqANGY9FVDwr2m9bcl
         Vq7ONdNVKafzqy9lZM8s8n4nvRB9ora+yUZoAt2GW5V39j3rxHySpA1Bl9hCr6EfO8wr
         wcE7f5iYJhMtLTBFXVXiEc4fKvgbgVfEgQsPHaAzdWDsIo3wWtkzNdw3r6VK/JIMDzna
         jKGEcTMofqI63n2NHbaC2hXBtSEP29EI9mF7SGOUoo5t1apStnAP1DkfYc+vLXvc6o9J
         31OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7ptoks8wk67ER3ivOLNGqLnlrp2ieijG6XsCJH8U+xs=;
        b=qc4hcwkvrlIVkWPqgkZGhfV32e8c/kay79SVXhB3SZF+G+yk8CP+uaR7pAwNzRHIDK
         Jm5WwBFUSSMPM/ojNbwQW7kShxwJI/qKW57IjgZ0pAn0l2EBGfGb+vk09bTZtlXdgOIE
         W5qSXu6YYuM+7xsTtOusKTsMiDp3OKlGnxIydqt2zHaBYU0VJmWr7+H4nyuJ/H5xq7fZ
         cbPUAdgEyL2Wx2vqsOjCoh7WcIb+7SrHhdoi+nJ/NGBZcsaHcRfP5eKu0n+yHcjUsOWT
         icD9+Xz67EpDT9H5pY407EIPEbf3JDVDm7/UZpW3/MP2LNwQOnZSayGMY3wqAw3akBla
         mtCA==
X-Gm-Message-State: AOAM532D0WV+uDK4SbYssZ/6XhaDBM/k5NtLXzEVXqVxPKC6s8D1QxhI
	eeWSVZXjYY55qD+i0HUqyxHHeR0m3tI=
X-Google-Smtp-Source: ABdhPJzE5bIacIcwrc1M6w7qJQB9mFgFaaKn933CxgAcdM1oZCHeWaRYPU3HEcjcxuQeVC7j1yiIqw==
X-Received: by 2002:a05:600c:3393:b0:394:160a:18aa with SMTP id o19-20020a05600c339300b00394160a18aamr15602115wmp.58.1651947565193;
        Sat, 07 May 2022 11:19:25 -0700 (PDT)
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
Subject: [PATCH V2 4/7] xen/virtio: Enable restricted memory access using Xen grant mappings
Date: Sat,  7 May 2022 21:19:05 +0300
Message-Id: <1651947548-4055-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>

From: Juergen Gross <jgross@suse.com>

In order to support virtio in Xen guests add a config option XEN_VIRTIO
enabling the user to specify whether in all Xen guests virtio should
be able to access memory via Xen grant mappings only on the host side.

Also set PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS feature from the guest
initialization code on Arm and x86 if CONFIG_XEN_VIRTIO is enabled.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes V1 -> V2:
   - new patch, split required changes from commit:
    "[PATCH V1 3/6] xen/virtio: Add option to restrict memory access under Xen"
   - rework according to new platform_has() infrastructure
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
index 5038edb..fcd5d5d 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -109,6 +109,8 @@ static DEFINE_PER_CPU(struct tls_descs, shadow_tls_desc);
 
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


