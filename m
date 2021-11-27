Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C84600C5
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 18:52:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234020.406204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rj-0004vl-5P; Sat, 27 Nov 2021 17:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234020.406204; Sat, 27 Nov 2021 17:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1ri-0004nm-T6; Sat, 27 Nov 2021 17:51:58 +0000
Received: by outflank-mailman (input) for mailman id 234020;
 Sat, 27 Nov 2021 17:51:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaOL=QO=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mr1rg-0004Ig-KO
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 17:51:56 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b537303f-4faa-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 18:51:54 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id z8so25423478ljz.9
 for <xen-devel@lists.xenproject.org>; Sat, 27 Nov 2021 09:51:54 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f18sm827075ljc.104.2021.11.27.09.51.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Nov 2021 09:51:53 -0800 (PST)
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
X-Inumbo-ID: b537303f-4faa-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Et3v4jLjdi8fSGHp23Qe3EkHAev8Ueklel0QLczpMUM=;
        b=U64ev8oTHyXDL2muWv1cpy2pJBIj0Kyp87u7bmi3fdqEkwImWKyWgzT/ltKEoPPcmv
         J6y5KUdNpzPoXzO0tv9baXsdRln2v8ZaMdXO0l5/GYNLyOlPMKM/QOOqoD0YcdI5AEfS
         ebKaznVduAVQZSwWq8a5VNR1ZKbYxLe1UGw05QdR74I0NWMs7StvXz1bZstqx8Qd19Lj
         CGEPcbuO+gfqv7TBgUpSk60n26iqbVZKJfqLnQhe08V1Xyqdif3OArJJg7KNcMfTjtjh
         AxD+VGDPcwth0ed252g255ty85WDnLC7IuvDCFl6OxNoLhWO7Aw4hGuwOBJcN7RX4ugk
         /bUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Et3v4jLjdi8fSGHp23Qe3EkHAev8Ueklel0QLczpMUM=;
        b=3/+G71hT6kbc//+pkBt3wLV3jq3q2/uj46fDtCVJI47xt0kvFQx+kMuINACO7X55zG
         p/aL4fAef0FvgzXQGS9bdvitPGiNifgbLhxLqP3c2sVpP7nXzzHhJ4KtlI8kE4jOAYrL
         l0nQABRKP1VQneye9RfdCsUIL0XCD6JAs/Tj52G33V7TR1xWexmLY6NqeOtfEkFCDw2i
         cUhE48Y1mkTb57XDzsjqEO4tH1m6dtu3QZjQfZMfBaWR1Z4qcgcVnIw72CYk16H6JC9v
         v8E0lh1zz3sR7wpxrr6Rp5om+ySzKWi7MieI1iqKx80qGERu8xhAFaUYQB2asppgZbX2
         sZuA==
X-Gm-Message-State: AOAM532XHF3D+8v/WPeKjY5Md1wIymdUZQVk3b6aVZYLoowbve0g8Cve
	ExNwNeJ3BsImjvWFvbCYZUf5YsKFldM=
X-Google-Smtp-Source: ABdhPJyYlKaSkhQ0ma7fmWjzSH0FeT7SxyshUlGwhaV7a1JZTamSeMui13rEZ/4tuA/DCOcqAOrbiQ==
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr5622886lji.417.1638035514119;
        Sat, 27 Nov 2021 09:51:54 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 03/10] iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
Date: Sat, 27 Nov 2021 19:51:38 +0200
Message-Id: <1638035505-16931-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is a non-verbatim port of corresponding Linux upsteam commit:
3667c9978b2911dc1ded77f5971df477885409c4

Original commit message:
 commit 3667c9978b2911dc1ded77f5971df477885409c4
 Author: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 Date:   Wed Nov 6 11:35:49 2019 +0900

  iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers

  Since we will have changed memory mapping of the IPMMU in the future,
  This patch adds helper functions ipmmu_utlb_reg() and
  ipmmu_imu{asid,ctr}_write() for "uTLB" registers. No behavior change.

  Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
  Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Signed-off-by: Joerg Roedel <jroedel@suse.de>

**********

This is a prereq work needed to add support for S4 series easily
in the future.

Besides changes done in the original commit, we also need to introduce
ipmmu_imuctr_read() since Xen driver contains an additional logic in
ipmmu_utlb_enable() to prevent the use cases where devices which use
the same micro-TLB are assigned to different Xen domains.

No change in behavior.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 33 +++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index ce5c3bc..1b94af2 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -366,6 +366,29 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
     ipmmu_ctx_write_root(domain, reg, data);
 }
 
+static uint32_t ipmmu_utlb_reg(struct ipmmu_vmsa_device *mmu, uint32_t reg)
+{
+    return reg;
+}
+
+static void ipmmu_imuasid_write(struct ipmmu_vmsa_device *mmu,
+                                unsigned int utlb, uint32_t data)
+{
+    ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)), data);
+}
+
+static void ipmmu_imuctr_write(struct ipmmu_vmsa_device *mmu,
+                               unsigned int utlb, uint32_t data)
+{
+    ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUCTR(utlb)), data);
+}
+
+static uint32_t ipmmu_imuctr_read(struct ipmmu_vmsa_device *mmu,
+                                  unsigned int utlb)
+{
+    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUCTR(utlb)));
+}
+
 /* TLB and micro-TLB Management */
 
 /* Wait for any pending TLB invalidations to complete. */
@@ -413,7 +436,7 @@ static int ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
      * context_id for already enabled micro-TLB and prevent different context
      * bank from being set.
      */
-    imuctr = ipmmu_read(mmu, IMUCTR(utlb));
+    imuctr = ipmmu_imuctr_read(mmu, utlb);
     if ( imuctr & IMUCTR_MMUEN )
     {
         unsigned int context_id;
@@ -431,9 +454,9 @@ static int ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
      * TODO: Reference-count the micro-TLB as several bus masters can be
      * connected to the same micro-TLB.
      */
-    ipmmu_write(mmu, IMUASID(utlb), 0);
-    ipmmu_write(mmu, IMUCTR(utlb), imuctr |
-                IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMUEN);
+    ipmmu_imuasid_write(mmu, utlb, 0);
+    ipmmu_imuctr_write(mmu, utlb, imuctr |
+                       IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMUEN);
 
     return 0;
 }
@@ -444,7 +467,7 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
 {
     struct ipmmu_vmsa_device *mmu = domain->mmu;
 
-    ipmmu_write(mmu, IMUCTR(utlb), 0);
+    ipmmu_imuctr_write(mmu, utlb, 0);
 }
 
 /* Domain/Context Management */
-- 
2.7.4


