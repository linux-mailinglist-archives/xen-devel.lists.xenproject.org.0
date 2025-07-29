Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A83B14A74
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062245.1427924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg4b-0007EC-9T; Tue, 29 Jul 2025 08:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062245.1427924; Tue, 29 Jul 2025 08:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg4b-0007Bc-4H; Tue, 29 Jul 2025 08:52:37 +0000
Received: by outflank-mailman (input) for mailman id 1062245;
 Tue, 29 Jul 2025 08:52:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R+Pi=2K=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ugg4Z-00075I-Ti
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:52:35 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e372bc4-6c59-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 10:52:33 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-55b733911b3so1040285e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:52:33 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63375ca4sm1584998e87.124.2025.07.29.01.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 01:52:32 -0700 (PDT)
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
X-Inumbo-ID: 5e372bc4-6c59-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753779153; x=1754383953; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSXErmgf4mUOU3w7XCCgpOwuZwNZDieNzbmZWIHlqM8=;
        b=FWpw/sNe1LUUND+8CKzzN7rP+oGFAmKVUYXAb8DTPkOFPktjEm0CiOXAu7sNNS9FNM
         uWpxY+8euK6jDT8fColMPtdYwa01DhtWQfv499eGWAO6JzDIiCbIXlJ2aMkfL5+SZXsm
         L+m9oSA8JJKtVpUIyu/Nut1VxNg7AyQ1bPd3p9+bMRAnd7zHtvP2bdvIDlRxY4f64MV2
         JUhOGxYhtav6kYIcxKUO6ZapKVrBARgQp6wsrQLr3PGupELqiE16O0KoZUd4GNuk1ndm
         C3ALBVxdDZOLSzAyhnhZtiVDaK7VzIblV5KsMaldpklG9Wy6wYOxl5K1dInZft1wdVVG
         hMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753779153; x=1754383953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSXErmgf4mUOU3w7XCCgpOwuZwNZDieNzbmZWIHlqM8=;
        b=np00Dg1AomeavtSO39xuLNR1SiEHB5h2jakJdPZhXvyBBIf+y+UShGf6sUICv8oPAz
         pUEbA3uiQ/Iz+DKnPd8I7cAmkD2NS6glyBzKcxI1C/A+ME8tNvT+wCLkT5V9+f27McqX
         mpGAWSRtKKeO6rQLtHEM8Fwpb6pIj0ykXeCLdvm6lWww8q6i0av4+I3uZF9ZHrXO2L2c
         Bd4UBiXPIFeMykKvgvJMzVJ7FOMpFoJNhFEDQt7CfVQsdsfba7ePpPYxsEljU/OZY3vI
         xXnqwdH6KcCoN9PPrzFByktKVrdlr76Jbz+B16/b2e7T+d03CVWiBBFUDA2zRrVArYFt
         elyQ==
X-Gm-Message-State: AOJu0YytyiTqu0cuUV/XPffKul2nyeyR+BJzPSSSUDzIzL0R1FY8J1rI
	ke0anQSovGu7E4pzyXtawNm1NvVNhuAlo6ODQJiSvpVlam8vxH68iJroJWeS7A==
X-Gm-Gg: ASbGncuhM45kc3xQ5C655sMTFToWv9jc0L8tSKpLGeMFW1UTjg7qm5ALmg9so5g+UR6
	l72M0RFMTgOxCbEdG3qqTrt4l7l2ADHqmhLM9JrLYZUBLOxoJgMsfpNFfEbkK766aXn8DlYdHBh
	FpHPRZZxXQ5/BCaRw2vn5t0QyU3RPtZFNGvWJTtIykpBmgLPdh5W6ktycRiUynnFMZlvijKztuR
	4q2ZM6ctfEESOZsBxizzivrJEWhIKlC2GZZ0vEE2lERSLgYHLEXrPW/GK4v13u7cxD3NlA9A9zg
	P/Pasb5LDC4oSSJnR5BXNO119wD3Dmhz7wCe87nNH9URvg41bbJchJtcviSuFDSmiBrIeu+tvEc
	b15QHctwj5Jrzrbf5s1uuJsYWWk4WG6dQzbQ7vAeU4pXE7+GWUvSUVnYlA9/n5A==
X-Google-Smtp-Source: AGHT+IF6w5gsunns7764OjENAOmyO5T/IsPbA7xb8k1thAzsi3X2jQ/bFGEcEysq2J003+/40r6OHg==
X-Received: by 2002:a05:6512:3ca1:b0:54f:bdfe:ece5 with SMTP id 2adb3069b0e04-55b5f3ec228mr4252695e87.14.1753779152948;
        Tue, 29 Jul 2025 01:52:32 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v7 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Tue, 29 Jul 2025 11:52:14 +0300
Message-ID: <09514e4eaf0ed23d890a864953bb1c87d2cce03d.1753778926.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1753778926.git.mykola_kvach@epam.com>
References: <cover.1753778926.git.mykola_kvach@epam.com>
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


