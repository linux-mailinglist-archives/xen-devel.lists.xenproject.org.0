Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 522C9660109
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:15:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472543.732816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYX-0003nF-AA; Fri, 06 Jan 2023 13:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472543.732816; Fri, 06 Jan 2023 13:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYX-0003kH-6i; Fri, 06 Jan 2023 13:14:45 +0000
Received: by outflank-mailman (input) for mailman id 472543;
 Fri, 06 Jan 2023 13:14:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRQJ=5D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDmYV-0002z5-E9
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:14:43 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 154670af-8dc4-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 14:14:42 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id cf42so1913857lfb.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 05:14:42 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b004b7033da2d7sm150221lfv.128.2023.01.06.05.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:14:42 -0800 (PST)
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
X-Inumbo-ID: 154670af-8dc4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNxlUh9Ka9jPjJlnMEMMefixCKNIhgCiXW1ZWCXQV/k=;
        b=Cmp2WrBPADxtPoiKL4ZCWZjbwolz9CwJgGbJPD1rMDDiI4pZKxyKs8tIFpSVx7xZph
         Zcr/Wt6lvg3FkgxLGPbYrF4RjLh+MGPOl10al8e9P5VIfsaWmG7qfqwCr0gDRlmbkAfz
         CO6Ru90aBDKMmqCyBvUnfKTZ59ad/qLzNaERvfFpq6tS0plPuFGbhtSTcZgJkNcphG7/
         lPwDSreK1qoe1UVY5EEgEN8gA9fHaUCF8UDtd1r6OC2Dyo1tcmf6wdE+qUhpO9dKCZ/u
         AR6XI3Uh00paOLb9LVgKW81uqYPOwtEkeq9LK9r8uTmgKaMjbvQUwNO/eMCW375itLxT
         /Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNxlUh9Ka9jPjJlnMEMMefixCKNIhgCiXW1ZWCXQV/k=;
        b=ujdg131bgkDNS3qAHK/yHdeARCfT6Gj+cHjplIlO4XNknz8yGVkhbyBx3HluqPEz1T
         /RJmQCwgxUVUDUZnYNwX0JW53//D1T/2E7QDUyDdU58ktV3XSrokah9aVxM19fxiq1rB
         uWCXBLK19ZmHoAs8V0zaxMfgpucQnkR6zBTgTFTt3XTh87d5cHnMrN1pYyuoQd5Okaap
         U4aQGT14qXm8yayUpL2kYv/b8LLT79qT7uYKfSOHwntgqzoR+OQr2j2CHN/ikZIHnDCy
         6b/HMN+P2Tev0od2jf60jAGIS8aIe7uQvBiQmNgU+PXK4YkvcY6lAxoWlQ/FendQiOh1
         B8Qw==
X-Gm-Message-State: AFqh2kpRjTK+rKIz6o+3fwT73Gd5hIN9KMZWW2jQhsyZHkEQepBrLSj4
	fu73Q2D9zyY9feCAmQ5OiKWGp5c9exjV3cpW
X-Google-Smtp-Source: AMrXdXvor3i3sFq+rVboLeo1F3I7ZDy57MwxwjjT77+SwrslgXm0lEQNqBGQktwp9LJBw0V3e91aUw==
X-Received: by 2002:ac2:4f13:0:b0:4b5:5da1:4bcb with SMTP id k19-20020ac24f13000000b004b55da14bcbmr20144859lfr.13.1673010882425;
        Fri, 06 Jan 2023 05:14:42 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 3/8] xen/riscv: introduce stack stuff
Date: Fri,  6 Jan 2023 15:14:24 +0200
Message-Id: <e8f65c43d20ebdaba61738200360b14152531321.1673009740.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673009740.git.oleksii.kurochko@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces and sets up a stack in order to go to C environment

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile       | 1 +
 xen/arch/riscv/riscv64/head.S | 8 +++++++-
 xen/arch/riscv/setup.c        | 6 ++++++
 3 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/setup.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 248f2cbb3e..5a67a3f493 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_RISCV_64) += riscv64/
+obj-y += setup.o
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 990edb70a0..ddc7104701 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,4 +1,10 @@
         .section .text.header, "ax", %progbits
 
 ENTRY(start)
-        j  start
+        la      sp, cpu0_boot_stack
+        li      t0, PAGE_SIZE
+        add     sp, sp, t0
+
+_start_hang:
+        wfi
+        j  _start_hang
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
new file mode 100644
index 0000000000..2c7dca1daa
--- /dev/null
+++ b/xen/arch/riscv/setup.c
@@ -0,0 +1,6 @@
+#include <xen/init.h>
+#include <xen/compile.h>
+
+/* Xen stack for bringing up the first CPU. */
+unsigned char __initdata cpu0_boot_stack[PAGE_SIZE]
+    __aligned(PAGE_SIZE);
-- 
2.38.1


