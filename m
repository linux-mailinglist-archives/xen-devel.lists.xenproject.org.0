Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CBE9B6D0F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 20:45:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828409.1243271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Ecc-0005VB-IH; Wed, 30 Oct 2024 19:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828409.1243271; Wed, 30 Oct 2024 19:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Ecc-0005Sj-Fg; Wed, 30 Oct 2024 19:44:50 +0000
Received: by outflank-mailman (input) for mailman id 828409;
 Wed, 30 Oct 2024 19:44:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LV2z=R2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6Ecb-0005Rr-4F
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 19:44:49 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6858263a-96f7-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 20:44:42 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-539f2b95775so227507e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 12:44:42 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a088adesm594815866b.222.2024.10.30.12.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 12:44:40 -0700 (PDT)
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
X-Inumbo-ID: 6858263a-96f7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzAiLCJoZWxvIjoibWFpbC1sZjEteDEzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY4NTgyNjNhLTk2ZjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzE3NDgyLjQ4NTkzNywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730317481; x=1730922281; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qA4Y0k56pJdKOhEG8laINea+E3H+cDEFib+L14O9Kc=;
        b=lPMgUJ4+Bz3ruaYmiXBmMMphkcWp7yzKh0e/8qI4j9T2Y0Cm5JV/791mXENeaTDR27
         nfZEAVssCFs/ITL7na0phJHn2NS+nrs+Mq2QeeLU99a5h4WvwFwRuEkHdyJY7scVC8MG
         aY9VQTKxCXpcd+oShw7ieiYoVSior2RkRyKsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730317481; x=1730922281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qA4Y0k56pJdKOhEG8laINea+E3H+cDEFib+L14O9Kc=;
        b=UU9iPZJXOQkK186m9CpyDLrSQRRbt9ayEZrCJBuEV8MQcEYlsyrddnZ+scPx+fcFc6
         G4OzjP8EXiZgF4NvGzgwLayAqHgDq/i4NhzeXKynRZbHHNSix7ZjpQ+SxfGycE10gTg5
         pTJz+s6a6uMtQltX+Hty7iA0Yb4gpk6uI1GqNAoVAHFbZjNWsgxxzBVhBdMOde/YsYox
         Ird63JgmaZNOQsWuKQOSYTGI2vXsiMx3JbAhiFXaWuUpOxvmmmiM/f6iVvD5NMzKi/OU
         i+2o+l+yt5x93vIZVY7FrnqrWa1PFIRgbJ3lSYwdJV67daDIvqolnMrWYhMbfsTRilz5
         F9zw==
X-Gm-Message-State: AOJu0Yw9gYMEs1lfydar9N899ANywlFkLXjl9y2Gfvnb679SdsjNXkcM
	FLQeVyfRr/mdslwP3xRoR2Sht/E1ye2NpJs6lmgszDAlQSZeaKkhGmV83rfuAbq5GyBbw9aZanG
	X
X-Google-Smtp-Source: AGHT+IEd7p/h1h626YohcpNZc0DXBOWph7qKoLa6zj59b8SJ4DbHAbUzU6q6SII+9k8KH+0hnpwVdQ==
X-Received: by 2002:a05:6512:1282:b0:53b:1fd1:df34 with SMTP id 2adb3069b0e04-53b3491e0eamr14605494e87.45.1730317481252;
        Wed, 30 Oct 2024 12:44:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] scripts: Fix git-checkout.sh to work with branches other than master
Date: Wed, 30 Oct 2024 19:44:38 +0000
Message-Id: <20241030194438.2733973-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen uses master for QEMU_UPSTREAM_REVISION, and has done for other trees too
in the path.  Apparently we've never specified a different branch, because the
git-clone rune only pulls in the master branch; it does not pull in diverging
branches.  Fix this by stating which branch/tag is wanted.

$TAG is really a committish, and git-clone's -b/--branch takes a committish
too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

Found while trying to test the MiniOS fixes in Gitlab.  This is a example run
with most stubdom builds passing:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1520611847

and all of them successfully cloned.
---
 scripts/git-checkout.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/git-checkout.sh b/scripts/git-checkout.sh
index fd4425ac4ee8..3796cbfe39a7 100755
--- a/scripts/git-checkout.sh
+++ b/scripts/git-checkout.sh
@@ -14,7 +14,7 @@ set -e
 if test \! -d $DIR-remote; then
 	rm -rf $DIR-remote $DIR-remote.tmp
 	mkdir -p $DIR-remote.tmp; rmdir $DIR-remote.tmp
-	$GIT clone $TREE $DIR-remote.tmp
+	$GIT clone -b $TAG $TREE $DIR-remote.tmp
 	if test "$TAG" ; then
 		cd $DIR-remote.tmp
 		$GIT branch -D dummy >/dev/null 2>&1 ||:

base-commit: bb7296d77f171c7bfbafab30ed51e9be29660e39
-- 
2.39.5


