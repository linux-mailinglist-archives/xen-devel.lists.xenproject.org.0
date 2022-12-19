Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B678650797
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 07:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465756.724546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kD-0003EQ-61; Mon, 19 Dec 2022 06:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465756.724546; Mon, 19 Dec 2022 06:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kC-0003B3-VZ; Mon, 19 Dec 2022 06:35:24 +0000
Received: by outflank-mailman (input) for mailman id 465756;
 Mon, 19 Dec 2022 06:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4Hg=4R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p79kB-000383-ON
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 06:35:23 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50071648-7f67-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 07:35:22 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id gh17so19141369ejb.6
 for <xen-devel@lists.xenproject.org>; Sun, 18 Dec 2022 22:35:22 -0800 (PST)
Received: from uni.router.wind (adsl-211.109.242.226.tellas.gr.
 [109.242.226.211]) by smtp.googlemail.com with ESMTPSA id
 q14-20020a17090676ce00b008302732f569sm77062ejn.78.2022.12.18.22.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 22:35:21 -0800 (PST)
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
X-Inumbo-ID: 50071648-7f67-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTjDMyYZ2FC8KMfcNmUoTcsSKJ98IQZ5VWKAYZsCZM0=;
        b=hy0njpW+wNyVtXhc+Ee8W/5rsUt4CJq/mQhD5wYluvHVJzMQhUwcoh97Y6byogVf46
         7a0dy1snJdukii0fZId/jrUnTK5Hcoo9xtnd3yPYCjSOVTOn3E3hayJz6uoJWwhzY4HN
         ehwplQcV1TYQ9w5hv3pl07GzIkpzkQEWkEHyL65phyg0VBPI7Gz76Gj3ID7DlYzIzPY8
         gVFDuYHJLtI4YHHZUqtrubA9oVj/tc1R0jQx2QAqY8fzM3rKEU6s3HGfuDtK6ZS3tOdc
         zcLTqGv1DX1vdq43Kc5LAp6ZMQ/RD7fzWrdHqX/LT23V2oncegxCWmnGZLR4Dn0Jcj++
         /5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTjDMyYZ2FC8KMfcNmUoTcsSKJ98IQZ5VWKAYZsCZM0=;
        b=HEvVwgP+u8qQvn/rvK/ilB1Akqajg9UTeSpvxyZiLgh0t5Z6TBp4jcnJggo7bSfflD
         gpJ7YovRO1iVd360hKaEwxwjaPMEeu+/EotSojItUA1MmokHItUQ5cSVQU3h5n7ofaOT
         1arVn/aYzsQAJXYwCIfbzW8TyzW3ilrdLMRY0yAet1UgoGr85iXOTNHCjds5EfvhWMqO
         FBk6IPJt5F3JJwAm44d/GmkVT4HNkCbRKasI+SequhQ8mlKx18keWnJ8Y0SnvL53+X8J
         s3sZHPK83mQeJI734kpLrYURmB068dCI8HkSRh9s7U8E+oR3oonjYTs2kUSnJYCsNkrN
         EHUw==
X-Gm-Message-State: ANoB5pnjMv3HIsF4JyATKEIRCJ+qurfl/J+nhuYF5Los9McWDuCTd6b+
	GPbunERF9J/WZBwCfN0+wxK+aiQLZ9E=
X-Google-Smtp-Source: AA0mqf6MN4kcF11s0TKqySAj6gHdfUpldWz3YfzclcD6iKya4IRmWW77oO5q0NR41jNZMMfaevFPyw==
X-Received: by 2002:a17:906:f8cd:b0:7c0:e7ad:5296 with SMTP id lh13-20020a170906f8cd00b007c0e7ad5296mr32665117ejb.55.1671431721502;
        Sun, 18 Dec 2022 22:35:21 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 1/7] x86/iommu: make AMD-Vi and Intel VT-d support configurable
Date: Mon, 19 Dec 2022 08:34:50 +0200
Message-Id: <20221219063456.2017996-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221219063456.2017996-1-burzalodowa@gmail.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, for x86 platforms, Xen does not provide to the users any
configuration control over the IOMMU support and can only be built with
both AMD and Intel IOMMU drivers enabled.
However, there are use cases, e.g in safety-critical systems, that require
Xen to be able to be configured to exclude unused code. A smaller tailored
configuration would help Xen to meet faster certification requirements for
individual platforms.

Introduce two new Kconfig options, AMD_IOMMU and INTEL_VTD, to allow code
specific to each IOMMU technology to be separated and, when not required,
stripped. AMD_IOMMU enables IOMMU support for platforms that implement the
AMD I/O Virtualization Technology. INTEL_VTD enables IOMMU support for
platforms that implement the Intel Virtualization Technology for Directed I/O.

Since no functional change is intended regarding the default configuration
of an x86 system, both options depend on x86 and default to 'y'.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/drivers/passthrough/Kconfig  | 16 ++++++++++++++++
 xen/drivers/passthrough/Makefile |  4 ++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 479d7de57a..82465aa627 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -37,6 +37,22 @@ config IPMMU_VMSA
 
 endif
 
+config AMD_IOMMU
+	bool "AMD IOMMU"
+	depends on X86
+	default y
+	---help---
+	  Enables I/O virtualization on platforms that implement the
+	  AMD I/O Virtualization Technology (IOMMU).
+
+config INTEL_VTD
+	bool "Intel VT-d"
+	depends on X86
+	default y
+	---help---
+	  Enables I/O virtualization on platforms that implement the
+	  Intel Virtualization Technology for Directed I/O (Intel VT-d).
+
 config IOMMU_FORCE_PT_SHARE
 	bool
 
diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
index a5efa22714..d4fc7a3ddc 100644
--- a/xen/drivers/passthrough/Makefile
+++ b/xen/drivers/passthrough/Makefile
@@ -1,5 +1,5 @@
-obj-$(CONFIG_X86) += vtd/
-obj-$(CONFIG_X86) += amd/
+obj-$(CONFIG_INTEL_VTD) += vtd/
+obj-$(CONFIG_AMD_IOMMU) += amd/
 obj-$(CONFIG_X86) += x86/
 obj-$(CONFIG_ARM) += arm/
 
-- 
2.37.2


