Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE492B106A8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055533.1423918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesSf-0008TF-7O; Thu, 24 Jul 2025 09:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055533.1423918; Thu, 24 Jul 2025 09:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesSf-0008Lh-10; Thu, 24 Jul 2025 09:42:01 +0000
Received: by outflank-mailman (input) for mailman id 1055533;
 Thu, 24 Jul 2025 09:42:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t79f=2F=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uesSd-00084c-U7
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:41:59 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 717d0fc4-6872-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 11:41:58 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-32b7f41d3e6so9738261fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 02:41:58 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331e08e98aesm2418261fa.54.2025.07.24.02.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 02:41:57 -0700 (PDT)
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
X-Inumbo-ID: 717d0fc4-6872-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753350118; x=1753954918; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSXErmgf4mUOU3w7XCCgpOwuZwNZDieNzbmZWIHlqM8=;
        b=ee5wOzpbqd4cyv7cB/RcAxOInfen4reWCWp1bimjDL3yRRRc29Dh9KZZvCr6Wj9/yV
         6k4Yiu49pNR9TQmbkeC4TLWELZVwUsvcpMdiAYsHuQWtRoDfFtJK/7uZDtxE6a6qAzAY
         De6SOmnc+MbOADs2szSI+wOuQObJ892xy0IKTeSaLahgfreUbVVTwpLH0BxYQaCl8Q3W
         WB24hK8/U3bQxSk3jm3Aa+aHLq2cpR92wOY7K+7GT1/2QLOsaO0Ch6j/ckwYR19+iZMI
         S5KcN6xxtk+dfuzpuRRRvnnK+/WwsI8jI4rN7qiRQAoFgk6Dc2ZSm7MdzJe07f3TxdDq
         dCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350118; x=1753954918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSXErmgf4mUOU3w7XCCgpOwuZwNZDieNzbmZWIHlqM8=;
        b=P1B4ZDJrxyBKKSvI+H1rL3yGHAtfdQRnuH/Lmz4tcPjASDPY0BoO9yGxAhFZAlXL9d
         Ape9/ad+b1SxALHngCsn1+qzJ/vG+tzITans9W4ennLpiVWjXOknEK08QiKpIdKzTJ0H
         DitVTmJsXQVN6hqaUCipfpUg5bAqbJcZ0+us1l0GLaojRPvymMzbVn0RCLp3tdKwzKa2
         XYnRPrLCGfNQoK3xf9n7l8uWVLVgfnWVZ+x6kRIL9lV8/MVZz6mkaxydjkCkODN/wvZw
         UeuSc1KSI0WITecRYjZc7U6vcJqRNthj4ROK4fXaW7OPB9MdDfRD4XSLtRHYjxGltHj0
         SJnA==
X-Gm-Message-State: AOJu0YyHDOrM+OT4rl2AJX6n3oUw+vCHZxUV53Yav8mlHkhAwkMdPGWS
	jHT9RUlsFjPdX/1Ol0kuN8sEtFZLUeSNitz05F4YMDjclJ7zsA8YX/C4RTHALg==
X-Gm-Gg: ASbGnctj+K/9yCL7ncm4U3eJsytLQ9S/cCAkerFH5EZb+BziqsOQYqAHpnjEgAczI82
	GmCmzOtJiMX6MSH2JfbQrZJdIpch/9I8g7gSxlF1zswjqbSTaK01oGMRWtXMuwqi7QeiUnnwkh7
	QaV64uuR1FtYRR23urKl20Cq1yWVBkKrctsSXmEBjJ8VNqMpgVuQuBkMaO1KEAZygohX5kaqNtV
	GzsYscedKrcZ5zmbRCnJY4HZ3InbZ4hEuuZnjYdbeespxAbOe3aDdf3jqz1pgZ+D93HPa1FwZ5E
	H3dO5eRuZqCYC4/j+nUI1TOiut/FwHoamAQuWhC971Wo7GrBWUG0Ei3KlvUlRSKG4AdUPWUMqyU
	rAsGcn7lXk3WhHNVfcTGc4KGi4nqTizdGxW/CEjUVuKpPues8En5A3kO8XIfraHhqam3/lPRQ
X-Google-Smtp-Source: AGHT+IGiiF+rKwojBE1+cwq793sp9I8CMc9a4c4ASsbV2ny1yE0G4d4KGIdhd7UXtIqriz/RZGLAzg==
X-Received: by 2002:a2e:b4a9:0:b0:32c:a097:414c with SMTP id 38308e7fff4ca-331e253ba50mr2587121fa.11.1753350117903;
        Thu, 24 Jul 2025 02:41:57 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v6 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Thu, 24 Jul 2025 12:40:59 +0300
Message-ID: <87a75d83f2b6f6701e28c935856f0f7b1dad05bd.1753349109.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1753349108.git.mykola_kvach@epam.com>
References: <cover.1753349108.git.mykola_kvach@epam.com>
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


