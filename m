Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B369693C2D3
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 15:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764999.1175546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWyOa-00023o-7k; Thu, 25 Jul 2024 13:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764999.1175546; Thu, 25 Jul 2024 13:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWyOa-00020x-42; Thu, 25 Jul 2024 13:20:36 +0000
Received: by outflank-mailman (input) for mailman id 764999;
 Thu, 25 Jul 2024 13:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wowc=OZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWyOY-00020m-E8
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 13:20:34 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac257ff5-4a88-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 15:20:33 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52f04b4abdcso225630e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 06:20:33 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c3a943sm229234e87.305.2024.07.25.06.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 06:20:32 -0700 (PDT)
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
X-Inumbo-ID: ac257ff5-4a88-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721913633; x=1722518433; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZ0Qtz0uWdy+/GgY9gT15K5+O141MDfodDtrSxR2ylk=;
        b=gqNDhr3yEA3IAcyVNNitlsDzQQcsiN877RxbkkiYexmWhOruJQwnEpiUpMTR5j7pFK
         9/wfu/hghnmlGizgaOCwocNllEjWpj6xLbAwnEnyuXdPMfWoQF3AjFPri6jZ3tQ+0xqS
         0boFdNe0lbF0aUNeuJSRXhftfvBb2PllL5PChKoNBjC7CB540y9Hjg32c4LUuOMyYTGx
         n3c1GqMlNYZHabD/82JEYQyEoyMoyjBbk8R3DnGLxXCKEWUsMel/ETTCGY4YXFZHq21Q
         ObuZG9STfiUs+rm6vzgFAsIxF1IWu6rDruN6Xbt32DVxtUt5BwhaLt8AAwcB6XkmV1M6
         Zm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721913633; x=1722518433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZ0Qtz0uWdy+/GgY9gT15K5+O141MDfodDtrSxR2ylk=;
        b=obde7LVC9iDD3buIg+HMGoUu/g/VwWHOL8RsV87EmpI1WQfROsSXYA1ITQmpAbl2/7
         icqJohvx1gsuCku/FissmRf0U60oJrunr7C084UvsoUQEXYRpOLGbWBMCHbhJnwfafKu
         xZ3VUCZKrcgdWvvgk9utnSlhd5qVUxKFdOO/285fV8M7RfAA/h2ebjf8CxN7pu7nz6HB
         Pq10kuvaCnOiyw6AA1a3ybD68wpWPaJA7sjGg081Inc7SOAEqtlGWIs96gTDUoGrhGYW
         i4w6pReQe2/sRr1uoRygPrP4r77i1YxwLRcrrnT3mhZgDrUF/lTocwi7LqSrMksqOrC2
         jbqQ==
X-Gm-Message-State: AOJu0YxUO+g8jG6Numkr82zOO4sUB8T8tBmwz+vCAeVhyFGjBsykUl0l
	zArpyArDEW2loEpmaNgfYPRCyybpfCRxy7Sv59eZ1NpqJpVHrGNzA4PV16pW
X-Google-Smtp-Source: AGHT+IF31avIDm7LVvR+SWKosmsWXhiW+cQa8xZIY/+D9OegfC4EphFeQRBlUvS8AXVF2rBNT1MyGw==
X-Received: by 2002:a05:6512:308d:b0:52e:be14:7012 with SMTP id 2adb3069b0e04-52fd3f24d19mr2193802e87.32.1721913632373;
        Thu, 25 Jul 2024 06:20:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	"committers @ xenproject . org" <committers@xenproject.org>
Subject: [PATCH] CHANGELOG.md: Finalize changes in 4.19 release cycle
Date: Thu, 25 Jul 2024 15:20:29 +0200
Message-ID: <b0e62915605cbc00548afd70c5fad81f57ce5217.1721913394.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 CHANGELOG.md | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index f8fbe82df6..39e8737e61 100644
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
+   - minimum fixes to rebuild the containers, following the HEREDOC problems.
+   - rebuild containers to have testing with up-to-date LTS distros.
+   - few build system checks, and strip the obsolete contents of
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


