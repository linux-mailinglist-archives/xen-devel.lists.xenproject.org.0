Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37877FF1D1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644749.1006216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4H-0005kL-Rm; Thu, 30 Nov 2023 14:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644749.1006216; Thu, 30 Nov 2023 14:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4H-0005dy-NX; Thu, 30 Nov 2023 14:31:05 +0000
Received: by outflank-mailman (input) for mailman id 644749;
 Thu, 30 Nov 2023 14:31:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8i4F-0004Xw-Pj
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:31:03 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1649b7e4-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:31:02 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40b2ad4953cso13322635e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 06:31:02 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 bg28-20020a05600c3c9c00b00405718cbeadsm1482913wmb.1.2023.11.30.06.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:30:59 -0800 (PST)
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
X-Inumbo-ID: 1649b7e4-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701354661; x=1701959461; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnrYiuXdzp9zPzX6PeTg0GoA8oRf3Fko4S7XBz0W3tM=;
        b=TnUAVvWjbMtnk40/CgFjq0pxdPH8/BTNfKqTyN2aWuvKY/K5rHOqh9ceVt6HDgYQZ5
         X1cUcqQYyuRGhNZNKvr+Lj1awKhmASiAg6XDL1h3M/q3+qsL9xNuiEN+lrQ/4+dM9CDa
         oZawnSAcl2nEdvptLvZE7cEZtnuIFJZCLOSOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701354661; x=1701959461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnrYiuXdzp9zPzX6PeTg0GoA8oRf3Fko4S7XBz0W3tM=;
        b=q9XKRyF6UZmSwgH8+xTVev+bnJ2s0IZh2YNzH3ahJSuyZ6lYYFiJ4Ezf19AXwexjKW
         fbLHDOd8yyPFMoBdb7DK32DmdQd+HTts3pH2zjfTvqHftKFDzYXKnJgjehOG9SnxHe32
         5vs+azzTlf9oDYMP9LgC9F6sluVf4GdgE5gYZXw/nSlzGT7r6AD5J5pEbmK5GDxtZUIB
         NIdQP4lPg9uuilRkS3S7UkEs7zjbMoh1+6H94G2iyhraoeb7MjbA9Spus3D27uZ4DmEy
         eY6rpImxBCEiPabzZtSqbU7468CzXlBNGTOkg7geJZFzXQRF86VyXLZCotgvG1nyBWqq
         b2Tg==
X-Gm-Message-State: AOJu0Yy5Lm5B9FIc5VF0+eWVfk+QicQDmLvMQTYugs7F4yENo5aucMqF
	nkXUf/kCFVVYsy1w4M53FS9nB9rs8kGNZHbIeKQ=
X-Google-Smtp-Source: AGHT+IHSqHoWGMyyFhY4dd88FAFJqw51AoRcIA8ADJNGbUx7FEI1BOjSuGkCimy+AFGNLtTICL1n8g==
X-Received: by 2002:a05:600c:3550:b0:40b:4072:54de with SMTP id i16-20020a05600c355000b0040b407254demr13196172wmq.13.1701354660293;
        Thu, 30 Nov 2023 06:31:00 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 4/5] xen/livepatch: fix norevert test hook setup typo
Date: Thu, 30 Nov 2023 15:29:43 +0100
Message-ID: <20231130142944.46322-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130142944.46322-1-roger.pau@citrix.com>
References: <20231130142944.46322-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The test code has a typo in using LIVEPATCH_APPLY_HOOK() instead of
LIVEPATCH_REVERT_HOOK().

Fixes: 6047104c3ccc ('livepatch: Add per-function applied/reverted state tracking marker')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/test/livepatch/xen_action_hooks_norevert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/test/livepatch/xen_action_hooks_norevert.c b/xen/test/livepatch/xen_action_hooks_norevert.c
index 074f8e1d56ce..cdfff156cede 100644
--- a/xen/test/livepatch/xen_action_hooks_norevert.c
+++ b/xen/test/livepatch/xen_action_hooks_norevert.c
@@ -108,7 +108,7 @@ static void post_revert_hook(livepatch_payload_t *payload)
     printk(KERN_DEBUG "%s: Hook done.\n", __func__);
 }
 
-LIVEPATCH_APPLY_HOOK(revert_hook);
+LIVEPATCH_REVERT_HOOK(revert_hook);
 
 LIVEPATCH_PREAPPLY_HOOK(pre_apply_hook);
 LIVEPATCH_POSTAPPLY_HOOK(post_apply_hook);
-- 
2.43.0


