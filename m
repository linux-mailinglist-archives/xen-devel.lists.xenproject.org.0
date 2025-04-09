Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9D8A82C9A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 18:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944341.1342837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQK-000594-KU; Wed, 09 Apr 2025 16:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944341.1342837; Wed, 09 Apr 2025 16:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQK-00056N-Dx; Wed, 09 Apr 2025 16:37:12 +0000
Received: by outflank-mailman (input) for mailman id 944341;
 Wed, 09 Apr 2025 16:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2YQI-0004rn-KM
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 16:37:10 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0eb4836-1560-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 18:37:08 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso63577885e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 09:37:08 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm20947455e9.23.2025.04.09.09.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:37:06 -0700 (PDT)
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
X-Inumbo-ID: e0eb4836-1560-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744216628; x=1744821428; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfWc4BVsk5hctD8Vm1IPFHGhadHzyMzEKKc9SX/jk48=;
        b=pUssh0lGtamQ51pJO4fz7opEajLTJ59wsrZVI4C3yiS3Bz0K3ZPkojLyUROg0dgepU
         gdjDJZh9TnfTnGMfTEppimKS+8QDp9WxJjOdr0+rAN7DH+6/NWzPwrA4mjKapTnyF02d
         gxVKhUSXjbkIL+i6XXJS8uJ/Cxm0qOQ+zGfX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744216628; x=1744821428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfWc4BVsk5hctD8Vm1IPFHGhadHzyMzEKKc9SX/jk48=;
        b=S/pHQm8Eowamw4j2ILi/2RdUPhuygOBMsmzMmYIOZ841ipfZLz/OkqaGz0CxWODYZm
         zPjvd5LEdaGmTijgGmGtH83xrBBwT5fTCbe8LqShlcGv270jLN8sB1keEGtp/YwSENaI
         aI1rQ4O1f7U0n4/Z4ZGazYGcXpSTY+yEn0PK4DyscPgKCL4t5rJ8ptctUBd2DjoWOH/H
         lxDJht/3S0u8QTbEXTUvkAGl0v9gUBxBeU0cdhOvoD3UnLcPVZROqDJWkumgoSCfqxS2
         qZ5tf25y2ZYuETCGJv35MJPUBtRKJ6/m7phKAkv0KaAiFOgF2obx2abDiOlQlYJXKDKa
         gpGg==
X-Gm-Message-State: AOJu0Yz39IR9G9ZfUR6dfWQwM+OJsskGK3hGBrATpun7m14gKJDy3whf
	yjYgfxla9uDJkS9Ju6/CoytMibMYQp+Ldf9ezvhk1qTRMauaAaJEgkzSY9Lc7FKGQxPzmHFGXrM
	3Euw=
X-Gm-Gg: ASbGnctFNp/Zu2yBkJ+I+OuZWuTCC5cNC54nYAgASYf4fQMKa/lVYZiQUeyHEXWgndC
	RCTZGs1/Cx5PgMmn7luvjLLhsfSR7gBALQGqD6RlkC4CJ2ApBnmgQu4Lf/TC3IIraJ0DRPOgzQm
	gAIQGgdFsnPSofWr4YzydiG4L+nzNIKAoZW7OBevEOMAPOPLuDRZbRzMlSSqnQBXhiqoemieMjn
	uKCw4DKEafX0iXb0GZhg7EL3st3nmEZEgVOtN/rjVSwfeb01lOdsIkV9iok0ruwh6Bfgz9r1IjK
	2eHEQfBIh6tEGefxs3QkGMCiyCTwRtyjRQkbBpj8FjtyxXZs2lEaKl5baPYkxVpTvFaHNx/F0vE
	nsv7eDZvnUu7sgg==
X-Google-Smtp-Source: AGHT+IFD4Gqa1kh5MZVk5EZ62aaD+TlZ8XM/yP9/4iuicCVy1v48xNnEl7AIY0JH16+pFVM2/TaA/w==
X-Received: by 2002:a05:600c:4f53:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-43f29d90286mr15315275e9.0.1744216627656;
        Wed, 09 Apr 2025 09:37:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/8] Consistently use DOCKER_CMD in makefiles
Date: Wed,  9 Apr 2025 17:36:55 +0100
Message-Id: <20250409163702.2037301-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This allows rebuilding containers using podman too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
[Ported from Xen]
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 images/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/images/Makefile b/images/Makefile
index 42f231bcce27..b0b7a7cf63ee 100644
--- a/images/Makefile
+++ b/images/Makefile
@@ -1,3 +1,4 @@
+DOCKER_CMD ?= docker
 
 # The base of where these containers will appear
 REGISTRY := registry.gitlab.com/xen-project/hardware/test-artifacts
@@ -11,9 +12,9 @@ help:
 	@echo "To push container builds, set the environment variable PUSH"
 
 %: %.dockerfile ## Builds containers
-	docker build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
+	$(DOCKER_CMD) build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
 	@if [ ! -z $${PUSH+x} ]; then \
-		docker push $(REGISTRY)/$(@D):$(@F); \
+		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
 	fi
 
 .PHONY: all
-- 
2.39.5


