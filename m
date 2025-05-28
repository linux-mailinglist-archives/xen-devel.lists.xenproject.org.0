Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F45AC7293
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 23:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999544.1380197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKO31-0002bB-BP; Wed, 28 May 2025 21:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999544.1380197; Wed, 28 May 2025 21:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKO31-0002Wx-6y; Wed, 28 May 2025 21:10:51 +0000
Received: by outflank-mailman (input) for mailman id 999544;
 Wed, 28 May 2025 21:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMiF=YM=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uKO2z-0002GV-UN
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 21:10:49 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a06207b-3c08-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 23:10:48 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so2253915e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 14:10:48 -0700 (PDT)
Received: from localhost.localdomain ([91.85.47.110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4ef4f3aa3sm143910f8f.84.2025.05.28.14.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 14:10:46 -0700 (PDT)
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
X-Inumbo-ID: 3a06207b-3c08-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748466647; x=1749071447; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4epTKamhANvL6RVYcC/CjM64YkIz4kbtxUbryvO3zZs=;
        b=fm/GS5bnMYEjY7x0F1LpGU0+wAz7QJt/ZYpcLZnAn78W8Io7gfZJs5G9wTjp8gUr2O
         KrHZ7Le15NgnLdDDkOa5ZWtwrF+uK2VgD9+3bjXGmdcPyhiWcq/4R8TeFpRH3MJ/oidp
         3faBTBlCMpewlWJh2aQA6Ln1J6RD7wiC/P2xBO65CyVK/6Vx/qXVV4LGW+NeG6dicvQD
         SgCKgUr/+TBfY7hq8CowkD8E6yWISo5NAI39SJAZMiTP+zqcM64X2oq+jZiPGQSyzQUl
         OdDL5oQ1Wj5/bAbgQ9Y5VHnpzKQT1LxujYq44HDXGCKfj522vVO2RCDbJQYwk1n5k0/M
         VHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748466647; x=1749071447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4epTKamhANvL6RVYcC/CjM64YkIz4kbtxUbryvO3zZs=;
        b=eGMWyX+xgVvePBOeTOr9xpVp/azqItQ22LP2ppQbyd2ONYiXwehuMrCYy5iaxi0ieI
         I40lqj+JdWRJnwvDuEwZ8B/2bLrhLqo17wYKJhfQ6k671zgpjG40nBdhiJEUmXFnvpL6
         4sWohQC5fWpJNSV8zCwHzLJaOf4VC6pjLkmIZ3V5iaUjcUawSNf5LK4priZLktrVpOm5
         x0TktxXb9/Ed3EYRy5FaDRFudd2x/toy/ERTyvaxocJLaH1ibfFTs/pXadkIKfxS/UcE
         eFlUAWGQKJmv9aedooMLumBSHe0Zngz5Cqf+Bf/C/5ssXX/HTTTLZQCzf6Qgo6ngYTGG
         ZuEA==
X-Gm-Message-State: AOJu0YwP63baVrO4iRXmvbXjqfnId4pYzEKr643u3reGAJTeBg8X/wkg
	7jyj51uPhvsLpjFaQA4vGgaXHCtZy9aO1rMbxYuna45EvnTu1sSJ7IukGITCtqRs
X-Gm-Gg: ASbGncvbn4LXUaSwiBukB47lMC0T811nBBGNroSme1xx6BY8xZCkqCd79svLaJ/rgG3
	vCoUHKW40ynqs2SMCLQcjRmT+flSKqMt+ISWYcXgV+gYDGXi/8QzPEn8wcdVg+p0yiMjyA/lLhH
	lqmLsVF0d/llOxAXHmuFY7Jt+QcQWaip9CsnzhsoryJo5S2483F7i40EW8ll6z5FY+R+jsWrSI9
	iiY33VYew/5dWbuJQk6aCFw90r5iyv2rr2EoKzmi6HOjHF/IJRowuXIDSyLT8BU2zeBdP8DkKYE
	X4izr65GcBiXezRilYplMkhgjbMiVeiEJ12kP1SC0rZ1d2dmlz8sb1N5+RvCJey3RUvVJny5+4A
	=
X-Google-Smtp-Source: AGHT+IHw+zffAXb/eGgelm9DAO/R8knFcy8nLEOmBm5+FANsVmbFgUrUKmzmAv/KL7fc4Yc7OSddgQ==
X-Received: by 2002:a05:600c:1e1c:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-450ce88131amr10823245e9.15.1748466646911;
        Wed, 28 May 2025 14:10:46 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
	Rich Persaud <persaur@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/3] MAINTAINERS: add link and keyword statements for Argo section
Date: Wed, 28 May 2025 22:10:39 +0100
Message-Id: <20250528211040.10562-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528211040.10562-1-christopher.w.clark@gmail.com>
References: <20250528211040.10562-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add link to Argo documentation and to ensure that Argo maintainers and
reviewers are included in developments involving Argo, add keyword
expressions for Argo.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca9..697f383505 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -223,9 +223,12 @@ F:	tools/libacpi/
 ARGO
 M:	Christopher Clark <christopher.w.clark@gmail.com>
 S:	Maintained
+W:	https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen
 F:	xen/include/public/argo.h
 F:	xen/include/xen/argo.h
 F:	xen/common/argo.c
+K:	\b(argo|Argo|ARGO)\b
+K:	(?i)argo[_-].*
 
 ARINC653 SCHEDULER
 M:	Nathan Studer <nathan.studer@dornerworks.com>
-- 
2.34.1


