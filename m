Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FEA65CE8F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 09:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470985.730690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOc-0000mI-0p; Wed, 04 Jan 2023 08:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470985.730690; Wed, 04 Jan 2023 08:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOb-0000k7-SS; Wed, 04 Jan 2023 08:45:13 +0000
Received: by outflank-mailman (input) for mailman id 470985;
 Wed, 04 Jan 2023 08:45:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfqB=5B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pCzOZ-0008Pe-JT
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 08:45:11 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 192bf692-8c0c-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 09:45:10 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id m21so47531507edc.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 00:45:10 -0800 (PST)
Received: from uni.router.wind (adsl-57.109.242.233.tellas.gr.
 [109.242.233.57]) by smtp.googlemail.com with ESMTPSA id
 k22-20020a170906129600b007c10fe64c5dsm15016382ejb.86.2023.01.04.00.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 00:45:10 -0800 (PST)
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
X-Inumbo-ID: 192bf692-8c0c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FErdG0bpTyu0YrAGq/30Jx78fTnJ4dyc3jWhGGqv2No=;
        b=qcSJvgIbcIVR8siwzqOdvogq8s0VHZTvIkzMO4poTEVOg2oi34sCvhNjBA68pbp6/c
         oDYUTImvkzAXzSsv4EEunLBJSB5/Z1RyCpcVyeiopQGkcdFGFVHZOIQGvy4sPsP7dzQ7
         oIjr6PInSK5S792qgowN7s9Nkot8vOLo43qTK9FDBWi/p05O6Sex6mx/DpXc0G/1riCB
         Slw9YvtQRRQm5uxl1zVVddLMM4fWRYsLvX3Dqrbfvy5BG0D4uCCT+B3EL2tg1dlI3Hx9
         shVf/l3/rsEHRL14qYRlbC1YAXccLTqlnn6aSv/rlynLQEkp0ECG/O04YL+r6mhV7TeT
         WcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FErdG0bpTyu0YrAGq/30Jx78fTnJ4dyc3jWhGGqv2No=;
        b=WOXSfMjdP0o+diG+ChXXCFPZIz8E98QnYd46Ekcgy/JOTg1iGbPf91eKm3klAI5ifB
         ZwNOJn3cwxN16wtrStztJbRo7edBRKia0fuST+TVe5aqw3JQR2dcCjJ30VJvvcKSnRoq
         c4LDxjps/sIqsyXWA5e2voivb9OdWNve6haPaTmZVGsy2qkSBZuTBPjBa4ItnskIWfmE
         /YtPPSgn6Cok1iYcCJ3qDRvdMgofQBaTmMprUv/HNeGqAhYi5gzrfuCnCIHjLLYG32O+
         Ukg2ZoHrttBUVw+j1RaGFXxw5X7Q3+17spA2TGAyy8SEJDaMFjpGIG8DLK3BSTcJqWCD
         JbmQ==
X-Gm-Message-State: AFqh2koky4frLRCSOM61evC5KJjBts9OYBCs7yosFiloSr9rXpO/MpKl
	Tgbiylzf3xsKwt8/Nty7nsRP5p2A9bY=
X-Google-Smtp-Source: AMrXdXtrV1AIwj0GTEIapqRqGaPwRkP//LOEvC89r7CXGAfVOJlmo1Xm/ZybUic50a87TCyZTzoBpQ==
X-Received: by 2002:a05:6402:1119:b0:472:46bf:fb3c with SMTP id u25-20020a056402111900b0047246bffb3cmr39919587edv.35.1672821910348;
        Wed, 04 Jan 2023 00:45:10 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/8] x86/iommu: iommu_igfx, iommu_qinval and iommu_snoop are VT-d specific
Date: Wed,  4 Jan 2023 10:44:57 +0200
Message-Id: <20230104084502.61734-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104084502.61734-1-burzalodowa@gmail.com>
References: <20230104084502.61734-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use CONFIG_INTEL_IOMMU to guard their usage in common code.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - replace CONFIG_INTEL_VTD with CONFIG_INTEL_IOMMU

 xen/drivers/passthrough/iommu.c | 4 +++-
 xen/include/xen/iommu.h         | 6 +++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 998dfaf20d..a2c67a17cd 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -82,11 +82,13 @@ static int __init cf_check parse_iommu_param(const char *s)
         else if ( ss == s + 23 && !strncmp(s, "quarantine=scratch-page", 23) )
             iommu_quarantine = IOMMU_quarantine_scratch_page;
 #endif
-#ifdef CONFIG_X86
+#ifdef CONFIG_INTEL_IOMMU
         else if ( (val = parse_boolean("igfx", s, ss)) >= 0 )
             iommu_igfx = val;
         else if ( (val = parse_boolean("qinval", s, ss)) >= 0 )
             iommu_qinval = val;
+#endif
+#ifdef CONFIG_X86
         else if ( (val = parse_boolean("superpages", s, ss)) >= 0 )
             iommu_superpages = val;
 #endif
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 4f22fc1bed..aa924541d5 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -74,9 +74,13 @@ extern enum __packed iommu_intremap {
    iommu_intremap_restricted,
    iommu_intremap_full,
 } iommu_intremap;
-extern bool iommu_igfx, iommu_qinval, iommu_snoop;
 #else
 # define iommu_intremap false
+#endif
+
+#ifdef CONFIG_INTEL_IOMMU
+extern bool iommu_igfx, iommu_qinval, iommu_snoop;
+#else
 # define iommu_snoop false
 #endif
 
-- 
2.37.2


