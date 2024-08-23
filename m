Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1854695D975
	for <lists+xen-devel@lfdr.de>; Sat, 24 Aug 2024 01:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782737.1192247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shdH2-0001tm-Vk; Fri, 23 Aug 2024 23:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782737.1192247; Fri, 23 Aug 2024 23:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shdH2-0001s5-S3; Fri, 23 Aug 2024 23:00:52 +0000
Received: by outflank-mailman (input) for mailman id 782737;
 Fri, 23 Aug 2024 23:00:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shdH1-0001rz-Te
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 23:00:51 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89f1d7a1-61a3-11ef-8776-851b0ebba9a2;
 Sat, 24 Aug 2024 01:00:49 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5bf009cf4c0so2816532a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 16:00:49 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a4c72a7sm2600603a12.65.2024.08.23.16.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 16:00:47 -0700 (PDT)
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
X-Inumbo-ID: 89f1d7a1-61a3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724454048; x=1725058848; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fda7N1Br5ezyCfM5MwoAp8juHmekzl5QKklpSKyKJu8=;
        b=ERlfBL7Mdr8myHspr8rOTPDoR6QKsBomeT3t5EiqOKV4+Brvx9WbflHWMPxWzB/3nS
         WVgV3ZosWejLmHh5zpD4pIug/Dlg3XJdyM2XZnjLnFIENMEh+EAHGKimzYUldktjaaGx
         9gXWXUKpgW5k7ykJF+MfdMxwkKrddblhtgCyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724454048; x=1725058848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fda7N1Br5ezyCfM5MwoAp8juHmekzl5QKklpSKyKJu8=;
        b=qqYBGqeAWAIJQx7ATDV+D3YPTA53zsY1GmJ0C/3pCGEfUtHRCMi1dxPCjqvM/qtg3i
         pieGLTtCM2zhDDNL14pHmEJFRSikkB1yiD8EVw8SvRc1XPRSm5GU5b0b+CftwunC/d4H
         GZzvavBi2aQOPbT+uCwF2uRf2sChhN2QnDiqYiMOap+yJar2/uWCRXP8XbZBZ/5on/Bt
         LxOJHak1fn+Vib/KK1hWo172Nfc/QJyRiXLdcAKjZEVxDQvFvZoVqhZjaeGh7JKepzi6
         i3xq4X8VSqMChhjTWvKAzzwGPYOGBSV9nlHTJD2mhyUzEhuJG2LtzjjITeVjoaygx1S9
         A/qw==
X-Gm-Message-State: AOJu0YxeQExVvLT8F/iO7LepMZpwkEr541Y1/0IgIixPs4w3Tjhg8voO
	DcS3LwnWLNJRFwjzZrV89Y5G1SDg7R3tSv/BlCLV2Uw/b+6QAljpphBiYump8zYU3sFNQHjYodn
	9
X-Google-Smtp-Source: AGHT+IGCSjlVk2CgMvpJzo+u8GqW5WGhLP6XBUjxEWiqvo/qWerGMfxCeKRGtNIKX4FpsIUHgAUx8w==
X-Received: by 2002:a05:6402:2115:b0:5be:de37:80dc with SMTP id 4fb4d7f45d1cf-5c0891ac3b1mr2199484a12.37.1724454048154;
        Fri, 23 Aug 2024 16:00:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] ARM/vgic: Use for_each_set_bit() in vgic_check_inflight_irqs_pending()
Date: Sat, 24 Aug 2024 00:00:45 +0100
Message-Id: <20240823230045.1581050-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... which is better optimised for scalar values, rather than using the
arbitrary-sized bitmap helpers.

Additionally, unlike other vgic helpers, this takes both a domain and vcpu
pointer.  The domain parameter isn't used, and the callers pass v->domain.

Strip out the domain pointer.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/vgic.h | 2 +-
 xen/arch/arm/vgic-v2.c          | 2 +-
 xen/arch/arm/vgic-v3.c          | 2 +-
 xen/arch/arm/vgic.c             | 8 ++------
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index 79b73a0dbb58..e309dca1ad01 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -315,7 +315,7 @@ extern bool vgic_to_sgi(struct vcpu *v, register_t sgir,
                         enum gic_sgi_mode irqmode, int virq,
                         const struct sgi_target *target);
 extern bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int irq);
-extern void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
+extern void vgic_check_inflight_irqs_pending(struct vcpu *v,
                                              unsigned int rank, uint32_t r);
 
 #endif /* !CONFIG_NEW_VGIC */
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 0aa10fff0f10..a19d61017861 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -483,7 +483,7 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
         rank = vgic_rank_offset(v, 1, gicd_reg - GICD_ICPENDR, DABT_WORD);
         if ( rank == NULL ) goto write_ignore;
 
-        vgic_check_inflight_irqs_pending(v->domain, v, rank->index, r);
+        vgic_check_inflight_irqs_pending(v, rank->index, r);
 
         goto write_ignore;
 
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index cc3832770181..2eaa48fadbb0 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -820,7 +820,7 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
         rank = vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
         if ( rank == NULL ) goto write_ignore;
 
-        vgic_check_inflight_irqs_pending(v->domain, v, rank->index, r);
+        vgic_check_inflight_irqs_pending(v, rank->index, r);
 
         goto write_ignore;
 
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 905e5eeb66d4..7b54ccc7cbfa 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -720,13 +720,9 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
     }
 }
 
-void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
-                                      unsigned int rank, uint32_t r)
+void vgic_check_inflight_irqs_pending(struct vcpu *v, unsigned int rank, uint32_t r)
 {
-    const unsigned long mask = r;
-    unsigned int i;
-
-    bitmap_for_each ( i, &mask, 32 )
+    for_each_set_bit ( i, r )
     {
         struct pending_irq *p;
         struct vcpu *v_target;
-- 
2.39.2


