Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536CF2F1024
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 11:34:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64753.114451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyuWn-0008IR-Tb; Mon, 11 Jan 2021 10:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64753.114451; Mon, 11 Jan 2021 10:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyuWn-0008I2-QG; Mon, 11 Jan 2021 10:34:25 +0000
Received: by outflank-mailman (input) for mailman id 64753;
 Mon, 11 Jan 2021 10:34:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oy8T=GO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kyuWm-0008Hx-Dv
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 10:34:24 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7554025f-6159-4956-8df8-17e16980fd58;
 Mon, 11 Jan 2021 10:34:23 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id u19so18278720edx.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 02:34:23 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s12sm7512751edu.28.2021.01.11.02.34.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 02:34:22 -0800 (PST)
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
X-Inumbo-ID: 7554025f-6159-4956-8df8-17e16980fd58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=16BITi26fvnPZ+bW1x44iKt3A3MofOdfGc9DNjTblBU=;
        b=nas2UMjr/AZS03wz2sjhP9Rtgk5KvgBoikfxituT2RTFrkKVU2Azvjra5/HLpMem/k
         gBbY92fNe9JtBY7DDVKh4LvjojNfWeB4NAYqLyLd8o8Tdx2tM523nIuKbx2/hi2h75Zr
         FhlgUPwZWeh1RzRxnD/7F/e6euYSt6LYNy0+06gFozr6G/ZkVX0dL5Rodo6hiWyMY5vD
         kevXs7RzMQ1+J4oErAUAVkwco3SPhcMwHbgSZm6WNqmwfQH5G9Qku74Vqyz+cXZG+TNB
         E5hMserERnv7iJHDP6iK0UVFX7zp+fwa+TBFqfLkQM2O16GFgLTr7Q1x4yxmvwdrCdDK
         NWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=16BITi26fvnPZ+bW1x44iKt3A3MofOdfGc9DNjTblBU=;
        b=N9d1KenaYT+rXbzaiyAuAAEoXM/qVW0Rlj8kz+FYbJg4+j5zavqi+zAsIHknr1lEF9
         HdyQ7QnAGl+qXkMH9TKrSJkus2L1+/9VKVXwPq0KMYgYURRZeWS17Rl3KNjPK4V3HWyi
         lEIgXQ84O0rTlYszaEAfqaoIprZY8KcVZtNeHEEYIbSNMm5vcwbO0xl1WEz5hkqvt3UX
         zWaJKB8QHJK6u6+LQYnb7oqCji0JpYSvBwrVpQpJSDAZ5wlDtj1mws+u7Jb2NILivpNz
         W59ST48ZpGyTMHtElGG+fw378fRcaN34FlmCKakznzXQxPPZzMpIszyoMM/TsHh/MgI6
         5NTg==
X-Gm-Message-State: AOAM531d11gslZk5aVPmbl8m++cQZysExiM+9NNmzfS8fOuIQ7RSSUC1
	Our/u+1S2AZNIESBuE9gZA68DEwtbCfEOQ==
X-Google-Smtp-Source: ABdhPJwfKhdLs1E5ZP/3XltROBBM1kd9ZhJq8LBnffbI2E4DcBG3w9L8AjPPqsbyayRpNe3fE7pdAA==
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr13421471edw.52.1610361262611;
        Mon, 11 Jan 2021 02:34:22 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] iommu/arm: ipmmu-vmsa: Use 1U << 31 rather than 1 << 31
Date: Mon, 11 Jan 2021 12:33:55 +0200
Message-Id: <1610361235-32697-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Replace all the use of 1 << 31 with 1U << 31 to prevent undefined
behavior in the IPMMU-VMSA driver.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
This is a follow-up to
https://patchew.org/Xen/20201224152419.22453-1-julien@xen.org/
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 346165c..aef358d 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -187,7 +187,7 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define IMCAAR               0x0004
 
 #define IMTTBCR                        0x0008
-#define IMTTBCR_EAE                    (1 << 31)
+#define IMTTBCR_EAE                    (1U << 31)
 #define IMTTBCR_PMB                    (1 << 30)
 #define IMTTBCR_SH1_NON_SHAREABLE      (0 << 28)
 #define IMTTBCR_SH1_OUTER_SHAREABLE    (2 << 28)
@@ -251,7 +251,7 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define IMUCTR(n)              ((n) < 32 ? IMUCTR0(n) : IMUCTR32(n))
 #define IMUCTR0(n)             (0x0300 + ((n) * 16))
 #define IMUCTR32(n)            (0x0600 + (((n) - 32) * 16))
-#define IMUCTR_FIXADDEN        (1 << 31)
+#define IMUCTR_FIXADDEN        (1U << 31)
 #define IMUCTR_FIXADD_MASK     (0xff << 16)
 #define IMUCTR_FIXADD_SHIFT    16
 #define IMUCTR_TTSEL_MMU(n)    ((n) << 4)
-- 
2.7.4


