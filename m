Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8878758786F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 09:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379210.612486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oImji-0003hT-Rb; Tue, 02 Aug 2022 07:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379210.612486; Tue, 02 Aug 2022 07:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oImji-0003f8-OS; Tue, 02 Aug 2022 07:54:42 +0000
Received: by outflank-mailman (input) for mailman id 379210;
 Tue, 02 Aug 2022 07:54:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dd5r=YG=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oImji-0003f2-15
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 07:54:42 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c66ae64-1238-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 09:54:41 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id z16so16740406wrh.12
 for <xen-devel@lists.xenproject.org>; Tue, 02 Aug 2022 00:54:40 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:146:7628:78d0:d5d3])
 by smtp.googlemail.com with ESMTPSA id
 z22-20020a1cf416000000b003a35516ccc3sm17649513wma.26.2022.08.02.00.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 00:54:37 -0700 (PDT)
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
X-Inumbo-ID: 5c66ae64-1238-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=E8VWvmndalrM52Ef3AJnMPDROVLcnUExmMUKX1HewEY=;
        b=kd4XGPRMY92j4m9T93LrxRVml75YG/GXZxdNLANIKQoKEjccC8GJaLxJvYBS9EzruB
         XpF6Fi+pHqdqzEZySUtGxtKn120TV8VxyWYnnqTkXWQnBdmcjyewr/MkXsFBh3BvgR2R
         klI3fCIeLoSD7y4qQmgidegWr0+eUPMN3fSgukKn3inHdIkNW16AdGAkEgwM3VVSElsU
         qsZwqI9riwYwEyhzClTjIcf+prQ258I5/d5Ob0B1FtFtxP/47RbmuMxM7HaivtWR+vvv
         CCA+9f8+J0ghuBPnSzgEPLyNpIWmOAJwIqJaG4rVjhapwjhbliJ/4MAtwS3MIsKqZZ/Z
         q3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=E8VWvmndalrM52Ef3AJnMPDROVLcnUExmMUKX1HewEY=;
        b=O9x0KUIh2eIic3g1pwh/Ns5j/dL0zkbhsqLxfhGFYtt7KfRUQzC1CqYCPQ55sjly3c
         I7Qfs0ix60jVxoOp4GmAISir3TCW66svApyy1rX9L066RKS2H73rdOEA0j0Li3vqBxX+
         w1A/Mp/s5cEKR1/yYpgLMF2bl9YAdnEFI+bI1sOZTXQLIbH+w+hiy3joYs5DmEqQFSB8
         IV+bltF8nYjEXZsrFyPZwO0EiLvovxcAlRHq0UUE/74polQPKx3L7QzJeMUUdd0rWYda
         KJW1POnuTD6HoHHzlQc6weRqLKHNXmlCDO6q1qsAyAz8VL4laGQWlOTI9hYaUojc1eug
         W2Lg==
X-Gm-Message-State: ACgBeo3Hlw+Rj/3PktgduxFRewIftPD8ehrO2BCTLiKwnK5c86xp1dfa
	dTBl53WYX4vqhbDARswSiqDlIkQ4Sig=
X-Google-Smtp-Source: AA6agR4Rehn3Ovbrtt/4/G5ZobjDeGP2LlJvB4EY91OW3p3SANUK9MJlPv19a+KpNYHTTvOIAXg4UA==
X-Received: by 2002:adf:fac4:0:b0:21f:1228:dabc with SMTP id a4-20020adffac4000000b0021f1228dabcmr11056592wrs.501.1659426878910;
        Tue, 02 Aug 2022 00:54:38 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/char: imx-lpuart: Fix MISRA C 2012 Rule 20.7 violation
Date: Tue,  2 Aug 2022 10:54:33 +0300
Message-Id: <20220802075433.1748035-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro parameter 'off' is used as an expression and it is good to be
enclosed in parentheses to prevent against unintended expansion.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/drivers/char/imx-lpuart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c
index 2709136081..9c1f3b71a3 100644
--- a/xen/drivers/char/imx-lpuart.c
+++ b/xen/drivers/char/imx-lpuart.c
@@ -26,8 +26,8 @@
 #include <asm/imx-lpuart.h>
 #include <asm/io.h>
 
-#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
-#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + off)
+#define imx_lpuart_read(uart, off)       readl((uart)->regs + (off))
+#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + (off))
 
 static struct imx_lpuart {
     uint32_t baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
-- 
2.34.1


