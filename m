Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3565887BE
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 09:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379581.613138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ8WD-0007cI-H5; Wed, 03 Aug 2022 07:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379581.613138; Wed, 03 Aug 2022 07:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ8WD-0007a0-DW; Wed, 03 Aug 2022 07:10:13 +0000
Received: by outflank-mailman (input) for mailman id 379581;
 Wed, 03 Aug 2022 07:10:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wdm4=YH=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJ8WC-0007Zu-R8
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 07:10:12 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 504bb1ad-12fb-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 09:10:11 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id z17so15718815wrq.4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Aug 2022 00:10:11 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:672a:649e:8093:e1b])
 by smtp.googlemail.com with ESMTPSA id
 n2-20020a5d51c2000000b0021badf3cb26sm20230927wrv.63.2022.08.03.00.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 00:10:09 -0700 (PDT)
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
X-Inumbo-ID: 504bb1ad-12fb-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=qS8bZlbVxGt/mmqk+wWqK+vxxaS+JiUFxSSOzE+FGp8=;
        b=o1jNh5gg32h9Xw/g2dRdjzOEc3K/qSI0oKUUlprgvp5IVoCvfrNZAnJengtXNd2IT+
         27qqSDPTH5r2YKNOnITUcKXj2HuwtYG/Kv7fgqfdHuzrv/HNd0c44ZiWw3G5XBKPY1is
         DNEdcAzfoR4sus0xAqzwas4lJ/aY66/l0cR2jocpFldQivYIKyXtgITqnnjZzEjC4sGr
         id6GQX8qBvxS4u0JxykmM3L7N3qFhRyAblIPdP8erV5TcdluFImZKwrNUwd2IAlmTwLz
         mxSw3lqfirPXLqML1hoEzCtoJ0CjW0+QugXaIJFi6qJ4RGvFltXNTLIXlb949BEnAoxU
         WsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=qS8bZlbVxGt/mmqk+wWqK+vxxaS+JiUFxSSOzE+FGp8=;
        b=65H/3g2FHK21rX0GHU2UCRdjlYG6hBcxuJEr2MDSuHFQLPs8TnU/bk1dEGVMK6sLdz
         8wPkHMFdf1qaHAtyaaYPRrOvVBUau2yxIBI4BIG75Vxw0npoI8ZWH0JmeRy+wjsP2lhZ
         AohaFtL4cL7M6hqskS+T+xlOBl4VjMZHe5Y8aQR03j+T+rGgL/2dVpO/nrBd/dqQUPNI
         iK4l+l7oMmKOGrj5df7bLZFO3ivS3ogRTycKyfyoweo1oKC3+ezATSqxEypVKBb5QKMd
         mfaGI8OoNtmwGT8P1EIfD0HuqAfqceR9ZOQ2uE0Q+WnOwqpMtfjvaI2m5ugZiRIpPfou
         A6UA==
X-Gm-Message-State: ACgBeo3yiBRC2PjYR6IRmM7g/23Vag7q4cd8SctE/2UMmY6D+GF3lWnD
	gtsZqU1XloZBdIsZ9fZp9n1VtmtDGag=
X-Google-Smtp-Source: AA6agR4hCReDL3EOLBTGtp3bpX4Y01jyH8nLIcC0hNLUYUAwLc/3nwdEV9wY8ZpA9idyQfBxOrDyqA==
X-Received: by 2002:a05:6000:1b85:b0:21f:93d:a23d with SMTP id r5-20020a0560001b8500b0021f093da23dmr15080934wru.286.1659510610489;
        Wed, 03 Aug 2022 00:10:10 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/char: mvebu-uart: Fix MISRA C 2012 Rule 20.7 violation
Date: Wed,  3 Aug 2022 10:09:58 +0300
Message-Id: <20220803070958.1752256-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro parameters 'off' and 'uart' are used as expressions and it is
good to be enclosed in parentheses to prevent against unintended expansion.

For the 'uart' case, in mvebu3700_write(), correct the second parentheses
that seems to have been accidently misplaced.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/drivers/char/mvebu-uart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/mvebu-uart.c b/xen/drivers/char/mvebu-uart.c
index 835d1ace3c..a00618b96f 100644
--- a/xen/drivers/char/mvebu-uart.c
+++ b/xen/drivers/char/mvebu-uart.c
@@ -64,8 +64,8 @@ static struct mvebu3700_uart {
     struct vuart_info vuart;
 } mvebu3700_com = {0};
 
-#define mvebu3700_read(uart, off)           readl((uart)->regs + off)
-#define mvebu3700_write(uart, off, val)     writel(val, (uart->regs) + off)
+#define mvebu3700_read(uart, off)           readl((uart)->regs + (off))
+#define mvebu3700_write(uart, off, val)     writel(val, (uart)->regs + (off))
 
 static void mvebu3700_uart_interrupt(int irq, void *data,
                                      struct cpu_user_regs *regs)
-- 
2.34.1


