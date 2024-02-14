Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 001B2854B7E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 15:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680857.1059025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raGLa-0007Xb-N9; Wed, 14 Feb 2024 14:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680857.1059025; Wed, 14 Feb 2024 14:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raGLa-0007VT-K7; Wed, 14 Feb 2024 14:34:50 +0000
Received: by outflank-mailman (input) for mailman id 680857;
 Wed, 14 Feb 2024 14:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hroU=JX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1raGLZ-0007VN-Pd
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 14:34:49 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 341d25fd-cb46-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 15:34:47 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3d484a58f6so93067166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 06:34:47 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a17090699c600b00a3ced84c1e5sm1998360ejn.169.2024.02.14.06.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 06:34:46 -0800 (PST)
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
X-Inumbo-ID: 341d25fd-cb46-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707921286; x=1708526086; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSeGZrKW45NOij+0OCKsMaecydGRYMcVxuo54PO/m0Q=;
        b=R3TEKUSMc5Nsj2u4etKDPZPE9pSn0j78XyerQFDrTsXf4OE39tDEQr2tsJw0oWlhM5
         5SjwkaOlRtOflSXUgn0Olu8L+S1d0YF1/mGpDVWeqfyC3AB/KN0ShKOE7AX8f0Mo1vzA
         5xjVjUr4WtEftwInECBZsZmDvbBinc++nfotg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707921286; x=1708526086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSeGZrKW45NOij+0OCKsMaecydGRYMcVxuo54PO/m0Q=;
        b=ThXhQa4xk5IMREvMseePKaQPbtODu5fqVIPue3JcJNe2nnbBoSS64Wjyj0qcKvBK5z
         aiIZA3BAzf59lHnMxletcFKeFZvt0RS8g6dmNri5AjqT2VWxKZ6eBte0Tb7tpVcDkK/t
         CeUecgWBWB+hYCo56peo00XfTjAIgvQZxl7YV2eFa3iJDmSQWs3/cwDyq1jVjySwjFwI
         Yaw4FoQdpjWRx6KHnJeEQG4hN3t7fWRZojVF4dZhIiKwporVKnWeaVvXxVtbei7GfxOH
         yaSFnekzaOAImphkVrt/KUFC+5ocXpfINtdf6JY9wdOVj6hu/mAVarHN3es56d8IjOJq
         GQxA==
X-Gm-Message-State: AOJu0YzcILT6wcYFbSlPIVTGYUYN056+CgtxEP+IKBiEMugHD8QdPnrE
	b4bT2+ToPY2T1STgD4C64p0bzsdLRKPgngbE1A9fCYG9WnZxJO0a+Dy5HCvUzJKSWrZa1kYKyrH
	r
X-Google-Smtp-Source: AGHT+IGgKUN0QpGnEXykWKM7akyMU9FS+TnDZ8F136CPjK7aIkwLnADrTk4VAwWJkZpy1d7mdAQl1g==
X-Received: by 2002:a17:906:1cd7:b0:a3c:e8f6:a399 with SMTP id i23-20020a1709061cd700b00a3ce8f6a399mr1753239ejh.29.1707921286594;
        Wed, 14 Feb 2024 06:34:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXACRwUnl35To02OMat2HxDZyplCK0waE6I2DmrnvECw7kSBKhCP84nl1lR4vwW+WV+PkKSYs/l87OOlAgdPojU69cpaOFv6L1JCGDcCa4ZniD3N3RuINBLeHEV2pAMD0CZzi047bwjzautDMZkkfWm5ert7gTCQkKpQtYoT6+Jlto5qHLpGLHoOdIJ52GkwjfSPQeNpZqJjMVCfniYH8kHHMUb8hd3S92gDA==
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] build: Replace `which` with `command -v`
Date: Wed, 14 Feb 2024 14:34:11 +0000
Message-Id: <20240214143411.37957-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `which` command is not standard, may not exist on the build host,
or may not behave as expected. It is recommanded to use `command -v`
to find out if a command exist and have it's path, and it's part of a
POSIX shell standard.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 21832d6402..767e47d6c7 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -25,8 +25,8 @@ export XEN_BUILD_HOST	:= $(shell hostname)
 endif
 
 # Best effort attempt to find a python interpreter, defaulting to Python 3 if
-# available.  Fall back to just `python` if `which` is nowhere to be found.
-PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
+# available.  Fall back to just `python`.
+PYTHON_INTERPRETER	:= $(word 1,$(shell command -v python3 || command -v python || command -v python2) python)
 export PYTHON		?= $(PYTHON_INTERPRETER)
 
 export CHECKPOLICY	?= checkpolicy
-- 
Anthony PERARD


