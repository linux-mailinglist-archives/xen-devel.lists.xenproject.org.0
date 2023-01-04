Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3A965CE93
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 09:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470984.730679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOa-0000WP-OH; Wed, 04 Jan 2023 08:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470984.730679; Wed, 04 Jan 2023 08:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOa-0000Ty-KP; Wed, 04 Jan 2023 08:45:12 +0000
Received: by outflank-mailman (input) for mailman id 470984;
 Wed, 04 Jan 2023 08:45:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfqB=5B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pCzOY-0008Pe-JR
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 08:45:10 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 188b29c4-8c0c-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 09:45:09 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id t17so80776947eju.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 00:45:09 -0800 (PST)
Received: from uni.router.wind (adsl-57.109.242.233.tellas.gr.
 [109.242.233.57]) by smtp.googlemail.com with ESMTPSA id
 k22-20020a170906129600b007c10fe64c5dsm15016382ejb.86.2023.01.04.00.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 00:45:08 -0800 (PST)
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
X-Inumbo-ID: 188b29c4-8c0c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2lVOOqFcf6BKXv3+gSDIksJ5cf6q+xOsktrfoPl6c8=;
        b=QADj/+r42GTlhqcmiLkt+4z4W4FZNfMPjZCt2fEzAMhFmYXlNRG4AeW5EmHS62VS9C
         deBnM3SUhDLULCartyBVBru9Rvh8jSUoTIzJUi8s+HCpOdNcvXwNp5M6aySNHtEgVHxC
         j+mdUyZcm71ul1fTmrg6Aj3MISpCAHrmSL0DZieRsixKoYIKfktRA6Xi4CUJKlrgWTj/
         Fk/QymbzqFYez7sTp/xE0v5aPg61T3FIiqxaDEl43eiJBV+/oe9HAD4CGQOJ3wsz3Q/W
         VhHd6TnDqqUFHUJ5nFlG1ICvDrS10E6WOM6A3y1u6tPIFenJ+CxA3jjQG4+tfX+ZRUAO
         E+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2lVOOqFcf6BKXv3+gSDIksJ5cf6q+xOsktrfoPl6c8=;
        b=bMKwckyJgyQjI04+qh/AL4m67kiVYKuNouIXAQZsLVFcjsQJMZN54deKSrEP7yz7eP
         PHR9KD6Vibbs3ZYKNrjyWO3NBrBniyxz45do0xSdVezhBp2NW7wso6JX75lvqVHE1uua
         aUFPaPqEWMEL4F/DXk592LNPzGUVoddeOVd08xZSdFn7yeEqpES15mn/WCjWr5W6GZ7v
         udswNSW2R+N1JZZ7OkiqJa94k+Cx9EMUx/4+W7NtggasVXf0fvNswgTDayb3Bt6xAh9Q
         vGfz7uXH1tWhTgUunvl/EcDrcuowjOtYXo6O/7qsvHZ49FG67UKTy7h7o6IbsCUSp8y6
         jWkw==
X-Gm-Message-State: AFqh2kqlHzlxcE31nuMxw23xO4aC1Ww+b5vobkiBdENoaoV6s7KuBMvH
	7E/nbYocRqnp6QHuoDbUgE5nMRF5zLQ=
X-Google-Smtp-Source: AMrXdXvItxE5hRpoj+ycvRCaI78Q5RBjmYLhM84Rcmus0xMSC+Kut57gjsLwxguo9onjP5q5CnkkUw==
X-Received: by 2002:a17:907:8b89:b0:7c1:6f86:eeb with SMTP id tb9-20020a1709078b8900b007c16f860eebmr36851095ejc.7.1672821909265;
        Wed, 04 Jan 2023 00:45:09 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/8] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi specific
Date: Wed,  4 Jan 2023 10:44:56 +0200
Message-Id: <20230104084502.61734-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104084502.61734-1-burzalodowa@gmail.com>
References: <20230104084502.61734-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move its definition to the AMD-Vi driver and use CONFIG_AMD_IOMMU
to guard its usage in common code.

Take the opportunity to replace bool_t with bool, __read_mostly with
__ro_after_init and 1 with true.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - declare amd_iommu_perdev_intremap __ro_after_init
  - use no_config_param() to print a warning when the user sets an AMD_IOMMU
    specific string in the iommu boot parameter and AMD_IOMMU is disabled
  - remove the #ifdef CONFIG_AMD_IOMMU guard from the declaration of
    amd_iommu_perdev_intremap in xen/iommu.h

 xen/drivers/passthrough/amd/iommu_init.c | 2 ++
 xen/drivers/passthrough/iommu.c          | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 1f14aaf49e..9773ccfcb4 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -36,6 +36,8 @@ static struct radix_tree_root ivrs_maps;
 LIST_HEAD_READ_MOSTLY(amd_iommu_head);
 bool_t iommuv2_enabled;
 
+bool __ro_after_init amd_iommu_perdev_intremap = true;
+
 static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
 {
     return iommu->ht_flags & mask;
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 5e2a720d29..998dfaf20d 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -58,7 +58,6 @@ bool __read_mostly iommu_hap_pt_share = true;
 #endif
 
 bool_t __read_mostly iommu_debug;
-bool_t __read_mostly amd_iommu_perdev_intremap = 1;
 
 DEFINE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
 
@@ -116,7 +115,11 @@ static int __init cf_check parse_iommu_param(const char *s)
                 iommu_verbose = 1;
         }
         else if ( (val = parse_boolean("amd-iommu-perdev-intremap", s, ss)) >= 0 )
+#ifdef CONFIG_AMD_IOMMU
             amd_iommu_perdev_intremap = val;
+#else
+            no_config_param("AMD_IOMMU", "amd-iommu-perdev-intremap", s, ss);
+#endif
         else if ( (val = parse_boolean("dom0-passthrough", s, ss)) >= 0 )
             iommu_hwdom_passthrough = val;
         else if ( (val = parse_boolean("dom0-strict", s, ss)) >= 0 )
-- 
2.37.2


