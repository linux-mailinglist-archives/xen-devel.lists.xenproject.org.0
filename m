Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B867E87EE63
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:06:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695023.1084550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGRU-00045C-SM; Mon, 18 Mar 2024 17:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695023.1084550; Mon, 18 Mar 2024 17:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGRU-00043a-PE; Mon, 18 Mar 2024 17:06:32 +0000
Received: by outflank-mailman (input) for mailman id 695023;
 Mon, 18 Mar 2024 17:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHP-0002f9-QJ
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:07 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6948a70f-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:06 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4140edd58c9so10184745e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:06 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:04 -0700 (PDT)
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
X-Inumbo-ID: 6948a70f-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780965; x=1711385765; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db9MIu6tq57fxX6+DJjHh0A6dPzIiHMhHEDPZhvZ7xg=;
        b=LkgZXuM1SpBKcsAvh9IeKLlWpMJPnrNprdW7qYCNgwMKo8nUC4cd+6vdRjVcu0p9Cu
         jvfxEoEfd3qSRWTOVXcqpMwj2Ft39yiPeQnpMGOrJCuiqyJUJESHF1jo7j6c2zM7TYHf
         JDlhpx7CFU1Y92RK7jjQ1RHHh5dooNzBLQfCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780965; x=1711385765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db9MIu6tq57fxX6+DJjHh0A6dPzIiHMhHEDPZhvZ7xg=;
        b=ldhSvICYvvTYJjAyP1poUYQGyGw/LgYHpYIDMcJ/63xqubrmP2j4rKuX6Xh//Lwf/Z
         QjAa3Q87LcpRXFVo+nRglkRXpw8WY8XsRyw/QdBYmNEDCgGjQ39+f69YwNqLvIkIL3A0
         i1RQcZl0iRzwafWjgJS6dfFzCoo4J6aL6ePxPxQQ7Tw09pt4Uk+Aq2oMOHj9spB26pCz
         p55djV9b1mDFtLWCJLacsm/hLeHSONCA3zqe8NVttIqTJQTrf2mZ3h+rdac7Tva2+IOG
         K+sZjX/6tvTyXZ6CjiezispXWiZyLs7ed80z0DGivRsH0XdT6J1A9ll/J+UiTlPoKM4r
         OOWA==
X-Gm-Message-State: AOJu0Yz4CuPJrkBd51H6h3NJr4xoPRIAlnSoJRsZww4vsr1PxNkIcZGY
	jHLSneHQOuUSEtqIZknk+NMpz6SWc1EERTZgyuGK0q4J4z7d3ZU0bCujU6tc6xIroVvYK3EzEuN
	4
X-Google-Smtp-Source: AGHT+IF8FyIuw7act4Lxdk6yYT/LfGC/uC/VONogW1shdNl6St4NFE1wpSNAwaKkYl2tlslm4JPc8g==
X-Received: by 2002:a05:600c:3c8a:b0:414:d95:cc47 with SMTP id bg10-20020a05600c3c8a00b004140d95cc47mr51909wmb.30.1710780965756;
        Mon, 18 Mar 2024 09:56:05 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 17/36] target_editfile: Use the same user to retrieve and send
Date: Mon, 18 Mar 2024 16:55:26 +0000
Message-Id: <20240318165545.3898-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file "/boot/grub/grub.cfg" on Debian Bookworm isn't accessible
from the "osstest" user, but target_editfile_root() tries to grab the
file as "osstest" then edit it as "root.

Change teditfileex() to use the same $user also to get the file. This
will fix ts-examine-serial-pre step.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/TestSupport.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 0dded9b2..b86f1d96 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -783,7 +783,7 @@ sub teditfileex {
         logm("editing $rfile to $rdest as $lfile".'{,.new}');
     }
 
-    target_getfile($ho, 60, $rfile, $lfile);
+    tgetfileex($user, $ho, 60, $rfile, $lfile);
     open '::EI', "$lfile" or die "$lfile: $!";
     open '::EO', "> $lfile.new" or die "$lfile.new: $!";
 
-- 
Anthony PERARD


