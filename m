Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E382697F8F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496072.766614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJoA-0001B9-HX; Wed, 15 Feb 2023 15:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496072.766614; Wed, 15 Feb 2023 15:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJoA-000196-EN; Wed, 15 Feb 2023 15:34:58 +0000
Received: by outflank-mailman (input) for mailman id 496072;
 Wed, 15 Feb 2023 15:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d1cb=6L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pSJo9-000190-7I
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 15:34:57 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bdc1b3d-ad46-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 16:34:55 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id n33so7609893wms.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 07:34:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1c770e000000b003dfdeb57027sm2282207wmi.38.2023.02.15.07.34.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 07:34:54 -0800 (PST)
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
X-Inumbo-ID: 4bdc1b3d-ad46-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NKH73T8CoRDn773NUygCpVvIPtF8CVn6vI6nMM27j1I=;
        b=oWMZO8SDTBKsKLKV5arFKZkrAJOGtNpPBm7I7aWKb95hPiiIgSofZ2fkKU9tV1yKEk
         ezjXzyaIJvJZ7pt/cesNBdhWjhfCD6KYhuK3pUsvBFLzjuXN7TM3pj0Aj+NMo1rWX/D+
         HjCANU6Wo6wCGW/Kv//t8t8RmH8XJ2EJBasw66r5j5wcdU9lsvUIE3mQU9Vp7JQA2sI5
         +CUrsISj4deC6Zc/TrdvDLfz1UMTfaaVHV/WHx/zcqM5nvoBYV7XqNW0nYgniuMJfDdo
         OQ1fyZ5xzZ5uQqcPz6yGnEHfZanaWvSUEkKl05yMthFmyQCAbLDxwE1G6pJTej7KTPSv
         eo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKH73T8CoRDn773NUygCpVvIPtF8CVn6vI6nMM27j1I=;
        b=bDuFw9laJemdXTKvSpAWVmwE8FmFjJeHuY1+Ew2h2urz14ljGtGOos8cIL0uUyJXD1
         F7oQhgihG+HfLzVO20ty6sdaYym5OttSNuZMAPODp2jPqyWCpB2f0yN+GEz0fXpUGonq
         ZbGML5IgqBOfBqSTFfjcPbhV6a6xG2bGgh/jHXAY10qJL+bjdQ++L3s+iN1MLAri+CI7
         h1Ga4ZRw/yGtif5nk1QD8DQ2A5eys4lRF0j2uWMpQ7sBWlMedqhjbhdR/nm7hXstuLxP
         59Rq0gu9gkXKe+Ly0lKvFx6IL2k+rVSiPdyjLVCJFWrRoXE3TEpAXkdB7k0VdKF75WCa
         d1cA==
X-Gm-Message-State: AO0yUKXr8bZbrcNXGzRM1WI5h3XATVX2DfAW6+hgeyiFl3T6pjTKNE0D
	BRFaS34fY6XszKmscPQq/7J0Kg==
X-Google-Smtp-Source: AK7set8VKr93YhBGymtNxoDV9uf+fr5u7KtD7OV4RU+JGE5FxHGGg56i8sDAFXLY5R0goR0ryEeC4g==
X-Received: by 2002:a05:600c:5024:b0:3df:fcbd:3159 with SMTP id n36-20020a05600c502400b003dffcbd3159mr2107593wmr.3.1676475294684;
        Wed, 15 Feb 2023 07:34:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] accel/xen: Remove dead code
Date: Wed, 15 Feb 2023 16:34:51 +0100
Message-Id: <20230215153451.30626-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Unused since introduction in commit 04b0de0ee8
("xen: factor out common functions").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/xen/xen-all.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..c1b697a8bd 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -23,16 +23,6 @@
 #include "migration/global_state.h"
 #include "hw/boards.h"
 
-//#define DEBUG_XEN
-
-#ifdef DEBUG_XEN
-#define DPRINTF(fmt, ...) \
-    do { fprintf(stderr, "xen: " fmt, ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
-
 bool xen_allowed;
 
 xc_interface *xen_xc;
-- 
2.38.1


