Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88166B7C8
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 08:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478339.741497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYI-0008Iw-O4; Mon, 16 Jan 2023 07:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478339.741497; Mon, 16 Jan 2023 07:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYI-0008I6-Jx; Mon, 16 Jan 2023 07:05:06 +0000
Received: by outflank-mailman (input) for mailman id 478339;
 Mon, 16 Jan 2023 07:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85+=5N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pHJYH-0006sD-G2
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 07:05:05 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19843c94-956c-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 08:05:03 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id x10so36565834edd.10
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 23:05:03 -0800 (PST)
Received: from uni.router.wind (adsl-67.109.242.224.tellas.gr.
 [109.242.224.67]) by smtp.googlemail.com with ESMTPSA id
 v15-20020a056402184f00b0046c5baa1f58sm10990824edy.97.2023.01.15.23.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 23:05:02 -0800 (PST)
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
X-Inumbo-ID: 19843c94-956c-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dy2BgTNKVXOkcEoPRHI+Qc+RIk111AGiSJu7FgSGxM=;
        b=JavYjN879rVFqWYTMfx5K7T7u+VhhAZtIXkySIIz3B+qj6EJzd+Nzv34MpCwey9i5M
         ZZ7w3kI9WnYByK1t1wC3JITstU/8mIyys9/jlHrXaUscW155uUIIQpSSc7eRcd3rnMBi
         Vu+YyQhjpdDMqB1OwDPuS/ycjiBxIoHu1aqoNPD4W7GjJLGNOzhRwy/54TStKoK6BTMb
         PLD9fAFgyU8x/jf6YUUPhx6xRw2wo0m/TUFMZNKsx9oHQsXdNUr/H45H2XnegiuzM4jB
         2cg74rgunfLVgnjCMAyAHW67rYG3GGBvHWxh50h8xs5xnSI8cMTKoSLKFBxSWP2T37Pg
         AWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dy2BgTNKVXOkcEoPRHI+Qc+RIk111AGiSJu7FgSGxM=;
        b=i/AyL56Wt+aacBTWWt6s+MVQVJo7j8EOK6MQ4r4cKmVIyAXw1F0TkpCjzc3U/fzha9
         vqgBkYC6lhyFT2HZgO9ypcJf9TZMcUl30kXTrobBzGsixofMEIyvO5u/1l3OzMuiTUHU
         FuF9PKLE3smDh6JpJCVv6Z6c/nWYcbPY+yd08zNsV68FMlopv0IAU5yvuEjUmreG0VoZ
         1kVwnM5XRjmKCUCvumuBCBVuirnkADbmyZ9GiDo8YcNuOvxCiH7AY9zJAZ2Mrb6QKjzs
         vXVThq6ut6MD2T0wlBddGrmY8siYqKZ/oyY0J4C1LLgs2sPAk9oAMT2dkg+JmCOtoNL7
         ZfwQ==
X-Gm-Message-State: AFqh2kqFHhZv8xnHpebKtNSJGWV0DUlXvAfSWMGrm1f/bFWmOG5uOIDo
	C1Rmr/dc1U03bHJdFLOdK4h5rk/V2iY=
X-Google-Smtp-Source: AMrXdXsD39gY8491njMzdZaxfuDf6M6qULTZ1eY93Aw31t7bwSMmoksTT7XyzW2FArG1yunOZoa3nQ==
X-Received: by 2002:a05:6402:b55:b0:49d:d8ec:cbd3 with SMTP id bx21-20020a0564020b5500b0049dd8eccbd3mr6984361edb.16.1673852702961;
        Sun, 15 Jan 2023 23:05:02 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 5/8] x86/iommu: make code addressing CVE-2011-1898 no VT-d specific
Date: Mon, 16 Jan 2023 09:04:28 +0200
Message-Id: <20230116070431.905594-6-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230116070431.905594-1-burzalodowa@gmail.com>
References: <20230116070431.905594-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable untrusted_msi indicates whether the system is vulnerable to
CVE-2011-1898 due to the absence of interrupt remapping  support.
AMD iommus with interrupt remapping disabled are also exposed.
Therefore move the definition of the variable to the common x86 iommu code.

Also, since the current implementation assumes that only PV guests are prone
to this attack, take the opportunity to define untrusted_msi only when PV is
enabled.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - change untrusted_msi from being VT-d specific to PV specific and
    update commit log accordingly
  - remove unnecessary #ifdef guard from its declaration

 xen/drivers/passthrough/vtd/iommu.c | 3 ---
 xen/drivers/passthrough/x86/iommu.c | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 62e143125d..dae2426cb9 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -54,9 +54,6 @@
                                  ? dom_iommu(d)->arch.vtd.pgd_maddr \
                                  : (pdev)->arch.vtd.pgd_maddr)
 
-/* Possible unfiltered LAPIC/MSI messages from untrusted sources? */
-bool __read_mostly untrusted_msi;
-
 bool __read_mostly iommu_igfx = true;
 bool __read_mostly iommu_qinval = true;
 #ifndef iommu_snoop
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index f671b0f2bb..c5021ea023 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -36,6 +36,11 @@ bool __initdata iommu_superpages = true;
 
 enum iommu_intremap __read_mostly iommu_intremap = iommu_intremap_full;
 
+#ifdef CONFIG_PV
+/* Possible unfiltered LAPIC/MSI messages from untrusted sources? */
+bool __read_mostly untrusted_msi;
+#endif
+
 #ifndef iommu_intpost
 /*
  * In the current implementation of VT-d posted interrupts, in some extreme
-- 
2.37.2


