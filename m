Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EC066B7C9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 08:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478335.741459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJY9-0007BE-MH; Mon, 16 Jan 2023 07:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478335.741459; Mon, 16 Jan 2023 07:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJY9-00077g-J2; Mon, 16 Jan 2023 07:04:57 +0000
Received: by outflank-mailman (input) for mailman id 478335;
 Mon, 16 Jan 2023 07:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85+=5N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pHJY8-0006sD-22
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 07:04:56 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13e88359-956c-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 08:04:54 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id bk15so8323180ejb.9
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 23:04:54 -0800 (PST)
Received: from uni.router.wind (adsl-67.109.242.224.tellas.gr.
 [109.242.224.67]) by smtp.googlemail.com with ESMTPSA id
 v15-20020a056402184f00b0046c5baa1f58sm10990824edy.97.2023.01.15.23.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 23:04:53 -0800 (PST)
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
X-Inumbo-ID: 13e88359-956c-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53CNedcl2LpaLrX+og6xiNzpDo61T+Xa5G/+nq0djig=;
        b=MNH32xpmk7O4JRawfjj/7+WeXgb4/eJew9BrD/cd8foYWnF0gDYh8WQ8C3uRq5AYtk
         Qfav2j+zCsIOEpVnwniTyBOWWr74Z7+9OtWaUIeq2RjbV7hX9nD5ICoQ75YPwkLu3pJi
         xJMrTMjPQqBVU/6rloVRHTMKx7nCFUaOl+8h7GJF1dRxLHZ1RHdLZ/HVBcw1AS6+CDKN
         63cT+jWdAg6jwsdTUL2Yu8RVUOUWauvqPWf/3u9JA6VXHf2Bluryq49fGSuQcYCLwAuM
         kBdlSya9+z6pR81KUkAWbI3oQjVVv/D+7t/PiNyY4UsB1YsXH24zJbKNtsJmqO4Ffxs4
         UGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53CNedcl2LpaLrX+og6xiNzpDo61T+Xa5G/+nq0djig=;
        b=CGyeaM5168WHWwKH1TiKizHBZNfUKN0RQhChrj4A+riRwW94QLx76B/F+iuREbR4b5
         rZ+Dd3xcF7Om9NoE036Eo/1M0MachzeTx5q7JAzWlB45Fk9XYJ3iQmo2ey0uIIbK1tyS
         nTES96qETAXFPTvZArgbRsYoe6Bq/9xShM41ZSKgYQUKzxM3vy4nF1vvZI1f2IxX7emo
         7wV3hSVPstuqNSHC2JJh9TKIRgcWt5g27D85xqbN3F2CjgODo9Wb+S5Yelb8MWkIE1re
         w39WpXmiisrg3Wp4pjBDm4rGxV7i0XLYVofO/sgucStPR6US50GEM9J9VFtVlZqTgbvV
         6XKQ==
X-Gm-Message-State: AFqh2kpw5YsWbDRNMFbCB1iArIvHfGKXlf0/A6a4VoUKHOSRHRlCLxIs
	CLuYwoMaKx1bUPmNT6oJ1qwOyzvzM7I=
X-Google-Smtp-Source: AMrXdXvYHQUxlrIBRDsIC5Fy1aNpHLbbszebpSlbeaCjwNkQKFFzRNI23dtm/XQgoBdr9Tuia50AsA==
X-Received: by 2002:a17:907:1316:b0:863:e08e:2ac3 with SMTP id vj22-20020a170907131600b00863e08e2ac3mr10398478ejb.63.1673852693562;
        Sun, 15 Jan 2023 23:04:53 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/8] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi specific
Date: Mon, 16 Jan 2023 09:04:24 +0200
Message-Id: <20230116070431.905594-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230116070431.905594-1-burzalodowa@gmail.com>
References: <20230116070431.905594-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move its definition to the AMD-Vi driver and use CONFIG_AMD_IOMMU
to guard its usage in common code.

Take the opportunity to replace bool_t with bool and 1 with true.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - the second arg of no_config_param() should have been the parameter name,
    i.e "iommu", and not the boolean suboption "amd-iommu-perdev-intremap"

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
index 5e2a720d29..9d95fb27d0 100644
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
+            no_config_param("AMD_IOMMU", "iommu", s, ss);
+#endif
         else if ( (val = parse_boolean("dom0-passthrough", s, ss)) >= 0 )
             iommu_hwdom_passthrough = val;
         else if ( (val = parse_boolean("dom0-strict", s, ss)) >= 0 )
-- 
2.37.2


