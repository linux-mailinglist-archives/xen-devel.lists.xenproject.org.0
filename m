Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF8496840A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 12:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787722.1197200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3uo-0007be-Og; Mon, 02 Sep 2024 10:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787722.1197200; Mon, 02 Sep 2024 10:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3uo-0007Z8-KF; Mon, 02 Sep 2024 10:04:06 +0000
Received: by outflank-mailman (input) for mailman id 787722;
 Mon, 02 Sep 2024 10:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl3un-0006bt-7d
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 10:04:05 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af6bb557-6912-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 12:04:04 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c260b19f71so608997a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 03:04:04 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89940980a1sm480884466b.47.2024.09.02.03.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 03:04:01 -0700 (PDT)
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
X-Inumbo-ID: af6bb557-6912-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725271443; x=1725876243; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNmt6C4dYLcSRE/kLQ638r2n5pK9+2nhsVUxc8Tiuts=;
        b=RjKmi19Ij5gt61L+Brbb1J9qk3y2o8b3mlmLqlAmBLAq54RI0B6OE7ADQ7v3POyHBK
         bGwWcnnqPIG2PDbc3rIy691mLrNL+3aFHSubExUw6Qa07tL86szIerBd3OGoYfcCImKO
         n25QOr81XAifWTh2lJjpZ9eBDKj0oNXRBNiD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271443; x=1725876243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNmt6C4dYLcSRE/kLQ638r2n5pK9+2nhsVUxc8Tiuts=;
        b=fLAVHBW6kB0KUdxWpxylJVDbjohwtfe/jtf4Rno3hfXO7R/g9UosxLsjyRG/tfGytn
         PDvA9jXiCFFTgHjVxk9+6VOYplPzFVHZlafQhVxupGOAUr0DMimjpWuO5uRPZI2dtuqR
         7L+UOGMvPa71sumLW+g0fGjU0219MCv5vlCZQ5gkvbvuO0KNRYVasJ/l9Rc9RdJ6N1GO
         3hDM4RouPegKefKmc82IRFJt/wCCo4zcTb6e3GU5KkMu4U9v6XV+JcbPbH06h0E41n91
         HzuAH2pcoBtPgsZJe8Vzimhs0UG2L7nLBMBcEdD6cPNhYl4kH3bfA4GO5gkX/H3qfnng
         ds8g==
X-Gm-Message-State: AOJu0YwHGrXn4F2czDQbwgueHdeMhxY1p0XRrHfJ5fL8tbg3NSNdGodT
	iAT4G0ignWeNhuwWQ+z/ZAldN43FXkk5TLmnB7QOzzUhCpoutD4F8Y2OxJQdwxN3V5ChXj+L8Ei
	9
X-Google-Smtp-Source: AGHT+IFe8F0siC0/Ea9UtCAtVo7bgSYJ/G3wKmqdwL2r0OPTLpWz4tbeabFlviZpxMXs5UQHBw9Zpw==
X-Received: by 2002:a17:907:3ea6:b0:a7a:c256:3ce with SMTP id a640c23a62f3a-a89a35d5506mr713627666b.21.1725271442715;
        Mon, 02 Sep 2024 03:04:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 4/4] ARM/vgic: Use for_each_set_bit() in vgic-mmio*
Date: Mon,  2 Sep 2024 11:03:55 +0100
Message-Id: <20240902100355.3032079-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
References: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are all loops over a scalar value, and don't need to call general bitop
helpers behind the scenes.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

Slighly RFC.  It's unclear whether len is the size of the register, or the
size of the access.  For sub-GPR accesses, won't the upper bits be clear
anyway?  If so, this can be simplified further.

$ ../scripts/bloat-o-meter xen-syms-arm64-{before,after}
add/remove: 0/0 grow/shrink: 2/5 up/down: 20/-140 (-120)
Function                                     old     new   delta
vgic_mmio_write_spending                     320     332     +12
vgic_mmio_write_cpending                     368     376      +8
vgic_mmio_write_sactive                      192     176     -16
vgic_mmio_write_cactive                      192     176     -16
vgic_mmio_write_cenable                      316     288     -28
vgic_mmio_write_senable                      320     284     -36
vgic_mmio_write_sgir                         344     300     -44

$ ../scripts/bloat-o-meter xen-syms-arm32-{before,after}
add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-32 (-32)
Function                                     old     new   delta
vgic_mmio_write_sactive                      204     200      -4
vgic_mmio_write_cpending                     464     460      -4
vgic_mmio_write_cactive                      204     200      -4
vgic_mmio_write_sgir                         336     316     -20
---
 xen/arch/arm/vgic/vgic-mmio-v2.c |  3 +--
 xen/arch/arm/vgic/vgic-mmio.c    | 36 +++++++++++++++++++++-----------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mmio-v2.c
index 670b335db2c3..42fac0403f07 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v2.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
@@ -90,7 +90,6 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
     unsigned int intid = val & GICD_SGI_INTID_MASK;
     unsigned long targets = (val & GICD_SGI_TARGET_MASK) >>
                             GICD_SGI_TARGET_SHIFT;
-    unsigned int vcpu_id;
 
     switch ( val & GICD_SGI_TARGET_LIST_MASK )
     {
@@ -108,7 +107,7 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
         return;
     }
 
-    bitmap_for_each ( vcpu_id, &targets, 8 )
+    for_each_set_bit ( vcpu_id, (uint8_t)targets )
     {
         struct vcpu *vcpu = d->vcpu[vcpu_id];
         struct vgic_irq *irq = vgic_get_irq(d, vcpu, intid);
diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index bd4caf7fc326..f7c336a238ab 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -69,9 +69,11 @@ void vgic_mmio_write_senable(struct vcpu *vcpu,
                              unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    if ( len < sizeof(val) )
+        val &= (1UL << (len * 8)) - 1;
+
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
         unsigned long flags;
@@ -114,9 +116,11 @@ void vgic_mmio_write_cenable(struct vcpu *vcpu,
                              unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    if ( len < sizeof(val) )
+        val &= (1UL << (len * 8)) - 1;
+
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq;
         unsigned long flags;
@@ -182,11 +186,13 @@ void vgic_mmio_write_spending(struct vcpu *vcpu,
                               unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
     unsigned long flags;
     irq_desc_t *desc;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    if ( len < sizeof(val) )
+        val &= (1UL << (len * 8)) - 1;
+
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
@@ -230,11 +236,13 @@ void vgic_mmio_write_cpending(struct vcpu *vcpu,
                               unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
     unsigned long flags;
     irq_desc_t *desc;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    if ( len < sizeof(val) )
+        val &= (1UL << (len * 8)) - 1;
+
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
@@ -326,9 +334,11 @@ void vgic_mmio_write_cactive(struct vcpu *vcpu,
                              unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    if ( len < sizeof(val) )
+        val &= (1UL << (len * 8)) - 1;
+
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
@@ -356,9 +366,11 @@ void vgic_mmio_write_sactive(struct vcpu *vcpu,
                              unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    if ( len < sizeof(val) )
+        val &= (1UL << (len * 8)) - 1;
+
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
-- 
2.39.2


