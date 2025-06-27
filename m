Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC68EAEB569
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 12:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027507.1402128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV6gR-0002wL-Ur; Fri, 27 Jun 2025 10:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027507.1402128; Fri, 27 Jun 2025 10:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV6gR-0002rw-ON; Fri, 27 Jun 2025 10:51:51 +0000
Received: by outflank-mailman (input) for mailman id 1027507;
 Fri, 27 Jun 2025 10:51:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61Re=ZK=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uV6gQ-0002k0-Nn
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 10:51:50 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba91903d-5344-11f0-a30f-13f23c93f187;
 Fri, 27 Jun 2025 12:51:50 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-32cd0dfbd66so15789881fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 03:51:50 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32cd2dea1c0sm5235831fa.3.2025.06.27.03.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 03:51:48 -0700 (PDT)
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
X-Inumbo-ID: ba91903d-5344-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751021510; x=1751626310; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ua935WurpFjU8q1PTBY29dqBWcHnlgrzlb/sVrXtOkY=;
        b=dWNiCKvTMyhgIWmQtW2A7yCBL61UgFyMf3Lf/PqtzzTa3kKw4Zl4gnjMGySMiHoDCJ
         Lqhz0BzLApGUZCmEt8+GlPWgJTzyVkS5yB5pldk88jPA7dJAPIi0ULgur/PP8DifG+SB
         Z21WKrQBYsrjaXLqJ3D17bIKpgQW+T7rXooxIv0LWxC3xb2DC2kOC7/X3XFYz5Hm2kzP
         QGDRfvv/YS1EPXyojlmIJRZ9UEi45W/RLCtStyg7nvPTNyU+9bziK2PjipfuNpUKr+k/
         lMF2CA3OmxbqdID4k74alTOWjxxTezXtPjVTSu1N9TXVN24pSMUsqcNeFlulhHleZoqF
         VvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021510; x=1751626310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ua935WurpFjU8q1PTBY29dqBWcHnlgrzlb/sVrXtOkY=;
        b=rn81Dh6Xb0I3vA5JatHkTQdeJqpu5RUvU0jQlXOqnk03Hpq+aRJ87xZvqWybdzcw17
         9tR5XpG/ht+hn8Cnp9uJpPrHaSUalvIntztCtaVsIQE+MoCLPxIcLOObjdVdg6SRe9zY
         FLuDIkkPVvXLZN/3PnbpOBsdRP9uMOAVMmaF7jlK6SYstIodyGdI5YJ1e5/UxNbCPdho
         5LQGMUx6Kq+bEiA0snZhBKXYMtMtII6UxLspxY0nUdV9i9+Y3mjK4KP43nX4aCf1VR1x
         elenl0BFEqNtPMTMkTDXeMP8+Hm9ZjRjthYcq+NBO5GDM8aKLtRX2R5OpPsA2EJS5aNx
         M5qQ==
X-Gm-Message-State: AOJu0Yy1152l1LYSAdgo2WDFSIbyguPg4ZfQCJro9PK7F/5xaoXV6Sla
	7xZlsq67YKAMi9eLisjfNowIv3XRim4MIfOf+XFDgJlpiuQbKcXcavGTLsxrgewP
X-Gm-Gg: ASbGnctjObi7X5m872tNCz2ABUgaMlnltDFkppKr1Fvl7zx3lMNbiOn6VNQU6ZQ4/73
	2WoVNGMIUH6BwcMCPeryGoXyuR/uCzTF1M81VucJH0cCg/6Idt2C9HmLvsFmNjSYEG4f5/5R6Kj
	Er95OBnnUCNBW1ujoWENsbhIPifaI84icrBlGPY1wrgAWP6a/VQ0aOzJ781uSibT7zHF7fdFsRr
	nztE7zucghLk76xSizFVFFggbuOLjWaCR08yV/gkJgYtMbtfucKm1cEF6IotOypC/a/Wav1oJKr
	3EpZVNeSCj9xyPznfgnWMVdJvzpg2OEr10wsCc4BBfcmnh4c51CW5Lkz6LXKWb76QXEVxEXC6TY
	UWQ/+Eh7Ba8O7k+1ZVNW47K2Ifw==
X-Google-Smtp-Source: AGHT+IHFzWIUYlNlURrIMGK10ZsPPhDfk4HecC4VKN8XchkntZcY1UnimoehDaDa5ihpFEQInWjhXw==
X-Received: by 2002:a05:651c:2041:b0:32a:6b23:d3cc with SMTP id 38308e7fff4ca-32cdc518517mr6690531fa.25.1751021509431;
        Fri, 27 Jun 2025 03:51:49 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v5 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Fri, 27 Jun 2025 13:51:33 +0300
Message-ID: <d2d780b307d096b3ce157f8ef3f151b86727ea99.1751020456.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1751020456.git.mykola_kvach@epam.com>
References: <cover.1751020456.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Mention the newly added support for guest suspend and resume to/from
RAM via vPSCI on Arm platforms (ARM32 and ARM64). This support is
limited to non-hardware domain guests.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v5:
- adjustments to the commit title and message
- expanded the changelog entry to include more context about
  suspend/resume support introduced in this patch series
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..1c155f7ff2 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -29,6 +29,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
  - On Arm:
     - Ability to enable stack protector
+    - Support for guest suspend and resume to/from RAM via vPSCI (for both ARM32
+      and ARM64). Applies only to non-hardware domain guests.
 
 ### Removed
  - On x86:
-- 
2.48.1


