Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3761E47B4E9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250000.430552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ1A-0006tq-85; Mon, 20 Dec 2021 21:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250000.430552; Mon, 20 Dec 2021 21:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ19-0006jw-O5; Mon, 20 Dec 2021 21:16:23 +0000
Received: by outflank-mailman (input) for mailman id 250000;
 Mon, 20 Dec 2021 21:16:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzQ17-0005IG-Om
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 21:16:21 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1421b50b-61da-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 22:16:21 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id bt1so24503094lfb.13
 for <xen-devel@lists.xenproject.org>; Mon, 20 Dec 2021 13:16:21 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b35sm635132lfv.209.2021.12.20.13.16.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:16:20 -0800 (PST)
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
X-Inumbo-ID: 1421b50b-61da-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WeHEjPAzdPl1ntiWMAL8hlkKvubzizi7P4jP/3KCTl4=;
        b=YjBJFHQOwM4G+wWsfiqU7jf8lspX3+GX5u0wGwI9QDNRrnUG37FpFNMnM1cc6K6rhn
         XmU7t5q7Nk7JAbqU7CRjCoBcil1ps5xvhznTAjDjEiwLj4zOfKWyfSR1ESeJ9iGnj83+
         JEX+wfDmcKHrY4zymy0DHdyH5LIiDKr7UNHvhT3nQ261hO7XmBla8rE5H0xso4xhIJ9x
         0dn/xgV0gKpOD6M9uTPWC1f2O2zrqDXRlLjfwhBLv/V0yG4+3sS5YTnEC/7Cz823K4N0
         7LHknbZNDIfZViUKwMJ6vSCW9/ZQkROAunoZdOcjHEFvx84l/HfrYCNWrn1tn5aqXgcY
         TC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WeHEjPAzdPl1ntiWMAL8hlkKvubzizi7P4jP/3KCTl4=;
        b=8DQjMwfUpcQg0Peaqjg6kjiKYJvb4xdQLpA1pQ9NMij3Vc84SS80xUu/Bccmq55Ns3
         SXR9gaUmDrws8oza/glDC6btlp+gD/B5snDbp7SvTOOsAvStvNYBa64903lmwJqka1fg
         xN7I1nT0ymvADVXT35GkER1MDC+AYPVBPt4mhh5G8w0GHIY8HzwEVjznsc8wkPfmp5Jq
         J4/YhVTnUftQo8ttFql1GFnGRConWwhaPauG9sx0vvzR+8ze9cRFF7xT37sTDqxWzQK5
         FszMZHYnDz5NkpMqZPA7LUuJlqlHoWCtCsfvx3uWYuCOHcemCoDBAnplnHDHEpv6BpR0
         XIwQ==
X-Gm-Message-State: AOAM530JHvDNW1yWoN7m0KfE78VT7vQG1kozKfOk601uz9VHiTRtRdVg
	ltH23VQMWtv6h6uY5Zbq6e1E39c/vmk=
X-Google-Smtp-Source: ABdhPJzpSS1SrTorcSVD6F21ky5lwYz7Lq/x4dTSm0jmtZAUI5674vxgWrEY49t/rUCfC3QXJWnRhQ==
X-Received: by 2002:a19:8c4b:: with SMTP id i11mr3428387lfj.81.1640034980647;
        Mon, 20 Dec 2021 13:16:20 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V2 08/10] iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0
Date: Mon, 20 Dec 2021 23:15:55 +0200
Message-Id: <1640034957-19764-9-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>

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
instead perform the clearing at once during initialization. Also do not
abuse ctx_offset_stride_adj field for the register's offset calculation,
instead use recently added control_offset_base field.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
Changes V1 -> V2:
   - add R-b
   - update patch description
   - replace ctx_offset_stride_adj with control_offset_base for
     register's offset calculation
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 14848ce..649b9f6 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -222,6 +222,9 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
 #define IMUASID0(n)            (0x0308 + ((n) * 16))
 #define IMUASID32(n)           (0x0608 + (((n) - 32) * 16))
 
+#define IMSCTLR             0x0500
+#define IMSCTLR_USE_SECGRP  (1 << 28)
+
 #define IMSAUXCTLR          0x0504
 #define IMSAUXCTLR_S2PTE    (1 << 3)
 
@@ -966,6 +969,10 @@ static int ipmmu_probe(struct dt_device_node *node)
         set_bit(0, mmu->ctx);
     }
 
+    /* Do not use security group function. */
+    reg = IMSCTLR + mmu->features->control_offset_base;
+    ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);
+
     spin_lock(&ipmmu_devices_lock);
     list_add(&mmu->list, &ipmmu_devices);
     spin_unlock(&ipmmu_devices_lock);
-- 
2.7.4


