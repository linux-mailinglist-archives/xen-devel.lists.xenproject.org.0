Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA40A7084C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926815.1329649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8D6-0000T5-Ca; Tue, 25 Mar 2025 17:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926815.1329649; Tue, 25 Mar 2025 17:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8D6-0000RG-7A; Tue, 25 Mar 2025 17:37:08 +0000
Received: by outflank-mailman (input) for mailman id 926815;
 Tue, 25 Mar 2025 17:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogJ6=WM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tx8D4-0000Qx-8u
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:37:06 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4a6873d-099f-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 18:37:05 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab771575040so11426666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 10:37:05 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb65871sm897012066b.96.2025.03.25.10.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 10:37:03 -0700 (PDT)
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
X-Inumbo-ID: c4a6873d-099f-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742924224; x=1743529024; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gOQ8U3cpa7RAOGnJUwoO2nwCYBfxpYAKHyGklE8Ip4=;
        b=aLiWBSLnrsHISMhIq0osqsP7U6f8A5Cmf/Ady0QGf25GRa6e9oF7zEmoEbZzoBRRza
         sjTkBLaWCFdDA5mgGdHNvUxswEXrE1K36PglrcHFK2KxPZHKMRG3HW7HPThAijrwkPR4
         RoeNiiXq3e7pxt5zbP4nODUb5ej5uyo3cwBP2kXEXg35eoQCV5RkqBepDwrwSydzt9bt
         8WQdY1YjLEneWrkMLqEzc63oLwR5LVbWWcHoK1FrFTrVWg0F3gk3PS+1IdHCstnk9UH3
         Pfv9MUblV1o3OpdQCIdtpJQvxfYoK14sfBF33WsgYwdhoer1wEunrgVKilspYbHcRRu1
         JYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742924224; x=1743529024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gOQ8U3cpa7RAOGnJUwoO2nwCYBfxpYAKHyGklE8Ip4=;
        b=sBswTeHSjwotxKfticvhBN+9OchwV1TVlWrIXpgW73qsE9G7qm+9/BL7XHnzVrM4f/
         nfM012ClmvK/GML+/Qn4xFWBRUgaUWCNd8cDnfjr1QPI8n0kqqZ/diiA61d1q7Yp+Wbw
         bFTTkV+ESqXaqf2trqg3xPmxXoX6GOfen9mgThhT0lfA6rZBsUqR9K4PRYjj09cHVj0W
         +ZGmtI8Lf5x/qpY8kgtn/t6l6xc6pPDeY+MSAKolPdo+HySoTCggNY5wR9oaK1sTE0XB
         HgUlugHb6vIMWGj82hKNOPwubx06CMRA2j8dTT+brOBaX1YKirRb+iv23MRd+hyim3rr
         guFw==
X-Gm-Message-State: AOJu0YwTAS7gGAt0ToiS6GNbL2hGsq9w2TmV2WWfa1wl9iT4S1SbeaQL
	JH7oWRGU9vfww+xXtLMh1/SBpS/8g/7gWqlkUN9MMTHkeKyYWcrwLSxYXA==
X-Gm-Gg: ASbGncsEqlas/zX8pf83KkIS7u9mL6k6msDwQr3/DObNcn/VQG+u6tgno8Ai3pb7EDb
	9LJoYyN2Gf37SYn48+yGK+ws6mas8HYmhgR49r1jW/vR7u8N+3RrWd3jx7rqOe6gjymS4vGxIhK
	CmG0sSXx0RhbklfzUvUBU0j7iUAgcV0ISJFM4jbVcW2Og6D3l5lRPHmZjz+MQP3J+JNt+97SO5h
	JpQBnjxB0dKlghg1gtV8Xf9I/ma1HQdZyqCCjXDHRdvlPE8HrEefQMU6ONS5uYIx0HnswiCgBbO
	Cqr6VVnsWkp8WnVdVVEgWSGUnhz14f3xK1NxicvyNGSuxMWBbwK6IzoQ+WqyulXZ0CM789nLPHl
	FtqIsC0Nj/BKDBQ==
X-Google-Smtp-Source: AGHT+IGSNMLfyWyHsdvuXtC0d/YEBZrwaj+iwhePtkAh3ElgyY76m3+nDlVpHDJic/oA99k50+JABg==
X-Received: by 2002:a17:907:724a:b0:ac6:b80b:2331 with SMTP id a640c23a62f3a-ac6e08f984cmr59383866b.4.1742924224234;
        Tue, 25 Mar 2025 10:37:04 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/4] automation: select APLIC and IMSIC to handle both wired interrupts and MSIs
Date: Tue, 25 Mar 2025 18:36:58 +0100
Message-ID: <f809b23b55c073997feac22665abb66a83633faa.1742918184.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default, the `aia` option is set to "none" which selects the SiFive PLIC for
handling wired interrupts. However, since PLIC is now considered obsolete and
will not be supported by Xen now, APLIC and IMSIC are selected instead to manage
both wired interrupts and MSIs.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---

Tests results:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1734636979

Based on the source code of Qemu the support of AIA should be present from 7.0.0:
   28d8c281200f ("hw/riscv: virt: Add optional AIA IMSIC support to virt machine")

```
$ git tag --contains 28d8c281200f20a060c456c81fd1564f3d119fda
staging-mjt-test
trivial-patches-pull-request
v7.0.0
v7.0.0-rc0
v7.0.0-rc1
v7.0.0-rc2
v7.0.0-rc3
v7.0.0-rc4
v7.1.0
...
```

And in Xen's GitLab CI it is used 7.2.11:
```
$ CONTAINER_NO_PULL=1 CONTAINER=bookworm-riscv64 ./automation/scripts/containerize 
*** Launching container ...   
user@6a1d1f0077fe:/build$ qemu-system-riscv64 --version
QEMU emulator version 7.2.11 (Debian 1:7.2+dfsg-7+deb12u6)
Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
```

---
Changes in v2:
 - Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 automation/scripts/qemu-smoke-riscv64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index 8f755d0a6a..b2e112c942 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -6,7 +6,7 @@ set -ex -o pipefail
 rm -f smoke.serial
 
 export TEST_CMD="qemu-system-riscv64 \
-    -M virt \
+    -M virt,aia=aplic-imsic \
     -smp 1 \
     -nographic \
     -m 2g \
-- 
2.48.1


