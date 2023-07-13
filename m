Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94349751D3E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 11:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563051.879981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJseR-0005YL-T2; Thu, 13 Jul 2023 09:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563051.879981; Thu, 13 Jul 2023 09:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJseR-0005W1-Pa; Thu, 13 Jul 2023 09:30:19 +0000
Received: by outflank-mailman (input) for mailman id 563051;
 Thu, 13 Jul 2023 09:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=In0U=C7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qJseP-0005Vv-PC
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 09:30:17 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e007fea9-215f-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 11:30:16 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so880364e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 02:30:16 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 c17-20020a197611000000b004f864690901sm1039696lff.244.2023.07.13.02.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 02:30:14 -0700 (PDT)
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
X-Inumbo-ID: e007fea9-215f-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689240615; x=1691832615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCC3wHLU3EhDpG5xS20qPZ7FesJRYrMeuCZoxrc5oGE=;
        b=Ru8vtgVY6iVKv0/4OvN+UGyrxTtBSVCm0rlbx4F5kDxPuE/3m324cLjQSHFthQb3WQ
         dWUU0zQI2E1q8XsfUeHowftAbGwTZ2JNgG62VwUr73r4zrbNf5qvMc9puC8LW4RBZ0Ss
         hXKYQcptCXW7jJ+CFl+HpcyKo2ULAi0QSjtw3iDwWDBAKRb3pmC6m2LPoINvBup6Zwum
         rmVg5VF6AapRXF7AQM1Iu/GbVIilstx3Ln4sMBsptJUiN+kYUAdO5Sw+5KlsHafD1tDU
         FkP9+R5SY5x5+gRWsbo5XZwJMFzpYGv1GOTp1kw22Rjc7sT8mzQBnz8T4ZrRstdx9tPe
         CKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689240615; x=1691832615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCC3wHLU3EhDpG5xS20qPZ7FesJRYrMeuCZoxrc5oGE=;
        b=QaGDza7Wr/hOptnw14mMv3z+n9qkJwV3IdKgLjGHzvN2ILvpcOtnEAZ8hQSnbRsqAG
         rvEOMGogcUK+JI9HC1OBrKFGJfphTcskf7Emq3HrBLAJETyuHmuaSQAW3Z2X9zSIxP0m
         /R4ZrtVYmPpK9WvQZO73Twumydc+Rr/EqBd2hrs70B2bjZXKkF1siz3dwVVvcBUhy8Hw
         0attmWlOsdMllfyiLzd978beJ4740rk849CxFhsnUYhqjZzk2sc2KevnJSyxCops/Kwy
         NOzI04HAuFBKhL3xtG0wk7aQqh7frNpl7iHDVHLLy4YEhqqLGtDRKDtA+dngRXMy1VbD
         Esbg==
X-Gm-Message-State: ABy/qLY5mwboczOdHj6Dqc/zbthHA6fQbz2hprQq6ecevZgY22uQj/D/
	sUNixcq/4ApyPAPH8EOKMG5t5SQqjEQ=
X-Google-Smtp-Source: APBJJlFsEFHRqsywd1UY+1d0ySwez1HIHeawwZQzmlP3UKz0KFqlZWhH9EUXTmw/d5MXOvnXoJtW6w==
X-Received: by 2002:a05:6512:31d4:b0:4fb:99c7:bb60 with SMTP id j20-20020a05651231d400b004fb99c7bb60mr856491lfe.59.1689240614889;
        Thu, 13 Jul 2023 02:30:14 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] ns1650: refactor interrupt handling in ns16550_uart_dt_init()
Date: Thu, 13 Jul 2023 12:30:11 +0300
Message-ID: <cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ns16550_init_postirq() there is the following check:
    if ( uart->irq > 0 )
    {
        uart->irqaction.handler = ns16550_interrupt;
        uart->irqaction.name    = "ns16550";
        uart->irqaction.dev_id  = port;
        if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
            printk("ERROR: Failed to allocate ns16550 IRQ %d\n", uart->irq);
    }

Thereby to have ns16550 work in polling mode uart->irq, should be equal to 0.

So it is needed to relax the following check in ns16550_uart_dt_init():
    res = platform_get_irq(dev, 0);
    if ( ! res )
        return -EINVAL;
    uart->irq = res;
If 'res' equals to -1 then polling mode should be used instead of return
-EINVAL.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/drivers/char/ns16550.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 2aed6ec707..f30f10d175 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1791,8 +1791,16 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     }
 
     res = platform_get_irq(dev, 0);
-    if ( ! res )
-        return -EINVAL;
+    if ( res == -1 )
+    {
+        printk("ns1650: polling will be used\n");
+        /*
+         * There is the check 'if ( uart->irq > 0 )' in ns16550_init_postirq().
+         * If the check is true then interrupt mode will be used otherwise
+         * ( when irq = 0 )polling.
+         */
+        res = 0;
+    }
     uart->irq = res;
 
     uart->dw_usr_bsy = dt_device_is_compatible(dev, "snps,dw-apb-uart");
-- 
2.41.0


