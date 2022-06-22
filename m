Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0721B55438E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 09:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353510.580444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3uio-0002Mw-0F; Wed, 22 Jun 2022 07:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353510.580444; Wed, 22 Jun 2022 07:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3uin-0002K6-TO; Wed, 22 Jun 2022 07:24:17 +0000
Received: by outflank-mailman (input) for mailman id 353510;
 Wed, 22 Jun 2022 07:24:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OJu0=W5=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1o3uim-0002K0-Iy
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 07:24:16 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 521184bd-f1fc-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 09:24:15 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 i81-20020a1c3b54000000b0039c76434147so10518647wma.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 00:24:15 -0700 (PDT)
Received: from localhost.localdomain ([91.219.254.75])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a7bc31a000000b00397623ff335sm20549059wmj.10.2022.06.22.00.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 00:24:13 -0700 (PDT)
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
X-Inumbo-ID: 521184bd-f1fc-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBC3vy2Dl55klC9bIEsto3pkIg2TsVYPIBOXZj2Bf9Q=;
        b=Ox4VR8a79ghIIO1n1nSPw5Mbk9cUVc5/gKojikMN6+9ugNvJ0XhGY0PHznM+HdS/n/
         1/wg4DzP+eV0RI2l9WhQqFnsTyGxnY96cGTmkM4fzGBhg3+3Bw6Y07Dz1qWRp4D9wu4y
         CXUen9vbUx0gHzkSnILaCBRI/ZYpdzfE8mXfX1eb/FbXCWeAoTBfN9i3eljN20Olo+t0
         ZYY9zSAS3t3O9WYeWRJFUOQfSkRyf6n+Se83VVxX9qpXrtJjxEy6Vn/ey86n9vTACg6M
         aPNNjFXb2VnLjv1j/PSHt8hkb9FG35ujqelqeNprevA/2IoiHwplkVOI+58ti+OYbXwC
         dN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBC3vy2Dl55klC9bIEsto3pkIg2TsVYPIBOXZj2Bf9Q=;
        b=dUj8mCS3mS8b11eYPi1E/pPZGU4NmOoD/wqN0cpXG6LeHyqBzEN3lm3JyQiHka45n4
         QuSCczZ9CZCtbkgjbzgAzSMo1nxyysNYz7OEK6IEHkXRrvZd85f11ZuIEEh/TdDyrQ9Y
         UZ5cxl7tLx2VKcAPCotueALMOq2CLqyVl2NHkEU44+fHWt2zdEKN0AJd4FKUOQTVESVk
         74zjkYzTTCV0YLdlxRntS96R4ocrsyW3qg4LvWvVz3ybtQbFG0MsU8e9iGSvaxrBKzOg
         Lfufn7ORLC+/a05mdSZZOVeGaE0t0vkB3tAud7sjcZpvcFcT0j4szv2ejs+BCb9fgvfz
         ZKdg==
X-Gm-Message-State: AJIora9bjGGdVfa985xZw8u8v/tPsmKnvGRdhszT+MK6ncK5Q5EwPQKZ
	nw1rYKj0XRLLq7EB6sj+qEYvxbwFIA8PMQ==
X-Google-Smtp-Source: AGRyM1tsPosM+3pdrvGa63BVwoDhTMKBekdBg1ykUpi8hLhvo9OLQPNLFP9jub9dKkJ0i7g1D+nt+w==
X-Received: by 2002:a05:600c:a182:b0:39e:f33a:a990 with SMTP id id2-20020a05600ca18200b0039ef33aa990mr2235694wmb.59.1655882654411;
        Wed, 22 Jun 2022 00:24:14 -0700 (PDT)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen: arm: Spin-up cpu instead PSCI CPU OFF
Date: Wed, 22 Jun 2022 10:24:10 +0300
Message-Id: <20220622072410.87346-1-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmytro Semenets <dmytro_semenets@epam.com>

Use spin-up cpu with disabled interrupts instead PSCI CPU OFF
halt and reboot procedures. Some platforms can't stop CPU via PSCI
because Thrusted OS can't migrate execution to other CPU.

Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 xen/arch/arm/shutdown.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
index 3dc6819d56..a9aea19e8e 100644
--- a/xen/arch/arm/shutdown.c
+++ b/xen/arch/arm/shutdown.c
@@ -8,7 +8,12 @@
 
 static void noreturn halt_this_cpu(void *arg)
 {
-    stop_cpu();
+    local_irq_disable();
+    /* Make sure the write happens before we sleep forever */
+    dsb(sy);
+    isb();
+    while ( 1 )
+        wfi();
 }
 
 void machine_halt(void)
-- 
2.25.1


