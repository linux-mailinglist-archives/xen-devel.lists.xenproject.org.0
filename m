Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB4C9B7C10
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 14:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828705.1243691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6VW4-0004xD-6x; Thu, 31 Oct 2024 13:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828705.1243691; Thu, 31 Oct 2024 13:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6VW4-0004va-4I; Thu, 31 Oct 2024 13:47:12 +0000
Received: by outflank-mailman (input) for mailman id 828705;
 Thu, 31 Oct 2024 13:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6VW3-0004vS-5c
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 13:47:11 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d875907-978e-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 14:47:05 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a99ea294480so65737966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 06:47:05 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac770226sm596716a12.37.2024.10.31.06.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 06:47:04 -0700 (PDT)
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
X-Inumbo-ID: 9d875907-978e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlkODc1OTA3LTk3OGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzgyNDI1Ljc0MTgxNiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730382425; x=1730987225; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Z6OYI4AxlFsbpsPGyN28CVgDDbQygAFzxphBread0w=;
        b=Fr0UHWMIbQG8AYVg2OZRKK//ubMleONbpeQXuDB0tek6forV8xpjmEpOhCL9mbkuwh
         kqOPDw45zEzTykM4RQJOi4cnsMB7Nmer9DWho0zyG4tIgvNbNVlotSsd8UJBe2GdvQeR
         F/eeQFC+q1eQXeRXg/PMpuqTem764bRT1dB9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382425; x=1730987225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Z6OYI4AxlFsbpsPGyN28CVgDDbQygAFzxphBread0w=;
        b=bp4ngqObrYiOo5655tKVrek8tgLin2dYWqZQkQr+ctyOCgQ7Z/occGurHozmDwiFEi
         uA0TEqmVKA4V5kZdDRbnbmzl+3nHwkwXnmdLWsU7XcAZBW7d/odGV24zLE/vUhx5BfR6
         62idpYb38Qwfhkd4l4EgYeBe1b2vqlq1K+tVP2+vS278BrUWBJFWBRtbW3qIfiYmkEry
         zib0dBv/COr7kW3PZ6hkACynlC356uAmkh5TbKA+tPtouVNeUamQjIu3RbPWTYCZGipl
         YyLNIaGf6PZDtHrzdt5L2ZI5+XSgtkInaV4l+uAEDaD3JYOLmvJSfbjXYJAvMEkQbtnF
         jZqQ==
X-Gm-Message-State: AOJu0YwTYDfRFngufaBkcn7nHdbZhpUEm7CR9KZnRXDRG6pUsWEK2vVq
	UNkxmflGEU8xUGfuBINzFlfGUkLRdLVK6gTG186iax3BSfcZx3lbAQGbPrAnr6AhV8zm0O4eomA
	o
X-Google-Smtp-Source: AGHT+IE+LigPaB/SE/U+rD9aS8XeCHqhS72C9rcVyIEq1BY+tD4cdgHwmQEHJmDSWLTWApo7tndlCA==
X-Received: by 2002:a05:6402:40cb:b0:5ce:afba:f48a with SMTP id 4fb4d7f45d1cf-5ceafbb03b7mr1998093a12.27.1730382424681;
        Thu, 31 Oct 2024 06:47:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] scripts: Refine git-checkout.sh change for different branches
Date: Thu, 31 Oct 2024 13:47:02 +0000
Message-Id: <20241031134702.2913536-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change works for divergent branches, but doesn't work for explicit SHAs.

Instead of passing `-b $TAG` to clone, explicitly fetch the $TAG we want after
cloning.

Fixes: c554ec124b12 ("scripts: Fix git-checkout.sh to work with branches other than master")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

Speculative fix, pending CI:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1521847529
---
 scripts/git-checkout.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/git-checkout.sh b/scripts/git-checkout.sh
index 3796cbfe39a7..9f8f2bd04fca 100755
--- a/scripts/git-checkout.sh
+++ b/scripts/git-checkout.sh
@@ -14,9 +14,10 @@ set -e
 if test \! -d $DIR-remote; then
 	rm -rf $DIR-remote $DIR-remote.tmp
 	mkdir -p $DIR-remote.tmp; rmdir $DIR-remote.tmp
-	$GIT clone -b $TAG $TREE $DIR-remote.tmp
+	$GIT clone $TREE $DIR-remote.tmp
 	if test "$TAG" ; then
 		cd $DIR-remote.tmp
+                $GIT fetch origin $TAG
 		$GIT branch -D dummy >/dev/null 2>&1 ||:
 		$GIT checkout -b dummy $TAG
 		cd -

base-commit: 9a2a50d5de7647bfb529867fdce47ec64b07f06a
prerequisite-patch-id: ef7a8f78a2a3bfb35a2835ce8c2ec97d95f1267e
prerequisite-patch-id: 8c25962203bdb283a9c95328fb0867ffa3da8b95
-- 
2.39.5


