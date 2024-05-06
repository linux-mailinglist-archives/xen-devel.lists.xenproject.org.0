Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776488BCBC5
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717444.1119766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNt-0005YE-7c; Mon, 06 May 2024 10:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717444.1119766; Mon, 06 May 2024 10:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNs-0005Ln-9U; Mon, 06 May 2024 10:15:48 +0000
Received: by outflank-mailman (input) for mailman id 717444;
 Mon, 06 May 2024 10:15:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNp-0001n2-HI
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:45 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 990e55ba-0b91-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 12:15:43 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2e1fa1f1d9bso33040831fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:44 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:42 -0700 (PDT)
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
X-Inumbo-ID: 990e55ba-0b91-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990543; x=1715595343; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGf7j+VFITNzuSDPQfzUoszvG5jtrP41Tc7vySyHgmQ=;
        b=EO5HQWFRSu15BMkt3HHRKJpyXjfLubCr5uhoRzzmlTMtm9rX2UEETm0uLVTSGxPBbk
         wvrSM5NxBTd8CcnSvwwmeM5jFTnsvvdY0QKLzgFDrvueYYpONsj118rYakQM6laBXG2v
         jtpdQVL3QWXyuaN1o0v37p94q8btB2vzeajl1Cl/0y18y7DLTmufTSicHYJtXpPWXdCT
         KNzHUC8yyiM3VXxyrs4LsjRIYRxyz/C07fX3BnI8+dpG/NIN3tdmQMf5acqjk5BRdVKG
         lRH1o7yWobdPlj8wmXfqzdXLYTyNbgodz6nZoRkOL2/pZ24LfnQ3pQSpcZFrmK3t71Vx
         P4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990543; x=1715595343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGf7j+VFITNzuSDPQfzUoszvG5jtrP41Tc7vySyHgmQ=;
        b=E5OVDVmZL6bDbZo2/B5qUJEPXuern3dLRqav9JLnU/LLc8SwkCyZLf0znTAiiqxcE9
         GTZiEWiXjTsy+Cd4YXNzG9QWjiy/0xvYUeamjXO4xh42fO/tllEI5NfMZeBvbyuxyczn
         CDsa5H30Rqgh3zTq8OapEer1EvZop/V9lRiV2hoIjIjGhiQhW+dGPyjE0/2wnX0JUNPq
         mRGoLOsVYyUWSaMJBF/nt2TBHN3VpjaVpYzVMd/irriDe2JagjuuLvj+oG3khQb1KlV4
         cX9ktZn7ZZ+q5HzTQRVO/ZZW2Z/5cOM7LUcsmyzEa9NwTvqa4Kw9zioxaLlYq15FRwL3
         NeUQ==
X-Gm-Message-State: AOJu0YwiFElLg6jlMcEVQsYgSlzOBlw2bdL+jE27ygGKEUQi5audyUqb
	cWYLLzPrJJEbTJGH2yhds7EKXYrZwxesxjrcFfRTd7Jk3ItZSboYM9ztlw==
X-Google-Smtp-Source: AGHT+IHx8T/bh0+URP+QGniO8cp/ei7wx+5dDWfqjBQz4Hqg6uZTjSu7pleLSaZVT/B2pSCt9fg4eg==
X-Received: by 2002:a05:6512:6d5:b0:51f:6ab6:9e5b with SMTP id u21-20020a05651206d500b0051f6ab69e5bmr11075796lff.36.1714990543163;
        Mon, 06 May 2024 03:15:43 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 15/15] xen/README: add compiler and binutils versions for RISC-V64
Date: Mon,  6 May 2024 12:15:24 +0200
Message-ID: <0a110c3f0d31c86147797c4d41c2d63a32127e04.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch doesn't represent a strict lower bound for GCC and
GNU Binutils; rather, these versions are specifically employed by
the Xen RISC-V container and are anticipated to undergo continuous
testing. Older GCC and GNU Binutils would work,
but this is not a guarantee.

While it is feasible to utilize Clang, it's important to note that,
currently, there is no Xen RISC-V CI job in place to verify the
seamless functioning of the build with Clang.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5-V9:
 - Nothing changed. Only rebase.
---
 Changes in V6:
  - update the message in README.
---
 Changes in V5:
  - update the commit message and README file with additional explanation about GCC and
    GNU Binutils version. Additionally, it was added information about Clang.
---
 Changes in V4:
  - Update version of GCC (12.2) and GNU Binutils (2.39) to the version
    which are in Xen's contrainter for RISC-V
---
 Changes in V3:
  - new patch
---
 README | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/README b/README
index c8a108449e..30da5ff9c0 100644
--- a/README
+++ b/README
@@ -48,6 +48,10 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
+          Older GCC and GNU Binutils would work, but this is not a guarantee.
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.45.0


