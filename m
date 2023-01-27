Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4514967E7A1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:00:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485598.753004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGn-0003Jk-H1; Fri, 27 Jan 2023 13:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485598.753004; Fri, 27 Jan 2023 13:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGn-00035s-5G; Fri, 27 Jan 2023 13:59:57 +0000
Received: by outflank-mailman (input) for mailman id 485598;
 Fri, 27 Jan 2023 13:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGl-00023y-Ms
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:55 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfdbb369-9e4a-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 14:59:54 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id n7so5062849wrx.5
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:54 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:53 -0800 (PST)
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
X-Inumbo-ID: dfdbb369-9e4a-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dWUYXcXNDY01C5vnUaSRzj9YFbcSmtm26QVe941wX4=;
        b=VfgsX33JS/Ryp8A+2gA7P+XJCn2VbHxyPSMmBDr99GxXfiZcKmCCVl6ZUkXxMMP8v1
         6QcuO4fLyohJOa2J3pbngTEuZ1UM1hPL+f0rezp7y3biIeUFCt/3ELu66jiFj2abe31z
         enBGQ27S2XVVBFD6Y8JAzkds59FLafHKmJDEgSnDfjDOZ3JGjsJzoIw+nu98QPEUHP1o
         Y3lVzr4EMhztWFxiYbLdQPVBQQcj9o4dgWc+YRr8JPNWa30zLaHzW3kDRleUy5RqDCuM
         vNsQ3M4q2vyzPXSNm10moxZCM2q791I8WWy70BK4HhLQz4u2EC2SwRWmV79HuL6EHz95
         Gm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dWUYXcXNDY01C5vnUaSRzj9YFbcSmtm26QVe941wX4=;
        b=K9TuBK63MKQxJIKyg//gmHNsG25xSYvTFa6WBAyp3n/FGtI8Udq/n5dzWamcUoGWS7
         3033PEvG54T8RsgUMaNv2IxncH7gF36S+LEN3l5KQobot9NqzFAPzvB5qyysvAHEmhS2
         U5K5OlqgaJXy5e74Lu20YabBFSZgDPU2JhzPPQpB/g02N38pobFeRy/WfmSNB/bXL7R+
         gT5WbT13gUEgXIZBMPmh1WomQj/tbp6xbgsAByfqIdsPUATYb7HA0fBExU0BEkDVrrrZ
         FXaGiDk/G5PPmCshlpadQppvhRQOL6jtW+Uh0EhKHeltxcWcPleylTDOI0lKxWJAS/Fp
         BF9A==
X-Gm-Message-State: AFqh2kqdeL9eZ4CDUWwiHjNIz1u0dxtfx/n4H0283YVA8TQHOpdR/c7D
	5E74ZsDye255KKW4oRCQGXPQSjVwTJE=
X-Google-Smtp-Source: AMrXdXt1QtJ2KGKtsDoqFSOM+ehkGbzrxhgzkBt4LFVmc5d27mhJczMXjOtfF7qilFgWwDpKXGR9kA==
X-Received: by 2002:a5d:52ce:0:b0:242:82a4:2bf4 with SMTP id r14-20020a5d52ce000000b0024282a42bf4mr27520358wrv.10.1674827993349;
        Fri, 27 Jan 2023 05:59:53 -0800 (PST)
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
Subject: [PATCH v2 10/14] xen/riscv: mask all interrupts
Date: Fri, 27 Jan 2023 15:59:15 +0200
Message-Id: <5ae68ebe2bfb4745c7ecbcac879aebe44a73aeac.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V2:
 - Add Reviewed-by to the commit message
---
 xen/arch/riscv/riscv64/head.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index d444dd8aad..ffd95f9f89 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,6 +1,11 @@
+#include <asm/riscv_encoding.h>
+
         .section .text.header, "ax", %progbits
 
 ENTRY(start)
+        /* Mask all interrupts */
+        csrw    CSR_SIE, zero
+
         la      sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
-- 
2.39.0


