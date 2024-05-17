Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 170378C8799
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724193.1129478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3S-00057y-8g; Fri, 17 May 2024 13:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724193.1129478; Fri, 17 May 2024 13:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3R-0004x6-T9; Fri, 17 May 2024 13:55:25 +0000
Received: by outflank-mailman (input) for mailman id 724193;
 Fri, 17 May 2024 13:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7y3N-0001cB-W4
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:55:22 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19807cb0-1455-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 15:55:20 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a5a88339780so485649266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:55:20 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm1117456466b.113.2024.05.17.06.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:55:19 -0700 (PDT)
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
X-Inumbo-ID: 19807cb0-1455-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715954120; x=1716558920; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXA5k6NQLwnOQ/WhnpaidF2ChH86fmHaLKiU9LUuBe8=;
        b=Ny2NfuAP0b+VTowOJHcipcbTCVUJ61xXsSivrVxuKUTavxM7ysV4jHVRs6JvvwEKsc
         ME3oLmKCCV75UtBFm4NjtV6h9+N5jGMEvgnVCwsGh9DO5S8gX63bLm946V9c7dcfelOQ
         0ZX27WqdANfuyLHp04z9dQy+bxGjoh3Fo9gXkfpH/eG/5M9fPo/F07wu7gTir07AAHxA
         rhyIFp5eoufHyjQAjTlUNThUWUtRA57Ycd06GLphJx2ntp67tRNBiiYsm7Uj5crCieUy
         8XpeQNvb+wA/3eG76IHWMw68lt6DBbRiE7ePeBu61B8lE2TM4nb1dfmwBvOd2ntXIHPy
         d6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954120; x=1716558920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXA5k6NQLwnOQ/WhnpaidF2ChH86fmHaLKiU9LUuBe8=;
        b=l6f8XEMRO231x/Nfy2L66O1lRLFYO8W3C5i5hY/7j1znlIiXJnLBWU5kgohlrBB8Js
         DOER3eJJ5iVNQ2uMpIwKGdPW0x5OjVXFgyQTDVp6x0zcNidvW95O+HlJNBdm6haOD+Kz
         3BcM1pony+aB52+uxz4sKsNrhbKLWR9faZWh7GIKKdVOmvDWdZNbNsVucZvnd9DIkkK3
         QLZ3ZNxCNzWwkT7g09ArdfKqhrT9QpYXkxtUlkESRkuU7IsBlOGv2G21AyLG9y9aaaMd
         tKPXQeTMsHjJWBUlMtFAJI8qvR+4GiE/y5k74BoIQOvFpOb90eEpmkGPjZ73uwK43Xwj
         1b4w==
X-Gm-Message-State: AOJu0Yx5Xu9wpOKCbWchFQf5MIfpFDHvMH5g/LnLlxq/EeK6Bd4On/ZR
	EYlFSNtNCCdzx+Zn48+Hm+PqG4aRV02XRXcp+6QKNpGrit8MFdckagHUPnp7
X-Google-Smtp-Source: AGHT+IFlHn4riCAoAVLptslFcHSUF8D7d/Mhu9kIX5sx5rf7ZnlKWhXQQk9IqqGNWbsXrS264cWyuw==
X-Received: by 2002:a17:906:57cf:b0:a59:c963:82b with SMTP id a640c23a62f3a-a5a2d5cffe2mr1330690966b.33.1715954119886;
        Fri, 17 May 2024 06:55:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 14/14] xen/README: add compiler and binutils versions for RISC-V64
Date: Fri, 17 May 2024 15:55:03 +0200
Message-ID: <e5f2bd44fa1c516ccce22d89053192f85301095e.1715952103.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715952103.git.oleksii.kurochko@gmail.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
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
Changes in V5-V10:
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


