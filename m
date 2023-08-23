Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8E785BFD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 17:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589407.921305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYpiA-00019w-Ne; Wed, 23 Aug 2023 15:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589407.921305; Wed, 23 Aug 2023 15:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYpiA-00018G-KO; Wed, 23 Aug 2023 15:23:58 +0000
Received: by outflank-mailman (input) for mailman id 589407;
 Wed, 23 Aug 2023 15:23:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3PRN=EI=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qYpi8-00017m-H3
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 15:23:56 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1206e825-41c9-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 17:23:54 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso3370125e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Aug 2023 08:23:54 -0700 (PDT)
Received: from l14.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z13-20020a05600c220d00b003fee9cdf55esm717036wml.14.2023.08.23.08.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 08:23:53 -0700 (PDT)
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
X-Inumbo-ID: 1206e825-41c9-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692804233; x=1693409033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oeLwisFv1BV9FGVHhIjbkDhM+7cMdC7hocZ9RXZddtM=;
        b=bLPv8dsy8uAviZKmcz9Yx2sfx9hh+cqOBrX6RhD2oFCjr+kgP/sZi9P1q9DVU2/Ij4
         jzEGHk3c19f/V5FKGfwmz9pZqfSvEeO9T6+y51vIHoqHZZB42xE92cIRVY39cZpHHqJo
         UGWD8+t6frKKwjMWlJ30B7L8EYZU/DtTizvGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692804233; x=1693409033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeLwisFv1BV9FGVHhIjbkDhM+7cMdC7hocZ9RXZddtM=;
        b=gEFr7nO6LuW05tO8MH9W+8iFL3yG1VDuabzpxI45/RiwB8XPPh323Ib2kZlp6Nq80m
         ews8bnAhFV+v/nnp4qI2d/k2p47+g584BGPC/0Ew+urxqm8+QNwMz1MK6ryO0Nx22SxM
         rpBh8gmtoMzrC1RodTqUa6ZQTZGA6EHgcSJ2sGkVHkd4RA3Y44AhTRX5FDgLB0ggQURn
         X78gpc8pUSHqBLjSOUHAW+yMGtfn2bYp4w8UBV8YX03VYXIGlK6kIZqvzkR1ti8y2w1w
         74rfF+gCdVE/AvME6Qape6nzGRPAoJlj0sOe/IUWfSXKHzgdIzeJtQRRGZ4i+Xdd/oPK
         apaQ==
X-Gm-Message-State: AOJu0Yw+NJkXXM+p/3n+uJy1CMrQ2ytalK3383zVo8LpSsd74FC6Ff0G
	RBWBmSh8RTZchSQZ2RLhJ35J2BNMbTbHWHmLH8ee/g==
X-Google-Smtp-Source: AGHT+IG73DjuatAhZum8KCIuXxP/aaVKLo139jAX5jsQILPm2BgmWjAbNQLIp7rRd3nrHO0x6lScSA==
X-Received: by 2002:a05:600c:3486:b0:3fb:c9f4:1506 with SMTP id a6-20020a05600c348600b003fbc9f41506mr10117933wmq.1.1692804233535;
        Wed, 23 Aug 2023 08:23:53 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] CI: Always move the bisect build log back
Date: Wed, 23 Aug 2023 16:23:34 +0100
Message-Id: <20230823152334.8867-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On failure of "build"-each-commit script, the next command that move
the log back into the build directory isn't executed. Fix that by
using "after_script" which is always executed even if the main
"script" fails. (We would still miss the log when the jobs times out.)

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/gitlab-ci/test.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 810631bc46..5099f2e6b6 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -140,6 +140,7 @@ build-each-commit-gcc:
     CC: gcc
   script:
     - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
+  after_script:
     - mv ../build-each-commit-gcc.log .
   artifacts:
     paths:
-- 
Anthony PERARD


