Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C7A56FCB
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 18:57:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905257.1313136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqbwE-0003hN-No; Fri, 07 Mar 2025 17:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905257.1313136; Fri, 07 Mar 2025 17:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqbwE-0003fO-KX; Fri, 07 Mar 2025 17:56:46 +0000
Received: by outflank-mailman (input) for mailman id 905257;
 Fri, 07 Mar 2025 17:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqbwD-0003fI-HE
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 17:56:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86a7039f-fb7d-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 18:56:42 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43bc30adad5so13596675e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 09:56:42 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c103035sm5954573f8f.88.2025.03.07.09.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 09:56:39 -0800 (PST)
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
X-Inumbo-ID: 86a7039f-fb7d-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741370201; x=1741975001; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+x1kYl1a1noEIWw3uWYi5SihUJ8GTOHCbg14SU8Fyx8=;
        b=snuMlCyxORaVGf5zO7pCSJPOzE5DD+ZIPi3Ths0uhHRzjG8lRX7P4S2NPwY8/2ubHI
         yWu0yMsizKsnTvKBANDtM6boZIKFGQ13WDrCAydXfV/guGY8v4tY5SuKiDwIIPvumKJ1
         DOoxX9B4FnTrb4Jkv+QT50oNnB7p8VKOLbkGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741370201; x=1741975001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+x1kYl1a1noEIWw3uWYi5SihUJ8GTOHCbg14SU8Fyx8=;
        b=K2Y+oZvwBD8Q7k0DrWXF8/iz2t1sVlnC+311VYAAJrirpubSeJxIRKea5JWk6sZtiz
         wMWklKyIRl5r/Y4zwPq6UrhocxpQRmCSmmGvzsu1MzCYf7XdkLMcoqlvQ4kqIUH0sVxd
         xL90GKRNCI3N+vhj1GG9qrHqrg6lx5bFFn2BGPTxbeWeaf12zFkMFsQWJwreMDQMHuOz
         G2jhWAGCXkg4uoXxGFa4egxCtuFAVWHh2LWQmDOF+iVrrR3ODcDtDuGXa3FB/xaq+1Uw
         6V/tdAT2Cg3B5ZLitN9YkjS6iZBmLoF996YLkWm1KZSHNWqjrz3WJGKVyEhO0eviNNbM
         V0DQ==
X-Gm-Message-State: AOJu0Ywy/JC7rkYVf5DiKucANr3rq48MqyogVHS3Hr47HksdG6KdhjN+
	C440GE8vnv/BoxLa3aNTMNs20QevjZyRwRCJRixXq47qH8kEcWaw8izJqnMSFUcQuvNtx0vdtv9
	0
X-Gm-Gg: ASbGncuAcxc/aX+fBrVUQkfp2qFx1d9qA3h6X7dy1AwA/jkgaCux1BFQJ/x3HcFVsz7
	gPEdmAjKLj22hx7q0EYKAjwKiDXnRZGkxGshsvrDLZ0QltDtRaI9OEj4hoMa08ak3CqjQfwwF26
	Dq9Uubc02cL6EFt0qXl6/D4/RNKV1dDA5oCfenVN1bQ7c3P0WM+B1/D1DT3DYdTyQQMHc3wXCCo
	X9Yz/JTkuqySgiYevdoqbHCdaYYW5PGx6TaNqxFIHa32LyCVauHda0jxNKSrHAoPWUIzTBodJ7F
	NoAYhXDeOI0WDPB4WqzLGjqKCc3qzxeKU9mLg5PaVzS0dc1PiGRinVtIFvKbOuUuxXngTtdz70n
	uKtyWmaQgnVqcKA8nYOgU5SDg
X-Google-Smtp-Source: AGHT+IGMN7OGJHyaospCvBCxQZoVlXR6Ja9W+F7zuctZhWg699INKZdDM2daFxLVjRE1BExIQ095QQ==
X-Received: by 2002:a5d:648f:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-39132dd6934mr3302787f8f.43.1741370199747;
        Fri, 07 Mar 2025 09:56:39 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH] xen: Update minimum toolchain requirements
Date: Fri,  7 Mar 2025 17:54:35 +0000
Message-Id: <20250307175435.3089686-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC 4.1.2 is from 2007, and Binutils 2.16 is a similar vintage.  Clang 3.5 is
from 2014.  Supporting toolchains this old is a massive development and
testing burden.

Set a minimum baseline of GCC 5.1 across the board, along with Binutils 2.25
which is the same age.  These were chosen *3 years ago* as Linux's minimum
requirements because even back then, they were ubiquitous in distros.  Choose
Clang/LLVM 11 as a baseline for similar reasons; the Linux commit making this
change two years ago cites a laudry list of code generation bugs.

This will allow us to retire a lot of compatiblity logic, and start using new
features previously unavailable because of no viable compatibility option.

Merge the ARM 32bit and 64bit sections now they're the same.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

PPC doesn't have a minimum set stated yet, but CI tests GCC 10 from Debian 11.

This will require dropping some containers from CI.  CentOS 7 notably.

In terms of specific new features, I'm interested in:

 * __has_include() to remove the asm-generic makefile tangle
 * asm goto (), to remove .fixup and code generation for error handling.

and these too, but will require MISRA adjustments:

 * _Generic() to make properly const-preserving wrappers
 * Updating our -std to gnu11, which drops further compatibility logic

When the arguments die down, I'll add a hunk to CHANGELOG.md as this is very
significant.
---
 README | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/README b/README
index 9d9c6fc324c6..be90be3910d4 100644
--- a/README
+++ b/README
@@ -38,16 +38,13 @@ provided by your OS distributor:
     * GNU Make v3.80 or later
     * C compiler and linker:
       - For x86:
-        - GCC 4.1.2_20070115 or later
-        - GNU Binutils 2.16.91.0.5 or later
+        - GCC 5.1 or later
+        - GNU Binutils 2.25 or later
         or
-        - Clang/LLVM 3.5 or later
-      - For ARM 32-bit:
-        - GCC 4.9 or later
-        - GNU Binutils 2.24 or later
-      - For ARM 64-bit:
+        - Clang/LLVM 11 or later
+      - For ARM:
         - GCC 5.1 or later
-        - GNU Binutils 2.24 or later
+        - GNU Binutils 2.25 or later
       - For RISC-V 64-bit:
         - GCC 12.2 or later
         - GNU Binutils 2.39 or later

base-commit: ac29d63a0fa6a3ed98ecf86f95995811c301308f
-- 
2.39.5


