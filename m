Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66BFA096A3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 17:03:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869835.1281289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWHT1-0005Y5-Av; Fri, 10 Jan 2025 16:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869835.1281289; Fri, 10 Jan 2025 16:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWHT1-0005Vp-7v; Fri, 10 Jan 2025 16:02:35 +0000
Received: by outflank-mailman (input) for mailman id 869835;
 Fri, 10 Jan 2025 16:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uskN=UC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tWHSz-0005Vj-Um
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 16:02:33 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cb70c02-cf6c-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 17:02:32 +0100 (CET)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso431663066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 08:02:32 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9562e83sm179816866b.103.2025.01.10.08.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 08:02:29 -0800 (PST)
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
X-Inumbo-ID: 4cb70c02-cf6c-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736524951; x=1737129751; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Btut3VgKxopRo9Q+vGGxptkuYGH3HO6bbe9wnIz9Vu4=;
        b=R68iBpUjQPQY7R3lpptnBnrBlRkAkzhTo+OKB5y2tS87U3ZkbNjaDtdiQhg4WRhLzB
         sMnA+luG5I4Pr4/llcnC4cY7dsYywp6IEULGtXQOzj8Z5W0L6Uth9nYT0rAJqP9XW39C
         COasI2m5x2wDYcfsZIilbHSp2CX4/8X/9GzFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524951; x=1737129751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Btut3VgKxopRo9Q+vGGxptkuYGH3HO6bbe9wnIz9Vu4=;
        b=RiT/n0Qb3+vmEhtwsPSxUD92kNaOkyOjA8iW1TE3tgHJ0v3ByYyqbIzbA1CEWBcpqc
         SoXZ7iArqN0HR3RuLBmZcSNW6hDlUVOQkEQ+IieXXab5PpQOS+9nC3/lOlaWghNwKHVP
         /AatJHSJLfGM+61GIQZC+u9npAoI7zMs6LP5/s7xbnT22qhKArAX+loz1d6rwLttcoFj
         +YIJIwRuqo8aH5Vb1tn6GGjv06FT21xLtrVMolNsHKGyY4NsynIRVLFfashOCb/9NM4l
         fU/Af2iu5o4zlu8+fefXl/ZXnbkw2uw+d7rL8t3e6i+7Pymada+1NA4f3+K/fTYLZski
         7Wxw==
X-Gm-Message-State: AOJu0Yw/zWkCOlCF8pBeLkwZOC29+TC1lkgWaXtUuPLz95wxRJOeqFvg
	6MlfUkxX1VZ1Yes43PpAKnYUimxxcXPRvvM8xbPewJ6+7/+2zlWaLrsNXozJXTW1oW1xAmlURye
	RZ+ObR0MH
X-Gm-Gg: ASbGnct6nWlQ4sKuD1KRkVqRXofqksIsKWu9CXGsR3rvqjAqrfS5wXIVcU/L/uPK62U
	xaHlqxB26RSTj0Trequ3mQf6B1/EBki+APKWhzCJyqUduaXVG7ECupvlFHBtO/jjQjS5uLE/rbW
	gN+r9CBVuwKlhBDgs0yfJUgx3ntMC8KmzW8GXW0BVusn9YqjC3iPWemmMy3C+nWWg9ctGDCwmbR
	gK0C+TGpeKbB1jjhyJ7QzWp9e8W0uNQOJgdWkrjjdIVlLlCAP5Ha3ddfol00BdqYtl0ukpYrvSQ
	A+d24w==
X-Google-Smtp-Source: AGHT+IE2QLjea2OuFYuA4zz1WmBqCuvxXAcg6LNNPwi5qmTXie3oSmJXauGAr7NeRZtUJVFIufXYpw==
X-Received: by 2002:a17:907:6d1a:b0:aaf:ab71:69cd with SMTP id a640c23a62f3a-ab2ab558b75mr1074247266b.20.1736524949936;
        Fri, 10 Jan 2025 08:02:29 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] CI: Add an x86_64 Clang Randconfig job
Date: Fri, 10 Jan 2025 16:02:17 +0000
Message-Id: <20250110160217.183887-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was recently identified as a hole in testing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/8820980201
---
 automation/gitlab-ci/build.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 3abd2a0c6575..cb84f379b754 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -551,6 +551,12 @@ debian-12-x86_64-clang:
   variables:
     CONTAINER: debian:12-x86_64
 
+debian-12-x86_64-clang-randconfig:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: debian:12-x86_64
+    RANDCONFIG: y
+
 debian-12-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-- 
2.39.5


