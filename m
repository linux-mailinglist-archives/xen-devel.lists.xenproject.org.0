Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96F928B3F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 17:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754345.1162762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkX3-0004NC-ID; Fri, 05 Jul 2024 15:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754345.1162762; Fri, 05 Jul 2024 15:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkX3-0004Le-FM; Fri, 05 Jul 2024 15:07:29 +0000
Received: by outflank-mailman (input) for mailman id 754345;
 Fri, 05 Jul 2024 15:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mps8=OF=gmail.com=andreistan2003@srs-se1.protection.inumbo.net>)
 id 1sPkPp-0002rJ-Cm
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 15:00:01 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f9a2963-3adf-11ef-8776-851b0ebba9a2;
 Fri, 05 Jul 2024 16:59:59 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42562a984d3so11713575e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 07:59:59 -0700 (PDT)
Received: from andrei-desktop.. ([79.114.140.114])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d509asm65915415e9.8.2024.07.05.07.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 07:59:58 -0700 (PDT)
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
X-Inumbo-ID: 3f9a2963-3adf-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720191599; x=1720796399; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0om5ShG7hBp9wOatFKjTiKLatOhOHjXqUbegYtq+Ik=;
        b=WSE80Cy/8A4mrJYAppkMiCuxKix6vFQP2PWHwQyIgiiS80gF7LSFpu1TVaybzGcKx6
         SJa0iMvqDlKDfohheR/jXrYQ0CXP5F5mXpFol9IGld1XZOkWtRga5ohL2tZJLpq/YAs/
         QgQR5dAjz7gXzK9/KQ3TJ/tMr7TsX+n7qbJarpnWkkfGBYFDNa1reMuXmNx4+b3ERPZ/
         lW8BWLq+ObrT3TJW15kFy4OZj73oaYYHWVMk6CdU7QQujWY/jS5AHTcGhK2SlelwpVga
         aTFtisrwV//bQFrCT4MZ3LBqqKmxsY6B+vR0xWtLxssh9liWDAovb9BgAvXZM4XB/Kdc
         Yq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720191599; x=1720796399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0om5ShG7hBp9wOatFKjTiKLatOhOHjXqUbegYtq+Ik=;
        b=IEU7UdLNkXlrp7+7YGmZDgYx7XlZBQudvDwe7MP5Z2gAfQ0Ow1nlVyDmhzBs3TcZRi
         pNTbp0kmm8EbiK32UrfhJfpLDWAk/rv2XR7xdoklGia1wygjD3PRN6cXuuW4s1w4vhlz
         yT0aS73x7Ww3LPFv6Fz+bXZOvvaTURLY9xMU+ShnxsbMEWD8KNDLA7FE6tKjGRfY7Wd9
         avLyTfmDLeDsGvB/O+pmu4B9ECU4hc5bz/evKb9HaS8+a8oFldsm1NF+NM0DmGhBtCyV
         Dm1KuAItbtCY615MTqk7VLcb7S4jP3i+HwdIB12ItSS6O3jMqDosb7KBH8dmFTRDt6oc
         +D3A==
X-Gm-Message-State: AOJu0YzMWlOtFmDuhOYupmRsYFqRRyS9F0GZhEHRgeJMTRJ3qpZ3ZquT
	cQbYSqeWf2Ia2Jc7aHCixb6LFumn5xyFRDnFglpsbVmZ3DnxvJf2YkwvtKQR
X-Google-Smtp-Source: AGHT+IG1v/TIiXFmdrooh4+OvKuZhrO122uKdfXnMEvWYcp+H9c0N4Fzi1hw8MsElJXkozkkIyrj9Q==
X-Received: by 2002:a05:600c:3544:b0:424:aa41:4c15 with SMTP id 5b1f17b1804b1-4264a3dc0f4mr32459485e9.22.1720191598421;
        Fri, 05 Jul 2024 07:59:58 -0700 (PDT)
From: Andrei Stan <andreistan2003@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrei Stan <andreistan2003@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/libs/store: add missing USE_PTHREAD to target .o
Date: Fri,  5 Jul 2024 17:59:12 +0300
Message-ID: <20240705145910.32736-3-andreistan2003@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently only shared libraries build with USE_PTHREAD enabled.

This patch adds the macro also to xs.o.

Backport: 4.18+ # maybe older
Signed-off-by: Andrei Stan <andreistan2003@gmail.com>
---
 tools/libs/store/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 0649cf8307..c6f147c72f 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -20,6 +20,7 @@ CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += $(CFLAGS_libxentoolcore)
 
 xs.opic: CFLAGS += -DUSE_PTHREAD
+xs.o: CFLAGS += -DUSE_PTHREAD
 ifeq ($(CONFIG_Linux),y)
 xs.opic: CFLAGS += -DUSE_DLSYM
 endif
-- 
2.43.0


