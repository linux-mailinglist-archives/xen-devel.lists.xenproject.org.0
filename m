Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288DCFEDE6
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196894.1514611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWPK-0000Ch-5H; Wed, 07 Jan 2026 16:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196894.1514611; Wed, 07 Jan 2026 16:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWPK-00008y-0B; Wed, 07 Jan 2026 16:29:14 +0000
Received: by outflank-mailman (input) for mailman id 1196894;
 Wed, 07 Jan 2026 16:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufZv=7M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vdWPI-0008M3-D0
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:29:12 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fea318b0-ebe5-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 17:29:10 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so391631766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 08:29:10 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a2bcd30sm564782166b.28.2026.01.07.08.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 08:29:08 -0800 (PST)
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
X-Inumbo-ID: fea318b0-ebe5-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803349; x=1768408149; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yGW8UvBWmtvRdmMTk+NgZys8X+oT8jZSBJlqpDXUFw=;
        b=ARZ5r4E6cU2X/Nw56kGZwi8J6GwKxcfe8Pl/4hNP+w81GBvEiGZi6OiJQCARmOjcV0
         tLxDpNogtYY2Rb4DhgeU3dAJcX4GHTPq7ujJhAvx8WAn8o5LlxnGHdS25zFziplzWhcm
         QW0DuAsXt8hxmUroLxCOOb95HlHhKx++QC3OOYkLfPKvD4SKHOzCHD0NXr2DJFk7eNyt
         w5y9iG1Zv9W2jfKZM9RwjBO+mfrBvJaHdL1ZlfU1yBU+Hs72eYa5hsuJIuCE1u1Z1NlL
         gEt/2o7+zMtwaUSnx87WmPJU3o5oVq1CPyfMsM3STedgMWilev2MmA/WSiNQ+sHs4g/l
         AmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803349; x=1768408149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6yGW8UvBWmtvRdmMTk+NgZys8X+oT8jZSBJlqpDXUFw=;
        b=Tgsyder+QkfcaYKT3wJisjHqYTQxeCb+TH9Xf88lSQ43hpgJe8S1GvXfW22mHiOmeM
         YHymul01kX6RRYHAdS88Zy3df9k0Rp0G5lZKhcH+1+IBPacuzoFSjgU7AmycewFCwT6S
         QZj6yJPASkCVX/QE91w4QqYFbEWQlesvClhf6Iq0fXjenlAIiEsPWGsoI/Rmg0+IX9gd
         t/xMZpSKH1D7hL9joiOPKwP8G2cgHKqZZRmmanyE95rPaaGKyNkmaYV/9ArQf03wmwd6
         xFkB9txX3UjPwFCeSJZ3gU4LYGYD+VzzGEtMd9p2na6xs0a0HAKWVXzUVTvZV0V9g6/E
         olFQ==
X-Gm-Message-State: AOJu0YwF8fjmBepT27uWCsgQ0ZQNKZsN1do9eqj3v2jwdhpnjKf4a8O+
	qdadKFCS57aIN97who9XuV2EsHg7Ng81BOiXWZY9kdO8wjdvXt7/DIAKhLT/Zw==
X-Gm-Gg: AY/fxX5IDcSY9hEo3n9a0ogxuM7PzDDrHe9yaPDFE2A7QgQsBI7jvDRLRKW2J0on0R2
	YMIkHeFWxmUdR4d2z43JxKmIMyCqIoLeZcNPlX1AIEMCliGwNPmv4xSrPEcQcfRXV40tyXGLYG0
	RGzdpJ7WeQ5IY4b15z3aYSu3EeJYCo4Q2v9UIk0qXaYHc/9kU72LEBKWBeTrXmEcKGATGuuw5eE
	CuIJmXY5oEFOhFrhufYMP4X3IgbbSH4KEqGD9sXlwzrex7AiI2A05a0a0THK3Szusm8IZ1j6hP4
	dUwq7PzqB3WST27jr6o+Muz9wH4apK+jqE2J7KQUU+AFopA9Z/YWEzlgORk76QdEjtLuMZOXEtW
	DkgbrPYjBM1kZUS9fL7i8Q7K5l9dSh7VwwGZxDNl2Z4iqQUxjY7oHX7QsG5e2cza/GNsOm46KeX
	Kl3OwXVPK5HBo0agq8m8ASi2Equca6VsdIw/Ywf2rgpPX2RLSrZPBwcw==
X-Google-Smtp-Source: AGHT+IEq88HKeF95MEbRuBUFDBYiow8dR/PBcpgnTLj2uRlUaT1D0eK33Qc4TlRDaA6RmFlJ4mBmzw==
X-Received: by 2002:a17:906:7955:b0:b7a:1bde:1221 with SMTP id a640c23a62f3a-b84451a792cmr313554766b.62.1767803349173;
        Wed, 07 Jan 2026 08:29:09 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 1/3] xen/arm: optimize the size of struct vcpu
