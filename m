Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F8D66B7C5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 08:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478336.741467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYB-0007QX-UW; Mon, 16 Jan 2023 07:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478336.741467; Mon, 16 Jan 2023 07:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYB-0007Ng-Qt; Mon, 16 Jan 2023 07:04:59 +0000
Received: by outflank-mailman (input) for mailman id 478336;
 Mon, 16 Jan 2023 07:04:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85+=5N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pHJY9-00077f-Su
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 07:04:58 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 154c79fc-956c-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 08:04:56 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id y19so5875906edc.2
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 23:04:56 -0800 (PST)
Received: from uni.router.wind (adsl-67.109.242.224.tellas.gr.
 [109.242.224.67]) by smtp.googlemail.com with ESMTPSA id
 v15-20020a056402184f00b0046c5baa1f58sm10990824edy.97.2023.01.15.23.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 23:04:55 -0800 (PST)
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
X-Inumbo-ID: 154c79fc-956c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1neDOzq+0HPMCn8Gxw25YMbFizPFUqx82cwaRPbvKM=;
        b=YOCIbQpk3MkERrpCOGsmLsudRonoBRC3lSPg7RQfcsd9xhfXCk/KBTc+DRSht/tUU6
         4pBhqpOIL2L610GIkFzYARa64U0yDQzYqZLoih7RlffrZqM8q5vgK13RnpWMstTwdn2S
         Bl8uYGk3qQw4JwXGKcKrbTL0iBGVJGbje/wuZHVJWH2bKGdBWRwBpRtjrH1K+dI+YQ0i
         fc6ipaQ4lkdu/Jq6RYDwcv5yAbcamm1PHHWgUBPIcTN1ea5jWTsIXHssi3BIov31xugU
         ZsTvaPTvQQPtunNGSCXV6pfEPDmsbgBEZD1fDiY/sAyrIxnN5UUcMYp6Of6+qY/+rCP1
         a4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1neDOzq+0HPMCn8Gxw25YMbFizPFUqx82cwaRPbvKM=;
        b=pJcmf0Kamzb+tSTGZm+tlZeP2P1XwzJepKmZVdN6K53Kle9vc6WjGZFy2qpv3c256d
         HeYElcArT5zU30p66XVsjhEgIlyPw9ntw7Bekdf4oSeZjHtaUo/84Gc8T1Zu9SPuYamL
         VyjwXQj5HD3DBkXpK6I0kPyryt+S9g7cuzvT1rtbDdrTUrOvN0ZJQ+oc8L+7p7giLM40
         RFaWnQVPSPZmaR6GoIvs9KbgHyRCAHhbuehl8mdOUoLBH1Hc8ghUPSGDj4b4G3w0oEYf
         +Z1OwQwoiTLiIYns/p8lIl+GbGaF8W4oCvWKBeb7zzH+XGEIGkA6QPw8+bOrZ5hYtkk1
         d0ww==
X-Gm-Message-State: AFqh2ko3ipfIEnCSWv3u4BYu7HtLC/7hUswzJ+b2ZYqULA2z1k7ooyzz
	qWK/X43s2x0RTR3hHcP8PxiZyfBhFWo=
X-Google-Smtp-Source: AMrXdXs4zO27qoHXCunCPvFvXsJ+dOF/tfY+KglxUAtIxkhOZZxJK9V4h89mHXIwXNl/jGdEx7nhpQ==
X-Received: by 2002:a50:ed91:0:b0:48e:c073:9453 with SMTP id h17-20020a50ed91000000b0048ec0739453mr10559134edr.15.1673852695898;
        Sun, 15 Jan 2023 23:04:55 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/8] x86/iommu: iommu_igfx and iommu_qinval are Intel VT-d specific
Date: Mon, 16 Jan 2023 09:04:25 +0200
Message-Id: <20230116070431.905594-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230116070431.905594-1-burzalodowa@gmail.com>
References: <20230116070431.905594-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use CONFIG_INTEL_IOMMU to guard the usage of iommu_igfx and iommu_qinval
in common code.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - handle iommu_snoop case in a different patch and update commit msg
  - use no_config_param() to print a warning when the user sets an INTEL_IOMMU
    specific string in the iommu boot parameter and INTEL_IOMMU is disabled

 xen/drivers/passthrough/iommu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 9d95fb27d0..b4dfa95dfd 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -82,11 +82,19 @@ static int __init cf_check parse_iommu_param(const char *s)
         else if ( ss == s + 23 && !strncmp(s, "quarantine=scratch-page", 23) )
             iommu_quarantine = IOMMU_quarantine_scratch_page;
 #endif
-#ifdef CONFIG_X86
         else if ( (val = parse_boolean("igfx", s, ss)) >= 0 )
+#ifdef CONFIG_INTEL_IOMMU
             iommu_igfx = val;
+#else
+            no_config_param("INTEL_IOMMU", "iommu", s, ss);
+#endif
         else if ( (val = parse_boolean("qinval", s, ss)) >= 0 )
+#ifdef CONFIG_INTEL_IOMMU
             iommu_qinval = val;
+#else
+            no_config_param("INTEL_IOMMU", "iommu", s, ss);
+#endif
+#ifdef CONFIG_X86
         else if ( (val = parse_boolean("superpages", s, ss)) >= 0 )
             iommu_superpages = val;
 #endif
-- 
2.37.2


