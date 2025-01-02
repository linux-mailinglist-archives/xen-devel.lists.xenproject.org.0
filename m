Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4689FFF66
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 20:25:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864434.1275692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQor-00046q-6y; Thu, 02 Jan 2025 19:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864434.1275692; Thu, 02 Jan 2025 19:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQor-00045N-2s; Thu, 02 Jan 2025 19:25:21 +0000
Received: by outflank-mailman (input) for mailman id 864434;
 Thu, 02 Jan 2025 19:25:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoa/=T2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTQoq-0002q0-7z
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 19:25:20 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d1df72f-c93f-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 20:25:18 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so8304170f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 11:25:18 -0800 (PST)
Received: from andrewcoop.lan ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c6ad3e3sm40212825f8f.0.2025.01.02.11.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 11:25:16 -0800 (PST)
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
X-Inumbo-ID: 4d1df72f-c93f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735845917; x=1736450717; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZLrD2169y0WiqxGQqlgUiS8PafeeieTdE5/BAHflvs=;
        b=TZXc16wvXbyRAA4Yv4freQfdq27uDadvylYsP22S34kH9CTtRBJivst7gO2iSUYiG/
         7P6FVXDUVwU9iMKqcGXRAsOMFgaI2A6bZYxF23iSSEQ88Ot5/s35IscD2o1sUUJD8yvu
         SufsVL9Cj4m2EQ5tQ+VzBIyRSwlylfkHT4QYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735845917; x=1736450717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZLrD2169y0WiqxGQqlgUiS8PafeeieTdE5/BAHflvs=;
        b=L5RflT07VZsqJPkwWcmy61MvZV4KlC2COu5p9giokZmDY8GKTugPo6CfryjDPFSgx0
         TLMxjSNHBi/Dt83HLa/yEJgvHqKp0hU8GabrWIAtfV/AcCSwxYLlGqyAOjJf7/ut5UgM
         tlPZlFEVlox2beK+avGuEsCwtioxGn+JOXeVmZjs4qWQGWy0asIfnMSMQMz8VOqrNDKG
         4Xh73qRmD10mLr7NaZ0lqryGjiDV4iAk66myymc032F186MJcX+PPIvLyj2Kc/y6NolV
         SF3ZIEd1xyNceC5qJ8l+8cj2NXjdipA2Q+Pb6bl56eBMpD5HpNDWHX20qq0mVlnClg70
         yEIw==
X-Gm-Message-State: AOJu0Yy1n7LCpPfA/5XLTH8yquKv4dxkT3fkMAFsBoLy+O3fODm2jr0w
	fCeXW6XDqEtLzyCwOM9T/h21u+my0TPxexq1QiU6YQv4i1IA1MCjQOqs5byw0mlIef0d3jmA7F7
	LRNYFIw==
X-Gm-Gg: ASbGncsFzwLktojJGTKrFXg379rjKvpeR9nBBXs8eo8A9ZOAxwy2yBLI2clKEHCF6MG
	vZzGSNM+Q6dk1F9tA3wIUvpOHULZIloih07UyUF95ScRb/jTwBMo4x+7F/ZzPSsPFw1bIvgZnS5
	/c5BbiuCAhe+KUStUyz69Ap2xgQOqOKi0JQeACle/a7226N8y9QrTcUJef/akUIrmEpKMxe/RcT
	lVoxK+Rb0U6FPWBWRSXdPoFdaiJHp2wHLQdHAro8Wj6eGUiJZb8hWAZkAdolXN5qQ==
X-Google-Smtp-Source: AGHT+IGtGn+pb2aQvViqmRl5HdkbgQA0Wu/uDMVIbBVk/klXZ0Ms+zL+XT5rY3cwHrsVqMdi45a+ag==
X-Received: by 2002:a5d:6da3:0:b0:388:c61d:43e0 with SMTP id ffacd0b85a97d-38a223feb92mr34043638f8f.48.1735845917637;
        Thu, 02 Jan 2025 11:25:17 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 5/5] xen/perfc: COMPILE TEST
Date: Thu,  2 Jan 2025 19:25:08 +0000
Message-Id: <20250102192508.2405687-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 xen/Kconfig.debug | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index c4a8d86912e0..9bc4eb2df353 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -60,18 +60,12 @@ config DEBUG_LOCKS
 	  checks will be performed when acquiring and releasing locks.
 
 config PERF_COUNTERS
-	bool "Performance Counters"
-	help
-	  Enables software performance counters that allows you to analyze
-	  bottlenecks in the system.  To access this data you can use serial
-	  console to print (and reset) using 'p' and 'P' respectively, or
-	  the 'xenperf' tool.
+	bool
+	default y
 
 config PERF_ARRAYS
-	bool "Performance Counter Array Histograms"
-	depends on PERF_COUNTERS
-	help
-	  Enables software performance counter array histograms.
+	bool
+	default y
 
 
 config VERBOSE_DEBUG
-- 
2.39.5


