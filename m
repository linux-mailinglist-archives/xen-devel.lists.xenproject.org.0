Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CD490213
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 07:41:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258002.443815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Lgb-00071W-Bg; Mon, 17 Jan 2022 06:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258002.443815; Mon, 17 Jan 2022 06:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Lgb-0006zf-8c; Mon, 17 Jan 2022 06:40:13 +0000
Received: by outflank-mailman (input) for mailman id 258002;
 Mon, 17 Jan 2022 06:40:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d+jO=SB=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n9LgZ-0006zZ-99
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 06:40:11 +0000
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [2607:f8b0:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ffe58de-7760-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 07:40:09 +0100 (CET)
Received: by mail-pf1-x442.google.com with SMTP id i129so9361834pfe.13
 for <xen-devel@lists.xenproject.org>; Sun, 16 Jan 2022 22:40:09 -0800 (PST)
Received: from localhost.localdomain ([47.89.83.13])
 by smtp.gmail.com with ESMTPSA id x26sm13398899pfh.192.2022.01.16.22.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 22:40:07 -0800 (PST)
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
X-Inumbo-ID: 4ffe58de-7760-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+CpLYOyG0BNntkXDdagzsAj0tl1dyHFJex6jdLEI2F8=;
        b=RTvV/Zx25GJe2+Z+0Ev+V3ZgJs+L/YSFjUJBpm1w9NeBFOcfja4kRqaKDRV7G6Do8H
         cacgL5Th9dSuCsmsnqqdMWy0pmUZuKVUXjWY4eUkSEaJ6uR3q4TkRJSv6GJ7NGJZ2b0m
         VRsDCT8K4jRdTHjJ5XXxQH7etGYT3km0PIqN6BKX9hyG+5L7DxeLYf64PFdZZD+Qr3qy
         31z1zO+bfB1f3zJJ5fUa/MjONqoMb48Vyvbx7Wt6WhdJuxdkIlJBdlbUJwine8v4dKgl
         ucVHbc9Pc+iq9YnGLsL33lzLnZiG9MR2IfI/70mkPnm3h9faL248u0CGvXQOenJOUNDk
         1lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+CpLYOyG0BNntkXDdagzsAj0tl1dyHFJex6jdLEI2F8=;
        b=xhIfF8wlKFBlWrk2J3d+iBaJ6WWeEoQoBnYThSHh9syYWL+0YXtMIFXcMWes3/insU
         7kJ7uspV/wrkPgsOCQwq0eGBr+/Cn0VppEPlzE7DK9+QDobByqXK47r9Ub7KQ3KXEgKn
         D+5U9F3K7STaLUjC4EP8Fp2J8EmwzLhwTNiH2Ws/HlJkiTBw4EKOfES/WbSfxo2NqpKh
         wf9CUeDwcwSVMT/gTRg0SO5SvPpFP/h8Pjo+E6CIHd+FqQy5dJufwdFXsJI2FgiAkt72
         Wtp7ay0+xdIvfXVCdrQzQ+B1Eyy2cliV/fMg1I4YQV3p1pImICAtZLy7bXEKY/Z+kbDm
         ViTQ==
X-Gm-Message-State: AOAM531Hknop0upooSIOXQh+HvfbD3i1PVJkqvmrqWSe9NDJHhTlLQ1z
	x/tTaOe6cUTwuAhNPIKvfNY=
X-Google-Smtp-Source: ABdhPJzU7TfQGg8DTGlLDwSqA78GahWLJpXjLeY+avhq2SMuHYT9NsnME57geaBj2xML2eLyLiEN1w==
X-Received: by 2002:a63:385e:: with SMTP id h30mr17832797pgn.554.1642401607668;
        Sun, 16 Jan 2022 22:40:07 -0800 (PST)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	bertrand.marquis@arm.com,
	xen-devel@lists.xenproject.org
Cc: gengdongjiu1@gmail.com
Subject: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
Date: Mon, 17 Jan 2022 14:40:03 +0800
Message-Id: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out that QEMU has been supporting GICv2 virtualization since
v3.1.0. So remove the dependencies on GICv3. If we want to use GICv3,
we can select the QEMU_LEGACY configuration.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
 xen/arch/arm/platforms/Kconfig | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index c93a6b2756..41e82a42ee 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -13,7 +13,15 @@ config ALL_PLAT
 	automatically select any of the related drivers.
 
 config QEMU
-	bool "QEMU aarch virt machine support"
+	bool "QEMU aarch virt machine support >= v3.1.0"
+	depends on ARM_64
+	select HAS_PL011
+	---help---
+	Enable all the required drivers for QEMU aarch64 virt emulated
+	machine.
+
+config QEMU_LEGACY
+	bool "QEMU aarch virt machine support < v3.1.0"
 	depends on ARM_64
 	select GICV3
 	select HAS_PL011
-- 
2.25.1


