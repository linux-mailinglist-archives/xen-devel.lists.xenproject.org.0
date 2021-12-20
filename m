Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E51D47B4EE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249995.430506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ16-0005nI-HP; Mon, 20 Dec 2021 21:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249995.430506; Mon, 20 Dec 2021 21:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzQ16-0005eI-9L; Mon, 20 Dec 2021 21:16:20 +0000
Received: by outflank-mailman (input) for mailman id 249995;
 Mon, 20 Dec 2021 21:16:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzQ14-0005IB-EW
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 21:16:18 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11ee8156-61da-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 22:16:17 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id bt1so24502703lfb.13
 for <xen-devel@lists.xenproject.org>; Mon, 20 Dec 2021 13:16:17 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b35sm635132lfv.209.2021.12.20.13.16.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Dec 2021 13:16:16 -0800 (PST)
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
X-Inumbo-ID: 11ee8156-61da-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hajm4OA2mR1rqKBWo1oPRyQ75UieT0Vx1ZnO7YitzIM=;
        b=qIXmN3ldE/ZN74+4YThza4AYid4jpygjX+xdmfkD6EAA5y37CvzdUbPtTSqP+1hezy
         FbateqQKdPFMOjjVuW3VU6Std4HufcBhyTDj+OTVAdRyBwkZNr0k/MHwOk9aYF+ijU1z
         50fNGe+Ij8QFC6URM0g//2mLElYzbjnUFC4cs4myBgUpaHWUG9fB3EfSmWFmWIlCqG/R
         e4uCVxbL6WrKLuyi/hgXa5dpUx1cVncs8xDJoil1jpJPbOdHZiQEuTIpBnDUonl6P6kI
         Pweo79tXZ5V1g8p0e8nexsWb8XlHgeuno1/k/jxl3Sp9RBn9Su9HDg01r8kaK3EVMhWF
         v9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hajm4OA2mR1rqKBWo1oPRyQ75UieT0Vx1ZnO7YitzIM=;
        b=z70XkiH2NGmtAtHattaH6UB4GV+988PBJwoQYJkJ/iftam1D068s1rOKIH2QzwNclj
         f2aFUt11kE1nijbcMIwGi3Nq7FHIfHkTY8VmHbYtMaxV+jjhsQ0snJjQudsvwsCosidR
         BVoC7jzgkBS1YXBugV3SSBKKveizofBmaa3fvTYICxLbXnVfWWkeedP6dVdoITEyHo+L
         00fg8A2H+jSqIq0cHjf1tR7lf6hUFWwW1otP+WaD6d1Zz3CYvqtERFmcJJikhBULr13f
         aylHy1la0tACvfplAoDUeIGZMs7mDNQfh88GzO6UpamNjEptV6Z5X5ob/eWWEmFQ5qcv
         tpSQ==
X-Gm-Message-State: AOAM531Lbzhh+U4WQqfkTdGpUmznGyNfrAK73Ufvjd1m2gzZrjoNzB9h
	A9sBooliReySq1WWltcpt5+QucRfkOY=
X-Google-Smtp-Source: ABdhPJxzTfRun3YkUwibQaiDMstuUa+taVcJp9VRWabBxAHUy/4zPZawhc2OjDWcR5BYP0Abgva61g==
X-Received: by 2002:a05:6512:3054:: with SMTP id b20mr2857353lfb.359.1640034976971;
        Mon, 20 Dec 2021 13:16:16 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V2 03/10] iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
Date: Mon, 20 Dec 2021 23:15:50 +0200
Message-Id: <1640034957-19764-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
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
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes V1 -> V2:
   - add R-b
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


