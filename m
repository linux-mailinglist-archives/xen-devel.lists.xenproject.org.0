Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C536BA73393
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 14:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929333.1331950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnZl-0001gJ-J2; Thu, 27 Mar 2025 13:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929333.1331950; Thu, 27 Mar 2025 13:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnZl-0001ea-GB; Thu, 27 Mar 2025 13:47:17 +0000
Received: by outflank-mailman (input) for mailman id 929333;
 Thu, 27 Mar 2025 13:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txnZk-0001eU-Ez
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 13:47:16 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd6b0d7d-0b11-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 14:47:14 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso10697845e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 06:47:14 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82eff0c5sm39071715e9.23.2025.03.27.06.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 06:47:12 -0700 (PDT)
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
X-Inumbo-ID: fd6b0d7d-0b11-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743083233; x=1743688033; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YcObGS7YEUSZyVcAFolXQvqI615+KQ52smESX2n3bbk=;
        b=seHeevJqXmIqaq9eXGoCz/zxvW3PjSXTUROsZ7oeEZ4PiaOAHlHCH4HDl36i2CjnXb
         T0UnojRkXSD/A9Sip1WlEbQtEf8BY1IjkNOr+NGj3uJ5eO041KCJMM+lon8KI2fR35vw
         YIrPOdmQi0PpcRmkym3tZTqLFV82Y2LNxhAn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083233; x=1743688033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcObGS7YEUSZyVcAFolXQvqI615+KQ52smESX2n3bbk=;
        b=Ve+rfUUS2FblOwTbTQlLwmVz/WT7vNgA5bmf6QI2pW5Qr088Ueh7tucwQ0h04asnWv
         k0R1UPyKyWya5RHA+SqeXNSoAaljsIhcCHRj10bedoUENjZNb+1lkH96qjMtv8eIJgxF
         z5edCYsnyKPElmcELsa0xA8zU+62VZlodnAahh6fVXHe4omws5zIQS59dWloHGdUZzay
         Q6M38PGucj0IQTyz3zHNAMY3gqNw8d4U6uAsNpA8se5Js4Fsc17YgLi3I6dU8fyw/LVG
         72kjz1nCHEB/7sDEZtu+8zyXCd/UyLnHBawJM0eJwcPKqd3lhMzn3trXVveSu64RqnQR
         3Wyw==
X-Gm-Message-State: AOJu0Yw0pgRoxr+ZrbjZzkUUv5JehaLjvYc2ysXtpByNZJgFZVPspWig
	1X07hd3G0VaceyHm0iQDTgVmm6EK6sKWbJGDRiyoAu4h/sysCJDqyJuGPw+LI0oLI2ngAwcn60l
	kLA8=
X-Gm-Gg: ASbGnct3x6mfw/FmdKoGVteHS8GpNcbbkz/7Z/Sfp6ueTy/2yf3EdPS+kLTLbttTIzS
	EYoNZY3Sv9wNRPDXIQBjLFFSF+ckgBJ1wROunh2PKZtZQqe/n5Wk+8G8gXtlG88dHxYuc0jI6L+
	vds3+d4FlN8W7HmmREQctIeNQ4Wf4jRXqkXh03JcJqQUV/MluIjAqKNomPd5P0Cl0JAyVdXN/mg
	hBHRTYJxnAKiCsoCFRDzrAdaT2TpbEKfsjEyc9PkJ+duycnqSKp6AixarLdbx3LTOTXY1Ut1/Dd
	dpic/VPNpJ9mMCZ4RFqLrgqfh1676ey78aI4S/0KyqQNNrd5P1NjBhLvf2S4drVB0+89tIqnCn5
	oM/8cJ8ld3mkoXOJRIQ==
X-Google-Smtp-Source: AGHT+IGOlogkTrPdMEjd9pdy7k9jSjIRN9Hybux2ZbtoAuUQxAsvlpExfUhh8QeQQZkI8W1n7CyDgA==
X-Received: by 2002:a05:600c:3ac5:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43d84fb5090mr38608195e9.18.1743083233440;
        Thu, 27 Mar 2025 06:47:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3] ARM/vgic: Use for_each_set_bit() in vgic-mmio*
Date: Thu, 27 Mar 2025 13:47:10 +0000
Message-Id: <20250327134710.399101-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are all loops over a scalar value, and don't need to call general bitop
helpers behind the scenes.

Clamp data to the width of the access in dispatch_mmio_write(), rather than
doing so in every handler.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

v3:
 * Split out of series.
 * Move clamping to common location.

Bloat-o-meter analysis.  The negative change in each handler also includes the
removal of calls to _find_{first,next}_bit_le(), so the improvement is better
than the summary suggests.

$ ../scripts/bloat-o-meter xen-syms-arm32-{before,after}
add/remove: 0/0 grow/shrink: 1/6 up/down: 24/-156 (-132)
Function                                     old     new   delta
dispatch_mmio_write                          212     236     +24
vgic_mmio_write_spending                     392     368     -24
vgic_mmio_write_senable                      324     300     -24
vgic_mmio_write_cenable                      320     296     -24
vgic_mmio_write_sactive                      204     176     -28
vgic_mmio_write_cpending                     464     436     -28
vgic_mmio_write_cactive                      204     176     -28

$ ../scripts/bloat-o-meter xen-syms-arm64-{before,after}
add/remove: 0/0 grow/shrink: 1/6 up/down: 32/-196 (-164)
Function                                     old     new   delta
dispatch_mmio_write                          164     196     +32
vgic_mmio_write_spending                     320     312      -8
vgic_mmio_write_cpending                     368     356     -12
vgic_mmio_write_sactive                      192     156     -36
vgic_mmio_write_cactive                      192     156     -36
vgic_mmio_write_cenable                      316     268     -48
vgic_mmio_write_senable                      320     264     -56
---
 xen/arch/arm/vgic/vgic-mmio.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index 4ad350c21c8b..b4ba34cfc368 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -70,9 +70,8 @@ void vgic_mmio_write_senable(struct vcpu *vcpu,
                              unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
         unsigned long flags;
@@ -115,9 +114,8 @@ void vgic_mmio_write_cenable(struct vcpu *vcpu,
                              unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq;
         unsigned long flags;
@@ -183,11 +181,10 @@ void vgic_mmio_write_spending(struct vcpu *vcpu,
                               unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
     unsigned long flags;
     irq_desc_t *desc;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
@@ -231,11 +228,10 @@ void vgic_mmio_write_cpending(struct vcpu *vcpu,
                               unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
     unsigned long flags;
     irq_desc_t *desc;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
@@ -327,9 +323,8 @@ void vgic_mmio_write_cactive(struct vcpu *vcpu,
                              unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
@@ -357,9 +352,8 @@ void vgic_mmio_write_sactive(struct vcpu *vcpu,
                              unsigned long val)
 {
     uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
-    unsigned int i;
 
-    bitmap_for_each ( i, &val, len * 8 )
+    for_each_set_bit ( i, val )
     {
         struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
 
@@ -591,6 +585,10 @@ static int dispatch_mmio_write(struct vcpu *vcpu, mmio_info_t *info,
     if ( !region )
         return 0;
 
+    /* Clamp data to the width of the access. */
+    if ( len < sizeof(data) )
+        data &= (1UL << (len * 8)) - 1;
+
     switch (iodev->iodev_type)
     {
     case IODEV_DIST:
-- 
2.39.5