Date: Wed,  7 Jan 2026 17:28:58 +0100
Message-ID: <1d7f2183bd01df92445bf37ddc9d41f8bfa0ccdb.1767803084.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1767803084.git.oleksii.kurochko@gmail.com>
References: <cover.1767803084.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_NEW_VGIC=y and CONFIG_ARM_64=y, the size of struct vcpu
exceeds one page, which requires allocating two pages and led to the
introduction of MAX_PAGES_PER_VCPU.

To remove the need for MAX_PAGES_PER_VCPU, the vgic member of NEW_VGIC's
struct vgic_cpu member private_irqs is changed to a pointer to struct
vgic_irq.
As a result, the size of struct vcpu for Arm64 is reduced to 2176 bytes
in the case when CONFIG_ARM_64=y and CONFIG_NEW_VGIC=y, compared to 3840
bytes (without these changes and with CONFIG_ARM_64=y) and 4736 bytes
(without these changes and with both CONFIG_ARM_64=y and CONFIG_NEW_VGIC=y).
Note that all numbers are based on defconfig with the mentioned options
enabled or disabled as specified.

Since the private_irqs member is now a pointer, vcpu_vgic_init() and
vcpu_vgic_free() are updated to allocate and free private_irqs instance.

As struct vcpu now fits into one page, drop MAX_PAGES_PER_VCPU.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Michal gave his:
  Acked-by: Michal Orzel <michal.orzel@amd.com>
But wrote to MAX_PAGES_PER_VCPU in this patch, so probably he would
like to look at how it was done.
---
Change in v5:
 - Correct the commit message:
   - s/vgic_vcpu/vgic_cpu/
   - s/private_irq/private_irqs/
 - Drop MAX_PAGES_PER_VCPU.
---
Change in v4:
 - Add Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>.
---
Changes in v3:
 - Make private_irqs member as pointer to vgic_irq in struct vgic_cpu
   of new_vgic instead of vgic member of arch_vcpu.
---
Changes in v2:
 - New patch.
---
 xen/arch/arm/domain.c               | 23 ++++-------------------
 xen/arch/arm/include/asm/new_vgic.h |  2 +-
 xen/arch/arm/vgic/vgic-init.c       |  7 +++++++
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 47973f99d935..64b935b68000 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -473,36 +473,21 @@ void dump_pageframe_info(struct domain *d)
 
 }
 
-/*
- * The new VGIC has a bigger per-IRQ structure, so we need more than one
- * page on ARM64. Cowardly increase the limit in this case.
- */
-#if defined(CONFIG_NEW_VGIC) && defined(CONFIG_ARM_64)
-#define MAX_PAGES_PER_VCPU  2
-#else
-#define MAX_PAGES_PER_VCPU  1
-#endif
-
 struct vcpu *alloc_vcpu_struct(const struct domain *d)
 {
     struct vcpu *v;
 
-    BUILD_BUG_ON(sizeof(*v) > MAX_PAGES_PER_VCPU * PAGE_SIZE);
-    v = alloc_xenheap_pages(get_order_from_bytes(sizeof(*v)), 0);
+    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
+    v = alloc_xenheap_page();
     if ( v != NULL )
-    {
-        unsigned int i;
-
-        for ( i = 0; i < DIV_ROUND_UP(sizeof(*v), PAGE_SIZE); i++ )
-            clear_page((void *)v + i * PAGE_SIZE);
-    }
+        clear_page(v);
 
     return v;
 }
 
 void free_vcpu_struct(struct vcpu *v)
 {
-    free_xenheap_pages(v, get_order_from_bytes(sizeof(*v)));
+    free_xenheap_page(v);
 }
 
 int arch_vcpu_create(struct vcpu *v)
diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
index 1e762138939f..6f7af0e02b2b 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -155,7 +155,7 @@ struct vgic_dist {
 };
 
 struct vgic_cpu {
-    struct vgic_irq private_irqs[VGIC_NR_PRIVATE_IRQS];
+    struct vgic_irq *private_irqs;
 
     struct list_head ap_list_head;
     spinlock_t ap_list_lock;    /* Protects the ap_list */
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index aef526f2e717..4eb49d922492 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -202,6 +202,11 @@ int vcpu_vgic_init(struct vcpu *v)
 {
     int ret = 0;
 
+    v->arch.vgic.private_irqs =
+        xzalloc_array(struct vgic_irq, VGIC_NR_PRIVATE_IRQS);
+    if ( !v->arch.vgic.private_irqs )
+        return -ENOMEM;
+
     vgic_vcpu_early_init(v);
 
     if ( gic_hw_version() == GIC_V2 )
@@ -244,6 +249,8 @@ void vcpu_vgic_free(struct vcpu *v)
     struct vgic_cpu *vgic_cpu = &v->arch.vgic;
 
     INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
+
+    XFREE(v->arch.vgic.private_irqs);
 }
 
 /*
-- 
2.52.0


