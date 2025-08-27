Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A9B38B49
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 23:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096967.1451509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNc6-0004Qw-It; Wed, 27 Aug 2025 21:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096967.1451509; Wed, 27 Aug 2025 21:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNc6-0004Nz-FU; Wed, 27 Aug 2025 21:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1096967;
 Wed, 27 Aug 2025 21:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4G5n=3H=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1urNc5-0003ij-3G
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 21:23:25 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10759a94-838c-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 23:23:24 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-3366f66a04cso2229151fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 14:23:24 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e2687acsm29844061fa.32.2025.08.27.14.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 14:23:22 -0700 (PDT)
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
X-Inumbo-ID: 10759a94-838c-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756329803; x=1756934603; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe9xi3DaBptNnLW1VEAJiUhAp27nm19FtXNKIdaX+1M=;
        b=CkK+ookKHusTaQJT/GyZYa/4b3OiDXf+xjU9847p4+pa6JHPbyYUZ2SFC4xpZvNUNd
         QgCsnrZ63nbgBtq42aAs3FveN+vWiq3OJVjbGncdqzeCJzbvOVDYnHGRHz82xu36MtWY
         WDxTP+JkI9MDi/Q4aYDD2BL2CmtO1X6azARkg0NUaaU1rI4bDA/svBaOjaN1LLdj6PDU
         rTauDmiwOmNzXhC1Y/2Y3Euqqc1VHkuZ+bYof7dB7ITzIT4hviYk8X0JIoU9OfFOJ11b
         4I6MIVjCgrQOsBU+RtoK4LOjPH6lbohPbTbwS61Zvtoq38FQo8CVPqLYQM3x+D7vYvbl
         FZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756329803; x=1756934603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xe9xi3DaBptNnLW1VEAJiUhAp27nm19FtXNKIdaX+1M=;
        b=ZDMpAUDERFjy7+O4wK1xdI7yM829sgYz0uK12bQEuUjO94Xj5fnWXggJTO371pc0+U
         zl+Wev9ZLbMZp1w5CwzfBX82QBgq+741vhZFXqguB7kNmSaYVNy43tow8TfPjZ6sYAv5
         i0LNiZuPnbJtpOfHU8R4VL2swuth6LMptJsSbklrHiugLq0/UV06PzemwuRVixyHYVzc
         y2N4lAeFcQAIszO8+S9B5/bj+abhrXiXhi4lALHn8tKHpjfTAw3fuPQaecavz4um6QE8
         A1qX9IzRn2SqFdnJgeqkqYekxakWrjOVEYrRl9nQg3Ng1GAPWVzZjELj0Wbpiqc4HD3Y
         D+pw==
X-Gm-Message-State: AOJu0YzXquKLmjjg3YueBDZ8s/+qGYJ9iYsAqLDCTWy3T1JKMmIGcQG1
	+V5HPag40RkngBVahTM2bidhdfw0+5tR8TStfBvs7/7jK83Bqd9AoIhbAEXiOQ==
X-Gm-Gg: ASbGncuEKBZGbU4tBntIfUBdYUo6ZLhJpaNwGT0oLDp6GrbER3j7wZWy5ATeFHHhI1k
	H7EzSnqkVck6qR2YGm7WmvawpcpFsD4zwzTVVTb99Zga1AG6LyXf8mbjZ8KBDxbjM0rNvLecfzK
	zhAAjsqE0BJGKxit71GNWIrJbBbF+csOQUE/Pf1wXAm9iawZLAtE0p9/Uf5UTIn1vPQPTUUOr+3
	UW/PP/mbmHYFBJVQdkj2R+OZCcDa0s2TTmJLbX2FkcpUXzyQjTm5U/JSCUUHoMNDdga44R9+fYC
	lff05GI9XFddkbCL0etVEV9SIbEUhC0Z9bpod7839ECgl+yQYiuqTOoSM5ycO5hQJ7v+1G8Z7re
	sgXOR3dnAiFNMJcb5XFSg+BLWmD4Oz2fd+TK4OkEEM4BSX5mNW+EvzC60fIFNcywA9fpBaqKZ
X-Google-Smtp-Source: AGHT+IE2thsK8SJkpSBPfg+A9AQiZi8tBzk4Te3IKcIhzllL4RZ6lXCnGzo81fwP0ZI4FULSTsc/+g==
X-Received: by 2002:a2e:a556:0:b0:336:8b8e:cc54 with SMTP id 38308e7fff4ca-3368b8ee2e8mr15309371fa.8.1756329802974;
        Wed, 27 Aug 2025 14:23:22 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Thu, 28 Aug 2025 00:21:35 +0300
Message-ID: <ec71b1dbb766f2d0a87e3b9523b6a1cf869820f3.1756329091.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756329091.git.mykola_kvach@epam.com>
References: <cover.1756329091.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under the "Virtual Hardware, QEMU" section documenting
support for the optional PSCI SYSTEM_SUSPEND function exposed to guests.

This function is available via the virtual PSCI (vPSCI) interface and
allows guest domains (domUs) to initiate system suspend operations.

The feature is currently marked as "Tech Preview".

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V10:
- Status of vPSCI SYSTEM_SUSPEND changed from "Experimental" to
  "Tech Preview"

Changes in v6:
- Dropped the generic guest PSCI support entry (merged in a separate patch)
- This patch now documents only the SYSTEM_SUSPEND optional function
- Reworded commit message to match the final form after rebase

Changes in v5:
- Dropped ARM/PSCI entry: this refers to internal use of PSCI SMC calls,
  which is not relevant for SUPPORT.md
- Added a dedicated entry for PSCI SYSTEM_SUSPEND instead of generic guest
  PSCI info; guest PSCI support was documented in a separate patch
---
 SUPPORT.md | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 6a82a92189..0ce0903cb1 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We support all mandatory
 functions of PSCI 1.1. See below for the list of optional PSCI call
 implemented and their status.
 
-   Status, Mandatory: Supported
-   Status, MIGRATE_INFO_TYPE: Supported
+    Status, Mandatory: Supported
+    Status, MIGRATE_INFO_TYPE: Supported
+    Status, SYSTEM_SUSPEND: Tech Preview
 
 ## Virtual Hardware, QEMU
 
-- 
2.48.1


