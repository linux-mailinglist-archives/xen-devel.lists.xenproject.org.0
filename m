Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9564BA61DEF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 22:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915448.1320972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCTe-0004b5-OX; Fri, 14 Mar 2025 21:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915448.1320972; Fri, 14 Mar 2025 21:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCTe-0004ZL-LW; Fri, 14 Mar 2025 21:21:58 +0000
Received: by outflank-mailman (input) for mailman id 915448;
 Fri, 14 Mar 2025 21:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ttCTd-0004ZE-Jo
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 21:21:57 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b7f557e-011a-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 22:21:56 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2bfcd2a70so345185166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 14:21:56 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147e9247sm272166966b.44.2025.03.14.14.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 14:21:55 -0700 (PDT)
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
X-Inumbo-ID: 5b7f557e-011a-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741987316; x=1742592116; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=le9eLA7Fx6pKm1s0fOdg5K0YAK9d2evBIjQDUHTsrMo=;
        b=IMykcxMM5OINaNAURZ1q2EshRHwMOmZpyzT0QSzpp20So9uJOHubnMs3dvKC9gAvXE
         Aj6K/xiuN43ovW5esQJlVka1I6Ya/Z6fr6vRv0iyInHiOvF5GOxCUQtRGFClSUW7G1d4
         /o9EIqjE8ilMuOduyTsUOztYHz9xpPYuY4h6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741987316; x=1742592116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=le9eLA7Fx6pKm1s0fOdg5K0YAK9d2evBIjQDUHTsrMo=;
        b=U4zFxONJB7U1NG+X20QtzB281/w5HGIo9tBwPle21G2CR2jXpreDOV6tCS8Lot+OQ9
         M3vvAunGZLub/+KSMTxKM2CJh7WGDQua1+6bhFAeAbaUMAQvB0LpAN0bC6pfVxiN2QnM
         AeOpb+DizFovSlzfNAEXvpvEjoDoFP5rmrtKjGusoQrgaUBJewkmMHzhUosK0VjguH/R
         jnaNlDpBXtEBx6ThyZmuIUEpr4ja6nQb/UgGwXIHCXa/kD36EaGoLVw5Z84P9nDVOKyK
         +vLH5CfDe5LZYxBrGrqRWBc3yoXuONWCOagmufNTYKjJr3g0ZYeIZ6hwITOmm49DjrLd
         A0rg==
X-Gm-Message-State: AOJu0YyoXodfVqM6aEQVewwsncpJJwLM2XEmSxMlxBJddBqL5DQ/0g+w
	hlMaXp08TaaMn47JoDyE2/TKK6GXYW99QpWwxuYcTkfDFre+XunK0bUJs0bKjBR0LcK5qMi7DZB
	S
X-Gm-Gg: ASbGncuf2al5BT9SpNAg54jfvVhM4Gl9b5looBR7EJ/ObGw6A90I5EOPUDIkC+pmvBQ
	LBLGOP/5+/n/reITVmkGN4hnVY0w1iX9l5v8WqjDSho9vJxzH7eta8hsBoWn6U9wn9c8ftvhUCI
	f9TnzKcqypID0Dqy00teowloLpWCMXqUlVB8oFkoNWSqZ6xBiuX+RlcB5BZtwgCB6MwDDZ9IZ0O
	ZBt0ZuvtDAQBHiO1It4pcl3Gzc67vcbJqcx9/95vfh+yK9Xj5/J1ALsYgIEZgwJWRADmrV0emO2
	jd4x5eYxndK5KhRSmcb0jTL+p1fm92Vf6sv5ACIFYZuErvxA3MRG/yyoZvgECBV8NIDocGQi/TE
	bgV/a/dxuwX/1y6nZG3mrN5Cl
X-Google-Smtp-Source: AGHT+IFad/1s2+Gy1XQe4uGXb0y+jHW/InzX01CxGpQPcoOyu2q8yDl10eDbCyki/1Z3A8uZ8mXEbg==
X-Received: by 2002:a17:907:7fa6:b0:abf:7636:3cab with SMTP id a640c23a62f3a-ac3302ef9ccmr475467566b.29.1741987315607;
        Fri, 14 Mar 2025 14:21:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2] ARM/vgic: Use for_each_set_bit() in vgic_mmio_write_sgir()
Date: Fri, 14 Mar 2025 21:21:53 +0000
Message-Id: <20250314212153.136154-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bitmap_for_each() expression only inspects the bottom 8 bits of targets.
Change it's type to uint8_t and use for_each_set_bit() which is more efficient
over scalars.

GICD_SGI_TARGET_LIST_MASK is 2 bits wide.  Two cases discard the prior
calculation, and one case exits early.

Therefore, move the GICD_SGI_TARGET_MASK calculation into the only case which
wants it, and use MASK_EXTR() to simplify the expression.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

v2:
 * Split out of prior VGIC work as it's somewhat standalone.
 * Leave the case labels as they were.
---
 xen/arch/arm/vgic/vgic-mmio-v2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mmio-v2.c
index 670b335db2c3..da62a8078b5f 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v2.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
@@ -88,13 +88,12 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
     struct domain *d = source_vcpu->domain;
     unsigned int nr_vcpus = d->max_vcpus;
     unsigned int intid = val & GICD_SGI_INTID_MASK;
-    unsigned long targets = (val & GICD_SGI_TARGET_MASK) >>
-                            GICD_SGI_TARGET_SHIFT;
-    unsigned int vcpu_id;
+    uint8_t targets = 0;
 
     switch ( val & GICD_SGI_TARGET_LIST_MASK )
     {
     case GICD_SGI_TARGET_LIST:                    /* as specified by targets */
+        targets = MASK_EXTR(val, GICD_SGI_TARGET_MASK);
         targets &= GENMASK(nr_vcpus - 1, 0);      /* limit to existing VCPUs */
         break;
     case GICD_SGI_TARGET_OTHERS:
@@ -104,11 +103,12 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
     case GICD_SGI_TARGET_SELF:                    /* this very vCPU only */
         targets = (1U << source_vcpu->vcpu_id);
         break;
-    case 0x3:                                     /* reserved */
+
+    default:                                      /* reserved */
         return;
     }
 
-    bitmap_for_each ( vcpu_id, &targets, 8 )
+    for_each_set_bit ( vcpu_id, targets )
     {
         struct vcpu *vcpu = d->vcpu[vcpu_id];
         struct vgic_irq *irq = vgic_get_irq(d, vcpu, intid);

base-commit: 17e5060023685f3ca4d91b69675c5ba77685845a
prerequisite-patch-id: b61e58b40ec8f03baec78dd76ed47debdc4f6734
prerequisite-patch-id: 8afac5fd1570ffad810f4721007063037910724b
prerequisite-patch-id: 14fc34d8e2613f9c122a7b08b32698d7c55f2760
prerequisite-patch-id: b894b277228a61a2d47b28f2f11951809ce09a55
prerequisite-patch-id: e024feb79e9db58aa401d423bd7a4e08da155387
prerequisite-patch-id: 6971f7be40c4fd296663ffad4f31aac0fa94838e
-- 
2.39.5


