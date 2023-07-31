Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333557695E5
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572974.897265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoh-0008DS-Im; Mon, 31 Jul 2023 12:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572974.897265; Mon, 31 Jul 2023 12:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoh-00086U-0P; Mon, 31 Jul 2023 12:16:03 +0000
Received: by outflank-mailman (input) for mailman id 572974;
 Mon, 31 Jul 2023 12:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRoe-0003r6-JW
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:16:00 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01f72e92-2f9c-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 14:15:59 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe10f0f4d1so7287058e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:59 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:57 -0700 (PDT)
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
X-Inumbo-ID: 01f72e92-2f9c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805758; x=1691410558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBs/FDkfYRgoPZr2GGaB11R97tPaKWbGqww2/VGZEhE=;
        b=mv6YspaDGeTi1WqN/SF31Z9c0+2y2PjHwqOv8iuM7N/eeNiBiSCC32vrqtXwnz7KUe
         z789FZY9VMV9eG/mcjtCNNHdeOp68HifeHRV5FRxCjuf/sV7Ly01q0OhT4qQC5Yjd2m+
         61wDbDACiqCaj8henceKNoRzaUV/7pGEBqTycamtITwEQuoLh4tupRelkonSXxhYb/3g
         NHlCBN+1RZg9Hx1+B7hOgUUIPYR3xy7n1wjbFiRVkpReyOTsIt0JdK0/dqFeywps6pV4
         hX0muTBmlrXCl4lpm4dO4wyhjqX4axiB5LB5w5VKH08wDRlupW5Rt2tan5tIdWaTCZDl
         hdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805758; x=1691410558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBs/FDkfYRgoPZr2GGaB11R97tPaKWbGqww2/VGZEhE=;
        b=PDDBG9nY2P+UiXDbsV7Ec2jGkw4qKX/mVNoppthWroX0sNCOiIrszQcfErx9N3CXuy
         76Cw7zgsIu2ije9bl1Es0Cpz99K4Y3G7Km9RVp++5l5ZAfPu0rD+hH06vRshNxL9ZjKX
         hBM2OehhIOV66WW1B9e1m/Gwe6ZL+IISJk29wPuFjbqdL9T36c3K+hGzOvcqBNIHOB9G
         kfuKS15v+rPMmhjwrGAscqyAR4rl8tla4JJ0Xv2oxcbGRrTSh2zJHcNOhYvI+G4W9v0g
         XXt/H8cZTiGZo+Eyz4iLJQ4WXZyKTTyXGmAGy71ygFGKP4mg0syWZPL6oOUvKkLivdhd
         kN1w==
X-Gm-Message-State: ABy/qLYpHpXGXgx3+Q+VJx5cbQ8RuECrWqXk7C0kbGpSfcy/ngO6b1h7
	W+7i3+ryVw/twsN/dRzN1OJ7UPOuulLsvfGEFIM=
X-Google-Smtp-Source: APBJJlFHWP4N4SZZJsNudSOwkqOQW2CE9qoDGOLMrNEzkNM/i1gHC1PN5lQuy06JIsqlbb9MmrCm9w==
X-Received: by 2002:a05:6512:3086:b0:4fe:629:9265 with SMTP id z6-20020a056512308600b004fe06299265mr7181260lfd.20.1690805758289;
        Mon, 31 Jul 2023 05:15:58 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH v11 14/14] docs: add Arm FF-A mediator
Date: Mon, 31 Jul 2023 14:15:36 +0200
Message-Id: <20230731121536.934239-15-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
Partition in secure world.

[1] https://developer.arm.com/documentation/den0077/latest
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
v10->v11
- Add a CHANGELOG.md entry as requested
---
 CHANGELOG.md             |  3 ++-
 SUPPORT.md               |  9 +++++++++
 docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7d7e0590f8c6..f24c8c4b8011 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -24,7 +24,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - xl/libxl can customize SMBIOS strings for HVM guests.
  - Add support for AVX512-FP16 on x86.
  - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
-
+ - On Arm, add suport for Firmware Framework for Arm A-profile (FF-A) Mediator
+   (Tech Preview)
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
diff --git a/SUPPORT.md b/SUPPORT.md
index 35a6249e03b2..fe512762cee7 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -840,6 +840,15 @@ that covers the DMA of the device to be passed through.
 
 No support for QEMU backends in a 16K or 64K domain.
 
+### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
+
+    Status, Arm64: Tech Preview
+
+There are still some code paths where a vCPU may hog a pCPU longer than
+necessary. The FF-A mediator is not yet implemented for Arm32. Part of the
+FF-A specification is not supported, see the top comment in
+xen/arch/arm/tee/ffa.c for limitations.
+
 ### ARM: Guest Device Tree support
 
     Status: Supported
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index a2bccd5b48a1..ec4864958e0e 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1656,6 +1656,21 @@ in OP-TEE.
 
 This feature is a B<technology preview>.
 
+=item B<ffa>
+
+B<Arm only.> Allow a guest to communicate via FF-A with Secure Partitions
+(SP), default false.
+
+Currently only a small subset of the FF-A specification is supported. Just
+enough to communicate with OP-TEE. In general only direct messaging and
+sharing memory with one SP. More advanced use cases where memory might be
+shared or donated to multiple SPs are not supported.
+
+See L<https://developer.arm.com/documentation/den0077/latest> for more
+information about FF-A.
+
+This feature is a B<technology preview>.
+
 =back
 
 =back
-- 
2.34.1


