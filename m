Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4271868DC0B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491191.760240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFT-0005j3-Pm; Tue, 07 Feb 2023 14:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491191.760240; Tue, 07 Feb 2023 14:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFT-0005fy-L7; Tue, 07 Feb 2023 14:47:07 +0000
Received: by outflank-mailman (input) for mailman id 491191;
 Tue, 07 Feb 2023 14:47:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFS-0004Hz-2b
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:47:06 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 494ab1a0-a6f6-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 15:47:04 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id k13so6389521wrh.8
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:47:04 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:47:03 -0800 (PST)
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
X-Inumbo-ID: 494ab1a0-a6f6-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IWBP/c/EbKTMCf14sIBroBxkMgK54lnL7TJ/513lNY=;
        b=CtviIgm8AaS4DYuEaApnP1r3gcW3M7UdSzlg9Q8u22X7wARj1QHliZmPoWwPQBWUO9
         vPkMQEGLIexFkjROpkIW3suirI7ZM+I5MLqSJhbDcNC01ycS3C8hGcRPyl3U/7WJO7wm
         UNj8U2r1FqMQ4GYkEWBXE7EvhkqlTQi6RlUxyAQMATafxQ8l4ssVag5UyjRHaw61bUwz
         LaYP66gtOP5OgdadX9savLvQRuh2U01jU3H65rDS33CB1mDR7fuqtGZyjcxuI8hCb8rj
         FvssQZg0fJdrxK9cPLJFXY2zH4yYX89JYjKfiVNieLE25TDtPPuOQitgT3YVRCz+sJi2
         aZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IWBP/c/EbKTMCf14sIBroBxkMgK54lnL7TJ/513lNY=;
        b=rWnKtPSJTghKtCqutKdR53ErSu4S0KMLvysYQS4is8Ltjp0Ylwp/YdaLCI5n8f35sh
         mUD/NA7mJ24FGybW7e1Cd0o1Vzzxdu2gqjZhVQ8n472hPwT4znxp90RYtjSjZbp0E0+m
         xnXNyoIQqz1NYaPqGhBMoDaE736MatXmIhIuocHDcyR4hV0Tu3XM92VocZgJA5IfC1NI
         2cJCpszIWy4MEcvuU54VirxR8smDnvgC/nkMUOSRpHKQuioqmSRkGU+fzSAW3oi8l7L/
         C/v6KA91kB9HdoauPi+4w8+cJPGrXHo5050nfaXOwIweDiRFH/u55U8MEGuZguu0h8Rl
         e88w==
X-Gm-Message-State: AO0yUKWb4bip0RD6TktYZbGsIwjGztPS6a3FybDqf2+I6rjRUwocXCyz
	3TgwW7v97NMIDj9NI7xhPaymbzCdlo4=
X-Google-Smtp-Source: AK7set9YiHlqT9aQFOz4wGaj3dmu1SfoPfk/N58GChYLcYQNCgxnYBdDubbZaXWJsg1DXIv6Cv7oSg==
X-Received: by 2002:adf:f212:0:b0:2c3:f021:da5c with SMTP id p18-20020adff212000000b002c3f021da5cmr2976082wro.29.1675781223513;
        Tue, 07 Feb 2023 06:47:03 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 06/14] xen/riscv: introduce empty <asm/cache.h>
Date: Tue,  7 Feb 2023 16:46:41 +0200
Message-Id: <426a20fc179d642f5fb300e528de6f3835f6975a.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To include <xen/lib.h> <asm/cache.h> is required

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V3:
  - Add Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V2:
  - <asm/cache.h> is a new empty header which is required to include
    <xen/lib.h>
---
 xen/arch/riscv/include/asm/cache.h | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cache.h

diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
new file mode 100644
index 0000000000..69573eb051
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_RISCV_CACHE_H
+#define _ASM_RISCV_CACHE_H
+
+#endif /* _ASM_RISCV_CACHE_H */
-- 
2.39.0


