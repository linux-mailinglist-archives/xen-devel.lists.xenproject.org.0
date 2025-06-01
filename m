Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A641AC9F6B
	for <lists+xen-devel@lfdr.de>; Sun,  1 Jun 2025 18:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002582.1382150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLlcG-0001WX-Q1; Sun, 01 Jun 2025 16:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002582.1382150; Sun, 01 Jun 2025 16:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLlcG-0001Ux-KU; Sun, 01 Jun 2025 16:32:56 +0000
Received: by outflank-mailman (input) for mailman id 1002582;
 Sun, 01 Jun 2025 16:32:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8L5=YQ=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1uLlcF-0001Uq-Tk
 for xen-devel@lists.xenproject.org; Sun, 01 Jun 2025 16:32:55 +0000
Received: from rein-hpcbdc09 (unknown [1.7.42.26])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f4ee3b5-3f06-11f0-a300-13f23c93f187;
 Sun, 01 Jun 2025 18:32:53 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id 5852280C03EA; Sun,  1 Jun 2025 22:02:48 +0530 (IST)
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
X-Inumbo-ID: 0f4ee3b5-3f06-11f0-a300-13f23c93f187
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: Jahan Murudi <jahan.murudi.zg@renesas.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] arm/vgic-v2: Fix undefined behavior in vgic_fetch_itargetsr()
Date: Sun,  1 Jun 2025 22:02:12 +0530
Message-Id: <20250601163212.2988162-1-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation performs left shift operations that may trigger
undefined behavior when the target value is too large. This patch:

1. Changes the shift from signed (1) to unsigned (1U) to ensure well-defined
   behavior for all valid target values
2. Maintains identical functionality while fixing the UBSAN warning

The issue was detected by UBSAN:
(XEN) UBSAN: Undefined behaviour in arch/arm/vgic-v2.c:73:56
(XEN) left shift of 128 by 24 places cannot be represented in type 'int'
(XEN) Xen WARN at common/ubsan/ubsan.c:174

Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>

---
Changed since v1:
 * Added space after subject line
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


