Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CDB650796
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 07:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465758.724566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kF-0003iJ-Mr; Mon, 19 Dec 2022 06:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465758.724566; Mon, 19 Dec 2022 06:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kF-0003fp-Ie; Mon, 19 Dec 2022 06:35:27 +0000
Received: by outflank-mailman (input) for mailman id 465758;
 Mon, 19 Dec 2022 06:35:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4Hg=4R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p79kD-000383-CO
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 06:35:25 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51929e85-7f67-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 07:35:24 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id n20so19253695ejh.0
 for <xen-devel@lists.xenproject.org>; Sun, 18 Dec 2022 22:35:24 -0800 (PST)
Received: from uni.router.wind (adsl-211.109.242.226.tellas.gr.
 [109.242.226.211]) by smtp.googlemail.com with ESMTPSA id
 q14-20020a17090676ce00b008302732f569sm77062ejn.78.2022.12.18.22.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 22:35:23 -0800 (PST)
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
X-Inumbo-ID: 51929e85-7f67-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmiLQ17qWs8UoQg0QXOFkwzdMxwKqjmh4/5E65N65dA=;
        b=WyPTmXR5gBKo9Tt3/PPPQ/O2Qq/NENBf8C6ZeIBcgx1HaWblaj8RJwjoMi1Agk1+n4
         j8hWANySials13BIHnH/F38dJsI6lBe/qMsRp715PYk6j5KnI+UZ2iTHk8fQMfAkfWGS
         gjVklc3Pn15ivC7xwKk/klEUVYqAJ4QrV42GIrJ4oZ4V9PBo1GlI+ipD+xB85axDwk25
         fkGJqOJvuwOX9XmRihsNK8Gmq7VAsFnne11eRZTxgk16DeEpkEvZWey0F6+MzrNWSUPg
         f1PNO4wn5Q4m4gAMhhiCS0KBRoqfGKDxDJH7U3S7HEVFXtgt5XVxjtO198we+3yNpdSQ
         Z+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmiLQ17qWs8UoQg0QXOFkwzdMxwKqjmh4/5E65N65dA=;
        b=AFoNzS3myLw60/8n6VNEXeAWWFrqiazvK0lSDYnbYKrcHpiug5upVFwPfy4vGLLMQo
         uXJ2Y1dIAlC/s/QeO7M1za53Dr1AiTKME0TaRAvPMzWs5c/nhOf6Sjz00trOkJg/jmr4
         8BcFE74sSTpW3ra2FO4e78AoRuc2BH7nb+oGRcyDal3hiwsq45ox8R/WDiNHexO16UTm
         KS5NmKYvMLEXFxLfXsh96QzpxNXN05fMNgKLPfP6lXSdkqeCzru9I0tXh/ZckWVe9ztL
         ooELew7qppGvw87IVrTLDnW/qukTyzEEwuqyIRzJnW9Vd+xUQQX01XoRMl7zykyAWlSK
         3yzA==
X-Gm-Message-State: ANoB5pk2Efp84FI1rS2NPYBOqVNs8paJSPUWSFoGeFeOeZU69reJJO+0
	NyKOEmDtzoDuDFVjf16n0GwW0I8qKWw=
X-Google-Smtp-Source: AA0mqf6m3Yv/zHFs8eKQjoyja6xQDkdrHpT2OHFjWXRpxV7Yyd8NQg1UDqxZkZJ1df88n7sklZ8Umg==
X-Received: by 2002:a17:906:7751:b0:7ae:df97:c020 with SMTP id o17-20020a170906775100b007aedf97c020mr33346832ejn.13.1671431724016;
        Sun, 18 Dec 2022 22:35:24 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 3/7] x86/iommu: iommu_igfx, iommu_qinval and iommu_snoop are VT-d specific
Date: Mon, 19 Dec 2022 08:34:52 +0200
Message-Id: <20221219063456.2017996-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221219063456.2017996-1-burzalodowa@gmail.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use CONFIG_INTEL_VTD to guard their usage in common code.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/drivers/passthrough/iommu.c | 4 +++-
 xen/include/xen/iommu.h         | 6 +++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 1a02fdc453..dcb5ec49ac 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -82,11 +82,13 @@ static int __init cf_check parse_iommu_param(const char *s)
         else if ( ss == s + 23 && !strncmp(s, "quarantine=scratch-page", 23) )
             iommu_quarantine = IOMMU_quarantine_scratch_page;
 #endif
-#ifdef CONFIG_X86
+#ifdef CONFIG_INTEL_VTD
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
index 6b06732792..d9285a7760 100644
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
+#ifdef CONFIG_INTEL_VTD
+extern bool iommu_igfx, iommu_qinval, iommu_snoop;
+#else
 # define iommu_snoop false
 #endif
 
-- 
2.37.2


