Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4227D7C7F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 07:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623474.971334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvtFj-0002kD-1d; Thu, 26 Oct 2023 05:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623474.971334; Thu, 26 Oct 2023 05:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvtFi-0002gs-V7; Thu, 26 Oct 2023 05:49:54 +0000
Received: by outflank-mailman (input) for mailman id 623474;
 Thu, 26 Oct 2023 05:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bkoO=GI=linaro.org=jun.nie@srs-se1.protection.inumbo.net>)
 id 1qvtCc-0002dV-Jk
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 05:46:42 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 087c10dc-73c3-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 07:46:40 +0200 (CEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-27d5c71b4d7so1280842a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 22:46:40 -0700 (PDT)
Received: from niej-think.. (80.251.214.228.16clouds.com. [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id
 so3-20020a17090b1f8300b0027d0a60b9c9sm831152pjb.28.2023.10.25.22.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 22:46:38 -0700 (PDT)
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
X-Inumbo-ID: 087c10dc-73c3-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698299199; x=1698903999; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSTgWq3on62kpQTfU80MQgPRThAMsrIIzsvwWPX7qKg=;
        b=STSz3Q5wCH1AGajWzlKDiimcDB6Iekl2NPpz+p2MfUsJO8vEgizPw4TfwIVv9YOetf
         laL4QSKYdHabgBHBMfBnzDSxOIou1BcR4i6rrdPtvee4+dUDhGu6aFhUJTLXs4/O18Oa
         KfpXPMcpVsxuTxmTeaD42ZqZX/gxSWQhTZTLgQgoJojsbYGxV0M/q2PejGecFrHUe4xZ
         jn/d2Vpx7B5020hh+EpCV9WRb0GMa9PgEWLT5k5jvIG/Vrmum9ItRYKDnDYoSmkMeIM8
         VGQyURECzYi/yiWi2Mw8VaXndRdZaUu0gZ4H/d7aJVlMrfWq/TE7Iye1u9cAOKCTrVna
         SlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698299199; x=1698903999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSTgWq3on62kpQTfU80MQgPRThAMsrIIzsvwWPX7qKg=;
        b=sVNkM5HEDcUQUfputDPLbBuCgeqOvAyzOXPpmt130jH0p1byJFG4cExsRYAyXFZWoH
         5yMgg362nwyxwwbECtP2bdJf9xvy7qS8Ta3Tvt6Y3sTkmkjjy/sv21Bs/zIyzabubvgU
         MGDWzofKR10JP945Ltxq8POg3lyGMKVrJc2dT7F+rjO4rHZHlT1NWGItFOOJxFU+dltO
         1DL+oYvsSrk1Y9lwZXLHBL57Y5W+2H87oNyTNmx07RVpLthPssn8hTK0IsrGhJuRTc/E
         BF5lU3aBndbX+kn9DZBaT435ultIPEJoupACTbpOPhzXAiFj+zeVF8nPh2+3g3grlVEt
         WBnw==
X-Gm-Message-State: AOJu0YyHtXse+jgjxClZQLyp5KdxvYVj6XskTKgYNDk5/HPDKrqiAyct
	JkiNiv5UIYt3BVboAPF1EtNySw==
X-Google-Smtp-Source: AGHT+IFFPi+uJmeQ4qWhfIG8ErAuI2vJxo9QF9JlrFuuINJsXwgulTJDIePIaTab5TfsETL1usThrw==
X-Received: by 2002:a17:90b:d88:b0:27d:1a75:5b98 with SMTP id bg8-20020a17090b0d8800b0027d1a755b98mr2184057pjb.12.1698299198676;
        Wed, 25 Oct 2023 22:46:38 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	xen-devel@lists.xenproject.org
Cc: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH] xen/arm: Add Rockchip rk3399 early printk support
Date: Thu, 26 Oct 2023 13:46:34 +0800
Message-Id: <20231026054634.2805035-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 xen/arch/arm/Kconfig.debug | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 842d768280..fefe8ac4df 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -158,6 +158,9 @@ choice
 	config EARLY_PRINTK_RCAR3
 		bool "Early printk with SCIF2 on Renesas R-Car Gen3 processors"
 		select EARLY_UART_SCIF
+	config EARLY_PRINTK_RK3399
+		bool "Early printk with 8250 on Rockchip RK3399 processors"
+		select EARLY_UART_8250
 	config EARLY_PRINTK_SEATTLE
 		bool "Early printk with pl011 for AMD Seattle processor"
 		select EARLY_UART_PL011
@@ -230,6 +233,7 @@ config EARLY_UART_BASE_ADDRESS
 	default 0xd0012000 if EARLY_PRINTK_MVEBU
 	default 0x48020000 if EARLY_PRINTK_OMAP5432
 	default 0xe6e88000 if EARLY_PRINTK_RCAR3
+	default 0xff1a0000 if EARLY_PRINTK_RK3399
 	default 0xe1010000 if EARLY_PRINTK_SEATTLE
 	default 0x01c28000 if EARLY_PRINTK_SUN6I
 	default 0x01c28000 if EARLY_PRINTK_SUN7I
@@ -270,6 +274,7 @@ config EARLY_UART_8250_REG_SHIFT
 	default 2 if EARLY_PRINTK_BRCM
 	default 2 if EARLY_PRINTK_DRA7
 	default 2 if EARLY_PRINTK_OMAP5432
+	default 2 if EARLY_PRINTK_RK3399
 	default 2 if EARLY_PRINTK_SUN6I
 	default 2 if EARLY_PRINTK_SUN7I
 	default 2 if EARLY_PRINTK_XGENE_MCDIVITT
-- 
2.34.1


