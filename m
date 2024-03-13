Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181CF87AD2C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 18:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692673.1080051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSO2-00034x-Ly; Wed, 13 Mar 2024 17:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692673.1080051; Wed, 13 Mar 2024 17:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSO2-00031M-ID; Wed, 13 Mar 2024 17:27:30 +0000
Received: by outflank-mailman (input) for mailman id 692673;
 Wed, 13 Mar 2024 17:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkSO1-0001lR-2a
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 17:27:29 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f68109f2-e15e-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 18:27:27 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5686677bda1so2152011a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 10:27:27 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f15-20020a170906048f00b00a42ee62b634sm5005732eja.106.2024.03.13.10.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:27:25 -0700 (PDT)
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
X-Inumbo-ID: f68109f2-e15e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710350846; x=1710955646; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHB0TnvHPBNz/eBFlKRD6r+XgGXUhXiQaqNnXVkmHEM=;
        b=HdiEIEtty4EKP+6iQXwJ7Bt+loJ55OXEBPtpvmCYFUqN3Zef/4qEwlbqVl4y+sErbQ
         C5d1l+r2Hlloip+TdwNAW+s7lmnLgWbuC85Mpxppq+Q3SMeECWlQ+w72D/VQUlp85RBh
         YxFOAn7A0or7U7VSza9aFX2gqhvX3Wj0SRnzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350846; x=1710955646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHB0TnvHPBNz/eBFlKRD6r+XgGXUhXiQaqNnXVkmHEM=;
        b=Wm22WpHdZS+NjEkcb5Wi90FSbSDCp2Tu8h9JQzWvVkxLPiwDE+Ni11EpEDp822n/0W
         sPxLNq/kmtVKrATSZaCOj5IxEDXLLRnPOtVWaHcqpeo7G6do12XAdhcKisI+JMlp4o84
         xWul3qLDQ7PPbXjjLHAIFeXirNHa5hXrYbTjKOxEdsg8UjcKYqWfYWD7NPzw0LwR73+b
         yeSJlYuMhbPnpiTHrpqT9it/0jfqlAhHuE0Ds/5CogU3RY9sHWsqdspJ3i7hzSfdqhgr
         tbUg1Fl4TeYA4gluIAsWtVxIkVjEJ3PZRPrmd3WeBTebKZ8MozQCJcmhKNLUj64S7pKM
         DoKg==
X-Gm-Message-State: AOJu0YxI7yVkuGgvUNwM9/GZH0ccwjvVT/OxIv9JBGprZkpe8oTzfQht
	tHBQOMBP7jbsNbjVJScMVEYsU8klwSdyv3ywcvBVuFlLnEsQAvAcBtP6fdOak0uxoRVZftGBIUt
	S
X-Google-Smtp-Source: AGHT+IGIO5zs05MQAfaMrOvXvlJvj/CQCBKQvepFuzD0oSVa3+Yg0TZEOonx3qZaJ0qsoNzwif8sQw==
X-Received: by 2002:a17:906:b00f:b0:a44:806f:ad56 with SMTP id v15-20020a170906b00f00b00a44806fad56mr2736937ejy.11.1710350846637;
        Wed, 13 Mar 2024 10:27:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 5/7] xen/bitops: Implement ffs64() in common logic
Date: Wed, 13 Mar 2024 17:27:14 +0000
Message-Id: <20240313172716.2325427-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As per ffs()/ffsl() in previous patches.  Add tests for all interesting bit
positions at 32bit boundaries.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/bitops.c      | 12 ++++++++++++
 xen/include/xen/bitops.h | 16 ++++++++--------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index eceffe5029d6..cd194fe672b7 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -47,6 +47,18 @@ static void test_ffs(void)
     CHECK(ffsl, 1UL << (BITS_PER_LONG - 1), BITS_PER_LONG);
     if ( BITS_PER_LONG > 32 )
         CHECK(ffsl, 1UL << 32, 33);
+
+    /*
+     * unsigned int ffs64(uint64_t)
+     *
+     * 32-bit builds of Xen have to split this into two adjacent operations,
+     * so test all interesting bit positions.
+     */
+    CHECK(ffs64, 0, 0);
+    CHECK(ffs64, 1, 1);
+    CHECK(ffs64, (uint64_t)0x0000000080000000, 32);
+    CHECK(ffs64, (uint64_t)0x0000000100000000, 33);
+    CHECK(ffs64, (uint64_t)0x8000000000000000, 64);
 }
 
 static int __init cf_check test_bitops(void)
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index b85b35c40781..f14ad0d33aa3 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -96,6 +96,14 @@ static always_inline __pure unsigned int ffsl(unsigned long x)
     return arch_ffsl(x);
 }
 
+static always_inline __pure unsigned int ffs64(uint64_t x)
+{
+    if ( BITS_PER_LONG == 64 )
+        return ffsl(x);
+    else
+        return !x || (uint32_t)x ? ffs(x) : ffs(x >> 32) + 32;
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
@@ -148,15 +156,7 @@ extern unsigned long find_first_zero_bit(const unsigned long *addr,
 
 #if BITS_PER_LONG == 64
 # define fls64 flsl
-# define ffs64 ffsl
 #else
-# ifndef ffs64
-static inline int generic_ffs64(__u64 x)
-{
-    return !x || (__u32)x ? ffs(x) : ffs(x >> 32) + 32;
-}
-#  define ffs64 generic_ffs64
-# endif
 # ifndef fls64
 static inline int generic_fls64(__u64 x)
 {
-- 
2.30.2


