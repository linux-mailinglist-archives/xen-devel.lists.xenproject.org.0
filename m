Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8653CB1DD85
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 21:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073702.1436600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6TC-0004OR-PL; Thu, 07 Aug 2025 19:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073702.1436600; Thu, 07 Aug 2025 19:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6TC-0004K7-Jq; Thu, 07 Aug 2025 19:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1073702;
 Thu, 07 Aug 2025 19:40:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbW2=2T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uk6TB-0002bD-7u
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 19:40:09 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52b6b026-73c6-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 21:40:07 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-55b85413019so1642334e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 12:40:07 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bfc6sm2759188e87.10.2025.08.07.12.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 12:40:06 -0700 (PDT)
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
X-Inumbo-ID: 52b6b026-73c6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754595607; x=1755200407; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSXErmgf4mUOU3w7XCCgpOwuZwNZDieNzbmZWIHlqM8=;
        b=WCws9Aw1GRrs0fu7/k0RKxGywLWj/m7DWIFy0j2aj8+zfGG7Aa9kuXuOhb94UaqFXU
         WXzZbejTf6YX+KTz5KAKYNE752xAqBUiJ60EjYTErY6Capqd9Rx0/g+D9XGKhWfgR+X1
         AdvhnWyaJftPyw6JbftQXU4nMcklWBd4xkWMjoYCVZUgq2jQsF25AL7vOBzDIXqq+D+C
         Ew0j/m5/mXEig0bcQXKMLCeMLrtQxFGYyzGdOXaKyW+G66RbCL7QAhsxe+Wn14zbB/nc
         +U1lauJ4WOGgw4WBXR5y7wHFOJw+D1yu9ZJoZ4RF3bGDc30C8KLAPAZsd9aB5C/QsXF0
         nk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754595607; x=1755200407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSXErmgf4mUOU3w7XCCgpOwuZwNZDieNzbmZWIHlqM8=;
        b=UqJsiYvew5OJKEprt2YBnoapQ+idVpS56ecsfIQFf9ChSJ+8hnjHIvyLif0WTTfJYM
         uenAdghaWr1IB3JuZmPIvFsyey1j2znOXYuSkM0A3SCU45Ls8oZMgjbx00Zt7Up5ioY1
         E91vTYi34IEKo2B2Csmr30QdD1knIVLBAwmsXSya+S9w6kTIAaYB3SuNxviVbm5mzo2K
         rFW+GjcpDzdIspRzGixFjD+dGgzilAfeX5tgYyWW3iIyTBuL0D5YMJeyQbIl234pm9I3
         YbNCS/AZHtnu8xj4Fg/STbvWMItwTClKXwPKnaRLQXSv7KBnwcTKvkC1KyEpXXTmIxB/
         Hnzw==
X-Gm-Message-State: AOJu0YxN1tGMQoQtkNRmQdmmx6HN23pZAzb0NJrgyNktT0mWRgQl2yZ9
	pmZ6Xa+ATrIR1SaLOHI7xw4a7ITx5/ozoFnQ6pTNSZ+Rah+zs5RqILe8li9mNVbDXZA=
X-Gm-Gg: ASbGncvnSpQHpfJLQUqJWnPD+7YXRDMWffkvlgVvw0YRK9/kdZoFDM0WSON0kbZ1U8w
	thuP0kLVTrbxUWKE7LF7a1CowlId12yy45XeTxaozn27EZOBPPk2sQXOaDEEB9GgvE9ukB3eODF
	fRAWNlhm6xj7xkTPMNHQStmriDOCqwaa9zMi64iAC7Bh5ycTMiBwTfsV0SfH2YZQL2xH8g8BMgM
	WPKWT7j06zD/J2WS5e7b5F1kCuE/CRGeALGAIkIpZbG/HvzDu297toTyOyKIHMH8L2/sI08GpoY
	yIPWnfsmDkQca/YHI2FO5OgH+6uwb8mktaOyOGu5A73kSUHgeRQvo53AHz3HDD98MUwOs8hQy5U
	PUs9uhpFPA5tEuVeT+NjkniFDlfzuY6sl8VdCNp+FRINsNM89g5P1B9XrqTL4LHfc+rMKtb0b
X-Google-Smtp-Source: AGHT+IGDE2E2qVl2jQrOnsm1SnR2TTApnzMHmXoI/kJvn8kt3Qy7rwjRRTG+seAClqEkYdAQlbyXnQ==
X-Received: by 2002:a05:6512:3045:b0:55c:adae:37ce with SMTP id 2adb3069b0e04-55cc01251b8mr5296e87.47.1754595606911;
        Thu, 07 Aug 2025 12:40:06 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v8 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Thu,  7 Aug 2025 22:39:28 +0300
Message-ID: <f641421c7fd89ecad0800c197297f3dae07bcb55.1754595198.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754595198.git.mykola_kvach@epam.com>
References: <cover.1754595198.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Mention the newly added support for guest suspend and resume to/from
RAM via vPSCI on Arm platforms.

This support is limited to non-hardware domain guests.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Chnages in v6:
- removed reduntand explanation that thi support added for
  both arm32 and arm64.

Changes in v5:
- adjustments to the commit title and message
- expanded the changelog entry to include more context about
  suspend/resume support introduced in this patch series
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..7e42ca9b59 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -29,6 +29,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
  - On Arm:
     - Ability to enable stack protector
+    - Support for guest suspend and resume to/from RAM via vPSCI.
+      Applies only to non-hardware domain guests.
 
 ### Removed
  - On x86:
-- 
2.48.1


