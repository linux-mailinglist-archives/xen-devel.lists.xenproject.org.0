Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418D8654F90
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 12:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468889.728116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8g2g-0002q9-12; Fri, 23 Dec 2022 11:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468889.728116; Fri, 23 Dec 2022 11:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8g2f-0002mT-U5; Fri, 23 Dec 2022 11:16:45 +0000
Received: by outflank-mailman (input) for mailman id 468889;
 Fri, 23 Dec 2022 11:16:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2p1Y=4V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1p8g2d-0001vi-Qn
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 11:16:43 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47b28286-82b3-11ed-8fd4-01056ac49cbb;
 Fri, 23 Dec 2022 12:16:43 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id h12so2109487wmq.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Dec 2022 03:16:43 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 bi20-20020a05600c3d9400b003c6c5a5a651sm4015400wmb.28.2022.12.23.03.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 03:16:42 -0800 (PST)
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
X-Inumbo-ID: 47b28286-82b3-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4piGybnIUpDzfW0IXQY8Y5SgBUwXtFTXUdrpnAUYp18=;
        b=Kd/g0bPlVd0qUtUIOoA5ZldHfcNjR1qtiYUpSmnzlVpQB63q+EGiuz0ssJ0uvkzTVp
         5psm8UfVxZs/xMWjhR61vOxHyS1DS95C83yYEqMFSuS1TfwE+76e0NI6rndBZ7adsx/R
         TGup8LWOPYWIAjLXaWvD3Uw+fD6Q0JFa78EcucaKdx22rK+FmOIeR6Xk5DCGsv5ma93I
         PAGWolweh/J4zHTd9UzGN3rlboFwaKJhvNTTkj0ljamhbYnlQRBAJCKom2ulGSxNv1Ev
         3RikbwXcdG+3qCDghB8uNrHI9eu8iKCgw2Pct3pSEMoIOn/9z1EHk4/PAfLyGWDk2qvW
         iUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4piGybnIUpDzfW0IXQY8Y5SgBUwXtFTXUdrpnAUYp18=;
        b=h6EGXKQ5wcO7WnpTdjqPycYAUQEmk5H7eBzSX/ecDcboaDltBI+ju11TjVZNowcB9B
         pP7jBdVsCXWS0+qNV820d78BeiLbXKxa6GAvDLGEE9IKJsKjRV/X7l4qOxJNRyJtK8g4
         20YgFBsYtJREiueYadW3gtef0w5sDXU9QbhnuSyh27mcCpAJ4+HqQrayD0FCyTZkQyRW
         BJBxsOseyrIhJhLuLjrmAmjnBrZAyZbz/JvvHZ7S1ucbVSYJUJy5GsFqsPy+LgvFqnab
         WlzdLfViqZVKhByuMg+fwlfU73eO9NGt2SizeUGc5vlnIo9ywWLHxrwfy07F9FSxV/GB
         bVrQ==
X-Gm-Message-State: AFqh2kr2PiqZAcwpeLxZzaLfYdOnkSO+sZF0Btd+soRaDEewwN2g/O3D
	xQ/OQXPwtQ/7bZFdVn1v9npZrWf+VyUrlFFb
X-Google-Smtp-Source: AMrXdXseWLwF9FPYLaJ367T4eEMth/pZMqMJL8iiU/RgleLUarqwjEsLgJs/DLE8e0ova0LkXXel9A==
X-Received: by 2002:a05:600c:4e11:b0:3d3:4012:8da8 with SMTP id b17-20020a05600c4e1100b003d340128da8mr6728223wmq.40.1671794202758;
        Fri, 23 Dec 2022 03:16:42 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v1 3/4] automation: add python3 package for riscv64.dockerfile
Date: Fri, 23 Dec 2022 13:16:22 +0200
Message-Id: <55e2c865a0c2ab3ef405c427c0b1bcaf0abff2ab.1671789736.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671789736.git.oleksii.kurochko@gmail.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pyhton3 package is requited by automation/scripts/build
script so it shoud be installed to riscv64 docker image

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/build/archlinux/riscv64.dockerfile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/build/archlinux/riscv64.dockerfile b/automation/build/archlinux/riscv64.dockerfile
index ff8b2b955d..a52852c2f7 100644
--- a/automation/build/archlinux/riscv64.dockerfile
+++ b/automation/build/archlinux/riscv64.dockerfile
@@ -9,7 +9,8 @@ RUN pacman --noconfirm --needed -Syu \
     inetutils \
     riscv64-linux-gnu-binutils \
     riscv64-linux-gnu-gcc \
-    riscv64-linux-gnu-glibc
+    riscv64-linux-gnu-glibc \
+    python3
 
 # Add compiler path
 ENV CROSS_COMPILE=riscv64-linux-gnu-
-- 
2.38.1


