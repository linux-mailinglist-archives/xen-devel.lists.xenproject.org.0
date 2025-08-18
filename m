Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DD3B29CB3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085666.1443995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvZ9-0006kF-5v; Mon, 18 Aug 2025 08:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085666.1443995; Mon, 18 Aug 2025 08:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvZ8-0006Wr-SF; Mon, 18 Aug 2025 08:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1085666;
 Mon, 18 Aug 2025 08:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFvU=26=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1unvZ7-0005Kq-25
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:50:05 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55874cc0-7c10-11f0-a329-13f23c93f187;
 Mon, 18 Aug 2025 10:50:04 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55ce5097638so3957479e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:50:04 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351579sm1571950e87.4.2025.08.18.01.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 01:50:02 -0700 (PDT)
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
X-Inumbo-ID: 55874cc0-7c10-11f0-a329-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755507004; x=1756111804; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSXErmgf4mUOU3w7XCCgpOwuZwNZDieNzbmZWIHlqM8=;
        b=cApIkXbkekwT+fQsI6J91RxvVSmbMPbjVhEaDgVM9FZjb80rfjNZHMGeYSFYajE1RP
         HWrp6mxPgvfXQ6zpE8xHrRQQMo+qYMYul3yoa1kzOdH69wsotNZ/h5C5qn6yF2cHl0Go
         gEyP2xYUte2JW98LGeJLcAmaEByjpqAw3evWy3wbKip8/ySqOv0r6LKLwwd4pg2lGUSU
         npBQSK/sTO/zgAPbotHUNq7o+x58sgyMXFLS/r68i89Yy4XQavJi82sEIY/aKNBJS3VT
         GdNVfj3ZtYgL/ws5jAXLZ0HA5RLc7/uXq9Q5b7NTrYcMfxnjg0pFfE4LbKllv9vyNZE9
         FcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507004; x=1756111804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSXErmgf4mUOU3w7XCCgpOwuZwNZDieNzbmZWIHlqM8=;
        b=oK5yDPN55/31v5bVMrSDeI6Kej9vUvg/r3uB3wV/lbmzPWyC/9pfsV5w68UGdlQMeU
         1TF7uIKFAkqgn2Bv30FCRPlDhzXwlAYwg9nmKsJD3YCEjyihLwYAZysESEJ7JRg+svQ0
         CE2nbct0PJ2yKXm0IixQb77+ylWH1S9zaZJz0QdD701JhJHqQNG7UH5nxsnki968kDV4
         /iTS6QMLG8CY9SmlAvB41Cbas1n4Hyl45OE21SQD13ArQqFLkZtPqOTXMH0s34UUvpib
         f9KUt3Avf3ySbz6w+8dBRCncsN6OV+gamLMjRuDPq44hlzobFdVsMOUwnnfMD2KnAtLn
         hFhQ==
X-Gm-Message-State: AOJu0YzrHGB0YQ1qVR7I+yRd+BcYxcDkLUgHvsVGyCQpk/v2pW5x0YiO
	79M8fIOYFlU3qs6QIpQwh+rZOT+kObHoCNTN75kJBn0fMSVdJO3jr/Yn9qTsgA==
X-Gm-Gg: ASbGnctksdLXiFZPBlbMbIsPQylzKZlacTHvUVLFLYr46eOCdjg2BEI48RpNnfxMwk2
	J0IU8LiDrs8BIDnzdust04DdcbWIcyYh1eObGKh4cdz7Dw41/j7zO59n6Ii4KEQR5V98gEUnZnp
	EGXqStUJYPgKTeamlHgoBS3kvU9x7DyRb+adMp+A/m3zI7ShbVZcfNdlThB8fgjazntqYBTSzeR
	X71rT4fIu04ITuVBIODiL+vXkNvEZbOaI9GTPwDfRujMlLbhc5IZfGYsyr53qInDADLOFTdl+Wl
	dEajyr67lLhzAduVtxFtK4gclmWWY/qVab0UQ0J6lWk7jgqTvY6UWAFCmRcskH2Vfq32PM2zLqT
	r+YpRAJ/gDc/ICNTAWIHKSG25aXMPR1pLV5zRydhEfdRq5voz+RFDZCT7wlJLcg==
X-Google-Smtp-Source: AGHT+IHKP+vZ17DE5QYKRCnOIQOuto1ryTkPgpZmhlycbfPLB2vOYZ1r/2ziLH95IBblJQgzQ9+81g==
X-Received: by 2002:a05:6512:1054:b0:55c:e752:e9c8 with SMTP id 2adb3069b0e04-55ceeb5aaa4mr3539987e87.44.1755507003551;
        Mon, 18 Aug 2025 01:50:03 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v9 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Mon, 18 Aug 2025 11:49:27 +0300
Message-ID: <5d570383467445e4c89347d1cab7f4a3f062e740.1755506449.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1755506449.git.mykola_kvach@epam.com>
References: <cover.1755506449.git.mykola_kvach@epam.com>
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


