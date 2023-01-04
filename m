Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1665CE97
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 09:45:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470982.730658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOZ-0008Sa-Bq; Wed, 04 Jan 2023 08:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470982.730658; Wed, 04 Jan 2023 08:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOZ-0008Pv-6k; Wed, 04 Jan 2023 08:45:11 +0000
Received: by outflank-mailman (input) for mailman id 470982;
 Wed, 04 Jan 2023 08:45:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfqB=5B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pCzOX-0008Pe-Qd
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 08:45:09 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17e4f316-8c0c-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 09:45:08 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id kw15so80791239ejc.10
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 00:45:08 -0800 (PST)
Received: from uni.router.wind (adsl-57.109.242.233.tellas.gr.
 [109.242.233.57]) by smtp.googlemail.com with ESMTPSA id
 k22-20020a170906129600b007c10fe64c5dsm15016382ejb.86.2023.01.04.00.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 00:45:07 -0800 (PST)
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
X-Inumbo-ID: 17e4f316-8c0c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U41p6PerASg/ei7rzLx/hT3otWDVCdBfixYygyAySwk=;
        b=CAgRsne3K9cYsoKps2JWLBhsdMVSIAip+bDt2+YOPYqa60Nwgh5iMJu69YQh0xbaI8
         61pO1+Er9QCvpY2ZfiM8RPYU1eqqYFxaKvpDkmdJvaoPA52aqLQ0KHWkTn1jIc8Z+H7R
         dEFEZIez3O7qkF4W/2iQ5X8WSpy+XyeMn99Jp0DC4CUj8lKYfsYv4dq4Xra+pEOeU4C8
         SJaTT7Q9j3ZZOsPZqsDnEe22RbGD7o2Y3H/JmaYOM7D5Sv6mY3zy5RqMHVGSva6yqO/b
         zVQLZOTerGCntCmyZzk1NyBdZspKxV/Jum5qWvVGkIlmOQnjZfQqJl6ht5KYUPBtNuVX
         sibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U41p6PerASg/ei7rzLx/hT3otWDVCdBfixYygyAySwk=;
        b=Cetd5oEilMjN4+qysv5IxONRy1hyfKs122I+0/yAR719XsB3dEyqGCRA8n2tGAw3Dv
         33IwbdfNcrsjJ8sORzKIOgTY3N2VTRoHDJCy3pG5czjSwkVKUNH6/eJ0jC4dG7t3Buqd
         6sowMtCDbcAQYOkW436xIm3P+/yKbfMjAucQfTxjr15I4k7dE8ZBmezjiXiFj2ERi0S/
         CX8T/FaixqDCyYf4kFqcXqLzbUmK//Z0H5kGa0V67c9jnCn9CBctU8+48RXu7AqbZCQI
         eRWjin5ywsjSPdmErvwV2Fl+9kJZB3KGOhD6fYVEKW/3Ov2AHRvxj+gqJn6E+QaUTGVI
         XjJg==
X-Gm-Message-State: AFqh2kr3RNrs2loScO146FnigipSbPcfY/zTdDxuHt5MQ7pkdFA0+BZI
	miVKnbMD6fi2NnBBu1e8vREeM8tzX38=
X-Google-Smtp-Source: AMrXdXs/+Vz7qVltCpOMZdgYin4fHcD0O3cVt2uL1v+aHewb2ycGe0IGJJHzHLbfcfM3tR+DqK94yA==
X-Received: by 2002:a17:907:a708:b0:82e:a59a:5c3e with SMTP id vw8-20020a170907a70800b0082ea59a5c3emr52269642ejc.10.1672821908187;
        Wed, 04 Jan 2023 00:45:08 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/8] x86/iommu: introduce AMD-Vi and Intel VT-d Kconfig options
Date: Wed,  4 Jan 2023 10:44:55 +0200
Message-Id: <20230104084502.61734-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104084502.61734-1-burzalodowa@gmail.com>
References: <20230104084502.61734-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce two new Kconfig options, AMD_IOMMU and INTEL_IOMMU, to allow code
specific to each IOMMU technology to be separated and, when not required,
stripped. AMD_IOMMU will be used to enable IOMMU support for platforms that
implement the AMD I/O Virtualization Technology. INTEL_IOMMU will be used to
enable IOMMU support for platforms that implement the Intel Virtualization
Technology for Directed I/O.

Since, at this point, disabling any of them would cause Xen to not compile,
the options are not visible to the user and are enabled by default if X86.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - just introduce the new options but not make them selectable by the user
  - adjust commit message
  - replace CONFIG_INTEL_VTD with CONFIG_INTEL_IOMMU

 xen/drivers/passthrough/Kconfig  | 6 ++++++
 xen/drivers/passthrough/Makefile | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 479d7de57a..5c65567744 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -37,6 +37,12 @@ config IPMMU_VMSA
 
 endif
 
+config AMD_IOMMU
+	def_bool y if X86
+
+config INTEL_IOMMU
+	def_bool y if X86
+
 config IOMMU_FORCE_PT_SHARE
 	bool
 
diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
index a5efa22714..a1621540b7 100644
--- a/xen/drivers/passthrough/Makefile
+++ b/xen/drivers/passthrough/Makefile
@@ -1,5 +1,5 @@
-obj-$(CONFIG_X86) += vtd/
-obj-$(CONFIG_X86) += amd/
+obj-$(CONFIG_INTEL_IOMMU) += vtd/
+obj-$(CONFIG_AMD_IOMMU) += amd/
 obj-$(CONFIG_X86) += x86/
 obj-$(CONFIG_ARM) += arm/
 
-- 
2.37.2


