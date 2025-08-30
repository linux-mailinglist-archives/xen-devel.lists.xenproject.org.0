Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48592B3CFC5
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 00:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103293.1455118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usTni-0004zA-3a; Sat, 30 Aug 2025 22:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103293.1455118; Sat, 30 Aug 2025 22:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usTnh-0004vN-VV; Sat, 30 Aug 2025 22:11:57 +0000
Received: by outflank-mailman (input) for mailman id 1103293;
 Sat, 30 Aug 2025 22:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IC44=3K=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1usTnf-0004DJ-Gf
 for xen-devel@lists.xenproject.org; Sat, 30 Aug 2025 22:11:55 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56930289-85ee-11f0-8adc-4578a1afcccb;
 Sun, 31 Aug 2025 00:11:55 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-336c2194a65so9280011fa.2
 for <xen-devel@lists.xenproject.org>; Sat, 30 Aug 2025 15:11:55 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336d0e3f39dsm4662091fa.45.2025.08.30.15.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 15:11:53 -0700 (PDT)
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
X-Inumbo-ID: 56930289-85ee-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756591914; x=1757196714; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hngrpYued6VRjNdXSCXsejFnZ9+NvVTFmNBYrfCV2Ms=;
        b=Z2za9fsXrYVocA703yZvOUNk+Qc+vRzf2hwV18RDCsjU/OaDze3wChim4a6xviBHXc
         o0IkWVGCjWTlyyt5IhZbpXd97uQVKcVe7+N9rjNon2oQhKLLe1UX2rAd61UcEWyjGSYl
         KYvXzy9Obxr239cZh8duIMii8bkXe5tzgw0U0WKknOnkjghgwS0ERMaatjpwhIWcCw8x
         xzYeEUK7ASMBKIFHawneBVLRCZih0A7iHm5c17JFFUZLCoB7gN3O7hEJhA+4k7kIEGEE
         5XGTnvAM/tQCd6jGizYiV5aGzDV6vmg3bNakhZWuMEaesdmH1QNWa3uwA5OhhW/ERmro
         GaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756591914; x=1757196714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hngrpYued6VRjNdXSCXsejFnZ9+NvVTFmNBYrfCV2Ms=;
        b=hrOKPIQp363IKEe6XMfHkvG3EYrGZhZ0jkCzTDxuG5xxegPUzpU/6wN2UKVZoLK6uX
         n/3ghaKKsiasZJHhV3w1ATOUdtjxw/ZVm2vZ1IQpyh/186uuwBzEuO5DLxpjBtZ2ThwN
         Ya6I/31XspeeixveZ7ALtw6hk+mBNKTyB1qkCybNJKUvVzgl/IwSNZxubI7oSVlE35HU
         bM/jtAbjMu1eWczbSVViP1zIIe11aHl0ve5sBbuhO+1nVoDralzGXALhwa4d9EEXMEdJ
         fUJy8LqAhoYYYbAQjx6cbU9MZFHZUxy371YcIkurLKGlnvDO9JQf6qBglVh2Ye0Hs8wl
         X0+Q==
X-Gm-Message-State: AOJu0YzoaU/oRHEH4ep0u65heVCpbLXzDr/GQ7NQ6BMfEWaBCY/SIdPe
	rclY7oHYKgadZkn9qZiMpkr5qF4ItEs41L9HmEoiaiAEjTFTPfh/2zYHxaYhmsfq
X-Gm-Gg: ASbGncu07Bx9RUOU+WjsckdF/GHTf+PoCr/xLmNOHw0fr+6w8tNVmz8ZaarCNqxBy/U
	P5bTkOLk1SohDm5IfKN+hsWOHtX7wGmCddFiIMguQvATAbE8jZPD6Jmbp1lCFiSKOb1eaQbg21c
	jRX04UJGF7A3AFP4tH14+jl/TMm7PdAN00O5gIqit/dKpaCwJd9lexYxM0Bbcs1pbcTtC+Nrp5M
	NuIZ8FtdfNx1Aht1B3gshAyVAvRiz9nf8of9U/AyvnIawZIcxZZ2PVrHivlQfLFzUk5rBa5+znp
	JtHHnZpm4UqNIiif1bMMPbu/B+zsAdxRsgwvlDT+8yItDgJ1S5w4LBSzEa1LZomUCMeaQ+LA9OA
	t6Vk/Gz8d3kxSZbYLN6c4/SKXb0uxrIPFqNDZ5mJO1Fe8Bv/DIuUZ+FI/MZHtguv4uP8IBi7i
X-Google-Smtp-Source: AGHT+IF6W/eY1aZ8zkzvkW2vlkataEeADD5F2FfeHBuBv7qGYmwoOgtnCCNrekWZejYNTvmtjdjxfw==
X-Received: by 2002:a2e:be12:0:b0:336:dd19:7653 with SMTP id 38308e7fff4ca-336dd197c03mr156741fa.25.1756591913943;
        Sat, 30 Aug 2025 15:11:53 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v12 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Sun, 31 Aug 2025 01:10:31 +0300
Message-ID: <dab2be659270fdee7e3da9b83eeee17494542b9e.1756586648.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756586648.git.mykola_kvach@epam.com>
References: <cover.1756586648.git.mykola_kvach@epam.com>
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
index cd34ea87b8..7a75bd37cb 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -36,6 +36,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
  - On Arm:
     - Ability to enable stack protector
+    - Support for guest suspend and resume to/from RAM via vPSCI.
+      Applies only to non-hardware domain guests.
 
 ### Removed
  - On x86:
-- 
2.48.1


