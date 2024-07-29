Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B47993F48A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 13:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766651.1177153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOvl-0004ML-0W; Mon, 29 Jul 2024 11:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766651.1177153; Mon, 29 Jul 2024 11:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOvk-0004Ka-U8; Mon, 29 Jul 2024 11:52:44 +0000
Received: by outflank-mailman (input) for mailman id 766651;
 Mon, 29 Jul 2024 11:52:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrP=O5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYOvj-0004KU-73
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 11:52:43 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f3589ba-4da1-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 13:52:41 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso303556466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 04:52:41 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4de64sm496084966b.48.2024.07.29.04.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 04:52:39 -0700 (PDT)
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
X-Inumbo-ID: 0f3589ba-4da1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722253960; x=1722858760; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WliYJg/qMJnVNx2VV1RDbTJKi70OXdKC7sFDOciaFUc=;
        b=bcT4IMsyJ/NMDwlxEIy0H0EVSkp+FuydB1aPEaF0dz24YHlHtg3V2mIAdHAsCJkkAo
         7FzFHqnBh5DDmIitndOk0pFGC2Ik3OJCp14sgTZFVCvX+DT97BOtv7gaDl1m4ikDZCBQ
         BzgHL6m1OTpWAAq60Qh3WiG4gbB+7XCeYL2XcaTu02ngF/XnzfnA1XKNIxfW5NMFVFIf
         Rnm8vpmW/HnH475HQtFaaKvRuXntti/3T9OJUuOyqA/fv1l/BxREQWOQCHTiLtP1m82D
         AvMYaT8q4bLv/7Dbe8rj+cDJF7iFhFUKVnpOPqcYCrl5XjikmroF6l6CsWJq3u8MaPR3
         C64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722253960; x=1722858760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WliYJg/qMJnVNx2VV1RDbTJKi70OXdKC7sFDOciaFUc=;
        b=AlDRCuE4w9VYDDSUDsbYbgRPnQR3kholgWcjC0PnbZCpx2tN3UDSlxHilrytgeyIrS
         4DfLJevQrNs8WpoB4tvhxcLBSKIQtjMuQLyqY2UruEf9iYS3bZTD8A5zHDDJmtIxuJj5
         9XHm4nSqgdnzxk9+/vloLlSufqPzW2a6m9S0pMGt6oWzTfRzYeihl6uWZxmT+9IYSbxK
         63JJzcw1S77MR69N4IfeVw2A0J7BcX7zUIF7GWPNBa6KskUY0p8zcdb+c+/zma0WI90D
         wU61j9ERfraLiMP5io22a6P7njL5IqEo4RC0zQeaHwZb2KHvhf3C3ed6e/0r4vFovYU0
         mVMw==
X-Gm-Message-State: AOJu0Yyqd80T765ECf/COPTDgoLwiOg8c05aaqRH5BaMXq7SHelAgCbw
	Hk9bFgbheGtSdtdpPbeOmAH4uZodYuHS0aY5RT9FQI3spcliVDroMWAPRm7E
X-Google-Smtp-Source: AGHT+IF7Xzi7CKvJXw8CTe1e6L+yNP6AUOxP2Zdxd7q/+SgK2ymMYHrl0zg2j58YZfPXOPiEdJBUMQ==
X-Received: by 2002:a17:907:94c8:b0:a77:c6c4:2bb7 with SMTP id a640c23a62f3a-a7d3ffaddd0mr583474766b.1.1722253959995;
        Mon, 29 Jul 2024 04:52:39 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Community Manager <community.manager@xenproject.org>,
	"committers @ xenproject . org" <committers@xenproject.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] CHANGELOG.md: Finalize changes in 4.19 release cycle
Date: Mon, 29 Jul 2024 13:52:36 +0200
Message-ID: <32f773f72abbe114574980a8e99260ba96bd32e8.1722253791.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - update "Changed". Move "Code symbol annotations and MISRA compliance improvements" to generic
   part.
 - Sort "Added section". Per-arch changes go first.
 - Drop implementation related details for Arm and PPC in "Changed".
 - drop PPC and RISCV changes as nothing usable at the moment we have and only minor fixes
   and improvements were done.
---
Changes in V2:
 - Make CI items started with uppercase letters.
---
 CHANGELOG.md | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index f8fbe82df6..f143a924ef 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -23,11 +23,20 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    using a standalone library implementation.
  - xenalyze no longer requires `--svm-mode` when analyzing traces
    generated on AMD CPUs
+ - Code symbol annotations and MISRA compliance improvements.
+ - CI updates:
+   - Minimum fixes to rebuild the containers, following the HEREDOC problems.
+   - Rebuild containers to have testing with up-to-date LTS distros.
+   - Few build system checks, and strip the obsolete contents of
+     the build containers.
 
 ### Added
  - On x86:
    - Introduce a new x2APIC driver that uses Cluster Logical addressing mode
      for IPIs and Physical addressing mode for external interrupts.
+ - On Arm:
+   - FF-A notification support.
+   - Introduction of dynamic node programming using overlay dtbo.
  - Add a new 9pfs backend running as a daemon in dom0. First user is
    Xenstore-stubdom now being able to support full Xenstore trace capability.
  - libxl support for backendtype=tap with tapback.
-- 
2.45.2


