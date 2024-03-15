Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF0387D357
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:09:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694033.1082897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlC02-0001XC-5w; Fri, 15 Mar 2024 18:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694033.1082897; Fri, 15 Mar 2024 18:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlC02-0001VH-25; Fri, 15 Mar 2024 18:09:46 +0000
Received: by outflank-mailman (input) for mailman id 694033;
 Fri, 15 Mar 2024 18:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBx5-0005yW-Ao
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:43 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c74b4bfc-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:42 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d4698f4936so31765381fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:42 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:41 -0700 (PDT)
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
X-Inumbo-ID: c74b4bfc-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710526002; x=1711130802; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsMXEbuzvQgFJEn0K8X9h9yZxAaRur+Xb5WLOt3ikK8=;
        b=gePbBkmJGKQc7GUheasZf2LMvRMy9qzQAbCCtTpR6vS63ZhiMsuFVE+vhkJfHAFHUD
         8ZAlJ7jT/ylSclX+H8lLLDuP6fyRk4KHtqqyTLbU7YFfEO+ebsd/0ZYKFmTbUfTW0siU
         oX4BfaqFMCB89EEZ6CjKp/J9rdu8raPd3fz3D9TP92OuLK+6eItrEbR6N2qZP2nLXqBO
         t6PyhIyM0YXc7onWomajyNzqZFHBJUkNtgdAvQ8USE7mVgthHlpuGnIaKzC302DFaVTL
         wjV8vd4ODsPn0rBp5Kkc/oRWbDm/1NQVytFlrGvzgd7yafUxqgVH6ZPao8UsK7m6U0wv
         oLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710526002; x=1711130802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsMXEbuzvQgFJEn0K8X9h9yZxAaRur+Xb5WLOt3ikK8=;
        b=YUUZgP6k+2NuldVj0iyCIOLEN05bNnpyhCzegobsuNjB2Cyy0kBTEOtcd+r2+5Y+yZ
         t2p4YP4+qOv0d5UwR9fXt3/v0+HKA+WLfkfLLSF0FyDT6hBdbbwl0mdQHchOWbO7fiUZ
         vKExxoHERw8UqTXTJBhw7SAZDsY8l1gN/u8X4wg55Y4gD+PpbMfb5nKffENJLoOlFmpH
         FsxyQL5ZccabRxV8B7qb64me+3YAI6TjCJMQIwfhQThY2hPX8NTgb2yg9lD92Lolk5Rl
         EMszOGyH9ZTvh6AEzdeMWfoTP0d3A/X+M909L4w8mDclF5Jl73e6KvJ8ikINJnn7AVG4
         Zebw==
X-Gm-Message-State: AOJu0YzifmZR7nrh8iUrdmMOdHMaahbsg0bB9Og5MArfBoFE5w1apViW
	9313EfU4NREMyeYnY6t89LK7wFM5UzCKyLQd9h2BGwlHN3efuT2DVmzlDCw0x/w=
X-Google-Smtp-Source: AGHT+IE9dXphkeMbJR8ERhFEV7xr9bENpzyXUz8rXvndWu6/JOiC/7cONEq9zSxMkFaOAq+Cvy7U9Q==
X-Received: by 2002:a2e:8806:0:b0:2d4:3c32:814d with SMTP id x6-20020a2e8806000000b002d43c32814dmr4122685ljh.26.1710526001704;
        Fri, 15 Mar 2024 11:06:41 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 20/20] xen/README: add compiler and binutils versions for RISC-V64
Date: Fri, 15 Mar 2024 19:06:16 +0100
Message-ID: <6bbbc11bc16f31ee8b2a5f47405c61236c97d205.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch doesn't represent a strict lower bound for GCC and
GNU Binutils; rather, these versions are specifically employed by
the Xen RISC-V container and are anticipated to undergo continuous
testing. Older GCC and GNU Binutils would work,
but this is not a guarantee.

While it is feasible to utilize Clang, it's important to note that,
currently, there is no Xen RISC-V CI job in place to verify the
seamless functioning of the build with Clang.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V6:
  - update the message in README.
---
 Changes in V5:
  - update the commit message and README file with additional explanation about GCC and
    GNU Binutils version. Additionally, it was added information about Clang.
---
 Changes in V4:
  - Update version of GCC (12.2) and GNU Binutils (2.39) to the version
    which are in Xen's contrainter for RISC-V
---
 Changes in V3:
  - new patch
---
 README | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/README b/README
index c8a108449e..30da5ff9c0 100644
--- a/README
+++ b/README
@@ -48,6 +48,10 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
+          Older GCC and GNU Binutils would work, but this is not a guarantee.
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.43.0


