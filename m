Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB6AABC049
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 16:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989883.1373854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH19T-0005L8-5F; Mon, 19 May 2025 14:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989883.1373854; Mon, 19 May 2025 14:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH19T-0005IO-2R; Mon, 19 May 2025 14:07:35 +0000
Received: by outflank-mailman (input) for mailman id 989883;
 Mon, 19 May 2025 14:07:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Afj=YD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uH19Q-0005IG-US
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 14:07:32 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a5b2c89-34ba-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 16:07:30 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so48460085e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 07:07:30 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442eb85a8f8sm126141505e9.0.2025.05.19.07.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 07:07:29 -0700 (PDT)
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
X-Inumbo-ID: 9a5b2c89-34ba-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747663650; x=1748268450; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1k8nMQZQL4hONO9wT7+tWYlTJqUYvOSaiCyAXnp+mP4=;
        b=VTzGcrZ0C/9FXPwaeyip1e539taQ3zjf2senycsSjCp+53LlFJBGeNCl9m4bOjkxhB
         G6ZMPam99tLV59aKhFJj7EksnROqOO76PV6PIxajp3MKeKTj03uqZz54GqlvYh/yGsq0
         63Wgx768KYumWdLhO+4kScCI46Mm6dC5u3kWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747663650; x=1748268450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1k8nMQZQL4hONO9wT7+tWYlTJqUYvOSaiCyAXnp+mP4=;
        b=gW79F89aJPXuXxQqUMZfG87L2oWUWVHtSXHiV5hnaGyYUUo/Swl/StuQHIycIU9q1v
         WGREogRpeM0Hacs+F6qcr5QLW2f0tvwO1Dkpa1f4z+GmJEai6zU10HE7AxtIxKpFHD54
         SoLuE3dm3Cd80qC84YkYBzWwYT+FcAogMCLmReYMiaZxeIeKStS4aAQtsweu3Tksg4Iz
         qm6SOiHwNiro+ebqaLCN8BkNQskzfx/p6VRsKgGZop7+GmhTE2cdszcxNzOpKV1zCVbc
         PKf4I3x8OOkWxHdnZ6U9ahHRwJtJ5dryUwGVR/lnBEzfnEtRX/Zko9P+zcjGbFXWtuHk
         LYwQ==
X-Gm-Message-State: AOJu0Yzpd37ZfRzWQ1dnO0KSWWih+PKFGl3eJHYslYmF9/19IgTXaIKh
	EiPjdOXd9nLrPnWAzV3lOB51ECT8Xo4CJjy+OSjk64/stL+bNeTDgVaaC2yneVt/lcNg3EavSlz
	cJxmt
X-Gm-Gg: ASbGncvhsX5mDPpjFtnxWIEtN+oIXZLsn0W9FTiRNIY98RktOwJcWtXtMgI9wdGhTsp
	zeg9ilXtcWmZ5sIwbiW1bszPN0inONsm81wqfp5YJS1J4oyQ9n/eneJdbx9pTsPsVUtRraJ9ZER
	bgx05QQC6l90KWqMmaSs5hpLiRnnWuNm1mGubGxENK6tgQLD7LOz1Ci8Qdh3tulcOgQCEcW3x++
	Lh1uNBG9Ct19F+SjLgVSnOzs8OclkAGV8XcHRLwp7qWs5bqRaYCWdla9XGaO7BDlwAf0qZ6f8G/
	ang1fQubhJkt5oONN3JOOfZR1OIWYtj2HChyGca4oroRJW3AfocvBW3Zul2cJ4DrwMcIoqrgIVl
	yQeAcX+lDS3vvy70j3P8ruO8FFGNw01FM1Ag=
X-Google-Smtp-Source: AGHT+IE6H6jQNmXrQFWxLpEsUCmXS+pAtcqY/yGfuXQWf5nBBPugmTP7rd2+zakIC9/f59Em/vSLJg==
X-Received: by 2002:a05:600c:3114:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-442fd63c6f6mr113232705e9.19.1747663649916;
        Mon, 19 May 2025 07:07:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] CI/eclair: Remove ARM64 custom clean rules
Date: Mon, 19 May 2025 15:07:27 +0100
Message-Id: <20250519140727.28562-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rules 5.3, 11.2 and 16.6 are already listed in clean_guidelines_common and
apply to all architectures.  There's no need for arm64 to give them a second
time.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

I've left the x86/arm split as-before so it's easier for those not familiar
with Eclair syntax to add per-arch configuruation.
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 7e3095423b79..b95f07feb099 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -122,7 +122,7 @@ if(string_equal(target,"x86_64"),
 )
 
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3A2.R5.3||MC3.R11.2||MC3A2.R16.6"})
+    service_selector({"additional_clean_guidelines","none()"})
 )
 
 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}

base-commit: 6fc02ebdd053856221f37ba5306232ac1575332d
prerequisite-patch-id: 7bc1c498ba2c9c4a4939a56a0006f820f47f2a66
prerequisite-patch-id: 8fcd84101ab012ed0aa427c30eca564c5ac10726
-- 
2.39.5


