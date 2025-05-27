Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6A4AC4B60
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 11:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998157.1378966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqTW-0003aH-OM; Tue, 27 May 2025 09:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998157.1378966; Tue, 27 May 2025 09:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqTW-0003XN-L6; Tue, 27 May 2025 09:19:58 +0000
Received: by outflank-mailman (input) for mailman id 998157;
 Tue, 27 May 2025 09:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdBa=YL=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uJqTV-0002b1-6B
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 09:19:57 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beaf89f8-3adb-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 11:19:52 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-551fb4d153dso3840975e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 02:19:55 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5521b9f9decsm1663715e87.157.2025.05.27.02.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 02:19:53 -0700 (PDT)
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
X-Inumbo-ID: beaf89f8-3adb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748337594; x=1748942394; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=py4ZIKoZa8cJlUFwF3FJvX8V7ahYkhYaZmzaoKgX5pA=;
        b=BgL8laUBS5eZFPFEsegtPdXpTZpYDQepkm8nFMPnlhohx5+IfpjY8zEmZuCexAdRio
         ioPjKNqkd/THiXmqgkdbroPmcjAAtWvkH8uJl+zreTgg0uc0+ixAe/Chv+OhtlqV+QZX
         pFN1M7np12lh15gRB2xULuraypG2FnaV7iV0KJ5CEMhRh/+TMlH+m9VwpAIpaD9LRcy3
         WI+7rcCS846pMxtdJZzpg38PT1O2nb0fb+wCvsmzblMC2+SPrqZeibvZcEz6u3SgWOv8
         /Hiw8YznABNmAJzB1Rpz1IyYpeHxaJCNYeMjposwZOcv2/j8nEl91NaF8Aa5ldh85Hrw
         v12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748337594; x=1748942394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=py4ZIKoZa8cJlUFwF3FJvX8V7ahYkhYaZmzaoKgX5pA=;
        b=QG6faCXi8zeaeE172SBwkC+cNlkHXpWHuw4NCOvr0mGLfJw0vSmHCSfqhDSZzV4rgj
         mFvQHEEDN6SxyKrvhiEooRkZok+3v91vVBp6nTv8AgqEKBK9zFRaxDSVy03teidfL1g2
         Jutmtm5QUTxPB66IRwKS1b7z/ETXu9a467bL1zrCHGaPMgpJb+Seym+n64Mxw8TWljrG
         NTiRGDjndcXCEegROdjgSgQZUjzdTlCkadyF49j8V8iCbucmBucWsgGalGzxAYbc2mym
         idPhymN8RckYDRKeylxHOxcvYQg4MKBUZvFn3mxNAtr7TTRl+srbe62RvXmfLJhIIi6Z
         ts/Q==
X-Gm-Message-State: AOJu0YyvW54dnChcYvKt3ZtyGNDqfIYWHMtbZ3OtyH/eYLZZ+pE/MEr5
	85RrcAjNoLmzdnBjU7TPlcyqT6IFFHeTrFLD3ytxOE1EQSTl6ahmq2BWjlmRlQ==
X-Gm-Gg: ASbGncszlRBMgZUsMnWVUQTYGoc4iRrDUFH9PuLNYbDGVPB+IjrpPUSDai76Kj5Huxq
	p9ArRcon5sID4oowC5QhjTxB727AFbCrJ9mU5Ho1Yt49OCcMB5QXTRtoudm0StVhPa0flgkN8l6
	ASsSECmd7USSOaTWUNSnpFU3DdQ4wINS5Kd9P1DUUIIpsEgHZKKw+pCmxIAqzRBgjHiWySbYA5Z
	z2XGRSRfDCZPaA8fNd1T0G3yKoXhsoUBmSD+e4Df2EGvFxHsjWWv+PlGYYZMQ4dbh8N4G8KV/pa
	EVy0CdD3Dv7v6c583oTQpUqGpAqNfgnNmf32VlBMUnrz3dd/fJd5XH39gViYw68pUg5tE7OKdPZ
	tDyj8WIYGT068cjU=
X-Google-Smtp-Source: AGHT+IGkPlHMkXyFexySvAYIMb1Jy40xU2JqZkz3BSDBtk9BTrQvCDz9C+w87HzDsLV4wiJpogetgw==
X-Received: by 2002:a05:6512:158d:b0:54f:c186:ecf7 with SMTP id 2adb3069b0e04-5521cbafde3mr2926091e87.57.1748337594304;
        Tue, 27 May 2025 02:19:54 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v4][PART 1 4/4] CHANGELOG: Mention Xen suspend/resume to RAM feature on arm64
Date: Tue, 27 May 2025 12:18:57 +0300
Message-ID: <1035d97375bad4b3e6f86e78cbe4e46abdbc2de9.1748337249.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748337249.git.mykola_kvach@epam.com>
References: <cover.1748337249.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ec452027f5..fc89ed6e09 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -26,6 +26,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
  - On Arm:
     - Ability to enable stack protector
+    - Support guest suspend/resume to/from RAM
 
 ### Removed
  - On x86:
-- 
2.48.1


