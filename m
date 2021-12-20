Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A359947B4F1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249993.430489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ15-0005QR-GP; Mon, 20 Dec 2021 21:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249993.430489; Mon, 20 Dec 2021 21:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ15-0005Kp-BP; Mon, 20 Dec 2021 21:16:19 +0000
Received: by outflank-mailman (input) for mailman id 249993;
 Mon, 20 Dec 2021 21:16:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzQ13-0005IG-AV
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 21:16:17 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1119e5da-61da-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 22:16:16 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id x21so16375186lfa.5
 for <xen-devel@lists.xenproject.org>; Mon, 20 Dec 2021 13:16:15 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b35sm635132lfv.209.2021.12.20.13.16.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:16:15 -0800 (PST)
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
X-Inumbo-ID: 1119e5da-61da-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5gytA2pLllrFj6CH99Xdk/Opt3jWfGlT8ShBqhaNetg=;
        b=Cdq4GjJ/2iK2iIIDzgHUFWhpcJBt2NTM2SeUjG+PuWAccmKfbquvFCKrO8Ez+FFwHY
         j111WBq0jRNFONhvtOulyEGsd1uE8GrmfipXT25rC/jzrCa/2mWJxkbPiNiNFvtwYjts
         GGa0E43hrhogNSeQPjJhaorFWWucTU2cQtt1RbtbkyzjF9wjvM0c5XxbMs8TJxBxcIK9
         UuGDvoU+OfsP7bPu8VX5JmKNzsOxXb+US2eNpRCaEtd/6WHXFfa2XK7GToLiBlQGvOX8
         JHwdxdmuFUmDT5SQm/OzzoKiDS8kJVoCL7P9GjMK2l4CrMaEb9O9qu2+EE7ZVSa1AmYD
         Q1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5gytA2pLllrFj6CH99Xdk/Opt3jWfGlT8ShBqhaNetg=;
        b=KNQUR3+RpFwnnt8fZ/R+g94yd7NWIM+7jeWnVkgMiVVcPR/YoLdjwdANn+cZiCjA73
         PyAk6iobzS2ITOFvmUPV9NwRasuUfClNtQUPoTJS9cH4g/th8kNOTJS+3+UcbQhoTEnC
         NnFacY9BzGeOSW4l5yPlR+yxZ9qqz2VNvMkYUtp6xal7ITPfYYt3/eSj5BHOiimn2M/D
         DGcoeB1Ww+WY+MLQkaTyyfs12ZsLY72+U1Uc5TkrvM8lS0mYGFTT3azhHdLTVUOAgJez
         /ux2Nr+cts4jPM6tc7X6JbaxNhrCs/3FItaSVLdYqgor7XF/LOEoP2FzsOS7zayWOTPd
         8mGw==
X-Gm-Message-State: AOAM531ZW/1jAxzCTefvA8eYem2CtNUh+zU28J+ro/ptbKZ5Pu55iRkn
	as1eTakfBbL10jhYapxquavUcqonBoE=
X-Google-Smtp-Source: ABdhPJxaDOs+TBKah+ukRAfspi33bXHs6F6TXrKYX+7z3geOaurnZi1gkTrB2n7oqg3+F9pCzFg0Wg==
X-Received: by 2002:a05:6512:3054:: with SMTP id b20mr2857265lfb.359.1640034975570;
        Mon, 20 Dec 2021 13:16:15 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V2 01/10] iommu/ipmmu-vmsa: Remove all unused register definitions
Date: Mon, 20 Dec 2021 23:15:48 +0200
Message-Id: <1640034957-19764-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is a non-verbatim port of corresponding Linux upsteam commit:
77cf983892b2e0d40dc256b784930a9ffaad4fc8

Original commit message:
 commit 77cf983892b2e0d40dc256b784930a9ffaad4fc8
 Author: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 Date:   Wed Nov 6 11:35:45 2019 +0900

  iommu/ipmmu-vmsa: Remove all unused register definitions

  To support different registers memory mapping hardware easily
  in the future, this patch removes all unused register
  definitions.

  Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Signed-off-by: Joerg Roedel <jroedel@suse.de>

**********

This is a prereq work needed to add support for S4 series easily
in the future.

Although Linux and Xen drivers have a lot in common, the main
differences are in translation stages (table formats), VMSAv8 modes,
supported SoC generations, etc, therefore that's why there is
a slight difference in registers/bits each driver considers unused.

No change in behavior.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes V1 -> V2:
   - add R-b
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 59 ++------------------------------
 1 file changed, 2 insertions(+), 57 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 1255b0d..4a8a974 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -166,15 +166,11 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 
 #define IMCTR                0x0000
 /*
- * These fields are implemented in IPMMU-MM only. So, can be set for
+ * This field is implemented in IPMMU-MM only. So, can be set for
  * Root IPMMU only.
  */
 #define IMCTR_VA64           (1 << 29)
