Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B09C08C3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 15:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831848.1247228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93OE-0006kF-2y; Thu, 07 Nov 2024 14:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831848.1247228; Thu, 07 Nov 2024 14:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93OE-0006iS-01; Thu, 07 Nov 2024 14:21:38 +0000
Received: by outflank-mailman (input) for mailman id 831848;
 Thu, 07 Nov 2024 14:21:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Tfg=SC=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1t93OC-0006EJ-7H
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 14:21:36 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9688dcd6-9d13-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 15:21:32 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9a0c7abaa6so113669566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 06:21:32 -0800 (PST)
Received: from mbarnes-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc4c60sm101118366b.102.2024.11.07.06.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 06:21:31 -0800 (PST)
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
X-Inumbo-ID: 9688dcd6-9d13-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk2ODhkY2Q2LTlkMTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTg5MjkyLjkzNzU1LCJzZW5kZXIiOiJtYXR0aGV3LmJhcm5lc0BjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730989292; x=1731594092; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rA1pIqBmQIVPWtjPV0G5LDbyMaZKrsqGTVi3yIVl/FQ=;
        b=L3BKMDDi/ShKTPofJ1TOrL9PC98mkt22QUBLdPKOVDZjGGcyj2Cu2Dz2lfNyX+vCQq
         rgEOMyJiS6hTc6vrV1crk2qdSBsIfMMRZhQ9YJYYbg0sxVhflE3mvpX9FDTc9wvRk3yN
         Y4IT4/nNJfk/iLUOvscH7gZ++7jesEdGaEzwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730989292; x=1731594092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rA1pIqBmQIVPWtjPV0G5LDbyMaZKrsqGTVi3yIVl/FQ=;
        b=ZptX5dgK9CgNOwCFxoF0ZS9C0kIOodAsyKbeR69nyTmO1H/AZZIWU0t31Z6NaRQ7ay
         O1OezQzv66Od+Lz+addwfdL1/xbb/SQh+TWah4tgeaxVW86R9iB7DsAb/iJU23rWyOsf
         5v+Kr2iE49n4cDzEOEyTMyV1axU1ezqHDALOufd1a0qa0f7Ry0a0dgFv2ahPM7APGWwq
         tY2kiyndPvilbzm0l2BeTwTZ1SMhb73C6o2/1zxh+rFkOv3V9HRS/cPlEac+RGYUhtQQ
         fpJJHqxlR8a0OiYos3spCBcQ/L8ALrRBVxfFEAT3gHHfUy/BxzV87XUq8sYlldOYr9s6
         5tow==
X-Gm-Message-State: AOJu0YxFuqQSnmKYyur3YZ+6mjU094aC1qUUHdqxytF84xQv8632NP0w
	diyq277u3LaKtVJ6AqPjH6PGXalj4T+WYRAo/uBItswp01xElSt7X7QjkwWdhAxEibxhpXkdW+N
	X
X-Google-Smtp-Source: AGHT+IFDnjiLUO0ISlQw65xJE+VgtU11b41sNeLIhrHwi2grcI2OUTTMJ1UZTOKs/f+8bVXNJB01tw==
X-Received: by 2002:a17:907:2d91:b0:a9a:80cc:c972 with SMTP id a640c23a62f3a-a9e655a8980mr2338718766b.27.1730989292138;
        Thu, 07 Nov 2024 06:21:32 -0800 (PST)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2] CHANGELOG: Add note about xAPIC destination mode change
Date: Thu,  7 Nov 2024 14:08:31 +0000
Message-Id: <f7e299a8c1af7c5875e07f80b0229b1cd322a5f6.1730987624.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
Changes in v2:
- Move notes from "Removed" to "Changed" section
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 674944cbe4fb..8553b2e4516e 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Fixed blkif protocol specification for sector sizes different than 512b.
  - On x86:
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
+   - Switched the xAPIC flat driver to use physical destination mode for external
+     interrupts instead of logical destination mode.
 
 ### Added
  - On Arm:
-- 
2.46.0


