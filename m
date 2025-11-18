Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136B5C6AB88
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 17:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165183.1491978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOrl-00043w-CU; Tue, 18 Nov 2025 16:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165183.1491978; Tue, 18 Nov 2025 16:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOrl-00041b-9J; Tue, 18 Nov 2025 16:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1165183;
 Tue, 18 Nov 2025 16:47:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/QT=52=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vLOrk-00041S-1x
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 16:47:40 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48002e30-c49e-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 17:47:34 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so34902705e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 08:47:34 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b894sm34395528f8f.26.2025.11.18.08.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 08:47:32 -0800 (PST)
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
X-Inumbo-ID: 48002e30-c49e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1763484453; x=1764089253; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=opBefqOvPnk2512WwKaoeMgeEnOduJAcaoE2iVpx1uM=;
        b=ICmAfd05EbvsOhA0pIxAapAFj3daZeacFfdmTcJbWgpz8EpSv34rneOwFmu57J53LK
         EDh8Ia8JOAM+6BVeLosbnEXQKC2dNPGhaDvquDeIH89xRuxoG0WNOtN+6ilIIGTC3HqC
         tn88uLMfSxs+UTwhKRxsWaFDiSw4AKWVNHE+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763484453; x=1764089253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opBefqOvPnk2512WwKaoeMgeEnOduJAcaoE2iVpx1uM=;
        b=DKYyLQcgh0kom9QjxzRvjH5KT2zLFUmPE5gRNQcZUDJvO4oJCs2xPmZ84WCXuafjnZ
         KwZiiGEZW57XegTW/w1BUMbsj6yrouLgFQ+9bvx23d7NLtAPF4BgvkTQFWs8IkcLmbFb
         ZQbC4dAMLNoatK4vSjcP9rQ/u6YcU1DKoMSUcbyK2YdWnJrOtn80ihe+jGqL5lyqnoYZ
         lqom5KijhISnKkvXgKv/p7lnQtgmu6NCDXEf1yVnyjQuYW48Dy8Qn7QQPPBBxvIug+HO
         tCrgLSpBxEAOAw0AeJxA1jh2IP9TvJ2qQqYZdIg0c0IRMmUDYN5b4CRBJDj7GQnuVrZO
         QQJA==
X-Gm-Message-State: AOJu0YwqCoCx7SQCFA0DPujTNzLKHQcxRy0ZafwRIa7WH2UTFfCZ9hOY
	SulNDNEEY6sMxvgt6VwKtnNLeBf30Tl/z5mmea6WE9CzmhHWmUuVBXXR1CcahnDjVp939ogS3E9
	7eFaoLks=
X-Gm-Gg: ASbGncvEDSWFjxBG+/tV1XtRkNyxu7P9b5mRu5hLtGYRY0x6m7YFLXc/CPABJ/egSpt
	LfX/yGgfNs/IhajJRl45aXEL+xVimj7yHicvgrhvpFA6vPZXoUuH2ckq/zhTfPJa/cODmKKbWIT
	a8yW3vKqkKAGLVEUd7HC2YBQdJrm34/4PyQgXroDCyU11M4eAwivks+WcYJXqafk6Qnu6yvwGoW
	B2/lUG9SDJ5AgvfWD5IMJZKa+ryAIxwUlAJkR+0wdRIHrpw75by0yGvKZgT5W/7omxpFFHu2iB/
	TlEKXnUU3iRwiQENTzMiygIS9GpmY+rbp6aDa4koKIl0BIRa71viF5i1wFdiWoPkkWbQKBvPTTm
	zKWHSU2Wh++/O180MykZQqSSKEf4dRP3o6egIaG+jSt+LU+S+/OCzrkZLP5rzgQFRbQFw8jqq6A
	Qkazu0C1Ip+XlBlIcBxBRYZxAqsTCGHrN7OlD67MfoIhrMBOUFwmM=
X-Google-Smtp-Source: AGHT+IEt0iMcG7ZpWrVTednYRvUWptGRHq6JSzCMojGt/bH7ekt57a95yV7swAS+/OcX+GnfCTu/9g==
X-Received: by 2002:a05:600c:4744:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4778fea8ab2mr172918355e9.33.1763484453249;
        Tue, 18 Nov 2025 08:47:33 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] CHANGELOG.md: Set release date for 4.21
Date: Tue, 18 Nov 2025 16:47:30 +0000
Message-Id: <20251118164730.475344-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 CHANGELOG.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c9932a2af077..adaad5ee8923 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,7 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ### Removed
 
-## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+## [4.21.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.21.0) - 2025-11-19
 
 ### Changed
  - The minimum toolchain requirements have increased for some architectures:

base-commit: 07e57af2b4715a9d088781b06c4f97c7d9f25b19
-- 
2.39.5