-#define IMCTR_TRE            (1 << 17)
-#define IMCTR_AFE            (1 << 16)
-#define IMCTR_RTSEL_MASK     (3 << 4)
-#define IMCTR_RTSEL_SHIFT    4
-#define IMCTR_TREN           (1 << 3)
+
 /*
  * These fields are common for all IPMMU devices. So, can be set for
  * Cache IPMMUs as well.
@@ -184,42 +180,9 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define IMCTR_MMUEN          (1 << 0)
 #define IMCTR_COMMON_MASK    (7 << 0)
 
-#define IMCAAR               0x0004
-
 #define IMTTBCR                        0x0008
 #define IMTTBCR_EAE                    (1U << 31)
 #define IMTTBCR_PMB                    (1 << 30)
-#define IMTTBCR_SH1_NON_SHAREABLE      (0 << 28)
-#define IMTTBCR_SH1_OUTER_SHAREABLE    (2 << 28)
-#define IMTTBCR_SH1_INNER_SHAREABLE    (3 << 28)
-#define IMTTBCR_SH1_MASK               (3 << 28)
-#define IMTTBCR_ORGN1_NC               (0 << 26)
-#define IMTTBCR_ORGN1_WB_WA            (1 << 26)
-#define IMTTBCR_ORGN1_WT               (2 << 26)
-#define IMTTBCR_ORGN1_WB               (3 << 26)
-#define IMTTBCR_ORGN1_MASK             (3 << 26)
-#define IMTTBCR_IRGN1_NC               (0 << 24)
-#define IMTTBCR_IRGN1_WB_WA            (1 << 24)
-#define IMTTBCR_IRGN1_WT               (2 << 24)
-#define IMTTBCR_IRGN1_WB               (3 << 24)
-#define IMTTBCR_IRGN1_MASK             (3 << 24)
-#define IMTTBCR_TSZ1_MASK              (0x1f << 16)
-#define IMTTBCR_TSZ1_SHIFT             16
-#define IMTTBCR_SH0_NON_SHAREABLE      (0 << 12)
-#define IMTTBCR_SH0_OUTER_SHAREABLE    (2 << 12)
-#define IMTTBCR_SH0_INNER_SHAREABLE    (3 << 12)
-#define IMTTBCR_SH0_MASK               (3 << 12)
-#define IMTTBCR_ORGN0_NC               (0 << 10)
-#define IMTTBCR_ORGN0_WB_WA            (1 << 10)
-#define IMTTBCR_ORGN0_WT               (2 << 10)
-#define IMTTBCR_ORGN0_WB               (3 << 10)
-#define IMTTBCR_ORGN0_MASK             (3 << 10)
-#define IMTTBCR_IRGN0_NC               (0 << 8)
-#define IMTTBCR_IRGN0_WB_WA            (1 << 8)
-#define IMTTBCR_IRGN0_WT               (2 << 8)
-#define IMTTBCR_IRGN0_WB               (3 << 8)
-#define IMTTBCR_IRGN0_MASK             (3 << 8)
-#define IMTTBCR_SL0_LVL_2              (0 << 6)
 #define IMTTBCR_SL0_LVL_1              (1 << 6)
 #define IMTTBCR_TSZ0_MASK              (0x1f << 0)
 #define IMTTBCR_TSZ0_SHIFT             0
@@ -228,18 +191,8 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define IMTTLBR0_TTBR_MASK    (0xfffff << 12)
 #define IMTTUBR0              0x0014
 #define IMTTUBR0_TTBR_MASK    (0xff << 0)
-#define IMTTLBR1              0x0018
-#define IMTTLBR1_TTBR_MASK    (0xfffff << 12)
-#define IMTTUBR1              0x001c
-#define IMTTUBR1_TTBR_MASK    (0xff << 0)
 
 #define IMSTR                          0x0020
-#define IMSTR_ERRLVL_MASK              (3 << 12)
-#define IMSTR_ERRLVL_SHIFT             12
-#define IMSTR_ERRCODE_TLB_FORMAT       (1 << 8)
-#define IMSTR_ERRCODE_ACCESS_PERM      (4 << 8)
-#define IMSTR_ERRCODE_SECURE_ACCESS    (5 << 8)
-#define IMSTR_ERRCODE_MASK             (7 << 8)
 #define IMSTR_MHIT                     (1 << 4)
 #define IMSTR_ABORT                    (1 << 2)
 #define IMSTR_PF                       (1 << 1)
@@ -251,11 +204,7 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define IMUCTR(n)              ((n) < 32 ? IMUCTR0(n) : IMUCTR32(n))
 #define IMUCTR0(n)             (0x0300 + ((n) * 16))
 #define IMUCTR32(n)            (0x0600 + (((n) - 32) * 16))
-#define IMUCTR_FIXADDEN        (1U << 31)
-#define IMUCTR_FIXADD_MASK     (0xff << 16)
-#define IMUCTR_FIXADD_SHIFT    16
 #define IMUCTR_TTSEL_MMU(n)    ((n) << 4)
-#define IMUCTR_TTSEL_PMB       (8 << 4)
 #define IMUCTR_TTSEL_MASK      (15 << 4)
 #define IMUCTR_TTSEL_SHIFT     4
 #define IMUCTR_FLUSH           (1 << 1)
@@ -264,10 +213,6 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define IMUASID(n)             ((n) < 32 ? IMUASID0(n) : IMUASID32(n))
 #define IMUASID0(n)            (0x0308 + ((n) * 16))
 #define IMUASID32(n)           (0x0608 + (((n) - 32) * 16))
-#define IMUASID_ASID8_MASK     (0xff << 8)
-#define IMUASID_ASID8_SHIFT    8
-#define IMUASID_ASID0_MASK     (0xff << 0)
-#define IMUASID_ASID0_SHIFT    0
 
 #define IMSAUXCTLR          0x0504
 #define IMSAUXCTLR_S2PTE    (1 << 3)
-- 
2.7.4


