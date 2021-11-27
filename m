Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D65F4600C2
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 18:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234024.406245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rm-0005pm-JZ; Sat, 27 Nov 2021 17:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234024.406245; Sat, 27 Nov 2021 17:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rm-0005a2-4L; Sat, 27 Nov 2021 17:52:02 +0000
Received: by outflank-mailman (input) for mailman id 234024;
 Sat, 27 Nov 2021 17:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaOL=QO=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mr1rj-0004Ih-70
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 17:51:59 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b76e45a3-4faa-11ec-976b-d102b41d0961;
 Sat, 27 Nov 2021 18:51:58 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id t11so25402118ljh.6
 for <xen-devel@lists.xenproject.org>; Sat, 27 Nov 2021 09:51:58 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f18sm827075ljc.104.2021.11.27.09.51.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Nov 2021 09:51:57 -0800 (PST)
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
X-Inumbo-ID: b76e45a3-4faa-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9mwKxUIwhhcxHHJvoR//K+R5uyZjNpj3vGJfrB5GvpE=;
        b=qDeQAJJ31P7G7QELGdWqVpRKdBqwlB1dl4ZaEtNbeanyul9cN5u+XKjwuE3kLD8pMk
         /ArkzsiQlMqYSryeb6gcaem2YrsYapAj6wDRivNekiyAXVIX4rTkVImheWkBaaNHe2db
         vXzMOHihqaeAvU4py1v+r1MUeNqagliEcbzyzQtivgruVHm4mT0rrkIPzEmNHL58iHX9
         IyQnUdoBu5QTr4sHDZZoCFu2j6sP6wRiJo+eWBiM6LEczjcvEmisqscRs9smH90/1Ika
         5If9mFKok1p0C7I3MGWs4fag2r6fiuxDyMawcur//wIaxVATtcVT0VpoXy3G38C4SJmh
         B/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9mwKxUIwhhcxHHJvoR//K+R5uyZjNpj3vGJfrB5GvpE=;
        b=antodVBPpdietpaYh0WRVLk+ga0wHJYJaMBmO+TkYuO7gslmqgcdRclehSJXt+HPwf
         Ue3VU3v3m8QsKH9hw3C2m6h1Kw4kXcM6x+lkukQNz5p+3Pj0cdz2aFXgC8PG5IITcqc2
         t6tiKBiTAIxkEtCXAinsvPk+oKwefwBNJ/CInfzlV3d6uKMY7MhnGk4UuCn8y92OarD1
         CH11nocCW90fwWmiJWFTwrj0IYiQeHdKSVBUBABhfw+ILyvH/JITmBlaf+g8fuyitTLN
         o5LxsJUCb5O9dK1c/36GZDY5KLRqNUpO78dW6vN35ypyZH7qvkWUsa3W7FCHyexLYoGY
         NYXg==
X-Gm-Message-State: AOAM531Vpp9QS2r6rgkEAsiBWSPcIUzynKfU7IwS9u6uarpaS8I60jFh
	WBLRLAKXvPcfvOuBkhzxw4nMSWEKybI=
X-Google-Smtp-Source: ABdhPJzwRSgX3LO7rkTFBgXUFHakRdHRaiO5rIt2ufLYVazG5ZhRv4hKgatv+rgHZrI0MwnNO98nCg==
X-Received: by 2002:a2e:95cb:: with SMTP id y11mr38339192ljh.461.1638035517879;
        Sat, 27 Nov 2021 09:51:57 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 08/10] iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0
Date: Sat, 27 Nov 2021 19:51:43 +0200
Message-Id: <1638035505-16931-9-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Based on the following commits from the Renesas BSP:
8fba83d97cca709a05139c38e29408e81ed4cf62
a8d93bc07da89a7fcf4d85f34d119a030310efa5
located at:
https://github.com/renesas-rcar/linux-bsp/tree/v5.10.41/rcar-5.1.3.rc5

Original commit messages:
 commit 8fba83d97cca709a05139c38e29408e81ed4cf62
 Author: Nam Nguyen <nam.nguyen.yh@renesas.com>
 Date:   Wed Apr 28 18:54:44 2021 +0700

  iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0

  Need to set bit IMSCTLR_USE_SECGRP to 0
  because H/W initial value is unknown, without this
  dma-transfer cannot be done due to address translation doesn't work.

  Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>

 commit a8d93bc07da89a7fcf4d85f34d119a030310efa5
 Author: Nam Nguyen <nam.nguyen.yh@renesas.com>
 Date:   Tue Sep 7 14:46:12 2021 +0700

  iommu/ipmmu-vmsa: Update IMSCTLR register offset address for R-Car S4

  Update IMSCTLR register offset address to align with R-Car S4 H/W UM.

  Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>

**********

It is still a question whether this really needs to be done in Xen,
rather in firmware, but better to be on the safe side. After all,
if firmware already takes care of clearing this bit, nothing bad
will happen.

Please note the following:
1. I decided to squash both commits since the first commit adds clearing
code and only the second one makes it functional on S4. Moreover, this is
not a direct port. So it would be better to introduce complete solution
by a single patch.
2. Although patch indeed does what it claims in the subject,
the implementation is different in comparison with original changes.
On Linux the clearing is done at runtime in ipmmu_domain_setup_context().
On Xen the clearing is done at boot time in ipmmu_probe().
The IMSCTLR is not a MMU "context" register at all, so I think there is
no point in performing the clearing each time we initialize the context,
instead perform the clearing at once during initialization.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 8dfdae8..22dd84e 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -229,6 +229,9 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define IMUASID0(n)            (0x0308 + ((n) * 16))
 #define IMUASID32(n)           (0x0608 + (((n) - 32) * 16))
 
+#define IMSCTLR             0x0500
+#define IMSCTLR_USE_SECGRP  (1 << 28)
+
 #define IMSAUXCTLR          0x0504
 #define IMSAUXCTLR_S2PTE    (1 << 3)
 
@@ -979,6 +982,10 @@ static int ipmmu_probe(struct dt_device_node *node)
         set_bit(0, mmu->ctx);
     }
 
+    /* Do not use security group function. */
+    reg = IMSCTLR + mmu->features->ctx_offset_stride_adj;
+    ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);
+
     spin_lock(&ipmmu_devices_lock);
     list_add(&mmu->list, &ipmmu_devices);
     spin_unlock(&ipmmu_devices_lock);
-- 
2.7.4


