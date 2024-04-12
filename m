Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29188A3032
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 16:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704714.1101226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvHdD-00046w-6r; Fri, 12 Apr 2024 14:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704714.1101226; Fri, 12 Apr 2024 14:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvHdD-000443-3w; Fri, 12 Apr 2024 14:11:55 +0000
Received: by outflank-mailman (input) for mailman id 704714;
 Fri, 12 Apr 2024 14:11:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M3on=LR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rvHdB-00043x-T2
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 14:11:53 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bf4ef06-f8d6-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 16:11:51 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-516ab4b3251so1209540e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 07:11:51 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c198800b004180c6ab70fsm1045876wmq.5.2024.04.12.07.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 07:11:50 -0700 (PDT)
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
X-Inumbo-ID: 9bf4ef06-f8d6-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712931111; x=1713535911; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ckL9ER6pZYN4Z/+nfICoRutxNdQTFFfzqsS/EQ87hkM=;
        b=bnv5IiBkY0yICAHgzG5lW6v/IAaU7SrWNtI85R83hZN+XALoDFO6KYX5IcAL6ryJuH
         hWXFvsryWjG/mg9FgotajqLcw7kCIT+4cjK+Y3oQK5N6rA8oHIGYjkbqD+g3ZbHQYPtq
         b0tsnYhRqjHxMYGdAf1OSbRPV1zszoJkANd5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712931111; x=1713535911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckL9ER6pZYN4Z/+nfICoRutxNdQTFFfzqsS/EQ87hkM=;
        b=dUTgaHyBhTSI86I+oRfJnto1j+oLzkZqpAKHHowfYe+mNvwbg/fimA5FtwPjxQuYS8
         ZMLkFrHObwtRpmSUalE8jM9dZ7u2URRjOwXhHVGG1Kt8/iio0Ci8IkZUkajzNKSKUFge
         LQDMIzT6xHk+8zmxfPHCSEB4rR9AiadV57Fv8lgNnjTJmJyJJR1ttN5Tf7V3GhGWlrnm
         Ed8oiDeXZRFKZfj4gXCTqAuoDnuN49H3pBZro1zWo//TJNW3au0Bhv/JbNrzz8EC+FyM
         /b6Sa4DOAZqV2YpFtz6zmynBGQeT1nLG0d0dPvNHNHiGfyXhTgGwczGcbs+VAlrO5ifk
         ukPA==
X-Gm-Message-State: AOJu0YzDPFYpbphL7BH8sU8cVrEEL1i2ppTe//O9mHI3ddcqNQt/xm7C
	Eb7udmwNO43vUIX1oJa21+u/Bn0DrlFoCektJCkR6vo987jDB5FycTAHuJVmJShku5WPYFKKKTi
	G
X-Google-Smtp-Source: AGHT+IEdMj0vyx5gKPC0vCbjmzdt5Scb2mqu5uangOmY+DtnN+mwKbWZ4bKJpwh9FN3wcpNNCTwtdg==
X-Received: by 2002:a2e:a36b:0:b0:2d4:68ef:c711 with SMTP id i11-20020a2ea36b000000b002d468efc711mr1859477ljn.25.1712931110596;
        Fri, 12 Apr 2024 07:11:50 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: anthony.perard@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] osstest: increase boot timeout for Debian PV guests
Date: Fri, 12 Apr 2024 16:11:21 +0200
Message-ID: <20240412141121.79280-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current timeout of 40s seems to be too low for AMD boxes (pinots and
rimavas) in the lab after XSA-455, see:

http://logs.test-lab.xenproject.org/osstest/logs/185303/test-amd64-coresched-amd64-xl/info.html

Increase the timeout to 60s.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 ts-debian-di-install | 2 +-
 ts-debian-install    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ts-debian-di-install b/ts-debian-di-install
index 06c7e1f46a92..1a187dfeb9cb 100755
--- a/ts-debian-di-install
+++ b/ts-debian-di-install
@@ -76,7 +76,7 @@ sub prep () {
     target_install_packages_norec($ho, qw(lvm2));
 
     $gho= prepareguest($ho, $gn, $guesthost, 22,
-                       $disk_mb, 40);
+                       $disk_mb, 60);
 
     prepareguest_part_diskimg($ho, $gho, $disk_mb);
 }
diff --git a/ts-debian-install b/ts-debian-install
index 62db487ad15d..ef2954dd3c8e 100755
--- a/ts-debian-install
+++ b/ts-debian-install
@@ -42,7 +42,7 @@ sub prep () {
 
     $gho= prepareguest($ho, $gn, $guesthost, 22,
                        $swap_mb + $disk_mb + 2,
-                       40);
+                       60);
     target_cmd_root($ho, "umount $gho->{Lvdev} ||:");
 }
 
-- 
2.44.0


