Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6748D38FF
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732039.1137838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCK9l-000159-1g; Wed, 29 May 2024 14:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732039.1137838; Wed, 29 May 2024 14:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCK9k-0000yE-Rx; Wed, 29 May 2024 14:19:56 +0000
Received: by outflank-mailman (input) for mailman id 732039;
 Wed, 29 May 2024 14:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mTS/=NA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCK9j-0000nO-Ln
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:19:55 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84d5f838-1dc6-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 16:19:54 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52ac0c4b62cso918754e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:19:54 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6389a0b4ccsm101767066b.22.2024.05.29.07.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:19:52 -0700 (PDT)
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
X-Inumbo-ID: 84d5f838-1dc6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716992393; x=1717597193; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3GqAy/9EOMNyS8UbjPjYfePETa99PYyhqdiXPHDoPE=;
        b=TXYBGC+OEyDAMbhpRNI13SOTl0DoxbNcOAm0mBzh7ylI3V5SrGRVIrswusBTyhnOqU
         VGJlsP5iiZqxJBRbtd2+T0arSXjiOtq24V3W/UOG+098pnFlIqcWxuuDO4uMD5vc1H7D
         2URQcL0/BTG4Aar90PMNHbmpVReve7RYabzuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716992393; x=1717597193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3GqAy/9EOMNyS8UbjPjYfePETa99PYyhqdiXPHDoPE=;
        b=KHigry1sX0aBg4h8Ln2rIAfB3KOfnDr2VQFh/ljb37p/jRqmNvC+C5XbmBX37JPduN
         std/MjnnNpP6ScgKvDbLv09mPG9CQBl8tFB1CSYFMohZrDUP+rGnL7CszWNaglULNL6C
         ruTbgvdztB2mcTn2+shMe86ERELRXEO/0W6KilCBL53RXJ53wnvnfyEaxF9VG84zNpKj
         RvT4UM7rqbjIhdrMG0E2bC97jZN2ANOWBPgXi1kcC3+Zdrg/s8Wudr5KUF1/3MhZjeDL
         +jzSg6IRLni+l+rms4NQ0BPDJ31eCogZTuzgFFRN89VZiBqi21cztz7ZYUp9JffrtByu
         59XQ==
X-Gm-Message-State: AOJu0YyP7nCEvHae/AuL58pPY5YqSb3fLN3G3yFSxYGH/XSXprwAKf1r
	1FNptPovPD3XjwiTYTUVebptHV9gf7nlV8NX0Og44v6bfMcU/yg68YmNiEc8qYlP/O6p8z464en
	Ie3w=
X-Google-Smtp-Source: AGHT+IFHdcS1iAmyGtIA/4CVKsINRCA84cKkjw2uKIkYUASYk+PNJqQ3Mz8TSQNwvgUX+M8KtjRFfw==
X-Received: by 2002:ac2:5f65:0:b0:529:b634:bed1 with SMTP id 2adb3069b0e04-529b634bf97mr3873913e87.58.1716992393449;
        Wed, 29 May 2024 07:19:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/3] CI: Use a debug build of Xen for the Xilinx HW tests
Date: Wed, 29 May 2024 15:19:44 +0100
Message-Id: <20240529141945.41669-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529141945.41669-1-andrew.cooper3@citrix.com>
References: <20240529141945.41669-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... like the other hardware tests.  This gets more value out of the testing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/gitlab-ci/test.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index efd3ad46f08e..e96ccdfad54c 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -149,7 +149,7 @@ xilinx-smoke-dom0less-arm64-gcc:
     - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
+    - alpine-3.18-gcc-debug-arm64
 
 xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
   extends: .xilinx-arm64
@@ -157,7 +157,7 @@ xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
     - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh gem-passthrough 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
+    - alpine-3.18-gcc-debug-arm64
 
 adl-smoke-x86-64-gcc-debug:
   extends: .adl-x86-64
-- 
2.30.2


