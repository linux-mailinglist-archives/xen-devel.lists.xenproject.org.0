Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD8F650798
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 07:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465757.724561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kF-0003ft-G9; Mon, 19 Dec 2022 06:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465757.724561; Mon, 19 Dec 2022 06:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kF-0003dE-BA; Mon, 19 Dec 2022 06:35:27 +0000
Received: by outflank-mailman (input) for mailman id 465757;
 Mon, 19 Dec 2022 06:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4Hg=4R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p79kC-000383-81
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 06:35:24 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50cf3775-7f67-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 07:35:23 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id ud5so19149841ejc.4
 for <xen-devel@lists.xenproject.org>; Sun, 18 Dec 2022 22:35:23 -0800 (PST)
Received: from uni.router.wind (adsl-211.109.242.226.tellas.gr.
 [109.242.226.211]) by smtp.googlemail.com with ESMTPSA id
 q14-20020a17090676ce00b008302732f569sm77062ejn.78.2022.12.18.22.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 22:35:22 -0800 (PST)
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
X-Inumbo-ID: 50cf3775-7f67-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80ZpLAZLQqNuZgUmUutfeY71usyNtY5k5j9A+SPx2to=;
        b=gVk9UDmfQbQncVBdtYx4cLWqd0Ht6rE7Z1HkpQymC4w74/GcSix53WlbG4nVBjzL9p
         Ldwq9/aoZdJb1MhMJmoNUJfZt9VmMc0axVhjeZXDyNmqhYJ+z/W19RimnqHghicR3sK0
         sWuI6lZGiIQzHOT0rlo/sAq+/XS7uXgJ9bUvpsn2P2Ml7S6NNFX2LYFw/bM4gH8XCixG
         Mx0rV5Gve85/j4nzAeiJ1gwnvReLogaSsEBAqrg90RjMv6DdmiN2DAXX3X4uMql5u7oG
         WiojAQYJdoxytf19LwPzsfGsPPuF3ExR0kHljutGpBf+b4N20BCOsNFHMky1zgP5KSAs
         9mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80ZpLAZLQqNuZgUmUutfeY71usyNtY5k5j9A+SPx2to=;
        b=DywuTsUj43h2qFlaVNPOplA0ZxxMYAUkRw0IN6CkdMlY3Miuq9pHuvp8O931JzWOfc
         aN9N54NvfJS6pbbSjDuQzcAsKW7eJpKkBFGxHb1uFNYoLZXSszQd6y0MkDXTODpXSeDv
         X3QN7H9fa+LO5VkuJ4/GWp9TnxVxb+O9H+m9+UjZj3+TuJJy72ZRZ8zadZxGaWIeS7n+
         ewAbBvQ+73iC2RQ7bhLS9m1AjOIKRea5id8XfQQ3byWlLPfW4ww+tooZ/HYRvaEDuyyo
         yT2vY6Wd6mIJ+jKszxROKB2furtrhOur80KVqObN+RADvlS4vlry6ijjb/9bsJuhYEup
         moNg==
X-Gm-Message-State: ANoB5pn4nq4oMAdpMLfvHeqWK1X+HG9HmrVubkZE2rXIJPrUt/fQ2awR
	hWdq5Lv9tR1A674jEYwfzS4dWOXwD9E=
X-Google-Smtp-Source: AA0mqf5J1elLvocK/Jvfp9+6inR60vFTgMRDu7J1Mc4W50gcC0qsLz/dE1X2Xxw0QJBt8Eo/vQN45g==
X-Received: by 2002:a17:907:970b:b0:7c1:9462:2dd3 with SMTP id jg11-20020a170907970b00b007c194622dd3mr23090216ejc.70.1671431722829;
        Sun, 18 Dec 2022 22:35:22 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 2/7] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi specific
Date: Mon, 19 Dec 2022 08:34:51 +0200
Message-Id: <20221219063456.2017996-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221219063456.2017996-1-burzalodowa@gmail.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move its definition to the AMD-Vi driver and use CONFIG_AMD_IOMMU
to guard its usage in common code.

Take the opportunity to replace bool_t with bool and 1 with true.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/drivers/passthrough/amd/iommu_init.c | 2 ++
 xen/drivers/passthrough/iommu.c          | 3 ++-
 xen/include/xen/iommu.h                  | 4 +++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 1f14aaf49e..c4a41630e5 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -36,6 +36,8 @@ static struct radix_tree_root ivrs_maps;
 LIST_HEAD_READ_MOSTLY(amd_iommu_head);
 bool_t iommuv2_enabled;
 
+bool __read_mostly amd_iommu_perdev_intremap = true;
+
 static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
 {
     return iommu->ht_flags & mask;
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 5e2a720d29..1a02fdc453 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -58,7 +58,6 @@ bool __read_mostly iommu_hap_pt_share = true;
 #endif
 
 bool_t __read_mostly iommu_debug;
-bool_t __read_mostly amd_iommu_perdev_intremap = 1;
 
 DEFINE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
 
@@ -115,8 +114,10 @@ static int __init cf_check parse_iommu_param(const char *s)
             if ( val )
                 iommu_verbose = 1;
         }
+#ifdef CONFIG_AMD_IOMMU
         else if ( (val = parse_boolean("amd-iommu-perdev-intremap", s, ss)) >= 0 )
             amd_iommu_perdev_intremap = val;
+#endif
         else if ( (val = parse_boolean("dom0-passthrough", s, ss)) >= 0 )
             iommu_hwdom_passthrough = val;
         else if ( (val = parse_boolean("dom0-strict", s, ss)) >= 0 )
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 4f22fc1bed..6b06732792 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -104,7 +104,9 @@ static inline void clear_iommu_hap_pt_share(void)
 }
 
 extern bool_t iommu_debug;
-extern bool_t amd_iommu_perdev_intremap;
+#ifdef CONFIG_AMD_IOMMU
+extern bool amd_iommu_perdev_intremap;
+#endif
 
 extern bool iommu_hwdom_strict, iommu_hwdom_passthrough, iommu_hwdom_inclusive;
 extern int8_t iommu_hwdom_reserved;
-- 
2.37.2


