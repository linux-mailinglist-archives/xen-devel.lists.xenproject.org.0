Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81FAAC9B52
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 16:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002094.1382104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLMuh-0004pJ-Rg; Sat, 31 May 2025 14:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002094.1382104; Sat, 31 May 2025 14:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLMuh-0004nB-P6; Sat, 31 May 2025 14:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1002094;
 Sat, 31 May 2025 14:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACn+=YP=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1uLMug-0004n5-7n
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 14:10:18 +0000
Received: from rein-hpcbdc09 (unknown [1.7.42.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5b2a0ec-3e28-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 16:10:13 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id 15C9680C07A0; Sat, 31 May 2025 19:40:06 +0530 (IST)
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
X-Inumbo-ID: f5b2a0ec-3e28-11f0-b894-0df219b8e170
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: jahan.murudi.zg@renesas.com,
	xen-arm@lists.xenproject.org
Subject: [PATCH] arm/vgic-v2: Fix undefined behavior in vgic_fetch_itargetsr() The current implementation performs left shift operations that may trigger undefined behavior when the target value is too large. This patch:
Date: Sat, 31 May 2025 19:39:42 +0530
Message-Id: <20250531140942.2979026-1-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. Changes the shift from signed (1) to unsigned (1U) to ensure well-defined
   behavior for all valid target values
2. Maintains identical functionality while fixing the UBSAN warning

The issue was detected by UBSAN:
(XEN) UBSAN: Undefined behaviour in arch/arm/vgic-v2.c:73:56
(XEN) left shift of 128 by 24 places cannot be represented in type 'int'
(XEN) Xen WARN at common/ubsan/ubsan.c:174

Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
---
 xen/arch/arm/vgic-v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index a19d610178..642407fd5b 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -70,7 +70,7 @@ static uint32_t vgic_fetch_itargetsr(struct vgic_irq_rank *rank,
     offset &= ~(NR_TARGETS_PER_ITARGETSR - 1);
 
     for ( i = 0; i < NR_TARGETS_PER_ITARGETSR; i++, offset++ )
-        reg |= (1 << read_atomic(&rank->vcpu[offset])) << (i * NR_BITS_PER_TARGET);
+        reg |= (1U << read_atomic(&rank->vcpu[offset])) << (i * NR_BITS_PER_TARGET);
 
     return reg;
 }
-- 
2.34.1


