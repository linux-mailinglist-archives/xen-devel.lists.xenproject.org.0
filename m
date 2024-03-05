Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8667C872A68
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 23:46:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688905.1073661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhdXO-0002UW-IY; Tue, 05 Mar 2024 22:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688905.1073661; Tue, 05 Mar 2024 22:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhdXO-0002SI-Eh; Tue, 05 Mar 2024 22:45:30 +0000
Received: by outflank-mailman (input) for mailman id 688905;
 Tue, 05 Mar 2024 22:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PUAq=KL=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1rhdXN-0002SB-1Z
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 22:45:29 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fc911bd-db42-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 23:45:27 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412eddd14b9so8343265e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 14:45:27 -0800 (PST)
Received: from localhost.localdomain (82-64-138-184.subs.proxad.net.
 [82.64.138.184]) by smtp.googlemail.com with ESMTPSA id
 iv16-20020a05600c549000b00412ea93220asm3929518wmb.12.2024.03.05.14.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 14:45:26 -0800 (PST)
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
X-Inumbo-ID: 0fc911bd-db42-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1709678727; x=1710283527; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQZyzUwJSWsCwe+Cq0i2MFZNLiLssuBmZ6olbZklGwQ=;
        b=fl/pffVl4SQOatIDuuK5uf95/S9Co4JHwZAifyi/r5aLj+YAzyGHnx3nZd2z3/q/Q/
         MxyGGyQj9+frps6MfJcYbWP2nkt5Jcja4ev+cmwGxIBwoIWWS1LbORJylCgq/TeyHjWS
         fYu9ZykqqcMf6HQ4lu8k0cnKDui/l1dCzuYkDu5bY1lrzL2Jn2hW3TgO22e+2WfqIEBd
         Ckzuy0sD274cc9fvo5X1lNpspbAFf1ayhKLaejcKE3wSf/uoxdJicZXvgwOnqIVLN0+G
         K6RHxQWu/+YweEXZu0QTjO/R5+pA3bUPtajeDShPaF44iC7JU9cr9GRJjVX7MMrAfvR+
         /osA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709678727; x=1710283527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQZyzUwJSWsCwe+Cq0i2MFZNLiLssuBmZ6olbZklGwQ=;
        b=FypHsEHi4CxMaP1JDRwbg7dxzrQQ1yHXS6LFY1irZuhoYhwHDoyFyAf+NHtY3xUeOI
         ClIVp+MW7ComKpVvXly4EP6o8+qCyewQbT+cMZnWG0LY3pFmosWH6XdZ/5UfZBHKA9nt
         4Cb9Svsgn4PztaoNY/qV3yhBfKJqtgjdbcpokG2sP+XPinVZld6XW2s8gyPq+jdtWIuZ
         tFeHNydKoTRfAYrfe6eoEIMTlkVHSC7PC/qIjSvMQ2OHmJp+Mv8tFfowNYgtediH0HRN
         4bNEhbz097dQxlzaX5T+8rYKdR5J6gOyQwS10+JAt16RGMcKR05GVLTGkNv50OUuqQgY
         TVOg==
X-Gm-Message-State: AOJu0Yw3TsUQ5wHykiUpIYWO9biHRyI5SMohOLCrJXAMXsCa5dl5jWaW
	MUy220FwRPUfxq970bTKge2jvutzHhao8snun0dT0Kb+Qf9WKO5Wp0dLyyz0qk9UrwgxltEWD+p
	l
X-Google-Smtp-Source: AGHT+IHQlXRMpPhNrWjSdxyRlf4wFuacH8pdw6vr3ZWssC2YZhsc12EP5RouHp/YhU4/Mt6uO6dY8A==
X-Received: by 2002:a05:600c:4ed2:b0:412:b674:28ff with SMTP id g18-20020a05600c4ed200b00412b67428ffmr9543857wmq.22.1709678726918;
        Tue, 05 Mar 2024 14:45:26 -0800 (PST)
From: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] docs/man: add shutdown reasons to xl (list) man page
Date: Tue,  5 Mar 2024 23:45:13 +0100
Message-Id: <019602d6da2ff78e6582b9b6aae6d76216e150c3.1709678713.git.slack@rabbit.lu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the shutdown reasons to the paragraph of "xl list" concerning the
shutdown status.
I have copy/pasted the explanations from the source code :

 - tools/xl/xl_info.c (L379)
 - xen/include/public/sched.h (starting L158)

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Cyril Rébert / zithro <slack@rabbit.lu>
---
 docs/man/xl.1.pod.in | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index bed8393473..2b046f97f1 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -370,6 +370,40 @@ scheduling by the Xen hypervisor.
 The guest OS has shut down (SCHEDOP_shutdown has been called) but the
 domain is not dying yet.
 
+There are six shutdown reasons, which will be displayed after the "s" : B<-rscwS>.
+
+=over 4
+
+=over 4
+
+=item s- : poweroff
+
+Domain exited normally. Clean up and kill.
+
+=item sr : reboot
+
+Clean up, kill, and then restart.
+
+=item ss : suspend
+
+The domain is suspended. Clean up, save suspend info, kill.
+
+=item sc : crash
+
+Tell controller we've crashed.
+
+=item sw : watchdog
+
+Restart because watchdog time expired.
+
+=item sS : soft_reset
+
+Domain asked to perform 'soft reset' for it. The expected behavior is to reset internal Xen state for the domain returning it to the point where it was created but leaving the domain's memory contents and vCPU contexts intact. This will allow the domain to start over and set up all Xen specific interfaces again.
+
+=back
+
+=back
+
 =item B<c - crashed>
 
 The domain has crashed, which is always a violent ending.  Usually
-- 
2.39.2


