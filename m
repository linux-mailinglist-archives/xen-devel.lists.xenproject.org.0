Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9B45B0144
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401102.642807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrwQ-0006M0-SD; Wed, 07 Sep 2022 10:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401102.642807; Wed, 07 Sep 2022 10:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrwQ-0006JW-PV; Wed, 07 Sep 2022 10:05:54 +0000
Received: by outflank-mailman (input) for mailman id 401102;
 Wed, 07 Sep 2022 10:05:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aULX=ZK=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oVrwP-0006Bz-6D
 for xen-devel@lists.xen.org; Wed, 07 Sep 2022 10:05:53 +0000
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a730b840-2e94-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 12:05:52 +0200 (CEST)
Received: by mail-pf1-x42d.google.com with SMTP id y127so14129225pfy.5
 for <xen-devel@lists.xen.org>; Wed, 07 Sep 2022 03:05:52 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 l11-20020a170902f68b00b00176c17e2c7fsm5156874plg.122.2022.09.07.03.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:05:50 -0700 (PDT)
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
X-Inumbo-ID: a730b840-2e94-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=scpnAAB49us063h03pju+wAALAqb7YgI3UzMoKktJyA=;
        b=r5uspQoHGYuE81De9zi0FH0YJRbJKjcWmJvykgECHdpNdytE4krpyWdSm1EYLzmgSi
         IO7yxKPbn/xAxqkDbgOI+qJ6pSVc6TOJsLkMNryDYvU1Yy/wy8nr2e12KmpdT21hBgL4
         S0HCT4DDjIG/5lMCN85NwWpymAYDcUNAXIVJ41XUY/f5jhQdsQq2rwjWhMAibq7g2m0r
         eFLSEdNvhbF+fWFQA4h74fhaSzJqoBH1QcU0QlaqJ1U4SIm7Mg9y+9A8OmfzKY3ttoko
         QMcqKANTnXsnJXOF/84/yOW+SJQJqEf0koi/JT4sKPtI6rBzfTbIN7bKZFSvT+qUrnAZ
         X7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=scpnAAB49us063h03pju+wAALAqb7YgI3UzMoKktJyA=;
        b=bL24M846nmbmh0LnWFua4BpEGF6n9Dh9NKLVq8Kg4jYgOzf2LTbj6B9EdxMLBdkVyc
         bHBT3Jvl+B6KRXtrjoRD0/nBTU2e0C1D1iTN5gApKxDT6MqH0l5RmYvZvdC/r5MbOuZW
         KvGg8XW8EQBORfj5AZTzAlFr8D6YO2QDaK7jgmBsG+OMhljQ5QQsBxZigPpu3uEtRsik
         uncdLW/coIHsK248+UVlz86kwTxEOOkEunqdVMiuRV5V6gub4C1rdTIHUCaFyQzXs/jD
         6rbfW8Ae66mYXTmdqivHnsRvB8DbMKti2gjwL+i2lRIjt7zeUAt1d9d12EN+v4rd/zDJ
         0WtQ==
X-Gm-Message-State: ACgBeo0Bdx3PXZopZqNPI4DXbJH9Ntf49TTRP74kuhc2bwqywlv9Alg8
	KEWdqPRJMtdNWqdkVSHR6224FTr0BBkgZQ==
X-Google-Smtp-Source: AA6agR7Z8qKih6l9q4c66n0sP0C1ahQEMwTaeJBc/yvG+e408sjEP6zslX1znTlH9VK4uJEHB/GL8Q==
X-Received: by 2002:a62:1d86:0:b0:52d:9df0:2151 with SMTP id d128-20020a621d86000000b0052d9df02151mr3181756pfd.33.1662545150871;
        Wed, 07 Sep 2022 03:05:50 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] .gitignore: Add *.patch
Date: Wed,  7 Sep 2022 15:35:47 +0530
Message-Id: <cd8683878852a55f1b28807a470e078d21a5e689.1662545140.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add *.patch entry to .gitignore file to stop showing git generated
patches in commands like 'git status'.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 9f9f18c97d5f..d9a4fd038145 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,6 +20,7 @@
 *.gcno
 *.gcda
 *.py[ocd]
+*.patch
 TAGS
 GTAGS
 GRTAGS
-- 
2.31.1.272.g89b43f80a514


