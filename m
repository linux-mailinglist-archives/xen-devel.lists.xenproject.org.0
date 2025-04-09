Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B54A82C9C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 18:37:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944343.1342856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQM-0005ZY-2Q; Wed, 09 Apr 2025 16:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944343.1342856; Wed, 09 Apr 2025 16:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQL-0005Xt-UL; Wed, 09 Apr 2025 16:37:13 +0000
Received: by outflank-mailman (input) for mailman id 944343;
 Wed, 09 Apr 2025 16:37:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2YQK-0004rn-C6
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 16:37:12 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e251ed68-1560-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 18:37:10 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so3903035f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 09:37:10 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm20947455e9.23.2025.04.09.09.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:37:09 -0700 (PDT)
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
X-Inumbo-ID: e251ed68-1560-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744216630; x=1744821430; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmOUNq4jgp3B3A9yw2zDpgYQIvmYUHtEyo79prjaP04=;
        b=JT1FKSmAZoo6SIGvs68oqvkFexIyYmNAKeOVkMgTKRYwIh9zcKBUuTqt/BZZ575n/h
         E0FdorTxWUVK2TTEmhYpjtFpvAYY6EVLeIO98OyF3oNilQ4tmMdvLlU5SK+8zdz6FDaQ
         WHwP6HW8F4jLwkxqnl46roLIoAfaumZpoHg7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744216630; x=1744821430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmOUNq4jgp3B3A9yw2zDpgYQIvmYUHtEyo79prjaP04=;
        b=LTGFvzuZdM5EgYEpZaOhLKsIu+yAAZsJtrr4+p+0RBXUiGXSjRPpNtQTzAUrbxnGOn
         sdf6LjRTqEqaGPc5rbHU4cuXMxI5lY0NhnzaS6Zou50Zl7LpFoGAfosmG14EgRioV9Dv
         ML6FtMCvH3vGqkwAZZQLRe3h5lHZNC/9gShMeWZc0LuGM8KmcIVQa+2scOFr0GOOpAiM
         HlosKLU0A3noLpQtiJsR7F2N/omE3T6jwmkg7bmk+aZN7dgIbcIMQAf3s+ORm+vTMFcj
         i+7n1TqnXj87b/HzQ9/xSu7daoHVfu8raaaMPxKHgixtxgTVxSS/e/nm4N+OdJKyvbWv
         bckg==
X-Gm-Message-State: AOJu0YzQEzjAClcX2gFOgZeyoLX9nc687DmEI4kJI9pXAavsdlRKhQyx
	LpTsftqO0fhC6HqjRiTt6A8K1tVBaAC0uz8TqvmL60uD2OE4O+VctJTQhvwbLF0H6Lc4oTSRbsi
	wIqM=
X-Gm-Gg: ASbGncvKctthRrl4IQ7nFar0bU/Fr5j384tm636VIHLL5K9gRoN0bKxmOJAdPt9D41u
	43ho5mcvGKBeR+LX/rkSNXfrHZ8kiD+n1J5AU2voqsSt0FmQtdaelNsYaB+p3XX8skhLzff2r89
	f6SCkPk64Y3gWR2dfzIPyA3r3zC0xpjwZpWzUOxSEdsewNFJVtYzGxtuDF75my0s00hXinXE0Yg
	CWFVX0WiGKtLX3uqoEhZVmk4dc1lhyn44Y6N3wMAW5ccX5ZSgB5WAjq68izyAEYffvlQfWoY5gy
	B1WcetihzenmlaqOsWZbHnNp2X7MjT3EWRSOga7QgJ/HjfblOYvSVgos0K+TVGoLEJdAm0wuidw
	VcXw+KOxjQwfJjg==
X-Google-Smtp-Source: AGHT+IFZgAc4JGBWrB/+Jh+tmojjQ8rvS3vS1nP5n8O3GiLQXjS/c4qJNs2WCNnDO6ihOoxixa3kCw==
X-Received: by 2002:a5d:5847:0:b0:391:4674:b136 with SMTP id ffacd0b85a97d-39d87ac2fdamr3042032f8f.29.1744216630057;
        Wed, 09 Apr 2025 09:37:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 4/8] Clean up Gitlab yaml
Date: Wed,  9 Apr 2025 17:36:58 +0100
Message-Id: <20250409163702.2037301-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Factor out the registry into a common location.  Fix the worflow name.  List
all the stages.  Set a default expiry of 1 month.

Note all the current jobs as legacy.  Their naming scheme needs changing, and
we'll use this opportunity to switch formats too.  However, the artefacts need
to stay using the old name until the final staging-* branch using them is
phased out.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
---
 .gitlab-ci.yml | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 36ec6a7e1ee5..5a0a853e551d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,12 +1,19 @@
+variables:
+  REGISTRY: registry.gitlab.com/xen-project/hardware/test-artifacts
+
 workflow:
-  name: "xen test artifacts"
+  name: "Xen test artifacts"
+
+stages:
+  - build
 
 .artifacts:
   stage: build
   image:
-    name: registry.gitlab.com/xen-project/hardware/test-artifacts/${CONTAINER}
+    name: ${REGISTRY}/${CONTAINER}
   artifacts:
     name: "${CI_JOB_NAME_SLUG}"
+    expire_in: 1 month
     paths:
       - binaries/
     exclude:
@@ -19,6 +26,9 @@ workflow:
   variables:
     CONTAINER: alpine:x86_64-build
 
+#
+# The jobs below here are legacy and being phased out.
+#
 x86_64-kernel-linux-6.6.56:
   extends: .x86_64-artifacts
   script:
-- 
2.39.5


