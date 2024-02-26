Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4355E8672A3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 12:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685459.1066216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYqC-0002oF-5t; Mon, 26 Feb 2024 11:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685459.1066216; Mon, 26 Feb 2024 11:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYqC-0002m8-2s; Mon, 26 Feb 2024 11:08:12 +0000
Received: by outflank-mailman (input) for mailman id 685459;
 Mon, 26 Feb 2024 11:08:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwqN=KD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reYqB-0002Xk-7v
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 11:08:11 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 530829cc-d497-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 12:08:09 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-512aafb3ca8so2794424e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 03:08:09 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ma6-20020a0562145b0600b0068fa5e5c245sm2789775qvb.84.2024.02.26.03.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 03:08:08 -0800 (PST)
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
X-Inumbo-ID: 530829cc-d497-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708945689; x=1709550489; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwcqS4buxW/Jeygm8zvIbxwG10HttMJtYAWj5OZTXl0=;
        b=ZziypYdtto2mnD9xS444oMHwY/08n7H+rCSLTqnKJ7dlehlZZ6+Rtvr7AVUEngYHRK
         h5jElp6SQiyQqSioSZOST7oIiMO9yAXrbfU42ayN6Isoi+afYEaGqKKvtKMqHrdaNI+Q
         bYDWuPLzGzqI+02WXicdtzBeJfdCWHfJOyamU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708945689; x=1709550489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwcqS4buxW/Jeygm8zvIbxwG10HttMJtYAWj5OZTXl0=;
        b=YTan8m1+VGzodByfiwu1A9slrzg7QmqsRvKpCWH4u+bO+FJTljcYRAyqntIQZilDTI
         Qk3SHMsM8WcIU7EP9L39faLR4QeQJVsYDdy0fc/MJivnZnj5oJSNpYImvVH5xmj62TLY
         U6csZJDJcVAxoNbzlGhB0mvrscvHoVY02ZGvTSx5Key0x/N1nLp2/FIju4U61hsI26a1
         5V+iBTJLlBNCtrkGYRubdjSy7oduodL9I9mSzu3fmrpr8eiEJEDBy7ZHKMItpesmMTaI
         6RyX93zLRJUpagsPVNJ4b6BZNI+qqXhrID6758aYEtPSRsq7ypf8aiRSb4j4aPOc09SO
         Oqiw==
X-Gm-Message-State: AOJu0Yz4Pdv2YQB7YVuJb8DudW9QjMZS+1cszMH8KW2b1AiDOkScCwuE
	wSIRMWJLFVIbU6CHzLMJvIWoaUENJC6sZbCoForJlAAa8zpeH0CMYZloBzkGacDt+7JPJnZtAu/
	A
X-Google-Smtp-Source: AGHT+IEckDKUWpABW+/YnVGbsKMeCnsqI4GOJxHp/u6i3Fib9QKC799WoK3U/L4+dpF6VaORefjJrw==
X-Received: by 2002:a05:6512:3f04:b0:512:d5c7:60d9 with SMTP id y4-20020a0565123f0400b00512d5c760d9mr5437819lfa.3.1708945689250;
        Mon, 26 Feb 2024 03:08:09 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/4] x86/spec: print the built-in SPECULATIVE_HARDEN_* options
Date: Mon, 26 Feb 2024 12:07:45 +0100
Message-ID: <20240226110748.80254-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226110748.80254-1-roger.pau@citrix.com>
References: <20240226110748.80254-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Just like it's done for INDIRECT_THUNK and SHADOW_PAGING.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/spec_ctrl.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 421fe3f640df..9f5ed8772533 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -466,13 +466,25 @@ static void __init print_details(enum ind_thunk thunk)
            (e21a & cpufeat_mask(X86_FEATURE_SBPB))           ? " SBPB"           : "");
 
     /* Compiled-in support which pertains to mitigations. */
-    if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) || IS_ENABLED(CONFIG_SHADOW_PAGING) )
+    if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) || IS_ENABLED(CONFIG_SHADOW_PAGING) ||
+         IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_ARRAY) ||
+         IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH) ||
+         IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS) )
         printk("  Compiled-in support:"
 #ifdef CONFIG_INDIRECT_THUNK
                " INDIRECT_THUNK"
 #endif
 #ifdef CONFIG_SHADOW_PAGING
                " SHADOW_PAGING"
+#endif
+#ifdef CONFIG_SPECULATIVE_HARDEN_ARRAY
+               " SPECULATIVE_HARDEN_ARRAY"
+#endif
+#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
+               " SPECULATIVE_HARDEN_BRANCH"
+#endif
+#ifdef CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS
+               " SPECULATIVE_HARDEN_GUEST_ACCESS"
 #endif
                "\n");
 
-- 
2.43.0


