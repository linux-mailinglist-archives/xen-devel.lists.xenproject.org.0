Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A3594EDAD
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775494.1185755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkn-0000SJ-8t; Mon, 12 Aug 2024 13:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775494.1185755; Mon, 12 Aug 2024 13:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkn-0000Lj-2U; Mon, 12 Aug 2024 13:06:29 +0000
Received: by outflank-mailman (input) for mailman id 775494;
 Mon, 12 Aug 2024 13:06:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAji=PL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sdUkm-0007ep-0w
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:06:28 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae9f98bd-58ab-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 15:06:26 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f032cb782dso44563071fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:06:26 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f2920525b7sm8607681fa.121.2024.08.12.06.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:06:24 -0700 (PDT)
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
X-Inumbo-ID: ae9f98bd-58ab-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467986; x=1724072786; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTEAe/pOjkrnvyxDHYihrpK7ln2+IQNSmZ/kBKccldI=;
        b=YIJPUU+llteL1oe/FljqFPaEXYBiwC49LeEZpNYAIEsH99ky4mJG71ovQtl2SsZvsK
         Mf6T+eBXJn5M/st9wuDWspG0Yr+qeaNGZS0eJJ+Miu/NzvnGZcE3jvkVDn33UX/wcc6s
         ybADnCmTXanpJggDmha4Z5ZQZFKjfOUJImayeYH8XN/PEgzO2m3hPzuVVYFolYphwkpR
         ChgAINNdEleQxvMM2M1/I2k9W3dYVuAIH9AQlfVbSEf43Z+UXXS6gzUIbg7ThmmBNynW
         zQXOIDrUOydxBLkzqkWCdKIzXREr0bNIMBHpu2wpVh50BTthMQ5xQY20CdH5Ur1+WhAX
         8OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467986; x=1724072786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTEAe/pOjkrnvyxDHYihrpK7ln2+IQNSmZ/kBKccldI=;
        b=m7iIqi34MFikXaVSfKbZqlosRyxteFroOTHb55s4eFWm7yEMMMuhGaDVaXs3lnFVr5
         00EBWOfyqD2ciSz7W2jVESoFi0eUQuY6onBIfd/843DVl5+WEjW/hMD6+GHQjmv90ZkK
         YFqk96JzBs1VQhzpvBCxiIFdMEDU/vpF5MV5dKdp6SvBnsGpndAIxyyz1Ym6q9nJfpzH
         50C/F7tBUIuCXtlde5aKNsJZS1L1xYeqXSLO0jGugvgVuzUvFu9Q5Lf8om4x1ARgDKAf
         FfTbxx8JLAYpm0vzHnZ6l6ncmdnjvfXxBGhT0X1nKsr/TCc7kFMoxI+iXN840Y+HglKI
         xamQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMAz4Hb5hcOHKoG92J1dUcG+s2U2lF5NXahY58WjYOv79Nimg6ePLEtJFxvYiUfaXkuNxTrBEb2iegJZGtn4AwHAkO7Jc7e4g2RW4OjGI=
X-Gm-Message-State: AOJu0Yww43ZHRMBQHejVHYz1NEblRaE9sK0Bsku9w2jf/t4wCVOUmSjF
	rs1pJf+LKz/rWGbWgDe5RxeF+M0IE2tDwGzmqrt8S5V4NMcyVLZi
X-Google-Smtp-Source: AGHT+IH0EXdKyQvoxf37ygreO5y2jLBKuw9Hze8ISbhMj2e1iAgBShVHSABDPv6QJ/gpCgSqjwyxEQ==
X-Received: by 2002:a05:651c:507:b0:2ef:2c86:4d43 with SMTP id 38308e7fff4ca-2f2b714656amr1654731fa.3.1723467985346;
        Mon, 12 Aug 2024 06:06:25 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v1 06/10] hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
Date: Mon, 12 Aug 2024 15:06:01 +0200
Message-ID: <20240812130606.90410-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Rename xen_arm.c -> xen-pvh.c to better express that this
is a PVH machine and to align with x86 HVM and future PVH
machine filenames:
hw/i386/xen/xen-hvm.c
hw/i386/xen/xen-pvh.c (in preparation)

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/meson.build              | 2 +-
 hw/arm/{xen_arm.c => xen-pvh.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/arm/{xen_arm.c => xen-pvh.c} (100%)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 0c07ab522f..769fe9ec1a 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -59,7 +59,7 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
-arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
+arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen-pvh.c'))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen-pvh.c
similarity index 100%
rename from hw/arm/xen_arm.c
rename to hw/arm/xen-pvh.c
-- 
2.43.0


