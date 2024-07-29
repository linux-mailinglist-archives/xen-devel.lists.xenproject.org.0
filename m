Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4712393EE75
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 09:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766299.1176782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYKqs-0001b5-Mn; Mon, 29 Jul 2024 07:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766299.1176782; Mon, 29 Jul 2024 07:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYKqs-0001ZA-Jf; Mon, 29 Jul 2024 07:31:26 +0000
Received: by outflank-mailman (input) for mailman id 766299;
 Mon, 29 Jul 2024 07:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrP=O5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYKqq-0001Yy-Nx
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 07:31:24 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e8815a2-4d7c-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 09:31:23 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52f025bc147so4358934e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 00:31:23 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c19f89sm1376424e87.216.2024.07.29.00.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 00:31:22 -0700 (PDT)
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
X-Inumbo-ID: 8e8815a2-4d7c-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722238283; x=1722843083; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tn2zCNs4p2bZ0t6v0S65/PLs90ZGp523/+08PeuDdc8=;
        b=cR2YlhdYcsUhmacpT7PSEbi02DotdK6j+5++jyMhNPDmdgAdOU/8KFtqVE3mB7DR3B
         0n/4mMLbk44VY1NpyCJTDy5wrvEOlzNgNuJjdLHu0XJh3Bj1ldvY6gPEF2rjE4aLqyGJ
         4GjXrEirVcJJavroePXynIkhg1xwxfGaR67sUSgxE5Q08c6IMiq6EZq4b4yYWI5m0jR1
         mPWE48rHA42wBHiNIayGWIXDskao9mMEPbZOPqlOQaMmuaXxEnMd/hRdU71yWIC3sdVs
         LHws6EYZMW31KwC+GmxX0BIIXyI65fMmsvra3CP1f+c2ZxaofvTsQg3ozNyd6zuJ1b6g
         G/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722238283; x=1722843083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tn2zCNs4p2bZ0t6v0S65/PLs90ZGp523/+08PeuDdc8=;
        b=j8fl483vhV7lOsUXpgGqOE3Vxi54T3K+OlpjYjEuxpFx/f2dDnoRJ/PXb+QqJ0p773
         TtFX84ZU4S9vgDsza0b82P4cbwT6xrXDlLdr7R+vaJQHxMLFk0axzXOpRJwwO1uss7gJ
         hNTV1cusncmjdxPRHCDLgYkLVP3sB/D/oKPss2q2gOOe8QmTm824dkj9g2uPoS2iUQdj
         hF3GZqeA/Pc8cjXhjL9LtFFib8YLuPP6NTuChtYVc9m7cjXjAW2DySH7XC3DWBNadP+I
         9snqHqGZl2PjfnAZurjkMKMZQcfXUJRJj8u/ftVHpq6QmOJvIeGk00P4dO/9IMbGH03A
         stvQ==
X-Gm-Message-State: AOJu0Yxc6kEE+tXelcqzryjQBTdDiUCLt79IOWS9cD9s8u8V9JB0qlRR
	p2r5cqdKIStlBxShT6CMLIs/3EZ6wV8h19E2BV0FCgC0hka9IoLYlV6BsYp6
X-Google-Smtp-Source: AGHT+IGMgLXU1yOQkzhBSD58zGxxjONJ6uDnIVLrO7loscsuMhSYoaaoYJzFlMRuWiA9NNkD6fTa6g==
X-Received: by 2002:a05:6512:3504:b0:52c:de00:9c04 with SMTP id 2adb3069b0e04-5309b2c2ac3mr4753449e87.48.1722238282400;
        Mon, 29 Jul 2024 00:31:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	"committers @ xenproject . org" <committers@xenproject.org>,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for 4.19] CHANGELOG.md: Finalize changes in 4.19 release cycle
Date: Mon, 29 Jul 2024 09:31:16 +0200
Message-ID: <0c93b49ac00fa92721035b4f9eb2ae76175fe886.1722237887.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Make CI items started with uppercase letters.
---
 CHANGELOG.md | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index f8fbe82df6..a8b56b9632 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -15,6 +15,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Reduce IOMMU setup time for hardware domain.
    - Allow HVM/PVH domains to map foreign pages.
    - Declare PVH dom0 supported with caveats.
+ - On Arm:
+   - Reworking the logic so all the MMU-off code is now self-contained for
+     secondary boot CPUs on arm64.
+   - Code symbol annotations and MISRA compliance improvements.
+   - Addressing issues of the static shared memory feature.
+ - On PPC:
+   - Minor fixes and improvements:
+     - Add .text.exceptions section for exception vectors.
+     - Replace debug printing code with printk.
+     - Address violations of MISRA C:2012 Rule 11.8.
+     - Ensure ELF sections' physical load addresses start at 0x0.
  - xl/libxl configures vkb=[] for HVM domains with priority over vkb_device.
  - Increase the maximum number of CPUs Xen can be built for from 4095 to
    16383.
@@ -23,6 +34,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    using a standalone library implementation.
  - xenalyze no longer requires `--svm-mode` when analyzing traces
    generated on AMD CPUs
+ - CI updates:
+   - Minimum fixes to rebuild the containers, following the HEREDOC problems.
+   - Rebuild containers to have testing with up-to-date LTS distros.
+   - Few build system checks, and strip the obsolete contents of
+     the build containers.
 
 ### Added
  - On x86:
@@ -31,6 +47,14 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Add a new 9pfs backend running as a daemon in dom0. First user is
    Xenstore-stubdom now being able to support full Xenstore trace capability.
  - libxl support for backendtype=tap with tapback.
+ - On Arm:
+   - FF-A notification support.
+   - Introduction of dynamic node programming using overlay dtbo.
+ - On PPC:
+   - Basic exception handler implementation.
+ - On RISCV:
+   - Identity mapping implementation.
+   - Introduction of architecture-specific headers.
 
 ### Removed
  - caml-stubdom.  It hasn't built since 2014, was pinned to Ocaml 4.02, and has
-- 
2.45.2


