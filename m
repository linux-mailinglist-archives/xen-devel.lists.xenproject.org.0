Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4629843C507
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 10:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216699.376406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfeFf-0002d8-5H; Wed, 27 Oct 2021 08:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216699.376406; Wed, 27 Oct 2021 08:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfeFf-0002ac-2D; Wed, 27 Oct 2021 08:25:39 +0000
Received: by outflank-mailman (input) for mailman id 216699;
 Wed, 27 Oct 2021 08:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8pr=PP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mfeFd-0002aW-O6
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 08:25:37 +0000
Received: from mail-ed1-x532.google.com (unknown [2a00:1450:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d97cefca-ba38-454d-a69e-01ec514d62c0;
 Wed, 27 Oct 2021 08:25:36 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s1so7379110edd.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 01:25:36 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id bq4sm10445845ejb.43.2021.10.27.01.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 01:25:34 -0700 (PDT)
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
X-Inumbo-ID: d97cefca-ba38-454d-a69e-01ec514d62c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=40XBeXCNftA1Htax/SKjqvW6FDZwTVJ23WgtrKywO2A=;
        b=e5M3iJtfvFrqEoi4LavM3LCq1dJKMwQYRSuUlpJLnN+0hbirsQVM1+cPjfSDql6VwV
         PMXT72d66F11qk3PI2GtqLyyURucj8LzTjFfX1JJxzL+RTQ8c2owbL+U8wj/Hcpyped7
         QkN0ydd6+5Ugqea/DkldHjnk0yxQAb2HbikhnYSBrNHJUlZXvxJi49AnJMZWW77rQQvH
         /sFJ+talYB2JoxYfqTXya6dYMqZu2XCAn1omhiLWw5GpqL+yjLbCDv72qK/O6A5X15ER
         r1z5adi9NiMLRyKU9EG54JFNIClmNKxJRDO5JI0TrQ9r7T5GcyxiM0w+BRFFBWLfbEBe
         cbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=40XBeXCNftA1Htax/SKjqvW6FDZwTVJ23WgtrKywO2A=;
        b=uHA35SXVEqhSg6uxDj0cQW5az1jQFTLy1Lx/9MZuZoINDdkpdI/Ot6gsFrC4IioBSK
         6aPq+53anV+SGMvLGOGfQRSE09b3gAv7lCw25Q4uNDSvO0DIlIG3MpeKK62RT2Y3khHU
         XA2aO2nGoJeJr/NQFUnM2DqVKeimHza7msdy1oee7oPrhvkvjp+1GbVmfaZ/HBw3O74c
         srBV3RGQYoqc80m6J9M0SwgYmUnh1g1olav9VCXK5LEYpCdt1BKX2lPKgLlXH6qy7a26
         nEEnJCsh9/O1NoK1sz9BuDeTOKh6go9sYRJICwTQ16vimZeun3+5LE7xVDgwQv7yQw/O
         Ru+Q==
X-Gm-Message-State: AOAM5301fu6cwQimrATFTREMXCYDCmMqXGoYvAfN+1nxMUro7+2BW4Ia
	xAEl+6lFF7z0mEsNBm5VzwMgJQYnXkv56A==
X-Google-Smtp-Source: ABdhPJxa6yp1okF3IJP5ZcBVoHpwuKUv+gzFnb6zGnfpEO7ZQ40dTGZBLdy3XxqVFIj30clJyL6WBg==
X-Received: by 2002:a05:6402:1256:: with SMTP id l22mr11845063edw.240.1635323135397;
        Wed, 27 Oct 2021 01:25:35 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	iwj@xenproject.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Date: Wed, 27 Oct 2021 11:25:33 +0300
Message-Id: <20211027082533.1406015-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
the base address may not be aligned in the way that the translation
always work. If not adjusted with respect to the base address it may not be
able to properly convert SBDF and crashes:

(XEN) vpci_mmio_read 0000:65:1a.0 reg 8bc gpa e65d08bc
(XEN) Data Abort Trap. Syndrome=0x6
(XEN) Walking Hypervisor VA 0x467a28bc on CPU0 via TTBR 0x00000000481d5000

Fix this by adjusting the gpa with respect to the host bridge base address
in a way as it is done for x86.

Fixes: d59168dc05a5 ("xen/arm: Enable the existing x86 virtual PCI support for ARM")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/vpci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 8f40a0dec6d2..23f45386f4b3 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -24,7 +24,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
     unsigned long data;
 
     /* We ignore segment part and always handle segment 0 */
-    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
+    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
 
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
@@ -44,7 +44,7 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
     pci_sbdf_t sbdf;
 
     /* We ignore segment part and always handle segment 0 */
-    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
+    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
 
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
-- 
2.25.1


