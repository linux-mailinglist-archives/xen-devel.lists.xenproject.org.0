Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F9689BBA3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 11:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701860.1096420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlGK-0000Zp-Jv; Mon, 08 Apr 2024 09:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701860.1096420; Mon, 08 Apr 2024 09:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlGK-0000Wf-Go; Mon, 08 Apr 2024 09:26:00 +0000
Received: by outflank-mailman (input) for mailman id 701860;
 Mon, 08 Apr 2024 09:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djzs=LN=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rtlGJ-0000WZ-AC
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 09:25:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01c98490-f58a-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 11:25:58 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4165caf9b2dso9216955e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 02:25:58 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a5d6710000000b00343956e8852sm8502213wru.42.2024.04.08.02.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 02:25:57 -0700 (PDT)
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
X-Inumbo-ID: 01c98490-f58a-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712568357; x=1713173157; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcIzIVzLXSYGUh7BwIKLRsqCfL/WlkanrqqI6XJVjmQ=;
        b=dWq5h8sF/Ne41KXgl/SBDogIkoMl4vTbYq4hSa37XacN9tYf2RKxNfrokaSrY2u1e9
         BLEbp9Bx+JJV7hoseSDyDXDrdEan9uw006GuR6XXKOtv4I27CIQkDmJrnK7JWOLjtNWI
         JVmLPhfU7BywCgP4qFO5exX9mmvhjFFhoah2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712568357; x=1713173157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcIzIVzLXSYGUh7BwIKLRsqCfL/WlkanrqqI6XJVjmQ=;
        b=lQYzqaEfrFaU4G5bD4qxkDalWmAh6iI6ychfZRMlUaqwXSlGpl144NaHKdOM6szwsa
         R0ZqU+1SRGdyaaJqYlmjejjmHoWuraHSQ2G2qEshRc3gI2nJ2An46Hkm2bxJbNHcRjCH
         QN7TAGPeF6fuLHnQzDWttMFzNY/l9dtx77WHMqxeexlcqmHUVg+rcMxgbphRNmz5jO9a
         /cJvC01Spd/vYWZJmSL5V3SBrQKrUQJ6lKa5McvuPYktwj0oMqRgTyvkU4XeXWQ0TpAG
         6LTKAlSuIvD6gcGY3y8ulcdmWBxaHbnCqaYkWYhgBgpptyvuy84uRczteHQmeCnlPWM6
         c9RA==
X-Gm-Message-State: AOJu0YyQOfHGd804thwiu3Rc4G92RWbtk5AJ2GxCTa4w9z8CacGKVHzf
	bwfdR1AoNZkzHtBDJoIxZX6shbivWryI+cfCwvSzzfBfkuNXZIrJxmzs4eEp6vP/7TUj0XtoTvj
	u
X-Google-Smtp-Source: AGHT+IFttAj8eJV8x6U+uxzD78WtU7N8F/hdQba9sXJZkyZe2Zqqpz3DZxcAHeff88yBog+7HYL3lA==
X-Received: by 2002:a05:600c:3146:b0:416:4a4a:8cc9 with SMTP id h6-20020a05600c314600b004164a4a8cc9mr4241773wmo.27.1712568357575;
        Mon, 08 Apr 2024 02:25:57 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH] cr-daily-branch: Actually use Linux 6.1 by default on Arm
Date: Mon,  8 Apr 2024 10:25:42 +0100
Message-Id: <20240408092542.36711-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 95ee1714750b wasn't effective at changing the default version
of Linux, osstest kept on using "linux-arm-xen".

This time, make osstest use the same revision for both LINUX and
LINUX_ARM, like it was done for "linux*" branches only before.

If for some reason $BASE_TAG_LINUX and $BASE_TAG_LINUX_ARM are
different, this change would be wrong, but there's shouldn't be a need
for them to be different.

Fixes: 95ee1714750b ("ap-common: Switch to Linux 6.1 by default on Arm")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    Already pushed.

 ap-common       |  2 +-
 cr-daily-branch | 14 ++++----------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/ap-common b/ap-common
index eabb85c6..5770d2b1 100644
--- a/ap-common
+++ b/ap-common
@@ -60,7 +60,7 @@
 : ${PUSH_TREE_LINUX:=$XENBITS:/home/xen/git/linux-pvops.git}
 : ${BASE_TREE_LINUX:=git://xenbits.xen.org/linux-pvops.git}
 : ${BASE_TAG_LINUX:=tested/linux-6.1}
-: ${BASE_TAG_LINUX_ARM:=tested/linux-6.1}
+: ${BASE_TAG_LINUX_ARM:=${BASE_TAG_LINUX}}
 
 if [ "x${TREE_LINUX}" = x ]; then
 	: ${TREE_LINUX:=${BASE_TREE_LINUX}}
diff --git a/cr-daily-branch b/cr-daily-branch
index 6ec3aa62..23e716e4 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -186,16 +186,10 @@ if [ "x$REVISION_LINUX" = x ]; then
         export REVISION_LINUX
 fi
 if [ "x$REVISION_LINUX_ARM" = x ]; then
-    if [ "x$tree" = "xlinux" ] ; then
-	TREE_LINUX_ARM=$TREE_LINUX
-	export TREE_LINUX_ARM
-	REVISION_LINUX_ARM=$REVISION_LINUX
-        export REVISION_LINUX_ARM
-    else
-	determine_version REVISION_LINUX_ARM ${linuxbranch:-linux-arm-xen} \
-		LINUX_ARM
-        export REVISION_LINUX_ARM
-    fi
+    TREE_LINUX_ARM=$TREE_LINUX
+    export TREE_LINUX_ARM
+    REVISION_LINUX_ARM=$REVISION_LINUX
+    export REVISION_LINUX_ARM
 fi
 if [ "x$REVISION_SEABIOS" = x ]; then
     case "$branch" in
-- 
Anthony PERARD


