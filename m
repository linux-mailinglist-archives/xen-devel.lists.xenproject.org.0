Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F2487EE59
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:05:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695005.1084490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGQG-00018o-AN; Mon, 18 Mar 2024 17:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695005.1084490; Mon, 18 Mar 2024 17:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGQG-00016W-7U; Mon, 18 Mar 2024 17:05:16 +0000
Received: by outflank-mailman (input) for mailman id 695005;
 Mon, 18 Mar 2024 17:05:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHa-0002f9-VQ
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:18 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6eb2dc19-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:15 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-513a08f2263so4760043e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:15 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:14 -0700 (PDT)
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
X-Inumbo-ID: 6eb2dc19-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780975; x=1711385775; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtK09ACQG18hKcj/CfOcQc0RzN2X4xDIkDXd97Aycqs=;
        b=Gk5sAZEaw880wIbY1Kj2tJpWzvQyyeKnGx1Y25Z0CmbLApnFztF6T/Jrq2Mrt6PmOD
         cVAbFM+TSffyU/zBwSBli5MVGpIT1b2Hp1jcacshWUIko2HSg84V69GBdGCJYbplA5XT
         d5Dqxi4KB2nDEcPl7P8vgozQP9ZE5OVaksvd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780975; x=1711385775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtK09ACQG18hKcj/CfOcQc0RzN2X4xDIkDXd97Aycqs=;
        b=W8E+gvaba7QSeU2wnvDelFWW1ID4fx9jig3oCGjWgk3fQKyiSPbaOXs+f4Y+BoDkxP
         Tkh/7zROOQpqWNpL103JDLr/0T354ybDVSzX7Lww4V/iYTEbH59Adoz42JqbvtIliPAe
         mGVltRXqa3fQNXddNfg7iBy/Yv9UmXIdfJEcX9KSb/eFM+MGjmpV68q3ivfWH1pQa76t
         6fqjdxKcC0VUC6v0cHyVKEhdmOkuzi2kvZXuRQQiS7eDxOXmuJdayq7Pb+WjmhkwQrj8
         a2WvoEoKCUFP0XqW5tZsmfrLrtaXObQBiUqHkW1wtT2sRFMex61lBIQWVBREKqzh9rpz
         N3Pw==
X-Gm-Message-State: AOJu0YyG1EQLMp3H7xrAi8nn4QZhN9jWxdzQ5wPHydHZRtQM+rT94hev
	XtJ+ghJXtgoXEl5iSBmvi9saQNtm6gh8YSjROYhdnRFZOULkIWrTSEr/Bm79c4qxD3ZYlEBcFw5
	f
X-Google-Smtp-Source: AGHT+IHtV0W8DH+rETOlSbQbdh4ZKnXrJUKP2bDBbqlzw7bkDvsdXXsor8rNtP7qUqEKb7G7NdbOXw==
X-Received: by 2002:ac2:442e:0:b0:513:db34:7caf with SMTP id w14-20020ac2442e000000b00513db347cafmr61195lfl.17.1710780974782;
        Mon, 18 Mar 2024 09:56:14 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 28/36] ts-debian-install: keep avoiding to use pygrub
Date: Mon, 18 Mar 2024 16:55:37 +0000
Message-Id: <20240318165545.3898-29-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen-tools commit 83c37b476a75 ("Start all Debian releases since
Stretch (9) with pygrub by default") started to use pygrub by default.
Revert this.

With "pygrub" setting, xen-create-guest fails on armhf, the
80-install-kernel hook fails because it doesn't know about "armhf".

https://github.com/xen-tools/xen-tools/commit/83c37b476a7534c432ecc9941817aeb989677da6

There's "--nopygrub" but that doesn't work due to several issues, so
removing "pygrub" from "distributions.conf" is the only way.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-debian-install | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/ts-debian-install b/ts-debian-install
index c42e8a37..a737bec9 100755
--- a/ts-debian-install
+++ b/ts-debian-install
@@ -78,6 +78,21 @@ sub ginstall () {
             fi
 END
     }
+
+    if ($ho->{Suite} =~ m/bookworm/) {
+        # remove "pygrub" from /etc/xen-tools/distributions.conf
+        # The "--nopygrub" option doesn't work.
+        # https://github.com/xen-tools/xen-tools/issues/67
+        # https://github.com/xen-tools/xen-tools/issues/68
+        target_editfile_root($ho, "/etc/xen-tools/distributions.conf", sub {
+            while (<::EI>) {
+                unless (m/^#/) {
+                    s/ pygrub\b//;
+                }
+                print ::EO or die $!;
+            }
+        });
+    }
     my $cmd = '';
     my $useproxy = $c{DebianMirrorProxy} // $c{HttpProxy};
     $cmd .= <<END if defined $useproxy;
-- 
Anthony PERARD


