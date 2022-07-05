Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA6567924
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361537.591118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8pgi-0004Nx-Ur; Tue, 05 Jul 2022 21:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361537.591118; Tue, 05 Jul 2022 21:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8pgi-0004Ly-Q6; Tue, 05 Jul 2022 21:02:28 +0000
Received: by outflank-mailman (input) for mailman id 361537;
 Tue, 05 Jul 2022 21:02:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TLZa=XK=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8pgh-0003lq-5Z
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:02:27 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c602b98c-fca5-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 23:02:26 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id bk26so4174893wrb.11
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jul 2022 14:02:26 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 l26-20020a1ced1a000000b003a03ae64f57sm2897401wmh.8.2022.07.05.14.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:02:25 -0700 (PDT)
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
X-Inumbo-ID: c602b98c-fca5-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u5CyUBshkwHYJe1DDZsq4HHBEadXEMKhCxZMzLCqLMY=;
        b=pI2j9/zHI21aJwS6t7AiKATAAuYp1jk4Y+8d8r/utSvmIN7Y63+dzeczux93fegJPl
         0+Qgod/t4+J8ZoxHjjIMsmV9tV0Dswt3i/1sDsp5ywUUdC+kLbdMrDDmDOTEo4rpaSR0
         rCZeElbSpHPi6ekBqc76afDvdrv1Pcq8vekyIp6hnn9mAywGw1Eb+uRoZv8OLZkNFjsR
         X5Qsps539A6OpdMMyjjktnlX2WG4iHg+xZRS6S5DIcLEN1BaIoRNQnh1dHS8/KBcyWm0
         NTAo4PFy259xmcVkq31SaqQ8o1M4czuGxVMlE+rA/IYky+s03cgQ7AM8MU4ylSYQhbNG
         WToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u5CyUBshkwHYJe1DDZsq4HHBEadXEMKhCxZMzLCqLMY=;
        b=s/i3L2EDuiKbPkO8Isg/xO6Q30Z9TIG1Ov4+NZRvYVbMmtxMY1wwGXCbB2ybiKLr8d
         W6LtA+PFx5N2CfD5R+3nTOtHrtKDgTaDsW9VVjFBkT/AyL38adHb1YUzv9OQYsVdnn8A
         +6770YqKzCAct8eUc1O+mMettQk/75HxIax6ssq7JnwzRcJWdJY0yqlYB0yAwN9eqIVa
         fJQ2Q4Kjblg34YHCDBjjneBMEZcoFs/SsGUN0qe7aG31MQQQI81XXizXaHpeA/eWEknm
         DMiFGQsY1kiRUUuO1Ca7iNRbMol+9C11IE4YHQKe5ymoFOJskz+ihY0amA7LSFR7MT4s
         aQrw==
X-Gm-Message-State: AJIora8oMQ8siEXFXYiuJ146lTGDvwhaV8zQ8bflm/0xSysgAFGiB8JI
	xEjN8f/enQVnH7JXvuOJlqnWEQMW0Gw=
X-Google-Smtp-Source: AGRyM1vet7biqpwvDs2fcDYUpJlzinBxtCC41x/DTfpg0WwqZhHmqlBMN/URFYIMTZX8CnXvUU795g==
X-Received: by 2002:a5d:6da8:0:b0:21d:2598:4e28 with SMTP id u8-20020a5d6da8000000b0021d25984e28mr35759389wrs.373.1657054945791;
        Tue, 05 Jul 2022 14:02:25 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Date: Wed,  6 Jul 2022 00:02:17 +0300
Message-Id: <20220705210218.483854-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705210218.483854-1-burzalodowa@gmail.com>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function idle_loop() is referenced only in domain.c.
Change its linkage from external to internal by adding the storage-class
specifier static to its definitions.

Since idle_loop() is referenced only in inline assembly, add the 'used'
attribute to suppress unused-function compiler warning.

Also, this patch resolves indirectly a MISRA C 2012 Rule 8.4 violation warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2f8eaab7b5..2fa67266d0 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -63,7 +63,7 @@ static void do_idle(void)
     rcu_idle_exit(cpu);
 }
 
-void idle_loop(void)
+static __used void idle_loop(void)
 {
     unsigned int cpu = smp_processor_id();
 
-- 
2.34.1


