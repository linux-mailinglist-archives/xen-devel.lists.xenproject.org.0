Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1B57EB346
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632781.987219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v94-0002Cb-VM; Tue, 14 Nov 2023 15:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632781.987219; Tue, 14 Nov 2023 15:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v94-0002Ak-S5; Tue, 14 Nov 2023 15:16:06 +0000
Received: by outflank-mailman (input) for mailman id 632781;
 Tue, 14 Nov 2023 15:16:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJWh=G3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r2v93-0001sO-Q2
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:16:05 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bacd9d73-8300-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:16:05 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507973f3b65so8162169e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 07:16:05 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a7-20020a056512020700b005079d34f330sm1342970lfo.282.2023.11.14.07.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 07:16:04 -0800 (PST)
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
X-Inumbo-ID: bacd9d73-8300-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699974964; x=1700579764; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ktp5yOM9PEIg+T7oEz4OKeZ/CwStGNVTT5+LiWqecM4=;
        b=isWfa6QD6PSRcGEZqf9mQmYzSS74VbC7FaihFZVl0RPvi/CfUG+oyOjMd48cHv/1aT
         PLTc9Rw1tCG+v6JfIzCh0Nbfc/eyLQiJwgVgCtO7nqcHAwjvo9T5LbJwXXMNg6vTEQBL
         yQlc+37t/hnpLeqpqopMp3vIpjgoyHMjKsjRRPL9M77VAAy5skLEHLo/bCLvSqcDyk8B
         dTF7UIyAcIzYQ3xkvoE8Y1bvWBNwDD/Fo+cICaG3JYN3EcP3wiRwtSSwFQW/vchrUBv4
         tKXbHRgwIVNJ4TfHlDvWwwMSyUgHoX39lxETKCJQDZBWhwt9rP9HMZCKxRtOlMIvYKsl
         5wJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699974965; x=1700579765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ktp5yOM9PEIg+T7oEz4OKeZ/CwStGNVTT5+LiWqecM4=;
        b=s0GZGrALwP0cVTKQ5EhEuQF+wITsR9Z/FQTiJdkmNRJo8E+XQOHzJxDrSov39sVLLo
         8I+UR3skJsjaQVSyjUQdIEGJOgfi5WqDKKAXOB3cu5ySZmxzxPXZelL9FWloWcgp2Mt0
         3yxyUsqlcYyi3NNTvTLwvrOh1qRTh+r03vkE07oBDVzO8pgeczHURMJJIUJZTafHyboB
         IBtwNJMQsc20bcOQ8Lbs4SvMpihlSGlOXqoK8P7DTx9t50xvBX9XKfMOfUGaE7srS9qG
         3seOOPCW5SxfNFacHQ418tg9VzzkyQ5hBh1CpcwW2v9PFG98FCHdvtLEqasBGNP7PCFX
         Dk5Q==
X-Gm-Message-State: AOJu0YylEXSc3BRkOiEusWpD0sT0v7hCqQ6qieux53B36bA4GyJyTD6i
	Jhnz2GC9vzZjPc2APHP2LeyH+OiAiIY=
X-Google-Smtp-Source: AGHT+IEygYANju+gZ93rCVXrkgy30AYx2IbaCtR8hswwr4Yb+9WO4NXMlXCmd761sDkgTYBKNdp4hQ==
X-Received: by 2002:ac2:57cf:0:b0:4fe:347d:7c4b with SMTP id k15-20020ac257cf000000b004fe347d7c4bmr6442969lfo.7.1699974964434;
        Tue, 14 Nov 2023 07:16:04 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
Date: Tue, 14 Nov 2023 17:16:01 +0200
Message-ID: <feee97db556b5b38adb11877c4a37f1d0a09fc92.1699974909.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
generation of empty <asm/grant_table.h> for cases when
CONFIG_GRANT_TABLE is not enabled.

The following changes were done for Arm:
<asm/grant_table.h> should be included directly because it contains
gnttab_dom0_frames() macros which is unique for Arm and is used in
arch/arm/domain_build.c.
<asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
<xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE gnttab_dom0_frames
won't be available for use in arch/arm/domain_build.c.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
This patch was part of patch series:
https://lore.kernel.org/xen-devel/cover.1699633310.git.oleksii.kurochko@gmail.com/

The patch series hasn't been reviewed all yet so send this path
separately.
---
 xen/arch/arm/domain_build.c   | 10 ++++++++++
 xen/include/xen/grant_table.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 49792dd590..54620199d2 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -33,6 +33,16 @@
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
+/*
+ * <asm/grant_table.h> should be included directly because it contains
+ * gnttab_dom0_frames() macros which is unique for Arm and is used in
+ * this file.
+ *
+ * <asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
+ * <xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE gnttab_dom0_frames
+ * won't be available for use in this file.
+ */
+#include <asm/grant_table.h>
 #include <xen/serial.h>
 
 #define STATIC_EVTCHN_NODE_SIZE_CELLS 2
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 85fe6b7b5e..50edfecfb6 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -26,7 +26,10 @@
 #include <xen/mm-frame.h>
 #include <xen/rwlock.h>
 #include <public/grant_table.h>
+
+#ifdef CONFIG_GRANT_TABLE
 #include <asm/grant_table.h>
+#endif
 
 struct grant_table;
 
-- 
2.41.0


