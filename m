Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB5AC8080
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 17:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000011.1380458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfWa-00079x-P3; Thu, 29 May 2025 15:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000011.1380458; Thu, 29 May 2025 15:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfWa-00075d-LF; Thu, 29 May 2025 15:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1000011;
 Thu, 29 May 2025 15:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vnej=YN=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uKfWZ-0006oV-Jv
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 15:50:31 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a643580c-3ca4-11f0-a2ff-13f23c93f187;
 Thu, 29 May 2025 17:50:31 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-553280c345cso1424197e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 08:50:31 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55337937bf7sm359434e87.254.2025.05.29.08.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 08:50:28 -0700 (PDT)
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
X-Inumbo-ID: a643580c-3ca4-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748533830; x=1749138630; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/ZAsDiyBEUJhyA3+Rgv4QwvFmR3/7Sm2UmwbErJIko=;
        b=Zt6B2JIRDMTTvW9FJqUXW/eeE5VCTF/OIo3XXoDoMLcMY6IUzOXhHOFBHSMgk4XF2K
         qgGs4cKnEvCtXPB9VQb0Nz3dqoONHNI+PWA7sm2JpxZbEsfm/8zUWWnzA1hMWwZTBd2W
         A61mJI7K8CnNfWGludJxAulzCQ4eWb7FAxWMW0GeAkJdw8jHvHtMRB5B/48NlYyWYOAw
         m3zRiu6RbYOUKkSE3xItT4j9vtdf+5gMDtCSKZ41fBRHb5kLdRS76mN7LRuQV8cKkaM6
         jCV5vzAZpz1LQBeOIazrXjrXvRP0P+lZturKAoj0W0vet7ObL6CzKnl9Umvglp3+86/R
         ZXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748533830; x=1749138630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/ZAsDiyBEUJhyA3+Rgv4QwvFmR3/7Sm2UmwbErJIko=;
        b=A3zpQTpq69Hg1HRawq5YOatyxB68KciC0fn14RixE171zGzr5DiRo4utvtKFT1hyG3
         NsCcxIVbO0ugXWaP45qnvlxt4MUKlQWwPx++iHpb75S9fivYLqB6hUznLz7KKsHoxU23
         9wZbEqfZhBCVqv/j0wkisGlt4u5rOI+OY8gchd7G7930XfqDbEu9ra7Ydq9AQ0vbMViQ
         4ZYiCx2FUxGMEuJsjJvSQBpUfw1P+aMRGTCgEq+YNX9c3eMLd4Oz/ue/0e8eIYCk4/tE
         xOo8YiggyyIPA96GblYOfg+90hT1f7roVLpr6XxsoZQqJS+R9iCMCY8uZxSeXFjdx3Eh
         etqA==
X-Gm-Message-State: AOJu0Ywe+O6u1zoeET32AC2UuIoSRmZBBjsD2Xyj84eGFx4jVuS3GgB3
	TwiTXzzfb3QvLd98/PGy1BkN23nJLt8dEO45w3CpZ4yboUVWNTV+ryQa80KX7Q6ze70=
X-Gm-Gg: ASbGnctv4W8t/LaTjhqOoP7rq/Jr4Y3vDNu2odRxTmHjABjI9UN3OopxspkOlwAp7Jj
	VmuRztCHCh9U9kPt+6nPWnix54cb8/mUFa/3ATYuMjCCgPdvUpDYlBVF8Fnscz/MUutQVAIVUB0
	89RHGoJBSaKxPaXgY22GRHxbKlDeDaMhqk5CGba7Gdgssu58ZUvMFp2scaDnZzMxtSBzcI1AGVd
	Uk/AgojGYtFtwgagn+UBdFxap+gh7sgpjl4O8atEAPc4ytIIL2HHAbU7AS/UI9HcVa1vr2sL00K
	klO85RMDuiLY+/b0iyNF9lMZz0GzCQp0c4l/JDLQEYkPlKjiWW1Pja2bqh/dAWnE6RuXoIumN5e
	8lLpWn/b5JylprL/452k17es=
X-Google-Smtp-Source: AGHT+IGa2r4D/VITSjdFBTxYkg6da0wYsZ2CMlkEQD6cZ8UUgLv8rIZMzxdmwr9D4pjVitwMZiA4/w==
X-Received: by 2002:a05:6512:630f:b0:553:2357:2890 with SMTP id 2adb3069b0e04-55323572a08mr5344205e87.45.1748533830134;
        Thu, 29 May 2025 08:50:30 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v2 2/3] xen/arm: dom0less: Add trap-unmapped-accesses
Date: Thu, 29 May 2025 17:50:22 +0200
Message-ID: <20250529155024.1284227-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
References: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add the trap-unmapped-accesses per-domain fdt property.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 docs/misc/arm/device-tree/booting.txt | 9 +++++++++
 xen/arch/arm/dom0less-build.c         | 9 ++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 59fa96a82e..8a5c40ddf3 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -225,6 +225,15 @@ with the following properties:
     option is provided with a non zero value, but the platform doesn't support
     SVE.
 
+- trap-unmapped-accesses
+
+    Optional. An integer that configures handling of accesses to unmapped
+    address ranges.
+    If set to 0, guest accesses will read 0xFFFFFFFF and writes will be ignored.
+    If set to 1, guest accesses will trap.
+
+    This option is only implemented for ARM where the default is 1.
+
 - xen,enhanced
 
     A string property. Possible property values are:
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a4e0a33632..69324aa597 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -344,8 +344,15 @@ void __init arch_create_domUs(struct dt_device_node *node,
 #endif
     }
 
-    /* Trap accesses to unmapped areas. */
+    /* Trap unmapped accesses by default. */
     d_cfg->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
+    if ( dt_property_read_u32(node, "trap-unmapped-accesses", &val) )
+    {
+        if ( val > 1 )
+            panic("trap-unmapped-accesses: supported values are 0 or 1");
+        if ( !val )
+            d_cfg->flags &= ~XEN_DOMCTL_CDF_trap_unmapped_accesses;
+    }
 }
 
 int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
-- 
2.43.0


