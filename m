Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB53E74790A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 22:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558672.873006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGmfq-0001bY-EZ; Tue, 04 Jul 2023 20:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558672.873006; Tue, 04 Jul 2023 20:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGmfq-0001Yv-Br; Tue, 04 Jul 2023 20:30:58 +0000
Received: by outflank-mailman (input) for mailman id 558672;
 Tue, 04 Jul 2023 20:30:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Q6u=CW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1qGmfo-0001Yp-Va
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 20:30:57 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac747a1b-1aa9-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 22:30:54 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b6f943383eso16814021fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jul 2023 13:30:54 -0700 (PDT)
Received: from EPUAKYIW03DD.. ([91.123.150.167])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a2e8006000000b002b6e6a4ca47sm1741565ljg.23.2023.07.04.13.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 13:30:52 -0700 (PDT)
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
X-Inumbo-ID: ac747a1b-1aa9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688502653; x=1691094653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYV7DvvyA5ZV4OhZDB1OuNJt7P4bch4onznstHQiPBs=;
        b=RAeoUIKPBJR87c6ZADQRKj7yPKFTWqKXK1b5qN1/8btP0uIciqsNnEV+BiI9KN2Dpt
         LZuKf+gqS7UIXuieCWw0PoXV9BjCFhCM6zVNK6qR15wKD5I638DQirAfpIpm9ohzj5Fv
         +GBo+yDudx1G2S63pUmgF7M603gt0jBmMWJBV8S1lP+BU/pMiRIa2aEHTyhp3Isw4UnA
         EmdA7LvGYPis1EjO+tLWKPj2PfCzbzow+bFJzu3BvyXTsroKLenxudOVTxYxyUCSWpXZ
         dveyPblqJ5V6U+E6iH5sVt1vxlUamu/KW8HoTeO7sq/ei7w3YSVgRbJO7JvR+qOxRor4
         nSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688502653; x=1691094653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYV7DvvyA5ZV4OhZDB1OuNJt7P4bch4onznstHQiPBs=;
        b=ZMsTeBtvb56RhpjQw2ld7UCMauBVIiCAHAJqKjLvFDPBqhvCjZ5ws/TjGlFOigScBq
         8FUoK5A4oue3dQKthb40TMcTtowJbwXXLbPvxzRoF8gH/C00xRahdcNTQ0WNh9NeimIz
         2EGXT8MuceSXOLWqW7BSPCQ5j8CTs/GakXvmT8ITy+oO02UGTgtfTj6ksQ5X2rSR3c1w
         2QUfKcpEgKQ+NdeQRxpanAdON1TazpP7vnL8xbBLX174RS78tMBw0QpL3Kj100mpJ/il
         RzouwbFvjXQVwYQQLM1AbRT+d9HA3Fj9tfw8FTcyEJ2k9ydyMobg1CcRTAO4YH1SdTB9
         SILQ==
X-Gm-Message-State: ABy/qLZDgqTXF70BISfV2vr1F0szuQRfgRM2jRhb5X2q2RWlrJYNSBmo
	OI9/LW1CZo9pW2Yd7osOyPNJgtlRtp4=
X-Google-Smtp-Source: APBJJlGuhffoG3hL5abDfraRbWuzg++ENDDJQd9NKG66xTdhvVmErmmBskU9ozzlRY/ttd5r6uXxww==
X-Received: by 2002:a2e:870c:0:b0:2b1:bb66:7b69 with SMTP id m12-20020a2e870c000000b002b1bb667b69mr10225691lji.32.1688502652847;
        Tue, 04 Jul 2023 13:30:52 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] iommu/ipmmu-vmsa: Add missing 'U' in IMTTLBR0_TTBR_MASK for shifted constant
Date: Tue,  4 Jul 2023 23:30:32 +0300
Message-Id: <20230704203032.4062921-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

With enabling both CONFIG_UBSAN and CONFIG_IPMMU_VMSA I have got the following
splat when an IOMMU driver tried to setup page tables:

(XEN) ipmmu: /soc/iommu@e67b0000: d1: Set IPMMU context 1 (pgd 0x77fe90000)
(XEN) ================================================================================
(XEN) UBSAN: Undefined behaviour in drivers/passthrough/arm/ipmmu-vmsa.c:558:51
(XEN) left shift of 1048575 by 12 places cannot be represented in type 'int'
(XEN) Xen WARN at common/ubsan/ubsan.c:172
(XEN) ---[ Xen-4.18-unstable  arm64  debug=y ubsan=y  Tainted:      S ]----
...

This points to shifted constant in IMTTLBR0_TTBR_MASK. Fix that by adding
missing 'U' to it.

This should also address MISRA Rule 7.2:

A "u" or "U" suffix shall be applied to all integer constants that
are represented in an unsigned type.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 24b9e09a6b..0ccfa53255 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -201,7 +201,7 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define IMTTBCR_TSZ0_SHIFT             0
 
 #define IMTTLBR0              0x0010
-#define IMTTLBR0_TTBR_MASK    (0xfffff << 12)
+#define IMTTLBR0_TTBR_MASK    (0xfffffU << 12)
 #define IMTTUBR0              0x0014
 #define IMTTUBR0_TTBR_MASK    (0xff << 0)
 
-- 
2.34.1


