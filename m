Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4E196E59D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 00:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791414.1201289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeN-0001cI-5P; Thu, 05 Sep 2024 22:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791414.1201289; Thu, 05 Sep 2024 22:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeN-0001aJ-22; Thu, 05 Sep 2024 22:08:23 +0000
Received: by outflank-mailman (input) for mailman id 791414;
 Thu, 05 Sep 2024 22:08:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smKeM-0000fY-Bx
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 22:08:22 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d3cf61d-6bd3-11ef-a0b3-8be0dac302b0;
 Fri, 06 Sep 2024 00:08:21 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53567b4c3f4so1274621e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 15:08:21 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d020sm187525166b.127.2024.09.05.15.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 15:08:20 -0700 (PDT)
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
X-Inumbo-ID: 5d3cf61d-6bd3-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725574101; x=1726178901; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nb88Eml8FYOcYrY0RBCFSiM4UYtlmEjFIcTet7qdkb8=;
        b=BZIQsIbHcG4Tmn5qJEa+8Zaavj/cKkYuV/WyiUkNE5Wur6qnJUIhMoKMGWGV9ZA4k4
         JEF2Kqv6nVjQBWoJNYTqcKBf9fW/7SXvTdrMaz77Wumr+61U+Vj6ZEed64hPmQMKD+gq
         cyO/PwVYFGidGr+AYkcPbZN2tCTVeBymzse1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725574101; x=1726178901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nb88Eml8FYOcYrY0RBCFSiM4UYtlmEjFIcTet7qdkb8=;
        b=ujH22gXVjqwT0tkYhNMPauTbxkimRLHhxJSyz96lSoKfnIqgQSbsYt7N59wKOp8bTS
         168wAfiedCxZXXKKg5CS6s4egIKcGY0CbncENJLKSKxJIZ0wscXXHwZYVaYiMHh+ZwFl
         wnx/L8QoukhZzMSYSkatSZGmRr54R/mDhsAz0mM5mVUINbQBqSTxemYriMngmFnHdHfq
         u9RS+hhNtAJV9FF5kd49dMxDADl+sUAufYemeqpzlUa+bEZHu4AQMd+rRaLL2G070ont
         B83fVpDiNPo1JCRKv1xgI3TY/5u+NePqiY+OpW1YS0eY+0X2sBFCohog2uFeJycpFJX4
         w0lQ==
X-Gm-Message-State: AOJu0YyfMzmA7ppKK27nGgnAIZ97inpBiBSqz+mJ0CEM6urBaUWQsoaF
	nSaqDhcu73+PigBzrncsR+1XQAOb5kMAFipziRecCD0cNUl7brOOChwELVCx4D/TuNXRCsr4MSR
	7
X-Google-Smtp-Source: AGHT+IGH0DzygvP+ko/2gw+1dA47ljd9t+93lNvE9Fd2xk1S6ixY4v5WShoeduSeAZWQZvE+Cc7YJg==
X-Received: by 2002:a05:6512:39c8:b0:535:6a83:86f9 with SMTP id 2adb3069b0e04-53658813810mr145730e87.60.1725574100672;
        Thu, 05 Sep 2024 15:08:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 5/5] ARM/cache: Drop legacy __read_mostly/__ro_after_init definitions
Date: Thu,  5 Sep 2024 23:08:06 +0100
Message-Id: <20240905220806.141300-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240905220806.141300-1-andrew.cooper3@citrix.com>
References: <20240905220806.141300-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These are no longer needed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/cache.h | 3 ---
 xen/include/xen/cache.h          | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/cache.h b/xen/arch/arm/include/asm/cache.h
index 029b2896fb3e..b75c970b6806 100644
--- a/xen/arch/arm/include/asm/cache.h
+++ b/xen/arch/arm/include/asm/cache.h
@@ -6,9 +6,6 @@
 #define L1_CACHE_SHIFT  (CONFIG_ARM_L1_CACHE_SHIFT)
 #define L1_CACHE_BYTES  (1 << L1_CACHE_SHIFT)
 
-/* TODO: Phase out the use of this via cache.h */
-#define __read_mostly __section(".data.read_mostly")
-
 #endif
 /*
  * Local variables:
diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
index 90816ba05b1a..6ee174efa439 100644
--- a/xen/include/xen/cache.h
+++ b/xen/include/xen/cache.h
@@ -15,9 +15,4 @@
 #define __cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
 #endif
 
-#if defined(CONFIG_ARM)
-/* TODO: Phase out the use of this via cache.h */
-#define __ro_after_init __section(".data.ro_after_init")
-#endif
-
 #endif /* __LINUX_CACHE_H */
-- 
2.39.2


