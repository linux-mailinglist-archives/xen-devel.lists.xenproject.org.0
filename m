Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6AE75EE62
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 10:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568509.887865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNrIt-0006l3-2m; Mon, 24 Jul 2023 08:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568509.887865; Mon, 24 Jul 2023 08:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNrIt-0006jG-0B; Mon, 24 Jul 2023 08:52:31 +0000
Received: by outflank-mailman (input) for mailman id 568509;
 Mon, 24 Jul 2023 08:52:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJWe=DK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qNrIr-0006j1-DI
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 08:52:29 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68f6c0e0-29ff-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 10:52:25 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-666e97fcc60so2168016b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 01:52:26 -0700 (PDT)
Received: from leoy-yangtze.lan (n058152048165.netvigator.com. [58.152.48.165])
 by smtp.gmail.com with ESMTPSA id
 y10-20020aa7804a000000b006862af32fbesm7468270pfm.14.2023.07.24.01.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 01:52:24 -0700 (PDT)
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
X-Inumbo-ID: 68f6c0e0-29ff-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690188745; x=1690793545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3vP9oVx6XJxTpEk4lj39ypfC446ppW0B9Ad1g8MeRw=;
        b=a3aK1Xru3bnq80T4H/MTa4a2WlJfUFOMxElqqeRaJkTKwmZcEoboJH/E02s0rCduKl
         c73qtM8iMbSWp9/Apmi1P8MgtZQ0wYyyKibF00sM0WKlDmn7dXQVlHgBZGI7iB8A97XA
         SZGoq+pBUkcJRghyD9kuZX64t3yvpWN1fvLvu1budovqTiCjXqa4o67sA3rqsb6R3DGV
         9gvw0/Nmj5oLnYrGa/Dy/XFjtKsmSXtCmAKMitE9PiN/2MJKk2+B3KjeFMc3nd8JRkA4
         fCHZFca7p/gF1o/DPU1ce9O3sa+YH+m3dcoa7njjj4HSs0M1i3hQiam6JWiJkdQW6AwX
         ESzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690188745; x=1690793545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3vP9oVx6XJxTpEk4lj39ypfC446ppW0B9Ad1g8MeRw=;
        b=ODORZ3rTk1mutikV0PUKWcfNgL3Oxlaola0gNtACIQAsM5Z+LdsVFP8ixPGWYB2eO9
         IMdTgcsJlq9eLrBN3gRsz81/cYVTz5NOmRgrzMD2OdFhcQn83bpioP5sfIzOCFe0sK2i
         L0LIPVn6qvIrtZ5yilR2T4SVlZEsQAbRurjCvYdt9fYAv5ix65sgVvvU764P13YER0ij
         2sParBmI5ScDftQHapux3MDBMcLivcMZm7XizUfZfBrfOkZnuFrVo0m5Ypfbqrn7QFDf
         RmlM56FfK5Q1oHoGyBoviS9LNLPhl9U4n3NFABE9NDI+DIs4Ul2fVICFep7zNGPTSEm5
         85qg==
X-Gm-Message-State: ABy/qLZ7ss6HQ//8nZ1WlalpiF6VUk23Xe2hphkZUlAPSYI+RL1f7ntM
	SD4rX0r39RFXE92gMcN3L/UqqBO3Zo5SJTG9xnU2WQ==
X-Google-Smtp-Source: APBJJlHDhVp69JuqF8N0VBOWFEmBhf+3xPkJoxi2C2DVG7PlwC7504jjwnIFnTRlY9wKAS3aZbavfg==
X-Received: by 2002:a05:6a00:2d8a:b0:666:81ae:fec0 with SMTP id fb10-20020a056a002d8a00b0066681aefec0mr5678751pfb.25.1690188744850;
        Mon, 24 Jul 2023 01:52:24 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH] docs: Correct name for xen-command-line.pandoc
Date: Mon, 24 Jul 2023 16:52:11 +0800
Message-Id: <20230724085211.1383703-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the commit d661611d08 ("docs/markdown: Switch to using pandoc, and
fix underscore escaping"), the documentation suffix was changed from
".markdown" to ".pandoc"; however, the reference was missed to update.

This patch updates the documentation name to xen-command-line.pandoc.

Fixes: d661611d08 ("docs/markdown: Switch to using pandoc, and fix underscore escaping")
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 docs/features/sched_credit2.pandoc | 2 +-
 docs/misc/arm/big.LITTLE.txt       | 2 +-
 xen/common/Kconfig                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/features/sched_credit2.pandoc b/docs/features/sched_credit2.pandoc
index 436ff9f8f6..ef07e463cb 100644
--- a/docs/features/sched_credit2.pandoc
+++ b/docs/features/sched_credit2.pandoc
@@ -27,7 +27,7 @@ different than `credit2`) parameter is passed to Xen via the
 bootloader.
 
 Other parameters are available for tuning the behavior of Credit2
-(see `docs/misc/xen-command-line.markdown` for a complete list and
+(see `docs/misc/xen-command-line.pandoc` for a complete list and
 for their meaning).
 
 Once the system is live, for creating a cpupool with Credit2 as
diff --git a/docs/misc/arm/big.LITTLE.txt b/docs/misc/arm/big.LITTLE.txt
index b6ea1c9d61..1d11058444 100644
--- a/docs/misc/arm/big.LITTLE.txt
+++ b/docs/misc/arm/big.LITTLE.txt
@@ -42,5 +42,5 @@ The following option runs one domain vcpu as big and one as LITTLE:
   cpus = ["0-3", "4-7"]
 
 
-[1] docs/misc/xen-command-line.markdown
+[1] docs/misc/xen-command-line.pandoc
 [2] docs/man/xl.cfg.pod.5
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index dd8d7c3f1c..0d248ab941 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -440,7 +440,7 @@ config DOM0_MEM
 	  The specified string will be used for the dom0_mem parameter in
 	  case it was not specified on the command line.
 
-	  See docs/misc/xen-command-line.markdown for the supported syntax.
+	  See docs/misc/xen-command-line.pandoc for the supported syntax.
 
 	  Leave empty if you are not sure what to specify.
 
-- 
2.39.2


